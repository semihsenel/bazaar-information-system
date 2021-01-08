CREATE TABLE Tezgahlar  (
    tezgah_no INT NOT NULL,
    alan INT NOT NULL CHECK ( alan > 0 ),
    kira INT NOT NULL CHECK ( kira >= 0 ),
    max_stok INT NOT NULL CHECK ( max_stok > 0 ),
    PRIMARY KEY (tezgah_no)
);

CREATE TABLE Calisanlar(
    c_id INT NOT NULL,
    tc CHAR(11) NOT NULL,
	isim VARCHAR(20),
	soyisim VARCHAR(20),
    tel_no CHAR(10),
    cinsiyet CHAR,
    dogum_tarihi DATE NOT NULL ,
    calistigi_tezgah INT ,
	sahibi_oldugu_tezgah INT,
    PRIMARY KEY (c_id),
    FOREIGN KEY (calistigi_tezgah) REFERENCES Tezgahlar(tezgah_no) ON DELETE SET NULL ON UPDATE CASCADE ,
	FOREIGN KEY (sahibi_oldugu_tezgah) REFERENCES Tezgahlar(tezgah_no) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Urunler(
    urun_id INT NOT NULL ,
    satildigi_tezgah INT NOT NULL,
    urun_turu TEXT,
    urun_adi TEXT NOT NULL,
    birim_fiyat FLOAT NOT NULL CHECK ( birim_fiyat >= 0 ),
    stok INT NOT NULL CHECK ( stok >= 0 ),
    PRIMARY KEY (urun_id),
    FOREIGN KEY (satildigi_tezgah) REFERENCES Tezgahlar(tezgah_no) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE SatisKaydi(
	satis_id INT NOT NULL,
    urun_id INT NOT NULL ,
    tezgah_no INT NOT NULL ,
    miktar INT NOT NULL,
    birim_fiyat FLOAT NOT NULL ,
    tarih DATE NOT NULL ,
    satici INT NOT NULL ,
    toplam_tutar FLOAT NOT NULL ,
    FOREIGN KEY (urun_id) REFERENCES Urunler(urun_id),
    FOREIGN KEY (tezgah_no) REFERENCES Tezgahlar(tezgah_no),
    PRIMARY KEY (satis_id),
    FOREIGN KEY (satici) REFERENCES Calisanlar(c_id)
);

CREATE SEQUENCE tezgah_no_olustur
increment by 1
start with 1
no maxvalue
no cycle;

CREATE SEQUENCE calisan_id_olustur
increment by 1
start with 1
no maxvalue
no cycle;

CREATE SEQUENCE urun_id_olustur
increment by 1
start with 1
no maxvalue
no cycle;

CREATE SEQUENCE satis_id_olustur
increment by 1
start with 1
no maxvalue
no cycle;

INSERT INTO tezgahlar VALUES(nextval('tezgah_no_olustur'), 25, 2000, 500);
INSERT INTO tezgahlar VALUES(nextval('tezgah_no_olustur'), 15, 1000, 300);
INSERT INTO tezgahlar VALUES(nextval('tezgah_no_olustur'), 10, 700, 250);
INSERT INTO tezgahlar VALUES(nextval('tezgah_no_olustur'), 17, 1200, 350);
INSERT INTO tezgahlar VALUES(nextval('tezgah_no_olustur'), 22, 2000, 400);
INSERT INTO tezgahlar VALUES(nextval('tezgah_no_olustur'), 30, 4000, 600);
INSERT INTO tezgahlar VALUES(nextval('tezgah_no_olustur'), 6, 500, 130);
INSERT INTO tezgahlar VALUES(nextval('tezgah_no_olustur'), 4, 400, 100);
INSERT INTO tezgahlar VALUES(nextval('tezgah_no_olustur'), 20, 1600, 350);
INSERT INTO tezgahlar VALUES(nextval('tezgah_no_olustur'), 50, 6000, 1000);

INSERT INTO calisanlar VALUES(nextval('calisan_id_olustur'),'33476256982','semih','şenel','5164624962','E','1999-11-22',1,1);
INSERT INTO calisanlar VALUES(nextval('calisan_id_olustur'),'36476656152','yaren','öztürk','7777777777','K','1997-12-19',2,2);
INSERT INTO calisanlar VALUES(nextval('calisan_id_olustur'),'33576556912','alev','uysal','8888888888','K','1984-06-10',3,3);
INSERT INTO calisanlar VALUES(nextval('calisan_id_olustur'),'83076265982','şafak','bilici','9999999999','E','1979-02-16',4,4);
INSERT INTO calisanlar VALUES(nextval('calisan_id_olustur'),'32376253482','ayça','erdemli','1234565678','K','1954-05-06',5,5);
INSERT INTO calisanlar VALUES(nextval('calisan_id_olustur'),'11111111118','ahmet','özmen','8459019425','E','1949-06-15',6,6);
INSERT INTO calisanlar VALUES(nextval('calisan_id_olustur'),'22222222222','ali','barış','9876543210','E','1965-01-26',7,7);
INSERT INTO calisanlar VALUES(nextval('calisan_id_olustur'),'33333333330','inci','yerlikaya','6521626782','K','1964-02-21',8,8);
INSERT INTO calisanlar VALUES(nextval('calisan_id_olustur'),'44444444444','lale','akbulut','1357913579','K','1978-07-30',9,9);
INSERT INTO calisanlar VALUES(nextval('calisan_id_olustur'),'55555555554','sefa','gökçeoğlu','2468246824','E','1959-10-01',10,10);
INSERT INTO calisanlar VALUES(nextval('calisan_id_olustur'),'98765432128','kaan','kesgin','8459731425','E','1949-06-15',10,null);
INSERT INTO calisanlar VALUES(nextval('calisan_id_olustur'),'82648192934','pınar','karaömer','9864984162','K','1949-06-15',10,null);
INSERT INTO calisanlar VALUES(nextval('calisan_id_olustur'),'21654648436','merve','bahtiyar','3453463224','K','1949-06-15',6,null);
INSERT INTO calisanlar VALUES(nextval('calisan_id_olustur'),'98414688782','anıl','erdoğan','5463532424','E','1949-06-15',1,null);
INSERT INTO calisanlar VALUES(nextval('calisan_id_olustur'),'12654165764','buğra','gündoğ','8656344232','E','1949-06-15',5,null);

INSERT INTO urunler VALUES(nextval('urun_id_olustur'),5,'Meyve','Elma',5,100);
INSERT INTO urunler VALUES(nextval('urun_id_olustur'),2,'Meyve','Armut',7,40);
INSERT INTO urunler VALUES(nextval('urun_id_olustur'),3,'Sebze','Lahana',3.5,30);
INSERT INTO urunler VALUES(nextval('urun_id_olustur'),1,'Meyve','Muz',15,50);
INSERT INTO urunler VALUES(nextval('urun_id_olustur'),8,'Sebze','Fasulye',10,60);
INSERT INTO urunler VALUES(nextval('urun_id_olustur'),6,'Sebze','Patates',6,200);
INSERT INTO urunler VALUES(nextval('urun_id_olustur'),7,'Meyve','Kiraz',4,30);
INSERT INTO urunler VALUES(nextval('urun_id_olustur'),5,'Sebze','Patlican',10,70);
INSERT INTO urunler VALUES(nextval('urun_id_olustur'),10,'Meyve','Erik',20,20);
INSERT INTO urunler VALUES(nextval('urun_id_olustur'),7,'Sebze','Bamya',3,30);

INSERT INTO satiskaydi VALUES(nextval('satis_id_olustur'), 1, 2, 10, 5, '2019-11-18', 2, 50);
INSERT INTO satiskaydi VALUES(nextval('satis_id_olustur'), 3, 4, 12, 4, '2019-10-22', 4, 48);
INSERT INTO satiskaydi VALUES(nextval('satis_id_olustur'), 4, 5, 3, 3, '2019-11-19', 5, 9);
INSERT INTO satiskaydi VALUES(nextval('satis_id_olustur'), 1, 6, 5, 8, '2020-01-01', 6, 40);
INSERT INTO satiskaydi VALUES(nextval('satis_id_olustur'), 6, 8, 7, 5, '2020-02-13', 8, 35);
INSERT INTO satiskaydi VALUES(nextval('satis_id_olustur'), 7, 2, 6, 2, '2020-04-28', 2, 12);
INSERT INTO satiskaydi VALUES(nextval('satis_id_olustur'), 3, 2, 7, 7, '2020-05-05', 2, 49);
INSERT INTO satiskaydi VALUES(nextval('satis_id_olustur'), 8, 3, 1, 8, '2020-06-08', 3, 8);
INSERT INTO satiskaydi VALUES(nextval('satis_id_olustur'), 2, 1, 2, 2, '2020-07-30', 1, 4);
INSERT INTO satiskaydi VALUES(nextval('satis_id_olustur'), 7, 4, 4, 5, '2020-07-31', 4, 20);


CREATE OR REPLACE FUNCTION stok_kontrol()
  RETURNS TRIGGER 
  AS
$$
DECLARE 
    mevcut_stok integer;
    max_s integer;
BEGIN
    SELECT sum(stok) into mevcut_stok from Urunler WHERE satildigi_tezgah = NEW.satildigi_tezgah;
    SELECT max_stok into max_s FROM tezgahlar WHERE tezgah_no = NEW.satildigi_tezgah;
    IF mevcut_stok + NEW.stok > max_s THEN
        RAISE EXCEPTION 'STOK OUT OF RANGE';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER stok_kont
   BEFORE INSERT
   ON urunler
   FOR EACH ROW
   		EXECUTE FUNCTION stok_kontrol();

CREATE OR REPLACE FUNCTION stok_azalt()
RETURNS TRIGGER AS $$
DECLARE
	urun_stok integer;
	yeni_stok integer;
BEGIN
	SELECT stok into urun_stok FROM urunler WHERE urun_id = NEW.urun_id;
	IF urun_stok > NEW.miktar THEN
		yeni_stok := urun_stok - NEW.miktar;
		UPDATE urunler SET stok = yeni_stok WHERE urun_id = NEW.urun_id;
		RETURN NEW;
	ELSE
		RAISE EXCEPTION 'Mevcut Stok Satılan Stoktan Daha Az';
		RETURN NULL;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER satis_kontrol
	BEFORE INSERT 
	ON satiskaydi
	FOR EACH ROW 
		EXECUTE FUNCTION stok_azalt();
		
CREATE OR REPLACE FUNCTION satis_yap(u_id integer, miktar integer, satici_id integer)
RETURNS VOID AS $$
DECLARE
	fiyat float;
	toplam float;
	c_tezgah integer;
	rec RECORD;
	cur CURSOR FOR SELECT c_id FROM calisanlar WHERE calistigi_tezgah = (SELECT satildigi_tezgah FROM urunler WHERE urun_id = u_id);
BEGIN
	SELECT satildigi_tezgah,birim_fiyat into rec FROM urunler WHERE urun_id = u_id;
	toplam := rec.birim_fiyat* miktar;
	for ct IN cur LOOP
		IF satici_id = ct.c_id THEN
			INSERT INTO satiskaydi VALUES(nextval('satis_id_olustur'),u_id, rec.satildigi_tezgah, miktar,rec.birim_fiyat, CURRENT_DATE, satici_id, toplam);
			RETURN;
		END IF;
	END LOOP;
	RAISE EXCEPTION 'Satici bu tezgahta calismiyor!';
END;
$$ LANGUAGE plpgsql;

CREATE VIEW alfabetik
as
SELECT * 
FROM calisanlar 
ORDER BY isim ASC;

CREATE OR REPLACE FUNCTION zam_yap(min_alan integer, max_alan integer, zam_oran integer)
RETURNS VOID AS $$
DECLARE
    crs CURSOR FOR SELECT tezgah_no,kira FROM tezgahlar WHERE alan BETWEEN min_alan AND max_alan;
    yeni_kira integer;
BEGIN
    FOR satir IN crs LOOP
        yeni_kira := satir.kira;
        yeni_kira := yeni_kira * zam_oran;
        yeni_kira := yeni_kira / 100;
        yeni_kira := satir.kira + yeni_kira;
        UPDATE tezgahlar SET kira = yeni_kira WHERE tezgah_no = satir.tezgah_no;
    END LOOP;
END;
$$ LANGUAGE plpgsql;




