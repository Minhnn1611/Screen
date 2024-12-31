/***************************************************************************//**
 * @file app.c
 * @brief Callbacks implementation and application specific code.
 *******************************************************************************
 * # License
 * <b>Copyright 2021 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * The licensor of this software is Silicon Laboratories Inc. Your use of this
 * software is governed by the terms of Silicon Labs Master Software License
 * Agreement (MSLA) available at
 * www.silabs.com/about-us/legal/master-software-license-agreement. This
 * software is distributed to you in Source Code format and is governed by the
 * sections of the MSLA applicable to Source Code.
 *
 ******************************************************************************/

#include "af.h"
#include "app/framework/util/af-main.h"
#include "app/framework/util/util.h"
#include "app/util/zigbee-framework/zigbee-device-common.h"
#include "stack/include/trust-center.h"
#include "zap-cluster-command-parser.h"
#include <stdlib.h>
#include "stack/include/zigbee-security-manager.h"
#include "mosquitto.h"
#include <string.h>
#include <cjson/cJSON.h>

// The number of tokens that can be written using ezspSetToken and read using
// ezspGetToken.
#define MFGSAMP_NUM_EZSP_TOKENS 8
// The size of the tokens that can be written using ezspSetToken and read using
// ezspGetToken.
#define MFGSAMP_EZSP_TOKEN_SIZE 8
// The number of manufacturing tokens.
#define MFGSAMP_NUM_EZSP_MFG_TOKENS 11
// The size of the largest EZSP Mfg token, EZSP_MFG_CBKE_DATA please refer to
// app/util/ezsp/ezsp-enum.h.
#define MFGSAMP_EZSP_TOKEN_MFG_MAXSIZE 92

const char* mqtt_server = "127.0.0.1";
const int mqtt_port = 1883; 
const char* topic = "host/zigbee";

static sl_zigbee_event_t mqtt_event;
static sl_zigbee_event_t test_event;
static sl_zigbee_event_t keep_alive_event;

struct mosquitto *mosq;

uint8_t led_num = 2;
uint8_t led_ep[2] = {1, 2};
uint8_t led_status[3] = {0};

extern EmberStatus emberAfTrustCenterStartNetworkKeyUpdate(void);

//----------------------
// ZCL commands handling

static void ias_ace_cluster_arm_command_handler(uint8_t armMode,
                                                uint8_t* armDisarmCode,
                                                uint8_t zoneId)
{
  uint16_t armDisarmCodeLength = emberAfStringLength(armDisarmCode);
  EmberNodeId sender = emberGetSender();
  uint16_t i;

  sl_zigbee_app_debug_print("IAS ACE Arm Received %04X", armMode);

  // Start i at 1 to skip over leading character in the byte array as it is the
  // length byte
  for (i = 1; i < armDisarmCodeLength; i++) {
    sl_zigbee_app_debug_print("%c", armDisarmCode[i]);
  }
  sl_zigbee_app_debug_print(" %02X\n", zoneId);

  emberAfFillCommandIasAceClusterArmResponse(armMode);
  emberAfSendCommandUnicast(EMBER_OUTGOING_DIRECT, sender);
}

static void ias_ace_cluster_bypass_command_handler(uint8_t numberOfZones,
                                                   uint8_t* zoneIds,
                                                   uint8_t* armDisarmCode)
{
  EmberNodeId sender = emberGetSender();
  uint8_t i;

  sl_zigbee_app_debug_print("IAS ACE Cluster Bypass for zones ");

  for (i = 0; i < numberOfZones; i++) {
    sl_zigbee_app_debug_print("%d ", zoneIds[i]);
  }
  sl_zigbee_app_debug_print("\n");

  emberAfFillCommandIasAceClusterBypassResponse(numberOfZones,
                                                zoneIds,
                                                numberOfZones);
  emberAfSendCommandUnicast(EMBER_OUTGOING_DIRECT, sender);
}

