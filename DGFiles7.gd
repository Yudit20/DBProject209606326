
[General]
Version=1

[Preferences]
Username=
Password=2863
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=YOUDITH
Name=SUPPLIE
Count=10..20

[Record]
Name=DRUGID
Type=NUMBER
Size=5
Data=List(select drugid from medicine)
Master=

[Record]
Name=SID
Type=NUMBER
Size=7
Data=List(select sid from supplier)
Master=

