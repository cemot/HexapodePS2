#include "hexaWiFi.h"
#include "hexaServo.h"
#include "PS2X_lib.h"

int g_hexaAngle;
int g_hexaSpeed;

// Define pins used to connect the PS2 controller
#define PS2_DAT     3     //14    
#define PS2_CMD     1     //16
#define PS2_SEL     5     //7
#define PS2_CLK     4    //15


PS2X ps2x;        // create PS2 Controller Class

int error = 0; // returned status of PS2 controller connection.
// error = 0 -> everything fine, controller found and well configured
// error = 1 -> No cotroller found
// error = 2 -> controller found but not configured (rumble, analog ...)
// error = 3 -> controller not in pressure mode (may not support it)

int Lx = 127; 
int Ly = 127;
int Rx = 127;
int Ry = 127;
// Values of analog joysticks. 127 is the default position (min=0 & max=255)


void setup() 
{
  delay(2000);

  Serial.begin(115200);
  Serial.println();
  Serial.println( "Serial connexion established" );

  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, LOW); 

  error = ps2x.config_gamepad(PS2_CLK, PS2_CMD, PS2_SEL, PS2_DAT, false, false);

  if (error == 1){
    initWiFi();
    Serial.println();
    Serial.println( "No PS2 gamepad found, WiFi access point established" );
  }else{
    Serial.println("PS2 gamepad found");
  }

  g_hexaAngle = 0;
  g_hexaSpeed = 0;
  hexaServoInit();
  hexaHoming();
  delay(1000);
  
  Serial.println();
  Serial.println( "Home position set" );

  //hexaMove( 5, 0, 1, 0 );
}

void loop() 
{
  waitInstr();
}
