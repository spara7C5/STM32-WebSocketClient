/**
 * @file main.c
 * @brief Main routine
 *
 * @section License
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 *
 * Copyright (C) 2010-2019 Oryx Embedded SARL. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 * @author Oryx Embedded SARL (www.oryx-embedded.com)
 * @version 1.9.2
 **/



//Dependencies
#include <stdlib.h>
//#include "stm32f4xx.h"
#include "stm32f7xx_hal.h"
#include "stm32f7xx_nucleo_144.h"
#include "os_port.h"
#include "core/net.h"
#include "drivers/mac/stm32f7xx_eth_driver.h"
#include "drivers/phy/lan8742_driver.h"
#include "dhcp/dhcp_client.h"
#include "ipv6/slaac.h"
#include "web_socket/web_socket.h"
#include "rng/yarrow.h"
#include "debug.h"

//Application configuration
#define APP_MAC_ADDR "00-AB-CD-EF-04-29"

#define APP_USE_DHCP_CLIENT ENABLED
#define APP_IPV4_HOST_ADDR "192.168.0.20"
#define APP_IPV4_SUBNET_MASK "255.255.255.0"
#define APP_IPV4_DEFAULT_GATEWAY "192.168.0.254"
#define APP_IPV4_PRIMARY_DNS "8.8.8.8"
#define APP_IPV4_SECONDARY_DNS "8.8.4.4"

#define APP_USE_SLAAC ENABLED
#define APP_IPV6_LINK_LOCAL_ADDR "fe80::429"
#define APP_IPV6_PREFIX "2001:db8::"
#define APP_IPV6_PREFIX_LENGTH 64
#define APP_IPV6_GLOBAL_ADDR "2001:db8::429"
#define APP_IPV6_ROUTER "fe80::1"
#define APP_IPV6_PRIMARY_DNS "2001:4860:4860::8888"
#define APP_IPV6_SECONDARY_DNS "2001:4860:4860::8844"

//WebSocket server name
#define APP_SERVER_NAME "echo.websocket.org"

//WebSocket server port
#define APP_SERVER_PORT 80
//#define APP_SERVER_PORT 443

//URI
#define APP_SERVER_URI "/"

//Global variables
OsEvent appEvent;
bool_t buttonEventFlag;

RNG_HandleTypeDef RNG_Handle;

DhcpClientSettings dhcpClientSettings;
DhcpClientContext dhcpClientContext;
SlaacSettings slaacSettings;
SlaacContext slaacContext;
YarrowContext yarrowContext;
uint8_t seed[32];


/**
 * @brief System clock configuration
 **/

void SystemClock_Config(void)
{
   RCC_OscInitTypeDef RCC_OscInitStruct;
   RCC_ClkInitTypeDef RCC_ClkInitStruct;

   //Enable Power Control clock
   __HAL_RCC_PWR_CLK_ENABLE();

   //The voltage scaling allows optimizing the power consumption when the device is
   //clocked below the maximum system frequency, to update the voltage scaling value
   //regarding system frequency refer to product datasheet.
   __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

   //Enable HSE Oscillator and activate PLL with HSE as source
   RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
   RCC_OscInitStruct.HSEState = RCC_HSE_BYPASS;
   RCC_OscInitStruct.HSIState = RCC_HSI_OFF;
   RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
   RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
   RCC_OscInitStruct.PLL.PLLM = 8;
   RCC_OscInitStruct.PLL.PLLN = 360;
   RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
   RCC_OscInitStruct.PLL.PLLQ = 7;
   HAL_RCC_OscConfig(&RCC_OscInitStruct);

   //Enable overdrive mode
   HAL_PWREx_EnableOverDrive();

   //Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2
   //clocks dividers
   RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
   RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
   RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
   RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
   RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;
   HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5);
}


/**
 * @brief Random data generation callback function
 * @param[out] data Buffer where to store the random data
 * @param[in] length Number of bytes that are required
 * @return Error code
 **/

error_t webSocketClientRngCallback(uint8_t *data, size_t length)
{
   error_t error;

   //Generate some random data
   error = yarrowRead(&yarrowContext, data, length);
   //Return status code
   return error;
}


/**
 * @brief TLS initialization callback
 * @param[in] webSocket Handle referencing a WebSocket
 * @param[in] tlsContext Pointer to the TLS context
 * @return Error code
 **/

error_t webSocketClientTlsInitCallback(WebSocket *webSocket,
   TlsContext *tlsContext)
{
   error_t error;

   //Debug message
   TRACE_INFO("WebSocket: TLS initialization callback\r\n");

   //Set the PRNG algorithm to be used
   error = tlsSetPrng(tlsContext, YARROW_PRNG_ALGO, &yarrowContext);
   //Any error to report?
   if(error)
      return error;

   //Set the fully qualified domain name of the server
   error = tlsSetServerName(tlsContext, APP_SERVER_NAME);
   //Any error to report?
   if(error)
      return error;

#if 0
   //Import the list of trusted CA certificates
   error = tlsSetTrustedCaList(tlsContext, trustedCaList, strlen(trustedCaList));
   //Any error to report?
   if(error)
      return error;
#endif

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief WebSocket client test routine
 * @return Error code
 **/

error_t webSocketClientTest(void)
{
   error_t error;
   size_t length;
   systime_t timestamp;
   systime_t currentTime;
   WebSocket *webSocket;
   WebSocketFrameType type;
   IpAddr serverIpAddr;
   SocketEventDesc eventDesc[1];
   char_t buffer[256];

   //Debug message
   TRACE_INFO("\r\n\r\nWebSocket: Resolving server name...\r\n");

   //Resolve server name
   error = getHostByName(NULL, APP_SERVER_NAME, &serverIpAddr, 0);

   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_INFO("WebSocket: Failed to resolve server name!\r\n");
      //Exit immediately
      return error;
   }

   //Open a new WebSocket
   webSocket = webSocketOpen();
   //Failed to open WebSocket?
   if(webSocket == NULL)
      return ERROR_OPEN_FAILED;

   //Start of exception handling block
   do
   {
      //Set timeout value for blocking operations
      error = webSocketSetTimeout(webSocket, 30000);
      //Any error to report?
      if(error)
         break;

      //Set the hostname of the remote server
      error = webSocketSetHost(webSocket, APP_SERVER_NAME);
      //Any error to report?
      if(error)
         break;

#if (APP_SERVER_PORT == 443)
      //Register TLS initialization callback
      error = webSocketRegisterTlsInitCallback(webSocket,
         webSocketClientTlsInitCallback);
      //Any error to report?
      if(error)
         return error;
#endif

      //Debug message
      TRACE_INFO("\r\nWebSocket: Connecting to server...\r\n");

      //Establish the WebSocket connection
      error = webSocketConnect(webSocket, &serverIpAddr,
         APP_SERVER_PORT, APP_SERVER_URI);
      //Any error to report?
      if(error)
         break;

      //Debug message
      TRACE_INFO("WebSocket: Connected to server\r\n");

      //Format message
      length = sprintf(buffer, "Hello World!");

      //Debug message
      TRACE_INFO("WebSocket: Sending message (%" PRIuSIZE " bytes)...\r\n", length);
      TRACE_INFO("  %s\r\n", buffer);

      //Send data to the WebSocket server
      error = webSocketSend(webSocket, buffer, length,
         WS_FRAME_TYPE_BINARY, NULL);
      //Any error to report?
      if(error)
         break;

      //Save current time
      timestamp = osGetSystemTime();

      //Process events
      while(1)
      {
         //Set the events the application is interested in
         eventDesc[0].socket = webSocket->socket;
         eventDesc[0].eventMask = SOCKET_EVENT_RX_READY;

         //Check whether application data are pending in the receive buffer
         if(webSocketIsRxReady(webSocket))
         {
            //No need to poll the underlying socket for incoming traffic...
            eventDesc[0].eventFlags = SOCKET_EVENT_RX_READY;
            error = NO_ERROR;
         }
         else
         {
            //Wait for incoming traffic from the remote host. A non-infinite timeout is provided
            //to manage the idle timeout (60s). refer to the end of the loop
            error = socketPoll(eventDesc, arraysize(eventDesc), &appEvent, 1000);
         }

         //Check status code
         if(!error)
         {
            if(eventDesc[0].eventFlags & SOCKET_EVENT_RX_READY)
            {
               //Receive data from the remote WebSocket server
               error = webSocketReceive(webSocket, buffer,
                  sizeof(buffer) - 1, &type, &length);
               //Any error to report?
               if(error)
                  break;

               //Check the type of received data
               if(type == WS_FRAME_TYPE_TEXT ||
                  type == WS_FRAME_TYPE_BINARY)
               {
                  //Properly terminate the string with a NULL character
                  buffer[length] = '\0';

                  //Debug message
                  TRACE_INFO("WebSocket: Message received (%" PRIuSIZE " bytes)...\r\n", length);
                  TRACE_INFO("  %s\r\n", buffer);
               }
               else if(type == WS_FRAME_TYPE_PING)
               {
                  //Debug message
                  TRACE_INFO("WebSocket: Ping message received (%" PRIuSIZE " bytes)...\r\n", length);
                  //Debug message
                  TRACE_INFO("WebSocket: Sending pong message (%" PRIuSIZE " bytes)...\r\n", length);

                  //Send a Pong frame in response
                  error = webSocketSend(webSocket, buffer, length,
                     WS_FRAME_TYPE_PONG, NULL);
                  //Any error to report?
                  if(error)
                     break;
               }

               //Save current time
               timestamp = osGetSystemTime();
            }
         }

         //Check user button state
         if(buttonEventFlag)
         {
            //Clear flag
            buttonEventFlag = FALSE;

            //Format event message
            length = sprintf(buffer, "User button pressed!");

            //Debug message
            TRACE_INFO("WebSocket: Sending message (%" PRIuSIZE " bytes)...\r\n", length);
            TRACE_INFO("  %s\r\n", buffer);

            //Send a message to the WebSocket server
            error = webSocketSend(webSocket, buffer, length,
               WS_FRAME_TYPE_BINARY, NULL);
            //Any error to report?
            if(error)
               break;

            //Save current time
            timestamp = osGetSystemTime();
         }

         //Get current time
         currentTime = osGetSystemTime();

         //Manage idle timeout (if applicable)
         if(timeCompare(currentTime, timestamp + 60000) >= 0)
         {
            //Close WebSocket connection
            error = NO_ERROR;
            break;
         }
      }

      //Properly close the WebSocket connection
      webSocketShutdown(webSocket);

      //End of exception handling block
   } while(0);

   //Release the WebSocket
   webSocketClose(webSocket);

   //Return error code
   return error;
}


/**
 * @brief User task
 **/

void userTask(void *param)
{
   //Endless loop
   while(1)
   {
      //Wait for the user button to be pressed
      osWaitForEvent(&appEvent, INFINITE_DELAY);

      //Clear flag
      buttonEventFlag = FALSE;

      //WebSocket client test routine
      webSocketClientTest();
   }
}


/**
 * @brief Button task
 **/

void buttonTask(void *param)
{
   bool_t state = FALSE;
   bool_t prevState = FALSE;

   //Endless loop
   while(1)
   {
      //Retrieve user button state
      state = BSP_PB_GetState(BUTTON_KEY);

      //User button pressed?
      if(state && !prevState)
      {
         //Notify the WebSocket task of the event
         buttonEventFlag = TRUE;
         osSetEvent(&appEvent);
      }

      //Save current state
      prevState = state;

      //Loop delay
      osDelayTask(100);
   }
}


/**
 * @brief LED blinking task
 **/

void blinkTask(void *param)
{
   //Endless loop
   while(1)
   {
      BSP_LED_On(LED1);
      osDelayTask(100);
      BSP_LED_Off(LED1);
      osDelayTask(900);
   }
}


/**
 * @brief Main entry point
 * @return Unused value
 **/

int_t main(void)
{
   error_t error;
   uint_t i;
   uint32_t value;
   NetInterface *interface;
   OsTask *task;
   MacAddr macAddr;
#if (APP_USE_DHCP_CLIENT == DISABLED)
   Ipv4Addr ipv4Addr;
#endif
#if (APP_USE_SLAAC == DISABLED)
   Ipv6Addr ipv6Addr;
#endif

   //HAL library initialization
   HAL_Init();
   //Configure the system clock
   SystemClock_Config();

   //Initialize kernel
   osInitKernel();
   //Configure debug UART
   //debugInit(115200);

   //Start-up message
   TRACE_INFO("\r\n");
   TRACE_INFO("****************************************\r\n");
   TRACE_INFO("*** CycloneTCP WebSocket Client Demo ***\r\n");
   TRACE_INFO("****************************************\r\n");
   TRACE_INFO("Copyright: 2010-2019 Oryx Embedded SARL\r\n");
   TRACE_INFO("Compiled: %s %s\r\n", __DATE__, __TIME__);
   TRACE_INFO("Target: STM32F429\r\n");
   TRACE_INFO("\r\n");

   //LED configuration
   BSP_LED_Init(LED1);
   BSP_LED_Init(LED2);
   BSP_LED_Init(LED3);

   //Clear LEDs
   BSP_LED_Off(LED1);
   BSP_LED_Off(LED2);
   BSP_LED_Off(LED3);

   //Initialize user button
   BSP_PB_Init(BUTTON_KEY, BUTTON_MODE_GPIO);

   //Enable RNG peripheral clock
   __HAL_RCC_RNG_CLK_ENABLE();
   //Initialize RNG
   RNG_Handle.Instance = RNG;
   HAL_RNG_Init(&RNG_Handle);

   //Generate a random seed
   for(i = 0; i < 32; i += 4)
   {
      //Get 32-bit random value
      HAL_RNG_GenerateRandomNumber(&RNG_Handle, &value);

      //Copy random value
      seed[i] = value & 0xFF;
      seed[i + 1] = (value >> 8) & 0xFF;
      seed[i + 2] = (value >> 16) & 0xFF;
      seed[i + 3] = (value >> 24) & 0xFF;
   }

   //PRNG initialization
   error = yarrowInit(&yarrowContext);
   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to initialize PRNG!\r\n");
   }

   //Properly seed the PRNG
   error = yarrowSeed(&yarrowContext, seed, sizeof(seed));
   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to seed PRNG!\r\n");
   }

   //TCP/IP stack initialization
   error = netInit();
   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to initialize TCP/IP stack!\r\n");
   }

   //Configure the first Ethernet interface
   interface = &netInterface[0];

   //Set interface name
   netSetInterfaceName(interface, "eth0");
   //Set host name
   netSetHostname(interface, "WebSocketClientDemo");
   //Select the relevant network adapter
   netSetDriver(interface, &stm32f7xxEthDriver);
   netSetPhyDriver(interface, &lan8742PhyDriver);
   //Set host MAC address
   macStringToAddr(APP_MAC_ADDR, &macAddr);
   netSetMacAddr(interface, &macAddr);

   //Initialize network interface
   error = netConfigInterface(interface);
   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to configure interface %s!\r\n", interface->name);
   }

