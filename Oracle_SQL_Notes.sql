SYS AS SYSDBA --> SYS KULLANICISI SYSDBA ROLU ILE SISTEME GIRIS YAPAR. SIFRE GIRILIR.
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE; --> _ORACLE_SCRIPT DEGERINI TRUE YAPARAK SCRIPT CALISTIRMAMIZI SAGLAR.
CREATE USER HUSEYIN IDENTIFIED BY HUSEYIN; --> HUSEYIN ADINDA YENI BIR KULLANICI OLUSTURUR. SIFRESINI DE HUSEYIN YAPAR.
GRANT CONNECT, RESOURCE TO HUSEYIN; --> HUSEYIN KULLANICISININ BAGLANMA VE KAYNAK YETKISI VAR. YETKI VERILDI.
GRANT CREATE TABLE TO HUSEYIN; --> HUSEYIN KULLANICISINA TABLO OLUSTURABILME YETKISI VERILDI.
GRANT UNLIMITED TABLESPACE TO HUSEYIN; --> LIMITSIZ DOSYA SISTEMI KULLANIMI YETKISI VERILDI.
SHOW PARAMETER LOCAL_LISTENER; --> YEREL DINLEYICI(BAGLANTI DINLEYICISI) PARAMETRELERINI GOSTERIR.
DROP USER MEHMET CASCADE; --> MEHMET ISIMLI USER'I VE NE KADAR NESNESI VARSA SILER.
CREATE TABLE EMPLOYEES(
	EMPNO NUMBER(5),
	NAME VARCHAR2(15),
	HIREDATE DATE,
	SALARY NUMBER(7,2),
	CURRENCY VARCHAR2(3)
); --> ID'SI VE PRIMARY KEY'I DOGAL OLARAKTA INDEX YAPISI OLMAYAN BIR TABLO OLUSTURDUK.
DESC EMPLOYEES; --> TABLO YAPISINI VERIR. BU YAPI BIZE TABLO HAKKINDA ACIKLAYICI BIR BILGI VERIR.
SELECT * FROM EMPLOYEES; --> CALISANLAR TABLOSUNUN TUM KOLONLARINI OKUR VE YAZAR.
INSERT INTO EMPLOYEES VALUES(100, 'HUSEYIN AYDIN', TO_DATE('23/04/49', 'DD/MM/YY'), 5000, '₺'); --> EMPLOYEES TABLOSUNA 1 SATIRLIK VERI GIRDIK.
ROLLBACK; --> YAPILAN ISLEM COMMIT(KALICI) HALE GETIRILMEDEN ONCE GERI ALIR.
INSERT INTO EMPLOYEES(EMPNO, NAME, HIREDATE, SALARY, CURRENCY) VALUES(100, 'HUSEYIN AYDIN', TO_DATE('23/04/49', 'DD/MM/YY'), 5000, '₺'); --> EMPLOYEES TABLOSUNA 1 SATIRLIK VERI GIRDIK.
ED --> EDITOR DEMEKTIR. SON YAZILAN KOMUTU NOTPAD ILE ACAR DUZENLEMEMIZ ICIN. DAHA RAHAT DUZENLEME VE KONFOR SAGLAMASI ICINDIR.
R --> DUZENLENMIS OLAN KOMUTU CALISTIRIR.
/ --> DUZENLENMIS OLAN KOMUTU CALISTIRIR.
COMMIT; --> SULTAN ABDULHAMIT HAN'IN MUHRUDUR. VERIYI KALICI HALE GETIRIR. DIKKATLI OLUNMASI LAZIM ROLLBACK YAPILMASI GEREKEN DURUMDA COMMIT YAPILIRSA DEGISIKLIK GERI ALINAMAZ.

INSERT INTO EMPLOYEES(EMPNO, NAME, HIREDATE, SALARY, CURRENCY)
VALUES(&EMPNO, &NAME, &HIREDATE, &SALARY, &CURRENCY); --> KULLANICIDAN ETKILESINLI VE PARAMETRIK OLARAK VERI ALIP EMPLOYEES TABLOSUNA KAYIT ETTIK.

START C:\Users\Huseyin_Aydin\Desktop\emp_dept.sql --> ILGILI SQL BETIGINI CALISTIRIR.
@C:\Users\Huseyin_Aydin\Desktop\emp_dept.sql --> ILGILI SQL BETIGINI CALISTIRIR.

CREATE TABLE ILLER(
	ILKODU NUMBER(3),
	ILADI VARCHAR2(30)
);

INSERT INTO ILLER(ILKODU, ILADI) VALUES(6, 'ANKARA');
INSERT INTO ILLER(ILKODU, ILADI) VALUES(34, 'ISTANBUL');
COMMIT;

CL SCR; --> CLEAR SCREEN EKRANI TEMIZLE KOMUTU. BIRAZ SACMA SADECE CLEAR OLSA DAHA IYI OLURMUS SANKI. :D
DESC ILLER; --> ILLER TABLOSUNUN ACIKLAMASINI VERIR. TABLO YAPISINI.

