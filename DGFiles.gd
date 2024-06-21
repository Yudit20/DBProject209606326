
[General]
Version=1

[Preferences]
Username=
Password=2163
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=YOUDITH
Name=EMPLOYEE
Count=400

[Record]
Name=EID
Type=NUMBER
Size=10
Data=Random(1000000000, 4000000000)
Master=

[Record]
Name=NAME
Type=VARCHAR2
Size=15
Data=FirstName  + LastName
Master=

[Record]
Name=SALARY
Type=NUMBER
Size=10
Data=Random(1000, 50000)
Master=

[Record]
Name=STOREID
Type=NUMBER
Size=3
Data=List(select storeid from pharmacy)
Master=

