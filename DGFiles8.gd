
[General]
Version=1

[Preferences]
Username=
Password=2264
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=YOUDITH
Name=GIVES_ORDER
Count=100

[Record]
Name=STOREID
Type=NUMBER
Size=3
Data= List(select storeid from pharmacy)
Master=

[Record]
Name=SID
Type=NUMBER
Size=7
Data=List(select sid from supplier)
Master=