SELECT USER FROM DUAL; --> HANGI KULLANICI ILE LOGININIZ ONUR VERIR.
SELECT TABLE_NAME FROM TABS; --> BU SEMA ICERISINDE KI TUM TABLOLARI GETIRIR.

SELECT * FROM EMP;
SELECT * FROM EMP WHERE SAL < 1000; --> MAASI 1000 DEGERINDEN KUCUK OLANLARI OKUR.
SELECT * FROM EMP WHERE SAL > 1000; --> MAASI 1000 DEGERINDEN BUYUK OLANLARI OKUR.
SELECT * FROM EMP WHERE NOT (COMM BETWEEN 300 AND 500); --> KOMISYONU 300 VE 500'UN ARASINDA OLMAYANLARI GETIREN SORGUDUR.
SELECT * FROM EMP WHERE JOB = 'SALESMAN' AND SAL = 1000; --> MESLEGI SATICI VE MAASI 1000 ₺ OLANLARI OKUR.
SELECT * FROM EMP WHERE DEPTNO IN(20, 30); --> DEPNO'SU 20 30 OLANLARI GETIRIR.
SELECT * FROM EMP WHERE DEPTNO NOT IN(20, 30); --> DEPNO'SU 20 30 OLMAYANLARI GETIRIR.
SELECT * FROM EMP WHERE COMM IS NULL; --> KOMISYON KOLONU NULL OLANLARI GETIRIR. NULL YOKLUK DEMEKTIR. BOSLUK KARAKTERI NULL DEMEK DEGILDIR. BOSLUK KARAKTERI DE ASLINDA VARDIR YANI VARLIKTIR. NULL ISE BOSLUK BILE OLMAMASI ANLAMINA GELMEKTEDIR. O KADAR YOKLUK YANI.
SELECT * FROM EMP WHERE COMM IS NOT NULL; --> NULL OLMAYANLARI GETRIR.
SELECT * FROM DEPT D WHERE EXISTS(SELECT * FROM EMP E WHERE E.DEPTNO = D.DEPTNO);
SELECT * FROM DEPT D WHERE NOT EXISTS(SELECT * FROM EMP E WHERE E.DEPTNO = D.DEPTNO);
SELECT * FROM EMP WHERE DEPTNO = 40; --> DEPTNO'SU 40 OLANLARI GETIRIR.
SELECT * FROM EMP WHERE ENAME LIKE 'J%'; --> ENAME KOLONU BAS HARFI J OLAN KAYDI GETIRIR.
SELECT * FROM EMP WHERE ENAME LIKE '%S'; --> ENAME KOLONU SON HARFI S OLAN KAYDI GETIRIR.
SELECT * FROM EMP WHERE ENAME LIKE '%S%'; --> ENAME KOLONU ICINDE S HARFI OLAN KAYDI GETIRIR.
SELECT * FROM EMP WHERE ENAME LIKE 'J%S'; --> ENAME KOLONU J ILE BASLAYIP S ILE BITEN KAYITLARI GETIRIR.
SELECT * FROM EMP WHERE ENAME LIKE '_S%'; --> ENAME KOLONU ILK HARFI NE OLURSA OLSUN ONEMLI DEGIL 2. KARAKTERI S OLANI GETIR.
SELECT * FROM EMP WHERE ENAME LIKE '%S_'; --> ENAME KOLONU SON HARFI NE OLURSA OLSUN ONEMLI DEGIL SONDAN 2. KARAKTERI S OLANI GETIR.
SELECT * FROM ALL_USERS; --> ALL_USERS TABLOSUNU YANI TUM KULLANICILAR TABLOSUNU OKUR. TUN KULLANICILAR EKRANA YAZILIR.
SET LINESIZE 200; --> BIR SATIRDA BULUNACAK KARAKTER YANI KOLON SAYISINI SET EDER YANI YARLAR. BOYLELIKLE DUZGUN BIR FORMATTA CIKTI ALINIR.
COL USERNAME FORMAT A30; --> USERNAME KOLONUNU A30(30 KARAKTER) SEKLINDE FORMATLAR.
COL USERNAME FOR A50; --> USERNAME KOLONUNU A50(50 KARAKTER) SEKLINDE FORMATLAR.
COL SAL FOR 999,999,999,999; --> MAAS KOLONUNU FORMATLAR.
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY'; --> TARIH FORMATINI GUN - AY - YIL SEKLINDE FORMATLAR.
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS'; --> TARIH FORMATINI GUN - AY - YIL 24SAAT - DAKIKA - SANIYE SEKLINDE FORMATLAR.
SELECT * FROM EMP ORDER BY DEPTNO; --> DEPTNO KOLONUNA GORE SIRALAMA YAPAR.
DESC EMP; --> EMP TABLOSUNUN ACIKLAMASINI VERIR. TABLO YAPISINI VERIR.
SELECT * FROM EMP ORDER BY 8; --> 8 NUMARALI KOLONA GORE SIRALAMA YAPAR. VARSAYILANI ASC'DIR.
SELECT * FROM EMP ORDER BY 8 ASC; --> ARTAN SIRADA. ABC... 123...
SELECT * FROM EMP ORDER BY 8 ASC; --> AZALAN SIRADA. Z...  987...
SELECT * FROM EMP ORDER BY DEPTNO DESC, EMPNO ASC; --> DEPTNO'A GORE AZALAN. EMPNO'A GORE ARTAN SIRALAMA YAPAR.
SELECT ABS(90), ABS(-90) FROM DUAL; --> ABS(ABSOLUTE(MUTLAK DEGER))(+90 GIRERSEN +90'I ALIRSIN. -90 GIRERSEN +90'I ALIRSIN. ARTIYA ARTI CIKTI VERIR. EKSIYE ARTI CIKTI VERIR).
SELECT ACOS(0.4) FROM DUAL; -->ACOS COS'UN TERSIDIR. ANORMAL GIBI(NORMAL'IN TERSI). 
SELECT CEIL(5.000001) FROM DUAL; --> YUKARI YUVARLAMA. 6 DEGERINE YUVARLAR.
SELECT FLOOR(0.4) FROM DUAL; --> ASAGI YUVARLAMA. 0 DEGERINE YUVARLAR.
SELECT MOD(35, 6) MOD FROM DUAL; --> GIRILEN IKI SAYIDAN BIRINCISININ IKINCISINE BOLUMUNDEN KALANI VERIR.
SELECT POWER(10, 2) FROM DUAL; --> POWER KUVVET DEMEKTIR. 1. PARAMETRE USSU 2. PARAMETREDIR.
SELECT EXP(20) FROM DUAL; --> E USSU N SAYISINI DONDURUR. E SAYISI PI GIBI SABIT BIR SAYIDIR. E USSU 20 = 485165195,409790277969106830541540558697
SELECT LN(3) FROM DUAL; --> DOGAL LOGARITMA FONKSIYONUDUR. N SAYISININ E TABANINDAKI LOGARITMASINI DONDURUR.
SELECT LOG(10, 1000), LOG(EXP(20)) FROM DUAL; --> M TABANINDA N'NIN LOGARITMASINI DONDURUR.
SELECT ROUND(6.4573, 2) FROM DUAL; --> ILK VERILEN SAYIYI 2. VERILEN SAYI KADAR YUVARLAR.
SELECT TRUNC(142.777, 2) FROM DUAL; --> TRUNC 2. PARAMETRE KADAR ONDALIKLI KISIMDAN ALIR. SONUC 142.77 OLUR.
SELECT SQRT(16), SQRT(3) FROM DUAL; --> KARE DEMEK. SQUARE. :D
SELECT BITAND(16, 14) FROM DUAL;
SELECT LOWER("KUCUK HARFE CEVIRIR") FROM DUAL; --> GIRILEN PARAMETREYI KUCUK HARFE CEVIRIR.
SELECT UPPER("buyuk harfe cevırır") FROM DUAL; --> GIRILEN PARAMETREYI BUYUK HARFE CEVIRIR.
SELECT INITCAP("hUSEYIN aYDIN") FROM DUAL; --> GIRILEN DEGERLERIN ILK HARFLERINI BUYUK HARF YAPAR.
SELECT LENGTH("HUSEYIN AYDIN BABA") FROM DUAL; --> GIRILEN DEGERIN UZUNLUGUNU VERIR.
SELECT SUBSTR("HUSEYIN AYDIN", 3, 4) FROM DUAL; --> 3'DEN BASLA 4 TANE AL. YAVRU STRING. STRING'IN ICINDEN PARCA ALIR.
SELECT SUBSTR("ORACLE SQL DERSLERI", -1, 5) FROM DUAL; --> SONDAN 1'DEN BASLA 5 KARAKTER CIKARTIP AL.
SELECT SUBSTR("SELAMLAR ", -1, LENGTH("SELAMLAR ") - 3) FROM DUAL; --> SELAMLAR IFADESINDEN SONDAN 1'DEN BASLA SELAMLAR 'UN UZUNLUGUNUN 3 EKSIGI KADAR CIKARIP AL.
SELECT INSTR("ORACLE DERSLERI NE KADAR DA TATLI DI MI?", 'R') FROM DUAL; --> R HARFININ INDEX'INI BULUR AMA ILK KARSILASTIGI R'NIN INDEX'INI BULUR.
SELECT INSTR("MERHABALAR", 'A', 1, 3) FROM DUAL; --> A' KARAKTERINI BULMAK ICIN 1 KARAKTERDEN ARAMAYA BASLA 3 KEZ GECTIGI YERDE BUL.
SELECT REPLACE("HUSO AYDIN", "HUSO", "HUSEYIN") FROM DUAL; --> VERILEN STRING'IN ICINDEN KARAKTER VEYA KARAKTERLERI BUL SON GIRILEN PARAMETRE ILE DEGISTIR.
SELECT TRANSLATE('ORACLE', 'ABCDEFGĞJKLMNOÖPRSŞTUÜVYZ', 'BCDEFGĞJKLMNOÖPRSŞTUÜVYZA') KRIPTO FROM DUAL; --> HER HARFI KENDINDEN SONRAKI HARF ILE DEGISTIRIR.
SELECT RPAD(JOB, 25, '*') FROM EMP WHERE DEPTNO = 10; --> DEPTNO'SU 10 OLAN KAYDIN JOB KOLONUNUN SONUNA * IFADESI EKLER. 25 KARAKTERE SINIRLAR.
SELECT LPAD(JOB, 25, '*') FROM EMP WHERE DEPTNO = 10; --> DEPTNO'SU 10 OLAN KAYDIN JOB KOLONUNUN BASINA * IFADESI EKLER. 25 KARAKTERE SINIRLAR.
SELECT RTRIM('SELAM    '), LTRIM('     SELAM') FROM DUAL; --> SOLDAN VE SAGDAN BOSLUKLARI KESER ATAR.
SELECT TRIM('      SELAM       ') FROM DUAL; --> HEM SAGDAN HEMDE SOLDAN BOSLUKLARI KESER ATAR.
SELECT LTRIM(RTRIM('       SELAM       ')) FROM DUAL; --> HEM SAGDAN HEMDE SOLDAN BOSLUKLARI KESER ATAR.
SELECT TRIM(0 FROM '0000000X7B') FROM DUAL; --> 0000000X7B IFADESINDEN SADECE 0 OLAN KARAKTERLERI SILER ATAR.
SELECT CONCAT(CONCAT(ENAME, 'IS A '), JOB) FROM EMP; --> CONCAT BIRLESTIRME FONSIYONUDUR. IKI DEGERI BIRLESTIRMIS.
SELECT ENAME || 'IS A' || JOB FROM EMP; --> SU KISININ ISI BUDUR GIBISINDEN CIKTI VERIR EMP TABLOSUNDAKI HER BIR KAYIT ICIN.
SELECT COALESCE(SAL + COMM, SAL, 1000) FROM EMP; --> 1. DEGER NULL DEGILSE 1. DEGERI, NULL'SA 2. DEGERI ODA NULL'DA 3. DEGERI ODA NULL'SA
SELECT DECODE(DEPTNO, 10, 'SALES', 20, 'ACCOUNTS', 30, 'PRODUCTIONS', 'UNKNOWN') BOLUM FROM EMP; --> DEPTNO 10'SA SALES'I 20'SE ACCOUNTS'U, 30'SA PRODUCTIONS'U HICBIRISI ISE UNKNOWN'U DONDERIR.
SELECT GREATEST('ZALIM','AHMET','CUMALI','SALIH','NECMET') FROM DUAL; --> PARAMETRE SINIRI YOKTUR. ALDIGI DEGERLERIN EN BUYUGUNU DONDERIR.
SELECT GREATEST(50, 10, 22, 35, 4, 99999) FROM DUAL; --> PARAMETRE SINIRI YOKTUR. ALDIGI DEGERLERIN EN BUYUGUNU DONDERIR.
SELECT LEAST('ZALIM','AHMET','CUMALI','SALIH','NECMET') FROM DUAL; --> PARAMETRE SINIRI YOKTUR. ALDIGI DEGERLERIN EN KUCUGUNU DONDERIR.
SELECT LEAST(50, 10, 22, 35, 4, 99999) FROM DUAL; --> PARAMETRE SINIRI YOKTUR. ALDIGI DEGERLERIN EN KUCUGUNU DONDERIR.
SELECT NVL(NULL, 'NULL DEGIL') FROM DUAL; --> ILK DEGER NULL GELIRSE IKINCIYI DONDURUR. ILK DEGER NULL DEGILSE ILKINI YANI KENDINI DONDURUR.
SELECT NVL2(NULL, 'NULL DEGIL', 'SELAM') FROM DUAL; --> ILK DEGER NULL GELIRSE IKINCIYI DONDURUR. ILK DEGER NULL DEGILSE ILKINI YANI KENDINI DONDURUR. IKINCI DEGER'DE NULL'DA 3. DONDURUR. ....
SELECT NULLIF(NULL, NULL) FROM DUAL; --> IKI DEGER ESIT ISE NULL DONDURUR. YOK EFENDIM ESIT DEGILSE ILK DEGERI DONDURUR.
UID --> CONNECT OLUNAN OTURUM(SESSION) NUMARASINI
USER --> CONNECT OLUNAN KULLANICIYI GOSTERIR.
SYS_CONTEXT --> SISTEM BAGLAMI. SISTEM HAKKINDA BILGILER VERIR.
USERENV --> ILE KULLANILAN PARAMTERLER SUNLARDIR: SESSION_USER, ISDBA, HOST, INSTANCE, IP_ADDRESS, DB_NAME.
SESSION_USER --> VERITABANINA BAGLANAN KULLANICIY VERIR.
ISDBA --> BAGLANAN KULLANICI DBA YETKISINE SAHIP MIDIR?
HOST --> MAKINA ADINI VERIR. HOST = SUNUCU = BILGISAYAR'IN KENDISI.
INSTANCE --> INSTANCE ISMI. MAKINADA CALISAN PROCESS VE MEMORY'DEN OLUSAN DOSYA SISTEMINDEKI VERILERI YONETEN YAPIDIR.
DB_NAME --> VERITABANI ADINI VERIR.
SELECT
SYS_CONTEXT('USERENV', 'SESSION_USER') USERNAME,
SYS_CONTEXT('USERENV', 'ISDBA') ISDBA,
SYS_CONTEXT('USERENV', 'HOST') HOST,
SYS_CONTEXT('USERENV', 'INSTANCE') INSTANCE,
SYS_CONTEXT('USERENV', 'IP_ADDRESS') IP_ADDRESS,
SYS_CONTEXT('USERENV', 'DB_NAME') DB_NAME
FROM DUAL; --> SISTEM HAKKINDA BILGI VERIR.
SELECT UNIQUE DEPTNO, DECODE(DEPTNO, 10, 'SATICI', 20, 'ALICI', 30, 'LIMONCU', 'BILINMIYOR') FROM EMP; --> UNIQUE DEPTNO'NUN BENZERSIZLERINI GETIRIR.
SELECT DISTINC DEPTNO, DECODE(DEPTNO, 10, 'SATICI', 20, 'ALICI', 30, 'LIMONCU', 'BILINMIYOR') FROM EMP; --> DISTINCT DEPTNO'NUN BENZERSIZLERINI GETIRIR.
SELECT DISTINCT DEPTNO, DECODE(DEPTNO, 10, 'SATICI', 20, 'ALICI', 30, 'LIMONCU', 'BILINMIYOR') FROM EMP ORDER BY DEPTNO;
SELECT UID, USER FROM DUAL; --> GIRIS YAPAN KULLANICININ KULLANICI ID'SINI VE KULLANICI ADINI VERIR.
ISTATISTIKSEL FONKSIYONLAR --> TEK BIR SATIR YERINE VERILERI BELIRLI SATIR GRUPLARI HALINDE ELE ALIRLAR.
SELECT AVG(SAL), SUM(SAL), MAX(SAL), MIN(SAL), STDDEV(SAL), VARIANCE(SAL), COUNT(*) FROM EMP; --> TUM TABLOYU TEK GRUP OLARAK ALGILAYIP MAAS ORTALAMASINI, MIN MAAS, MAX MAAS, TOPLAM MAAS VS. HESAPLAMALAR YAPAR. GROUP BY ILE KULLANILMALIDIR!
SYSDATE --> OTURUMUN TARIH VE ZAMANINI DONDURUR.
CURRENT_DATE --> OTURUMUN GREGORIAN TAKVIMINE GORE TARIH DILIMINDEKI GECERLI TARIHI DONDURUR.
SYSTIMESTAMP --> ZAMAN DAMGASI. VERITABANININ SYSTEM TARIHINI VE ZAMANINI DONDURUR.