static uint32_t zcl_ias_ace_cluster_server_command_handler(sl_service_opcode_t opcode,
                                                           sl_service_function_context_t *context)
{
  (void)opcode;

  EmberAfClusterCommand *cmd = (EmberAfClusterCommand *)context->data;

  switch (cmd->commandId) {
    case ZCL_ARM_COMMAND_ID:
    {
      sl_zcl_ias_ace_cluster_arm_command_t cmd_data;

      if (zcl_decode_ias_ace_cluster_arm_command(cmd, &cmd_data)
          != EMBER_ZCL_STATUS_SUCCESS) {
        return EMBER_ZCL_STATUS_UNSUP_COMMAND;
      }

      ias_ace_cluster_arm_command_handler(cmd_data.armMode,
                                          cmd_data.armDisarmCode,
                                          cmd_data.zoneId);
      return EMBER_ZCL_STATUS_SUCCESS;
    }
    case ZCL_BYPASS_COMMAND_ID:
    {
      sl_zcl_ias_ace_cluster_bypass_command_t cmd_data;

      if (zcl_decode_ias_ace_cluster_bypass_command(cmd, &cmd_data)
          != EMBER_ZCL_STATUS_SUCCESS) {
        return EMBER_ZCL_STATUS_UNSUP_COMMAND;
      }

      ias_ace_cluster_bypass_command_handler(cmd_data.numberOfZones,
                                             cmd_data.zoneIds,
                                             cmd_data.armDisarmCode);

      return EMBER_ZCL_STATUS_SUCCESS;
    }
  }

  return EMBER_ZCL_STATUS_UNSUP_COMMAND;
}

//----------------------
// Implemented My Function
// Read led status
void readLedStatus(uint8_t ep)
{
  uint16_t attId = 0x0000;  
  uint16_t attLen = 2;

  emberAfGetCommandApsFrame()->sourceEndpoint = 1;
  emberAfGetCommandApsFrame()->destinationEndpoint = ep;

  // Prepare the Read Attributes command
  emberAfFillCommandGlobalClientToServerReadAttributes(ZCL_ON_OFF_CLUSTER_ID, (uint8_t*)&attId, attLen);

  uint8_t childTableSize;
  childTableSize = emberAfGetChildTableSize();

  for (int i = 0; i < childTableSize; i++)
  {
    EmberChildData childData;
    emberAfGetChildData(i, &childData);
    if (childData.type == EMBER_END_DEVICE || EMBER_ROUTER == childData.type)
    {
      EmberStatus status = emberAfSendCommandUnicast(EMBER_OUTGOING_DIRECT, childData.id);

      if (status == EMBER_SUCCESS)
      {
        emberAfCorePrintln("send successfully to node id: 0x%04x", childData.id);
      }
      else 
      {
        emberAfCorePrintln("Error send: 0x%x", status);
      }
    }
  }
}


// Led Commnad Function
void sendLedCommand(uint8_t sourceEndpoint, uint8_t destinationEndpoint, uint16_t nodeId, uint8_t led_status)
{
  emberAfGetCommandApsFrame()->sourceEndpoint = sourceEndpoint;
  emberAfGetCommandApsFrame()->destinationEndpoint = destinationEndpoint;
  if (led_status == 1)
  {
    emberAfFillCommandOnOffClusterOn();
  }
  else if (led_status == 0)
  {
    emberAfFillCommandOnOffClusterOff();
  }

  EmberStatus status = emberAfSendCommandUnicast(EMBER_OUTGOING_DIRECT, nodeId);
  if (status == EMBER_SUCCESS) 
  {
    emberAfCorePrintln("send led cmd successfully");
  }
  else 
  {
    emberAfCorePrintln("Error send led cmd: 0x%x", status);
  }
}

