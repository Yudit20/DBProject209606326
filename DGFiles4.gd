
[General]
Version=1

[Preferences]
Username=
Password=2828
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=YOUDITH
Name=BILL
Count=400

[Record]
Name=BNUMBER
Type=NUMBER
Size=6
Data=Random(100000, 999999)
Master=

[Record]
Name=PRICE
Type=NUMBER
Size=6
Data=Random(1, 1000)
Master=

[Record]
Name=DATEOFBILL
Type=DATE
Size=
Data=Random(1/1/2023, 1/1/2050)
Master=

[Record]
Name=STOREID
Type=NUMBER
Size=3
Data=List(select storeid from pharmacy)
Master=

[Record]
Name=PID
Type=NUMBER
Size=10
Data=List(select pid from patient)
Master=