--SYSDATE:
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD/MON/YYYY') FROM DUAL; --> OTURUMUN TARIHINI FORMATLAYIP VERIR.
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS'; --> OTURUMUN TARIH FORMATINI AYARLAR
SELECT TO_CHAR(CURRENT_DATE, 'DD-MM-YYYY HH24:MI:SS') FROM DUAL; --> VERITABANININ TARIHINI VE SAATINI EKRANA GETIRMIS OLDUK.
SELECT SESSIONTIMEZONE FROM DUAL; --> OTURUMUMUZUN ZAMAN BOLGESINI VERIR.
ALTER SESSION SET TIME_ZONE = '+3:0'; --> SESSIONUMUZU ALTER ETTIK. SESSIONUMUZUN UZERINDEN ZAMAN BOLGESINI SET ETTIK.

--SYSTIMESTAMP:
SELECT SYSTIMESTAMP FROM DUAL; --> SISTEMIN ZAMAN DAMGASINI ALDIK.
--TO_DATE FUNCTION
SELECT
TO_DATE('29/10/2023', 'DD/MM/YYYY') FORMATTED_DATE_1,
TO_DATE('29/EKI/2023', 'DD/MM/YYYY') FORMATTED_DATE_2,
TO_CHAR(TO_DATE('29/EKI/1923', 'DD/MM/YYYY'), 'DAY') DAY_,
ROUND(SYSDATE - TO_DATE('29/EKI/1923', 'DD/MM/YYYY'), 2) PASSED_DAY_VIRGULDEN_SONRA_2_KARAKTERI_VAR
FROM DUAL; --> TARIHI FORMATLAYARAK VERIR. TARIH HESAPLAMA.
--ADD_MONTHS FUNCTION
SELECT ADD_MONTHS(SYSDATE, 4), ADD_MONTHS(SYSDATE, -4), ADD_MONTHS(SYSDATE, -12) FROM DUAL; --> AY EKLE, AY CIKAR.
--MONTHS_BETWEEN FUNCTION
SELECT ROUND(MONTHS_BETWEEN(SYSDATE, TO_DATE('01/04/1453', 'DD/MM/YYYY')), 2) FROM DUAL; --> 01/04/1453 TARIHINDEN BU YANA KAC AY GECMIS ONU BULDUK.
--LAST_DAY FUNCTION
SELECT SYSDATE, LAST_DAY(SYSDATE) ICINDE_BULUNDUGUMUZ_AYIN_SON_GUNUNU_GOR,
LAST_DAY(TO_DATE('11/09/1994', 'DD/MM/YYYY')) DOGUM_TARIHIMIN_AYININ_SON_GUNUNU_VER_BAKALIM FROM DUAL; --> VERILEN TARIHIN AYININ SON GUNUNU VERIR.
--SORGUDA ILISKILAR JOINS
JOIN IKI VEYA DAHA FAZLA TABLO VIEW VEYA MATERIALIZED VIEW'I ARALARINDAKI KOLON ILISKILERINI BELIRTEREK SORGU YAPMAK ICIN KULLANILIR.
'SORGUDA ORTAK BIR SUTUN ADI VARSA ALIAS KULLANARA YA DA TABLO ISMI VERILEREK KULLANMAK GEREKIR.
--ESITLIK EQUIJOINS (ESITLIK ILKESI)
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO; --> IKI TABLODAKI DEPTNO KOLONLARININ DEGERLERININ BIRBIRLERIYLE ESIT OLANLARI GETIRIR.
--OUTER JOIN
--ESKI KULLANIMI:
--LEFT OUTER JOIN(SOLDAKI TABLODA KARSILIGI OLMAYANLARIDA GETIRIR)
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO(+) = DEPT.DEPTNO;
--RIGHT OUTER JOIN(SAGDAKI TABLODA KARSILIGI OLMAYANLARIDA GETIRIR)
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO(+);
--YENI KULLANIMI:
--LEFT OUTER JOIN
SELECT * FROM DEPT
LEFT OUTER JOIN EMP
ON DEPT.DEPTNO = EMP.DEPTNO; --> SOLDAKI TABLODA KARSILIGI OLMAYANLARIDA GETIRIR.
--RIGHT OUTER JOINS
SELECT * FROM DEPT
RIGHT OUTER JOIN EMP
ON DEPT.DEPTNO = EMP.DEPTNO;
--ALT(IC ICE(NESTED)) SORGULAR (SUBQUERIES)
--SORGU ICINDE SORGU KULLANABILIRIZ.
SELECT * FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP); --> ONCE ALT SORGU CALISIR. EMP TABLOSUNUN MAAS KOLONUNUN ORTALAMASINI BULUR ALT SORGU. SONRA UST SORGU ALT SORGUDAKI MAAS ORTALAMASININ USTUNDE OLAN CALISANLARI SORGULAR VE GETIRIR.
SELECT * FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP) OR SAL = (SELECT MIN(SAL) FROM EMP); --EN YUKSEK VE EN DUSUK MAAS ALANLARI LISTELER.
--GROUP BY
--BAZI SUTUN DEGERLERINI KULLANARAK SORGU SONUCLARINI GRUPLAYABILIRIZ.
SELECT
DEPTNO GRUBUN_NUMARASI, ROUND(AVG(SAL), 2) GRUBUN_ORTALAMA_MAAS, MAX(SAL) GRUBUN_MAX_MAAS, MIN(SAL) GRUBUN_MIN_MAAS, COUNT(*) GRUBUN_SATIR_SAYISI
FROM EMP
GROUP BY DEPTNO; --> CALISANLAR TABLOSUNDAKI FARKLI DEPARTMANLARDA CALISANLARIN KAYITLARINI AYRI AYRI GRUPLA HER BIR GRUBUN SELECT KISINDA ORTALAMASINI, MIN, MAX, TOPLAM KAC KAYDI VARSA HEPSINI HESAPLA BAS EKRANA YALLAH. :DEGERINI
--HAVING BELIRLI BIR GRUNU ELEMEMIZI SAGLAR. ORNEGIN BIR TANE SATIR GRUBU 3 SATIRDAN OLUSSUN. BIZ ONU ELEYELIM HESABA KATMAYALIM.
SELECT
DEPTNO GRUBUN_NUMARASI, ROUND(AVG(SAL), 2) GRUBUN_ORTALAMA_MAAS, MAX(SAL) GRUBUN_MAX_MAAS, MIN(SAL) GRUBUN_MIN_MAAS, COUNT(*) GRUBUN_SATIR_SAYISI
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) > 3; --> HER BIR GRUBUN HESAPLANMAYA DAHIL EDILEBILMESI ICIN 3 SATIRDAN FAZLA OLMASI SARTTIR. 3 SATIRDAN FAZLA OLMAYANLARI HESABA KATMA ONUN ICIN UGRASMA DEDIK.
--SUBQUERY 
SELECT * FROM EMP WHERE SAL < (SELECT AVG(SAL) FROM EMP); --> ALT SORGU ORTALAMA MAAS'I BULUR. UST SORGU ISE ALT SORGUDAN GELEN ORTALAMA MAASIN ALTINDA OLANLARI GETIRIR.
SELECT * FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP); --> ALT SORGU EN YUKSEK MAAS'I BULUR. UST SORGU ISE ALT SORGUDAN GELEN EN YUKSEK MAAS'A ESIT OLANLARI GETIRIR.
SELECT * FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP) OR SAL = (SELECT MIN(SAL) FROM EMP);
SELECT
X.DEPTNO, X.EMPNO, X.ENAME, Y.DNAME
FROM DEPT Y, (SELECT EMPNO, ENAME, DEPTNO FROM EMP) X
WHERE X.DEPTNO = Y.DEPTNO; --> FROM KISMINDA SELECT SORGUSU ATTIK. O SURGUNUN SONUCU ASLINDA TABLODUR. FROM O SORGUYA DIREKT OLARAK TABLO MUAMELESI YAPAR.
--GROUP BY
SELECT
DEPTNO,
ROUND(AVG(SAL), 2) HER_BIR_GRUBUN_ORTALAMASI,
MAX(SAL) HER_BIR_GRUBUN_EN_YUKSEK_MAAS_ALAN_ZENGIN_ADAMI,
MIN(SAL) HER_BIR_GRUBUN_EN_DUSUK_MAAS_ALAN_FAKIR_ADAMI
FROM EMP
GROUP BY DEPTNO; --> DEPRATMANLARA GORE AYRI AYRI GRUPLA SONRA HER BIR GRUBUN HESAPLAMALARINI SELECT KISMINDA TEK TEK YAP. ORTALAMA MAAS, MAX MAAS, MIN MAAS BUL.