int processMessage(const char *json_string) 
{
  uint8_t ep;
  uint8_t status;

  // Parse the input JSON string
  cJSON *root = cJSON_Parse(json_string);
  if (root == NULL) {
      printf("Error parsing JSON\n");
      return 1; 
  }

  // Check for "mode" field
  cJSON *modeItem = cJSON_GetObjectItemCaseSensitive(root, "mode");

  if (modeItem == NULL || !cJSON_IsString(modeItem)) 
  {
      printf("Invalid mode\n");
      cJSON_Delete(root);
      return 1;
  }

  if (strcmp(modeItem->valuestring, "device_control") == 0)
  {
    // Get the "sws" array
    cJSON *swsItem = cJSON_GetObjectItemCaseSensitive(root, "sws");
    if (swsItem == NULL || !cJSON_IsArray(swsItem)) {
        printf("Invalid JSON format, expected 'sws' array\n");
        cJSON_Delete(root);
        return 1;
    }

    // Loop through each item in the "sws" array
    cJSON *swItem = NULL;
    cJSON_ArrayForEach(swItem, swsItem)
    {
        cJSON *epItem = cJSON_GetObjectItemCaseSensitive(swItem, "ep");
        cJSON *statusItem = cJSON_GetObjectItemCaseSensitive(swItem, "status");

        // Validate that both 'ep' and 'status' are present and are numbers
        if (cJSON_IsNumber(epItem) && cJSON_IsBool(statusItem)) {
            ep = (uint8_t)epItem->valueint;
            status = (uint8_t)statusItem->valueint;

            emberAfCorePrintln("endpoint: %d", ep);
            emberAfCorePrintln("status: %d", status);

            // Process the command for each endpoint (child devices)
            uint8_t childTableSize = emberAfGetChildTableSize();

            for (int i = 0; i < childTableSize; i++)
            {
                EmberChildData childData;
                emberAfGetChildData(i, &childData);
                if (childData.type == EMBER_END_DEVICE || EMBER_ROUTER == childData.type)
                {
                    sendLedCommand(1, ep, childData.id, status); // Send command to each child device
                }
            }
        } else {
            printf("Invalid JSON format for endpoint or status\n");
        }
    }
  }
  else if (strcmp(modeItem->valuestring, "get_devices") == 0)
  {
    for (int i = 0; i < led_num; i ++)
    {
      readLedStatus(led_ep[i]);
    }
  }

  // Cleanup
  cJSON_Delete(root);

  return 0; 
}

// MQTT Function
void mqtt_connect() 
{
    int rc = mosquitto_connect(mosq, mqtt_server, mqtt_port, 60);
    sl_zigbee_app_debug_println("rc = %d", rc);
    if (rc != MOSQ_ERR_SUCCESS) 
    {
      sl_zigbee_app_debug_print("Unable to connect to MQTT Broker. Error code: %d\n", rc);
    }
}

void on_connect(struct mosquitto *mosq, void *obj, int rc) 
{
    sl_zigbee_app_debug_print("Connected to MQTT Broker with code %d\n", rc);
    mosquitto_subscribe(mosq, NULL, topic, 0);
}

void on_message(struct mosquitto *mosq, void *obj, const struct mosquitto_message *message) 
{
    if (message->payloadlen) 
    {
        sl_zigbee_app_debug_print("<-- %s: %s\n", message->topic, (char *)message->payload);
        char *payload = (char *)message->payload;

        if (strcmp(message->topic, topic) == 0)
        {
          processMessage(payload);
        } 

    }
}

//----------------------
// Implemented My Handler
static void mqtt_event_handler(sl_zigbee_event_t *event)
{
  mosquitto_lib_init();
  mosq = mosquitto_new(NULL, true, NULL);
  if (!mosq) 
  {
     sl_zigbee_app_debug_print("Error: Out of memory.\n");
  }

  mosquitto_connect_callback_set(mosq, on_connect);
  mosquitto_message_callback_set(mosq, on_message);
  mqtt_connect();  

  sl_zigbee_event_set_delay_ms(&keep_alive_event, 100);
}

void keep_alive_event_handler()
{
  mosquitto_loop(mosq, 10, 1);
  sl_zigbee_event_set_delay_ms(&keep_alive_event, 100);
}

void test_event_handler()
{
  static uint8_t count = 0;
  sl_zigbee_app_debug_println("log %d", count++);
  sl_zigbee_event_set_delay_ms(&test_event, 1000);
}
//----------------------
// Implemented Callbacks

/** @brief Init
 * Application init function
 */
