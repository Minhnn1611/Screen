#include <stdio.h>
#include <stdlib.h>
#include <mosquitto.h>
#include <string.h>
#include <unistd.h>
#include <cjson/cJSON.h>

const char* mqtt_server = "127.0.0.1";
const int mqtt_port = 1883; 
const char* sub_topic = "host/wifi";

struct mosquitto* mosq_local;

void mqtt_connect() 
{
    int rc = mosquitto_connect(mosq_local, mqtt_server, 1883, 60);
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
    mosq_local = mosquitto_new(NULL, true, NULL);

    if (!mosq_local) 
    {
        fprintf(stderr, "Error: Out of memory.\n");
        return 1;
    }

    mosquitto_connect_callback_set(mosq_local, on_connect);
    mosquitto_message_callback_set(mosq_local, on_message);

    mqtt_connect();

    mosquitto_loop_start(mosq_local);
    
    while (1) 
    {

    }

    mosquitto_destroy(mosq_local);
    mosquitto_lib_cleanup();
    return 0;
}

/**
 * @brief Xử lý dữ liệu điều khiển cho cả LED và SW.
 * 
 * Hàm này nhận vào một mảng JSON (các thiết bị "leds" hoặc "sws"),
 * sau đó tạo cấu trúc JSON mới chứa thông tin điều khiển, 
 * và gửi qua MQTT tới topic "device/wifi".
 *
 * @param root   JSON gốc để chứa kết quả
 * @param array  Mảng chứa danh sách thiết bị cần xử lý
 * @param key    Chuỗi xác định loại thiết bị ("leds" hoặc "sws")
 */
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

        // Print the message and send it to the MQTT broker
        uint8_t *message = cJSON_PrintUnformatted(root);  
        mosquitto_publish(mosq_local, NULL, "device/wifi", strlen((const char*)message), message, 0, false);
        printf("--> %s: %s\n\n", "device/wifi", message);  

    }
}

void send_device_to_master()
{
    cJSON* root = cJSON_CreateObject();
    cJSON* leds = cJSON_CreateArray();
    cJSON* led1 = cJSON_CreateObject();
    cJSON* led2 = cJSON_CreateObject();

    cJSON_AddStringToObject(led1, "name", "Wifi 1");
    cJSON_AddStringToObject(led1, "controller", "wifi");
    cJSON_AddBoolToObject(led1, "status", 0);

    cJSON_AddStringToObject(led2, "name", "Wifi 2");
    cJSON_AddStringToObject(led2, "controller", "wifi");
    cJSON_AddBoolToObject(led2, "status", 0);

    cJSON_AddItemToArray(leds, led1);
    cJSON_AddItemToArray(leds, led2);

    cJSON_AddItemToObject(root, "leds", leds);

    cJSON_AddStringToObject(root, "mode", "get_devices_report");

    uint8_t *message = cJSON_PrintUnformatted(root);  
    mosquitto_publish(mosq_local, NULL, "host/master", strlen((const char*)message), message, 0, false);
    printf("--> %s: %s\n\n", "host/master", message);  
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
    else if (strcmp(mode_obj->valuestring, "get_devices") == 0)
    {
        send_device_to_master();
    }

    // Free the memory allocated for the main JSON object
    cJSON_Delete(json);
}