--ILLERE GORE GRUPLA. O IL'E AIT KAC EDET ILCE VAR HESAPLA.
SELECT IL_NO, COUNT(*) FROM ILCELER
GROUP BY IL_NO;

SELECT
A.IL_NO, B.ISIM, COUNT(*)
FROM ILCELER A, ILLER B
WHERE A.IL_NO = B.IL_NO
GROUP BY A.IL_NO, B.ISIM
HAVING COUNT(*) > 10 --> HAVING MUAFIYET GIBI DUSUNULEBILIR. SATIR SAYISININ TOPLAMI 10'DAN BUYUK OLAN GRUPLARI ELE, YANI MUAF TUT DEMEK OLUYOR. 
ORDER BY 3 DESC, 2, 1; --> IL_NO'SU VE IL_ADI'NA GORE GRUPLA. ORNEGIN 36 - ISTANBUL OLANLARI TEK GUP YAP. 51 NIGDE OLANLARI TEK GRUP YAP. HER BIR GRUP ICIN AYRI AYRI MUAMELE ET.
--DATA MANIPULATION LANGUAGE(DML)
--VERI ISLEME(MANIPULASYON) DEYIMLERI, VAROLAN SEMA NESNELERINDE VERILERI SORGULAR VE ISLER.
--DM ISLEMLERI COMMIT GEREKTIRIR.
--SELECT MEVCUT KAYITLARI LISTELEMEK ICIN KULLANILIR.
--INSERT YENI KAYITLAR GIRMEMIZ ICIN KULLANILIR.
--DELETE MEVCUT KAYITLARI SILMEMIZ ICIN KULLANILIR.
--UPDATE MEVCUT KAYITLARI GUNCELLEMEMIZ / DEGISTIRMEMIZ ICIN KULLANILIR.

