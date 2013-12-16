#define UPPER_CASE 65
#define LOWER_CASE 97

void setup() {
  for(int i = 0; i <= 13; i++) {
    pinMode(i, OUTPUT);
  }
  Serial.begin(9600);
  Serial.print("\nSetup...");
}

void loop() {
  if (Serial.available()) {
    char c = Serial.read();
    // LOW
    if (int(c) < 97){
      digitalWrite((int(c) - UPPER_CASE), LOW);
    }
    // HIGH
    else {
      digitalWrite((int(c) - LOWER_CASE), HIGH);
    }
  }
}
