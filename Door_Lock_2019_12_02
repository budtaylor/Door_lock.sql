def main():

    import RPi.GPIO as GPIO
    import time
    import mysql.connector
    from datetime import datetime
    from mfrc522 import SimpleMFRC522
    
    reader = SimpleMFRC522()
    try:
        id, text = reader.read()
        #print(id)

    finally:
        GPIO.cleanup()

    mydb = mysql.connector.connect(
      host="localhost",
      user="root",
      passwd="PI",
      database="Club_door"
    )

    #print(mydb)

    mycursor = mydb.cursor()

    mycursor.execute("select rfid_code from access_list")

    myresult = mycursor.fetchall()

    for row in myresult:
    #    print(row)

    #from datetime import datetime
    # datetime object containing current date and time
        now = datetime.now()
    a = now.strftime("%Y-%m-%d")
    b = now.strftime("%H:%M:%S")
    #print(a)
    RFID_ID = id
    if (RFID_ID in row):
        print ("access granted")
        mycursor = mydb.cursor()
        sql = "INSERT INTO access_log (rfid_presented, rfid_presented_date,rfid_presented_time, rfid_granted) VALUES (%s,%s,%s,%s)"
        val = (RFID_ID, a , b , "granted")
        mycursor.execute(sql, val)

        mydb.commit()

        print(mycursor.rowcount, "record inserted.")
        time.sleep(2)
        main()
    else:
        print("access denied")
        mycursor = mydb.cursor()
        sql = "INSERT INTO access_log (rfid_presented, rfid_presented_date,rfid_presented_time, rfid_granted) VALUES (%s,%s,%s,%s)"
        val = (RFID_ID, a , b , "denied")
        mycursor.execute(sql, val)

        mydb.commit()

        print(mycursor.rowcount, "record inserted.")
        time.sleep(2)
        main()
    
if __name__ == "__main__":
    main()
    
