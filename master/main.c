#include <stdio.h>
#include <stdlib.h>
#include <mosquitto.h>
#include <string.h>
#include <unistd.h>
#include <cjson/cJSON.h>

const char* mqtt_server = "broker.emqx.io";
const int mqtt_port = 1883; 
const char* sub_topic = "host/master";
const char* screen_topic = "host/screen";
const char* app_topic = "hub/app";

struct mosquitto* mosq_server;
struct mosquitto* mosq_local;

typedef enum
{
    SCREEN = 0,
    APP
} Sender_t;
Sender_t sender;

void process_message( const char* json_string);
void send_device_to_screen_and_app(char* message);
void send_get_device_request();
int start_service(const char *service_name);

void mqtt_connect() 
{
    int rc = mosquitto_connect(mosq_server, mqtt_server, mqtt_port, 60);
    if (rc != MOSQ_ERR_SUCCESS) 
    {
        fprintf(stderr, "Unable to connect to MQTT Server Broker. Error code: %d\n", rc);
        exit(1);
    }

    rc = mosquitto_connect(mosq_local, "127.0.0.1", 1883, 60);
    if (rc != MOSQ_ERR_SUCCESS) 
    {
        fprintf(stderr, "Unable to connect to MQTT Local Broker. Error code: %d\n", rc);
        exit(1);
    }
}

void on_connect(struct mosquitto *mosq, void *obj, int rc) 
{
    printf("Connected to MQTT Broker with code %d\n", rc);
    mosquitto_subscribe(mosq, NULL, sub_topic, 0);
}

void on_message(struct mosquitto *mosq, void *obj, const struct mosquitto_message *message) 
{
    if(message->payloadlen) 
    {
        printf("<-- %s: %s\n", message->topic, (char *)message->payload);
        char* payload = (char *)message->payload;
        if (strcmp(message->topic, sub_topic) == 0) 
        {
            process_message(payload);
        }
    }
}

int main() 
{    
    mosquitto_lib_init();
    mosq_server = mosquitto_new(NULL, true, NULL);
    mosq_local = mosquitto_new(NULL, true, NULL);

    if (!mosq_server || !mosq_local) 
    {
        fprintf(stderr, "Error: Out of memory.\n");
        return 1;
    }

    mosquitto_connect_callback_set(mosq_server, on_connect);
    mosquitto_message_callback_set(mosq_server, on_message);

    mosquitto_connect_callback_set(mosq_local, on_connect);
    mosquitto_message_callback_set(mosq_local, on_message);

    mqtt_connect();

    mosquitto_loop_start(mosq_server);
    mosquitto_loop_start(mosq_local);

    start_service("screen.service");
    start_service("ble.service");
    start_service("host_wifi.service");
    sleep(4);

    send_get_device_request();
    
    while (1) 
    {

    }

    mosquitto_destroy(mosq_server);
    mosquitto_destroy(mosq_local);
    mosquitto_lib_cleanup();
    return 0;
}

// This function processes both "leds" and "sws" arrays
void process_led_or_sw(cJSON *root, cJSON *array, const char *key) 
{
    cJSON *item = NULL;
    // Iterate through each item in the array (either "leds" or "sws")
    cJSON_ArrayForEach(item, array) {
        cJSON *item_obj = cJSON_CreateObject();  
        cJSON_AddStringToObject(root, "mode", "device_control");  

        // Process the "name" field
        cJSON *name = cJSON_GetObjectItemCaseSensitive(item, "name");
        if (cJSON_IsString(name) && (name->valuestring != NULL)) 
        {
            cJSON_AddStringToObject(item_obj, "name", name->valuestring); 
        }

        // Process the "status" field
        cJSON *status = cJSON_GetObjectItemCaseSensitive(item, "status");
        if (cJSON_IsBool(status)) 
        {
            cJSON_AddBoolToObject(item_obj, "status", status->valueint);  
        }

        // Process the "controller" field
        cJSON *controller = cJSON_GetObjectItemCaseSensitive(item, "controller");
        if (cJSON_IsString(controller) && (controller->valuestring != NULL)) 
        {
            cJSON_AddStringToObject(item_obj, "controller", controller->valuestring);  
        }

        // If processing switches ("sws"), handle the "ep" field (endpoint)
        if (strcmp(key, "sws") == 0) 
        {
            cJSON *ep = cJSON_GetObjectItemCaseSensitive(item, "ep");
            if (cJSON_IsNumber(ep)) 
            {
                cJSON_AddNumberToObject(item_obj, "ep", ep->valueint);  
            }
        }

        // Add the processed item object to the array in the root object
        cJSON *array_obj = cJSON_CreateArray();
        cJSON_AddItemToArray(array_obj, item_obj);  
        cJSON_AddItemToObject(root, key, array_obj);  

        // Create the topic based on the controller value (e.g., "host/ble" or "host/wifi")
        uint8_t topic[30];
        snprintf(topic, sizeof(topic), "host/%s", controller->valuestring);

        // Print the message and send it to the MQTT broker
        uint8_t *message = cJSON_PrintUnformatted(root);  
        mosquitto_publish(mosq_local, NULL, topic, strlen((const char*)message), message, 0, false);
        if (sender == SCREEN)
        {
            mosquitto_publish(mosq_server, NULL, app_topic, strlen((const char*)message), message, 0, false);
            printf("--> %s: %s\n", app_topic, message);  
        }
        else 
        {
            mosquitto_publish(mosq_local, NULL, screen_topic, strlen((const char*)message), message, 0, false);
            printf("--> %s: %s\n", screen_topic, message);  
        }
        printf("--> %s: %s\n\n", topic, message);  

    }
}

