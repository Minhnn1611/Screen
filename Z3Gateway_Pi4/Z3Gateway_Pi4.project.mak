####################################################################
# Automatically-generated file. Do not edit!                       #
# Makefile Version 15                                              #
####################################################################

BASE_SDK_PATH = /home/minhnn/SimplicityStudio/SDKs/gecko_sdk
UNAME:=$(shell $(POSIX_TOOL_PATH)uname -s | $(POSIX_TOOL_PATH)sed -e 's/^\(CYGWIN\).*/\1/' | $(POSIX_TOOL_PATH)sed -e 's/^\(MINGW\).*/\1/')
ifeq ($(UNAME),MINGW)
# Translate "C:/super" into "/C/super" for MinGW make.
SDK_PATH := /$(shell $(POSIX_TOOL_PATH)echo $(BASE_SDK_PATH) | sed s/://)
endif
SDK_PATH ?= $(BASE_SDK_PATH)
COPIED_SDK_PATH ?= gecko_sdk_4.4.2

# This uses the explicit build rules below
PROJECT_SOURCE_FILES =

C_SOURCE_FILES   += $(filter %.c, $(PROJECT_SOURCE_FILES))
CXX_SOURCE_FILES += $(filter %.cpp, $(PROJECT_SOURCE_FILES))
CXX_SOURCE_FILES += $(filter %.cc, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.s, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.S, $(PROJECT_SOURCE_FILES))
LIB_FILES        += $(filter %.a, $(PROJECT_SOURCE_FILES))

C_DEFS += \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DEZSP_HOST=1' \
 '-DGATEWAY_APP=1' \
 '-DPLATFORM_HEADER="platform-header.h"' \
 '-DUC_BUILD=1' \
 '-DEZSP_CPC=1' \
 '-DUSE_ZAP_CONFIG=1' \
 '-DEZSP_APPLICATION_HAS_MFGLIB_HANDLER=1' \
 '-DCONFIGURATION_HEADER="app/framework/util/config.h"'

ASM_DEFS += \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DEZSP_HOST=1' \
 '-DGATEWAY_APP=1' \
 '-DPLATFORM_HEADER="platform-header.h"' \
 '-DUC_BUILD=1' \
 '-DEZSP_CPC=1' \
 '-DUSE_ZAP_CONFIG=1' \
 '-DEZSP_APPLICATION_HAS_MFGLIB_HANDLER=1' \
 '-DCONFIGURATION_HEADER="app/framework/util/config.h"'

INCLUDES += \
 -Iautogen \
 -Iconfig \
 -I$(COPIED_SDK_PATH)/platform/service/cli/inc \
 -I$(COPIED_SDK_PATH)/platform/service/cli/src \
 -I$(COPIED_SDK_PATH)/platform/CMSIS/Core/Include \
 -I$(COPIED_SDK_PATH)/platform/emlib/inc \
 -I$(COPIED_SDK_PATH)/platform/emlib/host/inc \
 -I$(COPIED_SDK_PATH)/platform/common/inc \
 -I$(COPIED_SDK_PATH)/platform/service/iostream/inc \
 -I$(COPIED_SDK_PATH)/util/third_party/printf \
 -I$(COPIED_SDK_PATH)/util/third_party/printf/inc \
 -I$(COPIED_SDK_PATH)/util/silicon_labs/silabs_core \
 -I$(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/event_queue \
 -I$(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/memory_manager \
 -I$(COPIED_SDK_PATH)/platform/service/system/inc \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/address-table \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/basic \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/util/serial \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/service-function \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/color-control-server \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/concentrator \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/counters \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/debug-print \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ezmode-commissioning \
 -I$(COPIED_SDK_PATH)/. \
 -I$(COPIED_SDK_PATH)/protocol/zigbee \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/ezsp-host \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/util/ezsp \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/util/zigbee-framework \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/stack \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/stack/platform/host \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/stack/include \
 -I$(COPIED_SDK_PATH)/platform/radio/mac \
 -I$(COPIED_SDK_PATH)/platform/service/legacy_hal/inc \
 -I$(COPIED_SDK_PATH)/platform/service/legacy_common_ash/inc \
 -I$(COPIED_SDK_PATH)/platform/service/token_manager/inc \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/ezsp-host/cpc \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/file-descriptor-dispatch \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/gateway \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/green-power-client \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/stack/gp \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/green-power-common \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/common \
 -I$(COPIED_SDK_PATH)/platform/service/legacy_host/inc \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/stack/config \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/stack/zll \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/stack/core \
 -I$(COPIED_SDK_PATH)/platform/service/legacy_printf/inc \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ias-zone-client \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/identify \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/level-control \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/manufacturing-library-cli \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-creator \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-creator-security \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/on-off \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-common \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server-policy \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-storage-simple \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-storage-common \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-storage-posix-filesystem \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/poll-control-client \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/reporting \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/scan-dispatch \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/stack/security \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/signature-decode \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/simple-metering-client \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/test-harness \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/xncp-test-harness \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/time-server \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-broadcast \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-unicast \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/update-tc-link-key \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/include \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/security \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/util/counters \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/util/common \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/util/security \
 -I$(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/zcl-framework-core

GROUP_START =
GROUP_END =

PROJECT_LIBS = \
 -lpthread \
 -lc \
 -lm \
 -lmosquitto \
 -lcjson \
 -lcpc

LIBS += $(GROUP_START) $(PROJECT_LIBS) $(GROUP_END)

LIB_FILES += $(filter %.a, $(PROJECT_LIBS))

C_FLAGS += \
 -std=c99 \
 -Wall \
 -Wextra \
 -Os \
 -Wno-unused-parameter \
 -Wno-missing-field-initializers \
 -Wno-missing-braces

CXX_FLAGS += \
 -std=c++11 \
 -Wall \
 -Wextra \
 -Os \
 -Wno-unused-parameter \
 -Wno-missing-field-initializers \
 -Wno-missing-braces

ASM_FLAGS += \

LD_FLAGS += \


####################################################################
# Pre/Post Build Rules                                             #
####################################################################
pre-build:
	# No pre-build defined

post-build: $(OUTPUT_DIR)/$(PROJECTNAME).out
	# No post-build defined

####################################################################
# SDK Build Rules                                                  #
####################################################################
$(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o: $(COPIED_SDK_PATH)/platform/common/src/sl_assert.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/common/src/sl_assert.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/common/src/sl_assert.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.o: $(COPIED_SDK_PATH)/platform/common/src/sl_slist.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/common/src/sl_slist.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/common/src/sl_slist.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_string.o: $(COPIED_SDK_PATH)/platform/common/src/sl_string.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/common/src/sl_string.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/common/src/sl_string.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_string.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_string.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/sl_zigbee_coexistence_cli.o: $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/sl_zigbee_coexistence_cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/sl_zigbee_coexistence_cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/sl_zigbee_coexistence_cli.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/sl_zigbee_coexistence_cli.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/sl_zigbee_coexistence_cli.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_arguments.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_arguments.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_arguments.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_arguments.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_arguments.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_arguments.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_command.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_command.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_command.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_command.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_command.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_command.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_input.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_input.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_input.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_input.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_input.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_input.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_io.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_io.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_io.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_io.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_io.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_io.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_threaded_host.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_threaded_host.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_threaded_host.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_threaded_host.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_threaded_host.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_threaded_host.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_tokenize.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_tokenize.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_tokenize.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_tokenize.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_tokenize.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_tokenize.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.o: $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_stdio.o: $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_stdio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_stdio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_stdio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_stdio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_stdio.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/crc.o: $(COPIED_SDK_PATH)/platform/service/legacy_hal/src/crc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/legacy_hal/src/crc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/legacy_hal/src/crc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/crc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/crc.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/ember-printf-convert.o: $(COPIED_SDK_PATH)/platform/service/legacy_hal/src/ember-printf-convert.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/legacy_hal/src/ember-printf-convert.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/legacy_hal/src/ember-printf-convert.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/ember-printf-convert.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/ember-printf-convert.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/micro_host.o: $(COPIED_SDK_PATH)/platform/service/legacy_hal/src/micro_host.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/legacy_hal/src/micro_host.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/legacy_hal/src/micro_host.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/micro_host.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/micro_host.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/random.o: $(COPIED_SDK_PATH)/platform/service/legacy_hal/src/random.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/legacy_hal/src/random.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/legacy_hal/src/random.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/random.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/random.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/system-timer.o: $(COPIED_SDK_PATH)/platform/service/legacy_hal/src/system-timer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/legacy_hal/src/system-timer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/legacy_hal/src/system-timer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/system-timer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/system-timer.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_host/src/token.o: $(COPIED_SDK_PATH)/platform/service/legacy_host/src/token.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/legacy_host/src/token.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/legacy_host/src/token.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_host/src/token.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_host/src/token.o

$(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_init.o: $(COPIED_SDK_PATH)/platform/service/system/src/sl_system_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/system/src/sl_system_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/system/src/sl_system_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_init.o

$(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_process_action.o: $(COPIED_SDK_PATH)/platform/service/system/src/sl_system_process_action.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/system/src/sl_system_process_action.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/system/src/sl_system_process_action.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_process_action.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_process_action.o

$(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_def.o: $(COPIED_SDK_PATH)/platform/service/token_manager/src/sl_token_def.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/token_manager/src/sl_token_def.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/token_manager/src/sl_token_def.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_def.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_def.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/ezsp-host/cpc/cpc-host-ui.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/ezsp-host/cpc/cpc-host-ui.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/ezsp-host/cpc/cpc-host-ui.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/ezsp-host/cpc/cpc-host-ui.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/ezsp-host/cpc/cpc-host-ui.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/ezsp-host/cpc/cpc-host-ui.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/ezsp-host/cpc/cpc-host.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/ezsp-host/cpc/cpc-host.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/ezsp-host/cpc/cpc-host.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/ezsp-host/cpc/cpc-host.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/ezsp-host/cpc/cpc-host.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/ezsp-host/cpc/cpc-host.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/ezsp-host/ezsp-host-io.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/ezsp-host/ezsp-host-io.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/ezsp-host/ezsp-host-io.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/ezsp-host/ezsp-host-io.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/ezsp-host/ezsp-host-io.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/ezsp-host/ezsp-host-io.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/ezsp-host/ezsp-host-queues.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/ezsp-host/ezsp-host-queues.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/ezsp-host/ezsp-host-queues.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/ezsp-host/ezsp-host-queues.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/ezsp-host/ezsp-host-queues.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/ezsp-host/ezsp-host-queues.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/ezsp-host/ezsp-host-ui.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/ezsp-host/ezsp-host-ui.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/ezsp-host/ezsp-host-ui.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/ezsp-host/ezsp-host-ui.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/ezsp-host/ezsp-host-ui.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/ezsp-host/ezsp-host-ui.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/core-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/core-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/core-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/core-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/core-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/core-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/network-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/network-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/network-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/network-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/network-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/network-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/option-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/option-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/option-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/option-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/option-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/option-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/security-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/security-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/security-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/security-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/security-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/security-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/zcl-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/zcl-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/zcl-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/zcl-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/zcl-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/zcl-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/zdo-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/zdo-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/zdo-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/cli/zdo-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/zdo-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/cli/zdo-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_app_framework_common.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_app_framework_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_app_framework_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_app_framework_common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_app_framework_common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_app_framework_common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_app_framework_host_cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_app_framework_host_cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_app_framework_host_cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_app_framework_host_cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_app_framework_host_cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_app_framework_host_cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/ezsp/ezsp-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/ezsp/ezsp-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/ezsp/ezsp-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/ezsp/ezsp-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/ezsp/ezsp-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/ezsp/ezsp-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/file-descriptor-dispatch/file-descriptor-dispatch-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/file-descriptor-dispatch/file-descriptor-dispatch-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/file-descriptor-dispatch/file-descriptor-dispatch-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/file-descriptor-dispatch/file-descriptor-dispatch-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/file-descriptor-dispatch/file-descriptor-dispatch-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/file-descriptor-dispatch/file-descriptor-dispatch-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/file-descriptor-dispatch/file-descriptor-dispatch.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/file-descriptor-dispatch/file-descriptor-dispatch.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/file-descriptor-dispatch/file-descriptor-dispatch.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/file-descriptor-dispatch/file-descriptor-dispatch.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/file-descriptor-dispatch/file-descriptor-dispatch.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/file-descriptor-dispatch/file-descriptor-dispatch.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/gateway/gateway-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/gateway/gateway-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/gateway/gateway-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/gateway/gateway-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/gateway/gateway-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/gateway/gateway-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/gateway/gateway-support-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/gateway/gateway-support-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/gateway/gateway-support-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/gateway/gateway-support-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/gateway/gateway-support-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/gateway/gateway-support-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/gateway/gateway-support.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/gateway/gateway-support.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/gateway/gateway-support.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/gateway/gateway-support.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/gateway/gateway-support.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/gateway/gateway-support.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/ncp-configuration/ncp-configuration.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/ncp-configuration/ncp-configuration.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/ncp-configuration/ncp-configuration.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin-host/ncp-configuration/ncp-configuration.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/ncp-configuration/ncp-configuration.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin-host/ncp-configuration/ncp-configuration.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/address-table/address-table-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/address-table/address-table-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/address-table/address-table-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/address-table/address-table-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/address-table/address-table-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/address-table/address-table-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/address-table/address-table.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/address-table/address-table.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/address-table/address-table.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/address-table/address-table.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/address-table/address-table.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/address-table/address-table.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/basic/basic-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/basic/basic-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/basic/basic-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/basic/basic-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/basic/basic-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/basic/basic-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/basic/basic.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/basic/basic.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/basic/basic.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/basic/basic.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/basic/basic.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/basic/basic.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/color-control-server/color-control-server-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/color-control-server/color-control-server-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/color-control-server/color-control-server-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/color-control-server/color-control-server-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/color-control-server/color-control-server-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/color-control-server/color-control-server-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/color-control-server/color-control-server.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/color-control-server/color-control-server.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/color-control-server/color-control-server.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/color-control-server/color-control-server.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/color-control-server/color-control-server.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/color-control-server/color-control-server.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/concentrator/concentrator-support-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/concentrator/concentrator-support-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/concentrator/concentrator-support-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/concentrator/concentrator-support-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/concentrator/concentrator-support-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/concentrator/concentrator-support-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/concentrator/concentrator-support.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/concentrator/concentrator-support.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/concentrator/concentrator-support.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/concentrator/concentrator-support.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/concentrator/concentrator-support.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/concentrator/concentrator-support.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-host.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-host.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-host.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-host.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-host.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-host.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-ota-host.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-ota-host.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-ota-host.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-ota-host.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-ota-host.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-ota-host.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/debug-print/sl_zigbee_debug_print.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/debug-print/sl_zigbee_debug_print.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/debug-print/sl_zigbee_debug_print.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/debug-print/sl_zigbee_debug_print.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/debug-print/sl_zigbee_debug_print.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/debug-print/sl_zigbee_debug_print.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ez-mode-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ez-mode-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ez-mode-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ez-mode-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ez-mode-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ez-mode-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ez-mode.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ez-mode.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ez-mode.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ez-mode.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ez-mode.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ez-mode.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ezmode-commissioning-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ezmode-commissioning-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ezmode-commissioning-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ezmode-commissioning-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ezmode-commissioning-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ezmode-commissioning/ezmode-commissioning-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/green-power-client/green-power-client-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/green-power-client/green-power-client-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/green-power-client/green-power-client-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/green-power-client/green-power-client-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/green-power-client/green-power-client-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/green-power-client/green-power-client-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/green-power-client/green-power-client.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/green-power-client/green-power-client.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/green-power-client/green-power-client.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/green-power-client/green-power-client.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/green-power-client/green-power-client.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/green-power-client/green-power-client.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/green-power-common/green-power-common.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/green-power-common/green-power-common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/green-power-common/green-power-common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/green-power-common/green-power-common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/green-power-common/green-power-common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/green-power-common/green-power-common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ias-zone-client/ias-zone-client-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ias-zone-client/ias-zone-client-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ias-zone-client/ias-zone-client-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ias-zone-client/ias-zone-client-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ias-zone-client/ias-zone-client-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ias-zone-client/ias-zone-client-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ias-zone-client/ias-zone-client.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ias-zone-client/ias-zone-client.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ias-zone-client/ias-zone-client.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ias-zone-client/ias-zone-client.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ias-zone-client/ias-zone-client.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ias-zone-client/ias-zone-client.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/identify-feedback/identify-feedback.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/identify-feedback/identify-feedback.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/identify-feedback/identify-feedback.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/identify-feedback/identify-feedback.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/identify-feedback/identify-feedback.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/identify-feedback/identify-feedback.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/identify/identify-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/identify/identify-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/identify/identify-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/identify/identify-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/identify/identify-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/identify/identify-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/identify/identify-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/identify/identify-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/identify/identify-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/identify/identify-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/identify/identify-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/identify/identify-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/identify/identify.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/identify/identify.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/identify/identify.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/identify/identify.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/identify/identify.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/identify/identify.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/level-control/level-control-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/level-control/level-control-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/level-control/level-control-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/level-control/level-control-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/level-control/level-control-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/level-control/level-control-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/level-control/level-control.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/level-control/level-control.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/level-control/level-control.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/level-control/level-control.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/level-control/level-control.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/level-control/level-control.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/manufacturing-library-cli/manufacturing-library-cli-host.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/manufacturing-library-cli/manufacturing-library-cli-host.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/manufacturing-library-cli/manufacturing-library-cli-host.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/manufacturing-library-cli/manufacturing-library-cli-host.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/manufacturing-library-cli/manufacturing-library-cli-host.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/manufacturing-library-cli/manufacturing-library-cli-host.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-creator-security/network-creator-security-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-creator-security/network-creator-security-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-creator-security/network-creator-security-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-creator-security/network-creator-security-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-creator-security/network-creator-security-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-creator-security/network-creator-security-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-creator-security/network-creator-security.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-creator-security/network-creator-security.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-creator-security/network-creator-security.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-creator-security/network-creator-security.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-creator-security/network-creator-security.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-creator-security/network-creator-security.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-creator/network-creator-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-creator/network-creator-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-creator/network-creator-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-creator/network-creator-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-creator/network-creator-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-creator/network-creator-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-creator/network-creator-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-creator/network-creator-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-creator/network-creator-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-creator/network-creator-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-creator/network-creator-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-creator/network-creator-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-creator/network-creator.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-creator/network-creator.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-creator/network-creator.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-creator/network-creator.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-creator/network-creator.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-creator/network-creator.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-host.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-host.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-host.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-host.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-host.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-host.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-v2.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-v2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-v2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-v2.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-v2.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-v2.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/on-off/on-off-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/on-off/on-off-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/on-off/on-off-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/on-off/on-off-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/on-off/on-off-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/on-off/on-off-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/on-off/on-off.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/on-off/on-off.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/on-off/on-off.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/on-off/on-off.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/on-off/on-off.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/on-off/on-off.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-common/ota-common.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-common/ota-common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-common/ota-common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-common/ota-common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-common/ota-common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-common/ota-common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server-policy/ota-server-policy-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server-policy/ota-server-policy-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server-policy/ota-server-policy-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server-policy/ota-server-policy-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server-policy/ota-server-policy-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server-policy/ota-server-policy-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server-policy/ota-server-policy.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server-policy/ota-server-policy.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server-policy/ota-server-policy.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server-policy/ota-server-policy.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server-policy/ota-server-policy.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server-policy/ota-server-policy.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server/ota-server-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server/ota-server-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server/ota-server-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server/ota-server-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server/ota-server-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server/ota-server-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server/ota-server-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server/ota-server-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server/ota-server-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server/ota-server-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server/ota-server-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server/ota-server-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server/ota-server-dynamic-block-period.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server/ota-server-dynamic-block-period.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server/ota-server-dynamic-block-period.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server/ota-server-dynamic-block-period.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server/ota-server-dynamic-block-period.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server/ota-server-dynamic-block-period.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server/ota-server-page-request.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server/ota-server-page-request.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server/ota-server-page-request.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server/ota-server-page-request.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server/ota-server-page-request.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server/ota-server-page-request.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server/ota-server.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server/ota-server.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server/ota-server.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-server/ota-server.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server/ota-server.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-server/ota-server.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-storage-common/ota-storage-common-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-storage-common/ota-storage-common-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-storage-common/ota-storage-common-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-storage-common/ota-storage-common-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-storage-common/ota-storage-common-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-storage-common/ota-storage-common-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-storage-common/ota-storage-common.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-storage-common/ota-storage-common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-storage-common/ota-storage-common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-storage-common/ota-storage-common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-storage-common/ota-storage-common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-storage-common/ota-storage-common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-storage-posix-filesystem/ota-storage-linux.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-storage-posix-filesystem/ota-storage-linux.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-storage-posix-filesystem/ota-storage-linux.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/ota-storage-posix-filesystem/ota-storage-linux.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-storage-posix-filesystem/ota-storage-linux.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/ota-storage-posix-filesystem/ota-storage-linux.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/poll-control-client/poll-control-client-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/poll-control-client/poll-control-client-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/poll-control-client/poll-control-client-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/poll-control-client/poll-control-client-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/poll-control-client/poll-control-client-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/poll-control-client/poll-control-client-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/poll-control-client/poll-control-client.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/poll-control-client/poll-control-client.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/poll-control-client/poll-control-client.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/poll-control-client/poll-control-client.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/poll-control-client/poll-control-client.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/poll-control-client/poll-control-client.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/reporting/reporting-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/reporting/reporting-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/reporting/reporting-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/reporting/reporting-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/reporting/reporting-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/reporting/reporting-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/reporting/reporting-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/reporting/reporting-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/reporting/reporting-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/reporting/reporting-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/reporting/reporting-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/reporting/reporting-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/reporting/reporting-default-configuration.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/reporting/reporting-default-configuration.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/reporting/reporting-default-configuration.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/reporting/reporting-default-configuration.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/reporting/reporting-default-configuration.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/reporting/reporting-default-configuration.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/reporting/reporting.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/reporting/reporting.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/reporting/reporting.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/reporting/reporting.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/reporting/reporting.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/reporting/reporting.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/scan-dispatch/scan-dispatch.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/scan-dispatch/scan-dispatch.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/scan-dispatch/scan-dispatch.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/scan-dispatch/scan-dispatch.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/scan-dispatch/scan-dispatch.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/scan-dispatch/scan-dispatch.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/simple-metering-client/simple-metering-client.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/stack-diagnostics/stack-diagnostics.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/stack-diagnostics/stack-diagnostics.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/stack-diagnostics/stack-diagnostics.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/stack-diagnostics/stack-diagnostics.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/stack-diagnostics/stack-diagnostics.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/stack-diagnostics/stack-diagnostics.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/test-harness/read-write-attributes.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/test-harness/read-write-attributes.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/test-harness/read-write-attributes.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/test-harness/read-write-attributes.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/test-harness/read-write-attributes.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/test-harness/read-write-attributes.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/test-harness/test-harness-host.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/test-harness/test-harness-host.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/test-harness/test-harness-host.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/test-harness/test-harness-host.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/test-harness/test-harness-host.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/test-harness/test-harness-host.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/test-harness/test-harness.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/test-harness/test-harness.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/test-harness/test-harness.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/test-harness/test-harness.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/test-harness/test-harness.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/test-harness/test-harness.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/time-server/time-server.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/time-server/time-server.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/time-server/time-server.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/time-server/time-server.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/time-server/time-server.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/time-server/time-server.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-broadcast/trust-center-nwk-key-update-broadcast.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-broadcast/trust-center-nwk-key-update-broadcast.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-broadcast/trust-center-nwk-key-update-broadcast.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-broadcast/trust-center-nwk-key-update-broadcast.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-broadcast/trust-center-nwk-key-update-broadcast.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-broadcast/trust-center-nwk-key-update-broadcast.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-periodic/trust-center-nwk-key-update-periodic.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-periodic/trust-center-nwk-key-update-periodic.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-periodic/trust-center-nwk-key-update-periodic.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-periodic/trust-center-nwk-key-update-periodic.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-periodic/trust-center-nwk-key-update-periodic.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-periodic/trust-center-nwk-key-update-periodic.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-unicast/trust-center-nwk-key-update-unicast.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-unicast/trust-center-nwk-key-update-unicast.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-unicast/trust-center-nwk-key-update-unicast.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-unicast/trust-center-nwk-key-update-unicast.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-unicast/trust-center-nwk-key-update-unicast.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/trust-center-nwk-key-update-unicast/trust-center-nwk-key-update-unicast.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/zcl-framework-core/zcl-framework-core-cb.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/zcl-framework-core/zcl-framework-core-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/zcl-framework-core/zcl-framework-core-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/zcl-framework-core/zcl-framework-core-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/zcl-framework-core/zcl-framework-core-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/zcl-framework-core/zcl-framework-core-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-custom-cluster-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-custom-cluster-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-custom-cluster-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-custom-cluster-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-custom-cluster-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-custom-cluster-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-global-cli.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-global-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-global-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-global-cli.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-global-cli.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/zcl_cli/zigbee-zcl-global-cli.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-node.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/security/af-node.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/security/af-node.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/security/af-node.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-node.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-node.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-security-common.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/security/af-security-common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/security/af-security-common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/security/af-security-common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-security-common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-security-common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-trust-center.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/security/af-trust-center.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/security/af-trust-center.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/security/af-trust-center.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-trust-center.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-trust-center.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/crypto-state.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/security/crypto-state.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/security/crypto-state.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/security/crypto-state.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/crypto-state.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/crypto-state.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/service-function/sl_service_function.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/service-function/sl_service_function.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/service-function/sl_service_function.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/service-function/sl_service_function.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/service-function/sl_service_function.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/service-function/sl_service_function.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/signature-decode/sl_signature_decode.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/signature-decode/sl_signature_decode.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/signature-decode/sl_signature_decode.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/signature-decode/sl_signature_decode.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/signature-decode/sl_signature_decode.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/signature-decode/sl_signature_decode.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-common.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/af-common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/af-common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/af-common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-event.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/af-event.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/af-event.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/af-event.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-event.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-event.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-host.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/af-host.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/af-host.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/af-host.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-host.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-host.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-size.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/attribute-size.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/attribute-size.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/attribute-size.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-size.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-size.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-storage.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/attribute-storage.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/attribute-storage.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/attribute-storage.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-storage.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-storage.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-table.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/attribute-table.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/attribute-table.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/attribute-table.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-table.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-table.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/client-api.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/client-api.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/client-api.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/client-api.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/client-api.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/client-api.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/global-callback.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/global-callback.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/global-callback.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/global-callback.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/global-callback.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/global-callback.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/global-other-callback.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/global-other-callback.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/global-other-callback.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/global-other-callback.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/global-other-callback.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/global-other-callback.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/message.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/message.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/message.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/message.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/message.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/message.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/multi-network.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/multi-network.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/multi-network.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/multi-network.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/multi-network.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/multi-network.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/print-formatter.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/print-formatter.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/print-formatter.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/print-formatter.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/print-formatter.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/print-formatter.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/print.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/print.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/print.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/print.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/print.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/print.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/process-cluster-message.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/process-cluster-message.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/process-cluster-message.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/process-cluster-message.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/process-cluster-message.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/process-cluster-message.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/process-global-message.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/process-global-message.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/process-global-message.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/process-global-message.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/process-global-message.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/process-global-message.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/service-discovery-common.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/service-discovery-common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/service-discovery-common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/service-discovery-common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/service-discovery-common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/service-discovery-common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/service-discovery-host.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/service-discovery-host.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/service-discovery-host.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/service-discovery-host.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/service-discovery-host.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/service-discovery-host.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/time-util.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/time-util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/time-util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/time-util.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/time-util.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/time-util.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/util.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/util.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/util.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/util.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/zcl-util.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/zcl-util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/zcl-util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/framework/util/zcl-util.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/zcl-util.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/zcl-util.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/common/library.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/util/common/library.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/util/common/library.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/util/common/library.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/common/library.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/common/library.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/ezsp/ezsp-callbacks.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/util/ezsp/ezsp-callbacks.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/util/ezsp/ezsp-callbacks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/util/ezsp/ezsp-callbacks.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/ezsp/ezsp-callbacks.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/ezsp/ezsp-callbacks.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/ezsp/ezsp-enum-decode.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/util/ezsp/ezsp-enum-decode.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/util/ezsp/ezsp-enum-decode.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/util/ezsp/ezsp-enum-decode.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/ezsp/ezsp-enum-decode.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/ezsp/ezsp-enum-decode.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/ezsp/ezsp-frame-utilities.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/util/ezsp/ezsp-frame-utilities.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/util/ezsp/ezsp-frame-utilities.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/util/ezsp/ezsp-frame-utilities.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/ezsp/ezsp-frame-utilities.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/ezsp/ezsp-frame-utilities.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/ezsp/ezsp.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/util/ezsp/ezsp.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/util/ezsp/ezsp.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/util/ezsp/ezsp.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/ezsp/ezsp.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/ezsp/ezsp.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/ezsp/serial-interface-cpc.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/util/ezsp/serial-interface-cpc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/util/ezsp/serial-interface-cpc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/util/ezsp/serial-interface-cpc.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/ezsp/serial-interface-cpc.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/ezsp/serial-interface-cpc.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/security/security-address-cache.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/util/security/security-address-cache.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/util/security/security-address-cache.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/util/security/security-address-cache.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/security/security-address-cache.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/security/security-address-cache.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/serial/linux-serial.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/util/serial/linux-serial.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/util/serial/linux-serial.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/util/serial/linux-serial.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/serial/linux-serial.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/serial/linux-serial.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/serial/sl_zigbee_command_interpreter.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/util/serial/sl_zigbee_command_interpreter.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/util/serial/sl_zigbee_command_interpreter.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/util/serial/sl_zigbee_command_interpreter.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/serial/sl_zigbee_command_interpreter.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/serial/sl_zigbee_command_interpreter.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/zigbee-framework/zigbee-device-common.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/util/zigbee-framework/zigbee-device-common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/util/zigbee-framework/zigbee-device-common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/util/zigbee-framework/zigbee-device-common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/zigbee-framework/zigbee-device-common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/zigbee-framework/zigbee-device-common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/zigbee-framework/zigbee-device-host.o: $(COPIED_SDK_PATH)/protocol/zigbee/app/util/zigbee-framework/zigbee-device-host.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/app/util/zigbee-framework/zigbee-device-host.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/app/util/zigbee-framework/zigbee-device-host.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/zigbee-framework/zigbee-device-host.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/zigbee-framework/zigbee-device-host.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/ember-configuration-host-access.o: $(COPIED_SDK_PATH)/protocol/zigbee/stack/config/ember-configuration-host-access.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/stack/config/ember-configuration-host-access.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/stack/config/ember-configuration-host-access.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/ember-configuration-host-access.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/ember-configuration-host-access.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/gp/gp-util.o: $(COPIED_SDK_PATH)/protocol/zigbee/stack/gp/gp-util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/stack/gp/gp-util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/stack/gp/gp-util.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/gp/gp-util.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/gp/gp-util.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/zigbee-security-manager-host.o: $(COPIED_SDK_PATH)/protocol/zigbee/stack/security/zigbee-security-manager-host.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/protocol/zigbee/stack/security/zigbee-security-manager-host.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/protocol/zigbee/stack/security/zigbee-security-manager-host.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/zigbee-security-manager-host.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/zigbee-security-manager-host.o

$(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/event_queue/event-queue.o: $(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/event_queue/event-queue.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/event_queue/event-queue.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/event_queue/event-queue.c
CDEPS += $(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/event_queue/event-queue.d
OBJS += $(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/event_queue/event-queue.o

$(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/memory_manager/sl_malloc.o: $(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/memory_manager/sl_malloc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/memory_manager/sl_malloc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/memory_manager/sl_malloc.c
CDEPS += $(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/memory_manager/sl_malloc.d
OBJS += $(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/memory_manager/sl_malloc.o

$(OUTPUT_DIR)/sdk/util/third_party/printf/printf.o: $(COPIED_SDK_PATH)/util/third_party/printf/printf.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/printf/printf.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/printf/printf.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/printf/printf.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/printf/printf.o

$(OUTPUT_DIR)/sdk/util/third_party/printf/src/iostream_printf.o: $(COPIED_SDK_PATH)/util/third_party/printf/src/iostream_printf.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/printf/src/iostream_printf.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/printf/src/iostream_printf.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/printf/src/iostream_printf.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/printf/src/iostream_printf.o

$(OUTPUT_DIR)/project/app.o: app.c
	@$(POSIX_TOOL_PATH)echo 'Building app.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ app.c
CDEPS += $(OUTPUT_DIR)/project/app.d
OBJS += $(OUTPUT_DIR)/project/app.o

$(OUTPUT_DIR)/project/autogen/sl_cli_command_table.o: autogen/sl_cli_command_table.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_cli_command_table.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_cli_command_table.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_cli_command_table.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_cli_command_table.o

$(OUTPUT_DIR)/project/autogen/sl_cli_instances.o: autogen/sl_cli_instances.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_cli_instances.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_cli_instances.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_cli_instances.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_cli_instances.o

$(OUTPUT_DIR)/project/autogen/sl_cluster_service_gen.o: autogen/sl_cluster_service_gen.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_cluster_service_gen.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_cluster_service_gen.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_cluster_service_gen.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_cluster_service_gen.o

$(OUTPUT_DIR)/project/autogen/sl_event_handler.o: autogen/sl_event_handler.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_event_handler.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_event_handler.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_event_handler.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_event_handler.o

$(OUTPUT_DIR)/project/autogen/sl_iostream_handles.o: autogen/sl_iostream_handles.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_iostream_handles.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_iostream_handles.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_iostream_handles.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_iostream_handles.o

$(OUTPUT_DIR)/project/autogen/sli_cli_hooks.o: autogen/sli_cli_hooks.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sli_cli_hooks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sli_cli_hooks.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sli_cli_hooks.d
OBJS += $(OUTPUT_DIR)/project/autogen/sli_cli_hooks.o

$(OUTPUT_DIR)/project/autogen/zap-cli.o: autogen/zap-cli.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/zap-cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/zap-cli.c
CDEPS += $(OUTPUT_DIR)/project/autogen/zap-cli.d
OBJS += $(OUTPUT_DIR)/project/autogen/zap-cli.o

$(OUTPUT_DIR)/project/autogen/zap-cluster-command-parser.o: autogen/zap-cluster-command-parser.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/zap-cluster-command-parser.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/zap-cluster-command-parser.c
CDEPS += $(OUTPUT_DIR)/project/autogen/zap-cluster-command-parser.d
OBJS += $(OUTPUT_DIR)/project/autogen/zap-cluster-command-parser.o

$(OUTPUT_DIR)/project/autogen/zap-event.o: autogen/zap-event.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/zap-event.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/zap-event.c
CDEPS += $(OUTPUT_DIR)/project/autogen/zap-event.d
OBJS += $(OUTPUT_DIR)/project/autogen/zap-event.o

$(OUTPUT_DIR)/project/autogen/zigbee_common_callback_dispatcher.o: autogen/zigbee_common_callback_dispatcher.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/zigbee_common_callback_dispatcher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/zigbee_common_callback_dispatcher.c
CDEPS += $(OUTPUT_DIR)/project/autogen/zigbee_common_callback_dispatcher.d
OBJS += $(OUTPUT_DIR)/project/autogen/zigbee_common_callback_dispatcher.o

$(OUTPUT_DIR)/project/autogen/zigbee_host_callback_dispatcher.o: autogen/zigbee_host_callback_dispatcher.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/zigbee_host_callback_dispatcher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/zigbee_host_callback_dispatcher.c
CDEPS += $(OUTPUT_DIR)/project/autogen/zigbee_host_callback_dispatcher.d
OBJS += $(OUTPUT_DIR)/project/autogen/zigbee_host_callback_dispatcher.o

$(OUTPUT_DIR)/project/autogen/zigbee_stack_callback_dispatcher.o: autogen/zigbee_stack_callback_dispatcher.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/zigbee_stack_callback_dispatcher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/zigbee_stack_callback_dispatcher.c
CDEPS += $(OUTPUT_DIR)/project/autogen/zigbee_stack_callback_dispatcher.d
OBJS += $(OUTPUT_DIR)/project/autogen/zigbee_stack_callback_dispatcher.o

$(OUTPUT_DIR)/project/autogen/zigbee_zcl_callback_dispatcher.o: autogen/zigbee_zcl_callback_dispatcher.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/zigbee_zcl_callback_dispatcher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/zigbee_zcl_callback_dispatcher.c
CDEPS += $(OUTPUT_DIR)/project/autogen/zigbee_zcl_callback_dispatcher.d
OBJS += $(OUTPUT_DIR)/project/autogen/zigbee_zcl_callback_dispatcher.o

$(OUTPUT_DIR)/project/main.o: main.c
	@$(POSIX_TOOL_PATH)echo 'Building main.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ main.c
CDEPS += $(OUTPUT_DIR)/project/main.d
OBJS += $(OUTPUT_DIR)/project/main.o

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=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=END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA