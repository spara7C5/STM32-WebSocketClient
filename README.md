# STM32-NUCLEO WEB SOCKET CLIENT

 - **API Library:** CycloneTCP by [Oryx-Embedded](https://www.oryx-embedded.com/#&panel1-2) . All the used sources are contained in the *my_web_socket* folder and the corresponding head folder
 - **IDE:** editing with STM32CubeIDE v.1.0.1 is strongly recommended, which is the code generator used for the general initialization and maintenance of the firmware. *ATTENTION: main.c file has not been created by the IOC, but imported from the demo provided by ......., therefore  the main.c file which should be backupped and overwritten after every the re-generation* 
 - **BOARD:** STM32-NUCLEOF746ZG which is an ST eval board with STM32F4-series MCU and ETHERNET peripheral 

## Quick Test

 1. Set the 3 macros  APP_SERVER_NAME, APP_SERVER_PORT, APP_SERVER_URI of your Web Socket Server. If you don't yet have one, use respectively {"echo.websocket.org", 80, "/"}
 2. connect to the serial port to follow the debugging
 3. press the user button to start a connection

 