void send_device_to_screen_and_app(char* message)
{
    mosquitto_publish(mosq_local, NULL, screen_topic, strlen((const char*)message), message, 0, false);
    printf("--> %s: %s\n", screen_topic, message);

    mosquitto_publish(mosq_server, NULL, app_topic, strlen((const char*)message), message, 0, false);
    printf("--> %s: %s\n", app_topic, message); 
}

void send_get_device_request()
{
    cJSON* root = cJSON_CreateObject();
    cJSON_AddStringToObject(root, "mode", "get_devices");

    uint8_t *message = cJSON_PrintUnformatted(root);  
    mosquitto_publish(mosq_local, NULL, "host/ble", strlen((const char*)message), message, 0, false);
    mosquitto_publish(mosq_local, NULL, "host/zigbee", strlen((const char*)message), message, 0, false);
    mosquitto_publish(mosq_local, NULL, "host/wifi", strlen((const char*)message), message, 0, false);
}
// Main function that processes the JSON message
void process_message(const char *json_string) 
{
    // Parse the incoming JSON string
    cJSON *json = cJSON_Parse(json_string);
    if (json == NULL) 
    {
        printf("Error parsing JSON\n");
        return;
    }

    // Extract the "mode" field from the JSON
    cJSON *mode_obj = cJSON_GetObjectItemCaseSensitive(json, "mode");
    if (!cJSON_IsString(mode_obj) || mode_obj->valuestring == NULL) 
    {
        printf("Invalid JSON format: Missing or invalid 'mode'\n");
        cJSON_Delete(json);
        return;
    }

    // Extract the "sender" field 
    cJSON* sender_obj = cJSON_GetObjectItemCaseSensitive(json, "sender");
    if (!cJSON_IsString(sender_obj) || sender_obj->valuestring == NULL) 
    {
        sender = SCREEN;
    }
    else
    {
        sender = APP;
        printf(" sender is app\n");
    }

    // Only process the message if the mode is "device_control"
    if (strcmp(mode_obj->valuestring, "device_control") == 0) 
    {
        // Process the "leds" array if it exists
        cJSON *leds = cJSON_GetObjectItemCaseSensitive(json, "leds");
        if (cJSON_IsArray(leds)) 
        {
            cJSON *root = cJSON_CreateObject();  
            process_led_or_sw(root, leds, "leds"); 
            cJSON_Delete(root);  
        }

        // Process the "sws" array if it exists
        cJSON *sws = cJSON_GetObjectItemCaseSensitive(json, "sws");
        if (cJSON_IsArray(sws)) 
        {
            cJSON *root = cJSON_CreateObject();  
            process_led_or_sw(root, sws, "sws"); 
            cJSON_Delete(root);  
        }
    }
    else if (strcmp(mode_obj->valuestring, "get_devices_report") == 0)
    {
        send_device_to_screen_and_app(json_string);
    }
    else if (strcmp(mode_obj->valuestring, "get_device") == 0)
    {
        send_get_device_request();
    }

    // Free the memory allocated for the main JSON object
    cJSON_Delete(json);
}


int start_service(const char *service_name) 
{
    int ret;
    char command[256];  // Array to hold the system command string

    // Create the systemctl command to start the service
    snprintf(command, sizeof(command), "sudo systemctl start %s", service_name);

    // Execute the command using system()
    ret = system(command);

    if (ret == -1) {
        perror("system");
        return EXIT_FAILURE;
    }

    printf("Service '%s' started successfully\n", service_name);
    return EXIT_SUCCESS;
}