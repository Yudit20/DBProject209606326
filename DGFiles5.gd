
[General]
Version=1

[Preferences]
Username=
Password=2289
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=YOUDITH
Name=TTO
Count=400

[Record]
Name=PID
Type=NUMBER
Size=10
Data=List(select pid from patient)
Master=

[Record]
Name=DRUGID
Type=NUMBER
Size=5
Data=List(select drugid from medicine)
Master=