--SELECT(HIERARCHICAL QUERIES{HIERARSIK SORGULAR [BABA -> OGUL 1 VE OGUL 2 --> OGUL 1'IN OGLU VE OGUL 2'NIN OGLU GIBISINDEN :D]})
UPDATE EMP SET ENAME = 'ALLAH' WHERE ENAME = 'KING'; --> NE KRAL TANIRIM NE KURAL EN BUYUK ALLAH'TIR.

SELECT
EMPNO NUMARASI, ENAME ISIM, MGR YONETICI_NO, LEVEL SEVIYESI, SYS_CONNECT_BY_PATH(ENAME , '\') ADAMIN_HIERARSIK_SEYSI_YANI_HIYERARSIK_DUZENININ_YOL_HALINDE_GOSTERILMESI
FROM EMP
START WITH MGR IS NULL --> MGR ALANI NULL OLANI EN BUYUK KISI OLARAK BAZ AL.
CONNECT BY PRIOR EMPNO = MGR; --> HIERARSIDE ARALARINDAKI BAG KURULABILMESI ICIN MGR'I EN UST YAPTIK. MGR NULL VE ONUN ALTINDAKILER SAYI ILE IFADE EDILMIS. SAYILARINA GORE BIR BAG OLUYOR KIM UST KIM ALT ORADAN BELLI OLUYOR.

--INSERT
INSERT --> KAYIT GIR KOMUTU
INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) --> KAYIT GIRCEN DE NEREYE GIRCEN? INTO EMP --> EMP TABLOSUNA GIRCEN. INTO(HA BURAYA GIR). KOLONLAR GIRILIR. HANGI KOLONLARA VERI GIRISI YAPILACAK ONU BELIRT.
VALUES(102, 'HUSEYIN AYDIN','HARD CORE PSYCO PROGRAMMER', TO_DATE('11/09/1994', 'DD-MM-YYYY HH24:MI:SS'), 9999, 300, 10); --> GIRILECEK DEGERLER KOLON SIRASINA GORE VERILIR.

