prompt PL/SQL Developer import file
prompt Created on יום חמישי 20 יוני 2024 by smile
set feedback off
set define off
prompt Creating PATIENT...
create table PATIENT
(
  pid          NUMBER(10) not null,
  patient_name VARCHAR2(15) not null,
  address      VARCHAR2(20) not null,
  dateofbrith  DATE not null
)
;
alter table PATIENT
  add primary key (PID);

prompt Creating PHARMACY...
create table PHARMACY
(
  storeid   NUMBER(3) not null,
  storename VARCHAR2(15) not null,
  city      VARCHAR2(10) not null
)
;
alter table PHARMACY
  add primary key (STOREID);

prompt Creating BILL...
create table BILL
(
  bnumber    NUMBER(6) not null,
  price      NUMBER(6) not null,
  dateofbill DATE not null,
  storeid    NUMBER(3) not null,
  pid        NUMBER(10) not null
)
;
alter table BILL
  add primary key (BNUMBER);
alter table BILL
  add foreign key (STOREID)
  references PHARMACY (STOREID);
alter table BILL
  add foreign key (PID)
  references PATIENT (PID);

prompt Creating EMPLOYEE...
create table EMPLOYEE
(
  eid     NUMBER(10) not null,
  name    VARCHAR2(15) not null,
  salary  NUMBER(10) not null,
  storeid NUMBER(3) not null
)
;
alter table EMPLOYEE
  add primary key (EID);
alter table EMPLOYEE
  add foreign key (STOREID)
  references PHARMACY (STOREID);

prompt Creating SUPPLIER...
create table SUPPLIER
(
  sid  NUMBER(7) not null,
  name VARCHAR2(15) not null,
  city VARCHAR2(10) not null
)
;
alter table SUPPLIER
  add primary key (SID);

prompt Creating GIVES_ORDER...
create table GIVES_ORDER
(
  storeid NUMBER(3) not null,
  sid     NUMBER(7) not null
)
;
alter table GIVES_ORDER
  add primary key (STOREID, SID);
alter table GIVES_ORDER
  add foreign key (STOREID)
  references PHARMACY (STOREID);
alter table GIVES_ORDER
  add foreign key (SID)
  references SUPPLIER (SID);

prompt Creating MEDICINE...
create table MEDICINE
(
  drugid   NUMBER(5) not null,
  price    NUMBER(10) not null,
  quantity NUMBER(15) not null
)
;
alter table MEDICINE
  add primary key (DRUGID);

prompt Creating SELLBY...
create table SELLBY
(
  quantity NUMBER(9) not null,
  drugid   NUMBER(5) not null,
  bnumber  NUMBER(6) not null
)
;
alter table SELLBY
  add primary key (DRUGID, BNUMBER);
alter table SELLBY
  add foreign key (DRUGID)
  references MEDICINE (DRUGID);
alter table SELLBY
  add foreign key (BNUMBER)
  references BILL (BNUMBER);

prompt Creating SUPPLIE...
create table SUPPLIE
(
  drugid NUMBER(5) not null,
  sid    NUMBER(7) not null
)
;
alter table SUPPLIE
  add primary key (DRUGID, SID);
alter table SUPPLIE
  add foreign key (DRUGID)
  references MEDICINE (DRUGID);
alter table SUPPLIE
  add foreign key (SID)
  references SUPPLIER (SID);

prompt Creating TTO...
create table TTO
(
  pid    NUMBER(10) not null,
  drugid NUMBER(5) not null
)
;
alter table TTO
  add primary key (PID, DRUGID);
alter table TTO
  add foreign key (PID)
  references PATIENT (PID);
alter table TTO
  add foreign key (DRUGID)
  references MEDICINE (DRUGID);