void emberAfMainInitCallback(void)
{
  // Subscribe to ZCL commands for the IAS_ACE cluster, server side.
  sl_zigbee_subscribe_to_zcl_commands(ZCL_IAS_ACE_CLUSTER_ID,
                                      0xFFFF,
                                      ZCL_DIRECTION_CLIENT_TO_SERVER,
                                      zcl_ias_ace_cluster_server_command_handler);

  // My event
  sl_zigbee_event_init(&mqtt_event, mqtt_event_handler);
  sl_zigbee_event_init(&test_event, test_event_handler);
  sl_zigbee_event_init(&keep_alive_event, keep_alive_event_handler);

  sl_zigbee_event_set_delay_ms(&mqtt_event, 2000);
  sl_zigbee_event_set_delay_ms(&test_event, 2000);
}

bool emberAfReadAttributesResponseCallback(EmberAfClusterId clusterId,
                                           int8u *buffer,
                                           int16u bufLen)
{
  EmberAfClusterCommand *currentCommand = emberAfCurrentCommand();
  // printCmdInfor(currentCommand);
  uint8_t ep = currentCommand->apsFrame->sourceEndpoint;
  uint8_t status;

  // 1) unsupported: [attrId:2] [status:1]
  // 2) supported:   [attrId:2] [status:1] [type:1] [data:n]
  emberAfCorePrintln("recevice response: ");
  emberAfCorePrintln("clusterId: 0x%2x", clusterId);
  if (clusterId == ZCL_ON_OFF_CLUSTER_ID)
    {
      if (bufLen > 3)
        {
          status = buffer[4];
          emberAfCorePrintln("ep: %d, status: %d", ep, buffer[4]);
          
          char sw_name[20];
          snprintf(sw_name, sizeof(sw_name), "Switch %d", ep);
          cJSON* root = cJSON_CreateObject();
          cJSON* sws = cJSON_CreateArray();
          cJSON* sw = cJSON_CreateObject();

          cJSON_AddStringToObject(sw, "name", sw_name);
          cJSON_AddBoolToObject(sw, "status", status);
          cJSON_AddNumberToObject(sw, "ep", ep);
          cJSON_AddStringToObject(sw, "controller", "zigbee");

          cJSON_AddItemToArray(sws, sw);

          cJSON_AddItemToObject(root, "sws", sws);
          cJSON_AddStringToObject(root, "mode", "get_devices_report");

          uint8_t *message = cJSON_PrintUnformatted(root);  
          mosquitto_publish(mosq, NULL, "host/master", strlen((const char*)message), message, 0, false);
          emberAfCorePrintln("--> %s: %s", "host/master", message);

          cJSON_Delete(root);
        }
    }
  return 0;
}

#ifdef SL_CATALOG_CLI_PRESENT
//-------------------------------------
// Custom CLI commands and related code

// The manufacturing tokens are enumerated in app/util/ezsp/ezsp-protocol.h.
// The names are enumerated here to make it easier for the user.
static const char * ezspMfgTokenNames[] =
{
  "EZSP_MFG_CUSTOM_VERSION...",
  "EZSP_MFG_STRING...........",
  "EZSP_MFG_BOARD_NAME.......",
  "EZSP_MFG_MANUF_ID.........",
  "EZSP_MFG_PHY_CONFIG.......",
  "EZSP_MFG_BOOTLOAD_AES_KEY.",
  "EZSP_MFG_ASH_CONFIG.......",
  "EZSP_MFG_EZSP_STORAGE.....",
  "EZSP_STACK_CAL_DATA.......",
  "EZSP_MFG_CBKE_DATA........",
  "EZSP_MFG_INSTALLATION_CODE"
};

