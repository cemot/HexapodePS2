#include "hexaServo.h"
#include "PS2X_lib.h"


// Define pins used to connect the PS2 controller
#define PS2_DAT     14    
#define PS2_CMD     16
#define PS2_SEL     7
#define PS2_CLK     15

// SDA pin = D2 or pin 2 on a spark pro micro
// SCL pin = D3 or pin 3 on a spark pro micro


// int g_hexaAngle;
// int g_hexaSpeed;

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

double lenght = 0;
double curve = 0;
double stepSize = 0;
int height = 100;
double angle =0;

PS2X ps2x;        // create PS2 Controller Class



void setup(){

  Serial.begin(57600);
  delay(8000);
  Serial.println();
  Serial.println( "Serial connexion established" );

  error = ps2x.config_gamepad(PS2_CLK, PS2_CMD, PS2_SEL, PS2_DAT, false, false);

  if (error == 1){
    Serial.println();
    Serial.println( "No PS2 gamepad found" );
  }else{
    Serial.println("PS2 gamepad found");
  }

//  g_hexaAngle = 0;
//  g_hexaSpeed = 0;
  hexaServoInit();
  hexaHoming();
  delay(1000);
//  hexaMove( 3, 0, 1, 0 );
  Serial.println();
  Serial.println( "Home position set" );

}

void loop() {

  ps2x.read_gamepad();
//  Serial.println("inside loop");
  
if(ps2x.Button(PSB_PAD_DOWN)){
  Serial.println("PSB_PAD_DOWN pressed");
  hexaMove( -1, 0, 1, 0 );
  ps2x.read_gamepad();
  }

else if(ps2x.Button(PSB_PAD_UP)){
  Serial.println("PSB_PAD_UP pressed");
  hexaMove( 1, 0, 1, 0 );
  ps2x.read_gamepad();
  }

else if(ps2x.Button(PSB_PAD_LEFT)){
  Serial.println("PSB_PAD_LEFT pressed");
  hexaRotate( 1, 1, height );
  ps2x.read_gamepad();
  }

else if(ps2x.Button(PSB_PAD_RIGHT)){
  Serial.println("PSB_PAD_RIGHT pressed");
  hexaRotate( -1, 1, height );
  ps2x.read_gamepad();
  }  

  delay(20);  

}