COMMIT; --> VERIYI KALICI HALE GETIRIR. ARTIK ROLLBACK YAPILAMAZ. TRANSACTION CONTROL LANGUAGE(TCL).

INSERT
INTO EMP2
SELECT * FROM EMP MINUS SELECT * FROM EMP2; --> IKI FARKLI SORGU VAR. IKI SORGUNUN FARKLI OLAN KAYITLARINI AL BIR GUZEL EMP2 TABLOSUNA KAYDET.

--UPDATE
UPDATE EMP SET SAL = SAL * 1.1 WHERE UPPER(ENAME) <> 'ALLAH'; --> ALLAH HARIC HERKESIN MAASINA %10 ZAM YAPTIK.
SELECT * FROM EMP WHERE DEPTNO IS NULL; --> DEPTNO'SU NULL OLANLARI GETIR.
UPDATE EMP SET DEPTNO = NULL WHERE EMPNO IN(7654, 7521); --> EMPNO'SU 7654 VE 7521 OLAN ARKADAŞLARIN DEPNO'SUNU NULL'A ESITLE.

--DEPTNO'SU NULL OLANLARI BULACAK. O NULL OLANLARIN AMIRINI ALT SORGUDA BULACAK. O AMIRIN DEPTNO'SUNU CALISANIN DEPTNO'SUNA ATAYACAK.
UPDATE EMP A
SET DEPTNO = (SELECT DEPTNO FROM EMP2 B WHERE A.MGR = B.EMPNO)
WHERE A.DEPTNO IS NULL;

