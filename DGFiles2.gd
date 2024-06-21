
[General]
Version=1

[Preferences]
Username=
Password=2684
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=YOUDITH
Name=PATIENT
Count=10..20

[Record]
Name=PID
Type=NUMBER
Size=10
Data=Random(1000000000, 4000000000)
Master=

[Record]
Name=PATIENT_NAME
Type=VARCHAR2
Size=15
Data=FirstName + LastName
Master=

[Record]
Name=ADDRESS
Type=VARCHAR2
Size=20
Data=Address1
Master=

[Record]
Name=DATEOFBRITH
Type=DATE
Size=
Data=Random(1/1/1930, 1/1/2024)
Master=

