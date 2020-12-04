

int num = 50;

void setup() {
  Serial.begin(9600);
  randomSeed(analogRead(0));
  

}

void loop() {
  num=random(70, 100);
  Serial.println(num);
  delay(100);

}