// Called to dump all of the tokens. This dumps the indices, the names,
// and the values using ezspGetToken and ezspGetMfgToken. The indices
// are used for read and write functions below.
void mfgappTokenDump(sl_cli_command_arg_t *arguments)
{
  (void)arguments;

  EmberStatus status;
  uint8_t tokenData[MFGSAMP_EZSP_TOKEN_MFG_MAXSIZE];
  uint8_t index, i, tokenLength;

  // first go through the tokens accessed using ezspGetToken
  sl_zigbee_app_debug_print("(data shown little endian)\n");
  sl_zigbee_app_debug_print("Tokens:\n");
  sl_zigbee_app_debug_print("idx  value:\n");
  for (index = 0; index < MFGSAMP_NUM_EZSP_TOKENS; index++) {
    // get the token data here
    status = ezspGetToken(index, tokenData);
    sl_zigbee_app_debug_print("[%d]", index);
    if (status == EMBER_SUCCESS) {
      // Print out the token data
      for (i = 0; i < MFGSAMP_EZSP_TOKEN_SIZE; i++) {
        sl_zigbee_app_debug_print(" %02X", tokenData[i]);
      }
      sl_zigbee_app_debug_print("\n");
    } else {
      // handle when ezspGetToken returns an error
      sl_zigbee_app_debug_print(" ... error 0x%02X ...\n", status);
    }
  }

  // now go through the tokens accessed using ezspGetMfgToken
  // the manufacturing tokens are enumerated in app/util/ezsp/ezsp-protocol.h
  // this file contains an array (ezspMfgTokenNames) representing the names.
  sl_zigbee_app_debug_print("Manufacturing Tokens:\n");
  sl_zigbee_app_debug_print("idx  token name                 len   value\n");
  for (index = 0; index < MFGSAMP_NUM_EZSP_MFG_TOKENS; index++) {
    // ezspGetMfgToken returns a length, be careful to only access
    // valid token indices.
    tokenLength = ezspGetMfgToken(index, tokenData);
    sl_zigbee_app_debug_print("[%x] %s: 0x%x:\n",
                              index, ezspMfgTokenNames[index], tokenLength);

    // Print out the token data
    for (i = 0; i < tokenLength; i++) {
      if ((i != 0) && ((i % 8) == 0)) {
        sl_zigbee_app_debug_println("");
        sl_zigbee_app_debug_print("                                    :");
      }
      sl_zigbee_app_debug_print(" %02X", tokenData[i]);
    }
    sl_zigbee_app_debug_print("\n");
  }
  sl_zigbee_app_debug_print("\n");
}

void changeNwkKeyCommand(sl_cli_command_arg_t *arguments)
{
  (void)arguments;

  EmberStatus status = emberAfTrustCenterStartNetworkKeyUpdate();

  if (status != EMBER_SUCCESS) {
    sl_zigbee_app_debug_print("Change Key Error %x\n", status);
  } else {
    sl_zigbee_app_debug_print("Change Key Success\n");
  }
}

static void dcPrintKey(uint8_t label, uint8_t *key)
{
  uint8_t i;
  sl_zigbee_app_debug_print("key %x: \n", label);
  for (i = 0; i < EMBER_ENCRYPTION_KEY_SIZE; i++) {
    sl_zigbee_app_debug_print("%02X", key[i]);
  }
  sl_zigbee_app_debug_print("\n");
}

void printNextKeyCommand(sl_cli_command_arg_t *arguments)
{
  (void)arguments;

  sl_status_t status;
  sl_zb_sec_man_context_t context;
  sl_zb_sec_man_key_t plaintext_key;

  sl_zb_sec_man_init_context(&context);

  context.core_key_type = SL_ZB_SEC_MAN_KEY_TYPE_NETWORK;
  context.key_index = 1;

  status = sl_zb_sec_man_export_key(&context, &plaintext_key);

  if (status != SL_STATUS_OK) {
    sl_zigbee_app_debug_print("Error getting key\n");
  } else {
    dcPrintKey(1, plaintext_key.key);
  }
}

void versionCommand(sl_cli_command_arg_t *arguments)
{
  (void)arguments;

  sl_zigbee_app_debug_print("Version:  0.1 Alpha\n");
  sl_zigbee_app_debug_print(" %s\n", __DATE__);
  sl_zigbee_app_debug_print(" %s\n", __TIME__);
  sl_zigbee_app_debug_print("\n");
#ifdef EMBER_TEST
  sl_zigbee_app_debug_print("Print formatter test : 0x%x=0x12, 0x%02x=0x1234 0x%04x=0x12345678\n",
                            0x12, 0x1234, 0x12345678);
#endif
}

void setTxPowerCommand(sl_cli_command_arg_t *arguments)
{
  int8_t dBm = sl_cli_get_argument_int8(arguments, 0);

  emberSetRadioPower(dBm);
}

#endif