--DELETE
DELETE FROM EMP WHERE COMM IS NULL; --> KOMISYON(COMM) KOLONU NULL OLANLARI SILER ATAR.
DELETE FROM EMP WHERE NVL(COMM, 0) = 0; --> KOMISYON(COMM) KOLONU NULL OLANLARI SILER ATAR.
COMMIT; --> KALICI HALE GETIRIR. DB'E ISLER.
DELETE FROM DEPT; --> SILINEMEZ. KISIT VAR. FK_CONSTRAINT VAR.
DELETE FROM EMP; --> USTTEKINI SILEBILMEK ICIN BU TABLOYU ONCE SILMEK ARDINDANDA BU TABLOYU SILMEK GEREKIR. CUNKU PARENT CHILD ILISKISI VAR. YANI ANAC YAVRU.

DDL(Data Definition Language{Veri Tanımlama Dili}):
--CREATE NESNE OLUSTURMAK ICIN KULLANILIR.
--ALTER NESNE DEGISTIRMEK ICIN KULLANILIR.
--DROP NESNE SILMEK ICIN KULLANILIR.
--REPLACE TABLO ISMINI DEGISTIRMEK ICIN KULLANILIR.
--TRUNCATE COMMIT GEREKTIRMEKDEN TABLODAKI TUM KAYITLARI SILMEK ICIN KULLANILIR.
--TRUNCATE ILE DELETE'NIN FARKI SUDUR; DELETE ILE SILINDIGI ZAMAN YENI KAYIT GIRERSEK OTOMATIK ARTAN KOLON ORNEGIN 100'DE KALDIYSA 101'DEN DEVAM EDER. INDEX'LER SIFIRLANMAZ. COMMIT'LEMEDEN ROLLBACK YAPARSAK VERI GERI GELIR. TRUNCATE BOYLE DEGILDIR. ROLLBACK ISLEMEZ OTOMATIK COMMIT'LENMIS OLUR.
--CREATE:
CREATE TABLE TAX(
	EMPNO NUMBER(3),
	TAXDATE DATE,
	TAXRATE NUMBER(4,2), --> ONDALIKLI SAYIDIR. TAM SAYI TARAFI YANI VIRGULDEN ONCESI 2 SONRASI 2'DIR. 4 YAZILMASI TOPLAMINI BELIRTMEKTEDIR.
	TAX NUMBER(15,2) --> TAM SAYI KISMI 13 ONDALIK KISMI 2'DIR.
);
SELECT EMPNO, SYSDATE, SIGN(3000 - SAL) FROM EMP; --> SIGN FONKISYONU ICINE GIRILEN DEGER NEGATIF DEGERSE -1 POZITIFSE +1 DONDERIR.

INSERT INTO TAX(EMPNO, TAXDATE, TAXRATE, TAX)
SELECT EMPNO, SYSDATE,
DECODE(SIGN(3000 - SAL), 1, 0.05, 0.07),
DECODE(SIGN(3000 - SAL), 1, SAL * 0.05, SAL * 0.07)
FROM EMP; --> DECODE FONSIYONU 1'SE 0.05 DONDURUR DEGILSE 0.07'I DONDURUR.

DROP TABLE TAX;

CREATE TABLE TAX AS --> TABLOYU SELECT SORGUSUNDAN GELEN KOLONLARI VE VERILERI ILE BIRLIKTE OLUSTURUR. TABLO KOPYALAMA ISLEMI GIBI DUSUNULEBILIR.
SELECT EMPNO, SYSDATE, TAXDATE,
SELECT EMPNO, SYSDATE,
DECODE(SIGN(3000 - SAL), 1, 0.05, 0.07),
DECODE(SIGN(3000 - SAL), 1, SAL * 0.05, SAL * 0.07)
FROM EMP;










































_