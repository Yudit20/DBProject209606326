
[General]
Version=1

[Preferences]
Username=
Password=2101
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=YOUDITH
Name=SELLBY
Count=400

[Record]
Name=QUANTITY
Type=NUMBER
Size=9
Data=Random(1000, 1000000)
Master=

[Record]
Name=DRUGID
Type=NUMBER
Size=5
Data=List(select drugid from medicine)
Master=

[Record]
Name=BNUMBER
Type=NUMBER
Size=6
Data=List(select bnumber from bill)
Master=