#if (IPV4_SUPPORT == ENABLED)
#if (APP_USE_DHCP_CLIENT == ENABLED)
   //Get default settings
   dhcpClientGetDefaultSettings(&dhcpClientSettings);
   //Set the network interface to be configured by DHCP
   dhcpClientSettings.interface = interface;
   //Disable rapid commit option
   dhcpClientSettings.rapidCommit = FALSE;

   //DHCP client initialization
   error = dhcpClientInit(&dhcpClientContext, &dhcpClientSettings);
   //Failed to initialize DHCP client?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to initialize DHCP client!\r\n");
   }

   //Start DHCP client
   error = dhcpClientStart(&dhcpClientContext);
   //Failed to start DHCP client?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to start DHCP client!\r\n");
   }
#else
   //Set IPv4 host address
   ipv4StringToAddr(APP_IPV4_HOST_ADDR, &ipv4Addr);
   ipv4SetHostAddr(interface, ipv4Addr);

   //Set subnet mask
   ipv4StringToAddr(APP_IPV4_SUBNET_MASK, &ipv4Addr);
   ipv4SetSubnetMask(interface, ipv4Addr);

   //Set default gateway
   ipv4StringToAddr(APP_IPV4_DEFAULT_GATEWAY, &ipv4Addr);
   ipv4SetDefaultGateway(interface, ipv4Addr);

   //Set primary and secondary DNS servers
   ipv4StringToAddr(APP_IPV4_PRIMARY_DNS, &ipv4Addr);
   ipv4SetDnsServer(interface, 0, ipv4Addr);
   ipv4StringToAddr(APP_IPV4_SECONDARY_DNS, &ipv4Addr);
   ipv4SetDnsServer(interface, 1, ipv4Addr);