prompt Disabling triggers for PATIENT...
alter table PATIENT disable all triggers;
prompt Disabling triggers for PHARMACY...
alter table PHARMACY disable all triggers;
prompt Disabling triggers for BILL...
alter table BILL disable all triggers;
prompt Disabling triggers for EMPLOYEE...
alter table EMPLOYEE disable all triggers;
prompt Disabling triggers for SUPPLIER...
alter table SUPPLIER disable all triggers;
prompt Disabling triggers for GIVES_ORDER...
alter table GIVES_ORDER disable all triggers;
prompt Disabling triggers for MEDICINE...
alter table MEDICINE disable all triggers;
prompt Disabling triggers for SELLBY...
alter table SELLBY disable all triggers;
prompt Disabling triggers for SUPPLIE...
alter table SUPPLIE disable all triggers;
prompt Disabling triggers for TTO...
alter table TTO disable all triggers;
prompt Disabling foreign key constraints for BILL...
alter table BILL disable constraint SYS_C007030;
alter table BILL disable constraint SYS_C007031;
prompt Disabling foreign key constraints for EMPLOYEE...
alter table EMPLOYEE disable constraint SYS_C007053;
prompt Disabling foreign key constraints for GIVES_ORDER...
alter table GIVES_ORDER disable constraint SYS_C007035;
alter table GIVES_ORDER disable constraint SYS_C007036;
prompt Disabling foreign key constraints for SELLBY...
alter table SELLBY disable constraint SYS_C007041;
alter table SELLBY disable constraint SYS_C007042;
prompt Disabling foreign key constraints for SUPPLIE...
alter table SUPPLIE disable constraint SYS_C007046;
alter table SUPPLIE disable constraint SYS_C007047;
prompt Disabling foreign key constraints for TTO...
alter table TTO disable constraint SYS_C007057;
alter table TTO disable constraint SYS_C007058;
prompt Deleting TTO...
delete from TTO;
commit;
prompt Deleting SUPPLIE...
delete from SUPPLIE;
commit;
prompt Deleting SELLBY...
delete from SELLBY;
commit;
prompt Deleting MEDICINE...
delete from MEDICINE;
commit;
prompt Deleting GIVES_ORDER...
delete from GIVES_ORDER;
commit;
prompt Deleting SUPPLIER...
delete from SUPPLIER;
commit;
prompt Deleting EMPLOYEE...
delete from EMPLOYEE;
commit;
prompt Deleting BILL...
delete from BILL;
commit;
prompt Deleting PHARMACY...
delete from PHARMACY;
commit;
prompt Deleting PATIENT...
delete from PATIENT;
commit;
prompt Loading PATIENT...
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6025742164, 'Gordon-Wilkinso', '37 Jessee Road', to_date('05-07-1980', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6318780067, 'Rip-Tanon', '41st Street', to_date('10-07-2011', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5533642121, 'Linda-Sledge', '48 Odense Road', to_date('11-01-2014', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1644618977, 'Shannon-Waits', '56 Valencia', to_date('08-11-1968', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2047588709, 'Taryn-Quinones', '81 Kenneth Street', to_date('08-04-1938', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (373692283, 'Patty-Chandler', '63 Dorval Ave', to_date('17-09-2020', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4900687356, 'Marina-Sutherla', '6 Vanderbijlpark Dri', to_date('04-05-1979', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4612065585, 'Lindsay-Squier', '3 Lithgow Street', to_date('03-01-1958', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1604229643, 'Howard-Saucedo', '14 Hyderabad Street', to_date('09-10-2008', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5592693128, 'Spike-Lewis', '99 Cambridge Road', to_date('11-10-1998', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3031691720, 'Chet-Bradford', '61st Street', to_date('08-09-2001', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9212221324, 'Jimmy-Marie', '41st Street', to_date('16-01-2004', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1836070159, 'Annette-Remar', '28 Swarthmore', to_date('15-04-2005', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7070212424, 'Terence-Hackman', '66 Olsztyn Road', to_date('10-08-1992', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3442663267, 'Lena-Costa', '67 Ruiz Ave', to_date('05-09-1995', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5884006982, 'Clint-Kudrow', '285 Pride Street', to_date('15-04-1990', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4509200447, 'Deborah-Craven', '2 Portland Blvd', to_date('25-01-1936', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4661048963, 'Rory-Cube', '55 Greene Street', to_date('01-08-1989', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9848575927, 'Jason-LaSalle', '50 Holliday Blvd', to_date('08-12-1935', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9468928764, 'Val-Gugino', '83 Stowe Blvd', to_date('10-10-1996', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7284974071, 'Ralph-Hamilton', '3 Sant Cugat Del Val', to_date('26-07-1958', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1922378266, 'Eddie-Janssen', '100 Catherine Road', to_date('12-01-1996', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4336436296, 'Dionne-Judd', '92nd Street', to_date('30-09-2004', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8979156202, 'Jonathan-Robert', '57 Robbie Blvd', to_date('23-01-1985', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2343422446, 'Mira-Coverdale', '86 Kane', to_date('10-03-2005', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3257029065, 'Rita-Presley', '42 Stigers', to_date('06-09-1952', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2953780050, 'Sam-Carlyle', '403 Glenn Road', to_date('01-06-2022', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2271311859, 'Steven-Idol', '19 Joaquin Ave', to_date('23-11-1949', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8990139674, 'Glenn-Linney', '82 Berkley Street', to_date('21-09-1941', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (172248999, 'Loreena-Cervine', '267 Burt Road', to_date('29-05-1939', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2927351525, 'Adina-Saxon', '26 Bergara Street', to_date('05-03-1975', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7561109888, 'Frederic-Isaak', '2 Holbrook Road', to_date('14-05-2018', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (521482542, 'Wesley-Carradin', '16 Mollard', to_date('25-04-2003', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5035724378, 'Cameron-Pollak', '10 Gothenburg', to_date('23-09-1996', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8138460763, 'Betty-Harper', '94 Nuernberg Drive', to_date('20-07-1989', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6247983949, 'Belinda-Wincott', '67 Gracie Street', to_date('11-06-1981', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8545852239, 'Thomas-Supernaw', '74 Lloyd Street', to_date('07-02-1962', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6497909335, 'Nikki-Mraz', '44 McGowan Road', to_date('14-12-1979', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1856035072, 'Eddie-McDormand', '8 Haysbert Road', to_date('26-10-2018', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8845951750, 'Shirley-O''Neill', '33 Luzern Road', to_date('27-08-1937', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6327076733, 'Aimee-Kenoly', '307 Scaggs Ave', to_date('31-01-2005', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7382423346, 'Dustin-Kadison', '71 Nina Blvd', to_date('08-01-1985', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5870868398, 'Milla-Mohr', '43rd Street', to_date('09-03-2019', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1274564220, 'Eliza-Hatfield', '75 Joe Road', to_date('27-03-1960', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5490097346, 'Zooey-Roberts', '624 Holden Ave', to_date('03-04-1978', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6961316508, 'Kris-Stuermer', '33 Aberdeen Road', to_date('14-11-1952', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4317483961, 'Kevn-Craven', '12 Fraser Road', to_date('02-06-1937', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1269139529, 'Kazem-Baldwin', '22 Tinsley Street', to_date('13-06-2012', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6764517788, 'Fionnula-Murdoc', '58 Zellweger Road', to_date('04-12-1968', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8474693670, 'Lesley-Vaughan', '50 Miami Ave', to_date('18-04-2013', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3708287488, 'Devon-Crow', '11 LaBelle', to_date('14-11-1996', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3084039709, 'Minnie-Bosco', '266 Redgrave', to_date('09-10-2017', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5422763853, 'Aida-Womack', '79 Ryan Drive', to_date('25-02-1974', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (843322921, 'Al-Warburton', '5 Arjona Street', to_date('03-02-1976', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5391125934, 'Boz-O''Donnell', '18 Isabella Road', to_date('01-02-1984', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1104622457, 'Kenny-Thorton', '78 Rick Street', to_date('08-09-1933', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6035643326, 'Kasey-Webb', '63 Short Blvd', to_date('15-12-2000', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (703633799, 'Kyle-Ruiz', '81st Street', to_date('20-10-2017', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7835846059, 'Ahmad-Lillard', '33 Loggins', to_date('27-06-2019', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1429548089, 'Mac-Spacek', '586 Aiken Drive', to_date('19-11-1968', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8539201788, 'Cameron-Giannin', '55 Ilmenau', to_date('18-10-1949', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4975530050, 'Ian-Chestnut', '10 Bonnie Street', to_date('11-05-1979', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8708103371, 'Azucar-Colton', '16 Foxx Drive', to_date('22-06-2018', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4407187171, 'Max-Jay', '81 Ron Road', to_date('20-12-1949', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7049782054, 'Illeana-Spector', '43rd Street', to_date('13-11-1968', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5329756834, 'Sara-Burton', '30 Voight Drive', to_date('06-12-2001', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4392118107, 'Deborah-Curtis', '75 Brad Blvd', to_date('03-11-1980', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1829061380, 'Nina-Kutcher', '21 Stellan Drive', to_date('15-02-1973', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1345713977, 'Graham-Gallant', '96 Costner Street', to_date('20-09-1960', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9381035052, 'Kenneth-Hedaya', '12 Ipswich', to_date('05-01-1970', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1552557814, 'Sophie-Leto', '763 Mathis Street', to_date('13-06-1964', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2467763074, 'Howard-Ferrer', '76 Hirsch Drive', to_date('14-02-1991', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3020101695, 'Avril-Clayton', '346 Santa Rosa Stree', to_date('03-09-1930', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4838401081, 'Andy-Braugher', '88 Friedrichshafe St', to_date('26-04-1988', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9975392474, 'Jackie-Paltrow', '55 Kazem Road', to_date('18-07-1954', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8356647322, 'Kazem-Bacon', '73 Stans Road', to_date('23-12-1939', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7011682680, 'Robbie-Banderas', '21 Lionel Road', to_date('02-02-2023', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3708576324, 'Rodney-Rhys-Dav', '46 Stallone Road', to_date('17-12-1956', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8256498531, 'Rowan-Adams', '85 Xander Drive', to_date('13-07-2002', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9446174490, 'Pam-Mazzello', '780 Horace Road', to_date('20-11-1937', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3743423055, 'Morgan-Burke', '100 Sam Street', to_date('14-09-2000', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8526093833, 'Wayne-Mohr', '40 Weisz Street', to_date('20-11-1956', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4151932660, 'Quentin-Kier', '22 Roma Street', to_date('28-04-1965', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9204951901, 'Boyd-Scott', '49 Lydia Street', to_date('07-08-1942', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6424162884, 'Delbert-McKean', '98 Reynolds Road', to_date('11-06-1957', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8830742155, 'Holland-Applega', '5 Gaynor Street', to_date('27-05-2006', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8207661585, 'Remy-Moriarty', '36 Flemyng Road', to_date('24-01-1991', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7297724925, 'Trick-Phillips', '61 Loggia Street', to_date('14-07-1952', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6279580699, 'Marlon-Caine', '539 France Road', to_date('28-03-2000', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7000499914, 'Jennifer-Rollin', '11 Rocklin', to_date('13-05-2009', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4641166074, 'Tracy-Garr', '78 Brooke Street', to_date('20-06-1943', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8059277411, 'Jann-Tucker', '444 Mulroney Drive', to_date('04-02-1990', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5564663022, 'Gord-Phillippe', '12nd Street', to_date('20-04-1944', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (639619382, 'Christopher-Qua', '48 Allen Street', to_date('12-07-1961', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5143553497, 'Alicia-Clarkson', '589 Nelligan Street', to_date('25-05-2006', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6103573424, 'Sheryl-Mellenca', '42 Evett Street', to_date('21-04-2001', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5318875563, 'Debi-Domino', '35 Flower mound Road', to_date('02-10-2021', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3706544751, 'Pierce-Lyonne', '93rd Street', to_date('07-10-1962', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4965599852, 'Carole-Keen', '75 Buffalo Street', to_date('30-12-1973', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4308191271, 'Drew-Minogue', '96 South Jordan Road', to_date('23-11-2005', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3358768759, 'Janeane-Leachma', '20 Reinhold Blvd', to_date('09-02-2020', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2821653724, 'Eugene-Grant', '10 Lindley', to_date('15-09-1986', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4922707538, 'Keanu-LuPone', '24 Concordville Blvd', to_date('20-03-1966', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5841848520, 'Milla-Walsh', '68 Rollins Ave', to_date('22-07-1969', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3888642500, 'Lou-Ticotin', '44 Miles Road', to_date('01-04-1938', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1076007260, 'Raul-Leachman', '14 Brenda Road', to_date('06-11-2000', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6421044455, 'Nancy-Goodall', '73 Matsuyama Street', to_date('01-10-1981', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5115289455, 'Harry-Sweet', '11st Street', to_date('02-07-1974', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4678571025, 'Tony-Cheadle', '47 Elizabeth Street', to_date('06-10-1983', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (212827548, 'Jonathan-Rickle', '82 Harriet Road', to_date('22-02-1981', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6277623611, 'Aidan-Hawn', '67 David Street', to_date('20-11-1958', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4514004107, 'Sandra-Bedelia', '59 Lennix Drive', to_date('11-09-1985', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6020769591, 'Mary Beth-Swayz', '71 Frost Street', to_date('12-10-1963', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6353653573, 'Rufus-Isaacs', '410 Rodgers Road', to_date('10-04-1997', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9871899056, 'Alana-Teng', '93 Rowan', to_date('12-04-2015', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3025439079, 'Denise-Newton', '779 Foster Drive', to_date('08-01-2004', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6877448138, 'Jean-Claude-McN', '70 Aachen Street', to_date('27-04-1967', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2981628154, 'Susan-Sewell', '92nd Street', to_date('05-01-1978', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3639001138, 'Vern-Idol', '5 Charlottesville Ro', to_date('21-03-1970', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6887107674, 'Pat-Simpson', '41 Marisa Blvd', to_date('19-02-1965', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7731112860, 'Tyrone-Aaron', '53rd Street', to_date('15-08-2005', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4360054358, 'Terri-Rucker', '43 Jacksonville Stre', to_date('06-08-2021', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (212699107, 'Rosanna-Price', '13 Brendan', to_date('18-05-1960', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8937574295, 'Wallace-Foxx', '41 Merrilee Ave', to_date('06-10-1994', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (740950024, 'Jet-Farina', '87 Albuquerque Road', to_date('27-03-1970', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9314314378, 'Buddy-Ontiveros', '750 Ripley Road', to_date('28-07-2008', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7390411885, 'Joey-Close', '83 Freeman Road', to_date('30-10-2008', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5700714576, 'Miguel-Esposito', '60 Flanagan Drive', to_date('19-12-1948', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3056878154, 'Marianne-Carrey', '45 Hong Road', to_date('06-02-1938', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2735238490, 'Heath-Winstone', '71 Isaacs Drive', to_date('19-05-1993', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4629513374, 'Nastassja-Hughe', '2 Finn Ave', to_date('16-12-1969', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5584619262, 'Gord-Phifer', '47 Rodney Blvd', to_date('11-03-2010', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5279512177, 'Ruth-Bradford', '82 Murdock Drive', to_date('06-05-2018', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3248934905, 'Scarlett-Mathes', '82 McKellen Ave', to_date('28-02-1988', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5742778109, 'Gary-Secada', '59 Rosario Street', to_date('21-05-2012', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3777652537, 'Rueben-Strong', '54 Yucca Drive', to_date('10-09-1945', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2789500674, 'Harold-Armstron', '91 Molina Blvd', to_date('10-05-2019', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9320439468, 'Annette-Nunn', '99 Terence Street', to_date('10-10-1986', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9641396931, 'Ronnie-Field', '98 Lindo Street', to_date('10-09-1968', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8112612344, 'Elle-Thewlis', '68 Fairfax Drive', to_date('14-03-1995', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8651731770, 'Roscoe-Lewin', '59 Brooke Blvd', to_date('03-05-1946', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7086312432, 'Garland-LaSalle', '29 Bergen Ave', to_date('15-06-1952', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8070039342, 'Alec-Church', '41 Englund Ave', to_date('12-07-2011', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6510397190, 'Christopher-Sta', '27 Sorvino Drive', to_date('28-07-1983', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1898843372, 'Faye-Darren', '406 Danny', to_date('10-05-1937', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5361345688, 'Domingo-Creek', '93 Clooney Street', to_date('30-07-2011', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6671994328, 'Emilio-Greenwoo', '328 Omaha Street', to_date('06-03-2008', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6234157747, 'Ted-Bergen', '11 Tony Road', to_date('10-01-1952', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5104495722, 'Alan-Mazar', '52 Miriam Road', to_date('05-09-2014', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8681685771, 'Pam-Chilton', '10 Avalon Drive', to_date('23-03-1955', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5978741279, 'Samuel-Sample', '433 Chet Street', to_date('06-10-1978', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5690600610, 'Dan-Mazar', '74 Jovovich Road', to_date('07-03-1963', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6394088045, 'Chet-Oates', '23rd Street', to_date('04-06-2005', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3530749047, 'Juan-Ellis', '30 Ontiveros Drive', to_date('06-06-1960', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (219326619, 'Jill-Diggs', '52 Streep Street', to_date('04-10-1984', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2517564274, 'Alan-Doucette', '79 Van Shelton Ave', to_date('08-07-2012', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5057367462, 'Trace-McKean', '42 Zappacosta Drive', to_date('04-01-1965', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8021301465, 'Lizzy-Apple', '38 Barry Road', to_date('02-04-2022', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9905682357, 'Horace-McDowell', '76 Adler Blvd', to_date('23-08-1987', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9766392805, 'Ivan-Eat World', '67 Austin', to_date('20-11-1957', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2662293293, 'Miko-Cochran', '22nd Street', to_date('18-12-1933', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6678056203, 'Vendetta-Peters', '2 Tippe Road', to_date('14-10-2003', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7240786121, 'Spencer-Epps', '53 Hartnett Road', to_date('11-12-2001', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1456298872, 'Charles-Getty', '54 Hampton Road', to_date('28-04-1952', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5202228331, 'Nora-Cleese', '166 Culkin Street', to_date('30-06-1935', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6866772535, 'Chely-Vince', '40 Dortmund Road', to_date('09-02-2013', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8945799879, 'Burt-Horton', '95 Eschen Road', to_date('12-03-1949', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8502576758, 'Madeleine-Marie', '33rd Street', to_date('11-01-1987', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6818851312, 'Gena-Devine', '81 Chapel hill Road', to_date('20-10-1968', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7905189956, 'Gil-Craddock', '92 Eder Road', to_date('09-04-1937', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9879304548, 'Mindy-Trevino', '25 Lerner Street', to_date('22-06-1992', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1083219406, 'Barbara-Chappel', '15 Leoni Street', to_date('12-05-1994', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5971262842, 'Sissy-Farina', '90 Kirsten Ave', to_date('23-05-1942', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9264429377, 'Corey-Barrymore', '1 Fred Road', to_date('11-05-1941', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7380723326, 'Gates-Withers', '38 Zwolle Blvd', to_date('17-02-1999', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9884275096, 'Boz-Abraham', '93 Kobe Road', to_date('24-09-1930', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5265068140, 'Sydney-Borgnine', '34 Lindo Street', to_date('08-04-1981', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6424162586, 'Max-Hiatt', '5 Charles Street', to_date('16-04-1936', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2567482072, 'Todd-Ferry', '53 Emmerich Street', to_date('23-02-1931', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (230410821, 'Wendy-Santa Ros', '59 Lillard', to_date('28-08-1948', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4388188284, 'Greg-Sweet', '34 Pompton Plains', to_date('14-04-1933', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (369295952, 'Bernard-Black', '87 Woodward Drive', to_date('26-05-1977', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5625721562, 'Queen-Roy Parne', '275 Holland Street', to_date('10-06-1991', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7476312288, 'Mika-Latifah', '21st Street', to_date('05-04-1970', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2809844485, 'Natacha-Willis', '59 Baarn Blvd', to_date('16-06-1987', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (458066578, 'Janice-Union', '89 Chet Street', to_date('01-09-1992', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6379005510, 'Tobey-Vassar', '48 First Drive', to_date('13-03-1932', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7556618124, 'Fats-Jovovich', '40 Bangalore Road', to_date('20-07-1971', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4753068570, 'Isaac-Hawkins', '731 Parma Blvd', to_date('09-01-1962', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8264790857, 'Earl-Stone', '541 Alice', to_date('24-12-1931', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3264685273, 'Minnie-Patillo', '896 Oakenfold Road', to_date('30-06-2012', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5720212740, 'Chely-Teng', '72 Murray Road', to_date('31-10-1981', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9682317030, 'Val-Delta', '32nd Street', to_date('06-01-1939', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4761725816, 'Deborah-Thomson', '40 Kudrow Road', to_date('20-07-2006', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1516879347, 'Maceo-Raye', '22nd Street', to_date('05-03-1987', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7849934606, 'Boz-Borden', '7 Coverdale Street', to_date('22-02-1989', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6339273345, 'Miko-Cockburn', '59 Sedaka Blvd', to_date('14-01-1981', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1651848051, 'Etta-Boothe', '73 Moorer Street', to_date('05-04-1971', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1970231371, 'Donna-Theron', '99 Belp Road', to_date('17-02-1990', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6859944183, 'Pam-Posener', '68 Stiers Road', to_date('08-08-1950', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6203363312, 'Natalie-Evans', '509 San Jose Drive', to_date('20-08-1964', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6338789082, 'Heath-LaSalle', '68 Gano Street', to_date('15-08-2022', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8458883351, 'Jean-Luc-Reeves', '94 Armin Drive', to_date('28-01-1967', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9153791779, 'Gloria-Makowicz', '200 Damon', to_date('10-06-1935', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4259075590, 'Gilbert-DeLuise', '11 Burmester', to_date('29-12-1987', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3367922444, 'Thin-Rubinek', '96 Roanoke Road', to_date('13-05-1986', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3001656492, 'Beverley-Diggs', '82 Chazz Ave', to_date('02-12-1958', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2285140096, 'Mekhi-Orbit', '78 McGowan Ave', to_date('06-09-1964', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5033656295, 'Buffy-Trippleho', '3 Wiedlin Street', to_date('25-06-1938', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3590028638, 'Danny-Ronstadt', '46 Hong Kong Blvd', to_date('27-07-1941', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1706805805, 'Edie-Payne', '13 Heald', to_date('10-05-1950', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1119964055, 'Rueben-Pearce', '43 Isaac Street', to_date('02-09-1961', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7819480527, 'Solomon-Candy', '743 Gin Blvd', to_date('28-07-1963', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4902625897, 'Harris-Black', '3 Belo Horizonte Roa', to_date('20-10-1943', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9129954935, 'Tony-Rhymes', '21 Charlie Road', to_date('17-10-1993', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (13924923, 'Garry-Potter', '99 Stanton Blvd', to_date('03-02-1938', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3460471591, 'Rod-Dutton', '6 Tzi Ave', to_date('23-04-1959', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5848893051, 'Udo-Dalton', '17 Latin Road', to_date('02-08-1954', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (938051956, 'Kenny-Elizabeth', '707 Nelson Road', to_date('19-11-2023', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8399170118, 'Fionnula-Winans', '68 Martinez Road', to_date('26-03-1939', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5836406483, 'Carrie-Anne-Mel', '83 Everett Road', to_date('28-12-1934', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7697076019, 'Yolanda-Schock', '87 Hunt', to_date('17-02-2000', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8240549176, 'Aidan-Pastore', '22nd Street', to_date('25-12-1976', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3469440964, 'Trini-Grant', '84 Webster Groves Dr', to_date('01-05-1935', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5555480190, 'John-Chung', '94 Reese Ave', to_date('18-05-1972', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9941512260, 'Phil-Carrack', '70 Harmon Road', to_date('07-02-2023', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7363741486, 'Regina-Gibson', '232 Pressly Ave', to_date('29-04-2018', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3759755164, 'Hilton-Martin', '32 Hatfield Street', to_date('02-01-2023', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9085244040, 'Marina-McDonald', '110 Lennix Drive', to_date('02-12-2011', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7275750365, 'Andre-Curry', '868 Palmer Drive', to_date('01-06-1945', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2147278072, 'Janeane-Roundtr', '13 Kennedy Street', to_date('26-08-2023', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2862655367, 'Bob-Matthau', '70 Ferrer Ave', to_date('09-02-1984', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (670226637, 'Franco-Chestnut', '75 Valencia Drive', to_date('24-05-1944', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8242090468, 'Miko-Lynch', '92 Kwun Tong Road', to_date('08-05-1998', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3380865415, 'Jared-Quinn', '73rd Street', to_date('28-11-1973', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8900246443, 'Gino-Paltrow', '4 Braintree Road', to_date('09-02-2013', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5758673984, 'Denise-Stone', '13 Reese Ave', to_date('01-01-1994', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2316446254, 'Christmas-Shand', '83 Duschel Street', to_date('01-08-1977', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2787657983, 'Carl-Charles', '67 Danes Road', to_date('27-03-2007', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9969931286, 'Rade-Tinsley', '61 Paula Road', to_date('07-08-1997', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1503768749, 'Stephanie-Wong', '58 Lorenz Road', to_date('02-08-1963', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4876629555, 'Garth-Cotton', '90 Rowlands Road', to_date('03-06-1948', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1850295506, 'Ned-Luongo', '41 Reinhold Road', to_date('22-10-2013', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (323483677, 'Sydney-Fonda', '12 Rhames Street', to_date('16-08-1930', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (177950990, 'Clive-Jane', '41 Jeroen Road', to_date('21-10-1933', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9078397088, 'Irene-Lane', '24 Chapman Street', to_date('12-03-1990', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4141441290, 'Woody-Thurman', '75 Luedenscheid Driv', to_date('09-06-1968', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2366972925, 'Eugene-Koyana', '68 Hookah Road', to_date('14-08-1956', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (289620417, 'Jared-Haslam', '517 Brookfield Road', to_date('01-10-1956', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6144352581, 'Kevin-Broderick', '44 Himmelman Ave', to_date('01-12-1944', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2676285820, 'Mili-Cummings', '2 Veruca Blvd', to_date('09-05-1976', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4775712739, 'Tara-Sevigny', '271 Melanie Ave', to_date('14-11-2001', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (553751213, 'Leonardo-Austin', '56 Leigh Street', to_date('19-11-2006', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (735203933, 'Jonny Lee-Polit', '12 Depp Ave', to_date('24-04-1942', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7083269113, 'John-Tarantino', '100 Hal Road', to_date('12-06-1998', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2469350410, 'Chloe-Wakeling', '1 Tzi Ave', to_date('25-01-1948', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (918280633, 'Linda-Reeve', '76 Toyama Ave', to_date('25-04-2022', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4978796597, 'Gordon-Tolkan', '23 Concordville Stre', to_date('13-08-1982', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5015173820, 'Miriam-Katt', '163 Bening', to_date('11-01-1995', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7929103247, 'Connie-Hunt', '285 Delafield Drive', to_date('21-11-1976', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5874620561, 'Samantha-Boorem', '99 Apple', to_date('10-08-1951', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6957966962, 'George-Place', '547 Dourif Road', to_date('30-03-1937', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7680227012, 'Edgar-Parish', '96 DeLuise', to_date('27-02-1958', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6099122506, 'Benicio-Chestnu', '36 Marina Road', to_date('16-07-2017', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5054621175, 'Cledus-O''Keefe', '54 Rosie Ave', to_date('30-05-1969', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5472046503, 'Stellan-Connick', '37 Theron Road', to_date('29-03-1963', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1729647279, 'Courtney-Coburn', '642 Rickman Street', to_date('27-06-1937', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8333813172, 'Nanci-Lawrence', '83 Minogue Road', to_date('14-07-1984', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6624030420, 'Tamala-Pitt', '80 Martinez Blvd', to_date('18-06-2010', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9578311643, 'Jimmy-Kirshner', '51st Street', to_date('07-09-1974', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9225267582, 'Oded-Wells', '24 McLean Street', to_date('09-01-1963', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6827186252, 'Brendan-Lunch', '93 Shorter Street', to_date('14-01-1988', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6866653687, 'Sheena-Jay', '925 Tara Drive', to_date('14-12-1935', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2416824520, 'Allan-Biggs', '5 Shirley Street', to_date('28-08-1971', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8631835652, 'Whoopi-Midler', '24 Dillane', to_date('04-11-1973', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8989961141, 'Javon-Bullock', '67 Hopper Ave', to_date('01-07-1957', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3429231747, 'Spike-Newton', '32 Oulu Street', to_date('01-01-1989', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (143282749, 'Frankie-Merchan', '100 Samantha Road', to_date('03-05-1943', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9448337083, 'Andrea-McPherso', '19 Paul Street', to_date('05-12-1953', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2566644257, 'Taye-Shawn', '44 Wilkinson Street', to_date('12-06-1950', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4282063421, 'Hilary-Dorn', '57 Mifune', to_date('11-09-1989', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6064498174, 'Nikka-Driver', '63rd Street', to_date('14-12-1985', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1335130312, 'Samantha-Rispol', '98 Posey Blvd', to_date('22-08-1966', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1237925442, 'Joely-Shand', '70 Lopez Street', to_date('14-04-1987', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3827441235, 'Charlie-Doucett', '574 McCracken Road', to_date('12-02-1993', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9253473117, 'Sissy-Rucker', '70 Dolenz Road', to_date('27-04-1977', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1170529063, 'James-Michaels', '31st Street', to_date('07-01-2021', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4067697962, 'Jonny Lee-Tyson', '7 Ryan Road', to_date('24-11-1955', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (810939551, 'Matthew-Summer', '19 Antwerpen Road', to_date('25-10-1976', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5453615888, 'Darius-Harnes', '41 Minneapolis Blvd', to_date('08-02-1988', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8803794810, 'Lupe-Snipes', '94 Willard Drive', to_date('21-10-1947', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7034860275, 'Ming-Na-Kirshne', '47 Burlington Ave', to_date('28-09-1943', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3933457288, 'Claude-Belles', '39 Waldorf Ave', to_date('07-08-1979', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8021633115, 'Ron-Tambor', '14 Ricardo Drive', to_date('21-04-1934', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1915000533, 'Morris-Epps', '882 Monterey Street', to_date('20-01-1942', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5679654241, 'Curt-Paquin', '92nd Street', to_date('23-01-2010', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (151654281, 'Lonnie-Hagar', '64 Jonathan Ave', to_date('22-10-1957', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6231366908, 'Jeremy-Giamatti', '12 Duchovny Road', to_date('10-01-1973', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6651704374, 'Tanya-Atkinson', '7 Casey Road', to_date('19-06-1964', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9815564305, 'Geoff-Page', '8 Hughes Ave', to_date('29-01-1965', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4637188886, 'Denny-Chesnutt', '43 Jesus Street', to_date('02-09-1985', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5365621747, 'Antonio-Wainwri', '38 Lyon Drive', to_date('01-11-1966', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7553504561, 'Thomas-Bullock', '46 Bergen Drive', to_date('25-11-1981', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2803680347, 'Millie-Laurie', '70 Tampa', to_date('24-07-1934', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (541412678, 'Eugene-Purefoy', '15 Juliana Blvd', to_date('20-10-1956', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2282715352, 'Bridget-LaPagli', '80 Fuerth Drive', to_date('29-07-2001', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (74432484, 'Hugo-Crystal', '28 Latifah Street', to_date('06-02-1993', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1323124386, 'Cyndi-Head', '905 Hermitage Street', to_date('04-01-1953', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (285573987, 'Cevin-Lang', '383 Altamonte Spring', to_date('24-04-2005', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8772401714, 'Lena-Sarandon', '41 Baker', to_date('18-04-1969', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1156067587, 'Ashley-Murdock', '61st Street', to_date('04-12-1974', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (193221226, 'Lance-Morrison', '37 Kitty Road', to_date('10-03-2002', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4256252645, 'Loreena-Sutherl', '25 Neil Street', to_date('22-01-1968', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6727679542, 'William-Rydell', '79 Rhymes Street', to_date('11-10-2022', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6219652128, 'Yolanda-Wolf', '25 Cyndi Ave', to_date('17-12-1996', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (63623209, 'Rene-LaBelle', '33rd Street', to_date('30-10-1963', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6892819681, 'Jonatha-Greenwo', '340 Morton Drive', to_date('29-10-1979', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6244456267, 'Jeroen-Murray', '76 Stills Road', to_date('11-07-1943', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5532601232, 'Aidan-Faithfull', '908 Drogenbos Road', to_date('02-11-1939', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6068499243, 'Lloyd-Van Der B', '966 Sydney', to_date('10-05-1951', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6818831711, 'Carrie-Saucedo', '864 Kenneth Road', to_date('02-07-1974', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3136828748, 'Kylie-Fichtner', '5 Norton Drive', to_date('18-08-2014', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5245648444, 'Pat-Armstrong', '16 Tinsley', to_date('20-06-1974', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (164116400, 'Kevin-Eder', '658 Hurt Drive', to_date('20-07-2004', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8632356425, 'Jamie-DeLuise', '63 Kloten Road', to_date('16-02-1943', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1775669222, 'Susan-Washingto', '93rd Street', to_date('09-03-1998', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2430278826, 'Nikki-Lane', '24 Hauser Street', to_date('16-06-2022', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8088992749, 'Toshiro-Hawn', '82 Steagall Road', to_date('23-07-1958', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2193299572, 'Chris-Tanon', '44 Griggs Road', to_date('17-06-2022', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1012224670, 'Howard-Rains', '305 New Hope Ave', to_date('04-06-1949', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1115450997, 'Hookah-Cherry', '99 Hilary Drive', to_date('15-10-1966', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9852733174, 'Martin-Kimball', '35 Oakenfold Road', to_date('10-01-2017', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7752045587, 'Pat-Singh', '40 Ali Street', to_date('26-08-1965', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3045915626, 'Jason-Herndon', '82 Brittany Road', to_date('05-08-1932', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7696124653, 'Lisa-Gracie', '33 Domingo Road', to_date('03-03-1936', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9196663151, 'Anthony-Woods', '52 West Launceston D', to_date('22-04-1988', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7366936679, 'Kim-Watley', '21 Marlboro Road', to_date('02-10-1963', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3860469070, 'Judi-Watley', '94 Redmond Street', to_date('08-08-1973', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5999346158, 'Robby-Sainte-Ma', '95 Dorff Road', to_date('24-12-1935', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1686820436, 'Ned-Dreyfuss', '95 Bryan Street', to_date('23-05-1933', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7684878155, 'Todd-Faithfull', '98 Abraham Street', to_date('27-03-1949', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2962567637, 'Taryn-Weiss', '95 Alfie Road', to_date('10-09-2007', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (116628391, 'Barbara-Hauser', '47 Cary Drive', to_date('19-04-2015', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7886324942, 'Carrie-D''Onofri', '56 Bountiful Drive', to_date('07-06-1937', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2737174168, 'Maxine-Henrikse', '69 Rio', to_date('17-12-1971', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7824676506, 'Mira-Mazzello', '10 Coburn Road', to_date('26-06-1995', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8542734841, 'Shannon-Kingsle', '39 Research Triangle', to_date('15-11-1979', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (133932007, 'Wang-Scaggs', '88 Dublin Drive', to_date('30-10-1988', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5547889715, 'Terrence-Parker', '63 Navarro Street', to_date('30-04-2008', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3143108779, 'Grace-Yorn', '298 Or-yehuda Drive', to_date('23-12-1976', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2699127960, 'Trini-Lynch', '33 McGowan Road', to_date('25-03-2010', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5083445045, 'Marianne-Palin', '10 Duncan Drive', to_date('22-05-1943', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2069260507, 'Jude-Roundtree', '468 Armstrong Blvd', to_date('20-02-1962', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1340648423, 'Noah-Blossoms', '28 Adams Street', to_date('11-05-1936', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4357547490, 'Burt-Tanon', '20 Leipzig Street', to_date('25-11-2018', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9576860944, 'Anna-Farrow', '806 Nicholas Drive', to_date('20-09-1944', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8562786285, 'Micky-LuPone', '94 Gene', to_date('10-10-1963', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5009216736, 'Brendan-Price', '317 Robin Road', to_date('13-12-1991', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9386595139, 'Roscoe-Wariner', '46 Toshiro Blvd', to_date('03-05-1964', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6848351768, 'Hal-Studi', '51 Lin Ave', to_date('23-07-1950', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1487915273, 'Jodie-Torino', '87 Street Road', to_date('06-04-1986', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (838346819, 'Desmond-Union', '422 Pesci Road', to_date('01-01-1940', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3433286660, 'Kevin-McFadden', '54 Newman Drive', to_date('20-10-1930', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5294743118, 'Shannon-Oates', '34 Hampton Street', to_date('28-05-1946', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7785936014, 'Reese-Forster', '62nd Street', to_date('27-04-2007', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9688435014, 'Ed-Lemmon', '26 Bello Drive', to_date('14-02-2020', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6816429319, 'Faye-Adkins', '18 Hong Street', to_date('27-10-2020', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2177909058, 'Warren-Zellwege', '69 Rockville Street', to_date('30-05-1989', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6101291032, 'Claude-Nelson', '51 Brolin Road', to_date('30-07-1952', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8557654457, 'Barbara-Frampto', '51st Street', to_date('05-09-1988', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1862987477, 'Jane-Chesnutt', '91st Street', to_date('04-07-1965', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5670745069, 'Frederic-Hornsb', '6 Chinnor Road', to_date('15-02-1957', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3931224535, 'Balthazar-Loren', '36 Lake Bluff Drive', to_date('04-08-1947', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2700205210, 'Larry-Shorter', '56 Ettlingen Street', to_date('11-02-2024', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9381646244, 'Lisa-Plummer', '74 Staten Island', to_date('20-10-2023', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4784421443, 'Curt-Brolin', '23 McCoy Road', to_date('10-05-1947', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7412847734, 'Ted-Dorff', '502 Crudup Road', to_date('28-09-1948', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (562498651, 'Vanessa-Wahlber', '700 Evans Road', to_date('26-10-1985', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2271914019, 'Molly-Forrest', '79 Ozzy Ave', to_date('18-11-1951', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7625689880, 'Sheryl-Bullock', '57 Yulin Drive', to_date('09-07-2009', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9441020024, 'Karen-Elizabeth', '62nd Street', to_date('07-12-1950', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (195667989, 'Goldie-Blackwel', '22 Sursee Ave', to_date('02-08-1936', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1969805366, 'Pat-Nicholson', '35 Ponce Road', to_date('05-06-1984', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8465227050, 'Max-Sample', '7 Portsmouth Street', to_date('15-10-1965', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8614252491, 'Kevn-Garr', '35 Finn Street', to_date('17-03-1972', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (251495986, 'Christine-Broad', '51st Street', to_date('24-05-1976', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6906174049, 'Terrence-Tyler', '12 Fountain Hills Dr', to_date('15-09-1986', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9189642051, 'Drew-Pitney', '51st Street', to_date('08-05-1933', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2598702631, 'Sal-Cobbs', '72 Bryson Street', to_date('31-08-2003', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9712522243, 'Randy-Moody', '29 Shelby Road', to_date('22-11-1993', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4872596379, 'Sonny-Miles', '6 Or-yehuda Street', to_date('10-01-1979', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1276564186, 'Karen-Kenoly', '11 Carlton Blvd', to_date('24-02-2024', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6197287535, 'Gena-Houston', '93 Farrell Drive', to_date('23-02-1988', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (744886749, 'Richard-Azaria', '78 Minnie Ave', to_date('13-02-2017', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6621114375, 'Gloria-Carnes', '72 Solikamsk Street', to_date('14-02-1943', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2439015616, 'Mike-Finney', '90 Blossoms', to_date('28-05-1995', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4125114229, 'Jodie-Ribisi', '76 Giannini Drive', to_date('05-06-1953', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2275249611, 'Frank-Rizzo', '42nd Street', to_date('13-02-1931', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9003542662, 'Jimmy-Swayze', '82 Denise Street', to_date('27-02-1935', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (940709781, 'Emm-Abraham', '48 Warley', to_date('27-06-1987', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6186221192, 'Reese-Waite', '99 Neustadt Road', to_date('06-09-1965', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6772891111, 'Humberto-Beckha', '86 Orton Drive', to_date('16-03-1998', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1442888924, 'Edgar-Kudrow', '99 Rob Street', to_date('30-07-1970', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3053271507, 'Tobey-Brolin', '100 Horace Blvd', to_date('17-10-2005', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7835669867, 'Miguel-Shepherd', '1 Toronto Drive', to_date('24-11-1957', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2586518664, 'Burton-Tyson', '44 Vaughan Drive', to_date('13-04-1937', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3084392759, 'Lionel-Stanton', '39 Griggs Drive', to_date('06-06-1968', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5636800170, 'Juan-Carr', '73 Rene Road', to_date('29-10-2004', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1716579394, 'Jamie-Kravitz', '43rd Street', to_date('16-08-1948', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3970744066, 'Judd-Danger', '8 Dean Ave', to_date('25-11-1954', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6253559698, 'Jack-Balin', '82 Delbert Road', to_date('10-09-2001', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (775945376, 'Sydney-Malone', '32nd Street', to_date('05-03-1940', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4141793382, 'Chuck-Hudson', '51 Voight Road', to_date('22-03-2000', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5062418361, 'Breckin-Lunch', '936 Affleck Ave', to_date('05-05-1986', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1453210880, 'Crystal-Chesnut', '58 Zahn Drive', to_date('26-10-1979', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9368939942, 'Shirley-Kenoly', '65 Taha Road', to_date('25-02-1930', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7802245645, 'Marlon-Withersp', '18 McKellen Road', to_date('02-02-1999', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7734103252, 'Jennifer-Kilmer', '91st Street', to_date('16-02-1991', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9423693588, 'Giovanni-Christ', '92 Ripley Street', to_date('18-06-1976', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (249867037, 'Rutger-Blanchet', '9 Coolidge Drive', to_date('05-12-1965', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1568062384, 'Desmond-Blades', '49 Diaz', to_date('21-03-1970', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2847260761, 'Malcolm-Levin', '33rd Street', to_date('16-08-1996', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3984521725, 'Clint-Strong', '72 Breda Street', to_date('12-01-1997', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1386972257, 'Cesar-Gunton', '271 Raitt Road', to_date('27-05-1949', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (875335878, 'Leslie-Cohn', '75 South Hadley', to_date('17-08-1985', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (787901469, 'Gates-Atlas', '41 San Francisco Blv', to_date('14-07-2009', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3050142559, 'Nelly-Garofalo', '8 Bracco Road', to_date('26-07-2020', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7382811327, 'Denny-Mazar', '54 Radovljica Drive', to_date('11-04-2010', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8916512991, 'Ice-Dillon', '481 Sanchez Road', to_date('15-04-1990', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2332627179, 'Mia-McNarland', '84 Bham Ave', to_date('27-05-1991', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6573740106, 'Bryan-Vanian', '65 Berenger Road', to_date('29-05-2004', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7846027032, 'Saffron-Gallagh', '23 CeCe Street', to_date('26-05-1959', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8989075458, 'Harris-Porter', '14 Beals Road', to_date('28-06-1994', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6165357161, 'Geraldine-Harne', '217 McDowall Blvd', to_date('01-02-1942', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2378241761, 'Murray-Green', '69 Henstridge Street', to_date('09-03-1946', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5326805372, 'Henry-Mills', '85 McCready Ave', to_date('08-10-1970', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4048125266, 'Rosanna-Pony', '15 Overland park Roa', to_date('11-01-2022', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7335778851, 'Gilbert-Kristof', '25 Rosemead Ave', to_date('16-03-1972', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3331214284, 'Candice-Pleasen', '18 Lachey Street', to_date('16-06-1950', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6341099518, 'Murray-Jeffreys', '73 Wavre Blvd', to_date('23-11-1944', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4615015128, 'Oliver-Costa', '59 Gough Road', to_date('22-07-1977', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6356019700, 'Clarence-Alliso', '822 El-Saher Road', to_date('13-03-1969', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2719906953, 'Cameron-Rain', '84 Moriarty Street', to_date('29-06-1948', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4571728402, 'Xander-Postleth', '64 Sinead Road', to_date('12-03-1970', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5397248555, 'Shirley-Heald', '18 Reno Street', to_date('19-01-1958', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8854713151, 'Patty-Place', '850 New Castle Road', to_date('03-10-1975', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2033807938, 'Teena-Atkinson', '386 Warren', to_date('06-07-1990', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9544877516, 'Andre-Deejay', '28 Harrison Drive', to_date('08-08-1931', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1426154171, 'Vickie-Rio', '91 Padova Road', to_date('06-09-2018', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1341560921, 'Cornell-Witt', '82 Street Road', to_date('13-06-1940', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (422675382, 'Maury-Crowell', '473 Doncaster Street', to_date('25-01-1957', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4789045305, 'Rik-Hewett', '155 Charlotte Road', to_date('18-08-1934', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6293483388, 'Pete-Shocked', '48 Carrere Road', to_date('14-10-1958', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2650702456, 'Crispin-Serbedz', '33 Eder Road', to_date('18-07-1935', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9481619464, 'Maria-Cale', '54 Bradford Road', to_date('30-06-1993', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (622496375, 'Mira-Balaban', '8 Agoncillo Street', to_date('19-08-1955', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1038673808, 'Breckin-Sylvian', '35 Oszajca Street', to_date('14-09-1988', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3359270277, 'Trick-Idol', '231 Neeson Street', to_date('06-04-2023', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (773404758, 'Praga-Oakenfold', '61 Pitstone Blvd', to_date('25-02-1986', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8369078629, 'Chely-Nivola', '34 Rozenburg Road', to_date('19-10-1942', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8625152011, 'Donna-Tate', '63 Mandrell Street', to_date('13-06-1973', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (720729115, 'Bonnie-Dillane', '25 Summerside Street', to_date('10-02-1940', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2851767758, 'Remy-Garner', '713 Zappacosta Drive', to_date('28-10-2009', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6309440133, 'Maureen-Playboy', '85 Cohn Street', to_date('07-04-1963', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2153615227, 'Roberta-Kutcher', '106 DiBiasio Drive', to_date('29-04-2019', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8211880450, 'Geena-Brandt', '53 Maintenon Road', to_date('12-05-1983', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5525121267, 'Hope-Willis', '91 Newton', to_date('07-06-2012', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5147263180, 'Emm-Garr', '4 Firth Road', to_date('18-10-1935', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5945923301, 'Aidan-Oakenfold', '547 Mira Road', to_date('07-05-1934', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6053082254, 'Nina-Coolidge', '68 Belmont Street', to_date('16-07-2022', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7569305487, 'Jody-Reno', '82 Arjona Ave', to_date('26-10-2020', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2100964902, 'Cledus-Wahlberg', '52nd Street', to_date('26-03-2016', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6535501237, 'Cyndi-Worrell', '167 Latifah Street', to_date('18-07-1991', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1910719498, 'Lara-Plimpton', '62 Domino Road', to_date('05-09-2019', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5486027872, 'Lin-Jenkins', '38 Judd Street', to_date('14-06-1962', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3153675757, 'Junior-McConaug', '39 Furay Street', to_date('01-04-1964', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5178229036, 'Jose-Playboys', '12nd Street', to_date('10-07-2008', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1025020832, 'Domingo-Huston', '157 Aomori Road', to_date('15-09-1947', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1712532188, 'Sheryl-Tomei', '73 Pollak Ave', to_date('04-09-1937', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4977671153, 'Oro-Rockwell', '888 Hawkins', to_date('04-04-1930', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6057615233, 'Jeanne-McIntyre', '45 Janney Street', to_date('09-06-1936', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1794283867, 'Zooey-Boone', '60 Gooding', to_date('09-11-2009', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (62157321, 'Jesse-White', '8 Balaban', to_date('29-11-2021', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5052384702, 'Jeroen-Watson', '82nd Street', to_date('01-03-1969', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7614052474, 'Tanya-Fiorentin', '34 Vejle', to_date('11-08-1988', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4800630299, 'Giancarlo-von S', '22 Petach-Tikva Road', to_date('17-05-2004', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3228235920, 'Rickie-Lofgren', '76 Fraser Road', to_date('08-05-2014', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3074199391, 'Carlene-Barnett', '862 Freda Street', to_date('01-04-1975', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4354634509, 'Jake-Makowicz', '112 Nathan Street', to_date('22-07-1947', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4673773364, 'Aidan-Streep', '528 Quaid Road', to_date('15-06-2000', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1165680508, 'Doug-Conroy', '72nd Street', to_date('12-09-1934', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1087850988, 'Adam-Lerner', '841 Donal Road', to_date('28-10-2009', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2037867466, 'Benicio-Henstri', '254 Treat Road', to_date('07-05-2024', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2858710043, 'Madeline-Pollac', '60 Harris Street', to_date('05-10-1998', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6471908273, 'Fiona-McClinton', '92nd Street', to_date('20-05-1987', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3984327254, 'Lara-Daniels', '53 Neville Road', to_date('22-10-1995', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3028960983, 'Kasey-Camp', '750 Freddie Blvd', to_date('05-06-2019', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3237664108, 'Whoopi-Avital', '1 Darmstadt Ave', to_date('24-10-1997', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8050148664, 'Joan-Hutton', '40 Utada Blvd', to_date('09-11-1976', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (604215135, 'Gordie-Hutton', '5 Caldwell Street', to_date('08-12-1992', 'dd-mm-yyyy'));
commit;
prompt 500 records committed...
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3160491108, 'Ray-Liu', '401 Russo Road', to_date('09-11-1947', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6905570349, 'Mika-Emmett', '93rd Street', to_date('25-05-1964', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9560333691, 'Bette-Gallant', '33 Sartain Road', to_date('24-10-1948', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8603022356, 'Samantha-Rockwe', '215 Driver Drive', to_date('19-07-2017', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4051156201, 'Giancarlo-Strat', '461 Denny Drive', to_date('15-10-1948', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7476503106, 'Sara-McDiarmid', '11st Street', to_date('12-03-1947', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (887542784, 'Nikki-Weisberg', '92nd Street', to_date('16-04-1974', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8405010754, 'Clint-Bacharach', '14 Miller', to_date('22-09-1981', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (135912253, 'Fionnula-Blaine', '83 McIntosh', to_date('28-02-1988', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2475290158, 'Curt-Farina', '73 West Launceston R', to_date('17-10-1990', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5005125471, 'Forest-Loring', '48 Nicky Street', to_date('12-01-2021', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7896618216, 'Trick-Paul', '486 Arkenstone Stree', to_date('19-08-1950', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6849172974, 'Simon-Vaughn', '8 Joli Road', to_date('15-06-1955', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1851758966, 'Lili-Northam', '9 Presley Road', to_date('15-03-1951', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8282926254, 'Frankie-Travolt', '215 Connelly Street', to_date('01-07-1932', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (405011999, 'Illeana-Easton', '54 Silverdale Drive', to_date('08-09-1971', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5405923950, 'Burton-Ronstadt', '39 Golden', to_date('23-01-2009', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2569536269, 'Simon-Berkeley', '74 Skaggs', to_date('31-01-1930', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7226211770, 'Edward-Hughes', '93 England Ave', to_date('26-06-2019', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2975698434, 'Chrissie-Hoskin', '30 Mewes Ave', to_date('24-05-1971', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8239138321, 'Amy-Taylor', '50 LaSalle Blvd', to_date('11-03-2010', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2725669272, 'Vickie-Evans', '22nd Street', to_date('18-01-1968', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5599013034, 'Don-Addy', '39 Belushi Drive', to_date('04-08-1940', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1014812667, 'Miles-Burke', '5 Cazale Drive', to_date('11-03-1938', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7641554886, 'Ernest-Bryson', '56 Lovitz Road', to_date('01-12-1957', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9171778426, 'Nile-Broadbent', '59 Lavigne Blvd', to_date('16-10-1933', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7409809934, 'Mos-Davies', '91 Wariner Blvd', to_date('19-12-2005', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1950149947, 'Temuera-Candy', '906 Gordon Street', to_date('06-05-1931', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3825760498, 'Gladys-Liotta', '24 Jacksonville Stre', to_date('09-07-2009', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8066439080, 'Ashton-Morrison', '871 Elvis Road', to_date('21-12-1990', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1910532390, 'Melba-Thewlis', '51 Vanessa Street', to_date('09-12-2019', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (723779796, 'Hope-Johansen', '103 Vallauris Drive', to_date('01-12-2017', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3955199744, 'Fiona-Mars', '45 Fukushima Blvd', to_date('13-01-1940', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5894706760, 'Aaron-Holeman', '33 Bרnes Road', to_date('16-08-1955', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9239191222, 'Crystal-Darren', '21st Street', to_date('29-10-1976', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3850133825, 'Ani-Kapanka', '23rd Street', to_date('15-07-1941', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8659460976, 'Rosario-Frost', '716 Tilda Street', to_date('29-07-1933', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1326090827, 'Ronny-Belles', '18 Curtis Street', to_date('18-08-1995', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5594489495, 'Tim-Cochran', '46 Humphrey Drive', to_date('16-07-1987', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6452028179, 'Ronnie-Parish', '39 Mulroney Blvd', to_date('14-09-2022', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (485790341, 'Charlton-Marsde', '718 Fair Lawn Road', to_date('16-12-1945', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7830633099, 'Chet-Paul', '68 Kinnear Blvd', to_date('12-08-1937', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8990521445, 'Carole-Yorn', '2 Kenny', to_date('07-11-1984', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7622320832, 'Hal-Waite', '914 Shelton Road', to_date('24-03-2006', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8040472363, 'Fiona-Weston', '306 Briscoe Road', to_date('12-10-1973', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1084008759, 'Randall-Metcalf', '4 Sossamon Blvd', to_date('29-01-1969', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8701014996, 'Whoopi-Snider', '83 Newbury Drive', to_date('30-10-1942', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3757173395, 'Rhea-Steenburge', '634 Gano Street', to_date('14-06-1967', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6134310273, 'Debbie-Harmon', '14 Delta Blvd', to_date('22-03-1949', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2967054387, 'Bernard-Taha', '93 Cornell Ave', to_date('29-06-1981', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7288137407, 'Dean-Love', '57 Kenneth Drive', to_date('08-09-1937', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8934508248, 'Karen-Sandler', '19 Newcastle upon Ty', to_date('11-01-1969', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2761387224, 'Cuba-Sutherland', '93rd Street', to_date('28-03-1998', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8800053076, 'Holland-Hannah', '32 Lyonne Drive', to_date('20-01-1949', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9577521550, 'Debra-Jane', '15 Vienna', to_date('04-03-1936', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (274232091, 'Millie-Lauper', '932 Rawlins Street', to_date('18-12-1951', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7715039115, 'Julia-Foster', '49 Li', to_date('07-11-2009', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9511352412, 'John-DeLuise', '72nd Street', to_date('02-06-1930', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (314612355, 'Emerson-Farina', '21st Street', to_date('24-08-2015', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (238440081, 'Oded-Tripplehor', '54 Yankovic Drive', to_date('31-01-2020', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3617878111, 'Davis-Tanon', '429 Donovan Blvd', to_date('17-01-1954', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6018987633, 'April-Dickinson', '303 Fort McMurray Dr', to_date('09-06-1999', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7474837816, 'Ceili-McNeice', '64 Hirsch Blvd', to_date('30-05-2017', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5036434870, 'Glen-O''Donnell', '37 Julie Blvd', to_date('03-04-1967', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2163384065, 'Ashley-Luongo', '43 Katie Street', to_date('12-08-1993', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5185439905, 'Clea-Oates', '721 Barrymore Drive', to_date('19-09-1940', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7781164729, 'Martin-Sisto', '49 Sydney Drive', to_date('05-07-2001', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8962972466, 'Thomas-Culkin', '79 Dorn Blvd', to_date('18-12-1988', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4882126586, 'Edwin-Cartlidge', '88 Elwes Drive', to_date('02-01-1939', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7853982434, 'Tanya-Hunter', '66 Sugar Hill', to_date('06-06-1965', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (631017809, 'Demi-Murphy', '805 Parsons Road', to_date('19-11-1951', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7169653434, 'Kris-Yorn', '2 Cervine Street', to_date('09-01-2020', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8501725383, 'Howie-Rubinek', '156 Kevn Street', to_date('10-09-2002', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3095408415, 'Ossie-Black', '805 Moss Street', to_date('18-01-2019', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9793895725, 'Samuel-Van Held', '17 Gibbons Street', to_date('12-01-2008', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5202009039, 'Meredith-Crosby', '70 Spears Street', to_date('22-09-2003', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (846249766, 'Kyle-Allison', '803 Atkins Street', to_date('26-02-1974', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2442110887, 'Vickie-Rankin', '12 Newton Drive', to_date('08-07-1997', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (573517703, 'Brooke-Janney', '81 Dorval Drive', to_date('20-07-1937', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9699404637, 'Julie-Caldwell', '54 Carmen Road', to_date('06-05-1936', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3240755203, 'Rhys-Haynes', '39 Cochran Drive', to_date('05-10-1957', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6213520912, 'Casey-Hutton', '62 Adelaide Ave', to_date('09-04-2013', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4690793583, 'Fats-McGill', '20 Dunaway Drive', to_date('23-03-1999', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5515512369, 'Val-Mazar', '61 Grant Drive', to_date('16-12-1971', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4039010958, 'Marc-Cumming', '96 Danni Blvd', to_date('22-01-1976', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8693621029, 'Bebe-Mahoney', '225 Copeland', to_date('13-06-1952', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8047319551, 'Malcolm-Hackman', '63rd Street', to_date('08-05-1971', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4583167766, 'Garth-von Sydow', '81 Winger Drive', to_date('04-09-1997', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9326040660, 'Gilbert-Spall', '10 Vince Road', to_date('05-12-2007', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (260562136, 'Chet-Payne', '283 Mechanicsburg Ro', to_date('28-03-1975', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9812319978, 'Leonardo-Idol', '43 Flanery Street', to_date('07-07-2021', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6119261384, 'Joely-Darren', '3 Jane Street', to_date('12-06-2008', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9324067894, 'Freda-Palmieri', '568 Diaz Ave', to_date('16-04-1959', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (794795774, 'Gran-Cash', '76 Ming-Na', to_date('09-06-1954', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1567710482, 'Lou-Graham', '68 Charleston Road', to_date('18-04-1938', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6556923950, 'Sandra-Cromwell', '55 Kathy Street', to_date('01-11-1979', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9954718199, 'Seth-Gore', '52 Ramirez Street', to_date('30-04-1935', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2560400565, 'Mykelti-Carnes', '55 Everett Road', to_date('06-04-1948', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (699883838, 'Isaiah-Belle', '59 Wakayama Drive', to_date('16-05-1947', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5950035150, 'Sarah-Flanery', '89 Bellerose Road', to_date('04-09-1941', 'dd-mm-yyyy'));
commit;
prompt 600 records committed...
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9401983600, 'Judy-Hayek', '47 Rod Blvd', to_date('25-05-2009', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3561539221, 'Hikaru-McIntosh', '303 Ving', to_date('26-06-1998', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3147971085, 'Queen-Maxwell', '17 Greenwood Village', to_date('07-03-1953', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5727503710, 'Rolando-Ranger', '27 Joely', to_date('07-04-1972', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6526709646, 'Kirk-Duschel', '60 Peniston Blvd', to_date('17-02-1935', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4196603881, 'Miranda-Lindley', '27 Rich Road', to_date('13-12-1989', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5557464102, 'Miguel-Goodman', '97 Gordie Road', to_date('29-08-1983', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2080013212, 'Steven-Busey', '100 Smyrna Street', to_date('04-08-1959', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7869394362, 'Roger-Easton', '42nd Street', to_date('07-05-1981', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2672442455, 'Janice-O''Donnel', '91 Rizzo Street', to_date('06-03-1974', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3568049455, 'Aimee-Martinez', '75 Tennison Road', to_date('14-03-2005', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8639700613, 'Alex-Kelly', '226 Dearborn', to_date('23-01-1984', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2048006838, 'Bob-Heslov', '865 Cohn Ave', to_date('21-08-2022', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1150246000, 'Teri-Aiken', '7 Leo Blvd', to_date('11-04-2011', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9394913611, 'Kieran-Gleeson', '88 Mandrell Street', to_date('30-11-1974', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9979090589, 'Maxine-Black', '55 Jackie Road', to_date('29-02-2008', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3923804802, 'Jeff-Willard', '83 Sugar Land Street', to_date('15-01-2011', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4490381015, 'Micky-Jay', '18 Ann Arbor Street', to_date('28-09-2021', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8381236995, 'Ray-McKellen', '92 Popper Drive', to_date('21-05-1955', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (266476233, 'Jamie-Barry', '88 Miles Road', to_date('18-01-1983', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7070379208, 'Dan-Collie', '383 Balaban Drive', to_date('09-09-1957', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3452770942, 'Collective-Depp', '198 Dalmine Ave', to_date('08-10-2013', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (923458864, 'Jimmie-Cochran', '483 Postlethwaite Bl', to_date('17-12-1956', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3271688078, 'Buddy-Pryce', '39 Andrae Road', to_date('05-06-2017', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1219094573, 'Mel-Borgnine', '66 Cruise Road', to_date('20-01-1994', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4734161251, 'Derek-Lowe', '93 Lubbock Street', to_date('22-08-1939', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4227450512, 'Uma-Sinise', '330 Jude Street', to_date('15-02-1941', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7466485462, 'Orlando-Ferrell', '83 Wilkinson Drive', to_date('20-11-1961', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4614454518, 'Olympia-Goodman', '17 Sawa Street', to_date('14-04-1963', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7138099830, 'Roger-Cornell', '19 Beckham Blvd', to_date('28-05-1943', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7680090398, 'Ceili-Summer', '8 Eden prairie Road', to_date('22-03-2019', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4052322065, 'Martin-Oates', '77 Singh Drive', to_date('30-08-2003', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1651256604, 'Doug-Wheel', '22nd Street', to_date('03-03-1978', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2298287577, 'Merrilee-Harris', '91 Cage', to_date('13-01-1998', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3499856845, 'Wayne-Cohn', '68 Mason Road', to_date('02-07-1949', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8171079190, 'Mike-Borgnine', '861 Parma Drive', to_date('28-01-1951', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6627135782, 'Colin-Gere', '11st Street', to_date('29-02-1940', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9970794012, 'Hugh-Carter', '789 Stiles Ave', to_date('22-10-2015', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3436254194, 'Liquid-Norton', '44 Ned Ave', to_date('07-07-1986', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4547591175, 'Vince-Leguizamo', '73 Redwood Shores St', to_date('25-09-1943', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5650721583, 'Bonnie-Affleck', '58 Matthau Street', to_date('18-02-1957', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3870906378, 'Edie-Broadbent', '81 Vicious Street', to_date('05-10-1996', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2060438037, 'Chrissie-Mulron', '34 Ramirez Drive', to_date('14-02-2004', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4990737586, 'Tobey-Spine', '67 Affleck', to_date('13-08-1984', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7734044725, 'Leslie-Sawa', '42 Tartu Road', to_date('29-05-1989', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2360072767, 'Roddy-McCoy', '48 Gandolfini Street', to_date('23-06-1955', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7477457203, 'Robby-Sledge', '68 Cole Drive', to_date('21-08-1945', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5615303290, 'Anthony-Kristof', '28 Paris Street', to_date('13-02-2009', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4245937521, 'Freddy-Huston', '27 Margulies Blvd', to_date('28-07-1952', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5096029211, 'Janice-Ryder', '34 Turku Road', to_date('19-03-1930', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1151991730, 'Dar-Whitford', '91 Pony Road', to_date('17-03-2024', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (125934259, 'Mika-Carmen', '19 Butner', to_date('23-06-1986', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5781395597, 'Marlon-Lane', '79 Rudd Blvd', to_date('14-03-1964', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (677791245, 'Minnie-Vega', '36 Osmond Street', to_date('06-11-1948', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2491703566, 'Walter-Willis', '71st Street', to_date('23-06-1996', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7983577314, 'Arturo-Carmen', '39 Domingo Drive', to_date('01-04-1956', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1204271206, 'Emmylou-Feore', '23 Porto alegre Stre', to_date('03-02-1984', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9004005678, 'Rip-Davies', '257 Ali Drive', to_date('04-04-1971', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9075576464, 'Dwight-Adler', '93 Sao jose rio pret', to_date('17-05-2024', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (490559212, 'Lindsay-Mazar', '39 Oyten Drive', to_date('24-12-1992', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (304502809, 'Cuba-Hunt', '87 Costa', to_date('26-06-1944', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4575986113, 'Jessica-Wincott', '55 Dar Drive', to_date('11-04-1967', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4126971214, 'France-Burke', '727 Joaquin Drive', to_date('30-12-1997', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (834665079, 'Jason-Lopez', '100 Rua eteno Drive', to_date('08-10-1944', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3758818271, 'Jackson-Imbrugl', '17 Haslam Road', to_date('03-04-1975', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9307577365, 'Celia-Heston', '985 Regina Road', to_date('23-04-2014', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (610436896, 'Mindy-Walsh', '44 Hilversum Road', to_date('09-11-1951', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1186355671, 'Phoebe-Witt', '43rd Street', to_date('09-10-1965', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4554752400, 'Eugene-von Sydo', '99 Posey Ave', to_date('28-04-1967', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7981338595, 'Pamela-Dillane', '47 Sheen Street', to_date('31-07-1951', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6778579230, 'Robert-Davison', '25 Matheson Drive', to_date('17-10-1976', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4105849044, 'Harriet-Connery', '47 Lahr Drive', to_date('18-04-1950', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6661082182, 'Gran-Darren', '22nd Street', to_date('12-11-1988', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2950183925, 'Hugo-McCormack', '71 Vin Street', to_date('25-04-1949', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5668061348, 'Shirley-Oakenfo', '723 Bologna Blvd', to_date('29-07-2015', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6088088583, 'Maura-Balin', '60 Warsaw Street', to_date('11-08-1972', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9381241625, 'Powers-Clark', '2 Richards Drive', to_date('24-10-2018', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9976085712, 'Sal-Davis', '71st Street', to_date('31-07-1984', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3517851182, 'Holly-Lynn', '71 Ani Road', to_date('04-08-2000', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7716515305, 'Charles-Paxton', '25 Birch Road', to_date('02-10-1977', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4018682000, 'Lorraine-Epps', '85 Rueben Blvd', to_date('22-08-1994', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7257006691, 'Wes-Waits', '243 Applegate Road', to_date('29-03-2007', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1956620747, 'Vern-Aniston', '862 Kristin Blvd', to_date('21-01-1989', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9079528020, 'Moe-Yulin', '94 Clea Road', to_date('05-11-1958', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1586077648, 'Vincent-Soda', '7 Root Drive', to_date('07-11-2016', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2620375786, 'Cheech-Goodall', '21 Dunn loring Ave', to_date('12-06-1989', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3667966373, 'Grant-Evanswood', '19 Kloten', to_date('16-06-2006', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4773656535, 'Swoosie-Weber', '25 Terence Street', to_date('16-09-2003', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9951010448, 'Stockard-Dorn', '84 MacPherson Street', to_date('28-04-2021', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4340115741, 'Kris-Hoskins', '30 Caine Drive', to_date('20-09-2017', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7519133180, 'Davis-Aiken', '13 Derwood Road', to_date('05-11-2013', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8719990116, 'Gerald-Vai', '63 Christie Drive', to_date('08-12-1966', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5769965621, 'Rip-Crow', '9 Trevino', to_date('31-05-1966', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6401808920, 'Mili-Sirtis', '96 Stigers Road', to_date('13-09-1980', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8233551338, 'Lila-Callow', '46 Tottori Street', to_date('12-06-2018', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7546168682, 'Lily-Kier', '62 Algermissen Blvd', to_date('09-04-1939', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9157164038, 'Cledus-Tambor', '46 Melvin Ave', to_date('07-05-1983', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2087332902, 'Joey-Farris', '495 Kier Road', to_date('15-08-1965', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1641486415, 'Nastassja-MacDo', '51 Tyrone Street', to_date('12-04-1967', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9036202046, 'Brad-Cartlidge', '45 Lynskey Street', to_date('10-08-1973', 'dd-mm-yyyy'));
commit;
prompt 700 records committed...
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2624292815, 'Meredith-Elizab', '785 Wen Road', to_date('03-01-1995', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9656994394, 'Morgan-Furay', '42 Calle Road', to_date('23-08-2017', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1180345009, 'Vonda-Biel', '25 Pete Drive', to_date('26-05-2004', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (298571852, 'Jarvis-Bruce', '37 Heron Road', to_date('17-03-1978', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1467227609, 'Tia-Curtis', '770 Peebles Street', to_date('20-02-1946', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1275474276, 'Larenz-Shorter', '83 Madeleine Road', to_date('27-06-2018', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8106824536, 'Kristin-McDorma', '33 Lindsey', to_date('28-10-1958', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (444952155, 'Christmas-Scagg', '84 Shatner Street', to_date('21-06-2006', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (827947085, 'Nicole-Spector', '34 Cozier Road', to_date('01-10-1957', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9693448051, 'Davey-Wen', '43 Phillippe Ave', to_date('17-11-2010', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4534257987, 'Natacha-Torino', '28 Steyr Road', to_date('17-12-1964', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2747127433, 'Rebecca-Bates', '13rd Street', to_date('25-09-2007', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4379708224, 'Emilio-Springfi', '27 Sheena Drive', to_date('13-02-1988', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8747716328, 'Kyle-Harris', '955 Kay Street', to_date('15-08-1966', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (66676184, 'Miles-Byrd', '3 Herbie Ave', to_date('26-03-1980', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1879716928, 'Liev-Orbit', '7 Cronin Street', to_date('17-12-1973', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (780630366, 'Bo-McKellen', '92 Luis Blvd', to_date('10-10-2015', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (488121899, 'Lucinda-Darren', '80 Stoltz Street', to_date('06-05-1972', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8955728407, 'Joshua-Gayle', '51st Street', to_date('05-04-1970', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8620636850, 'Andrae-Plummer', '55 Culkin Street', to_date('31-01-2013', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3700678157, 'Loren-Oldman', '159 Mary Beth', to_date('20-05-1976', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5230879644, 'Vincent-Gracie', '59 Pride Blvd', to_date('18-04-1956', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2424305383, 'Darren-Gandolfi', '29 Frankie Ave', to_date('24-03-1982', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (237751031, 'Ving-Cattrall', '1 Carole Street', to_date('04-02-2003', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6435765318, 'Rachid-Arthur', '74 Murphy Street', to_date('22-02-1945', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2098638983, 'Franz-Parm', '95 Nizhnevartovsk St', to_date('19-01-1942', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4812453257, 'Jane-Sevenfold', '259 Regina Street', to_date('08-12-2022', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7167314241, 'Thelma-Gibson', '440 Virginia Beach B', to_date('07-09-1978', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6481588256, 'Andrae-De Niro', '33 Simpson Drive', to_date('20-07-2017', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8150108621, 'France-Dushku', '74 Embeth', to_date('03-06-1962', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3131546965, 'Dar-Hong', '18 Pressly Street', to_date('07-02-1958', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7052491305, 'Judi-Sarandon', '38 Raye Street', to_date('07-07-2000', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6733102256, 'Dwight-Bratt', '56 Wainwright Ave', to_date('03-09-2011', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7041730513, 'Swoosie-Anderso', '251 Henriksen Drive', to_date('28-03-1955', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6890525771, 'Mary-Louise-Bro', '38 Colombo Street', to_date('02-10-1979', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8506410127, 'Dionne-Renfro', '63 Luke Street', to_date('01-11-2019', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4691101559, 'April-Orbit', '67 Arturo Blvd', to_date('11-12-2013', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5243723437, 'Eugene-Cotton', '25 Nikka Street', to_date('13-09-2000', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3742599042, 'Eliza-Def', '894 Hector Ave', to_date('23-07-1948', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4281969664, 'Radney-Brandt', '404 Blanchett Street', to_date('09-09-1991', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3991413756, 'Maury-D''Onofrio', '5 Bloemfontein Drive', to_date('19-10-1963', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9991893706, 'Susan-Hoskins', '421 Dunaway Road', to_date('27-01-1948', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5134445548, 'Elle-Dutton', '33rd Street', to_date('03-01-2016', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5978128294, 'Lloyd-Roundtree', '92 Dunaway Road', to_date('12-01-1944', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3463640606, 'Nicholas-Herndo', '40 Christie Street', to_date('21-04-2022', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7156836104, 'Bridget-Crystal', '12nd Street', to_date('08-01-1931', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (923843209, 'Leslie-Pearce', '33 Cledus Road', to_date('19-02-1971', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9285399313, 'Roger-Redford', '36 Marley Street', to_date('06-08-2020', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (690460913, 'Cloris-Studi', '11 Weaving Street', to_date('30-06-2017', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3724137337, 'Nicholas-Griffi', '162 Bachman Road', to_date('16-01-1984', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7088686490, 'Tcheky-Farrell', '72 Tom Blvd', to_date('24-01-2007', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (705686275, 'Merrilee-MacIsa', '42 Johor Bahru Road', to_date('28-09-1950', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7628788817, 'Clarence-Sisto', '84 Deborah Ave', to_date('13-11-1962', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3672525754, 'Uma-Dzundza', '32 Thomas Drive', to_date('04-04-2023', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3153591784, 'Rachel-de Lanci', '80 Downie Ave', to_date('21-04-2022', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7752479277, 'Rob-Delta', '40 Caviezel Road', to_date('30-11-1952', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5632933541, 'Spike-Day-Lewis', '74 Avon Drive', to_date('10-02-1959', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6306903122, 'Cevin-Voight', '61 Holeman Road', to_date('31-05-1933', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4799081316, 'Roger-LaBelle', '30 Peine Road', to_date('05-05-1935', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3375278810, 'Wally-Sandoval', '42 Rossellini Drive', to_date('16-12-2019', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3862590343, 'Jose-Bragg', '87 Kirshner Drive', to_date('05-04-1988', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8597002565, 'Stephen-Solido', '87 O''Hara Road', to_date('10-01-1953', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1006497041, 'Jake-Janney', '15 Rosie Drive', to_date('19-04-1949', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7260798376, 'Hilary-Morse', '51st Street', to_date('13-04-1958', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8200499697, 'Wesley-Heston', '51st Street', to_date('09-03-2015', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8209051904, 'Kirk-Murray', '87 De Niro Drive', to_date('02-12-1931', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9391060977, 'Michael-McBride', '886 Penelope Drive', to_date('17-10-1993', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2602553902, 'Gloria-Kimball', '625 Hannover Road', to_date('15-01-1983', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8200769281, 'Geraldine-Borgn', '24 Gough Street', to_date('31-03-1951', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (4266163395, 'Dabney-Ponty', '58 McElhone Street', to_date('02-06-2012', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (252714485, 'Brian-Rain', '56 Sutherland', to_date('09-06-1971', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1586986345, 'Kylie-Oszajca', '93rd Street', to_date('22-04-2001', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9146989782, 'Debbie-Costa', '23rd Street', to_date('30-10-1939', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9794773614, 'Neil-Giraldo', '85 Frankfurt Drive', to_date('07-11-1983', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1607293637, 'Isaac-Wilson', '99 Atkins', to_date('20-04-1941', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3462728704, 'Christian-Baile', '12 Neill Street', to_date('12-09-2003', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (2906723754, 'Jeffrey-Parker', '98 Gaithersburg Stre', to_date('09-10-1943', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8005300985, 'Wally-Peniston', '72 Sherman Drive', to_date('10-05-1942', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9638713556, 'Howie-Flemyng', '51 Maury', to_date('09-05-1942', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5975256613, 'Gil-Pleasure', '262 Donelly Road', to_date('22-04-2002', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (1737681759, 'Bruce-Norton', '53 England Road', to_date('30-05-1990', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6794764867, 'Martha-Warwick', '15 Diehl Road', to_date('04-03-1931', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9645845334, 'Kazem-Wilson', '12nd Street', to_date('21-12-1991', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6355554944, 'Annie-Assante', '7 Debra Blvd', to_date('14-12-1962', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8528121131, 'Simon-Kane', '76 Marianne Drive', to_date('04-11-1961', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (7583721678, 'Louise-Hershey', '62 Farris Ave', to_date('14-10-1947', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (3106355637, 'Isaac-Jackson', '34 Diamond Road', to_date('18-07-1986', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (5610917166, 'Judy-Chaplin', '99 Shocked Street', to_date('24-09-2002', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (28653247, 'Rita-Pleasence', '87 King Blvd', to_date('09-10-1990', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9655116411, 'Mac-McDowell', '1 Presley Drive', to_date('12-01-1982', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6086175544, 'Tanya-Pressly', '34 Larry Road', to_date('17-02-1956', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6453922825, 'Tori-Tomei', '60 Cruz Street', to_date('25-03-1936', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (8376446936, 'Dermot-Dupree', '7 Kate Drive', to_date('21-05-2024', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6629968678, 'Vern-Molina', '569 Don Street', to_date('09-09-2018', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (6570363055, 'Chaka-Keeslar', '9 Bush Street', to_date('06-03-1993', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (138405634, 'Debbie-Def', '98 Donna Blvd', to_date('04-04-2002', 'dd-mm-yyyy'));
insert into PATIENT (pid, patient_name, address, dateofbrith)
values (9146987606, 'Taylor-Felician', '16 Cambridge Road', to_date('21-05-1967', 'dd-mm-yyyy'));
commit;
prompt 797 records loaded
prompt Loading PHARMACY...
insert into PHARMACY (storeid, storename, city)
values (55, 'Beahan-White', 'ֵ ardice');
insert into PHARMACY (storeid, storename, city)
values (92, 'Littel Group', 'Uppsala');
insert into PHARMACY (storeid, storename, city)
values (82, 'Powlowski LLC', 'Buzdyak');
insert into PHARMACY (storeid, storename, city)
values (62, ' McCullough', 'Shengao');
insert into PHARMACY (storeid, storename, city)
values (18, 'Rosen-Harvey', 'Zaragoza');
insert into PHARMACY (storeid, storename, city)
values (73, 'Bins-Sporer', 'Roseau');
insert into PHARMACY (storeid, storename, city)
values (19, 'Cassin-Howe', 'Chengyang');
insert into PHARMACY (storeid, storename, city)
values (61, 'Wilkinson', 'Taytay');
insert into PHARMACY (storeid, storename, city)
values (69, 'Starren', 'Alvito');
insert into PHARMACY (storeid, storename, city)
values (67, 'Bode and Sons', 'Dumbֳ©a');
insert into PHARMACY (storeid, storename, city)
values (70, 'Feest and Sons', 'Xiaoshi');
insert into PHARMACY (storeid, storename, city)
values (9, 'Hansen LLC', 'Pesisir');
insert into PHARMACY (storeid, storename, city)
values (90, 'King Inc', 'Muang Xay');
insert into PHARMACY (storeid, storename, city)
values (97, 'Bergstrom', 'Hrastnik');
insert into PHARMACY (storeid, storename, city)
values (64, ' Sons', 'Archis');
insert into PHARMACY (storeid, storename, city)
values (226, 'Cruise', 'Kongserbg');
insert into PHARMACY (storeid, storename, city)
values (171, 'Coward', 'Los Angele');
insert into PHARMACY (storeid, storename, city)
values (167, 'Stallone', 'Porto aleg');
insert into PHARMACY (storeid, storename, city)
values (685, 'Snipes', 'Chirignago');
insert into PHARMACY (storeid, storename, city)
values (157, 'Burrows', 'Ponta gros');
insert into PHARMACY (storeid, storename, city)
values (747, 'McKennitt', 'Ulsteinvik');
insert into PHARMACY (storeid, storename, city)
values (459, 'Ripley', 'Istanbul');
insert into PHARMACY (storeid, storename, city)
values (344, 'Sheen', 'Lummen');
insert into PHARMACY (storeid, storename, city)
values (411, 'Richter', 'Springfiel');
insert into PHARMACY (storeid, storename, city)
values (160, 'Nelligan', 'Mountain V');
insert into PHARMACY (storeid, storename, city)
values (823, 'Rauhofer', 'Malmצ');
insert into PHARMACY (storeid, storename, city)
values (635, 'Badalucco', 'Soest');
insert into PHARMACY (storeid, storename, city)
values (875, 'Palin', 'Chapel hil');
insert into PHARMACY (storeid, storename, city)
values (149, 'Chandler', 'Kumamoto');
insert into PHARMACY (storeid, storename, city)
values (271, 'Albright', 'Elkins Par');
insert into PHARMACY (storeid, storename, city)
values (108, 'Puckett', 'Sao jose r');
insert into PHARMACY (storeid, storename, city)
values (354, 'Hornsby', 'Kuraby');
insert into PHARMACY (storeid, storename, city)
values (739, 'Cattrall', 'Rancho Pal');
insert into PHARMACY (storeid, storename, city)
values (270, 'Aniston', 'Conshohock');
insert into PHARMACY (storeid, storename, city)
values (209, 'Van Shelton', 'Olivette');
insert into PHARMACY (storeid, storename, city)
values (715, 'McCoy', 'Farmington');
insert into PHARMACY (storeid, storename, city)
values (878, 'Santa Rosa', 'North York');
insert into PHARMACY (storeid, storename, city)
values (513, 'Macy', 'Trumbull');
insert into PHARMACY (storeid, storename, city)
values (846, 'Kurtz', 'Naha');
insert into PHARMACY (storeid, storename, city)
values (310, 'Law', 'Doncaster');
insert into PHARMACY (storeid, storename, city)
values (821, 'Santana', 'Tempe');
insert into PHARMACY (storeid, storename, city)
values (433, 'Beatty', 'Lakewood');
insert into PHARMACY (storeid, storename, city)
values (340, 'Orbit', 'Zaandam');
insert into PHARMACY (storeid, storename, city)
values (679, 'Spacek', 'Lake Osweg');
insert into PHARMACY (storeid, storename, city)
values (599, 'Hanks', 'South Webe');
insert into PHARMACY (storeid, storename, city)
values (773, 'Sisto', 'Fountain H');
insert into PHARMACY (storeid, storename, city)
values (726, 'McGregor', 'Rosario');
insert into PHARMACY (storeid, storename, city)
values (316, 'Duke', 'Bekescsaba');
insert into PHARMACY (storeid, storename, city)
values (268, 'Hirsch', 'Kaiserslau');
insert into PHARMACY (storeid, storename, city)
values (780, 'Myers', 'Crete');
insert into PHARMACY (storeid, storename, city)
values (775, 'Preston', 'Raleigh');
insert into PHARMACY (storeid, storename, city)
values (735, 'Fox', 'Bonn');
insert into PHARMACY (storeid, storename, city)
values (895, 'Leto', 'Cambridge');
insert into PHARMACY (storeid, storename, city)
values (749, 'urban', 'Padova');
insert into PHARMACY (storeid, storename, city)
values (175, 'Giraldo', 'Richardson');
insert into PHARMACY (storeid, storename, city)
values (315, 'Loggia', 'Dietikon');
insert into PHARMACY (storeid, storename, city)
values (296, 'Devine', 'Huntsville');
insert into PHARMACY (storeid, storename, city)
values (802, 'Copeland', 'Coslada');
insert into PHARMACY (storeid, storename, city)
values (675, 'Head', 'Waldorf');
insert into PHARMACY (storeid, storename, city)
values (448, 'Diehl', 'Lucca');
insert into PHARMACY (storeid, storename, city)
values (548, 'Deschanel', 'Middletown');
insert into PHARMACY (storeid, storename, city)
values (866, 'Melvin', 'Portland');
insert into PHARMACY (storeid, storename, city)
values (346, 'Ferry', 'Lodi');
insert into PHARMACY (storeid, storename, city)
values (144, 'Milsap', 'Cardiff');
insert into PHARMACY (storeid, storename, city)
values (701, 'Lovitz', 'Cincinnati');
insert into PHARMACY (storeid, storename, city)
values (190, 'Hatfield', 'Boston');
insert into PHARMACY (storeid, storename, city)
values (793, 'Heron', 'Lakeville');
insert into PHARMACY (storeid, storename, city)
values (323, 'Humphrey', 'Mechanicsb');
insert into PHARMACY (storeid, storename, city)
values (728, 'LaSalle', 'Cuenca');
insert into PHARMACY (storeid, storename, city)
values (871, 'Morse', 'Chapel hil');
insert into PHARMACY (storeid, storename, city)
values (163, 'Skarsgard', 'Bautzen');
insert into PHARMACY (storeid, storename, city)
values (469, 'Plimpton', 'Roma');
insert into PHARMACY (storeid, storename, city)
values (790, 'Domino', 'Solon');
insert into PHARMACY (storeid, storename, city)
values (230, 'Holland', 'Paisley');
insert into PHARMACY (storeid, storename, city)
values (869, 'Close', 'Lowell');
insert into PHARMACY (storeid, storename, city)
values (479, 'Diddley', 'Appenzell');
insert into PHARMACY (storeid, storename, city)
values (770, 'Lofgren', 'Laguna Bbe');
insert into PHARMACY (storeid, storename, city)
values (805, 'Hartnett', 'Jun-nam');
insert into PHARMACY (storeid, storename, city)
values (712, 'Warren', 'Recife');
insert into PHARMACY (storeid, storename, city)
values (640, 'Wayans', 'Oosterhout');
insert into PHARMACY (storeid, storename, city)
values (273, 'MacPherson', 'Suffern');
insert into PHARMACY (storeid, storename, city)
values (274, 'Withers', 'New orlean');
insert into PHARMACY (storeid, storename, city)
values (215, 'Witherspoon', 'Barksdale ');
insert into PHARMACY (storeid, storename, city)
values (317, 'Atkins', 'Kaunas');
insert into PHARMACY (storeid, storename, city)
values (152, 'Beckham', 'Waldbronn');
insert into PHARMACY (storeid, storename, city)
values (709, 'Weston', 'Allen');
insert into PHARMACY (storeid, storename, city)
values (493, 'Snow', 'Den Haag');
insert into PHARMACY (storeid, storename, city)
values (113, 'Davidtz', 'King of Pr');
insert into PHARMACY (storeid, storename, city)
values (237, 'Lange', 'Salisbury');
insert into PHARMACY (storeid, storename, city)
values (174, 'Smith', 'Gainesvill');
insert into PHARMACY (storeid, storename, city)
values (652, 'Cattrall', 'Thame');
insert into PHARMACY (storeid, storename, city)
values (249, 'Rhames', 'Geneva');
commit;
prompt 92 records loaded
prompt Loading BILL...
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (721599, 454, to_date('10-06-2065', 'dd-mm-yyyy'), 726, 5610917166);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (654213, 599, to_date('15-01-2047', 'dd-mm-yyyy'), 296, 8333813172);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (259671, 485, to_date('31-05-2044', 'dd-mm-yyyy'), 90, 5265068140);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (301183, 952, to_date('08-06-2002', 'dd-mm-yyyy'), 479, 3095408415);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (281185, 441, to_date('13-03-2078', 'dd-mm-yyyy'), 274, 2598702631);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (315554, 37, to_date('09-10-2062', 'dd-mm-yyyy'), 871, 9307577365);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (145750, 248, to_date('21-08-2051', 'dd-mm-yyyy'), 157, 7011682680);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (667947, 471, to_date('15-10-2069', 'dd-mm-yyyy'), 64, 8854713151);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (110658, 121, to_date('01-05-2096', 'dd-mm-yyyy'), 317, 5391125934);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (750481, 804, to_date('23-05-2034', 'dd-mm-yyyy'), 97, 9171778426);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (208345, 124, to_date('21-04-2022', 'dd-mm-yyyy'), 805, 2735238490);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (342654, 584, to_date('16-07-2076', 'dd-mm-yyyy'), 735, 6421044455);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (350847, 964, to_date('06-02-2083', 'dd-mm-yyyy'), 728, 3056878154);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (709908, 567, to_date('13-11-2007', 'dd-mm-yyyy'), 640, 6327076733);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (166199, 497, to_date('04-11-2093', 'dd-mm-yyyy'), 61, 6627135782);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (595323, 720, to_date('12-06-2058', 'dd-mm-yyyy'), 209, 2650702456);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (278700, 767, to_date('06-07-2053', 'dd-mm-yyyy'), 270, 9079528020);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (167070, 999, to_date('29-04-2059', 'dd-mm-yyyy'), 802, 2821653724);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (567247, 973, to_date('08-01-2026', 'dd-mm-yyyy'), 548, 2789500674);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (124153, 76, to_date('12-07-2007', 'dd-mm-yyyy'), 108, 3667966373);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (723251, 995, to_date('26-09-2045', 'dd-mm-yyyy'), 739, 1644618977);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (588192, 267, to_date('18-08-2049', 'dd-mm-yyyy'), 69, 2282715352);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (171157, 615, to_date('02-01-2009', 'dd-mm-yyyy'), 18, 2442110887);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (558806, 321, to_date('29-04-2055', 'dd-mm-yyyy'), 773, 1276564186);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (560637, 340, to_date('15-01-2002', 'dd-mm-yyyy'), 895, 1651848051);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (163968, 708, to_date('06-07-2017', 'dd-mm-yyyy'), 875, 4612065585);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (736149, 765, to_date('05-02-2092', 'dd-mm-yyyy'), 323, 7275750365);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (641545, 818, to_date('03-03-2005', 'dd-mm-yyyy'), 9, 4392118107);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (221142, 814, to_date('26-07-2074', 'dd-mm-yyyy'), 149, 2862655367);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (714205, 630, to_date('19-02-2061', 'dd-mm-yyyy'), 215, 3050142559);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (650945, 976, to_date('12-11-2037', 'dd-mm-yyyy'), 157, 8239138321);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (145112, 153, to_date('04-06-2030', 'dd-mm-yyyy'), 64, 4812453257);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (886671, 260, to_date('21-08-2084', 'dd-mm-yyyy'), 190, 8066439080);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (287567, 841, to_date('09-04-2060', 'dd-mm-yyyy'), 701, 1586986345);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (308876, 848, to_date('18-10-2092', 'dd-mm-yyyy'), 513, 5096029211);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (461323, 570, to_date('15-03-2099', 'dd-mm-yyyy'), 411, 9560333691);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (497200, 43, to_date('09-02-2066', 'dd-mm-yyyy'), 780, 3700678157);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (599619, 338, to_date('14-03-2002', 'dd-mm-yyyy'), 709, 2847260761);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (777254, 403, to_date('20-06-2041', 'dd-mm-yyyy'), 701, 677791245);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (869519, 660, to_date('04-02-2043', 'dd-mm-yyyy'), 268, 1180345009);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (386402, 474, to_date('06-03-2033', 'dd-mm-yyyy'), 479, 8369078629);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (566349, 910, to_date('25-11-2016', 'dd-mm-yyyy'), 780, 5999346158);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (526966, 78, to_date('15-01-2063', 'dd-mm-yyyy'), 171, 5405923950);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (144309, 218, to_date('16-03-2019', 'dd-mm-yyyy'), 640, 9976085712);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (320132, 439, to_date('16-02-2074', 'dd-mm-yyyy'), 18, 1204271206);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (203748, 613, to_date('25-11-2012', 'dd-mm-yyyy'), 770, 1442888924);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (793952, 937, to_date('21-01-2030', 'dd-mm-yyyy'), 448, 1487915273);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (138715, 125, to_date('16-07-2054', 'dd-mm-yyyy'), 895, 838346819);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (316048, 856, to_date('31-01-2037', 'dd-mm-yyyy'), 411, 9004005678);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (232620, 510, to_date('05-02-2074', 'dd-mm-yyyy'), 167, 7802245645);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (676033, 833, to_date('27-03-2087', 'dd-mm-yyyy'), 448, 1204271206);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (489008, 28, to_date('03-03-2005', 'dd-mm-yyyy'), 635, 6186221192);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (829270, 209, to_date('15-09-2058', 'dd-mm-yyyy'), 323, 9253473117);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (213380, 741, to_date('24-03-2090', 'dd-mm-yyyy'), 226, 7752479277);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (745625, 428, to_date('12-01-2085', 'dd-mm-yyyy'), 310, 4978796597);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (659621, 171, to_date('16-12-2065', 'dd-mm-yyyy'), 675, 4052322065);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (382646, 722, to_date('12-09-2053', 'dd-mm-yyyy'), 316, 5874620561);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (771013, 371, to_date('25-04-2047', 'dd-mm-yyyy'), 749, 8845951750);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (572138, 404, to_date('11-09-2024', 'dd-mm-yyyy'), 64, 2430278826);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (230994, 640, to_date('28-07-2007', 'dd-mm-yyyy'), 747, 5727503710);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (822366, 394, to_date('14-02-2026', 'dd-mm-yyyy'), 679, 5615303290);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (142673, 746, to_date('18-06-2076', 'dd-mm-yyyy'), 793, 8719990116);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (145179, 41, to_date('21-03-2093', 'dd-mm-yyyy'), 823, 135912253);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (328824, 727, to_date('17-05-2080', 'dd-mm-yyyy'), 316, 8501725383);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (268109, 122, to_date('06-02-2026', 'dd-mm-yyyy'), 310, 9085244040);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (135455, 670, to_date('14-05-2009', 'dd-mm-yyyy'), 230, 8059277411);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (836024, 912, to_date('25-06-2055', 'dd-mm-yyyy'), 773, 9307577365);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (582217, 361, to_date('04-03-2046', 'dd-mm-yyyy'), 273, 9004005678);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (295224, 784, to_date('17-08-2081', 'dd-mm-yyyy'), 249, 9078397088);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (781811, 939, to_date('26-12-2013', 'dd-mm-yyyy'), 821, 3056878154);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (134869, 685, to_date('22-08-2095', 'dd-mm-yyyy'), 215, 8597002565);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (598244, 756, to_date('13-09-2023', 'dd-mm-yyyy'), 790, 740950024);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (486432, 368, to_date('21-02-2060', 'dd-mm-yyyy'), 167, 2676285820);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (780123, 27, to_date('07-11-2008', 'dd-mm-yyyy'), 171, 5329756834);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (201376, 245, to_date('31-01-2025', 'dd-mm-yyyy'), 97, 2672442455);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (740416, 721, to_date('01-11-2058', 'dd-mm-yyyy'), 9, 3228235920);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (890575, 529, to_date('10-08-2039', 'dd-mm-yyyy'), 167, 8040472363);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (207940, 988, to_date('04-06-2079', 'dd-mm-yyyy'), 271, 6099122506);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (865982, 642, to_date('17-01-2099', 'dd-mm-yyyy'), 237, 2193299572);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (398552, 277, to_date('17-06-2055', 'dd-mm-yyyy'), 271, 2787657983);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (325876, 172, to_date('27-09-2093', 'dd-mm-yyyy'), 780, 6424162586);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (595368, 847, to_date('03-12-2044', 'dd-mm-yyyy'), 215, 7680227012);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (719505, 588, to_date('02-02-2009', 'dd-mm-yyyy'), 875, 4547591175);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (137559, 528, to_date('18-11-2027', 'dd-mm-yyyy'), 548, 7583721678);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (265256, 926, to_date('19-01-2021', 'dd-mm-yyyy'), 895, 3271688078);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (846109, 47, to_date('05-02-2049', 'dd-mm-yyyy'), 70, 3706544751);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (528522, 494, to_date('12-09-2043', 'dd-mm-yyyy'), 274, 2737174168);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (712622, 945, to_date('20-10-2060', 'dd-mm-yyyy'), 97, 1269139529);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (241157, 603, to_date('29-06-2072', 'dd-mm-yyyy'), 90, 6134310273);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (493666, 737, to_date('11-05-2073', 'dd-mm-yyyy'), 821, 5625721562);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (214034, 267, to_date('23-01-2034', 'dd-mm-yyyy'), 749, 260562136);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (138284, 481, to_date('19-09-2087', 'dd-mm-yyyy'), 163, 2950183925);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (507411, 32, to_date('03-04-2057', 'dd-mm-yyyy'), 174, 7716515305);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (380201, 952, to_date('12-09-2095', 'dd-mm-yyyy'), 274, 4018682000);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (830907, 378, to_date('17-05-2027', 'dd-mm-yyyy'), 805, 2069260507);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (598959, 203, to_date('25-09-2023', 'dd-mm-yyyy'), 323, 2033807938);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (695635, 843, to_date('08-07-2031', 'dd-mm-yyyy'), 19, 7049782054);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (645548, 981, to_date('12-11-2043', 'dd-mm-yyyy'), 846, 5265068140);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (785593, 902, to_date('10-09-2054', 'dd-mm-yyyy'), 599, 2821653724);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (388326, 348, to_date('11-09-2013', 'dd-mm-yyyy'), 144, 3700678157);
commit;
prompt 100 records committed...
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (203662, 83, to_date('13-10-2099', 'dd-mm-yyyy'), 273, 1076007260);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (113879, 473, to_date('16-03-2016', 'dd-mm-yyyy'), 739, 7041730513);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (529645, 544, to_date('29-08-2085', 'dd-mm-yyyy'), 69, 3001656492);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (665144, 986, to_date('10-08-2081', 'dd-mm-yyyy'), 712, 5009216736);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (653499, 767, to_date('03-07-2083', 'dd-mm-yyyy'), 821, 5279512177);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (565538, 73, to_date('16-08-2068', 'dd-mm-yyyy'), 160, 212699107);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (566497, 871, to_date('16-03-2087', 'dd-mm-yyyy'), 479, 4259075590);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (212966, 707, to_date('28-03-2092', 'dd-mm-yyyy'), 640, 3106355637);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (556311, 722, to_date('03-09-2036', 'dd-mm-yyyy'), 61, 703633799);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (381515, 636, to_date('01-02-2091', 'dd-mm-yyyy'), 513, 3025439079);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (209033, 228, to_date('14-06-2028', 'dd-mm-yyyy'), 73, 116628391);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (391265, 998, to_date('17-11-2060', 'dd-mm-yyyy'), 9, 4018682000);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (521954, 333, to_date('31-01-2013', 'dd-mm-yyyy'), 215, 2298287577);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (648092, 321, to_date('12-02-2022', 'dd-mm-yyyy'), 479, 1335130312);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (725440, 94, to_date('01-01-2099', 'dd-mm-yyyy'), 296, 923458864);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (265461, 248, to_date('12-03-2072', 'dd-mm-yyyy'), 171, 2080013212);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (750518, 52, to_date('03-12-2014', 'dd-mm-yyyy'), 270, 7477457203);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (609133, 102, to_date('18-09-2074', 'dd-mm-yyyy'), 770, 7781164729);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (710835, 838, to_date('04-10-2032', 'dd-mm-yyyy'), 316, 2100964902);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (503358, 538, to_date('29-01-2094', 'dd-mm-yyyy'), 9, 9794773614);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (743414, 781, to_date('29-05-2077', 'dd-mm-yyyy'), 875, 7716515305);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (353537, 505, to_date('25-02-2072', 'dd-mm-yyyy'), 160, 4039010958);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (522179, 123, to_date('23-07-2054', 'dd-mm-yyyy'), 770, 8854713151);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (425485, 639, to_date('20-06-2097', 'dd-mm-yyyy'), 709, 116628391);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (171491, 486, to_date('01-03-2069', 'dd-mm-yyyy'), 448, 7583721678);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (825345, 609, to_date('17-01-2017', 'dd-mm-yyyy'), 821, 7716515305);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (813973, 449, to_date('10-09-2091', 'dd-mm-yyyy'), 354, 4554752400);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (796844, 904, to_date('25-01-2018', 'dd-mm-yyyy'), 878, 5033656295);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (837683, 647, to_date('21-12-2012', 'dd-mm-yyyy'), 82, 5625721562);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (244004, 606, to_date('12-03-2042', 'dd-mm-yyyy'), 19, 3590028638);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (412226, 545, to_date('31-07-2017', 'dd-mm-yyyy'), 315, 7628788817);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (347565, 954, to_date('17-11-2020', 'dd-mm-yyyy'), 317, 172248999);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (271678, 418, to_date('26-08-2056', 'dd-mm-yyyy'), 268, 63623209);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (622288, 482, to_date('23-07-2016', 'dd-mm-yyyy'), 599, 1552557814);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (564217, 621, to_date('07-10-2019', 'dd-mm-yyyy'), 770, 1851758966);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (609966, 349, to_date('12-07-2053', 'dd-mm-yyyy'), 685, 2787657983);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (494143, 588, to_date('16-09-2048', 'dd-mm-yyyy'), 152, 7083269113);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (669371, 591, to_date('24-11-2004', 'dd-mm-yyyy'), 64, 125934259);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (401528, 700, to_date('24-05-2009', 'dd-mm-yyyy'), 869, 7382423346);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (259519, 660, to_date('13-04-2099', 'dd-mm-yyyy'), 323, 6818851312);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (487949, 712, to_date('20-06-2098', 'dd-mm-yyyy'), 274, 9699404637);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (366562, 197, to_date('03-06-2004', 'dd-mm-yyyy'), 149, 1104622457);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (653868, 514, to_date('30-05-2014', 'dd-mm-yyyy'), 61, 3045915626);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (347226, 603, to_date('15-09-2065', 'dd-mm-yyyy'), 296, 9320439468);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (313949, 24, to_date('03-05-2025', 'dd-mm-yyyy'), 770, 9446174490);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (303194, 260, to_date('08-12-2006', 'dd-mm-yyyy'), 895, 9688435014);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (851164, 709, to_date('07-08-2023', 'dd-mm-yyyy'), 599, 5326805372);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (410895, 176, to_date('06-12-2069', 'dd-mm-yyyy'), 61, 6733102256);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (208783, 988, to_date('20-12-2026', 'dd-mm-yyyy'), 270, 6035643326);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (660168, 16, to_date('08-12-2059', 'dd-mm-yyyy'), 9, 9884275096);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (251448, 328, to_date('27-09-2073', 'dd-mm-yyyy'), 61, 4575986113);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (852827, 955, to_date('26-05-2006', 'dd-mm-yyyy'), 82, 8282926254);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (602208, 587, to_date('30-11-2020', 'dd-mm-yyyy'), 875, 9326040660);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (128651, 162, to_date('11-01-2025', 'dd-mm-yyyy'), 715, 5054621175);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (132021, 819, to_date('16-12-2096', 'dd-mm-yyyy'), 19, 2467763074);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (771406, 981, to_date('07-02-2008', 'dd-mm-yyyy'), 679, 2967054387);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (391462, 735, to_date('09-07-2039', 'dd-mm-yyyy'), 739, 6733102256);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (851443, 675, to_date('15-03-2057', 'dd-mm-yyyy'), 55, 9264429377);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (481391, 49, to_date('02-08-2070', 'dd-mm-yyyy'), 274, 5668061348);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (634100, 903, to_date('12-03-2037', 'dd-mm-yyyy'), 344, 9157164038);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (610168, 385, to_date('18-09-2082', 'dd-mm-yyyy'), 701, 2699127960);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (874478, 570, to_date('09-04-2053', 'dd-mm-yyyy'), 869, 3074199391);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (329496, 53, to_date('25-07-2036', 'dd-mm-yyyy'), 167, 2332627179);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (179366, 299, to_date('14-12-2065', 'dd-mm-yyyy'), 62, 1737681759);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (829253, 229, to_date('07-06-2058', 'dd-mm-yyyy'), 871, 8800053076);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (596002, 146, to_date('23-01-2043', 'dd-mm-yyyy'), 701, 4256252645);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (753720, 512, to_date('06-10-2082', 'dd-mm-yyyy'), 70, 4902625897);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (534955, 359, to_date('24-12-2033', 'dd-mm-yyyy'), 230, 8200769281);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (627410, 75, to_date('11-04-2065', 'dd-mm-yyyy'), 895, 9766392805);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (300899, 513, to_date('01-09-2021', 'dd-mm-yyyy'), 773, 2343422446);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (198169, 181, to_date('21-03-2003', 'dd-mm-yyyy'), 108, 8625152011);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (540134, 331, to_date('25-08-2092', 'dd-mm-yyyy'), 9, 3590028638);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (268592, 267, to_date('11-03-2097', 'dd-mm-yyyy'), 237, 3045915626);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (467671, 450, to_date('09-04-2046', 'dd-mm-yyyy'), 230, 5294743118);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (743747, 771, to_date('10-08-2079', 'dd-mm-yyyy'), 640, 5391125934);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (659308, 424, to_date('01-09-2072', 'dd-mm-yyyy'), 685, 3153591784);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (524030, 759, to_date('08-10-2074', 'dd-mm-yyyy'), 869, 6339273345);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (735577, 882, to_date('14-12-2045', 'dd-mm-yyyy'), 712, 6435765318);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (166499, 995, to_date('02-02-2051', 'dd-mm-yyyy'), 237, 5134445548);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (874547, 66, to_date('23-09-2035', 'dd-mm-yyyy'), 469, 5700714576);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (176285, 709, to_date('30-11-2032', 'dd-mm-yyyy'), 90, 5610917166);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (819427, 541, to_date('05-12-2017', 'dd-mm-yyyy'), 149, 249867037);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (821751, 786, to_date('20-09-2064', 'dd-mm-yyyy'), 296, 2332627179);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (744523, 720, to_date('10-03-2096', 'dd-mm-yyyy'), 226, 562498651);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (342832, 679, to_date('23-07-2019', 'dd-mm-yyyy'), 230, 9941512260);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (459538, 587, to_date('21-08-2008', 'dd-mm-yyyy'), 90, 7680090398);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (191511, 904, to_date('11-08-2023', 'dd-mm-yyyy'), 846, 4509200447);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (417354, 641, to_date('15-09-2023', 'dd-mm-yyyy'), 152, 9146989782);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (156679, 838, to_date('21-01-2085', 'dd-mm-yyyy'), 144, 4773656535);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (494335, 250, to_date('28-02-2003', 'dd-mm-yyyy'), 61, 3708576324);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (132671, 424, to_date('10-01-2075', 'dd-mm-yyyy'), 323, 562498651);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (784850, 288, to_date('30-09-2062', 'dd-mm-yyyy'), 19, 6355554944);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (541511, 733, to_date('18-01-2067', 'dd-mm-yyyy'), 323, 1604229643);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (143119, 784, to_date('28-04-2071', 'dd-mm-yyyy'), 175, 6733102256);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (863480, 839, to_date('17-08-2005', 'dd-mm-yyyy'), 92, 9285399313);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (365663, 271, to_date('17-12-2029', 'dd-mm-yyyy'), 793, 8542734841);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (218863, 530, to_date('14-05-2000', 'dd-mm-yyyy'), 215, 3084392759);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (186485, 286, to_date('16-01-2044', 'dd-mm-yyyy'), 209, 3074199391);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (325793, 763, to_date('07-01-2036', 'dd-mm-yyyy'), 270, 2719906953);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (304858, 44, to_date('18-04-2075', 'dd-mm-yyyy'), 108, 9578311643);
commit;
prompt 200 records committed...
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (284840, 800, to_date('09-10-2006', 'dd-mm-yyyy'), 226, 4615015128);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (331900, 164, to_date('26-03-2018', 'dd-mm-yyyy'), 268, 2672442455);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (560619, 465, to_date('18-10-2031', 'dd-mm-yyyy'), 747, 3367922444);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (277369, 736, to_date('03-11-2017', 'dd-mm-yyyy'), 249, 4678571025);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (293847, 234, to_date('13-02-2044', 'dd-mm-yyyy'), 747, 6293483388);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (851932, 312, to_date('16-10-2013', 'dd-mm-yyyy'), 747, 5555480190);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (534432, 720, to_date('19-04-2073', 'dd-mm-yyyy'), 735, 7474837816);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (282880, 805, to_date('17-04-2092', 'dd-mm-yyyy'), 152, 9326040660);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (186864, 880, to_date('21-09-2019', 'dd-mm-yyyy'), 895, 6203363312);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (382641, 296, to_date('18-01-2031', 'dd-mm-yyyy'), 175, 8962972466);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (653773, 716, to_date('26-03-2051', 'dd-mm-yyyy'), 317, 2424305383);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (319598, 439, to_date('12-01-2067', 'dd-mm-yyyy'), 493, 9951010448);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (201752, 769, to_date('18-07-2097', 'dd-mm-yyyy'), 171, 5700714576);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (369627, 69, to_date('07-03-2082', 'dd-mm-yyyy'), 869, 251495986);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (405628, 987, to_date('08-05-2080', 'dd-mm-yyyy'), 709, 9871899056);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (524443, 869, to_date('09-09-2019', 'dd-mm-yyyy'), 175, 4784421443);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (703081, 44, to_date('08-12-2053', 'dd-mm-yyyy'), 323, 8239138321);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (449223, 48, to_date('10-12-2094', 'dd-mm-yyyy'), 802, 9386595139);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (361096, 632, to_date('30-05-2048', 'dd-mm-yyyy'), 479, 6866772535);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (567140, 18, to_date('07-03-2081', 'dd-mm-yyyy'), 18, 8526093833);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (868999, 932, to_date('29-07-2061', 'dd-mm-yyyy'), 846, 8138460763);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (452362, 572, to_date('26-03-2012', 'dd-mm-yyyy'), 652, 1586986345);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (779828, 274, to_date('20-07-2042', 'dd-mm-yyyy'), 875, 720729115);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (485712, 162, to_date('28-02-2084', 'dd-mm-yyyy'), 802, 7680227012);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (172628, 199, to_date('05-05-2006', 'dd-mm-yyyy'), 773, 843322921);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (118583, 54, to_date('20-11-2035', 'dd-mm-yyyy'), 805, 843322921);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (452748, 518, to_date('23-04-2020', 'dd-mm-yyyy'), 171, 5062418361);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (550890, 522, to_date('02-10-2076', 'dd-mm-yyyy'), 878, 7680090398);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (395494, 915, to_date('11-10-2066', 'dd-mm-yyyy'), 18, 1104622457);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (607705, 366, to_date('21-02-2088', 'dd-mm-yyyy'), 715, 7476503106);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (420571, 876, to_date('14-06-2017', 'dd-mm-yyyy'), 869, 7819480527);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (346920, 951, to_date('14-08-2087', 'dd-mm-yyyy'), 448, 9815564305);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (510479, 663, to_date('30-10-2010', 'dd-mm-yyyy'), 316, 2953780050);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (896652, 256, to_date('19-03-2089', 'dd-mm-yyyy'), 190, 5185439905);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (605577, 406, to_date('24-10-2009', 'dd-mm-yyyy'), 866, 5690600610);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (656283, 156, to_date('27-02-2053', 'dd-mm-yyyy'), 237, 3056878154);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (171819, 539, to_date('28-07-2089', 'dd-mm-yyyy'), 599, 2858710043);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (748935, 846, to_date('13-06-2074', 'dd-mm-yyyy'), 749, 8050148664);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (794186, 540, to_date('23-04-2071', 'dd-mm-yyyy'), 459, 6556923950);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (735814, 109, to_date('07-12-2042', 'dd-mm-yyyy'), 726, 1119964055);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (549621, 555, to_date('04-08-2032', 'dd-mm-yyyy'), 869, 7412847734);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (544292, 502, to_date('02-06-2099', 'dd-mm-yyyy'), 270, 7625689880);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (807807, 839, to_date('10-05-2095', 'dd-mm-yyyy'), 846, 3050142559);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (571733, 580, to_date('09-02-2044', 'dd-mm-yyyy'), 9, 7680227012);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (246415, 302, to_date('14-09-2074', 'dd-mm-yyyy'), 773, 8458883351);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (455981, 633, to_date('27-06-2006', 'dd-mm-yyyy'), 749, 1879716928);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (499467, 657, to_date('03-11-2071', 'dd-mm-yyyy'), 790, 2650702456);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (301084, 955, to_date('11-12-2090', 'dd-mm-yyyy'), 469, 3106355637);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (233245, 994, to_date('20-09-2068', 'dd-mm-yyyy'), 9, 3758818271);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (863236, 205, to_date('18-03-2051', 'dd-mm-yyyy'), 160, 6057615233);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (413727, 957, to_date('30-10-2036', 'dd-mm-yyyy'), 652, 1180345009);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (387071, 775, to_date('31-03-2050', 'dd-mm-yyyy'), 315, 2851767758);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (742775, 231, to_date('09-12-2063', 'dd-mm-yyyy'), 73, 2047588709);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (486363, 23, to_date('17-01-2012', 'dd-mm-yyyy'), 97, 9766392805);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (147369, 753, to_date('05-04-2037', 'dd-mm-yyyy'), 323, 3888642500);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (735809, 647, to_date('09-09-2098', 'dd-mm-yyyy'), 749, 3667966373);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (456939, 115, to_date('11-01-2055', 'dd-mm-yyyy'), 780, 4256252645);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (132020, 74, to_date('24-10-2031', 'dd-mm-yyyy'), 802, 5397248555);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (448378, 909, to_date('20-09-2077', 'dd-mm-yyyy'), 773, 9578311643);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (341979, 471, to_date('01-01-2053', 'dd-mm-yyyy'), 479, 3153591784);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (526623, 555, to_date('13-01-2031', 'dd-mm-yyyy'), 73, 3991413756);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (136123, 488, to_date('22-04-2064', 'dd-mm-yyyy'), 230, 7240786121);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (890693, 304, to_date('24-07-2041', 'dd-mm-yyyy'), 805, 4048125266);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (850888, 141, to_date('25-11-2038', 'dd-mm-yyyy'), 739, 6203363312);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (160868, 893, to_date('22-02-2079', 'dd-mm-yyyy'), 780, 6733102256);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (591931, 897, to_date('15-07-2024', 'dd-mm-yyyy'), 878, 2037867466);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (362242, 562, to_date('08-07-2003', 'dd-mm-yyyy'), 174, 8614252491);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (824434, 139, to_date('22-09-2009', 'dd-mm-yyyy'), 271, 4571728402);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (323113, 187, to_date('13-12-2022', 'dd-mm-yyyy'), 701, 3708576324);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (850770, 250, to_date('09-01-2066', 'dd-mm-yyyy'), 82, 5147263180);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (603770, 860, to_date('05-01-2076', 'dd-mm-yyyy'), 411, 6219652128);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (498480, 714, to_date('29-09-2050', 'dd-mm-yyyy'), 344, 1586077648);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (271965, 783, to_date('04-11-2099', 'dd-mm-yyyy'), 346, 3850133825);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (582929, 389, to_date('27-07-2033', 'dd-mm-yyyy'), 19, 6231366908);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (435926, 535, to_date('07-05-2056', 'dd-mm-yyyy'), 712, 6733102256);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (219136, 540, to_date('10-01-2030', 'dd-mm-yyyy'), 749, 4196603881);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (684006, 19, to_date('19-04-2007', 'dd-mm-yyyy'), 249, 8631835652);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (886206, 905, to_date('15-12-2064', 'dd-mm-yyyy'), 249, 7781164729);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (512155, 477, to_date('15-12-2066', 'dd-mm-yyyy'), 548, 7519133180);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (745441, 48, to_date('27-10-2081', 'dd-mm-yyyy'), 679, 3143108779);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (896120, 173, to_date('20-08-2072', 'dd-mm-yyyy'), 709, 5615303290);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (129600, 108, to_date('10-01-2040', 'dd-mm-yyyy'), 144, 1180345009);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (234851, 540, to_date('23-11-2005', 'dd-mm-yyyy'), 268, 7519133180);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (205956, 843, to_date('04-06-2033', 'dd-mm-yyyy'), 354, 5975256613);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (404863, 29, to_date('24-01-2026', 'dd-mm-yyyy'), 770, 8542734841);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (219678, 122, to_date('14-07-2000', 'dd-mm-yyyy'), 175, 266476233);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (672310, 466, to_date('26-10-2049', 'dd-mm-yyyy'), 805, 4018682000);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (296762, 876, to_date('27-05-2011', 'dd-mm-yyyy'), 869, 4554752400);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (560361, 643, to_date('08-08-2081', 'dd-mm-yyyy'), 230, 9976085712);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (777084, 430, to_date('08-04-2089', 'dd-mm-yyyy'), 635, 2725669272);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (313943, 35, to_date('12-07-2076', 'dd-mm-yyyy'), 113, 7382811327);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (108366, 302, to_date('10-03-2088', 'dd-mm-yyyy'), 61, 6356019700);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (192232, 201, to_date('31-07-2055', 'dd-mm-yyyy'), 70, 5115289455);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (510708, 396, to_date('23-10-2081', 'dd-mm-yyyy'), 274, 3025439079);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (301293, 455, to_date('24-05-2099', 'dd-mm-yyyy'), 92, 6279580699);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (169007, 189, to_date('01-12-2054', 'dd-mm-yyyy'), 18, 562498651);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (705051, 46, to_date('24-06-2077', 'dd-mm-yyyy'), 113, 7886324942);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (477014, 579, to_date('13-06-2009', 'dd-mm-yyyy'), 433, 4126971214);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (772314, 193, to_date('19-09-2030', 'dd-mm-yyyy'), 67, 4547591175);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (291880, 497, to_date('22-06-2031', 'dd-mm-yyyy'), 469, 6020769591);
commit;
prompt 300 records committed...
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (380835, 259, to_date('12-09-2072', 'dd-mm-yyyy'), 770, 7412847734);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (112025, 867, to_date('12-08-2096', 'dd-mm-yyyy'), 61, 4256252645);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (556445, 763, to_date('08-05-2016', 'dd-mm-yyyy'), 340, 6101291032);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (613750, 11, to_date('14-09-2049', 'dd-mm-yyyy'), 62, 3050142559);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (226068, 391, to_date('31-12-2021', 'dd-mm-yyyy'), 69, 4141793382);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (323457, 738, to_date('27-04-2061', 'dd-mm-yyyy'), 317, 1716579394);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (657955, 179, to_date('28-08-2008', 'dd-mm-yyyy'), 878, 7086312432);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (212489, 136, to_date('04-09-2070', 'dd-mm-yyyy'), 144, 1386972257);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (700754, 208, to_date('18-04-2027', 'dd-mm-yyyy'), 770, 3777652537);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (130514, 200, to_date('05-01-2052', 'dd-mm-yyyy'), 157, 1567710482);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (165077, 80, to_date('11-01-2070', 'dd-mm-yyyy'), 469, 2906723754);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (691010, 732, to_date('30-12-2021', 'dd-mm-yyyy'), 871, 6424162586);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (866997, 552, to_date('21-06-2038', 'dd-mm-yyyy'), 599, 3147971085);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (738847, 198, to_date('17-04-2019', 'dd-mm-yyyy'), 344, 7569305487);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (622420, 742, to_date('13-03-2024', 'dd-mm-yyyy'), 346, 4690793583);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (715104, 417, to_date('20-01-2066', 'dd-mm-yyyy'), 805, 3469440964);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (494620, 696, to_date('11-12-2020', 'dd-mm-yyyy'), 62, 7684878155);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (738148, 532, to_date('14-12-2045', 'dd-mm-yyyy'), 237, 1552557814);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (704160, 473, to_date('11-06-2097', 'dd-mm-yyyy'), 317, 1651256604);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (492693, 1000, to_date('06-03-2035', 'dd-mm-yyyy'), 747, 9793895725);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (261311, 775, to_date('12-08-2068', 'dd-mm-yyyy'), 770, 2316446254);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (709926, 596, to_date('22-09-2083', 'dd-mm-yyyy'), 770, 9320439468);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (825517, 122, to_date('20-12-2016', 'dd-mm-yyyy'), 652, 6338789082);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (181983, 964, to_date('08-08-2094', 'dd-mm-yyyy'), 775, 5610917166);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (184801, 181, to_date('30-11-2091', 'dd-mm-yyyy'), 846, 677791245);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (532921, 473, to_date('23-03-2070', 'dd-mm-yyyy'), 237, 6244456267);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (730010, 689, to_date('25-07-2058', 'dd-mm-yyyy'), 315, 1150246000);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (416025, 189, to_date('31-03-2019', 'dd-mm-yyyy'), 190, 9638713556);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (624570, 6, to_date('28-08-2035', 'dd-mm-yyyy'), 175, 8526093833);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (873681, 191, to_date('30-06-2024', 'dd-mm-yyyy'), 821, 63623209);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (489992, 264, to_date('14-10-2060', 'dd-mm-yyyy'), 144, 3870906378);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (531181, 310, to_date('24-02-2095', 'dd-mm-yyyy'), 493, 6890525771);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (790590, 914, to_date('06-05-2006', 'dd-mm-yyyy'), 712, 274232091);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (549793, 177, to_date('16-08-2044', 'dd-mm-yyyy'), 237, 8800053076);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (357973, 784, to_date('02-11-2047', 'dd-mm-yyyy'), 493, 2491703566);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (686996, 410, to_date('03-08-2081', 'dd-mm-yyyy'), 237, 7466485462);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (296596, 32, to_date('26-08-2013', 'dd-mm-yyyy'), 739, 2298287577);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (853277, 220, to_date('22-10-2055', 'dd-mm-yyyy'), 171, 4784421443);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (706217, 347, to_date('19-04-2028', 'dd-mm-yyyy'), 790, 1706805805);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (664978, 949, to_date('02-10-2094', 'dd-mm-yyyy'), 316, 8979156202);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (695389, 736, to_date('24-09-2055', 'dd-mm-yyyy'), 635, 3850133825);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (121623, 472, to_date('20-05-2082', 'dd-mm-yyyy'), 875, 7625689880);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (292121, 54, to_date('18-12-2061', 'dd-mm-yyyy'), 97, 8405010754);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (333787, 105, to_date('15-12-2098', 'dd-mm-yyyy'), 635, 9225267582);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (133668, 429, to_date('30-01-2003', 'dd-mm-yyyy'), 878, 6306903122);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (444002, 307, to_date('20-03-2042', 'dd-mm-yyyy'), 712, 5486027872);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (886882, 629, to_date('23-11-2011', 'dd-mm-yyyy'), 323, 285573987);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (568322, 960, to_date('16-04-2016', 'dd-mm-yyyy'), 770, 3639001138);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (863900, 681, to_date('16-08-2060', 'dd-mm-yyyy'), 773, 6957966962);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (590111, 55, to_date('09-11-2086', 'dd-mm-yyyy'), 92, 7366936679);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (104932, 287, to_date('05-12-2023', 'dd-mm-yyyy'), 726, 4067697962);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (410221, 186, to_date('13-09-2090', 'dd-mm-yyyy'), 175, 8900246443);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (750709, 327, to_date('09-09-2012', 'dd-mm-yyyy'), 317, 177950990);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (649199, 941, to_date('22-12-2035', 'dd-mm-yyyy'), 226, 4800630299);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (871675, 598, to_date('31-10-2000', 'dd-mm-yyyy'), 735, 8502576758);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (857264, 173, to_date('07-05-2067', 'dd-mm-yyyy'), 493, 5884006982);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (109310, 400, to_date('07-08-2080', 'dd-mm-yyyy'), 895, 9871899056);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (866729, 745, to_date('11-06-2079', 'dd-mm-yyyy'), 344, 9085244040);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (566978, 320, to_date('02-04-2063', 'dd-mm-yyyy'), 273, 6733102256);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (269187, 747, to_date('13-04-2073', 'dd-mm-yyyy'), 469, 4266163395);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (213468, 987, to_date('22-07-2047', 'dd-mm-yyyy'), 167, 670226637);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (566206, 8, to_date('21-07-2045', 'dd-mm-yyyy'), 712, 7088686490);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (681974, 440, to_date('29-08-2014', 'dd-mm-yyyy'), 55, 6764517788);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (177394, 920, to_date('25-04-2010', 'dd-mm-yyyy'), 770, 8934508248);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (410483, 392, to_date('18-06-2030', 'dd-mm-yyyy'), 82, 6424162586);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (843662, 804, to_date('08-10-2058', 'dd-mm-yyyy'), 268, 8369078629);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (426617, 913, to_date('13-07-2052', 'dd-mm-yyyy'), 226, 8059277411);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (486087, 335, to_date('02-01-2096', 'dd-mm-yyyy'), 726, 6306903122);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (180717, 189, to_date('12-06-2003', 'dd-mm-yyyy'), 273, 7477457203);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (522291, 397, to_date('21-06-2035', 'dd-mm-yyyy'), 149, 8501725383);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (325537, 820, to_date('06-11-2092', 'dd-mm-yyyy'), 548, 1956620747);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (852285, 330, to_date('08-10-2013', 'dd-mm-yyyy'), 64, 2962567637);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (679142, 48, to_date('13-09-2002', 'dd-mm-yyyy'), 685, 1442888924);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (654747, 317, to_date('14-02-2091', 'dd-mm-yyyy'), 171, 875335878);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (439675, 939, to_date('19-03-2000', 'dd-mm-yyyy'), 513, 5490097346);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (432269, 786, to_date('30-12-2057', 'dd-mm-yyyy'), 793, 2285140096);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (496429, 431, to_date('21-05-2067', 'dd-mm-yyyy'), 108, 4789045305);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (260592, 656, to_date('28-04-2057', 'dd-mm-yyyy'), 108, 3460471591);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (451185, 969, to_date('11-09-2040', 'dd-mm-yyyy'), 160, 1651848051);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (381921, 197, to_date('05-02-2085', 'dd-mm-yyyy'), 160, 6103573424);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (577058, 511, to_date('19-03-2096', 'dd-mm-yyyy'), 62, 1836070159);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (586408, 633, to_date('15-02-2032', 'dd-mm-yyyy'), 878, 7288137407);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (249137, 874, to_date('14-08-2099', 'dd-mm-yyyy'), 640, 4388188284);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (898469, 616, to_date('25-06-2006', 'dd-mm-yyyy'), 685, 488121899);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (631971, 947, to_date('03-07-2024', 'dd-mm-yyyy'), 152, 7824676506);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (176054, 720, to_date('12-02-2012', 'dd-mm-yyyy'), 237, 1467227609);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (653489, 94, to_date('24-06-2031', 'dd-mm-yyyy'), 61, 9699404637);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (791143, 409, to_date('05-05-2084', 'dd-mm-yyyy'), 73, 9481619464);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (783241, 343, to_date('08-04-2051', 'dd-mm-yyyy'), 97, 4105849044);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (838596, 877, to_date('31-08-2079', 'dd-mm-yyyy'), 167, 4812453257);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (114836, 613, to_date('12-03-2034', 'dd-mm-yyyy'), 273, 2285140096);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (568238, 988, to_date('26-03-2016', 'dd-mm-yyyy'), 679, 9794773614);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (778290, 530, to_date('16-02-2071', 'dd-mm-yyyy'), 237, 6818831711);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (801368, 698, to_date('18-10-2043', 'dd-mm-yyyy'), 315, 775945376);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (227460, 93, to_date('01-11-2064', 'dd-mm-yyyy'), 513, 1950149947);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (628080, 938, to_date('02-05-2019', 'dd-mm-yyyy'), 157, 5318875563);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (511121, 8, to_date('10-09-2090', 'dd-mm-yyyy'), 675, 7363741486);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (335721, 511, to_date('30-01-2058', 'dd-mm-yyyy'), 821, 7853982434);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (293137, 593, to_date('25-01-2039', 'dd-mm-yyyy'), 323, 2033807938);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (741396, 226, to_date('09-05-2050', 'dd-mm-yyyy'), 18, 604215135);
commit;
prompt 400 records committed...
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (188099, 171, to_date('03-02-2034', 'dd-mm-yyyy'), 316, 4051156201);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (542901, 722, to_date('25-01-2064', 'dd-mm-yyyy'), 226, 143282749);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (573240, 580, to_date('11-06-2081', 'dd-mm-yyyy'), 479, 3160491108);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (812594, 390, to_date('19-01-2022', 'dd-mm-yyyy'), 513, 6535501237);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (275744, 169, to_date('12-05-2067', 'dd-mm-yyyy'), 230, 2316446254);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (187598, 969, to_date('01-08-2033', 'dd-mm-yyyy'), 712, 7569305487);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (466623, 227, to_date('20-10-2018', 'dd-mm-yyyy'), 18, 6234157747);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (707452, 903, to_date('28-03-2002', 'dd-mm-yyyy'), 685, 723779796);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (768071, 512, to_date('09-05-2096', 'dd-mm-yyyy'), 773, 8211880450);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (466645, 858, to_date('12-06-2008', 'dd-mm-yyyy'), 793, 8962972466);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (450780, 234, to_date('20-11-2033', 'dd-mm-yyyy'), 209, 4357547490);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (334708, 121, to_date('02-04-2006', 'dd-mm-yyyy'), 685, 2927351525);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (310951, 793, to_date('21-11-2017', 'dd-mm-yyyy'), 513, 5202009039);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (600378, 350, to_date('10-12-2060', 'dd-mm-yyyy'), 709, 6877448138);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (823788, 651, to_date('04-06-2021', 'dd-mm-yyyy'), 270, 2343422446);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (569056, 487, to_date('31-10-2018', 'dd-mm-yyyy'), 715, 3031691720);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (721016, 108, to_date('21-10-2028', 'dd-mm-yyyy'), 652, 4761725816);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (134146, 83, to_date('25-07-2023', 'dd-mm-yyyy'), 230, 5975256613);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (884535, 446, to_date('27-10-2013', 'dd-mm-yyyy'), 69, 9871899056);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (203052, 919, to_date('26-04-2006', 'dd-mm-yyyy'), 174, 6103573424);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (236572, 72, to_date('08-08-2022', 'dd-mm-yyyy'), 715, 7519133180);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (837486, 175, to_date('29-05-2061', 'dd-mm-yyyy'), 9, 6772891111);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (788722, 788, to_date('10-09-2068', 'dd-mm-yyyy'), 701, 8501725383);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (315426, 550, to_date('12-02-2005', 'dd-mm-yyyy'), 249, 6424162884);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (638076, 503, to_date('19-05-2028', 'dd-mm-yyyy'), 61, 9391060977);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (488444, 319, to_date('17-09-2085', 'dd-mm-yyyy'), 171, 4977671153);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (518151, 294, to_date('17-05-2035', 'dd-mm-yyyy'), 340, 7052491305);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (443296, 240, to_date('23-05-2097', 'dd-mm-yyyy'), 316, 1237925442);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (775609, 157, to_date('29-09-2071', 'dd-mm-yyyy'), 895, 2271311859);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (630562, 201, to_date('27-11-2031', 'dd-mm-yyyy'), 215, 8233551338);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (200795, 718, to_date('21-08-2042', 'dd-mm-yyyy'), 149, 9699404637);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (745793, 537, to_date('11-11-2009', 'dd-mm-yyyy'), 171, 923458864);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (440911, 118, to_date('16-05-2062', 'dd-mm-yyyy'), 108, 1156067587);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (190011, 538, to_date('02-09-2050', 'dd-mm-yyyy'), 895, 9815564305);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (619149, 814, to_date('14-10-2074', 'dd-mm-yyyy'), 113, 4812453257);
insert into BILL (bnumber, price, dateofbill, storeid, pid)
values (546588, 9, to_date('24-09-2096', 'dd-mm-yyyy'), 749, 266476233);
commit;
prompt 436 records loaded
prompt Loading EMPLOYEE...
insert into EMPLOYEE (eid, name, salary, storeid)
values (2613770681, 'TimPerez', 8562, 97);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1877671427, 'NeveDownie', 1302, 270);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1766318081, 'CathySedaka', 7422, 340);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4247303864, 'BebeTwilley', 6791, 354);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1190261381, 'DenzelD''Onofrio', 5265, 70);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1104419764, 'LukeAtkinson', 2410, 160);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1459475425, 'LarryTeng', 6997, 747);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1027481735, 'CherryRippy', 7751, 268);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2646852252, 'CharltonTomlin', 9488, 97);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1052524756, 'DonnaGreene', 7671, 273);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3128230848, 'RoscoHoly', 7781, 805);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3047130295, 'JimmieDetmer', 2327, 92);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1907787288, 'TerenceSchreibe', 9584, 433);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3149541032, 'NicolasJudd', 8634, 160);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1352329429, 'JeroenTippe', 3604, 735);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2467846173, 'LuisTankard', 3959, 479);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1181228241, 'SimonGatlin', 6661, 640);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2031590137, 'CledusAykroyd', 7189, 715);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2582028600, 'LonnieAkins', 9488, 459);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3502786588, 'WadeJessee', 4886, 712);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2493295648, 'Carrie-AnneZeta', 9948, 685);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2353445457, 'RhettPotter', 4592, 62);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1719174392, 'LaurieCromwell', 6540, 73);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1999093980, 'JimmyRivers', 3050, 739);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1363396809, 'JakeShand', 8680, 775);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1545258841, 'LiquidChanning', 9659, 268);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2346941144, 'HumbertoNelliga', 2807, 878);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1577081834, 'KurtChanning', 9552, 163);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3611897401, 'AliDolenz', 3047, 62);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2510371894, 'TyroneBroza', 9739, 160);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2713148414, 'MartinDawson', 2367, 323);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3876254650, 'DianeCumming', 8414, 296);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4291757898, 'DonalNivola', 9144, 411);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2463574032, 'ToriRoy Parnell', 3327, 90);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2194502549, 'SherylWarren', 1230, 459);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3541061134, 'DebraRamirez', 4634, 113);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3653156916, 'BrianSoul', 9075, 712);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3781930154, 'SammyWarburton', 6424, 316);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1418669748, 'BlairEmmett', 4831, 726);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2928185059, 'OzzyCarlyle', 1750, 167);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4075173585, 'AngieCrow', 8654, 9);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1304958261, 'ClaireKeen', 9998, 190);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2994502280, 'LeeAlmond', 1159, 237);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3031508689, 'LarnelleHolbroo', 4420, 735);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1916656085, 'BebeCarrey', 7363, 685);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3488665410, 'StevenPacino', 3165, 739);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4149644815, 'MiliSenior', 5838, 709);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3728873327, 'AndyAllen', 8728, 712);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2242014521, 'KidDupree', 2487, 70);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3958098436, 'JonHunt', 7950, 747);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3053195369, 'JeroenMcBride', 9671, 209);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1148961226, 'ShawnMinogue', 8229, 190);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2827235681, 'DaveHorton', 7602, 268);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2050009011, 'DomingoSilverma', 1717, 226);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1885229586, 'ChakaBelushi', 3490, 652);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3730037872, 'AndieUnger', 9943, 548);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3409079871, 'TomCronin', 4841, 728);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3717642341, 'WadeWithers', 1667, 805);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3718608113, 'JodieMidler', 5325, 679);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3696885781, 'EliasBrandt', 2790, 175);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1410110226, 'HarveyStewart', 4605, 315);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4187713798, 'NatalieD''Onofri', 2963, 411);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1102228647, 'Carrie-AnneVint', 8189, 747);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2959400290, 'AshtonBryson', 3207, 433);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2095292645, 'AidanStallone', 1636, 747);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4007889114, 'EdgarTucker', 4389, 459);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1188168207, 'AlecBuscemi', 3055, 869);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2151956466, 'MikaLaws', 7925, 19);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2745333110, 'JohnnyArkin', 5644, 73);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2212904756, 'DarrenCrystal', 6617, 18);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1270211136, 'TchekyGold', 8791, 271);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4039991808, 'VingBullock', 1135, 652);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3514745274, 'KayHauer', 2878, 866);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3420291267, 'MeredithWincott', 5463, 215);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4058266895, 'MickyEvans', 7108, 712);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4264776146, 'CollectiveNapol', 3547, 821);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2912331413, 'LeaEckhart', 4348, 411);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4001123616, 'JudePeterson', 4733, 846);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1383525996, 'GrahamPiven', 6837, 775);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2530493296, 'JetLeigh', 9050, 274);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2564847610, 'GuyRizzo', 5588, 171);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2374179592, 'DrewHershey', 3515, 548);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4126472590, 'PeaboAdler', 5048, 296);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2262154919, 'AlexBroadbent', 7974, 875);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3913790995, 'JulianneBonham', 9159, 679);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3511381228, 'CarrieRobards', 5037, 866);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2580543553, 'TimScott', 1839, 317);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3831249114, 'MosCraig', 1195, 167);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3383759772, 'GilbertDavidtz', 2291, 823);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1746005286, 'AaronLoggia', 6436, 802);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2590382172, 'DeanMcClinton', 2826, 712);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3859702710, 'HenryMurray', 1544, 340);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3269480479, 'ChristinaAlda', 9356, 296);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2583138484, 'RhonaSteenburge', 3062, 739);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3555156136, 'MikeBeck', 8630, 144);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4051576145, 'FredericClinton', 3274, 433);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3692861997, 'ElizaHerrmann', 8072, 108);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3352001171, 'EarlJanney', 7170, 64);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2678992951, 'JakeStreet', 1913, 823);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4170945963, 'UdoArkenstone', 1562, 469);
commit;
prompt 100 records committed...
insert into EMPLOYEE (eid, name, salary, storeid)
values (1114588998, 'DelbertMcIntosh', 4636, 9);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1637033387, 'AlannahFirth', 2100, 190);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1940406923, 'FisherSuvari', 7770, 823);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4032681261, 'PenelopeWard', 2282, 340);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3233672858, 'SolomonHutch', 7186, 675);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2399360134, 'JodyPostlethwai', 7328, 709);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1666268266, 'TziPatillo', 8491, 805);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3951921954, 'KennethJohnson', 9537, 802);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1737806642, 'JetAskew', 8267, 712);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2113929101, 'VictorRichter', 8967, 70);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1664247011, 'JosephNolte', 9032, 790);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3806710453, 'NellyMazzello', 7667, 55);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3349542871, 'BrookePfeiffer', 8241, 157);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1560636456, 'IsabellaCoward', 7606, 709);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2036700489, 'MerrillKaryo', 2707, 160);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1691970178, 'WinonaMantegna', 1747, 230);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2969212976, 'MarianneMcDorma', 5787, 70);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4177446525, 'ThelmaSorvino', 5576, 735);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3212649639, 'SpencerPolley', 2927, 548);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3851668020, 'CateBonham', 2788, 878);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1007090782, 'BradleyLennox', 9935, 599);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3836795157, 'JoySawa', 1013, 317);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2263263883, 'LiliGoodall', 2998, 739);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2385295685, 'PabloWayans', 8119, 18);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3072679346, 'WalterAbraham', 4285, 92);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2974948667, 'Mary-LouiseReev', 4328, 640);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3159819921, 'LynetteStigers', 7314, 19);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3257303911, 'JoshMarx', 2708, 19);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3617120925, 'MauraMacLachlan', 3359, 64);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3978713160, 'LorraineMac', 4925, 715);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3442397581, 'ArturoLoggia', 9463, 209);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3443696786, 'CevinGarner', 9399, 871);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2078013852, 'EmmylouLapointe', 1228, 69);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3226780606, 'IlleanaTanon', 7314, 144);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2965500114, 'JeffBuscemi', 2054, 780);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1391903824, 'CeCeTravers', 2273, 871);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2050642990, 'DebbyCale', 1864, 635);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1531903331, 'WhoopiHersh', 5933, 895);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2131313000, 'StewartSpiner', 6314, 735);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3879999299, 'MarisaColin You', 3664, 108);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4142783616, 'GrahamRizzo', 7864, 271);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2719255600, 'CarlenePurefoy', 4326, 728);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3974599329, 'GeraldinePaxton', 3740, 237);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3069982057, 'GilbertoTravolt', 3522, 802);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3993980425, 'NeveDiCaprio', 8489, 171);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2554788443, 'SonaHenstridge', 6517, 237);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2337298678, 'JodieSkaggs', 5377, 493);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3812524354, 'RipWeaver', 8129, 459);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1174010537, 'DomingoOlin', 1173, 61);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4010798659, 'TreatLynskey', 9687, 160);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1799016861, 'ShawnKhan', 1482, 479);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4156106033, 'FredaBrody', 5404, 344);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2434210176, 'IceLizzy', 1944, 823);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3420590463, 'RoryPigott-Smit', 2530, 55);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3824447656, 'AmyTyson', 4664, 411);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4175491663, 'Carrie-AnneWorr', 5265, 90);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3609086492, 'ThoraRickles', 2396, 144);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1631770857, 'ThelmaGates', 2884, 805);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3146430250, 'OlympiaNielsen', 5757, 411);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3734394651, 'NikBall', 9805, 315);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1188723756, 'ThomasTeng', 4175, 108);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2832377309, 'WendyRowlands', 8493, 340);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2982447686, 'ArtBentley', 6001, 448);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3340390939, 'NinaRickles', 4239, 846);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3032052579, 'LinPreston', 3115, 19);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4087385716, 'HarrisonRemar', 7025, 73);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2491669389, 'HallePortman', 3317, 62);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3304082921, 'JaneElizabeth', 7891, 709);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1924858025, 'HowardBerkley', 4471, 875);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2511659539, 'ChubbyMorse', 4695, 846);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2962466957, 'LinNorton', 1721, 271);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3828190670, 'KurtStallone', 1662, 270);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1718901576, 'IceJohansson', 8901, 73);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1699600645, 'BoydBuscemi', 8099, 273);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4259826439, 'MiriamSandoval', 7175, 675);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2886054739, 'MikeRain', 9765, 92);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2094105153, 'HarrisonTicotin', 1140, 805);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3150471538, 'NanciBeckham', 4124, 433);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3425429673, 'MarisaPryce', 2425, 18);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2752645862, 'TaylorKinnear', 3650, 354);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3672950119, 'BernardBradford', 2519, 821);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2201773423, 'GilKane', 3052, 163);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1556984504, 'MelbaDiffie', 3627, 90);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3925245723, 'GoranRoy Parnel', 9427, 823);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3780901744, 'DonnaLynskey', 7759, 354);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2216871817, 'AidanAustin', 5193, 167);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2852354452, 'RalphKrumholtz', 6792, 749);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2239345016, 'GilJohansen', 1192, 175);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3394920868, 'Mary-LouiseRudd', 6709, 513);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2287391850, 'NikPlatt', 5682, 160);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3707649396, 'CyndiMcPherson', 3363, 728);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2514079616, 'StanleySartain', 2061, 152);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3811291465, 'EarlGreene', 5963, 174);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3498764302, 'EddieBullock', 1284, 878);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3531853652, 'MoeCleese', 3467, 675);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3575856081, 'MarkThomas', 6843, 802);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2042440320, 'AlfredGiannini', 3506, 273);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3846797355, 'OroSedgwick', 1328, 878);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3864963690, 'ArtSlater', 7627, 715);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2591643918, 'BlairGambon', 8623, 770);
commit;
prompt 200 records committed...
insert into EMPLOYEE (eid, name, salary, storeid)
values (1366101431, 'AlbertPlowright', 6825, 323);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2141400359, 'KrisSuvari', 2110, 448);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2749957142, 'OrlandoCarlton', 5002, 773);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1567807862, 'DorryGryner', 8717, 174);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1554442830, 'DarMichaels', 7152, 821);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2402622049, 'GailardBenet', 3398, 354);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2017558450, 'LucindaTurner', 6435, 62);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2989062605, 'MariaRockwell', 8743, 802);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3328828586, 'MartyLewis', 4771, 739);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1193005586, 'TraceLyonne', 3881, 69);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3131933483, 'NightHoleman', 5860, 346);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2165677959, 'DerekMcGowan', 3796, 652);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3100219210, 'RicardoPosey', 2542, 895);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3758383247, 'BonnieGibson', 4682, 163);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1018860224, 'ScottNicks', 8871, 237);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1155640788, 'LucindaPastore', 6947, 685);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1008497685, 'HilaryOsment', 4080, 790);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3644087346, 'LynnKeith', 7287, 19);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2596500967, 'LouiseKatt', 8488, 323);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4052875905, 'BobbySchwimmer', 2562, 62);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3263175304, 'DelbertCassel', 1253, 846);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2960889533, 'GranMcCoy', 3500, 273);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1998591655, 'LucindaThomas', 6431, 469);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3680879421, 'LilyMcDonald', 7182, 459);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3906640599, 'AlexCrudup', 9929, 316);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3025194095, 'GabyStiller', 2294, 599);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3462036061, 'GarryDaniels', 9441, 167);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3504532825, 'DianneMcElhone', 4922, 805);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1139169743, 'LouiseLee', 8126, 749);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1360706202, 'BridgetteCharle', 5649, 167);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2451433038, 'GeraldBlanchett', 4437, 273);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4072752493, 'RobinHampton', 3660, 652);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2024672380, 'JimGarber', 2012, 709);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2217832202, 'ClaireMagnuson', 9754, 113);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1165171704, 'PamelaLonsdale', 8581, 167);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2747193860, 'OrlandoFehr', 1462, 726);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3169561678, 'TerryGold', 6410, 171);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2461268722, 'MacGreenwood', 2168, 548);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3592779385, 'LupeWaits', 4512, 346);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3576494541, 'StanleyEllis', 6012, 62);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1690225126, 'DanniDukakis', 7722, 780);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1169128895, 'RoscoeOverstree', 8817, 448);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2016294913, 'JoannaThomas', 5333, 712);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2049609556, 'CheechBarrymore', 9006, 82);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2644197419, 'BurtLeachman', 6475, 493);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3031480707, 'WilliamBotti', 3913, 113);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3916821945, 'AnneReilly', 1116, 685);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2544617946, 'LesleyGuest', 8756, 709);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3103747793, 'GabySirtis', 4878, 69);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2934750800, 'PattyMcGowan', 2173, 433);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4092597749, 'TreatJeffreys', 8999, 344);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1904364604, 'AnnFisher', 5488, 97);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3068649215, 'HarrisonKeitel', 5081, 69);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2546567484, 'LiquidGallagher', 6946, 152);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2021725236, 'SalNicholson', 1145, 679);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1897767571, 'AnneOates', 4070, 675);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1979554358, 'RutgerZellweger', 5046, 875);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1805437804, 'CaryScott', 3091, 635);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3873060288, 'LariGarfunkel', 9142, 310);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2120474733, 'JenniferWeiland', 7141, 599);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3021523751, 'DonalJoli', 8215, 701);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1302479570, 'VincentWeber', 5738, 802);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2111965017, 'UdoJordan', 3597, 805);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1496543564, 'JulianaRebhorn', 1895, 67);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2101451155, 'SaulArkin', 2386, 823);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2941661694, 'RaulTravers', 7276, 268);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2255627234, 'ManuGarza', 5027, 821);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1121919065, 'SandraAlston', 8991, 780);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1811251704, 'DanielGray', 9481, 73);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3678682557, 'AngelinaJessee', 9181, 157);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2408023398, 'LoisPortman', 2289, 846);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2014226911, 'SalmaAmmons', 3328, 346);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2548303118, 'ChakaMitra', 4096, 144);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1027129038, 'MadeleineMirren', 3543, 167);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3366643559, 'OlgaStone', 4133, 790);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2042042517, 'JudiShort', 4670, 635);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2867587291, 'RalphKeith', 5065, 871);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3484562313, 'MoePlatt', 5411, 354);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2708081371, 'MenaBirch', 2655, 823);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3720473148, 'AidaHirsch', 8348, 167);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2424113786, 'GavinSedaka', 7389, 19);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3610278033, 'CharlieSummer', 5296, 175);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2867581892, 'TemueraDuke', 7714, 821);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2549057177, 'RoyVoight', 4537, 315);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1687948600, 'DianneAdkins', 9257, 346);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4108922265, 'HarveyVenora', 1455, 273);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1447003074, 'ErnieValentin', 7585, 513);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2175974234, 'EttaRuffalo', 3835, 469);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3322815292, 'MarthaNugent', 4052, 163);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3579717706, 'PaulaBelushi', 3824, 875);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2003701908, 'AlbertinaFienne', 1430, 895);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1352315617, 'KeanuHarrison', 7118, 310);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1173173586, 'WillemKrabbe', 7529, 493);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4278259514, 'MarkMcGinley', 2675, 230);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2022415584, 'KevnKretschmann', 8343, 271);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3902859660, 'DavidRobinson', 3925, 174);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2937833746, 'CatePlowright', 3564, 19);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2917595678, 'LucyCallow', 5409, 878);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1265099576, 'AlbertinaCozier', 5049, 73);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1619552367, 'JoshO''Keefe', 4847, 715);
commit;
prompt 300 records committed...
insert into EMPLOYEE (eid, name, salary, storeid)
values (1633214970, 'DermotTinsley', 9187, 780);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2143296541, 'BenHeald', 4034, 790);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2028145854, 'RufusBale', 7540, 895);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2721425448, 'LisaDriver', 7652, 18);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2881201077, 'OrlandoHoleman', 2767, 70);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2061744753, 'MarianneWariner', 8246, 175);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3314851919, 'KellyRebhorn', 1192, 685);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1420191657, 'KelliDanger', 6133, 599);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1707414307, 'JuniorPesci', 1576, 167);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1218932016, 'MadeleineHart', 2171, 167);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1639655066, 'ViggoMcCabe', 2171, 69);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2422340774, 'SherylHolbrook', 8922, 846);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1057507680, 'JoanCox', 1110, 160);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1006150522, 'CandiceParm', 9173, 866);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2119486231, 'DennisTorres', 4160, 749);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4144394398, 'AndraeKoyana', 1730, 823);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3609420634, 'KidMacht', 3859, 61);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1702774234, 'CampbellBeckham', 1292, 747);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1496764723, 'MindyRhys-Davie', 7718, 701);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3400149765, 'WilliamDouglas', 4789, 160);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1542368821, 'LaurenHimmelman', 7453, 869);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2254838052, 'EmmylouCarlyle', 4218, 226);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1116348586, 'LilyMoss', 7809, 157);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2768302242, 'DarLerner', 1423, 175);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2926949911, 'RobertaWoodward', 4340, 793);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3531995535, 'CledusMac', 3870, 548);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3263543666, 'LenaCage', 6304, 271);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2672577953, 'EmmSchiff', 2049, 780);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2425797250, 'ViggoClark', 2428, 652);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2449308506, 'JohnDerringer', 9961, 69);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1108460311, 'DianeWiest', 1494, 175);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3864824664, 'JackieChan', 6027, 715);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2515992820, 'NikkiShelton', 6367, 190);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1408703944, 'JonTravolta', 4157, 82);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2980454142, 'AliciaOakenfold', 7926, 157);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3990676069, 'ShelbySchwarzen', 4145, 108);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1160089571, 'KazemSartain', 9372, 69);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2324231344, 'ElizaNash', 6690, 344);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4016404581, 'WalterMills', 9082, 479);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2395852039, 'ViennaQuaid', 4694, 90);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1064961476, 'BarbaraHaggard', 2790, 599);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1448537704, 'AustinHubbard', 2514, 793);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3568495265, 'DeborahPleasure', 8738, 640);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1795160922, 'FamkeWitt', 5378, 747);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4232357196, 'KayHarry', 3810, 866);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2041719147, 'KirstenDonovan', 1401, 344);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2832537448, 'EddieMohr', 7009, 271);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2839946341, 'CleaKing', 6541, 709);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2458317188, 'IceKravitz', 4986, 19);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3438038628, 'JoshuaWen', 4547, 149);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3650769054, 'BreckinCale', 8402, 113);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1623331992, 'KirkStiller', 1444, 296);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1622094313, 'AprilSheen', 3518, 846);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1673988846, 'VinceVan Shelto', 3580, 152);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3907065481, 'ChuckLindo', 9419, 55);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4281327027, 'PattyDuvall', 7583, 735);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3105104434, 'OroHuston', 9436, 821);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1420281064, 'LuisJames', 5057, 160);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2231076566, 'JohnnieReed', 5498, 709);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1182315930, 'Cornellde Lanci', 7271, 735);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1597834472, 'RicardoWahlberg', 6128, 149);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3539442046, 'RobCross', 3816, 67);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2486774870, 'DerekRaye', 5355, 821);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2179628860, 'JamieCandy', 9981, 209);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3361933187, 'SaffronMadonna', 9875, 735);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2608756429, 'GatesGoldwyn', 1805, 433);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2754707672, 'DebbyElliott', 7002, 871);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1282952169, 'DanWinans', 1173, 344);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3939105820, 'FreddieDouglas', 8312, 793);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3212295273, 'BetteBaez', 9221, 354);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3765496332, 'HughFarrell', 9015, 317);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3525464384, 'AllisonColon', 3602, 773);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3510802039, 'DomingoReilly', 1001, 144);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2025134704, 'ChristianEnglun', 3092, 271);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3371555281, 'KidGayle', 6819, 230);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3799744819, 'MenaRemar', 2322, 175);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3842769276, 'BalthazarNeuwir', 7520, 69);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2155433114, 'RosiePride', 9658, 157);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3777156072, 'AlexSayer', 7069, 869);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2662314279, 'PeteDale', 8896, 73);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4061565900, 'MarcRossellini', 9750, 152);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1825019885, 'JonathaMcDiarmi', 2140, 316);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3056259668, 'BillyWagner', 5387, 18);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3246815417, 'WillemWatley', 2520, 823);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3448968597, 'RussellSartain', 4282, 171);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2436876661, 'BenRipley', 9792, 793);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2620693358, 'TiaTanon', 1042, 805);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3443895342, 'RascalShand', 1073, 97);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3789113688, 'RaymondGordon', 1119, 19);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2822418871, 'MerrileeBentley', 8301, 149);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3815579145, 'LaurieDeschanel', 7336, 448);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1624562207, 'MeredithHingle', 4296, 315);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1331986624, 'RonnyKirshner', 5078, 652);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3299671082, 'MadeleineSnipes', 9943, 459);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3887302529, 'LindaRoth', 9759, 346);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2057856351, 'DanBale', 3612, 61);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2095190584, 'GinBonham', 9580, 9);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1162596751, 'BelindaPlayboys', 9063, 715);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2393052475, 'StanleyMadsen', 6213, 270);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3702451107, 'RascalMcDormand', 3308, 315);
commit;
prompt 400 records committed...
insert into EMPLOYEE (eid, name, salary, storeid)
values (2790582615, 'DelbertMcConaug', 7757, 459);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2990103524, 'StevenReilly', 7669, 739);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1683050125, 'EmmHoward', 8746, 493);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2105167772, 'MadelineTenniso', 1259, 296);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3750365189, 'CherylAddy', 9747, 685);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3813328924, 'LarryNortham', 4067, 55);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3781123572, 'RichardAustin', 2928, 340);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2511620256, 'GraceJessee', 3151, 97);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2530772480, 'AnnieLauper', 4166, 160);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1167948246, 'CathyCoughlan', 6624, 97);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1483245266, 'BoydGriffiths', 8318, 273);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1633748702, 'RachelMattea', 5796, 709);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2252505507, 'VictorKimball', 8427, 712);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2426076725, 'JuliaHorton', 4586, 152);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2761171023, 'BruceBacon', 1711, 175);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1563813319, 'GeoffGallagher', 3672, 163);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3867999259, 'LaurenceWarden', 2889, 174);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4169598534, 'GarryDownie', 4031, 230);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1274657804, 'GinThornton', 8844, 823);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2362032852, 'MarthaKlein', 3920, 55);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1025025865, 'HeathMcAnally', 5522, 175);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4124568906, 'FrancesGarofalo', 1433, 144);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4268276985, 'StewartMoorer', 4252, 152);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2794855144, 'RachaelLauper', 6728, 273);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1072714447, 'AidanSuvari', 8546, 790);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2428803174, 'TaraBall', 5275, 113);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2552098350, 'LenaRomijn-Stam', 7854, 770);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2427896876, 'BonnieSchneider', 7233, 268);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2541181676, 'WarrenDuncan', 2868, 675);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2477941682, 'MarianneFoster', 3727, 652);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3810744564, 'BrentHuston', 5705, 18);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2550843139, 'WesChapman', 3622, 805);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2974117914, 'TerriFavreau', 6926, 448);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2649217528, 'GeggyCrouse', 3710, 802);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4186510433, 'RobertaJenkins', 8702, 175);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4235339331, 'GordieDillon', 7353, 144);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3083494817, 'AhmadCarr', 9788, 149);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3975568942, 'TramaineKeen', 7877, 226);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1258726578, 'SherylSedaka', 7176, 61);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2650649682, 'JohnBerry', 8661, 209);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3674007789, 'KarenBarry', 1630, 548);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3652035823, 'IcePitney', 5318, 735);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4091760593, 'FrancesReiner', 4651, 171);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3945336935, 'VerucaDiFranco', 5783, 895);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2493510374, 'CherryHirsch', 5946, 316);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1094565880, 'SissyPastore', 9027, 167);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3437725207, 'JoannaLindo', 1219, 160);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2862842484, 'GuyNewman', 1556, 459);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2284406824, 'MarlonNortham', 3089, 846);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1260522751, 'NatachaTomei', 4438, 709);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1097363934, 'CyndiBlair', 6285, 459);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1766181889, 'HeatherBoone', 8338, 171);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2595103304, 'DanielAffleck', 6025, 237);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4058897613, 'DenzelNightinga', 8564, 19);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3863256024, 'JosephWalsh', 9656, 67);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1002216842, 'NeilMarley', 5381, 175);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1453836794, 'LukeBonneville', 2385, 274);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2451640591, 'WinonaTucci', 9551, 433);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3617079733, 'PeteClark', 4219, 175);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3388594584, 'DerrickRenfro', 2133, 599);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4176236911, 'JamesMason', 1199, 354);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2786368190, 'GinaBrody', 8681, 712);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2221055036, 'JosephTurner', 2686, 701);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3940907050, 'AliceGoodall', 3088, 209);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1157077391, 'OssieMortensen', 1894, 69);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2645229696, 'SusanEaston', 2128, 82);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2278802227, 'ReeseHopper', 2134, 61);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2680709810, 'AlicePearce', 5140, 316);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2529173125, 'ReginaPfeiffer', 2439, 296);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4002051063, 'GlenHeslov', 3013, 739);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4283417410, 'RikBlades', 5336, 19);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3404534832, 'PaulRatzenberge', 7601, 701);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4223246131, 'OssieTaha', 3734, 652);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1914990172, 'GilWalker', 8548, 209);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2069798210, 'JuanSpiner', 3113, 317);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1657380513, 'HugoDoucette', 8300, 599);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1318938369, 'ArmandCarringto', 5610, 866);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1834567253, 'LorraineLeachma', 8329, 354);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2261667865, 'RaulRosas', 4194, 802);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2222544502, 'TeaShocked', 6453, 55);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3947493568, 'SuziRain', 1032, 599);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4106820710, 'GenaOsborne', 6063, 735);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1968403333, 'JosephKutcher', 3302, 599);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1824453152, 'BernardBerkoff', 8200, 726);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1945470160, 'MaggieBean', 4397, 346);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3809001192, 'AndrewBryson', 2284, 469);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1494108682, 'DannyMorton', 5481, 268);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2068607853, 'MerilleeBranch', 6003, 775);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3210823300, 'CeiliHayes', 7997, 19);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2159481854, 'MarianneLizzy', 4845, 354);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1141392232, 'DianeHershey', 1869, 479);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3142654940, 'DavisChristie', 4316, 469);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1349117400, 'CaroleHorizon', 6038, 895);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3502533452, 'RonnyCraven', 1245, 113);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1210361012, 'DabneyLaMond', 1419, 70);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2115608201, 'BetteCale', 4201, 459);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2503658094, 'RikMcDonald', 2809, 675);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2347060475, 'JuliaUnderwood', 9080, 174);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2052316820, 'RoryFoster', 9293, 18);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4021158363, 'JoelyThompson', 5815, 770);
commit;
prompt 500 records committed...
insert into EMPLOYEE (eid, name, salary, storeid)
values (1554461676, 'ArtHolly', 4864, 770);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2006776551, 'ReginaTrejo', 8165, 108);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1861380013, 'EmbethCaviezel', 6917, 479);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2015269022, 'StanleyFerrell', 8928, 712);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2982694321, 'FatsPlayboys', 8325, 61);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1774085711, 'MichaelSartain', 1129, 701);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3890878144, 'SammyProwse', 8943, 770);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2340822970, 'JetSample', 2918, 152);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1297753865, 'TildaSummer', 3663, 871);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2412566026, 'BustaPerrineau', 1527, 775);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2770503558, 'RobbieHatosy', 4569, 715);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2612492562, 'GoldieCockburn', 2885, 310);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1496273589, 'LionelBright', 4583, 548);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1497478804, 'BustaDay-Lewis', 2759, 317);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2798168284, 'SusanNavarro', 6996, 821);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4097049051, 'TrickAtkins', 1831, 869);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2687639050, 'JerryStiles', 1842, 226);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3676945127, 'AnitaRains', 1356, 599);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3285403688, 'PhilSweet', 4965, 215);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1099441135, 'ArturoParsons', 8061, 108);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3938009974, 'GranGandolfini', 6140, 802);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2555860094, 'ChubbyDiCaprio', 6422, 869);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2182749610, 'CarleneSedgwick', 8644, 866);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3417602914, 'KimStigers', 6235, 271);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3244464041, 'JackDownie', 4418, 726);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3757245045, 'LorraineRicci', 5279, 599);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4135973529, 'PenelopeHart', 6315, 344);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3674132192, 'AngelinaDurning', 6746, 846);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4209196087, 'DonnaNapolitano', 7200, 749);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1381049635, 'JasonBlades', 1611, 875);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3472865709, 'DonaldMollard', 1628, 144);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3149727008, 'RikStoltz', 8334, 62);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2972873194, 'JonathaHarper', 6806, 411);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2127358758, 'HollandCartlidg', 1662, 747);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2408215065, 'JimmieMilsap', 6382, 433);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2984070395, 'LouMyles', 7119, 640);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1279268512, 'LupeFuray', 1573, 871);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1066597932, 'TimMetcalf', 6270, 160);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3664522358, 'SallyHolden', 1078, 323);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3527254357, 'DennySweet', 7474, 18);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3402921448, 'MauraRusso', 9430, 479);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1676208523, 'LloydDukakis', 5801, 90);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3198898856, 'DomingoPlowrigh', 3732, 316);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2729099137, 'LouLaurie', 1396, 878);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1624855862, 'CourtneyEaston', 5434, 113);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2248706529, 'EthanDanger', 4266, 459);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2960405847, 'SolomonLeigh', 2669, 73);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1752302162, 'KateStuart', 2324, 346);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1894671863, 'MerrileeAkins', 8142, 70);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3398472397, 'OzzyEvett', 2177, 479);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1821453537, 'DennyCube', 6296, 739);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3754321772, 'HowardBanderas', 5539, 190);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3752442165, 'RonnyLewin', 1901, 679);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3254244113, 'TreatStills', 4932, 9);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2729834870, 'MirandaPigott-S', 6084, 869);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2491544584, 'JamesMcCormack', 1609, 871);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4271048757, 'ClarenceHector', 5454, 715);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3762471690, 'SaraChilton', 8779, 747);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2462431040, 'KristinMazar', 2237, 270);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1057602020, 'FrancoCoverdale', 9520, 73);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1049285825, 'KyleTarantino', 5424, 895);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2925923560, 'IsaacMcDonnell', 8660, 652);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3674647870, 'BretGill', 9797, 340);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3042424417, 'JaredWaits', 8419, 113);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3059469675, 'PenelopeBonham', 6584, 354);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1345153937, 'JonTrejo', 2474, 479);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4094234306, 'TeriGuinness', 1144, 215);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1596545434, 'LorenRapaport', 9165, 728);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2962594190, 'RyanPayton', 2983, 82);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2829672596, 'MichelleClooney', 4566, 323);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4201025836, 'BrittanyYorn', 4164, 18);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2593813133, 'MiaHarnes', 5069, 19);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3716438622, 'LukeStreet', 9313, 92);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2849269510, 'PierceHeston', 2467, 271);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3068616929, 'PeterStevens', 1524, 770);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3585550583, 'AndraeEvanswood', 2543, 268);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2017673160, 'MarianneJames', 6108, 433);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2254263511, 'KathyDiCaprio', 9218, 685);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2292217859, 'LeeleeMoraz', 7829, 780);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2631446306, 'KevnSteagall', 1531, 175);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3281048942, 'DenisHauser', 5654, 805);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2143003477, 'NilsDafoe', 5790, 270);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2506052861, 'DebraGates', 1614, 175);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3182275890, 'CesarVincent', 4934, 152);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1998907258, 'StewartRea', 6699, 652);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2478038385, 'CandicePeet', 2417, 149);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4177136735, 'HilaryHerndon', 3434, 640);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1783101735, 'TimothySchreibe', 3424, 793);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3831578283, 'SimonBiel', 4335, 108);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1516375956, 'JesseVicious', 8882, 315);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2121237784, 'ToddShaw', 8504, 237);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2203783750, 'RobertaSteagall', 1338, 174);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1854616640, 'JaneBrown', 7666, 739);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3827893361, 'KidFarina', 3051, 599);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3550184351, 'BreckinAllen', 6657, 685);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1578356723, 'YolandaRoberts', 7561, 270);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1435764275, 'NaomiHartnett', 2096, 340);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2665130434, 'JoanSatriani', 7213, 55);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1434395128, 'OmarLorenz', 9574, 895);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3692492746, 'MaeOrbit', 7570, 167);
commit;
prompt 600 records committed...
insert into EMPLOYEE (eid, name, salary, storeid)
values (1225136993, 'BenTomei', 2384, 726);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2120456538, 'DabneyPleasure', 6005, 268);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3831587392, 'JoshMacy', 7548, 270);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3353120759, 'GraceWeaver', 7072, 869);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3314237701, 'RoscoBenoit', 2792, 152);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3646750305, 'AnnaMacDowell', 8984, 685);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3188517545, 'TeenaRea', 5240, 715);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1921872542, 'MaeLizzy', 5898, 715);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1234383943, 'AliciaIsaacs', 1953, 61);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4255263291, 'RhysSmith', 5136, 209);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1094060933, 'PhoebeAlda', 9185, 548);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2888878171, 'AndrewMakowicz', 6077, 215);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4022799904, 'EmbethGill', 3316, 448);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1808603634, 'PeterOakenfold', 8874, 411);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3792674651, 'PragaFehr', 4015, 875);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3086521739, 'RemyDale', 7261, 780);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3839869276, 'RemyUnger', 2274, 411);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3650517650, 'RachidHoskins', 3310, 270);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3440047757, 'VictorDouglas', 1642, 310);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2556444559, 'SanderTankard', 7929, 296);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3027726865, 'LeonHagerty', 9334, 340);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2688216150, 'SammyStoltz', 2867, 317);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3741060006, 'ElvisNielsen', 6886, 97);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4187348140, 'WallaceSossamon', 6032, 55);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3151234365, 'AlbertNunn', 7940, 709);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1190589470, 'DianeWashington', 9505, 878);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1160383681, 'Ming-NaNorton', 6269, 354);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1424629413, 'JeffreyGayle', 4012, 69);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1069721311, 'ChuckMathis', 8820, 823);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1935999495, 'TerryBassett', 8129, 157);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1763137066, 'HelenLemmon', 7990, 175);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2601131981, 'IlleanaMacy', 7357, 190);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1666973785, 'ChristmasDavies', 4935, 469);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2490934158, 'SaffronWarwick', 4965, 108);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2998244266, 'AidanCrewson', 1276, 866);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2873412509, 'RhettByrne', 8115, 97);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1676251217, 'TarynChandler', 2426, 599);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2864813368, 'JulietteFinney', 6950, 149);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2359589779, 'FairuzaYorn', 2624, 209);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3384799130, 'PragaShand', 1049, 675);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2004839656, 'TracePotter', 8148, 871);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1365336840, 'LindsayLlewelyn', 4434, 652);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3424713754, 'AlecCulkin', 7651, 747);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3466993799, 'GloriaSpiner', 1346, 793);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1347438226, 'ViggoMcDiarmid', 9646, 685);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3727015632, 'PabloKirkwood', 3751, 144);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3774404850, 'FrankieGray', 2546, 599);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1249633207, 'RutgerSampson', 8050, 70);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3780632386, 'KyraCagle', 3701, 433);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2214957724, 'RyanDiggs', 5436, 701);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2839766213, 'EthanMoorer', 2361, 69);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2626324358, 'PatrickYulin', 3640, 493);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1365168965, 'SeannForrest', 5794, 315);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4143509832, 'CleaVance', 6155, 747);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2647725958, 'SarahGates', 4604, 679);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3104772532, 'QuentinEl-Saher', 1447, 315);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2340410519, 'PelvicMcFerrin', 2087, 249);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2259963530, 'JesseFinney', 5630, 635);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1619443757, 'VernSheen', 9898, 354);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3446412732, 'ToniWeiland', 1794, 805);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1685821667, 'ChazzFierstein', 5809, 55);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1030084455, 'LoreenaMills', 2114, 735);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2169610715, 'SamanthaWells', 2668, 459);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2205874913, 'PeterMiles', 8064, 9);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2525988878, 'RoscoeAdler', 4120, 793);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2808058231, 'OlgaBalin', 7216, 296);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4253872119, 'TramaineBalk', 3105, 273);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1363439365, 'CarolineCrewson', 4096, 728);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3276346507, 'AhmadSevigny', 6852, 433);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3675749601, 'RikKretschmann', 5105, 82);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3964886600, 'IanBacon', 6879, 709);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2757969156, 'JetGertner', 3600, 160);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1344182841, 'DariusHatchet', 5698, 599);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3430370934, 'MinnieReed', 8417, 790);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3921407894, 'LindsayEngland', 9342, 635);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3506253992, 'AnnetteYankovic', 5494, 273);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2418863144, 'KurtDavidson', 5734, 679);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2073725138, 'NenehDench', 5384, 895);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3478909651, 'RonnyBotti', 7209, 679);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2713409008, 'RosarioPaul', 6345, 770);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2144177392, 'AlbertinaLipnic', 5380, 317);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2109471986, 'CourtneyRuiz', 9009, 675);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3513361505, 'JosephSweet', 7945, 749);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2948008142, 'ThelmaCallow', 7340, 73);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3343513854, 'VondaRossellini', 1144, 61);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3828935708, 'CoreyEngland', 7305, 310);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2044095088, 'StewartVaughn', 7339, 871);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3959242742, 'MatthewSpector', 9446, 55);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4288576905, 'HarveyMcBride', 5779, 190);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1359517315, 'HollandArmstron', 2924, 271);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3914982660, 'RickyMcNeice', 6012, 113);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3411974389, 'TramaineEllis', 1692, 493);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3060030090, 'MindyMoffat', 7696, 775);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1253386145, 'FirstChristie', 8702, 866);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2677546918, 'KirkSepulveda', 2835, 773);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3764456251, 'JaniceCervine', 3743, 315);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1267808622, 'LisaRossellini', 8756, 273);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3843684499, 'SuzanneMcConaug', 2916, 69);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2377283150, 'PamelaDe Almeid', 4489, 823);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2172468010, 'GeggyGordon', 1181, 448);
commit;
prompt 700 records committed...
insert into EMPLOYEE (eid, name, salary, storeid)
values (1107489237, 'SethPage', 9784, 209);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3743076458, 'EmmCarlyle', 3330, 739);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2789655690, 'NellyBean', 2655, 215);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3731729905, 'CharlizeShue', 1170, 802);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3732716320, 'AhmadCook', 4436, 271);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4078835182, 'EmmTodd', 7278, 775);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4274664293, 'GuySchiff', 7577, 230);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3640151607, 'UmaLi', 6436, 469);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1272588568, 'FranceRanger', 8255, 652);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3637764500, 'RosarioCoolidge', 6375, 163);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3573468196, 'MintElizondo', 3957, 157);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3304036198, 'ErnestWilkinson', 4707, 739);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1776194435, 'TeaKrumholtz', 8039, 479);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2587142192, 'LindsayCarlton', 7632, 70);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2118806867, 'RoryIdle', 3450, 108);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1027344029, 'JuiceBroadbent', 1074, 237);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1981469128, 'MurrayMacIsaac', 6888, 448);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4067300922, 'EwanFerrer', 4017, 340);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3125156144, 'LivDuncan', 1216, 108);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4185816575, 'LilaStreet', 5904, 735);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1557521825, 'WoodyVaughan', 9512, 82);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2955073810, 'PabloRebhorn', 1779, 749);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4203005949, 'PatMantegna', 6281, 775);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1877581446, 'CliffDupree', 1256, 160);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1724827895, 'RoyWhite', 1692, 73);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3345582895, 'BenicioBacon', 7064, 344);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2950289470, 'ErnieEdmunds', 2671, 709);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2613966343, 'DebraLaw', 9965, 640);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1175736000, 'RedCurry', 6983, 317);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1684637078, 'EugeneNash', 2617, 249);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4143029870, 'AngieThompson', 6587, 9);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1905378944, 'CarolynMcDonnel', 6800, 61);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3041481770, 'RickCostello', 9015, 479);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1811472534, 'TerryJames', 1645, 459);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1496175921, 'LupeYankovic', 9063, 493);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2428300649, 'SaulMorton', 7396, 493);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1346099414, 'RosieKrumholtz', 7026, 479);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3786553108, 'AlecGuinness', 7104, 230);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3343391372, 'AngieStudi', 9880, 866);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2700244262, 'ChuckGagnon', 6857, 167);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1880514164, 'NastassjaAustin', 6456, 354);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1461974375, 'JasonFarina', 3968, 728);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1070005285, 'NicolasAniston', 8697, 869);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2811959363, 'RhettSchwimmer', 9214, 728);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1455148396, 'PenelopeKweller', 9734, 679);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1510985766, 'MaeScaggs', 6301, 92);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4014848551, 'RuebenParish', 1637, 73);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4100630437, 'EttaMason', 4157, 296);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1881611787, 'GinoFerry', 2605, 340);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1672639172, 'KieranMahoney', 3132, 97);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1783059884, 'AshtonTierney', 6823, 493);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3536325720, 'BenCrystal', 1715, 70);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4059095757, 'AlbertMewes', 5612, 315);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1884973431, 'KatrinBell', 9477, 226);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2397841257, 'AlbertScaggs', 9580, 726);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4187500319, 'Mary BethDavids', 3804, 18);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4149082154, 'RuebenConnelly', 1587, 270);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4185063229, 'AndreFrakes', 8016, 793);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2290795119, 'JimRyder', 8311, 346);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1350720363, 'VingClarkson', 9812, 513);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1465848739, 'MarisaBroadbent', 2272, 780);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4207544946, 'PenelopePortman', 1258, 770);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1961666733, 'NilsDean', 2260, 448);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3602535667, 'AdrienPleasure', 2647, 310);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2174257498, 'NigelPorter', 6416, 190);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1001744869, 'FredericStills', 9214, 866);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4033822769, 'JohnMatthau', 7658, 149);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3876609138, 'BalthazarMulron', 7927, 739);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3710053621, 'KeanuGatlin', 8956, 493);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3286767558, 'SaraJane', 2869, 871);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3744819624, 'ToshiroBryson', 1974, 268);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1011121631, 'BebeMitchell', 6208, 354);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1676088865, 'ChiGuzman', 7167, 866);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1202742105, 'VincentDavies', 9048, 878);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2504960559, 'DavisNicholson', 4289, 152);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1696913317, 'SusanIrons', 2457, 315);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2482213495, 'SigourneyChrist', 5850, 69);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1943890399, 'RonSchwimmer', 3403, 174);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3491202045, 'DavyBarnett', 6971, 9);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2774877707, 'VerticalAykroyd', 1166, 92);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2755551748, 'TaraMcCracken', 7958, 652);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1130079892, 'LeonSinise', 2633, 640);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1786988257, 'JasonCrudup', 7192, 701);
insert into EMPLOYEE (eid, name, salary, storeid)
values (4079375743, 'ChelyEvanswood', 6788, 802);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2810571081, 'ClintCross', 6233, 805);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3129877804, 'CheechLane', 4184, 113);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2172138289, 'LivWard', 1984, 64);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3999160291, 'LaraRispoli', 9418, 249);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3673274611, 'TramaineKhan', 2746, 871);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3378860467, 'JodyRock', 9011, 878);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2936600861, 'ReginaBroderick', 1841, 92);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3240323716, 'JuliaMorales', 7884, 160);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3876933903, 'BrittanyHarnes', 4424, 793);
insert into EMPLOYEE (eid, name, salary, storeid)
values (1424136266, 'WadeSainte-Mari', 5173, 249);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3534455802, 'RosanneHayes', 3076, 805);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3559915493, 'DaryleGugino', 7686, 635);
insert into EMPLOYEE (eid, name, salary, storeid)
values (3185619218, 'BenicioLlewelyn', 7936, 493);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2220894347, 'OssieBaker', 8335, 310);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2459199122, 'MartyEl-Saher', 5454, 802);
insert into EMPLOYEE (eid, name, salary, storeid)
values (2242487812, 'RobertaGano', 5430, 175);
commit;
prompt 800 records loaded
prompt Loading SUPPLIER...
insert into SUPPLIER (sid, name, city)
values (5550092, 'Evinco', 'Leipzig');
insert into SUPPLIER (sid, name, city)
values (9178792, 'Megha Systems', 'Bautzen');
insert into SUPPLIER (sid, name, city)
values (6779167, 'BASE Consulting', 'Hartford');
insert into SUPPLIER (sid, name, city)
values (1182254, 'PrivateBancorp', 'Oxon');
insert into SUPPLIER (sid, name, city)
values (6091590, 'Amerisource Fun', 'Ellicott C');
insert into SUPPLIER (sid, name, city)
values (8362193, 'Diamond Pharmac', 'Sale');
insert into SUPPLIER (sid, name, city)
values (1729374, 'Computer Engine', 'Cuiabב');
insert into SUPPLIER (sid, name, city)
values (2731001, 'Pinnacle Staffi', 'Kanazawa');
insert into SUPPLIER (sid, name, city)
values (2485205, 'Benecon Group', 'West Lafay');
insert into SUPPLIER (sid, name, city)
values (3622250, 'MedSource Consu', 'Melrose pa');
insert into SUPPLIER (sid, name, city)
values (4019899, 'Tilson HR', 'Burwood Ea');
insert into SUPPLIER (sid, name, city)
values (4830850, 'TechBooks', 'Vienna');
insert into SUPPLIER (sid, name, city)
values (1072695, 'eCopy', 'Kרbenhavn');
insert into SUPPLIER (sid, name, city)
values (4043317, 'Merck & Co.', 'Overland p');
insert into SUPPLIER (sid, name, city)
values (4566009, 'SCI', 'Hohenfels');
insert into SUPPLIER (sid, name, city)
values (7316101, 'GTS Refreshment', 'Caguas');
insert into SUPPLIER (sid, name, city)
values (9168313, 'Access Systems', 'West Launc');
insert into SUPPLIER (sid, name, city)
values (9973357, 'Portosan', 'Dresden');
insert into SUPPLIER (sid, name, city)
values (9136925, '3t Systems', 'Edinburgh');
insert into SUPPLIER (sid, name, city)
values (7477485, 'SafeHome Securi', 'Farmington');
insert into SUPPLIER (sid, name, city)
values (3697177, 'Contract Counse', 'Rockford');
insert into SUPPLIER (sid, name, city)
values (6186594, 'Custom Solution', 'University');
insert into SUPPLIER (sid, name, city)
values (4852929, 'Trainersoft', 'Lincoln');
insert into SUPPLIER (sid, name, city)
values (5865367, 'MindIQ', 'Edison');
insert into SUPPLIER (sid, name, city)
values (4175980, 'BioReliance', 'Sao caetan');
insert into SUPPLIER (sid, name, city)
values (1139932, 'Team', 'Nantes');
insert into SUPPLIER (sid, name, city)
values (3492853, 'Colgate-Palmoli', 'Abbotsford');
insert into SUPPLIER (sid, name, city)
values (4866762, 'American Expres', 'Gainesvill');
insert into SUPPLIER (sid, name, city)
values (9360102, 'Unica', 'New York');
insert into SUPPLIER (sid, name, city)
values (5498557, 'Advanced Vendin', 'Wichita');
insert into SUPPLIER (sid, name, city)
values (4627271, 'Phoenix Rehabil', 'Flower mou');
insert into SUPPLIER (sid, name, city)
values (4735957, 'Boldtech System', 'Newton-le-');
insert into SUPPLIER (sid, name, city)
values (1886819, 'New Horizons Co', 'Tampa');
insert into SUPPLIER (sid, name, city)
values (9343720, 'Gagwear', 'Foster Cit');
insert into SUPPLIER (sid, name, city)
values (5531141, 'Jewett-Cameron ', 'Princeton');
insert into SUPPLIER (sid, name, city)
values (3117988, 'Catamount Const', 'Ottawa');
insert into SUPPLIER (sid, name, city)
values (7101492, 'Kroger Co.', 'New boston');
insert into SUPPLIER (sid, name, city)
values (8080551, 'Orange Glo Inte', 'Southend o');
insert into SUPPLIER (sid, name, city)
values (6565950, 'Estee Lauder Co', 'Charleston');
insert into SUPPLIER (sid, name, city)
values (5808766, 'Calence', 'Essex');
insert into SUPPLIER (sid, name, city)
values (4343090, 'Gold Crest Dist', 'Santa Cruz');
insert into SUPPLIER (sid, name, city)
values (9861789, 'Mercantile Bank', 'Jakarta');
insert into SUPPLIER (sid, name, city)
values (4431226, 'Cascade Bancorp', 'Vilafranca');
insert into SUPPLIER (sid, name, city)
values (2040327, 'Southern Homes ', 'Sדo paulo');
insert into SUPPLIER (sid, name, city)
values (4179651, 'Meritage Techno', 'Saint Paul');
insert into SUPPLIER (sid, name, city)
values (1118648, 'Microsoft Corp.', 'Taipei');
insert into SUPPLIER (sid, name, city)
values (5177619, 'Signal Perfecti', 'Carmichael');
insert into SUPPLIER (sid, name, city)
values (3484494, 'Analytics Opera', 'Stans');
insert into SUPPLIER (sid, name, city)
values (7984792, 'Kramont Realty ', 'Bad Camber');
insert into SUPPLIER (sid, name, city)
values (1927158, 'Integrated Deci', 'Milford');
insert into SUPPLIER (sid, name, city)
values (5948990, 'McKee Wallwork ', 'Trumbull');
insert into SUPPLIER (sid, name, city)
values (3482929, 'Data Company', 'Massagno');
insert into SUPPLIER (sid, name, city)
values (7661301, 'Provident Banco', 'West Chest');
insert into SUPPLIER (sid, name, city)
values (3659919, 'Pioneer Mortgag', 'New Delhi');
insert into SUPPLIER (sid, name, city)
values (9437176, 'ProSys Informat', 'Richmond H');
insert into SUPPLIER (sid, name, city)
values (4146955, 'Automated Licen', 'Zuerich');
insert into SUPPLIER (sid, name, city)
values (2455189, 'Priority Leasin', 'Helsingbor');
insert into SUPPLIER (sid, name, city)
values (8347090, 'Pfizer', 'Dinslaken');
insert into SUPPLIER (sid, name, city)
values (5534074, 'Arrow Financial', 'Fort Lewis');
insert into SUPPLIER (sid, name, city)
values (2423866, 'Quaker City Ban', 'Edmonton');
insert into SUPPLIER (sid, name, city)
values (3647590, 'Appriss', 'Vienna');
insert into SUPPLIER (sid, name, city)
values (6557304, 'ORI Services', 'Turku');
insert into SUPPLIER (sid, name, city)
values (9444181, 'Diversitech', 'Kumamoto');
insert into SUPPLIER (sid, name, city)
values (4952580, 'L’Oreal', 'Tartu');
insert into SUPPLIER (sid, name, city)
values (6584071, 'Magnet Communic', 'Bremen');
insert into SUPPLIER (sid, name, city)
values (8738381, 'Cold Stone Crea', 'Istanbul');
insert into SUPPLIER (sid, name, city)
values (6867222, 'Unit', 'Santa rita');
insert into SUPPLIER (sid, name, city)
values (2785910, 'Partnership in ', 'Milsons Po');
insert into SUPPLIER (sid, name, city)
values (1906350, 'Appriss', 'Jakarta');
insert into SUPPLIER (sid, name, city)
values (6262415, 'Tastefully Simp', 'Mclean');
insert into SUPPLIER (sid, name, city)
values (2127175, 'Astute', 'Winterthur');
insert into SUPPLIER (sid, name, city)
values (1400668, 'Columbia Bancor', 'El Dorado ');
insert into SUPPLIER (sid, name, city)
values (4236948, 'MicroTek', 'Colorado S');
insert into SUPPLIER (sid, name, city)
values (6582161, 'Pfizer', 'Chambersbu');
insert into SUPPLIER (sid, name, city)
values (2189372, 'One Source Prin', 'Lublin');
insert into SUPPLIER (sid, name, city)
values (5006952, 'Gentra Systems', 'Brentwood');
insert into SUPPLIER (sid, name, city)
values (4511706, 'Staff One', 'Redding');
insert into SUPPLIER (sid, name, city)
values (7431498, 'Universal Solut', 'Glen allen');
insert into SUPPLIER (sid, name, city)
values (2968427, 'Invision.com', 'Almaty');
insert into SUPPLIER (sid, name, city)
values (7135012, 'Joe Lombardo Pl', 'High Wycom');
insert into SUPPLIER (sid, name, city)
values (7173308, 'Uniserve Facili', 'Hayward');
insert into SUPPLIER (sid, name, city)
values (6657915, 'Pinnacle Staffi', 'Omaha');
insert into SUPPLIER (sid, name, city)
values (2232360, 'Boldtech System', 'Vienna');
insert into SUPPLIER (sid, name, city)
values (5849829, 'TMA Resources', 'Edmonton');
insert into SUPPLIER (sid, name, city)
values (1937494, 'Advanced Techno', 'Oxford');
insert into SUPPLIER (sid, name, city)
values (2119920, 'Procurement Cen', 'Porto aleg');
insert into SUPPLIER (sid, name, city)
values (8820909, 'Imaging Busines', 'Karachi');
insert into SUPPLIER (sid, name, city)
values (3652751, 'National Home H', 'Saint Paul');
insert into SUPPLIER (sid, name, city)
values (4595218, 'SurModics', 'Hayward');
insert into SUPPLIER (sid, name, city)
values (5822600, 'Liners Direct', 'Chorzףw');
insert into SUPPLIER (sid, name, city)
values (9557242, 'Iris Software', 'Caguas');
insert into SUPPLIER (sid, name, city)
values (1597231, 'Staff Force', 'Charleston');
insert into SUPPLIER (sid, name, city)
values (5959200, 'First Place Fin', 'Tustin');
insert into SUPPLIER (sid, name, city)
values (7697850, 'PharmaFab', 'Streamwood');
insert into SUPPLIER (sid, name, city)
values (7847226, 'Mercantile Bank', 'Vallauris');
insert into SUPPLIER (sid, name, city)
values (4596487, 'KSJ & Associate', 'Golden');
insert into SUPPLIER (sid, name, city)
values (8788934, 'Travizon', 'Laredo');
insert into SUPPLIER (sid, name, city)
values (9069995, 'Integrity Staff', 'Boulogne');
insert into SUPPLIER (sid, name, city)
values (1320860, 'ASAP Staffing', 'Regensburg');
insert into SUPPLIER (sid, name, city)
values (5616883, 'httprint', 'Itu');
commit;
prompt 100 records committed...
insert into SUPPLIER (sid, name, city)
values (3360949, 'Brandt Informat', 'King of Pr');
insert into SUPPLIER (sid, name, city)
values (5635159, 'Balchem', 'Amarillo');
insert into SUPPLIER (sid, name, city)
values (6310295, 'Data Company', 'Coquitlam');
insert into SUPPLIER (sid, name, city)
values (2588430, 'General Mills', 'Fornacette');
insert into SUPPLIER (sid, name, city)
values (4516682, 'DaimlerChrysler', 'Ramat Gan');
insert into SUPPLIER (sid, name, city)
values (1826101, 'Trek Equipment', 'Webster Gr');
insert into SUPPLIER (sid, name, city)
values (7177914, 'Woronoco Bancor', 'Storringto');
insert into SUPPLIER (sid, name, city)
values (5383256, 'Labrada Nutriti', 'Douala');
insert into SUPPLIER (sid, name, city)
values (6588566, 'GCI', 'Olsztyn');
insert into SUPPLIER (sid, name, city)
values (5118571, 'General Mills', 'Saint-vinc');
insert into SUPPLIER (sid, name, city)
values (9264073, 'Investors Title', 'Athens');
insert into SUPPLIER (sid, name, city)
values (9951838, 'ZonePerfect Nut', 'Cottbus');
insert into SUPPLIER (sid, name, city)
values (3801529, 'MasterCard Inte', 'Maarssen');
insert into SUPPLIER (sid, name, city)
values (8008041, 'U.S Physical Th', 'Bedfordshi');
insert into SUPPLIER (sid, name, city)
values (4465623, 'Open Software S', 'Powell Riv');
insert into SUPPLIER (sid, name, city)
values (7841451, 'Astute', 'Birmingham');
insert into SUPPLIER (sid, name, city)
values (7161041, 'SimStar Interne', 'Forest Par');
insert into SUPPLIER (sid, name, city)
values (8559467, 'Sea Fox Boat', 'Rochester');
insert into SUPPLIER (sid, name, city)
values (7847925, 'Genex Technolog', 'Brisbane');
insert into SUPPLIER (sid, name, city)
values (1084471, 'InfoPros', 'Bolzano');
insert into SUPPLIER (sid, name, city)
values (8901393, 'Tropical Oasis', 'Schenectad');
insert into SUPPLIER (sid, name, city)
values (2360576, 'Calence', 'durham');
insert into SUPPLIER (sid, name, city)
values (5172682, 'AT&T Wireless', 'Ben-Gurion');
insert into SUPPLIER (sid, name, city)
values (2169144, 'Mars Inc.', 'Bollensen');
insert into SUPPLIER (sid, name, city)
values (1680042, 'Pearl Law Group', 'Stellenbos');
insert into SUPPLIER (sid, name, city)
values (4516696, 'Dankoff Solar P', 'Runcorn');
insert into SUPPLIER (sid, name, city)
values (5755380, 'S.C. Johnson & ', 'Milton');
insert into SUPPLIER (sid, name, city)
values (6488559, 'Commercial Ener', 'Royersford');
insert into SUPPLIER (sid, name, city)
values (2162107, 'Execuscribe', 'Austin');
insert into SUPPLIER (sid, name, city)
values (6175766, 'Global Wireless', 'North Wale');
insert into SUPPLIER (sid, name, city)
values (2991430, 'Maverick Techno', 'Nynהshamn');
insert into SUPPLIER (sid, name, city)
values (4087485, 'Turner Professi', 'Helsingbor');
insert into SUPPLIER (sid, name, city)
values (3792330, 'American Vangua', 'Sydney');
insert into SUPPLIER (sid, name, city)
values (2391008, 'ID Label', 'Aomori');
insert into SUPPLIER (sid, name, city)
values (1128427, 'Bestever', 'Oppenheim');
insert into SUPPLIER (sid, name, city)
values (3212376, 'Canterbury Park', 'Slough');
insert into SUPPLIER (sid, name, city)
values (5479076, 'Cardinal Cartri', 'Reno');
insert into SUPPLIER (sid, name, city)
values (7688779, 'TechBooks', 'Mount Oliv');
insert into SUPPLIER (sid, name, city)
values (6215368, 'Infinity Softwa', 'Chambersbu');
insert into SUPPLIER (sid, name, city)
values (3839332, 'Professional Pl', 'Melrose');
insert into SUPPLIER (sid, name, city)
values (3521644, 'SPS Commerce', 'Walnut Cre');
insert into SUPPLIER (sid, name, city)
values (1845280, 'Providence Serv', 'Kuopio');
insert into SUPPLIER (sid, name, city)
values (8274954, 'Qestrel Cos.', 'Northbrook');
insert into SUPPLIER (sid, name, city)
values (2816773, 'Linksys', 'Fair Lawn');
insert into SUPPLIER (sid, name, city)
values (2437873, 'Electrical Solu', 'New Hope');
insert into SUPPLIER (sid, name, city)
values (6617442, 'Hat World', 'Trumbull');
insert into SUPPLIER (sid, name, city)
values (9910646, 'Y2Marketing', 'Brugherio');
insert into SUPPLIER (sid, name, city)
values (6895452, 'Investors Title', 'Geneve');
insert into SUPPLIER (sid, name, city)
values (3873719, 'Priority Leasin', 'Cedar Park');
insert into SUPPLIER (sid, name, city)
values (6251806, 'StoneTech Profe', 'Scottsdale');
insert into SUPPLIER (sid, name, city)
values (5599761, 'Parker Compound', 'Brisbane');
insert into SUPPLIER (sid, name, city)
values (5198123, 'TLS Service Bur', 'Rochester');
insert into SUPPLIER (sid, name, city)
values (3418164, 'Uniserve Facili', 'Winnipeg');
insert into SUPPLIER (sid, name, city)
values (7322569, 'Harrison & Shri', 'Macau');
insert into SUPPLIER (sid, name, city)
values (6855043, 'New Horizons Co', 'Pompton Pl');
insert into SUPPLIER (sid, name, city)
values (8958223, 'Serentec', 'Kungens ku');
insert into SUPPLIER (sid, name, city)
values (6353545, 'Pan-Pacific Ret', 'Ellicott C');
insert into SUPPLIER (sid, name, city)
values (6050649, 'Strategic Produ', 'Ehningen');
insert into SUPPLIER (sid, name, city)
values (1412274, 'North Coast Ene', 'Rancho Pal');
insert into SUPPLIER (sid, name, city)
values (1176552, 'SSCI', 'Ingelheim');
insert into SUPPLIER (sid, name, city)
values (5328757, 'ProSys Informat', 'Fort gordo');
commit;
prompt 161 records loaded
prompt Loading GIVES_ORDER...
prompt Table is empty
prompt Loading MEDICINE...
insert into MEDICINE (drugid, price, quantity)
values (85592, 50, 262789);
insert into MEDICINE (drugid, price, quantity)
values (12777, 14, 884212);
insert into MEDICINE (drugid, price, quantity)
values (49931, 97, 990702);
insert into MEDICINE (drugid, price, quantity)
values (37716, 70, 432951);
insert into MEDICINE (drugid, price, quantity)
values (89652, 10, 792719);
insert into MEDICINE (drugid, price, quantity)
values (26333, 14, 445378);
insert into MEDICINE (drugid, price, quantity)
values (86375, 96, 734838);
insert into MEDICINE (drugid, price, quantity)
values (60505, 20, 528061);
insert into MEDICINE (drugid, price, quantity)
values (75349, 31, 187694);
insert into MEDICINE (drugid, price, quantity)
values (33442, 66, 998546);
insert into MEDICINE (drugid, price, quantity)
values (20293, 47, 471296);
insert into MEDICINE (drugid, price, quantity)
values (28354, 60, 708270);
insert into MEDICINE (drugid, price, quantity)
values (40223, 5, 771298);
insert into MEDICINE (drugid, price, quantity)
values (51996, 10, 169922);
insert into MEDICINE (drugid, price, quantity)
values (59300, 5, 34494);
insert into MEDICINE (drugid, price, quantity)
values (16143, 65, 319477);
insert into MEDICINE (drugid, price, quantity)
values (61796, 62, 493533);
insert into MEDICINE (drugid, price, quantity)
values (37013, 34, 40921);
insert into MEDICINE (drugid, price, quantity)
values (53400, 16, 202321);
insert into MEDICINE (drugid, price, quantity)
values (55204, 7, 12425);
insert into MEDICINE (drugid, price, quantity)
values (42336, 78, 796612);
insert into MEDICINE (drugid, price, quantity)
values (31962, 100, 558620);
insert into MEDICINE (drugid, price, quantity)
values (84181, 59, 441311);
insert into MEDICINE (drugid, price, quantity)
values (36388, 81, 577480);
insert into MEDICINE (drugid, price, quantity)
values (27773, 77, 899682);
insert into MEDICINE (drugid, price, quantity)
values (87647, 21, 314387);
insert into MEDICINE (drugid, price, quantity)
values (81253, 99, 672334);
insert into MEDICINE (drugid, price, quantity)
values (21345, 79, 342880);
insert into MEDICINE (drugid, price, quantity)
values (32004, 36, 518123);
insert into MEDICINE (drugid, price, quantity)
values (34925, 18, 643798);
insert into MEDICINE (drugid, price, quantity)
values (47228, 55, 197414);
insert into MEDICINE (drugid, price, quantity)
values (58248, 75, 714599);
insert into MEDICINE (drugid, price, quantity)
values (77825, 52, 283049);
insert into MEDICINE (drugid, price, quantity)
values (17512, 36, 250959);
insert into MEDICINE (drugid, price, quantity)
values (12439, 72, 178304);
insert into MEDICINE (drugid, price, quantity)
values (58222, 77, 685925);
insert into MEDICINE (drugid, price, quantity)
values (65775, 21, 376615);
insert into MEDICINE (drugid, price, quantity)
values (71103, 90, 810383);
insert into MEDICINE (drugid, price, quantity)
values (60695, 35, 307445);
insert into MEDICINE (drugid, price, quantity)
values (68734, 73, 394892);
insert into MEDICINE (drugid, price, quantity)
values (62104, 52, 148780);
insert into MEDICINE (drugid, price, quantity)
values (15074, 72, 249512);
insert into MEDICINE (drugid, price, quantity)
values (67290, 92, 561938);
insert into MEDICINE (drugid, price, quantity)
values (20173, 75, 57698);
insert into MEDICINE (drugid, price, quantity)
values (17136, 9, 731143);
insert into MEDICINE (drugid, price, quantity)
values (63024, 49, 665045);
insert into MEDICINE (drugid, price, quantity)
values (10530, 55, 181135);
insert into MEDICINE (drugid, price, quantity)
values (41895, 27, 856208);
insert into MEDICINE (drugid, price, quantity)
values (25280, 43, 913458);
insert into MEDICINE (drugid, price, quantity)
values (18372, 15, 76168);
insert into MEDICINE (drugid, price, quantity)
values (58035, 96, 258509);
insert into MEDICINE (drugid, price, quantity)
values (63965, 45, 607700);
insert into MEDICINE (drugid, price, quantity)
values (17919, 76, 798491);
insert into MEDICINE (drugid, price, quantity)
values (61309, 88, 467834);
insert into MEDICINE (drugid, price, quantity)
values (49036, 69, 588384);
insert into MEDICINE (drugid, price, quantity)
values (80849, 1, 294951);
insert into MEDICINE (drugid, price, quantity)
values (40449, 46, 803);
insert into MEDICINE (drugid, price, quantity)
values (73302, 77, 827191);
insert into MEDICINE (drugid, price, quantity)
values (13960, 11, 658189);
insert into MEDICINE (drugid, price, quantity)
values (73320, 59, 784808);
insert into MEDICINE (drugid, price, quantity)
values (44705, 7, 405122);
insert into MEDICINE (drugid, price, quantity)
values (65448, 33, 126320);
insert into MEDICINE (drugid, price, quantity)
values (32520, 13, 926837);
insert into MEDICINE (drugid, price, quantity)
values (44807, 40, 313350);
insert into MEDICINE (drugid, price, quantity)
values (68032, 61, 749886);
insert into MEDICINE (drugid, price, quantity)
values (56894, 74, 454371);
insert into MEDICINE (drugid, price, quantity)
values (71566, 63, 779867);
insert into MEDICINE (drugid, price, quantity)
values (88453, 70, 565791);
insert into MEDICINE (drugid, price, quantity)
values (10234, 68, 551633);
insert into MEDICINE (drugid, price, quantity)
values (89588, 59, 752240);
insert into MEDICINE (drugid, price, quantity)
values (63959, 94, 801964);
insert into MEDICINE (drugid, price, quantity)
values (21117, 24, 429221);
insert into MEDICINE (drugid, price, quantity)
values (79686, 40, 135819);
insert into MEDICINE (drugid, price, quantity)
values (45604, 25, 852920);
insert into MEDICINE (drugid, price, quantity)
values (29715, 99, 257488);
insert into MEDICINE (drugid, price, quantity)
values (60596, 86, 746330);
insert into MEDICINE (drugid, price, quantity)
values (39809, 38, 789710);
insert into MEDICINE (drugid, price, quantity)
values (73307, 32, 780629);
insert into MEDICINE (drugid, price, quantity)
values (60649, 90, 919640);
insert into MEDICINE (drugid, price, quantity)
values (42283, 93, 648235);
insert into MEDICINE (drugid, price, quantity)
values (47212, 16, 302969);
insert into MEDICINE (drugid, price, quantity)
values (48582, 82, 511861);
insert into MEDICINE (drugid, price, quantity)
values (89800, 14, 638876);
insert into MEDICINE (drugid, price, quantity)
values (51536, 9, 294528);
insert into MEDICINE (drugid, price, quantity)
values (52703, 85, 411572);
insert into MEDICINE (drugid, price, quantity)
values (37401, 82, 651470);
insert into MEDICINE (drugid, price, quantity)
values (26863, 56, 291218);
insert into MEDICINE (drugid, price, quantity)
values (88004, 65, 98681);
insert into MEDICINE (drugid, price, quantity)
values (36456, 90, 910655);
insert into MEDICINE (drugid, price, quantity)
values (65963, 99, 726921);
insert into MEDICINE (drugid, price, quantity)
values (60892, 84, 997061);
insert into MEDICINE (drugid, price, quantity)
values (78142, 66, 766928);
insert into MEDICINE (drugid, price, quantity)
values (88563, 16, 451937);
insert into MEDICINE (drugid, price, quantity)
values (84664, 7, 53828);
insert into MEDICINE (drugid, price, quantity)
values (71510, 29, 751113);
insert into MEDICINE (drugid, price, quantity)
values (52199, 29, 728737);
insert into MEDICINE (drugid, price, quantity)
values (86221, 79, 291350);
insert into MEDICINE (drugid, price, quantity)
values (72143, 24, 375915);
insert into MEDICINE (drugid, price, quantity)
values (69898, 98, 854107);
insert into MEDICINE (drugid, price, quantity)
values (81894, 22, 787029);
commit;
prompt 100 records committed...
insert into MEDICINE (drugid, price, quantity)
values (18820, 64, 502467);
insert into MEDICINE (drugid, price, quantity)
values (85664, 9, 732496);
insert into MEDICINE (drugid, price, quantity)
values (10786, 51, 786875);
insert into MEDICINE (drugid, price, quantity)
values (75048, 17, 66226);
insert into MEDICINE (drugid, price, quantity)
values (32167, 7, 421393);
insert into MEDICINE (drugid, price, quantity)
values (84063, 30, 256643);
insert into MEDICINE (drugid, price, quantity)
values (56720, 12, 417445);
insert into MEDICINE (drugid, price, quantity)
values (23422, 66, 586300);
insert into MEDICINE (drugid, price, quantity)
values (83096, 45, 338721);
insert into MEDICINE (drugid, price, quantity)
values (89534, 63, 857129);
insert into MEDICINE (drugid, price, quantity)
values (75837, 86, 681769);
insert into MEDICINE (drugid, price, quantity)
values (40011, 66, 40894);
insert into MEDICINE (drugid, price, quantity)
values (75724, 69, 704181);
insert into MEDICINE (drugid, price, quantity)
values (74488, 66, 987281);
insert into MEDICINE (drugid, price, quantity)
values (54409, 94, 128698);
insert into MEDICINE (drugid, price, quantity)
values (22031, 85, 607700);
insert into MEDICINE (drugid, price, quantity)
values (10601, 68, 359612);
insert into MEDICINE (drugid, price, quantity)
values (19742, 17, 953890);
insert into MEDICINE (drugid, price, quantity)
values (85408, 54, 969857);
insert into MEDICINE (drugid, price, quantity)
values (75870, 49, 869165);
insert into MEDICINE (drugid, price, quantity)
values (17992, 37, 565878);
insert into MEDICINE (drugid, price, quantity)
values (50290, 53, 469264);
insert into MEDICINE (drugid, price, quantity)
values (54321, 81, 525008);
insert into MEDICINE (drugid, price, quantity)
values (60234, 17, 171686);
insert into MEDICINE (drugid, price, quantity)
values (86554, 96, 839358);
insert into MEDICINE (drugid, price, quantity)
values (14885, 17, 399589);
insert into MEDICINE (drugid, price, quantity)
values (43504, 62, 203567);
insert into MEDICINE (drugid, price, quantity)
values (63753, 99, 1409);
insert into MEDICINE (drugid, price, quantity)
values (38652, 32, 863620);
insert into MEDICINE (drugid, price, quantity)
values (55729, 2, 912687);
insert into MEDICINE (drugid, price, quantity)
values (16274, 46, 412863);
insert into MEDICINE (drugid, price, quantity)
values (53283, 87, 204738);
insert into MEDICINE (drugid, price, quantity)
values (83574, 70, 991933);
insert into MEDICINE (drugid, price, quantity)
values (54459, 71, 478325);
insert into MEDICINE (drugid, price, quantity)
values (82046, 50, 33783);
insert into MEDICINE (drugid, price, quantity)
values (69168, 9, 131715);
insert into MEDICINE (drugid, price, quantity)
values (59870, 44, 106210);
insert into MEDICINE (drugid, price, quantity)
values (20734, 64, 424185);
insert into MEDICINE (drugid, price, quantity)
values (23706, 66, 354430);
insert into MEDICINE (drugid, price, quantity)
values (43700, 22, 30366);
insert into MEDICINE (drugid, price, quantity)
values (58098, 89, 848027);
insert into MEDICINE (drugid, price, quantity)
values (69643, 42, 622);
insert into MEDICINE (drugid, price, quantity)
values (68526, 34, 602412);
insert into MEDICINE (drugid, price, quantity)
values (19035, 9, 270148);
insert into MEDICINE (drugid, price, quantity)
values (15201, 19, 487333);
insert into MEDICINE (drugid, price, quantity)
values (14184, 17, 157335);
insert into MEDICINE (drugid, price, quantity)
values (23825, 96, 466381);
insert into MEDICINE (drugid, price, quantity)
values (40811, 45, 222630);
insert into MEDICINE (drugid, price, quantity)
values (51782, 36, 944490);
insert into MEDICINE (drugid, price, quantity)
values (59085, 73, 485077);
insert into MEDICINE (drugid, price, quantity)
values (78662, 64, 247468);
insert into MEDICINE (drugid, price, quantity)
values (63717, 35, 877517);
insert into MEDICINE (drugid, price, quantity)
values (63504, 89, 731247);
insert into MEDICINE (drugid, price, quantity)
values (22189, 77, 25535);
insert into MEDICINE (drugid, price, quantity)
values (32775, 56, 531217);
insert into MEDICINE (drugid, price, quantity)
values (65272, 59, 522156);
insert into MEDICINE (drugid, price, quantity)
values (57906, 78, 826292);
insert into MEDICINE (drugid, price, quantity)
values (49680, 35, 902493);
insert into MEDICINE (drugid, price, quantity)
values (54058, 85, 520651);
insert into MEDICINE (drugid, price, quantity)
values (24048, 67, 62641);
insert into MEDICINE (drugid, price, quantity)
values (27835, 72, 750995);
insert into MEDICINE (drugid, price, quantity)
values (51373, 42, 977406);
insert into MEDICINE (drugid, price, quantity)
values (85784, 13, 421102);
insert into MEDICINE (drugid, price, quantity)
values (78606, 3, 814650);
insert into MEDICINE (drugid, price, quantity)
values (12785, 2, 360974);
insert into MEDICINE (drugid, price, quantity)
values (62349, 22, 982525);
insert into MEDICINE (drugid, price, quantity)
values (84857, 97, 517421);
insert into MEDICINE (drugid, price, quantity)
values (83371, 59, 842119);
insert into MEDICINE (drugid, price, quantity)
values (59366, 15, 119103);
insert into MEDICINE (drugid, price, quantity)
values (77152, 76, 834671);
insert into MEDICINE (drugid, price, quantity)
values (12322, 82, 834191);
insert into MEDICINE (drugid, price, quantity)
values (37729, 92, 171912);
insert into MEDICINE (drugid, price, quantity)
values (52171, 27, 865600);
insert into MEDICINE (drugid, price, quantity)
values (82825, 64, 82815);
insert into MEDICINE (drugid, price, quantity)
values (37397, 37, 519580);
insert into MEDICINE (drugid, price, quantity)
values (84561, 42, 462584);
insert into MEDICINE (drugid, price, quantity)
values (46281, 5, 350788);
insert into MEDICINE (drugid, price, quantity)
values (77019, 7, 692556);
insert into MEDICINE (drugid, price, quantity)
values (76262, 24, 343450);
insert into MEDICINE (drugid, price, quantity)
values (74486, 43, 955360);
insert into MEDICINE (drugid, price, quantity)
values (72660, 57, 46210);
insert into MEDICINE (drugid, price, quantity)
values (37430, 73, 620644);
insert into MEDICINE (drugid, price, quantity)
values (46871, 51, 950347);
insert into MEDICINE (drugid, price, quantity)
values (72062, 14, 785484);
insert into MEDICINE (drugid, price, quantity)
values (87690, 26, 999655);
insert into MEDICINE (drugid, price, quantity)
values (68821, 77, 882674);
insert into MEDICINE (drugid, price, quantity)
values (81029, 51, 757996);
insert into MEDICINE (drugid, price, quantity)
values (80179, 73, 982032);
insert into MEDICINE (drugid, price, quantity)
values (38100, 97, 749778);
insert into MEDICINE (drugid, price, quantity)
values (13859, 29, 67057);
insert into MEDICINE (drugid, price, quantity)
values (34979, 82, 641938);
insert into MEDICINE (drugid, price, quantity)
values (78917, 7, 734334);
insert into MEDICINE (drugid, price, quantity)
values (32531, 81, 565904);
insert into MEDICINE (drugid, price, quantity)
values (74046, 2, 498417);
insert into MEDICINE (drugid, price, quantity)
values (59763, 46, 796916);
insert into MEDICINE (drugid, price, quantity)
values (55099, 89, 753114);
insert into MEDICINE (drugid, price, quantity)
values (70996, 25, 528657);
insert into MEDICINE (drugid, price, quantity)
values (86962, 87, 503517);
insert into MEDICINE (drugid, price, quantity)
values (12587, 64, 415645);
insert into MEDICINE (drugid, price, quantity)
values (38799, 39, 804490);
commit;
prompt 200 records committed...
insert into MEDICINE (drugid, price, quantity)
values (83478, 65, 217031);
insert into MEDICINE (drugid, price, quantity)
values (86100, 81, 482851);
insert into MEDICINE (drugid, price, quantity)
values (70470, 74, 75598);
insert into MEDICINE (drugid, price, quantity)
values (23057, 50, 744948);
insert into MEDICINE (drugid, price, quantity)
values (88918, 20, 17538);
insert into MEDICINE (drugid, price, quantity)
values (69519, 19, 741036);
insert into MEDICINE (drugid, price, quantity)
values (47383, 14, 974412);
insert into MEDICINE (drugid, price, quantity)
values (63042, 43, 635413);
insert into MEDICINE (drugid, price, quantity)
values (65845, 96, 321038);
insert into MEDICINE (drugid, price, quantity)
values (43585, 27, 279100);
insert into MEDICINE (drugid, price, quantity)
values (56181, 17, 404561);
insert into MEDICINE (drugid, price, quantity)
values (70918, 15, 762553);
insert into MEDICINE (drugid, price, quantity)
values (25901, 46, 122903);
insert into MEDICINE (drugid, price, quantity)
values (68030, 90, 1824);
insert into MEDICINE (drugid, price, quantity)
values (56529, 41, 107911);
insert into MEDICINE (drugid, price, quantity)
values (42671, 85, 645431);
insert into MEDICINE (drugid, price, quantity)
values (81496, 2, 792124);
insert into MEDICINE (drugid, price, quantity)
values (48592, 31, 43240);
insert into MEDICINE (drugid, price, quantity)
values (10107, 99, 400781);
insert into MEDICINE (drugid, price, quantity)
values (33128, 73, 355635);
insert into MEDICINE (drugid, price, quantity)
values (78863, 89, 24975);
insert into MEDICINE (drugid, price, quantity)
values (83491, 62, 163423);
insert into MEDICINE (drugid, price, quantity)
values (64325, 56, 210130);
insert into MEDICINE (drugid, price, quantity)
values (15437, 50, 729009);
insert into MEDICINE (drugid, price, quantity)
values (67748, 63, 248897);
insert into MEDICINE (drugid, price, quantity)
values (29968, 56, 419691);
insert into MEDICINE (drugid, price, quantity)
values (45799, 28, 411518);
insert into MEDICINE (drugid, price, quantity)
values (21248, 49, 297108);
insert into MEDICINE (drugid, price, quantity)
values (18997, 56, 992175);
insert into MEDICINE (drugid, price, quantity)
values (17174, 31, 565350);
insert into MEDICINE (drugid, price, quantity)
values (44858, 85, 109437);
insert into MEDICINE (drugid, price, quantity)
values (17844, 24, 16511);
insert into MEDICINE (drugid, price, quantity)
values (21277, 11, 985078);
insert into MEDICINE (drugid, price, quantity)
values (51609, 68, 879103);
insert into MEDICINE (drugid, price, quantity)
values (52298, 41, 750650);
insert into MEDICINE (drugid, price, quantity)
values (38484, 100, 124106);
insert into MEDICINE (drugid, price, quantity)
values (48191, 30, 8066);
insert into MEDICINE (drugid, price, quantity)
values (81415, 92, 378239);
insert into MEDICINE (drugid, price, quantity)
values (69665, 97, 211169);
insert into MEDICINE (drugid, price, quantity)
values (62184, 48, 696472);
insert into MEDICINE (drugid, price, quantity)
values (87030, 87, 752695);
insert into MEDICINE (drugid, price, quantity)
values (65731, 88, 618751);
insert into MEDICINE (drugid, price, quantity)
values (54295, 54, 247491);
insert into MEDICINE (drugid, price, quantity)
values (39219, 81, 741500);
insert into MEDICINE (drugid, price, quantity)
values (80423, 72, 210824);
insert into MEDICINE (drugid, price, quantity)
values (15386, 38, 535479);
insert into MEDICINE (drugid, price, quantity)
values (40380, 28, 952707);
insert into MEDICINE (drugid, price, quantity)
values (78564, 53, 900354);
insert into MEDICINE (drugid, price, quantity)
values (32120, 52, 357797);
insert into MEDICINE (drugid, price, quantity)
values (71161, 87, 25425);
insert into MEDICINE (drugid, price, quantity)
values (77287, 18, 108130);
insert into MEDICINE (drugid, price, quantity)
values (33544, 4, 87912);
insert into MEDICINE (drugid, price, quantity)
values (88174, 91, 145172);
insert into MEDICINE (drugid, price, quantity)
values (65886, 93, 227357);
insert into MEDICINE (drugid, price, quantity)
values (46400, 20, 571051);
insert into MEDICINE (drugid, price, quantity)
values (61940, 86, 649818);
insert into MEDICINE (drugid, price, quantity)
values (24746, 52, 68652);
insert into MEDICINE (drugid, price, quantity)
values (36611, 3, 700821);
insert into MEDICINE (drugid, price, quantity)
values (77732, 84, 89251);
insert into MEDICINE (drugid, price, quantity)
values (76790, 68, 864237);
insert into MEDICINE (drugid, price, quantity)
values (73830, 65, 826844);
insert into MEDICINE (drugid, price, quantity)
values (53113, 70, 957698);
insert into MEDICINE (drugid, price, quantity)
values (67538, 61, 182902);
insert into MEDICINE (drugid, price, quantity)
values (24150, 1, 866490);
insert into MEDICINE (drugid, price, quantity)
values (78088, 50, 836448);
insert into MEDICINE (drugid, price, quantity)
values (68965, 95, 49425);
insert into MEDICINE (drugid, price, quantity)
values (18208, 75, 984468);
insert into MEDICINE (drugid, price, quantity)
values (64058, 79, 324646);
insert into MEDICINE (drugid, price, quantity)
values (66096, 19, 619534);
insert into MEDICINE (drugid, price, quantity)
values (41451, 64, 163002);
insert into MEDICINE (drugid, price, quantity)
values (61674, 33, 177241);
insert into MEDICINE (drugid, price, quantity)
values (70943, 49, 444224);
insert into MEDICINE (drugid, price, quantity)
values (79220, 99, 328498);
insert into MEDICINE (drugid, price, quantity)
values (26551, 22, 428915);
insert into MEDICINE (drugid, price, quantity)
values (87568, 55, 423144);
insert into MEDICINE (drugid, price, quantity)
values (49749, 43, 130115);
insert into MEDICINE (drugid, price, quantity)
values (61390, 53, 924353);
insert into MEDICINE (drugid, price, quantity)
values (55252, 78, 394094);
insert into MEDICINE (drugid, price, quantity)
values (37417, 67, 920401);
insert into MEDICINE (drugid, price, quantity)
values (44006, 34, 383869);
insert into MEDICINE (drugid, price, quantity)
values (83011, 83, 773948);
insert into MEDICINE (drugid, price, quantity)
values (17436, 64, 863043);
insert into MEDICINE (drugid, price, quantity)
values (26091, 19, 981729);
insert into MEDICINE (drugid, price, quantity)
values (52100, 46, 264435);
insert into MEDICINE (drugid, price, quantity)
values (70260, 42, 681778);
insert into MEDICINE (drugid, price, quantity)
values (39611, 74, 60251);
insert into MEDICINE (drugid, price, quantity)
values (31763, 2, 773652);
insert into MEDICINE (drugid, price, quantity)
values (88006, 62, 990534);
insert into MEDICINE (drugid, price, quantity)
values (71036, 8, 621971);
insert into MEDICINE (drugid, price, quantity)
values (22695, 59, 317027);
insert into MEDICINE (drugid, price, quantity)
values (35648, 78, 607581);
insert into MEDICINE (drugid, price, quantity)
values (62711, 16, 12725);
insert into MEDICINE (drugid, price, quantity)
values (28785, 73, 686107);
insert into MEDICINE (drugid, price, quantity)
values (66155, 60, 735857);
insert into MEDICINE (drugid, price, quantity)
values (72745, 53, 423274);
insert into MEDICINE (drugid, price, quantity)
values (62609, 63, 133353);
insert into MEDICINE (drugid, price, quantity)
values (55481, 54, 12476);
insert into MEDICINE (drugid, price, quantity)
values (84699, 90, 535446);
insert into MEDICINE (drugid, price, quantity)
values (74852, 53, 355299);
insert into MEDICINE (drugid, price, quantity)
values (21077, 59, 2451);
commit;
prompt 300 records committed...
insert into MEDICINE (drugid, price, quantity)
values (54984, 52, 712413);
insert into MEDICINE (drugid, price, quantity)
values (63818, 12, 29531);
insert into MEDICINE (drugid, price, quantity)
values (47092, 82, 523139);
insert into MEDICINE (drugid, price, quantity)
values (39522, 99, 567754);
insert into MEDICINE (drugid, price, quantity)
values (48049, 80, 59313);
insert into MEDICINE (drugid, price, quantity)
values (20391, 81, 442625);
insert into MEDICINE (drugid, price, quantity)
values (19211, 76, 435547);
insert into MEDICINE (drugid, price, quantity)
values (74121, 86, 306941);
insert into MEDICINE (drugid, price, quantity)
values (10218, 63, 455993);
insert into MEDICINE (drugid, price, quantity)
values (34627, 17, 15778);
insert into MEDICINE (drugid, price, quantity)
values (32886, 79, 649788);
insert into MEDICINE (drugid, price, quantity)
values (44516, 49, 320220);
insert into MEDICINE (drugid, price, quantity)
values (53862, 81, 945971);
insert into MEDICINE (drugid, price, quantity)
values (19576, 48, 105529);
insert into MEDICINE (drugid, price, quantity)
values (46297, 1, 576386);
insert into MEDICINE (drugid, price, quantity)
values (80721, 12, 611400);
insert into MEDICINE (drugid, price, quantity)
values (45601, 83, 284329);
insert into MEDICINE (drugid, price, quantity)
values (34479, 54, 229122);
insert into MEDICINE (drugid, price, quantity)
values (57220, 46, 570007);
insert into MEDICINE (drugid, price, quantity)
values (84464, 84, 135556);
insert into MEDICINE (drugid, price, quantity)
values (10376, 16, 833780);
insert into MEDICINE (drugid, price, quantity)
values (45886, 11, 697097);
insert into MEDICINE (drugid, price, quantity)
values (41248, 44, 441428);
insert into MEDICINE (drugid, price, quantity)
values (53404, 50, 801533);
insert into MEDICINE (drugid, price, quantity)
values (78927, 7, 220751);
insert into MEDICINE (drugid, price, quantity)
values (78849, 90, 820907);
insert into MEDICINE (drugid, price, quantity)
values (59363, 11, 986660);
insert into MEDICINE (drugid, price, quantity)
values (71280, 73, 582622);
insert into MEDICINE (drugid, price, quantity)
values (56596, 51, 394415);
insert into MEDICINE (drugid, price, quantity)
values (55127, 44, 894516);
insert into MEDICINE (drugid, price, quantity)
values (12091, 44, 454030);
insert into MEDICINE (drugid, price, quantity)
values (23460, 95, 225302);
insert into MEDICINE (drugid, price, quantity)
values (53955, 8, 677655);
insert into MEDICINE (drugid, price, quantity)
values (35851, 19, 602502);
insert into MEDICINE (drugid, price, quantity)
values (39378, 5, 646776);
insert into MEDICINE (drugid, price, quantity)
values (35402, 3, 284129);
insert into MEDICINE (drugid, price, quantity)
values (32848, 38, 408537);
insert into MEDICINE (drugid, price, quantity)
values (38690, 15, 741856);
insert into MEDICINE (drugid, price, quantity)
values (65194, 78, 791140);
insert into MEDICINE (drugid, price, quantity)
values (24574, 24, 576377);
insert into MEDICINE (drugid, price, quantity)
values (31765, 6, 104268);
insert into MEDICINE (drugid, price, quantity)
values (38281, 48, 982788);
insert into MEDICINE (drugid, price, quantity)
values (26862, 28, 324275);
insert into MEDICINE (drugid, price, quantity)
values (80625, 10, 607385);
insert into MEDICINE (drugid, price, quantity)
values (60988, 1, 817950);
insert into MEDICINE (drugid, price, quantity)
values (53929, 50, 900037);
insert into MEDICINE (drugid, price, quantity)
values (52579, 46, 495628);
insert into MEDICINE (drugid, price, quantity)
values (50926, 55, 680488);
insert into MEDICINE (drugid, price, quantity)
values (31557, 78, 66611);
insert into MEDICINE (drugid, price, quantity)
values (65827, 7, 415317);
insert into MEDICINE (drugid, price, quantity)
values (83394, 15, 359911);
insert into MEDICINE (drugid, price, quantity)
values (82778, 89, 957131);
insert into MEDICINE (drugid, price, quantity)
values (64319, 68, 533672);
insert into MEDICINE (drugid, price, quantity)
values (81034, 24, 41516);
insert into MEDICINE (drugid, price, quantity)
values (55886, 85, 989821);
insert into MEDICINE (drugid, price, quantity)
values (53477, 21, 982812);
insert into MEDICINE (drugid, price, quantity)
values (25306, 60, 998928);
insert into MEDICINE (drugid, price, quantity)
values (50469, 62, 569283);
insert into MEDICINE (drugid, price, quantity)
values (21805, 52, 986588);
insert into MEDICINE (drugid, price, quantity)
values (79555, 30, 444467);
insert into MEDICINE (drugid, price, quantity)
values (33687, 49, 199208);
insert into MEDICINE (drugid, price, quantity)
values (78185, 5, 86615);
insert into MEDICINE (drugid, price, quantity)
values (80900, 68, 616518);
insert into MEDICINE (drugid, price, quantity)
values (76379, 17, 174925);
insert into MEDICINE (drugid, price, quantity)
values (28551, 17, 572827);
insert into MEDICINE (drugid, price, quantity)
values (24132, 32, 472091);
insert into MEDICINE (drugid, price, quantity)
values (23215, 36, 151625);
insert into MEDICINE (drugid, price, quantity)
values (39416, 70, 670060);
insert into MEDICINE (drugid, price, quantity)
values (20765, 86, 90934);
insert into MEDICINE (drugid, price, quantity)
values (21715, 7, 752346);
insert into MEDICINE (drugid, price, quantity)
values (37081, 70, 242503);
insert into MEDICINE (drugid, price, quantity)
values (18375, 9, 634257);
insert into MEDICINE (drugid, price, quantity)
values (36168, 42, 628925);
insert into MEDICINE (drugid, price, quantity)
values (11344, 22, 964443);
insert into MEDICINE (drugid, price, quantity)
values (19060, 9, 401528);
insert into MEDICINE (drugid, price, quantity)
values (55493, 6, 319837);
insert into MEDICINE (drugid, price, quantity)
values (56331, 50, 580992);
insert into MEDICINE (drugid, price, quantity)
values (11263, 44, 413740);
insert into MEDICINE (drugid, price, quantity)
values (82100, 25, 924565);
insert into MEDICINE (drugid, price, quantity)
values (59213, 3, 676039);
insert into MEDICINE (drugid, price, quantity)
values (43157, 85, 670986);
insert into MEDICINE (drugid, price, quantity)
values (66892, 57, 467907);
insert into MEDICINE (drugid, price, quantity)
values (78127, 74, 829247);
insert into MEDICINE (drugid, price, quantity)
values (84499, 66, 573200);
insert into MEDICINE (drugid, price, quantity)
values (73551, 57, 162676);
insert into MEDICINE (drugid, price, quantity)
values (39928, 98, 277679);
insert into MEDICINE (drugid, price, quantity)
values (51363, 58, 638007);
insert into MEDICINE (drugid, price, quantity)
values (71046, 62, 617763);
insert into MEDICINE (drugid, price, quantity)
values (70421, 12, 922560);
insert into MEDICINE (drugid, price, quantity)
values (58475, 26, 65008);
insert into MEDICINE (drugid, price, quantity)
values (38577, 5, 83944);
insert into MEDICINE (drugid, price, quantity)
values (30629, 29, 323719);
insert into MEDICINE (drugid, price, quantity)
values (76259, 21, 38327);
insert into MEDICINE (drugid, price, quantity)
values (69427, 83, 869220);
insert into MEDICINE (drugid, price, quantity)
values (52551, 2, 67671);
insert into MEDICINE (drugid, price, quantity)
values (14841, 86, 656132);
insert into MEDICINE (drugid, price, quantity)
values (35546, 2, 946126);
insert into MEDICINE (drugid, price, quantity)
values (74369, 24, 891795);
insert into MEDICINE (drugid, price, quantity)
values (64989, 16, 443265);
insert into MEDICINE (drugid, price, quantity)
values (68234, 82, 42428);
commit;
prompt 400 records committed...
insert into MEDICINE (drugid, price, quantity)
values (45107, 1, 88505);
insert into MEDICINE (drugid, price, quantity)
values (72804, 76, 946543);
insert into MEDICINE (drugid, price, quantity)
values (18852, 33, 29790);
insert into MEDICINE (drugid, price, quantity)
values (35192, 73, 800636);
insert into MEDICINE (drugid, price, quantity)
values (49476, 78, 342359);
insert into MEDICINE (drugid, price, quantity)
values (54067, 66, 661705);
insert into MEDICINE (drugid, price, quantity)
values (48069, 98, 769638);
insert into MEDICINE (drugid, price, quantity)
values (40981, 45, 722719);
insert into MEDICINE (drugid, price, quantity)
values (12086, 19, 775953);
insert into MEDICINE (drugid, price, quantity)
values (12430, 34, 84538);
insert into MEDICINE (drugid, price, quantity)
values (74892, 21, 19093);
insert into MEDICINE (drugid, price, quantity)
values (36533, 42, 629481);
insert into MEDICINE (drugid, price, quantity)
values (82218, 62, 887106);
insert into MEDICINE (drugid, price, quantity)
values (66655, 45, 844781);
insert into MEDICINE (drugid, price, quantity)
values (44829, 73, 7631);
insert into MEDICINE (drugid, price, quantity)
values (35298, 83, 511609);
insert into MEDICINE (drugid, price, quantity)
values (43663, 54, 60973);
insert into MEDICINE (drugid, price, quantity)
values (30740, 37, 31749);
insert into MEDICINE (drugid, price, quantity)
values (26282, 10, 283731);
insert into MEDICINE (drugid, price, quantity)
values (81140, 70, 122013);
insert into MEDICINE (drugid, price, quantity)
values (76670, 90, 800817);
insert into MEDICINE (drugid, price, quantity)
values (11247, 8, 478589);
insert into MEDICINE (drugid, price, quantity)
values (89250, 49, 932465);
insert into MEDICINE (drugid, price, quantity)
values (80372, 45, 112121);
insert into MEDICINE (drugid, price, quantity)
values (57453, 19, 951940);
insert into MEDICINE (drugid, price, quantity)
values (41863, 92, 192016);
insert into MEDICINE (drugid, price, quantity)
values (82217, 4, 981566);
insert into MEDICINE (drugid, price, quantity)
values (29185, 15, 727742);
insert into MEDICINE (drugid, price, quantity)
values (41542, 46, 871922);
insert into MEDICINE (drugid, price, quantity)
values (16498, 92, 68199);
insert into MEDICINE (drugid, price, quantity)
values (83516, 39, 574099);
insert into MEDICINE (drugid, price, quantity)
values (67717, 99, 330119);
insert into MEDICINE (drugid, price, quantity)
values (37205, 96, 750252);
insert into MEDICINE (drugid, price, quantity)
values (82140, 99, 285403);
insert into MEDICINE (drugid, price, quantity)
values (83377, 12, 735852);
insert into MEDICINE (drugid, price, quantity)
values (52004, 59, 257812);
insert into MEDICINE (drugid, price, quantity)
values (75199, 32, 530516);
insert into MEDICINE (drugid, price, quantity)
values (72726, 1, 14003);
insert into MEDICINE (drugid, price, quantity)
values (32940, 10, 815586);
insert into MEDICINE (drugid, price, quantity)
values (35086, 10, 795016);
insert into MEDICINE (drugid, price, quantity)
values (81094, 39, 138232);
insert into MEDICINE (drugid, price, quantity)
values (56465, 11, 926255);
insert into MEDICINE (drugid, price, quantity)
values (28493, 40, 261953);
insert into MEDICINE (drugid, price, quantity)
values (36438, 10, 967496);
insert into MEDICINE (drugid, price, quantity)
values (79571, 3, 504297);
insert into MEDICINE (drugid, price, quantity)
values (82997, 9, 965331);
insert into MEDICINE (drugid, price, quantity)
values (75373, 69, 492971);
insert into MEDICINE (drugid, price, quantity)
values (54988, 5, 829514);
insert into MEDICINE (drugid, price, quantity)
values (82520, 73, 963378);
insert into MEDICINE (drugid, price, quantity)
values (13734, 94, 42359);
insert into MEDICINE (drugid, price, quantity)
values (86518, 32, 217936);
insert into MEDICINE (drugid, price, quantity)
values (20274, 71, 816202);
insert into MEDICINE (drugid, price, quantity)
values (38649, 35, 720356);
insert into MEDICINE (drugid, price, quantity)
values (41352, 78, 391857);
insert into MEDICINE (drugid, price, quantity)
values (30518, 77, 112601);
insert into MEDICINE (drugid, price, quantity)
values (50741, 22, 781929);
insert into MEDICINE (drugid, price, quantity)
values (87773, 26, 8663);
insert into MEDICINE (drugid, price, quantity)
values (37524, 98, 99695);
insert into MEDICINE (drugid, price, quantity)
values (49321, 87, 533523);
insert into MEDICINE (drugid, price, quantity)
values (38718, 47, 396560);
insert into MEDICINE (drugid, price, quantity)
values (71215, 12, 354016);
insert into MEDICINE (drugid, price, quantity)
values (64899, 49, 221076);
insert into MEDICINE (drugid, price, quantity)
values (10416, 94, 203180);
insert into MEDICINE (drugid, price, quantity)
values (49468, 80, 972906);
insert into MEDICINE (drugid, price, quantity)
values (47791, 73, 443619);
insert into MEDICINE (drugid, price, quantity)
values (89784, 16, 118245);
insert into MEDICINE (drugid, price, quantity)
values (26927, 31, 360921);
insert into MEDICINE (drugid, price, quantity)
values (26560, 42, 521720);
insert into MEDICINE (drugid, price, quantity)
values (20807, 47, 437749);
insert into MEDICINE (drugid, price, quantity)
values (31779, 18, 96047);
insert into MEDICINE (drugid, price, quantity)
values (56825, 35, 145339);
insert into MEDICINE (drugid, price, quantity)
values (69828, 61, 737353);
insert into MEDICINE (drugid, price, quantity)
values (37319, 12, 614348);
insert into MEDICINE (drugid, price, quantity)
values (26612, 83, 663464);
insert into MEDICINE (drugid, price, quantity)
values (72550, 14, 223738);
insert into MEDICINE (drugid, price, quantity)
values (12148, 2, 867199);
insert into MEDICINE (drugid, price, quantity)
values (80915, 68, 487244);
insert into MEDICINE (drugid, price, quantity)
values (78427, 1, 999249);
insert into MEDICINE (drugid, price, quantity)
values (72264, 24, 934275);
insert into MEDICINE (drugid, price, quantity)
values (81306, 94, 668054);
insert into MEDICINE (drugid, price, quantity)
values (79253, 46, 788642);
insert into MEDICINE (drugid, price, quantity)
values (57781, 51, 449792);
insert into MEDICINE (drugid, price, quantity)
values (23995, 24, 456435);
insert into MEDICINE (drugid, price, quantity)
values (53174, 12, 902519);
insert into MEDICINE (drugid, price, quantity)
values (47628, 54, 956482);
insert into MEDICINE (drugid, price, quantity)
values (61590, 73, 137338);
insert into MEDICINE (drugid, price, quantity)
values (13928, 10, 775448);
insert into MEDICINE (drugid, price, quantity)
values (82492, 50, 78555);
insert into MEDICINE (drugid, price, quantity)
values (89791, 45, 17316);
insert into MEDICINE (drugid, price, quantity)
values (51274, 43, 6674);
insert into MEDICINE (drugid, price, quantity)
values (10074, 46, 456274);
insert into MEDICINE (drugid, price, quantity)
values (17448, 25, 385348);
insert into MEDICINE (drugid, price, quantity)
values (77295, 64, 5315);
insert into MEDICINE (drugid, price, quantity)
values (25365, 84, 888425);
insert into MEDICINE (drugid, price, quantity)
values (32594, 32, 492788);
insert into MEDICINE (drugid, price, quantity)
values (24364, 56, 28560);
insert into MEDICINE (drugid, price, quantity)
values (48596, 4, 308032);
insert into MEDICINE (drugid, price, quantity)
values (82811, 87, 407072);
insert into MEDICINE (drugid, price, quantity)
values (22002, 89, 747779);
insert into MEDICINE (drugid, price, quantity)
values (88687, 28, 418145);
commit;
prompt 500 records committed...
insert into MEDICINE (drugid, price, quantity)
values (69180, 83, 579548);
insert into MEDICINE (drugid, price, quantity)
values (73231, 64, 811828);
insert into MEDICINE (drugid, price, quantity)
values (76519, 45, 749400);
insert into MEDICINE (drugid, price, quantity)
values (58572, 48, 911815);
insert into MEDICINE (drugid, price, quantity)
values (73948, 18, 111627);
insert into MEDICINE (drugid, price, quantity)
values (70383, 31, 58480);
insert into MEDICINE (drugid, price, quantity)
values (69808, 59, 859685);
insert into MEDICINE (drugid, price, quantity)
values (77290, 28, 67295);
insert into MEDICINE (drugid, price, quantity)
values (73120, 68, 803509);
insert into MEDICINE (drugid, price, quantity)
values (45075, 1, 720347);
insert into MEDICINE (drugid, price, quantity)
values (80355, 1, 80761);
insert into MEDICINE (drugid, price, quantity)
values (70711, 59, 606503);
insert into MEDICINE (drugid, price, quantity)
values (82902, 56, 120945);
insert into MEDICINE (drugid, price, quantity)
values (13784, 39, 556445);
insert into MEDICINE (drugid, price, quantity)
values (43740, 95, 14388);
insert into MEDICINE (drugid, price, quantity)
values (16121, 79, 544752);
insert into MEDICINE (drugid, price, quantity)
values (42175, 3, 685136);
insert into MEDICINE (drugid, price, quantity)
values (39228, 3, 815026);
insert into MEDICINE (drugid, price, quantity)
values (19049, 84, 740430);
insert into MEDICINE (drugid, price, quantity)
values (18611, 28, 188134);
insert into MEDICINE (drugid, price, quantity)
values (76443, 39, 382160);
insert into MEDICINE (drugid, price, quantity)
values (39140, 74, 600575);
insert into MEDICINE (drugid, price, quantity)
values (80675, 60, 629908);
insert into MEDICINE (drugid, price, quantity)
values (41297, 40, 952179);
insert into MEDICINE (drugid, price, quantity)
values (50295, 57, 133548);
insert into MEDICINE (drugid, price, quantity)
values (19495, 47, 882420);
insert into MEDICINE (drugid, price, quantity)
values (66757, 3, 358244);
insert into MEDICINE (drugid, price, quantity)
values (35615, 46, 204936);
insert into MEDICINE (drugid, price, quantity)
values (89643, 36, 718608);
insert into MEDICINE (drugid, price, quantity)
values (88443, 51, 973061);
insert into MEDICINE (drugid, price, quantity)
values (75520, 84, 634329);
insert into MEDICINE (drugid, price, quantity)
values (37956, 53, 587590);
insert into MEDICINE (drugid, price, quantity)
values (14963, 55, 289130);
insert into MEDICINE (drugid, price, quantity)
values (27186, 96, 554357);
insert into MEDICINE (drugid, price, quantity)
values (60741, 46, 411028);
insert into MEDICINE (drugid, price, quantity)
values (58858, 36, 515744);
insert into MEDICINE (drugid, price, quantity)
values (46817, 55, 467112);
insert into MEDICINE (drugid, price, quantity)
values (54077, 83, 579688);
insert into MEDICINE (drugid, price, quantity)
values (17619, 70, 592765);
insert into MEDICINE (drugid, price, quantity)
values (11049, 68, 814489);
insert into MEDICINE (drugid, price, quantity)
values (44866, 45, 166104);
insert into MEDICINE (drugid, price, quantity)
values (38146, 15, 630212);
insert into MEDICINE (drugid, price, quantity)
values (30280, 80, 505794);
insert into MEDICINE (drugid, price, quantity)
values (22550, 58, 690391);
insert into MEDICINE (drugid, price, quantity)
values (81681, 41, 526816);
insert into MEDICINE (drugid, price, quantity)
values (38355, 1, 553357);
insert into MEDICINE (drugid, price, quantity)
values (32166, 50, 646802);
insert into MEDICINE (drugid, price, quantity)
values (61119, 87, 493513);
insert into MEDICINE (drugid, price, quantity)
values (52537, 83, 607611);
insert into MEDICINE (drugid, price, quantity)
values (24786, 49, 461662);
insert into MEDICINE (drugid, price, quantity)
values (30578, 15, 475444);
insert into MEDICINE (drugid, price, quantity)
values (56261, 49, 972602);
insert into MEDICINE (drugid, price, quantity)
values (42503, 89, 720504);
insert into MEDICINE (drugid, price, quantity)
values (18048, 59, 420092);
insert into MEDICINE (drugid, price, quantity)
values (46600, 2, 266459);
insert into MEDICINE (drugid, price, quantity)
values (45078, 47, 976569);
insert into MEDICINE (drugid, price, quantity)
values (72021, 15, 553290);
insert into MEDICINE (drugid, price, quantity)
values (63121, 100, 399959);
insert into MEDICINE (drugid, price, quantity)
values (81667, 24, 286976);
insert into MEDICINE (drugid, price, quantity)
values (48193, 94, 805377);
insert into MEDICINE (drugid, price, quantity)
values (22268, 53, 468437);
insert into MEDICINE (drugid, price, quantity)
values (33917, 14, 327563);
insert into MEDICINE (drugid, price, quantity)
values (42021, 20, 814639);
insert into MEDICINE (drugid, price, quantity)
values (41994, 28, 663476);
insert into MEDICINE (drugid, price, quantity)
values (81528, 70, 619354);
insert into MEDICINE (drugid, price, quantity)
values (84790, 73, 305692);
insert into MEDICINE (drugid, price, quantity)
values (52313, 16, 762184);
insert into MEDICINE (drugid, price, quantity)
values (13471, 29, 918891);
insert into MEDICINE (drugid, price, quantity)
values (73826, 70, 774675);
insert into MEDICINE (drugid, price, quantity)
values (25241, 98, 336096);
insert into MEDICINE (drugid, price, quantity)
values (89591, 45, 924079);
insert into MEDICINE (drugid, price, quantity)
values (23868, 100, 121109);
insert into MEDICINE (drugid, price, quantity)
values (51087, 54, 991168);
insert into MEDICINE (drugid, price, quantity)
values (74095, 8, 121057);
insert into MEDICINE (drugid, price, quantity)
values (48926, 64, 110862);
insert into MEDICINE (drugid, price, quantity)
values (67421, 69, 980878);
insert into MEDICINE (drugid, price, quantity)
values (70051, 79, 525907);
insert into MEDICINE (drugid, price, quantity)
values (29354, 61, 772195);
insert into MEDICINE (drugid, price, quantity)
values (11940, 41, 686806);
insert into MEDICINE (drugid, price, quantity)
values (11417, 91, 765036);
insert into MEDICINE (drugid, price, quantity)
values (55207, 60, 628328);
insert into MEDICINE (drugid, price, quantity)
values (70032, 95, 504616);
insert into MEDICINE (drugid, price, quantity)
values (29462, 98, 276511);
insert into MEDICINE (drugid, price, quantity)
values (83847, 79, 809522);
insert into MEDICINE (drugid, price, quantity)
values (28998, 63, 102783);
insert into MEDICINE (drugid, price, quantity)
values (26170, 99, 644549);
insert into MEDICINE (drugid, price, quantity)
values (29579, 44, 656091);
insert into MEDICINE (drugid, price, quantity)
values (74858, 96, 103657);
insert into MEDICINE (drugid, price, quantity)
values (50531, 77, 782241);
insert into MEDICINE (drugid, price, quantity)
values (53320, 62, 528568);
insert into MEDICINE (drugid, price, quantity)
values (82333, 40, 94534);
insert into MEDICINE (drugid, price, quantity)
values (78317, 65, 148853);
insert into MEDICINE (drugid, price, quantity)
values (24061, 77, 303735);
insert into MEDICINE (drugid, price, quantity)
values (67720, 68, 122557);
insert into MEDICINE (drugid, price, quantity)
values (72297, 53, 660900);
insert into MEDICINE (drugid, price, quantity)
values (19679, 10, 544851);
insert into MEDICINE (drugid, price, quantity)
values (38490, 1, 826200);
insert into MEDICINE (drugid, price, quantity)
values (38431, 58, 438514);
insert into MEDICINE (drugid, price, quantity)
values (10307, 13, 262948);
insert into MEDICINE (drugid, price, quantity)
values (36444, 2, 6632);
commit;
prompt 600 records committed...
insert into MEDICINE (drugid, price, quantity)
values (79126, 2, 581310);
insert into MEDICINE (drugid, price, quantity)
values (52677, 69, 77337);
insert into MEDICINE (drugid, price, quantity)
values (75573, 83, 432849);
insert into MEDICINE (drugid, price, quantity)
values (37436, 99, 765110);
insert into MEDICINE (drugid, price, quantity)
values (52962, 65, 397961);
insert into MEDICINE (drugid, price, quantity)
values (50626, 5, 475718);
insert into MEDICINE (drugid, price, quantity)
values (59426, 88, 125580);
insert into MEDICINE (drugid, price, quantity)
values (67166, 93, 554743);
insert into MEDICINE (drugid, price, quantity)
values (48726, 88, 590998);
insert into MEDICINE (drugid, price, quantity)
values (25894, 24, 685247);
insert into MEDICINE (drugid, price, quantity)
values (61979, 75, 45653);
insert into MEDICINE (drugid, price, quantity)
values (81521, 96, 641182);
insert into MEDICINE (drugid, price, quantity)
values (52929, 64, 854829);
insert into MEDICINE (drugid, price, quantity)
values (67982, 35, 761881);
insert into MEDICINE (drugid, price, quantity)
values (72899, 1, 267775);
insert into MEDICINE (drugid, price, quantity)
values (81027, 54, 592084);
insert into MEDICINE (drugid, price, quantity)
values (43203, 19, 52556);
insert into MEDICINE (drugid, price, quantity)
values (42931, 29, 93890);
insert into MEDICINE (drugid, price, quantity)
values (87591, 62, 167087);
insert into MEDICINE (drugid, price, quantity)
values (47948, 32, 744214);
insert into MEDICINE (drugid, price, quantity)
values (40130, 93, 41225);
insert into MEDICINE (drugid, price, quantity)
values (88423, 10, 246397);
insert into MEDICINE (drugid, price, quantity)
values (30013, 20, 924598);
insert into MEDICINE (drugid, price, quantity)
values (33457, 43, 569960);
insert into MEDICINE (drugid, price, quantity)
values (38859, 69, 923844);
insert into MEDICINE (drugid, price, quantity)
values (79587, 86, 150645);
insert into MEDICINE (drugid, price, quantity)
values (53389, 88, 123430);
insert into MEDICINE (drugid, price, quantity)
values (41137, 97, 396389);
insert into MEDICINE (drugid, price, quantity)
values (81721, 85, 368773);
insert into MEDICINE (drugid, price, quantity)
values (81756, 25, 716127);
insert into MEDICINE (drugid, price, quantity)
values (50047, 69, 201530);
insert into MEDICINE (drugid, price, quantity)
values (13059, 2, 179968);
insert into MEDICINE (drugid, price, quantity)
values (33116, 78, 887142);
insert into MEDICINE (drugid, price, quantity)
values (66431, 21, 193672);
insert into MEDICINE (drugid, price, quantity)
values (21669, 85, 776425);
insert into MEDICINE (drugid, price, quantity)
values (84691, 31, 290070);
insert into MEDICINE (drugid, price, quantity)
values (77925, 62, 208874);
insert into MEDICINE (drugid, price, quantity)
values (66696, 86, 867658);
insert into MEDICINE (drugid, price, quantity)
values (21166, 9, 107688);
insert into MEDICINE (drugid, price, quantity)
values (14882, 47, 504395);
insert into MEDICINE (drugid, price, quantity)
values (24668, 24, 147990);
insert into MEDICINE (drugid, price, quantity)
values (48335, 82, 905429);
insert into MEDICINE (drugid, price, quantity)
values (77447, 10, 212727);
insert into MEDICINE (drugid, price, quantity)
values (77179, 50, 669436);
insert into MEDICINE (drugid, price, quantity)
values (74698, 88, 597784);
insert into MEDICINE (drugid, price, quantity)
values (72904, 71, 442074);
insert into MEDICINE (drugid, price, quantity)
values (54334, 73, 401509);
insert into MEDICINE (drugid, price, quantity)
values (38710, 79, 729102);
insert into MEDICINE (drugid, price, quantity)
values (58643, 5, 546508);
insert into MEDICINE (drugid, price, quantity)
values (69004, 14, 228688);
insert into MEDICINE (drugid, price, quantity)
values (54862, 33, 245861);
insert into MEDICINE (drugid, price, quantity)
values (72915, 98, 74628);
insert into MEDICINE (drugid, price, quantity)
values (81377, 30, 254194);
insert into MEDICINE (drugid, price, quantity)
values (68011, 80, 422219);
insert into MEDICINE (drugid, price, quantity)
values (82221, 62, 248965);
insert into MEDICINE (drugid, price, quantity)
values (32336, 31, 418916);
insert into MEDICINE (drugid, price, quantity)
values (16750, 31, 981228);
insert into MEDICINE (drugid, price, quantity)
values (20504, 23, 345056);
insert into MEDICINE (drugid, price, quantity)
values (88588, 83, 730673);
insert into MEDICINE (drugid, price, quantity)
values (87746, 38, 648388);
insert into MEDICINE (drugid, price, quantity)
values (33338, 23, 909308);
insert into MEDICINE (drugid, price, quantity)
values (89655, 55, 292461);
insert into MEDICINE (drugid, price, quantity)
values (43104, 96, 694264);
insert into MEDICINE (drugid, price, quantity)
values (79850, 43, 355526);
insert into MEDICINE (drugid, price, quantity)
values (32449, 16, 145417);
insert into MEDICINE (drugid, price, quantity)
values (17803, 12, 715983);
insert into MEDICINE (drugid, price, quantity)
values (70236, 52, 690280);
insert into MEDICINE (drugid, price, quantity)
values (69824, 62, 5193);
insert into MEDICINE (drugid, price, quantity)
values (59656, 44, 949418);
insert into MEDICINE (drugid, price, quantity)
values (22509, 89, 360962);
insert into MEDICINE (drugid, price, quantity)
values (89781, 12, 943049);
insert into MEDICINE (drugid, price, quantity)
values (34916, 72, 937867);
insert into MEDICINE (drugid, price, quantity)
values (11092, 80, 575914);
insert into MEDICINE (drugid, price, quantity)
values (18289, 6, 186280);
insert into MEDICINE (drugid, price, quantity)
values (89762, 53, 255529);
insert into MEDICINE (drugid, price, quantity)
values (35393, 46, 662909);
insert into MEDICINE (drugid, price, quantity)
values (15757, 91, 370987);
insert into MEDICINE (drugid, price, quantity)
values (60315, 13, 144439);
insert into MEDICINE (drugid, price, quantity)
values (23467, 35, 458106);
insert into MEDICINE (drugid, price, quantity)
values (39054, 30, 145011);
insert into MEDICINE (drugid, price, quantity)
values (15092, 56, 14449);
insert into MEDICINE (drugid, price, quantity)
values (46312, 55, 150138);
insert into MEDICINE (drugid, price, quantity)
values (21873, 33, 416947);
insert into MEDICINE (drugid, price, quantity)
values (49573, 30, 36918);
insert into MEDICINE (drugid, price, quantity)
values (41076, 68, 48222);
insert into MEDICINE (drugid, price, quantity)
values (12912, 63, 815434);
insert into MEDICINE (drugid, price, quantity)
values (32713, 89, 867566);
insert into MEDICINE (drugid, price, quantity)
values (84924, 55, 61566);
insert into MEDICINE (drugid, price, quantity)
values (74073, 1, 81478);
insert into MEDICINE (drugid, price, quantity)
values (62710, 20, 779641);
insert into MEDICINE (drugid, price, quantity)
values (17434, 49, 589193);
insert into MEDICINE (drugid, price, quantity)
values (52131, 22, 996769);
insert into MEDICINE (drugid, price, quantity)
values (61712, 79, 313158);
insert into MEDICINE (drugid, price, quantity)
values (18270, 35, 712075);
insert into MEDICINE (drugid, price, quantity)
values (17299, 78, 685605);
insert into MEDICINE (drugid, price, quantity)
values (64600, 13, 965556);
insert into MEDICINE (drugid, price, quantity)
values (60023, 21, 262507);
insert into MEDICINE (drugid, price, quantity)
values (39342, 33, 315778);
insert into MEDICINE (drugid, price, quantity)
values (59874, 90, 988013);
insert into MEDICINE (drugid, price, quantity)
values (88273, 49, 985310);
commit;
prompt 700 records committed...
insert into MEDICINE (drugid, price, quantity)
values (19520, 12, 910344);
insert into MEDICINE (drugid, price, quantity)
values (57153, 10, 845652);
insert into MEDICINE (drugid, price, quantity)
values (62862, 28, 978814);
insert into MEDICINE (drugid, price, quantity)
values (27460, 93, 206921);
insert into MEDICINE (drugid, price, quantity)
values (78618, 52, 421967);
insert into MEDICINE (drugid, price, quantity)
values (26588, 65, 819692);
insert into MEDICINE (drugid, price, quantity)
values (64419, 25, 700336);
insert into MEDICINE (drugid, price, quantity)
values (37601, 93, 891357);
insert into MEDICINE (drugid, price, quantity)
values (86984, 77, 858846);
insert into MEDICINE (drugid, price, quantity)
values (26244, 87, 46087);
insert into MEDICINE (drugid, price, quantity)
values (15468, 54, 279879);
insert into MEDICINE (drugid, price, quantity)
values (58579, 97, 339313);
insert into MEDICINE (drugid, price, quantity)
values (18030, 84, 600063);
insert into MEDICINE (drugid, price, quantity)
values (15351, 43, 283007);
insert into MEDICINE (drugid, price, quantity)
values (68986, 58, 338725);
insert into MEDICINE (drugid, price, quantity)
values (12284, 2, 753511);
insert into MEDICINE (drugid, price, quantity)
values (65209, 11, 76066);
insert into MEDICINE (drugid, price, quantity)
values (31500, 52, 908451);
insert into MEDICINE (drugid, price, quantity)
values (13413, 58, 783312);
insert into MEDICINE (drugid, price, quantity)
values (39689, 97, 668877);
insert into MEDICINE (drugid, price, quantity)
values (55720, 45, 383685);
insert into MEDICINE (drugid, price, quantity)
values (58171, 87, 403081);
insert into MEDICINE (drugid, price, quantity)
values (41462, 83, 648808);
insert into MEDICINE (drugid, price, quantity)
values (64997, 62, 910146);
insert into MEDICINE (drugid, price, quantity)
values (76708, 79, 948139);
insert into MEDICINE (drugid, price, quantity)
values (46342, 66, 957934);
insert into MEDICINE (drugid, price, quantity)
values (64990, 87, 597910);
insert into MEDICINE (drugid, price, quantity)
values (44846, 8, 305192);
insert into MEDICINE (drugid, price, quantity)
values (85438, 2, 561347);
insert into MEDICINE (drugid, price, quantity)
values (26728, 47, 70872);
insert into MEDICINE (drugid, price, quantity)
values (39401, 22, 837076);
insert into MEDICINE (drugid, price, quantity)
values (40434, 8, 361139);
insert into MEDICINE (drugid, price, quantity)
values (71420, 40, 357612);
insert into MEDICINE (drugid, price, quantity)
values (85567, 96, 766520);
insert into MEDICINE (drugid, price, quantity)
values (19483, 34, 326291);
insert into MEDICINE (drugid, price, quantity)
values (33431, 58, 647278);
insert into MEDICINE (drugid, price, quantity)
values (31843, 59, 128967);
insert into MEDICINE (drugid, price, quantity)
values (23754, 69, 126076);
insert into MEDICINE (drugid, price, quantity)
values (87974, 81, 78936);
insert into MEDICINE (drugid, price, quantity)
values (50928, 89, 965785);
insert into MEDICINE (drugid, price, quantity)
values (24862, 7, 602099);
insert into MEDICINE (drugid, price, quantity)
values (72610, 66, 89392);
insert into MEDICINE (drugid, price, quantity)
values (61377, 44, 857160);
insert into MEDICINE (drugid, price, quantity)
values (48583, 66, 960907);
insert into MEDICINE (drugid, price, quantity)
values (78277, 44, 524828);
insert into MEDICINE (drugid, price, quantity)
values (13468, 10, 453315);
insert into MEDICINE (drugid, price, quantity)
values (74311, 38, 403383);
insert into MEDICINE (drugid, price, quantity)
values (88231, 31, 744766);
insert into MEDICINE (drugid, price, quantity)
values (24842, 26, 827796);
insert into MEDICINE (drugid, price, quantity)
values (87357, 12, 269455);
insert into MEDICINE (drugid, price, quantity)
values (43611, 21, 598569);
insert into MEDICINE (drugid, price, quantity)
values (86179, 59, 367867);
insert into MEDICINE (drugid, price, quantity)
values (75486, 86, 376966);
insert into MEDICINE (drugid, price, quantity)
values (60991, 15, 94496);
insert into MEDICINE (drugid, price, quantity)
values (33456, 27, 187860);
insert into MEDICINE (drugid, price, quantity)
values (28475, 40, 212481);
insert into MEDICINE (drugid, price, quantity)
values (81649, 39, 82570);
insert into MEDICINE (drugid, price, quantity)
values (35360, 31, 796160);
insert into MEDICINE (drugid, price, quantity)
values (42749, 99, 964247);
insert into MEDICINE (drugid, price, quantity)
values (49365, 93, 636984);
insert into MEDICINE (drugid, price, quantity)
values (43129, 6, 867962);
insert into MEDICINE (drugid, price, quantity)
values (76028, 84, 550839);
insert into MEDICINE (drugid, price, quantity)
values (29207, 90, 449311);
insert into MEDICINE (drugid, price, quantity)
values (76965, 68, 349168);
insert into MEDICINE (drugid, price, quantity)
values (61126, 74, 455892);
insert into MEDICINE (drugid, price, quantity)
values (19127, 16, 172426);
insert into MEDICINE (drugid, price, quantity)
values (68093, 46, 37630);
insert into MEDICINE (drugid, price, quantity)
values (65692, 98, 985239);
insert into MEDICINE (drugid, price, quantity)
values (84154, 9, 550117);
insert into MEDICINE (drugid, price, quantity)
values (60869, 4, 56895);
insert into MEDICINE (drugid, price, quantity)
values (11413, 83, 236374);
insert into MEDICINE (drugid, price, quantity)
values (57770, 45, 390911);
insert into MEDICINE (drugid, price, quantity)
values (86388, 55, 44864);
insert into MEDICINE (drugid, price, quantity)
values (22010, 98, 357173);
insert into MEDICINE (drugid, price, quantity)
values (63643, 99, 255742);
insert into MEDICINE (drugid, price, quantity)
values (29876, 18, 901320);
insert into MEDICINE (drugid, price, quantity)
values (36585, 9, 619579);
insert into MEDICINE (drugid, price, quantity)
values (52709, 100, 734292);
insert into MEDICINE (drugid, price, quantity)
values (66556, 89, 252805);
insert into MEDICINE (drugid, price, quantity)
values (75249, 14, 409904);
insert into MEDICINE (drugid, price, quantity)
values (73394, 95, 644508);
insert into MEDICINE (drugid, price, quantity)
values (59754, 45, 992215);
insert into MEDICINE (drugid, price, quantity)
values (78164, 95, 372340);
insert into MEDICINE (drugid, price, quantity)
values (85022, 36, 409977);
insert into MEDICINE (drugid, price, quantity)
values (86970, 33, 563815);
insert into MEDICINE (drugid, price, quantity)
values (44814, 68, 405050);
insert into MEDICINE (drugid, price, quantity)
values (28598, 80, 335512);
insert into MEDICINE (drugid, price, quantity)
values (48696, 74, 517736);
insert into MEDICINE (drugid, price, quantity)
values (53187, 4, 459361);
insert into MEDICINE (drugid, price, quantity)
values (34952, 29, 627265);
insert into MEDICINE (drugid, price, quantity)
values (89197, 78, 904538);
insert into MEDICINE (drugid, price, quantity)
values (65006, 81, 492339);
insert into MEDICINE (drugid, price, quantity)
values (86666, 70, 748281);
insert into MEDICINE (drugid, price, quantity)
values (66650, 64, 327535);
insert into MEDICINE (drugid, price, quantity)
values (51043, 28, 801445);
insert into MEDICINE (drugid, price, quantity)
values (54423, 84, 18685);
insert into MEDICINE (drugid, price, quantity)
values (78884, 86, 217461);
insert into MEDICINE (drugid, price, quantity)
values (64603, 91, 936856);
insert into MEDICINE (drugid, price, quantity)
values (29211, 18, 909062);
insert into MEDICINE (drugid, price, quantity)
values (64551, 96, 768508);
commit;
prompt 800 records committed...
insert into MEDICINE (drugid, price, quantity)
values (87619, 20, 848068);
insert into MEDICINE (drugid, price, quantity)
values (36532, 78, 151528);
insert into MEDICINE (drugid, price, quantity)
values (28960, 97, 832360);
insert into MEDICINE (drugid, price, quantity)
values (79663, 33, 505419);
insert into MEDICINE (drugid, price, quantity)
values (23958, 77, 133233);
insert into MEDICINE (drugid, price, quantity)
values (65257, 53, 81664);
insert into MEDICINE (drugid, price, quantity)
values (10134, 13, 148266);
insert into MEDICINE (drugid, price, quantity)
values (25628, 50, 249518);
insert into MEDICINE (drugid, price, quantity)
values (83151, 71, 842035);
insert into MEDICINE (drugid, price, quantity)
values (79287, 24, 185809);
insert into MEDICINE (drugid, price, quantity)
values (26016, 11, 922087);
insert into MEDICINE (drugid, price, quantity)
values (41480, 48, 767202);
insert into MEDICINE (drugid, price, quantity)
values (25522, 17, 432884);
insert into MEDICINE (drugid, price, quantity)
values (43178, 27, 382340);
insert into MEDICINE (drugid, price, quantity)
values (32882, 73, 318647);
insert into MEDICINE (drugid, price, quantity)
values (68870, 10, 901788);
insert into MEDICINE (drugid, price, quantity)
values (73734, 14, 569457);
insert into MEDICINE (drugid, price, quantity)
values (28905, 28, 978232);
insert into MEDICINE (drugid, price, quantity)
values (26509, 3, 386294);
insert into MEDICINE (drugid, price, quantity)
values (70672, 75, 510592);
insert into MEDICINE (drugid, price, quantity)
values (52605, 53, 442289);
insert into MEDICINE (drugid, price, quantity)
values (49498, 38, 305836);
insert into MEDICINE (drugid, price, quantity)
values (61891, 85, 341861);
insert into MEDICINE (drugid, price, quantity)
values (49968, 66, 24069);
insert into MEDICINE (drugid, price, quantity)
values (57776, 80, 849160);
insert into MEDICINE (drugid, price, quantity)
values (36198, 29, 208300);
insert into MEDICINE (drugid, price, quantity)
values (52398, 51, 934754);
insert into MEDICINE (drugid, price, quantity)
values (20679, 8, 892652);
insert into MEDICINE (drugid, price, quantity)
values (39438, 71, 237386);
insert into MEDICINE (drugid, price, quantity)
values (40373, 48, 764232);
insert into MEDICINE (drugid, price, quantity)
values (64650, 62, 718239);
insert into MEDICINE (drugid, price, quantity)
values (21085, 22, 436907);
insert into MEDICINE (drugid, price, quantity)
values (27400, 22, 161163);
insert into MEDICINE (drugid, price, quantity)
values (41456, 79, 892254);
insert into MEDICINE (drugid, price, quantity)
values (85334, 82, 306107);
insert into MEDICINE (drugid, price, quantity)
values (41489, 75, 866644);
insert into MEDICINE (drugid, price, quantity)
values (23732, 59, 857064);
insert into MEDICINE (drugid, price, quantity)
values (42141, 89, 726066);
insert into MEDICINE (drugid, price, quantity)
values (16230, 73, 942799);
insert into MEDICINE (drugid, price, quantity)
values (77263, 26, 484586);
insert into MEDICINE (drugid, price, quantity)
values (49229, 10, 890824);
insert into MEDICINE (drugid, price, quantity)
values (32101, 60, 900638);
insert into MEDICINE (drugid, price, quantity)
values (33691, 77, 965133);
insert into MEDICINE (drugid, price, quantity)
values (58545, 83, 340240);
insert into MEDICINE (drugid, price, quantity)
values (49963, 3, 78553);
insert into MEDICINE (drugid, price, quantity)
values (61473, 2, 140162);
insert into MEDICINE (drugid, price, quantity)
values (28818, 47, 983767);
insert into MEDICINE (drugid, price, quantity)
values (67821, 75, 849589);
insert into MEDICINE (drugid, price, quantity)
values (30159, 75, 135471);
insert into MEDICINE (drugid, price, quantity)
values (45348, 91, 788387);
insert into MEDICINE (drugid, price, quantity)
values (76648, 13, 146221);
insert into MEDICINE (drugid, price, quantity)
values (77649, 16, 755319);
insert into MEDICINE (drugid, price, quantity)
values (60539, 79, 171958);
insert into MEDICINE (drugid, price, quantity)
values (46245, 68, 823590);
insert into MEDICINE (drugid, price, quantity)
values (52769, 63, 179545);
insert into MEDICINE (drugid, price, quantity)
values (48150, 72, 73550);
insert into MEDICINE (drugid, price, quantity)
values (75856, 61, 937399);
insert into MEDICINE (drugid, price, quantity)
values (20976, 42, 257073);
insert into MEDICINE (drugid, price, quantity)
values (28868, 84, 825682);
insert into MEDICINE (drugid, price, quantity)
values (54633, 92, 717448);
insert into MEDICINE (drugid, price, quantity)
values (77153, 18, 752334);
insert into MEDICINE (drugid, price, quantity)
values (63519, 48, 62450);
insert into MEDICINE (drugid, price, quantity)
values (64213, 92, 526689);
insert into MEDICINE (drugid, price, quantity)
values (48002, 81, 896265);
insert into MEDICINE (drugid, price, quantity)
values (48385, 51, 11615);
insert into MEDICINE (drugid, price, quantity)
values (83553, 94, 600611);
insert into MEDICINE (drugid, price, quantity)
values (50446, 55, 223730);
insert into MEDICINE (drugid, price, quantity)
values (75367, 100, 234543);
insert into MEDICINE (drugid, price, quantity)
values (89938, 78, 438939);
insert into MEDICINE (drugid, price, quantity)
values (71356, 74, 584286);
insert into MEDICINE (drugid, price, quantity)
values (52758, 32, 599808);
insert into MEDICINE (drugid, price, quantity)
values (22134, 34, 301712);
insert into MEDICINE (drugid, price, quantity)
values (15459, 72, 724602);
insert into MEDICINE (drugid, price, quantity)
values (37911, 27, 485092);
insert into MEDICINE (drugid, price, quantity)
values (57704, 1, 897697);
insert into MEDICINE (drugid, price, quantity)
values (64187, 100, 41110);
insert into MEDICINE (drugid, price, quantity)
values (28476, 43, 590021);
insert into MEDICINE (drugid, price, quantity)
values (45711, 53, 285300);
insert into MEDICINE (drugid, price, quantity)
values (18915, 51, 828698);
insert into MEDICINE (drugid, price, quantity)
values (36374, 81, 551531);
insert into MEDICINE (drugid, price, quantity)
values (20012, 7, 919622);
insert into MEDICINE (drugid, price, quantity)
values (26514, 14, 652456);
insert into MEDICINE (drugid, price, quantity)
values (71948, 34, 337833);
insert into MEDICINE (drugid, price, quantity)
values (23600, 99, 924452);
insert into MEDICINE (drugid, price, quantity)
values (88473, 90, 850753);
insert into MEDICINE (drugid, price, quantity)
values (62310, 17, 864980);
insert into MEDICINE (drugid, price, quantity)
values (89515, 86, 241116);
insert into MEDICINE (drugid, price, quantity)
values (20728, 76, 90034);
insert into MEDICINE (drugid, price, quantity)
values (23052, 58, 962217);
insert into MEDICINE (drugid, price, quantity)
values (65733, 46, 66867);
insert into MEDICINE (drugid, price, quantity)
values (88375, 82, 515);
insert into MEDICINE (drugid, price, quantity)
values (47565, 30, 875055);
insert into MEDICINE (drugid, price, quantity)
values (71903, 69, 952066);
commit;
prompt 893 records loaded
prompt Loading SELLBY...
prompt Table is empty
prompt Loading SUPPLIE...
prompt Table is empty
prompt Loading TTO...
prompt Table is empty
prompt Enabling foreign key constraints for BILL...
alter table BILL enable constraint SYS_C007030;
alter table BILL enable constraint SYS_C007031;
prompt Enabling foreign key constraints for EMPLOYEE...
alter table EMPLOYEE enable constraint SYS_C007053;
prompt Enabling foreign key constraints for GIVES_ORDER...
alter table GIVES_ORDER enable constraint SYS_C007035;
alter table GIVES_ORDER enable constraint SYS_C007036;
prompt Enabling foreign key constraints for SELLBY...
alter table SELLBY enable constraint SYS_C007041;
alter table SELLBY enable constraint SYS_C007042;
prompt Enabling foreign key constraints for SUPPLIE...
alter table SUPPLIE enable constraint SYS_C007046;
alter table SUPPLIE enable constraint SYS_C007047;
prompt Enabling foreign key constraints for TTO...
alter table TTO enable constraint SYS_C007057;
alter table TTO enable constraint SYS_C007058;
prompt Enabling triggers for PATIENT...
alter table PATIENT enable all triggers;
prompt Enabling triggers for PHARMACY...
alter table PHARMACY enable all triggers;
prompt Enabling triggers for BILL...
alter table BILL enable all triggers;
prompt Enabling triggers for EMPLOYEE...
alter table EMPLOYEE enable all triggers;
prompt Enabling triggers for SUPPLIER...
alter table SUPPLIER enable all triggers;
prompt Enabling triggers for GIVES_ORDER...
alter table GIVES_ORDER enable all triggers;
prompt Enabling triggers for MEDICINE...
alter table MEDICINE enable all triggers;
prompt Enabling triggers for SELLBY...
alter table SELLBY enable all triggers;
prompt Enabling triggers for SUPPLIE...
alter table SUPPLIE enable all triggers;
prompt Enabling triggers for TTO...
alter table TTO enable all triggers;
set feedback on
set define on
prompt Done.
