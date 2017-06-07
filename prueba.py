import serial, time
while True:
 arduino = serial.Serial('COM3', 9600)
 rawString = arduino.readline()
 print(rawString)
 arduino.close() 