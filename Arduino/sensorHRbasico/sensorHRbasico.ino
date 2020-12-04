long HR;
String dataToSend;
int miliseconds;

void setup() {
  Serial.begin(9600);
  dataToSend.reserve(100);

}

void loop() {
  HR=analogRead(0);
  miliseconds=millis();
  dataToSend="HR: ";
  dataToSend+=HR;
  dataToSend+= ";ML:";
  dataToSend+=miliseconds;
  Serial.println(dataToSend);
  
  


}