#endif
#endif

#if (IPV6_SUPPORT == ENABLED)
#if (APP_USE_SLAAC == ENABLED)
   //Get default settings
   slaacGetDefaultSettings(&slaacSettings);
   //Set the network interface to be configured
   slaacSettings.interface = interface;

   //SLAAC initialization
   error = slaacInit(&slaacContext, &slaacSettings);
   //Failed to initialize SLAAC?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to initialize SLAAC!\r\n");
   }

   //Start IPv6 address autoconfiguration process
   error = slaacStart(&slaacContext);
   //Failed to start SLAAC process?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to start SLAAC!\r\n");
   }
#else
   //Set link-local address
   ipv6StringToAddr(APP_IPV6_LINK_LOCAL_ADDR, &ipv6Addr);
   ipv6SetLinkLocalAddr(interface, &ipv6Addr);

   //Set IPv6 prefix
   ipv6StringToAddr(APP_IPV6_PREFIX, &ipv6Addr);
   ipv6SetPrefix(interface, 0, &ipv6Addr, APP_IPV6_PREFIX_LENGTH);

   //Set global address
   ipv6StringToAddr(APP_IPV6_GLOBAL_ADDR, &ipv6Addr);
   ipv6SetGlobalAddr(interface, 0, &ipv6Addr);

   //Set default router
   ipv6StringToAddr(APP_IPV6_ROUTER, &ipv6Addr);
   ipv6SetDefaultRouter(interface, 0, &ipv6Addr);

   //Set primary and secondary DNS servers
   ipv6StringToAddr(APP_IPV6_PRIMARY_DNS, &ipv6Addr);
   ipv6SetDnsServer(interface, 0, &ipv6Addr);
   ipv6StringToAddr(APP_IPV6_SECONDARY_DNS, &ipv6Addr);
   ipv6SetDnsServer(interface, 1, &ipv6Addr);
#endif
#endif

   //Register RNG callback
   webSocketRegisterRandCallback(webSocketClientRngCallback);

   //Create an event object
   if(!osCreateEvent(&appEvent))
   {
      //Debug message
      TRACE_ERROR("Failed to create event!\r\n");
   }

   //Create user task
   task = osCreateTask("User Task", userTask, NULL, 500, OS_TASK_PRIORITY_NORMAL);
   //Failed to create the task?
   if(task == OS_INVALID_HANDLE)
   {
      //Debug message
      TRACE_ERROR("Failed to create task!\r\n");
   }

   //Create a task to manage button events
   task = osCreateTask("Button", buttonTask, NULL, 500, OS_TASK_PRIORITY_NORMAL);
   //Failed to create the task?
   if(task == OS_INVALID_HANDLE)
   {
      //Debug message
      TRACE_ERROR("Failed to create task!\r\n");
   }

   //Create a task to blink the LED
   task = osCreateTask("Blink", blinkTask, NULL, 500, OS_TASK_PRIORITY_NORMAL);
   //Failed to create the task?
   if(task == OS_INVALID_HANDLE)
   {
      //Debug message
      TRACE_ERROR("Failed to create task!\r\n");
   }

   //Start the execution of tasks
   osStartKernel();

   //This function should never return
   return 0;
}
