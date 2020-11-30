--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: active_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_sessions (user_id, session_id, start) FROM stdin;
\.


--
-- Data for Name: adressen_kpf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adressen_kpf (nummer, anrede1, anrede2, anrede3, anrede4, anschrift) FROM stdin;
\.


--
-- Data for Name: berechtigung; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.berechtigung (userid, modulnr, lesen, schreiben) FROM stdin;
\.


--
-- Data for Name: firmen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.firmen (firma, name) FROM stdin;
GS	Gebrüder Schneider Stimpfach
RF	Radeburger Fensterbau
SC	Schneider Steel Construction
RC	Rapid Calau
\.


--
-- Data for Name: forms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forms (id, theme, name, path, iconpath, "timestamp", themeid) FROM stdin;
2	\N	Urlaubsantrag	forms/07d419a18db2291db4c72af0c66ea78a.pdf	forms/07d419a18db2291db4c72af0c66ea78a.jpg	2020-01-24 13:44:32.217199	1
3	\N	Freizeitkontoantrag	forms/03ae44deb5de255104fc6382de386abe.pdf	forms/03ae44deb5de255104fc6382de386abe.jpg	2020-02-07 14:29:10.702855	1
4	\N	Reisekostenabrechnung	forms/b6a1bb1d1fe61e926210badd52aa97e1.xls	forms/b6a1bb1d1fe61e926210badd52aa97e1.jpg	2020-02-07 14:30:20.503768	1
5	\N	Reisekostenabrechnung - Anlage für Belege	forms/aa6495c928260e970051b682e351e9cf.docx	forms/aa6495c928260e970051b682e351e9cf.jpg	2020-02-07 14:31:41.966937	1
1	Allgemein	\N	forms/235baf1c9d9fb106a3bdd8d291ba5da3xlsx	forms/235baf1c9d9fb106a3bdd8d291ba5da3.jpg	2020-01-22 15:05:25.130304	\N
7	\N	BA PT0130	forms/b761174000171cb95d488c5c03f498b4.xlsm	forms/b761174000171cb95d488c5c03f498b4.jpg	2020-03-11 11:19:04.690285	6
9	\N	Formblatt	forms/77ddcd10dc75bf051efa6647f1168401.pdf	forms/77ddcd10dc75bf051efa6647f1168401.jpg	2020-06-03 13:50:10.212113	8
8	ISO - Arbeitsanweisungen	\N	\N	\N	2020-06-03 13:49:14.645761	\N
10	ISO - Formblätter	\N	\N	\N	2020-06-03 13:51:45.076423	\N
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, group_name) FROM stdin;
4	test
9	testing
10	test2
11	test3
12	test4
13	test5
14	test6
15	test9
16	test10
17	test11
18	test12
19	test13
20	test14
21	aasdasd
22	adad
23	aadad
24	adsd
25	aaaa
\.


--
-- Data for Name: handbuch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.handbuch (id, dokument, typ, kapitel, bezeichnung, pfad, ebene1, ebene2, ebene3) FROM stdin;
1	\N	handbuch	Lager	Lagerarten	/var/www/webtest2/handbooks/Lagerarten.pdf	\N	\N	\N
2	\N	handbuch	Lager	Lagerbuchungen	/var/www/webtest2/handbooks/Lagerbuchungen.pdf	\N	\N	\N
3	\N	handbuch	Allgemein	Lieferziele	/var/www/webtest2/handbooks/Lieferziele.pdf	\N	\N	\N
\.


--
-- Data for Name: information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.information (titel, inhalt, zeitstempel, aenderung, fulltextarray, fulltext, id, read_permission, modify_permission) FROM stdin;
Saturn	Der Saturn ist von der Sonne aus gesehen der sechste Planet des Sonnensystems und mit einem Äquatordurchmesser von etwa 120.500 Kilometern (9,5-facher Erddurchmesser) nach Jupiter der zweitgrößte. Mit 95 Erdmassen hat er jedoch nur 30 % der Masse Jupiters. Wegen seines schon im kleinen Fernrohr sichtbaren Ringes wird er oft auch der Ringplanet genannt.\r\n\r\nDer Saturn hat eine durchschnittliche Entfernung zur Sonne von gut 1,43 Milliarden Kilometern, seine Bahn verläuft zwischen der von Jupiter und der des sonnenferneren Uranus. Er ist der äußerste Planet, der auch mit bloßem Auge gut sichtbar ist, und war daher schon Jahrtausende vor der Erfindung des Fernrohrs bekannt.\r\n\r\nEr ist ein Gasplanet, dessen untersuchte obere Schichten zu etwa 96 % Stoffanteil aus Wasserstoff bestehen, und der von allen Planeten des Sonnensystems die geringste mittlere Dichte (etwa 0,69 g/cm³) aufweist.[1] Von den anderen Planeten hebt sich der Saturn durch seine besonders ausgeprägten und schon lange bekannten Ringe ab, die zu großen Teilen aus Wassereis und Gesteinsbrocken bestehen.\r\n\r\nSein scheinbarer Winkeldurchmesser beträgt je nach Erdentfernung zwischen 15″ und 20″, jener der Ringe zwischen 37″ und 46″. Die sogenannten Äquatorstreifen der Wolkenschichten des Saturn sind weniger deutlich als bei Jupiter, was wahrscheinlich mit einer hochlagernden Dunstschicht zusammenhängt.\r\n\r\nBis 2019 wurden 82 Monde des Saturns entdeckt, dies sind mehr als von Jupiter bekannt sind. Der mit Abstand größte Saturnmond ist Titan mit 5150 Kilometern Durchmesser.\r\n\r\nBenannt ist der Planet nach dem römischen Gott des Reichtums und der Ernte, Saturn. Sein astronomisches Symbol ♄ repräsentiert die stilisierte Sichel des Gottes. 	2020-02-11 10:10:57.708014	\N	{Der,Saturn,ist,von,der,Sonne,aus,gesehen,der,sechste,Planet,des,Sonnensystems,und,mit,einem,quatordurchmesser,von,etwa,120500,Kilometern,"9,5facher",Erddurchmesser,nach,Jupiter,der,zweitgrößte,Mit,95,Erdmassen,hat,er,jedoch,nur,30,"",der,Masse,Jupiters,Wegen,seines,schon,im,kleinen,Fernrohr,sichtbaren,Ringes,wird,er,oft,auch,der,Ringplanet,genanntDer,Saturn,hat,eine,durchschnittliche,Entfernung,zur,Sonne,von,gut,"1,43",Milliarden,"Kilometern,",seine,Bahn,verläuft,zwischen,der,von,Jupiter,und,der,des,sonnenferneren,Uranus,Er,ist,der,äußerste,"Planet,",der,auch,mit,bloßem,Auge,gut,sichtbar,"ist,",und,war,daher,schon,Jahrtausende,vor,der,Erfindung,des,Fernrohrs,bekanntEr,ist,ein,"Gasplanet,",dessen,untersuchte,obere,Schichten,zu,etwa,96,"",Stoffanteil,aus,Wasserstoff,"bestehen,",und,der,von,allen,Planeten,des,Sonnensystems,die,geringste,mittlere,Dichte,etwa,"0,69",gcm,aufweist1,Von,den,anderen,Planeten,hebt,sich,der,Saturn,durch,seine,besonders,ausgeprägten,und,schon,lange,bekannten,Ringe,"ab,",die,zu,großen,Teilen,aus,Wassereis,und,Gesteinsbrocken,bestehenSein,scheinbarer,Winkeldurchmesser,beträgt,je,nach,Erdentfernung,zwischen,15,und,"20,",jener,der,Ringe,zwischen,37,und,46,Die,sogenannten,quatorstreifen,der,Wolkenschichten,des,Saturn,sind,weniger,deutlich,als,bei,"Jupiter,",was,wahrscheinlich,mit,einer,hochlagernden,Dunstschicht,zusammenhängtBis,2019,wurden,82,Monde,des,Saturns,"entdeckt,",dies,sind,mehr,als,von,Jupiter,bekannt,sind,Der,mit,Abstand,größte,Saturnmond,ist,Titan,mit,5150,Kilometern,DurchmesserBenannt,ist,der,Planet,nach,dem,römischen,Gott,des,Reichtums,und,der,"Ernte,",Saturn,Sein,astronomisches,Symbol,"",repräsentiert,die,stilisierte,Sichel,des,Gottes,""}	Saturn Der Saturn ist von der Sonne aus gesehen der sechste Planet des Sonnensystems und mit einem Äquatordurchmesser von etwa 120.500 Kilometern (9,5-facher Erddurchmesser) nach Jupiter der zweitgrößte. Mit 95 Erdmassen hat er jedoch nur 30 % der Masse Jupiters. Wegen seines schon im kleinen Fernrohr sichtbaren Ringes wird er oft auch der Ringplanet genannt.\r\n\r\nDer Saturn hat eine durchschnittliche Entfernung zur Sonne von gut 1,43 Milliarden Kilometern, seine Bahn verläuft zwischen der von Jupiter und der des sonnenferneren Uranus. Er ist der äußerste Planet, der auch mit bloßem Auge gut sichtbar ist, und war daher schon Jahrtausende vor der Erfindung des Fernrohrs bekannt.\r\n\r\nEr ist ein Gasplanet, dessen untersuchte obere Schichten zu etwa 96 % Stoffanteil aus Wasserstoff bestehen, und der von allen Planeten des Sonnensystems die geringste mittlere Dichte (etwa 0,69 g/cm³) aufweist.[1] Von den anderen Planeten hebt sich der Saturn durch seine besonders ausgeprägten und schon lange bekannten Ringe ab, die zu großen Teilen aus Wassereis und Gesteinsbrocken bestehen.\r\n\r\nSein scheinbarer Winkeldurchmesser beträgt je nach Erdentfernung zwischen 15″ und 20″, jener der Ringe zwischen 37″ und 46″. Die sogenannten Äquatorstreifen der Wolkenschichten des Saturn sind weniger deutlich als bei Jupiter, was wahrscheinlich mit einer hochlagernden Dunstschicht zusammenhängt.\r\n\r\nBis 2019 wurden 82 Monde des Saturns entdeckt, dies sind mehr als von Jupiter bekannt sind. Der mit Abstand größte Saturnmond ist Titan mit 5150 Kilometern Durchmesser.\r\n\r\nBenannt ist der Planet nach dem römischen Gott des Reichtums und der Ernte, Saturn. Sein astronomisches Symbol ♄ repräsentiert die stilisierte Sichel des Gottes. 	1	\N	\N
Jupiter	Jupiter ist mit einem Äquatordurchmesser von rund 143.000 Kilometern der größte Planet des Sonnensystems. Mit einer durchschnittlichen Entfernung von 778 Millionen Kilometern ist er von der Sonne aus gesehen der fünfte Planet. Er ist nach dem römischen Hauptgott Jupiter benannt.\r\n\r\nEr hat keine sichtbare feste Oberfläche. Aufgrund seiner chemischen Zusammensetzung zählt Jupiter zu den Gasplaneten. Diese „Gasriesen“ bilden im Sonnensystem die Gruppe der äußeren Planeten; sie werden auch als jupiterähnliche (jovianische) Planeten bezeichnet. In dieser Gruppe ist Jupiter der innerste Planet; er läuft jenseits des Asteroidengürtels um die Sonne.\r\n\r\n2018 waren 79 Monde des Jupiter bekannt. Die vier größten sogenannten Galileischen Monde Ganymed, Kallisto, Io und Europa haben Durchmesser zwischen 5262 und 3122 km und wurden bereits 1610 entdeckt.\r\n\r\nJupiter ist das dritt- bis vierthellste Objekt des Nachthimmels (nach Mond und Venus; abhängig von der Bahnkonstellation ist bisweilen auch Mars heller). In Babylonien galt er wegen seines goldgelben Lichts als Königsstern (siehe auch Stern von Betlehem). Sein astronomisches Symbol ist ♃. 	2020-02-11 10:11:24.710961	\N	{Jupiter,ist,mit,einem,quatordurchmesser,von,rund,143000,Kilometern,der,größte,Planet,des,Sonnensystems,Mit,einer,durchschnittlichen,Entfernung,von,778,Millionen,Kilometern,ist,er,von,der,Sonne,aus,gesehen,der,fünfte,Planet,Er,ist,nach,dem,römischen,Hauptgott,Jupiter,benanntEr,hat,keine,sichtbare,feste,Oberfläche,Aufgrund,seiner,chemischen,Zusammensetzung,zählt,Jupiter,zu,den,Gasplaneten,Diese,Gasriesen,bilden,im,Sonnensystem,die,Gruppe,der,äußeren,Planeten,sie,werden,auch,als,jupiterähnliche,jovianische,Planeten,bezeichnet,In,dieser,Gruppe,ist,Jupiter,der,innerste,Planet,er,läuft,jenseits,des,Asteroidengürtels,um,die,Sonne2018,waren,79,Monde,des,Jupiter,bekannt,Die,vier,größten,sogenannten,Galileischen,Monde,"Ganymed,","Kallisto,",Io,und,Europa,haben,Durchmesser,zwischen,5262,und,3122,km,und,wurden,bereits,1610,entdecktJupiter,ist,das,dritt,bis,vierthellste,Objekt,des,Nachthimmels,nach,Mond,und,Venus,abhängig,von,der,Bahnkonstellation,ist,bisweilen,auch,Mars,heller,In,Babylonien,galt,er,wegen,seines,goldgelben,Lichts,als,Königsstern,siehe,auch,Stern,von,Betlehem,Sein,astronomisches,Symbol,ist,"",""}	Jupiter Jupiter ist mit einem Äquatordurchmesser von rund 143.000 Kilometern der größte Planet des Sonnensystems. Mit einer durchschnittlichen Entfernung von 778 Millionen Kilometern ist er von der Sonne aus gesehen der fünfte Planet. Er ist nach dem römischen Hauptgott Jupiter benannt.\r\n\r\nEr hat keine sichtbare feste Oberfläche. Aufgrund seiner chemischen Zusammensetzung zählt Jupiter zu den Gasplaneten. Diese „Gasriesen“ bilden im Sonnensystem die Gruppe der äußeren Planeten; sie werden auch als jupiterähnliche (jovianische) Planeten bezeichnet. In dieser Gruppe ist Jupiter der innerste Planet; er läuft jenseits des Asteroidengürtels um die Sonne.\r\n\r\n2018 waren 79 Monde des Jupiter bekannt. Die vier größten sogenannten Galileischen Monde Ganymed, Kallisto, Io und Europa haben Durchmesser zwischen 5262 und 3122 km und wurden bereits 1610 entdeckt.\r\n\r\nJupiter ist das dritt- bis vierthellste Objekt des Nachthimmels (nach Mond und Venus; abhängig von der Bahnkonstellation ist bisweilen auch Mars heller). In Babylonien galt er wegen seines goldgelben Lichts als Königsstern (siehe auch Stern von Betlehem). Sein astronomisches Symbol ist ♃. 	2	\N	\N
Pluto	Pluto ist der größte und zweitmassivste bekannte Zwergplanet und das am längsten bekannte Objekt des Kuipergürtels. Er ist nach dem römischen Gott der Unterwelt benannt. Nach dem Zwergplaneten wiederum wurden die neuen Klassen der Plutoiden und der Plutinos benannt.\r\n\r\nDas astronomische Symbol des Pluto ist ♇. In der Astrologie wird auch Astrologisches Symbol des Pluto verwendet.\r\n\r\nIm Januar 2006 wurde mit New Horizons erstmals eine Raumsonde zu Pluto ausgesandt; sie passierte ihn am 14. Juli 2015 in 12.500 km Entfernung.[3]\r\n\r\nPluto besitzt etwa ein Drittel des Volumens des Erdmondes und bewegt sich auf einer noch exzentrischeren Bahn um die Sonne als der Planet Merkur. Von seiner Entdeckung am 18. Februar 1930 bis zur Neudefinition des Begriffs „Planet“ am 24. August 2006 durch die Internationale Astronomische Union (IAU) galt Pluto als der neunte und äußerste Planet des Sonnensystems.\r\n\r\nNachdem immer mehr Plutoiden – also ähnlich große Körper des Kuipergürtels – gefunden worden waren, wurde Pluto der Planetenstatus aberkannt. Seither wird er der Kategorie Zwergplanet zugeordnet und erhielt eine Kleinplanetennummer: Die vollständige Bezeichnung lautet (134340) Pluto. 	2020-02-11 10:12:03.053657	\N	{Pluto,ist,der,größte,und,zweitmassivste,bekannte,Zwergplanet,und,das,am,längsten,bekannte,Objekt,des,Kuipergürtels,Er,ist,nach,dem,römischen,Gott,der,Unterwelt,benannt,Nach,dem,Zwergplaneten,wiederum,wurden,die,neuen,Klassen,der,Plutoiden,und,der,Plutinos,benanntDas,astronomische,Symbol,des,Pluto,ist,"",In,der,Astrologie,wird,auch,Astrologisches,Symbol,des,Pluto,verwendetIm,Januar,2006,wurde,mit,New,Horizons,erstmals,eine,Raumsonde,zu,Pluto,ausgesandt,sie,passierte,ihn,am,14,Juli,2015,in,12500,km,Entfernung3Pluto,besitzt,etwa,ein,Drittel,des,Volumens,des,Erdmondes,und,bewegt,sich,auf,einer,noch,exzentrischeren,Bahn,um,die,Sonne,als,der,Planet,Merkur,Von,seiner,Entdeckung,am,18,Februar,1930,bis,zur,Neudefinition,des,Begriffs,Planet,am,24,August,2006,durch,die,Internationale,Astronomische,Union,IAU,galt,Pluto,als,der,neunte,und,äußerste,Planet,des,SonnensystemsNachdem,immer,mehr,Plutoiden,"",also,ähnlich,große,Körper,des,Kuipergürtels,"",gefunden,worden,"waren,",wurde,Pluto,der,Planetenstatus,aberkannt,Seither,wird,er,der,Kategorie,Zwergplanet,zugeordnet,und,erhielt,eine,Kleinplanetennummer,Die,vollständige,Bezeichnung,lautet,134340,Pluto,""}	Pluto Pluto ist der größte und zweitmassivste bekannte Zwergplanet und das am längsten bekannte Objekt des Kuipergürtels. Er ist nach dem römischen Gott der Unterwelt benannt. Nach dem Zwergplaneten wiederum wurden die neuen Klassen der Plutoiden und der Plutinos benannt.\r\n\r\nDas astronomische Symbol des Pluto ist ♇. In der Astrologie wird auch Astrologisches Symbol des Pluto verwendet.\r\n\r\nIm Januar 2006 wurde mit New Horizons erstmals eine Raumsonde zu Pluto ausgesandt; sie passierte ihn am 14. Juli 2015 in 12.500 km Entfernung.[3]\r\n\r\nPluto besitzt etwa ein Drittel des Volumens des Erdmondes und bewegt sich auf einer noch exzentrischeren Bahn um die Sonne als der Planet Merkur. Von seiner Entdeckung am 18. Februar 1930 bis zur Neudefinition des Begriffs „Planet“ am 24. August 2006 durch die Internationale Astronomische Union (IAU) galt Pluto als der neunte und äußerste Planet des Sonnensystems.\r\n\r\nNachdem immer mehr Plutoiden – also ähnlich große Körper des Kuipergürtels – gefunden worden waren, wurde Pluto der Planetenstatus aberkannt. Seither wird er der Kategorie Zwergplanet zugeordnet und erhielt eine Kleinplanetennummer: Die vollständige Bezeichnung lautet (134340) Pluto. 	3	\N	\N
Beteigeuze	Beteigeuze ist ein Riesenstern und wird im Hertzsprung-Russell-Diagramm in die Klasse der Roten Überriesen eingeteilt. Er hat etwa den tausendfachen Durchmesser der Sonne und besitzt im sichtbaren Bereich eine etwa zehntausendmal so große Leuchtkraft.[10] Volumenmäßig passt die Sonne somit etwa eine Milliarde Mal in Beteigeuze. Von der Erde aus gesehen ist Beteigeuze der zehnthellste Stern.\r\n\r\nBeteigeuze ist von großem astronomischen Interesse. Sein Radius war der erste, der mittels Interferometrie bestimmt wurde. Es stellte sich heraus, dass er um zirka 15 Prozent schwankt.[11] Es variiert auch Beteigeuzes Helligkeit zwischen +0,3 und +0,6m mit einer halbregelmäßigen Periode von 2070 Tagen (Halbregelmäßig Veränderlicher vom Typ SRc). Er ist neben Mira, Altair und Antares einer der wenigen Sterne, die von der Erde aus mit Teleskoptechnik als Fläche sichtbar sind, sein Winkeldurchmesser beträgt 0,05 Bogensekunden.\r\n\r\nAnlässlich einer Bedeckung von Beteigeuze durch den Asteroiden (319) Leona am 12. Dezember 2023 wird es unter Umständen möglich sein, die Verteilung der Helligkeit über die Sternenscheibe genauer zu bestimmen, als dies mit der aktuellen Technik möglich ist.[12]\r\n\r\nDie Bestimmung der Entfernung von Beteigeuze erwies sich als schwierig, da die Parallaxe deutlich geringer ist als der Winkeldurchmesser des Sterns. Man vermutete lange Zeit eine Entfernung um 700 Lichtjahre, mit Hilfe des Satelliten Hipparcos wurde sie 1997 auf zirka 430 ± 100 Lichtjahre (130 ± 30 Parsec) bestimmt. Neuere Analysen der Hipparcos- und anderer Daten deuten jedoch auf eine größere Entfernung von etwa 640 ± 150 Lichtjahren (200 ± 45 Parsec) hin.[4] 	2020-02-11 10:12:26.964678	2020-02-11 13:40:13.712683	{Beteigeuze,ist,ein,Riesenstern,und,wird,im,HertzsprungRussellDiagramm,in,die,Klasse,der,Roten,berriesen,eingeteilt,Er,hat,etwa,den,tausendfachen,Durchmesser,der,Sonne,und,besitzt,im,sichtbaren,Bereich,eine,etwa,zehntausendmal,so,große,Leuchtkraft10,Volumenmäßig,passt,die,Sonne,somit,etwa,eine,Milliarde,Mal,in,Beteigeuze,Von,der,Erde,aus,gesehen,ist,Beteigeuze,der,zehnthellste,SternBeteigeuze,ist,von,großem,astronomischen,Interesse,Sein,Radius,war,der,"erste,",der,mittels,Interferometrie,bestimmt,wurde,Es,stellte,sich,"heraus,",dass,er,um,zirka,15,Prozent,schwankt11,Es,variiert,auch,Beteigeuzes,Helligkeit,zwischen,"0,3",und,"0,6m",mit,einer,halbregelmäßigen,Periode,von,2070,Tagen,Halbregelmäßig,Veränderlicher,vom,Typ,SRc,Er,ist,neben,"Mira,",Altair,und,Antares,einer,der,wenigen,"Sterne,",die,von,der,Erde,aus,mit,Teleskoptechnik,als,Fläche,sichtbar,"sind,",sein,Winkeldurchmesser,beträgt,"0,05",BogensekundenAnlässlich,einer,Bedeckung,von,Beteigeuze,durch,den,Asteroiden,319,Leona,am,12,Dezember,2023,wird,es,unter,Umständen,möglich,"sein,",die,Verteilung,der,Helligkeit,über,die,Sternenscheibe,genauer,zu,"bestimmen,",als,dies,mit,der,aktuellen,Technik,möglich,ist12Die,Bestimmung,der,Entfernung,von,Beteigeuze,erwies,sich,als,"schwierig,",da,die,Parallaxe,deutlich,geringer,ist,als,der,Winkeldurchmesser,des,Sterns,Man,vermutete,lange,Zeit,eine,Entfernung,um,700,"Lichtjahre,",mit,Hilfe,des,Satelliten,Hipparcos,wurde,sie,1997,auf,zirka,430,"",100,Lichtjahre,130,"",30,Parsec,bestimmt,Neuere,Analysen,der,Hipparcos,und,anderer,Daten,deuten,jedoch,auf,eine,größere,Entfernung,von,etwa,640,"",150,Lichtjahren,200,"",45,Parsec,hin4,""}	Beteigeuze Beteigeuze ist ein Riesenstern und wird im Hertzsprung-Russell-Diagramm in die Klasse der Roten Überriesen eingeteilt. Er hat etwa den tausendfachen Durchmesser der Sonne und besitzt im sichtbaren Bereich eine etwa zehntausendmal so große Leuchtkraft.[10] Volumenmäßig passt die Sonne somit etwa eine Milliarde Mal in Beteigeuze. Von der Erde aus gesehen ist Beteigeuze der zehnthellste Stern.\r\n\r\nBeteigeuze ist von großem astronomischen Interesse. Sein Radius war der erste, der mittels Interferometrie bestimmt wurde. Es stellte sich heraus, dass er um zirka 15 Prozent schwankt.[11] Es variiert auch Beteigeuzes Helligkeit zwischen +0,3 und +0,6m mit einer halbregelmäßigen Periode von 2070 Tagen (Halbregelmäßig Veränderlicher vom Typ SRc). Er ist neben Mira, Altair und Antares einer der wenigen Sterne, die von der Erde aus mit Teleskoptechnik als Fläche sichtbar sind, sein Winkeldurchmesser beträgt 0,05 Bogensekunden.\r\n\r\nAnlässlich einer Bedeckung von Beteigeuze durch den Asteroiden (319) Leona am 12. Dezember 2023 wird es unter Umständen möglich sein, die Verteilung der Helligkeit über die Sternenscheibe genauer zu bestimmen, als dies mit der aktuellen Technik möglich ist.[12]\r\n\r\nDie Bestimmung der Entfernung von Beteigeuze erwies sich als schwierig, da die Parallaxe deutlich geringer ist als der Winkeldurchmesser des Sterns. Man vermutete lange Zeit eine Entfernung um 700 Lichtjahre, mit Hilfe des Satelliten Hipparcos wurde sie 1997 auf zirka 430 ± 100 Lichtjahre (130 ± 30 Parsec) bestimmt. Neuere Analysen der Hipparcos- und anderer Daten deuten jedoch auf eine größere Entfernung von etwa 640 ± 150 Lichtjahren (200 ± 45 Parsec) hin.[4] 	4	\N	\N
Uranus	Der Uranus (Latinisierung von altgriechisch οὐρανός uranós ‚Himmel‘)[3] ist von der Sonne aus mit einer durchschnittlichen Sonnenentfernung von 2,9 Milliarden Kilometern der siebte Planet im Sonnensystem und wird zu den äußeren, jupiterähnlichen (jovianischen) Planeten gerechnet. Er wurde am 13. März 1781 von Wilhelm Herschel entdeckt und ist nach dem griechischen Himmelsgott Uranos benannt. Er ist damit als einziger Planet nach einem Gott der griechischen Götterwelt benannt.	2020-02-11 14:47:04.823366	2020-02-11 14:48:02.627532	{Der,Uranus,Latinisierung,von,altgriechisch,"",urans,Himmel3,ist,von,der,Sonne,aus,mit,einer,durchschnittlichen,Sonnenentfernung,von,"2,9",Milliarden,Kilometern,der,siebte,Planet,im,Sonnensystem,und,wird,zu,den,"äußeren,",jupiterähnlichen,jovianischen,Planeten,gerechnet,Er,wurde,am,13,März,1781,von,Wilhelm,Herschel,entdeckt,und,ist,nach,dem,griechischen,Himmelsgott,Uranos,benannt,Er,ist,damit,als,einziger,Planet,nach,einem,Gott,der,griechischen,Götterwelt,benannt}	Uranus Der Uranus (Latinisierung von altgriechisch οὐρανός uranós ‚Himmel‘)[3] ist von der Sonne aus mit einer durchschnittlichen Sonnenentfernung von 2,9 Milliarden Kilometern der siebte Planet im Sonnensystem und wird zu den äußeren, jupiterähnlichen (jovianischen) Planeten gerechnet. Er wurde am 13. März 1781 von Wilhelm Herschel entdeckt und ist nach dem griechischen Himmelsgott Uranos benannt. Er ist damit als einziger Planet nach einem Gott der griechischen Götterwelt benannt.	6	\N	\N
Spika	Spica (lateinisch Kornähre), auch α Virginis, Azimech oder Alaraph genannt, ist der hellste Stern im Sternbild Jungfrau und der fünfzehnthellste Stern am nächtlichen Sternenhimmel.\r\n\r\nIm Sternbild Jungfrau stellt Spica die Kornähre in der Hand der Jungfrau dar. In Mesopotamien war Spica unter dšala šubultu (Gott/Göttin Schala, die Kornähre), später auch Göttliche Jungfrau der Kornähre, bekannt. Die Römer glaubten, in Spica die Göttin Ceres zu sehen. Römische Namen sind Spicum, Spigha, Stachys (von gr. stakhum Kornähre) und Aristae Puella (Kornmädchen).\r\n\r\nDie IAU hat am 30. Juni 2016 den Eigennamen Spica als standardisierten Eigennamen festgelegt.[1]\r\n\r\nSpica ist ein bedeckungsveränderlicher Stern vom Typ der Beta-Cephei-Sterne wie der Algol. Die Helligkeit der Spica verändert sich mit einer Periode von 4,0142 Tagen zwischen +0,92 mag und +0,98 mag. Diese geringe Helligkeitsschwankung ist visuell kaum feststellbar.\r\n\r\nBeide Komponenten von Spica gehören zum Spektraltyp B (B1 bis B4), wobei sich der hellere Stern nahe am Ende seiner stabilen Zeit als Hauptreihenstern befindet. Die beiden Sterne gehören zu den heißesten und somit bläulichsten der hellen Sterne am Nachthimmel. Durch die hohe Temperatur wird ein Großteil des Lichtes im unsichtbaren ultravioletten Bereich abgestrahlt.\r\n\r\nDer hellere Stern hat eine Temperatur von 22.400 K und eine 13.500-fache Sonnenleuchtkraft. Der Radius beträgt das 7,8-fache des Sonnenradius und erstreckt sich auf fast 30 % des Abstandes der beiden Sterne. Die Masse des helleren Sternes beträgt das Elffache der Sonne. Das ist genug, um den Stern als Supernova enden zu lassen.\r\n\r\nDer nicht so bekannte weniger helle Begleitstern hat eine Oberflächentemperatur von 18.500 K, 1.700-fache Sonnenleuchtkraft, vierfachen Sonnenradius und etwas weniger als die siebenfache Sonnenmasse.\r\n\r\nSpica kann als ekliptiknaher Stern vom Mond und (sehr selten) von Planeten bedeckt werden. Zum letzten Mal von einem Planeten bedeckt wurde Spica am 10. November 1783 durch die Venus, die nächste Bedeckung wird am 2. September 2197 wieder durch die Venus erfolgen.\r\n\r\nSpica ist in der Flagge Brasiliens abgebildet, wo er den Bundesstaat Pará repräsentiert. 	2020-02-11 14:50:21.486712	\N	{Spica,lateinisch,"Kornähre,",auch,"","Virginis,",Azimech,oder,Alaraph,"genannt,",ist,der,hellste,Stern,im,Sternbild,Jungfrau,und,der,fünfzehnthellste,Stern,am,nächtlichen,SternenhimmelIm,Sternbild,Jungfrau,stellt,Spica,die,Kornähre,in,der,Hand,der,Jungfrau,dar,In,Mesopotamien,war,Spica,unter,dala,ubultu,GottGöttin,"Schala,",die,"Kornähre,",später,auch,Göttliche,Jungfrau,der,"Kornähre,",bekannt,Die,Römer,"glaubten,",in,Spica,die,Göttin,Ceres,zu,sehen,Römische,Namen,sind,"Spicum,","Spigha,",Stachys,von,gr,stakhum,Kornähre,und,Aristae,Puella,KornmädchenDie,IAU,hat,am,30,Juni,2016,den,Eigennamen,Spica,als,standardisierten,Eigennamen,festgelegt1Spica,ist,ein,bedeckungsveränderlicher,Stern,vom,Typ,der,BetaCepheiSterne,wie,der,Algol,Die,Helligkeit,der,Spica,verändert,sich,mit,einer,Periode,von,"4,0142",Tagen,zwischen,"0,92",mag,und,"0,98",mag,Diese,geringe,Helligkeitsschwankung,ist,visuell,kaum,feststellbarBeide,Komponenten,von,Spica,gehören,zum,Spektraltyp,B,B1,bis,"B4,",wobei,sich,der,hellere,Stern,nahe,am,Ende,seiner,stabilen,Zeit,als,Hauptreihenstern,befindet,Die,beiden,Sterne,gehören,zu,den,heißesten,und,somit,bläulichsten,der,hellen,Sterne,am,Nachthimmel,Durch,die,hohe,Temperatur,wird,ein,Großteil,des,Lichtes,im,unsichtbaren,ultravioletten,Bereich,abgestrahltDer,hellere,Stern,hat,eine,Temperatur,von,22400,K,und,eine,13500fache,Sonnenleuchtkraft,Der,Radius,beträgt,das,"7,8fache",des,Sonnenradius,und,erstreckt,sich,auf,fast,30,"",des,Abstandes,der,beiden,Sterne,Die,Masse,des,helleren,Sternes,beträgt,das,Elffache,der,Sonne,Das,ist,"genug,",um,den,Stern,als,Supernova,enden,zu,lassenDer,nicht,so,bekannte,weniger,helle,Begleitstern,hat,eine,Oberflächentemperatur,von,18500,"K,",1700fache,"Sonnenleuchtkraft,",vierfachen,Sonnenradius,und,etwas,weniger,als,die,siebenfache,SonnenmasseSpica,kann,als,ekliptiknaher,Stern,vom,Mond,und,sehr,selten,von,Planeten,bedeckt,werden,Zum,letzten,Mal,von,einem,Planeten,bedeckt,wurde,Spica,am,10,November,1783,durch,die,"Venus,",die,nächste,Bedeckung,wird,am,2,September,2197,wieder,durch,die,Venus,erfolgenSpica,ist,in,der,Flagge,Brasiliens,"abgebildet,",wo,er,den,Bundesstaat,Par,repräsentiert,""}	Spika Spica (lateinisch Kornähre), auch α Virginis, Azimech oder Alaraph genannt, ist der hellste Stern im Sternbild Jungfrau und der fünfzehnthellste Stern am nächtlichen Sternenhimmel.\r\n\r\nIm Sternbild Jungfrau stellt Spica die Kornähre in der Hand der Jungfrau dar. In Mesopotamien war Spica unter dšala šubultu (Gott/Göttin Schala, die Kornähre), später auch Göttliche Jungfrau der Kornähre, bekannt. Die Römer glaubten, in Spica die Göttin Ceres zu sehen. Römische Namen sind Spicum, Spigha, Stachys (von gr. stakhum Kornähre) und Aristae Puella (Kornmädchen).\r\n\r\nDie IAU hat am 30. Juni 2016 den Eigennamen Spica als standardisierten Eigennamen festgelegt.[1]\r\n\r\nSpica ist ein bedeckungsveränderlicher Stern vom Typ der Beta-Cephei-Sterne wie der Algol. Die Helligkeit der Spica verändert sich mit einer Periode von 4,0142 Tagen zwischen +0,92 mag und +0,98 mag. Diese geringe Helligkeitsschwankung ist visuell kaum feststellbar.\r\n\r\nBeide Komponenten von Spica gehören zum Spektraltyp B (B1 bis B4), wobei sich der hellere Stern nahe am Ende seiner stabilen Zeit als Hauptreihenstern befindet. Die beiden Sterne gehören zu den heißesten und somit bläulichsten der hellen Sterne am Nachthimmel. Durch die hohe Temperatur wird ein Großteil des Lichtes im unsichtbaren ultravioletten Bereich abgestrahlt.\r\n\r\nDer hellere Stern hat eine Temperatur von 22.400 K und eine 13.500-fache Sonnenleuchtkraft. Der Radius beträgt das 7,8-fache des Sonnenradius und erstreckt sich auf fast 30 % des Abstandes der beiden Sterne. Die Masse des helleren Sternes beträgt das Elffache der Sonne. Das ist genug, um den Stern als Supernova enden zu lassen.\r\n\r\nDer nicht so bekannte weniger helle Begleitstern hat eine Oberflächentemperatur von 18.500 K, 1.700-fache Sonnenleuchtkraft, vierfachen Sonnenradius und etwas weniger als die siebenfache Sonnenmasse.\r\n\r\nSpica kann als ekliptiknaher Stern vom Mond und (sehr selten) von Planeten bedeckt werden. Zum letzten Mal von einem Planeten bedeckt wurde Spica am 10. November 1783 durch die Venus, die nächste Bedeckung wird am 2. September 2197 wieder durch die Venus erfolgen.\r\n\r\nSpica ist in der Flagge Brasiliens abgebildet, wo er den Bundesstaat Pará repräsentiert. 	7	\N	\N
Orion	Das Sternbild liegt auf dem Himmelsäquator zwischen dem Fluss Eridanus und dem Einhorn und ist in Mitteleuropa etwa von August (Morgenhimmel) bis April (Abendhimmel) zu sehen, auf der Südhalbkugel in höheren Breitengraden etwa von Juli (Morgenhimmel) bis Mai (Abendhimmel).\r\n\r\nIm Zyklus der Präzession erscheint es gegenwärtig an seiner fast nördlichsten Stellung, wird seine südlichste in 13.000 Jahren erreichen und dann von Mitteleuropa aus nicht mehr vollständig zu sehen sein.\r\n\r\nDer Orion ist ein mythischer Himmelsjäger, dabei bilden die Sterne Beteigeuze (α Orionis, Bestandteil des Winterdreiecks), und Bellatrix (γ) die Schulter, die Sterne Rigel (β Orionis, Eckpunkt des Wintersechsecks) und Saiph (κ) die Füße. Die Sterne des Gürtels Alnitak, Alnilam und Mintaka (ζ, ε und δ Orionis) in stark überstrecktem Winkel werden auch drei Könige, Jakobsstab oder Jakobsleiter genannt und sind Teil des offenen Sternhaufens Cr 70.\r\n\r\nDie Hauptsterne – abgesehen vom roten Riesen Beteigeuze – weisen ein ähnliches Alter und ähnliche Zustandsgrößen auf, was eine gemeinsame Entstehung vermuten lässt.\r\n\r\nIn der unteren Hälfte in der Mitte des „Schwertgehänges“ des Orion ist der flächenhellste Emissionsnebel als Orionnebel M 42 mit freiem Auge zu sehen. Das ausgeprägte Sternentstehungsgebiet umgibt die Trapezsterne θ1 Orionis und θ2 Orionis und stellt die leuchtende Spitze eines ausgedehnten Wolkenkomplexes interstellarer Materie dar, der das gesamte Sternbild durchzieht. Nördlich über M42 grenzt der Teilnebel M43 an, auch kleiner Orionnebel oder de Mairans Nebel bezeichnet.\r\n\r\nAls „Schwertgehänge“ wird eine Kette von Sternen bezeichnet, die sich von Norden nach Süden aus M42 , θ und ι Orionis zusammensetzt. Nördlich liegt der offene Sternhaufen NGC 1981.\r\n\r\nDer etwa 8° lange Bogen der schwächeren Sterne π1, π2, π3, π4, π5 und π6 Orionis wird in verschiedenen alten Darstellungen als Keule, Bogen und bei Albrecht Dürer als Umhang interpretiert.\r\n\r\nDer Stern Meissa (λ Orionis), der Orions Kopf markiert, befindet sich in dem offenen Sternhaufen Cr 69.\r\n\r\nEtwa ein halbes Grad südlich des linken Gürtelsterns Alnitak befindet sich der berühmte Pferdekopfnebel B 33, eine Dunkelwolke, die sich deutlich vor dem Emissionsnebel IC 434 abzeichnet.\r\n\r\nIm Orion befindet sich auch der Emissionsnebel Barnard’s Loop, der sich in einem weiten Bogen von etwa 12° Durchmesser von Norden her um die Gürtelsterne zieht und im Süden bis nahe Rigel reicht. 	2020-02-11 14:51:03.78117	\N	{Das,Sternbild,liegt,auf,dem,Himmelsäquator,zwischen,dem,Fluss,Eridanus,und,dem,Einhorn,und,ist,in,Mitteleuropa,etwa,von,August,Morgenhimmel,bis,April,Abendhimmel,zu,"sehen,",auf,der,Südhalbkugel,in,höheren,Breitengraden,etwa,von,Juli,Morgenhimmel,bis,Mai,AbendhimmelIm,Zyklus,der,Präzession,erscheint,es,gegenwärtig,an,seiner,fast,nördlichsten,"Stellung,",wird,seine,südlichste,in,13000,Jahren,erreichen,und,dann,von,Mitteleuropa,aus,nicht,mehr,vollständig,zu,sehen,seinDer,Orion,ist,ein,mythischer,"Himmelsjäger,",dabei,bilden,die,Sterne,Beteigeuze,"","Orionis,",Bestandteil,des,"Winterdreiecks,",und,Bellatrix,"",die,"Schulter,",die,Sterne,Rigel,"","Orionis,",Eckpunkt,des,Wintersechsecks,und,Saiph,"",die,Füße,Die,Sterne,des,Gürtels,"Alnitak,",Alnilam,und,Mintaka,",","",und,"",Orionis,in,stark,überstrecktem,Winkel,werden,auch,drei,"Könige,",Jakobsstab,oder,Jakobsleiter,genannt,und,sind,Teil,des,offenen,Sternhaufens,Cr,70Die,Hauptsterne,"",abgesehen,vom,roten,Riesen,Beteigeuze,"",weisen,ein,ähnliches,Alter,und,ähnliche,Zustandsgrößen,"auf,",was,eine,gemeinsame,Entstehung,vermuten,lässtIn,der,unteren,Hälfte,in,der,Mitte,des,Schwertgehänges,des,Orion,ist,der,flächenhellste,Emissionsnebel,als,Orionnebel,M,42,mit,freiem,Auge,zu,sehen,Das,ausgeprägte,Sternentstehungsgebiet,umgibt,die,Trapezsterne,1,Orionis,und,2,Orionis,und,stellt,die,leuchtende,Spitze,eines,ausgedehnten,Wolkenkomplexes,interstellarer,Materie,"dar,",der,das,gesamte,Sternbild,durchzieht,Nördlich,über,M42,grenzt,der,Teilnebel,M43,"an,",auch,kleiner,Orionnebel,oder,de,Mairans,Nebel,bezeichnetAls,Schwertgehänge,wird,eine,Kette,von,Sternen,"bezeichnet,",die,sich,von,Norden,nach,Süden,aus,M42,",","",und,"",Orionis,zusammensetzt,Nördlich,liegt,der,offene,Sternhaufen,NGC,1981Der,etwa,8,lange,Bogen,der,schwächeren,Sterne,"1,","2,","3,","4,",5,und,6,Orionis,wird,in,verschiedenen,alten,Darstellungen,als,"Keule,",Bogen,und,bei,Albrecht,Dürer,als,Umhang,interpretiertDer,Stern,Meissa,"","Orionis,",der,Orions,Kopf,"markiert,",befindet,sich,in,dem,offenen,Sternhaufen,Cr,69Etwa,ein,halbes,Grad,südlich,des,linken,Gürtelsterns,Alnitak,befindet,sich,der,berühmte,Pferdekopfnebel,B,"33,",eine,"Dunkelwolke,",die,sich,deutlich,vor,dem,Emissionsnebel,IC,434,abzeichnetIm,Orion,befindet,sich,auch,der,Emissionsnebel,Barnards,"Loop,",der,sich,in,einem,weiten,Bogen,von,etwa,12,Durchmesser,von,Norden,her,um,die,Gürtelsterne,zieht,und,im,Süden,bis,nahe,Rigel,reicht,""}	Orion Das Sternbild liegt auf dem Himmelsäquator zwischen dem Fluss Eridanus und dem Einhorn und ist in Mitteleuropa etwa von August (Morgenhimmel) bis April (Abendhimmel) zu sehen, auf der Südhalbkugel in höheren Breitengraden etwa von Juli (Morgenhimmel) bis Mai (Abendhimmel).\r\n\r\nIm Zyklus der Präzession erscheint es gegenwärtig an seiner fast nördlichsten Stellung, wird seine südlichste in 13.000 Jahren erreichen und dann von Mitteleuropa aus nicht mehr vollständig zu sehen sein.\r\n\r\nDer Orion ist ein mythischer Himmelsjäger, dabei bilden die Sterne Beteigeuze (α Orionis, Bestandteil des Winterdreiecks), und Bellatrix (γ) die Schulter, die Sterne Rigel (β Orionis, Eckpunkt des Wintersechsecks) und Saiph (κ) die Füße. Die Sterne des Gürtels Alnitak, Alnilam und Mintaka (ζ, ε und δ Orionis) in stark überstrecktem Winkel werden auch drei Könige, Jakobsstab oder Jakobsleiter genannt und sind Teil des offenen Sternhaufens Cr 70.\r\n\r\nDie Hauptsterne – abgesehen vom roten Riesen Beteigeuze – weisen ein ähnliches Alter und ähnliche Zustandsgrößen auf, was eine gemeinsame Entstehung vermuten lässt.\r\n\r\nIn der unteren Hälfte in der Mitte des „Schwertgehänges“ des Orion ist der flächenhellste Emissionsnebel als Orionnebel M 42 mit freiem Auge zu sehen. Das ausgeprägte Sternentstehungsgebiet umgibt die Trapezsterne θ1 Orionis und θ2 Orionis und stellt die leuchtende Spitze eines ausgedehnten Wolkenkomplexes interstellarer Materie dar, der das gesamte Sternbild durchzieht. Nördlich über M42 grenzt der Teilnebel M43 an, auch kleiner Orionnebel oder de Mairans Nebel bezeichnet.\r\n\r\nAls „Schwertgehänge“ wird eine Kette von Sternen bezeichnet, die sich von Norden nach Süden aus M42 , θ und ι Orionis zusammensetzt. Nördlich liegt der offene Sternhaufen NGC 1981.\r\n\r\nDer etwa 8° lange Bogen der schwächeren Sterne π1, π2, π3, π4, π5 und π6 Orionis wird in verschiedenen alten Darstellungen als Keule, Bogen und bei Albrecht Dürer als Umhang interpretiert.\r\n\r\nDer Stern Meissa (λ Orionis), der Orions Kopf markiert, befindet sich in dem offenen Sternhaufen Cr 69.\r\n\r\nEtwa ein halbes Grad südlich des linken Gürtelsterns Alnitak befindet sich der berühmte Pferdekopfnebel B 33, eine Dunkelwolke, die sich deutlich vor dem Emissionsnebel IC 434 abzeichnet.\r\n\r\nIm Orion befindet sich auch der Emissionsnebel Barnard’s Loop, der sich in einem weiten Bogen von etwa 12° Durchmesser von Norden her um die Gürtelsterne zieht und im Süden bis nahe Rigel reicht. 	8	\N	\N
Mars	Der Mars ist, von der Sonne aus gezählt, der vierte Planet im Sonnensystem und der äußere Nachbar der Erde. Er zählt zu den erdähnlichen (terrestrischen) Planeten.\r\n\r\nSein Durchmesser ist mit knapp 6800 Kilometern etwa halb so groß wie der der Erde, sein Volumen beträgt gut ein Siebtel des Erdvolumens. Damit ist der Mars nach dem Merkur der zweitkleinste Planet des Sonnensystems, hat jedoch eine vielfältige Geologie und die höchsten Vulkane des Sonnensystems. Mit einer durchschnittlichen Entfernung von 228 Millionen Kilometern ist er rund 1,5-mal so weit von der Sonne entfernt wie die Erde.\r\n\r\nDie Masse des Mars beträgt etwa ein Zehntel der Erdmasse. Die Fallbeschleunigung auf seiner Oberfläche beträgt 3,69 m/s², dies entspricht etwa 38 % der irdischen. Mit einer Dichte von 3,9 g/cm³ weist der Mars den geringsten Wert der terrestrischen Planeten auf. Deshalb ist die Schwerkraft auf ihm sogar geringfügig niedriger als auf dem kleineren, jedoch dichteren Merkur.\r\n\r\nDer Mars wird oft auch als der Rote Planet bezeichnet. Diese Färbung geht auf Eisenoxid-Staub (Rost) zurück, der sich auf der Oberfläche und in der dünnen CO2-Atmosphäre verteilt hat. Seine orange- bis blutrote Farbe und seine Helligkeitsschwankungen am irdischen Nachthimmel sind auch der Grund für seine Namensgebung nach dem römischen Kriegsgott Mars.[3]\r\n\r\nIn größeren Fernrohren deutlich sichtbar sind die zwei Polkappen und mehrere dunkle Ebenen, die sich im Frühjahr etwas verfärben. Fotos von Raumsonden zeigen eine teilweise mit Kratern bedeckte Oberfläche und starke Spuren früherer Tektonik (tiefe Canyons und einen über 20 km hohen Vulkan). Marsroboter haben schon mehrere Gebiete geologisch untersucht.\r\n\r\nDer Mars besitzt zwei kleine, unregelmäßig geformte Monde, die 1877 entdeckt wurden: Phobos und Deimos (griechisch für Furcht und Schrecken).\r\n\r\nDas astronomische Symbol des Mars ist ♂. 	2020-02-11 14:51:54.860224	\N	{Der,Mars,"ist,",von,der,Sonne,aus,"gezählt,",der,vierte,Planet,im,Sonnensystem,und,der,äußere,Nachbar,der,Erde,Er,zählt,zu,den,erdähnlichen,terrestrischen,PlanetenSein,Durchmesser,ist,mit,knapp,6800,Kilometern,etwa,halb,so,groß,wie,der,der,"Erde,",sein,Volumen,beträgt,gut,ein,Siebtel,des,Erdvolumens,Damit,ist,der,Mars,nach,dem,Merkur,der,zweitkleinste,Planet,des,"Sonnensystems,",hat,jedoch,eine,vielfältige,Geologie,und,die,höchsten,Vulkane,des,Sonnensystems,Mit,einer,durchschnittlichen,Entfernung,von,228,Millionen,Kilometern,ist,er,rund,"1,5mal",so,weit,von,der,Sonne,entfernt,wie,die,ErdeDie,Masse,des,Mars,beträgt,etwa,ein,Zehntel,der,Erdmasse,Die,Fallbeschleunigung,auf,seiner,Oberfläche,beträgt,"3,69","ms,",dies,entspricht,etwa,38,"",der,irdischen,Mit,einer,Dichte,von,"3,9",gcm,weist,der,Mars,den,geringsten,Wert,der,terrestrischen,Planeten,auf,Deshalb,ist,die,Schwerkraft,auf,ihm,sogar,geringfügig,niedriger,als,auf,dem,"kleineren,",jedoch,dichteren,MerkurDer,Mars,wird,oft,auch,als,der,Rote,Planet,bezeichnet,Diese,Färbung,geht,auf,EisenoxidStaub,Rost,"zurück,",der,sich,auf,der,Oberfläche,und,in,der,dünnen,CO2Atmosphäre,verteilt,hat,Seine,orange,bis,blutrote,Farbe,und,seine,Helligkeitsschwankungen,am,irdischen,Nachthimmel,sind,auch,der,Grund,für,seine,Namensgebung,nach,dem,römischen,Kriegsgott,Mars3In,größeren,Fernrohren,deutlich,sichtbar,sind,die,zwei,Polkappen,und,mehrere,dunkle,"Ebenen,",die,sich,im,Frühjahr,etwas,verfärben,Fotos,von,Raumsonden,zeigen,eine,teilweise,mit,Kratern,bedeckte,Oberfläche,und,starke,Spuren,früherer,Tektonik,tiefe,Canyons,und,einen,über,20,km,hohen,Vulkan,Marsroboter,haben,schon,mehrere,Gebiete,geologisch,untersuchtDer,Mars,besitzt,zwei,"kleine,",unregelmäßig,geformte,"Monde,",die,1877,entdeckt,wurden,Phobos,und,Deimos,griechisch,für,Furcht,und,SchreckenDas,astronomische,Symbol,des,Mars,ist,"",""}	Mars Der Mars ist, von der Sonne aus gezählt, der vierte Planet im Sonnensystem und der äußere Nachbar der Erde. Er zählt zu den erdähnlichen (terrestrischen) Planeten.\r\n\r\nSein Durchmesser ist mit knapp 6800 Kilometern etwa halb so groß wie der der Erde, sein Volumen beträgt gut ein Siebtel des Erdvolumens. Damit ist der Mars nach dem Merkur der zweitkleinste Planet des Sonnensystems, hat jedoch eine vielfältige Geologie und die höchsten Vulkane des Sonnensystems. Mit einer durchschnittlichen Entfernung von 228 Millionen Kilometern ist er rund 1,5-mal so weit von der Sonne entfernt wie die Erde.\r\n\r\nDie Masse des Mars beträgt etwa ein Zehntel der Erdmasse. Die Fallbeschleunigung auf seiner Oberfläche beträgt 3,69 m/s², dies entspricht etwa 38 % der irdischen. Mit einer Dichte von 3,9 g/cm³ weist der Mars den geringsten Wert der terrestrischen Planeten auf. Deshalb ist die Schwerkraft auf ihm sogar geringfügig niedriger als auf dem kleineren, jedoch dichteren Merkur.\r\n\r\nDer Mars wird oft auch als der Rote Planet bezeichnet. Diese Färbung geht auf Eisenoxid-Staub (Rost) zurück, der sich auf der Oberfläche und in der dünnen CO2-Atmosphäre verteilt hat. Seine orange- bis blutrote Farbe und seine Helligkeitsschwankungen am irdischen Nachthimmel sind auch der Grund für seine Namensgebung nach dem römischen Kriegsgott Mars.[3]\r\n\r\nIn größeren Fernrohren deutlich sichtbar sind die zwei Polkappen und mehrere dunkle Ebenen, die sich im Frühjahr etwas verfärben. Fotos von Raumsonden zeigen eine teilweise mit Kratern bedeckte Oberfläche und starke Spuren früherer Tektonik (tiefe Canyons und einen über 20 km hohen Vulkan). Marsroboter haben schon mehrere Gebiete geologisch untersucht.\r\n\r\nDer Mars besitzt zwei kleine, unregelmäßig geformte Monde, die 1877 entdeckt wurden: Phobos und Deimos (griechisch für Furcht und Schrecken).\r\n\r\nDas astronomische Symbol des Mars ist ♂. 	9	\N	\N
Venus	Die Venus ist mit einer durchschnittlichen Sonnenentfernung von 108 Millionen Kilometern der zweitinnerste und mit einem Durchmesser von ca. 12.100 Kilometern der drittkleinste Planet des Sonnensystems. Sie zählt zu den vier erdähnlichen Planeten, die auch terrestrische oder Gesteinsplaneten genannt werden.\r\n\r\nDie Venus ist der Planet, der auf seiner Umlaufbahn der Erdbahn mit einem minimalen Abstand von 38 Millionen Kilometern am nächsten kommt. Sie hat eine ähnliche Größe wie die Erde, unterscheidet sich aber in Bezug auf die Geologie und vor allem hinsichtlich ihrer Atmosphäre. Diese besteht zu 96 % aus CO2, und ihr Oberflächendruck ist 90-mal höher als auf der Erde.\r\n\r\nNach dem Mond ist die Venus das hellste Gestirn am nächtlichen Himmel. Weil sie als einer der unteren Planeten nur am Morgen- oder Abendhimmel sichtbar ist und nie gegen Mitternacht, wird sie auch Morgenstern und Abendstern genannt. Schon mit einem kleinen Fernrohr ist sie auch am Taghimmel beobachtbar, manchmal sogar freiäugig. Doch auch bei Erdnähe (ca. alle 1½ Jahre) lassen sich nur die Wolkenstreifen der äußerst dichten Atmosphäre erkennen. Die Erkundung der Oberfläche erfordert Radar.\r\n\r\nDas astronomische Symbol des Planeten Venus gilt als stilisierte Repräsentation des Handspiegels der namensgebenden römischen Liebesgöttin Venus: ♀[3] 	2020-02-11 14:52:41.527601	\N	{Die,Venus,ist,mit,einer,durchschnittlichen,Sonnenentfernung,von,108,Millionen,Kilometern,der,zweitinnerste,und,mit,einem,Durchmesser,von,ca,12100,Kilometern,der,drittkleinste,Planet,des,Sonnensystems,Sie,zählt,zu,den,vier,erdähnlichen,"Planeten,",die,auch,terrestrische,oder,Gesteinsplaneten,genannt,werdenDie,Venus,ist,der,"Planet,",der,auf,seiner,Umlaufbahn,der,Erdbahn,mit,einem,minimalen,Abstand,von,38,Millionen,Kilometern,am,nächsten,kommt,Sie,hat,eine,ähnliche,Größe,wie,die,"Erde,",unterscheidet,sich,aber,in,Bezug,auf,die,Geologie,und,vor,allem,hinsichtlich,ihrer,Atmosphäre,Diese,besteht,zu,96,"",aus,"CO2,",und,ihr,Oberflächendruck,ist,90mal,höher,als,auf,der,ErdeNach,dem,Mond,ist,die,Venus,das,hellste,Gestirn,am,nächtlichen,Himmel,Weil,sie,als,einer,der,unteren,Planeten,nur,am,Morgen,oder,Abendhimmel,sichtbar,ist,und,nie,gegen,"Mitternacht,",wird,sie,auch,Morgenstern,und,Abendstern,genannt,Schon,mit,einem,kleinen,Fernrohr,ist,sie,auch,am,Taghimmel,"beobachtbar,",manchmal,sogar,freiäugig,Doch,auch,bei,Erdnähe,ca,alle,1,Jahre,lassen,sich,nur,die,Wolkenstreifen,der,äußerst,dichten,Atmosphäre,erkennen,Die,Erkundung,der,Oberfläche,erfordert,RadarDas,astronomische,Symbol,des,Planeten,Venus,gilt,als,stilisierte,Repräsentation,des,Handspiegels,der,namensgebenden,römischen,Liebesgöttin,Venus,3,""}	Venus Die Venus ist mit einer durchschnittlichen Sonnenentfernung von 108 Millionen Kilometern der zweitinnerste und mit einem Durchmesser von ca. 12.100 Kilometern der drittkleinste Planet des Sonnensystems. Sie zählt zu den vier erdähnlichen Planeten, die auch terrestrische oder Gesteinsplaneten genannt werden.\r\n\r\nDie Venus ist der Planet, der auf seiner Umlaufbahn der Erdbahn mit einem minimalen Abstand von 38 Millionen Kilometern am nächsten kommt. Sie hat eine ähnliche Größe wie die Erde, unterscheidet sich aber in Bezug auf die Geologie und vor allem hinsichtlich ihrer Atmosphäre. Diese besteht zu 96 % aus CO2, und ihr Oberflächendruck ist 90-mal höher als auf der Erde.\r\n\r\nNach dem Mond ist die Venus das hellste Gestirn am nächtlichen Himmel. Weil sie als einer der unteren Planeten nur am Morgen- oder Abendhimmel sichtbar ist und nie gegen Mitternacht, wird sie auch Morgenstern und Abendstern genannt. Schon mit einem kleinen Fernrohr ist sie auch am Taghimmel beobachtbar, manchmal sogar freiäugig. Doch auch bei Erdnähe (ca. alle 1½ Jahre) lassen sich nur die Wolkenstreifen der äußerst dichten Atmosphäre erkennen. Die Erkundung der Oberfläche erfordert Radar.\r\n\r\nDas astronomische Symbol des Planeten Venus gilt als stilisierte Repräsentation des Handspiegels der namensgebenden römischen Liebesgöttin Venus: ♀[3] 	10	\N	\N
Jupiter	Jupiter ist mit einem Äquatordurchmesser von rund 143.000 Kilometern der größte Planet des Sonnensystems. Mit einer durchschnittlichen Entfernung von 778 Millionen Kilometern ist er von der Sonne aus gesehen der fünfte Planet. Er ist nach dem römischen Hauptgott Jupiter benannt.\r\n\r\nEr hat keine sichtbare feste Oberfläche. Aufgrund seiner chemischen Zusammensetzung zählt Jupiter zu den Gasplaneten. Diese „Gasriesen“ bilden im Sonnensystem die Gruppe der äußeren Planeten; sie werden auch als jupiterähnliche (jovianische) Planeten bezeichnet. In dieser Gruppe ist Jupiter der innerste Planet; er läuft jenseits des Asteroidengürtels um die Sonne.\r\n\r\n2018 waren 79 Monde des Jupiter bekannt. Die vier größten sogenannten Galileischen Monde Ganymed, Kallisto, Io und Europa haben Durchmesser zwischen 5262 und 3122 km und wurden bereits 1610 entdeckt.\r\n\r\nJupiter ist das dritt- bis vierthellste Objekt des Nachthimmels (nach Mond und Venus; abhängig von der Bahnkonstellation ist bisweilen auch Mars heller). In Babylonien galt er wegen seines goldgelben Lichts als Königsstern (siehe auch Stern von Betlehem). Sein astronomisches Symbol ist ♃. 	2020-02-11 10:11:24.710961	\N	{Jupiter,ist,mit,einem,quatordurchmesser,von,rund,143000,Kilometern,der,größte,Planet,des,Sonnensystems,Mit,einer,durchschnittlichen,Entfernung,von,778,Millionen,Kilometern,ist,er,von,der,Sonne,aus,gesehen,der,fünfte,Planet,Er,ist,nach,dem,römischen,Hauptgott,Jupiter,benanntEr,hat,keine,sichtbare,feste,Oberfläche,Aufgrund,seiner,chemischen,Zusammensetzung,zählt,Jupiter,zu,den,Gasplaneten,Diese,Gasriesen,bilden,im,Sonnensystem,die,Gruppe,der,äußeren,Planeten,sie,werden,auch,als,jupiterähnliche,jovianische,Planeten,bezeichnet,In,dieser,Gruppe,ist,Jupiter,der,innerste,Planet,er,läuft,jenseits,des,Asteroidengürtels,um,die,Sonne2018,waren,79,Monde,des,Jupiter,bekannt,Die,vier,größten,sogenannten,Galileischen,Monde,"Ganymed,","Kallisto,",Io,und,Europa,haben,Durchmesser,zwischen,5262,und,3122,km,und,wurden,bereits,1610,entdecktJupiter,ist,das,dritt,bis,vierthellste,Objekt,des,Nachthimmels,nach,Mond,und,Venus,abhängig,von,der,Bahnkonstellation,ist,bisweilen,auch,Mars,heller,In,Babylonien,galt,er,wegen,seines,goldgelben,Lichts,als,Königsstern,siehe,auch,Stern,von,Betlehem,Sein,astronomisches,Symbol,ist,"",""}	Jupiter Jupiter ist mit einem Äquatordurchmesser von rund 143.000 Kilometern der größte Planet des Sonnensystems. Mit einer durchschnittlichen Entfernung von 778 Millionen Kilometern ist er von der Sonne aus gesehen der fünfte Planet. Er ist nach dem römischen Hauptgott Jupiter benannt.\r\n\r\nEr hat keine sichtbare feste Oberfläche. Aufgrund seiner chemischen Zusammensetzung zählt Jupiter zu den Gasplaneten. Diese „Gasriesen“ bilden im Sonnensystem die Gruppe der äußeren Planeten; sie werden auch als jupiterähnliche (jovianische) Planeten bezeichnet. In dieser Gruppe ist Jupiter der innerste Planet; er läuft jenseits des Asteroidengürtels um die Sonne.\r\n\r\n2018 waren 79 Monde des Jupiter bekannt. Die vier größten sogenannten Galileischen Monde Ganymed, Kallisto, Io und Europa haben Durchmesser zwischen 5262 und 3122 km und wurden bereits 1610 entdeckt.\r\n\r\nJupiter ist das dritt- bis vierthellste Objekt des Nachthimmels (nach Mond und Venus; abhängig von der Bahnkonstellation ist bisweilen auch Mars heller). In Babylonien galt er wegen seines goldgelben Lichts als Königsstern (siehe auch Stern von Betlehem). Sein astronomisches Symbol ist ♃. 	2	\N	\N
Poseidon	Poseidon (griechisch Ποσειδῶν Poseidṓn) ist in der griechischen Mythologie der Gott des Meeres, Bruder des Zeus und eine der zwölf olympischen Gottheiten, den Olympioi. Das Pferd ist ihm heilig, weshalb Hippios (lateinisch Hippius) einer seiner Beinamen ist.\r\n\r\nIn der etruskischen Mythologie wurde er dem Nethuns gleichgesetzt, in der römischen dem Neptun. In der Tiefe des Meeres steht sein kristallener Palast. 	2020-02-11 14:53:28.958975	\N	{Poseidon,griechisch,"",Poseidn,ist,in,der,griechischen,Mythologie,der,Gott,des,"Meeres,",Bruder,des,Zeus,und,eine,der,zwölf,olympischen,"Gottheiten,",den,Olympioi,Das,Pferd,ist,ihm,"heilig,",weshalb,Hippios,lateinisch,Hippius,einer,seiner,Beinamen,istIn,der,etruskischen,Mythologie,wurde,er,dem,Nethuns,"gleichgesetzt,",in,der,römischen,dem,Neptun,In,der,Tiefe,des,Meeres,steht,sein,kristallener,Palast,""}	Poseidon Poseidon (griechisch Ποσειδῶν Poseidṓn) ist in der griechischen Mythologie der Gott des Meeres, Bruder des Zeus und eine der zwölf olympischen Gottheiten, den Olympioi. Das Pferd ist ihm heilig, weshalb Hippios (lateinisch Hippius) einer seiner Beinamen ist.\r\n\r\nIn der etruskischen Mythologie wurde er dem Nethuns gleichgesetzt, in der römischen dem Neptun. In der Tiefe des Meeres steht sein kristallener Palast. 	11	\N	\N
Cäsar	Gaius Iulius Caesar (deutsch: Gaius Julius Cäsar; * 13. Juli[1] 100 v. Chr. in Rom; † 15. März 44 v. Chr. in Rom) war ein römischer Staatsmann, Feldherr und Autor, der maßgeblich zum Ende der Römischen Republik beitrug und dadurch an ihrer späteren Umwandlung in ein Kaiserreich beteiligt war.\r\n\r\nDer patrizischen Familie der Julier entstammend, absolvierte er die Ämterlaufbahn und gelangte durch ein Bündnis mit dem reichen Marcus Licinius Crassus und dem erfolgreichen Militär Gnaeus Pompeius Magnus im Jahr 59 v. Chr. zum Konsulat. In den folgenden Jahren ging Caesar als Prokonsul in die nördlichen Provinzen Illyrien und Gallia Cis- und Transalpina, von wo aus er in den Jahren 58 bis 51 v. Chr. ganz Gallien bis zum Rhein eroberte. Im anschließenden Römischen Bürgerkrieg von 49 bis 45 v. Chr. setzte er sich gegen seinen ehemaligen Verbündeten Pompeius und dessen Anhänger durch und errang die Alleinherrschaft. Nach seiner Ernennung zum Diktator auf Lebenszeit fiel er einem Attentat zum Opfer. Sein Großneffe und Haupterbe Gaius Octavius (später Kaiser Augustus) setzte das Prinzipat als neue Staatsform des Römischen Reiches endgültig durch.\r\n\r\nDer Name Caesars wurde zum Bestandteil des Titels aller nachfolgenden Herrscher des römischen Kaiserreichs. In der römischen Spätantike und im Byzantinischen Reich bezeichnete der Titel „Caesar“ einen Mitherrscher oder Thronfolger. In den entlehnten Formen Kaiser und Zar wurde der Name später auch zum Titel der Herrscher des Heiligen Römischen, des Österreichischen, des Deutschen, des Bulgarischen, des Serbischen und des Russischen Reiches. 	2020-02-11 14:53:51.670182	\N	{Gaius,Iulius,Caesar,deutsch,Gaius,Julius,Cäsar,"",13,Juli1,100,v,Chr,in,Rom,"",15,März,44,v,Chr,in,Rom,war,ein,römischer,"Staatsmann,",Feldherr,und,"Autor,",der,maßgeblich,zum,Ende,der,Römischen,Republik,beitrug,und,dadurch,an,ihrer,späteren,Umwandlung,in,ein,Kaiserreich,beteiligt,warDer,patrizischen,Familie,der,Julier,"entstammend,",absolvierte,er,die,mterlaufbahn,und,gelangte,durch,ein,Bündnis,mit,dem,reichen,Marcus,Licinius,Crassus,und,dem,erfolgreichen,Militär,Gnaeus,Pompeius,Magnus,im,Jahr,59,v,Chr,zum,Konsulat,In,den,folgenden,Jahren,ging,Caesar,als,Prokonsul,in,die,nördlichen,Provinzen,Illyrien,und,Gallia,Cis,und,"Transalpina,",von,wo,aus,er,in,den,Jahren,58,bis,51,v,Chr,ganz,Gallien,bis,zum,Rhein,eroberte,Im,anschließenden,Römischen,Bürgerkrieg,von,49,bis,45,v,Chr,setzte,er,sich,gegen,seinen,ehemaligen,Verbündeten,Pompeius,und,dessen,Anhänger,durch,und,errang,die,Alleinherrschaft,Nach,seiner,Ernennung,zum,Diktator,auf,Lebenszeit,fiel,er,einem,Attentat,zum,Opfer,Sein,Großneffe,und,Haupterbe,Gaius,Octavius,später,Kaiser,Augustus,setzte,das,Prinzipat,als,neue,Staatsform,des,Römischen,Reiches,endgültig,durchDer,Name,Caesars,wurde,zum,Bestandteil,des,Titels,aller,nachfolgenden,Herrscher,des,römischen,Kaiserreichs,In,der,römischen,Spätantike,und,im,Byzantinischen,Reich,bezeichnete,der,Titel,Caesar,einen,Mitherrscher,oder,Thronfolger,In,den,entlehnten,Formen,Kaiser,und,Zar,wurde,der,Name,später,auch,zum,Titel,der,Herrscher,des,Heiligen,"Römischen,",des,"sterreichischen,",des,"Deutschen,",des,"Bulgarischen,",des,Serbischen,und,des,Russischen,Reiches,""}	Cäsar Gaius Iulius Caesar (deutsch: Gaius Julius Cäsar; * 13. Juli[1] 100 v. Chr. in Rom; † 15. März 44 v. Chr. in Rom) war ein römischer Staatsmann, Feldherr und Autor, der maßgeblich zum Ende der Römischen Republik beitrug und dadurch an ihrer späteren Umwandlung in ein Kaiserreich beteiligt war.\r\n\r\nDer patrizischen Familie der Julier entstammend, absolvierte er die Ämterlaufbahn und gelangte durch ein Bündnis mit dem reichen Marcus Licinius Crassus und dem erfolgreichen Militär Gnaeus Pompeius Magnus im Jahr 59 v. Chr. zum Konsulat. In den folgenden Jahren ging Caesar als Prokonsul in die nördlichen Provinzen Illyrien und Gallia Cis- und Transalpina, von wo aus er in den Jahren 58 bis 51 v. Chr. ganz Gallien bis zum Rhein eroberte. Im anschließenden Römischen Bürgerkrieg von 49 bis 45 v. Chr. setzte er sich gegen seinen ehemaligen Verbündeten Pompeius und dessen Anhänger durch und errang die Alleinherrschaft. Nach seiner Ernennung zum Diktator auf Lebenszeit fiel er einem Attentat zum Opfer. Sein Großneffe und Haupterbe Gaius Octavius (später Kaiser Augustus) setzte das Prinzipat als neue Staatsform des Römischen Reiches endgültig durch.\r\n\r\nDer Name Caesars wurde zum Bestandteil des Titels aller nachfolgenden Herrscher des römischen Kaiserreichs. In der römischen Spätantike und im Byzantinischen Reich bezeichnete der Titel „Caesar“ einen Mitherrscher oder Thronfolger. In den entlehnten Formen Kaiser und Zar wurde der Name später auch zum Titel der Herrscher des Heiligen Römischen, des Österreichischen, des Deutschen, des Bulgarischen, des Serbischen und des Russischen Reiches. 	12	\N	\N
Peter-Prinzip	Peters These ist, dass jedes Mitglied einer ausreichend komplexen Hierarchie so lange befördert wird, solange es auf seiner Position erfolgreich ist. Übersteigen die Anforderungen der neuen Position aber die Fähigkeiten, bleiben weitere Beförderungen aus. Umgekehrt bleiben Mitglieder, deren Fähigkeiten für eine höhere Position geeignet wären, schon in den unteren Stufen hängen, in denen sie weniger erfolgreich sind: Dadurch markiert in der Regel das persönliche Maximum der Karriere­leiter das Maß einer maximalen Unfähigkeit innerhalb der Hierarchie. Peter konstatiert: „Nach einer gewissen Zeit wird jede Position von einem Mitarbeiter besetzt, der unfähig ist, seine Aufgabe zu erfüllen.“[2]\r\n\r\nDie einzige Einschränkung ist, dass die Hierarchie hoch genug ist, also genügend Hierarchie-Stufen enthalten muss. In dem Buch von Peter und Hull werden viele Beispiele für Hierarchien in Wirtschaft und Verwaltung sowie die Unfähigkeit der dort Beschäftigten beschrieben. Seine konkreten Erfahrungen mit Hierarchien hat Peter hauptsächlich aus der kanadischen Schulverwaltung.\r\n\r\nWeiterhin werden die Modelle der „geräuschlosen Sublimierung“ und der „seitlichen Arabeske“ beschrieben. Bei erstgenanntem Modell wird eine Beförderung eines als unfähig bekannten Angestellten nur deshalb durchgeführt, weil unter den anderen Mitarbeitern ein Anreiz ausgelöst werden soll, dass jeder auch befördert werden kann. Hierdurch wird eine Stabilisierung der Hierarchie erreicht. Bei Letzterem werden etwa Titel oder Abteilungen ohne Kompetenzen geschaffen, die es vorher nicht gab, um einen unfähigen Mitarbeiter quasi „auszulagern“.[4]\r\n\r\nDie Verteilung der Stufen der Inkompetenz stellt Peter anhand der Gaußschen Normalverteilung dar. Es stellt sich damit die Frage, wer in einer solchen Hierarchie die Arbeit leistet. Peter ist der Meinung, dass nicht alle zur gleichen Zeit ihre Stufe der Unfähigkeit erreichen: „Die Arbeit wird von den Mitarbeitern erledigt, die ihre Stufe der Inkompetenz noch nicht erreicht haben.“[2]\r\n\r\nEs schließt mit der These, dass man seine Energie vielleicht sinnvoller auf die Vermeidung einer Karriere verwenden sollte. 	2020-02-11 14:55:01.34063	\N	{Peters,These,"ist,",dass,jedes,Mitglied,einer,ausreichend,komplexen,Hierarchie,so,lange,befördert,"wird,",solange,es,auf,seiner,Position,erfolgreich,ist,bersteigen,die,Anforderungen,der,neuen,Position,aber,die,"Fähigkeiten,",bleiben,weitere,Beförderungen,aus,Umgekehrt,bleiben,"Mitglieder,",deren,Fähigkeiten,für,eine,höhere,Position,geeignet,"wären,",schon,in,den,unteren,Stufen,"hängen,",in,denen,sie,weniger,erfolgreich,sind,Dadurch,markiert,in,der,Regel,das,persönliche,Maximum,der,Karriereleiter,das,Maß,einer,maximalen,Unfähigkeit,innerhalb,der,Hierarchie,Peter,konstatiert,Nach,einer,gewissen,Zeit,wird,jede,Position,von,einem,Mitarbeiter,"besetzt,",der,unfähig,"ist,",seine,Aufgabe,zu,erfüllen2Die,einzige,Einschränkung,"ist,",dass,die,Hierarchie,hoch,genug,"ist,",also,genügend,HierarchieStufen,enthalten,muss,In,dem,Buch,von,Peter,und,Hull,werden,viele,Beispiele,für,Hierarchien,in,Wirtschaft,und,Verwaltung,sowie,die,Unfähigkeit,der,dort,Beschäftigten,beschrieben,Seine,konkreten,Erfahrungen,mit,Hierarchien,hat,Peter,hauptsächlich,aus,der,kanadischen,SchulverwaltungWeiterhin,werden,die,Modelle,der,geräuschlosen,Sublimierung,und,der,seitlichen,Arabeske,beschrieben,Bei,erstgenanntem,Modell,wird,eine,Beförderung,eines,als,unfähig,bekannten,Angestellten,nur,deshalb,"durchgeführt,",weil,unter,den,anderen,Mitarbeitern,ein,Anreiz,ausgelöst,werden,"soll,",dass,jeder,auch,befördert,werden,kann,Hierdurch,wird,eine,Stabilisierung,der,Hierarchie,erreicht,Bei,Letzterem,werden,etwa,Titel,oder,Abteilungen,ohne,Kompetenzen,"geschaffen,",die,es,vorher,nicht,"gab,",um,einen,unfähigen,Mitarbeiter,quasi,auszulagern4Die,Verteilung,der,Stufen,der,Inkompetenz,stellt,Peter,anhand,der,Gaußschen,Normalverteilung,dar,Es,stellt,sich,damit,die,"Frage,",wer,in,einer,solchen,Hierarchie,die,Arbeit,leistet,Peter,ist,der,"Meinung,",dass,nicht,alle,zur,gleichen,Zeit,ihre,Stufe,der,Unfähigkeit,erreichen,Die,Arbeit,wird,von,den,Mitarbeitern,"erledigt,",die,ihre,Stufe,der,Inkompetenz,noch,nicht,erreicht,haben2Es,schließt,mit,der,"These,",dass,man,seine,Energie,vielleicht,sinnvoller,auf,die,Vermeidung,einer,Karriere,verwenden,sollte,""}	Peter-Prinzip Peters These ist, dass jedes Mitglied einer ausreichend komplexen Hierarchie so lange befördert wird, solange es auf seiner Position erfolgreich ist. Übersteigen die Anforderungen der neuen Position aber die Fähigkeiten, bleiben weitere Beförderungen aus. Umgekehrt bleiben Mitglieder, deren Fähigkeiten für eine höhere Position geeignet wären, schon in den unteren Stufen hängen, in denen sie weniger erfolgreich sind: Dadurch markiert in der Regel das persönliche Maximum der Karriere­leiter das Maß einer maximalen Unfähigkeit innerhalb der Hierarchie. Peter konstatiert: „Nach einer gewissen Zeit wird jede Position von einem Mitarbeiter besetzt, der unfähig ist, seine Aufgabe zu erfüllen.“[2]\r\n\r\nDie einzige Einschränkung ist, dass die Hierarchie hoch genug ist, also genügend Hierarchie-Stufen enthalten muss. In dem Buch von Peter und Hull werden viele Beispiele für Hierarchien in Wirtschaft und Verwaltung sowie die Unfähigkeit der dort Beschäftigten beschrieben. Seine konkreten Erfahrungen mit Hierarchien hat Peter hauptsächlich aus der kanadischen Schulverwaltung.\r\n\r\nWeiterhin werden die Modelle der „geräuschlosen Sublimierung“ und der „seitlichen Arabeske“ beschrieben. Bei erstgenanntem Modell wird eine Beförderung eines als unfähig bekannten Angestellten nur deshalb durchgeführt, weil unter den anderen Mitarbeitern ein Anreiz ausgelöst werden soll, dass jeder auch befördert werden kann. Hierdurch wird eine Stabilisierung der Hierarchie erreicht. Bei Letzterem werden etwa Titel oder Abteilungen ohne Kompetenzen geschaffen, die es vorher nicht gab, um einen unfähigen Mitarbeiter quasi „auszulagern“.[4]\r\n\r\nDie Verteilung der Stufen der Inkompetenz stellt Peter anhand der Gaußschen Normalverteilung dar. Es stellt sich damit die Frage, wer in einer solchen Hierarchie die Arbeit leistet. Peter ist der Meinung, dass nicht alle zur gleichen Zeit ihre Stufe der Unfähigkeit erreichen: „Die Arbeit wird von den Mitarbeitern erledigt, die ihre Stufe der Inkompetenz noch nicht erreicht haben.“[2]\r\n\r\nEs schließt mit der These, dass man seine Energie vielleicht sinnvoller auf die Vermeidung einer Karriere verwenden sollte. 	13	\N	\N
Dunnig-Kruger-Effekt	Die Neigung stammt von der Unfähigkeit ab, mittels der Metakognition sich selbst objektiv beurteilen zu können. Der populärwissenschaftliche Begriff geht auf eine Publikation von David Dunning und Justin Kruger aus dem Jahr 1999 zurück. Dunning und Kruger hatten in vorausgegangenen Studien bemerkt, dass etwa beim Erfassen von Texten, beim Schachspielen oder Autofahren Unwissenheit oft zu mehr Selbstvertrauen führt als Wissen.[3]\r\n\r\nAn der Cornell University erforschten die beiden Wissenschaftler diesen Effekt in weiteren Experimenten und kamen 1999 zum Resultat, dass weniger kompetente Personen\r\n\r\n    dazu neigen, ihre eigenen Fähigkeiten zu überschätzen,\r\n    überlegene Fähigkeiten bei anderen nicht erkennen,\r\n    das Ausmaß ihrer Inkompetenz nicht zu erkennen vermögen,\r\n    durch Bildung oder Übung nicht nur ihre Kompetenz steigern, sondern auch lernen können, sich und andere besser einzuschätzen.\r\n\r\nDunning und Kruger zeigten, dass schwache Leistungen bei solchen Menschen häufig mit größerer Selbstüberschätzung einhergehen als stärkere Leistungen.\r\n\r\n    „Wenn jemand inkompetent ist, dann kann er nicht wissen, dass er inkompetent ist. […] Die Fähigkeiten, die man braucht, um eine richtige Lösung zu finden, [sind] genau jene Fähigkeiten, die man braucht, um eine Lösung als richtig zu erkennen.“\r\n\r\n– David Dunning[4]\r\n\r\nIn der psychologischen Fachliteratur wird der Dunning-Kruger-Effekt nur selten angeführt, in Blogs und Diskussionsforen des Internets und in akademischen Publikationen außerhalb der Psychologie hingegen häufig.[5][6][7][8] In einer kognitionswissenschaftlichen Publikation zur Leugnung der menschengemachten globalen Erwärmung wird der Dunning-Kruger-Effekt als eine mögliche Erklärung für die Ignoranz gegenüber wissenschaftlichen Prozessen genannt.[9]\r\n\r\nIm Jahr 2000 erhielten Dunning und Kruger für ihre Studie den satirischen Ig-Nobelpreis im Bereich Psychologie.[10] 	2020-02-11 14:56:07.774088	2020-02-11 14:56:24.889097	{Die,Neigung,stammt,von,der,Unfähigkeit,"ab,",mittels,der,Metakognition,sich,selbst,objektiv,beurteilen,zu,können,Der,populärwissenschaftliche,Begriff,geht,auf,eine,Publikation,von,David,Dunning,und,Justin,Kruger,aus,dem,Jahr,1999,zurück,Dunning,und,Kruger,hatten,in,vorausgegangenen,Studien,"bemerkt,",dass,etwa,beim,Erfassen,von,"Texten,",beim,Schachspielen,oder,Autofahren,Unwissenheit,oft,zu,mehr,Selbstvertrauen,führt,als,Wissen3An,der,Cornell,University,erforschten,die,beiden,Wissenschaftler,diesen,Effekt,in,weiteren,Experimenten,und,kamen,1999,zum,"Resultat,",dass,weniger,kompetente,Personen,"","","",dazu,"neigen,",ihre,eigenen,Fähigkeiten,zu,"überschätzen,","","","",überlegene,Fähigkeiten,bei,anderen,nicht,"erkennen,","","","",das,Ausmaß,ihrer,Inkompetenz,nicht,zu,erkennen,"vermögen,","","","",durch,Bildung,oder,bung,nicht,nur,ihre,Kompetenz,"steigern,",sondern,auch,lernen,"können,",sich,und,andere,besser,einzuschätzenDunning,und,Kruger,"zeigten,",dass,schwache,Leistungen,bei,solchen,Menschen,häufig,mit,größerer,Selbstüberschätzung,einhergehen,als,stärkere,Leistungen,"","","",Wenn,jemand,inkompetent,"ist,",dann,kann,er,nicht,"wissen,",dass,er,inkompetent,ist,"",Die,"Fähigkeiten,",die,man,"braucht,",um,eine,richtige,Lösung,zu,"finden,",sind,genau,jene,"Fähigkeiten,",die,man,"braucht,",um,eine,Lösung,als,richtig,zu,erkennen,David,Dunning4In,der,psychologischen,Fachliteratur,wird,der,DunningKrugerEffekt,nur,selten,"angeführt,",in,Blogs,und,Diskussionsforen,des,Internets,und,in,akademischen,Publikationen,außerhalb,der,Psychologie,hingegen,häufig5678,In,einer,kognitionswissenschaftlichen,Publikation,zur,Leugnung,der,menschengemachten,globalen,Erwärmung,wird,der,DunningKrugerEffekt,als,eine,mögliche,Erklärung,für,die,Ignoranz,gegenüber,wissenschaftlichen,Prozessen,genannt9Im,Jahr,2000,erhielten,Dunning,und,Kruger,für,ihre,Studie,den,satirischen,IgNobelpreis,im,Bereich,Psychologie10,""}	Dunnig-Kruger-Effekt Die Neigung stammt von der Unfähigkeit ab, mittels der Metakognition sich selbst objektiv beurteilen zu können. Der populärwissenschaftliche Begriff geht auf eine Publikation von David Dunning und Justin Kruger aus dem Jahr 1999 zurück. Dunning und Kruger hatten in vorausgegangenen Studien bemerkt, dass etwa beim Erfassen von Texten, beim Schachspielen oder Autofahren Unwissenheit oft zu mehr Selbstvertrauen führt als Wissen.[3]\r\n\r\nAn der Cornell University erforschten die beiden Wissenschaftler diesen Effekt in weiteren Experimenten und kamen 1999 zum Resultat, dass weniger kompetente Personen\r\n\r\n    dazu neigen, ihre eigenen Fähigkeiten zu überschätzen,\r\n    überlegene Fähigkeiten bei anderen nicht erkennen,\r\n    das Ausmaß ihrer Inkompetenz nicht zu erkennen vermögen,\r\n    durch Bildung oder Übung nicht nur ihre Kompetenz steigern, sondern auch lernen können, sich und andere besser einzuschätzen.\r\n\r\nDunning und Kruger zeigten, dass schwache Leistungen bei solchen Menschen häufig mit größerer Selbstüberschätzung einhergehen als stärkere Leistungen.\r\n\r\n    „Wenn jemand inkompetent ist, dann kann er nicht wissen, dass er inkompetent ist. […] Die Fähigkeiten, die man braucht, um eine richtige Lösung zu finden, [sind] genau jene Fähigkeiten, die man braucht, um eine Lösung als richtig zu erkennen.“\r\n\r\n– David Dunning[4]\r\n\r\nIn der psychologischen Fachliteratur wird der Dunning-Kruger-Effekt nur selten angeführt, in Blogs und Diskussionsforen des Internets und in akademischen Publikationen außerhalb der Psychologie hingegen häufig.[5][6][7][8] In einer kognitionswissenschaftlichen Publikation zur Leugnung der menschengemachten globalen Erwärmung wird der Dunning-Kruger-Effekt als eine mögliche Erklärung für die Ignoranz gegenüber wissenschaftlichen Prozessen genannt.[9]\r\n\r\nIm Jahr 2000 erhielten Dunning und Kruger für ihre Studie den satirischen Ig-Nobelpreis im Bereich Psychologie.[10] 	14	\N	\N
Neu	Neues	2020-06-03 15:06:51.540759	\N	{Neues}	Neu Neues	15	\N	\N
Saturn	Der Saturn ist von der Sonne aus gesehen der sechste Planet des Sonnensystems und mit einem Äquatordurchmesser von etwa 120.500 Kilometern (9,5-facher Erddurchmesser) nach Jupiter der zweitgrößte. Mit 95 Erdmassen hat er jedoch nur 30 % der Masse Jupiters. Wegen seines schon im kleinen Fernrohr sichtbaren Ringes wird er oft auch der Ringplanet genannt.\r\n\r\nDer Saturn hat eine durchschnittliche Entfernung zur Sonne von gut 1,43 Milliarden Kilometern, seine Bahn verläuft zwischen der von Jupiter und der des sonnenferneren Uranus. Er ist der äußerste Planet, der auch mit bloßem Auge gut sichtbar ist, und war daher schon Jahrtausende vor der Erfindung des Fernrohrs bekannt.\r\n\r\nEr ist ein Gasplanet, dessen untersuchte obere Schichten zu etwa 96 % Stoffanteil aus Wasserstoff bestehen, und der von allen Planeten des Sonnensystems die geringste mittlere Dichte (etwa 0,69 g/cm³) aufweist.[1] Von den anderen Planeten hebt sich der Saturn durch seine besonders ausgeprägten und schon lange bekannten Ringe ab, die zu großen Teilen aus Wassereis und Gesteinsbrocken bestehen.\r\n\r\nSein scheinbarer Winkeldurchmesser beträgt je nach Erdentfernung zwischen 15″ und 20″, jener der Ringe zwischen 37″ und 46″. Die sogenannten Äquatorstreifen der Wolkenschichten des Saturn sind weniger deutlich als bei Jupiter, was wahrscheinlich mit einer hochlagernden Dunstschicht zusammenhängt.\r\n\r\nBis 2019 wurden 82 Monde des Saturns entdeckt, dies sind mehr als von Jupiter bekannt sind. Der mit Abstand größte Saturnmond ist Titan mit 5150 Kilometern Durchmesser.\r\n\r\nBenannt ist der Planet nach dem römischen Gott des Reichtums und der Ernte, Saturn. Sein astronomisches Symbol ♄ repräsentiert die stilisierte Sichel des Gottes. 	2020-02-11 10:10:57.708014	\N	{Der,Saturn,ist,von,der,Sonne,aus,gesehen,der,sechste,Planet,des,Sonnensystems,und,mit,einem,quatordurchmesser,von,etwa,120500,Kilometern,"9,5facher",Erddurchmesser,nach,Jupiter,der,zweitgrößte,Mit,95,Erdmassen,hat,er,jedoch,nur,30,"",der,Masse,Jupiters,Wegen,seines,schon,im,kleinen,Fernrohr,sichtbaren,Ringes,wird,er,oft,auch,der,Ringplanet,genanntDer,Saturn,hat,eine,durchschnittliche,Entfernung,zur,Sonne,von,gut,"1,43",Milliarden,"Kilometern,",seine,Bahn,verläuft,zwischen,der,von,Jupiter,und,der,des,sonnenferneren,Uranus,Er,ist,der,äußerste,"Planet,",der,auch,mit,bloßem,Auge,gut,sichtbar,"ist,",und,war,daher,schon,Jahrtausende,vor,der,Erfindung,des,Fernrohrs,bekanntEr,ist,ein,"Gasplanet,",dessen,untersuchte,obere,Schichten,zu,etwa,96,"",Stoffanteil,aus,Wasserstoff,"bestehen,",und,der,von,allen,Planeten,des,Sonnensystems,die,geringste,mittlere,Dichte,etwa,"0,69",gcm,aufweist1,Von,den,anderen,Planeten,hebt,sich,der,Saturn,durch,seine,besonders,ausgeprägten,und,schon,lange,bekannten,Ringe,"ab,",die,zu,großen,Teilen,aus,Wassereis,und,Gesteinsbrocken,bestehenSein,scheinbarer,Winkeldurchmesser,beträgt,je,nach,Erdentfernung,zwischen,15,und,"20,",jener,der,Ringe,zwischen,37,und,46,Die,sogenannten,quatorstreifen,der,Wolkenschichten,des,Saturn,sind,weniger,deutlich,als,bei,"Jupiter,",was,wahrscheinlich,mit,einer,hochlagernden,Dunstschicht,zusammenhängtBis,2019,wurden,82,Monde,des,Saturns,"entdeckt,",dies,sind,mehr,als,von,Jupiter,bekannt,sind,Der,mit,Abstand,größte,Saturnmond,ist,Titan,mit,5150,Kilometern,DurchmesserBenannt,ist,der,Planet,nach,dem,römischen,Gott,des,Reichtums,und,der,"Ernte,",Saturn,Sein,astronomisches,Symbol,"",repräsentiert,die,stilisierte,Sichel,des,Gottes,""}	Saturn Der Saturn ist von der Sonne aus gesehen der sechste Planet des Sonnensystems und mit einem Äquatordurchmesser von etwa 120.500 Kilometern (9,5-facher Erddurchmesser) nach Jupiter der zweitgrößte. Mit 95 Erdmassen hat er jedoch nur 30 % der Masse Jupiters. Wegen seines schon im kleinen Fernrohr sichtbaren Ringes wird er oft auch der Ringplanet genannt.\r\n\r\nDer Saturn hat eine durchschnittliche Entfernung zur Sonne von gut 1,43 Milliarden Kilometern, seine Bahn verläuft zwischen der von Jupiter und der des sonnenferneren Uranus. Er ist der äußerste Planet, der auch mit bloßem Auge gut sichtbar ist, und war daher schon Jahrtausende vor der Erfindung des Fernrohrs bekannt.\r\n\r\nEr ist ein Gasplanet, dessen untersuchte obere Schichten zu etwa 96 % Stoffanteil aus Wasserstoff bestehen, und der von allen Planeten des Sonnensystems die geringste mittlere Dichte (etwa 0,69 g/cm³) aufweist.[1] Von den anderen Planeten hebt sich der Saturn durch seine besonders ausgeprägten und schon lange bekannten Ringe ab, die zu großen Teilen aus Wassereis und Gesteinsbrocken bestehen.\r\n\r\nSein scheinbarer Winkeldurchmesser beträgt je nach Erdentfernung zwischen 15″ und 20″, jener der Ringe zwischen 37″ und 46″. Die sogenannten Äquatorstreifen der Wolkenschichten des Saturn sind weniger deutlich als bei Jupiter, was wahrscheinlich mit einer hochlagernden Dunstschicht zusammenhängt.\r\n\r\nBis 2019 wurden 82 Monde des Saturns entdeckt, dies sind mehr als von Jupiter bekannt sind. Der mit Abstand größte Saturnmond ist Titan mit 5150 Kilometern Durchmesser.\r\n\r\nBenannt ist der Planet nach dem römischen Gott des Reichtums und der Ernte, Saturn. Sein astronomisches Symbol ♄ repräsentiert die stilisierte Sichel des Gottes. 	1	\N	\N
Pluto	Pluto ist der größte und zweitmassivste bekannte Zwergplanet und das am längsten bekannte Objekt des Kuipergürtels. Er ist nach dem römischen Gott der Unterwelt benannt. Nach dem Zwergplaneten wiederum wurden die neuen Klassen der Plutoiden und der Plutinos benannt.\r\n\r\nDas astronomische Symbol des Pluto ist ♇. In der Astrologie wird auch Astrologisches Symbol des Pluto verwendet.\r\n\r\nIm Januar 2006 wurde mit New Horizons erstmals eine Raumsonde zu Pluto ausgesandt; sie passierte ihn am 14. Juli 2015 in 12.500 km Entfernung.[3]\r\n\r\nPluto besitzt etwa ein Drittel des Volumens des Erdmondes und bewegt sich auf einer noch exzentrischeren Bahn um die Sonne als der Planet Merkur. Von seiner Entdeckung am 18. Februar 1930 bis zur Neudefinition des Begriffs „Planet“ am 24. August 2006 durch die Internationale Astronomische Union (IAU) galt Pluto als der neunte und äußerste Planet des Sonnensystems.\r\n\r\nNachdem immer mehr Plutoiden – also ähnlich große Körper des Kuipergürtels – gefunden worden waren, wurde Pluto der Planetenstatus aberkannt. Seither wird er der Kategorie Zwergplanet zugeordnet und erhielt eine Kleinplanetennummer: Die vollständige Bezeichnung lautet (134340) Pluto. 	2020-02-11 10:12:03.053657	\N	{Pluto,ist,der,größte,und,zweitmassivste,bekannte,Zwergplanet,und,das,am,längsten,bekannte,Objekt,des,Kuipergürtels,Er,ist,nach,dem,römischen,Gott,der,Unterwelt,benannt,Nach,dem,Zwergplaneten,wiederum,wurden,die,neuen,Klassen,der,Plutoiden,und,der,Plutinos,benanntDas,astronomische,Symbol,des,Pluto,ist,"",In,der,Astrologie,wird,auch,Astrologisches,Symbol,des,Pluto,verwendetIm,Januar,2006,wurde,mit,New,Horizons,erstmals,eine,Raumsonde,zu,Pluto,ausgesandt,sie,passierte,ihn,am,14,Juli,2015,in,12500,km,Entfernung3Pluto,besitzt,etwa,ein,Drittel,des,Volumens,des,Erdmondes,und,bewegt,sich,auf,einer,noch,exzentrischeren,Bahn,um,die,Sonne,als,der,Planet,Merkur,Von,seiner,Entdeckung,am,18,Februar,1930,bis,zur,Neudefinition,des,Begriffs,Planet,am,24,August,2006,durch,die,Internationale,Astronomische,Union,IAU,galt,Pluto,als,der,neunte,und,äußerste,Planet,des,SonnensystemsNachdem,immer,mehr,Plutoiden,"",also,ähnlich,große,Körper,des,Kuipergürtels,"",gefunden,worden,"waren,",wurde,Pluto,der,Planetenstatus,aberkannt,Seither,wird,er,der,Kategorie,Zwergplanet,zugeordnet,und,erhielt,eine,Kleinplanetennummer,Die,vollständige,Bezeichnung,lautet,134340,Pluto,""}	Pluto Pluto ist der größte und zweitmassivste bekannte Zwergplanet und das am längsten bekannte Objekt des Kuipergürtels. Er ist nach dem römischen Gott der Unterwelt benannt. Nach dem Zwergplaneten wiederum wurden die neuen Klassen der Plutoiden und der Plutinos benannt.\r\n\r\nDas astronomische Symbol des Pluto ist ♇. In der Astrologie wird auch Astrologisches Symbol des Pluto verwendet.\r\n\r\nIm Januar 2006 wurde mit New Horizons erstmals eine Raumsonde zu Pluto ausgesandt; sie passierte ihn am 14. Juli 2015 in 12.500 km Entfernung.[3]\r\n\r\nPluto besitzt etwa ein Drittel des Volumens des Erdmondes und bewegt sich auf einer noch exzentrischeren Bahn um die Sonne als der Planet Merkur. Von seiner Entdeckung am 18. Februar 1930 bis zur Neudefinition des Begriffs „Planet“ am 24. August 2006 durch die Internationale Astronomische Union (IAU) galt Pluto als der neunte und äußerste Planet des Sonnensystems.\r\n\r\nNachdem immer mehr Plutoiden – also ähnlich große Körper des Kuipergürtels – gefunden worden waren, wurde Pluto der Planetenstatus aberkannt. Seither wird er der Kategorie Zwergplanet zugeordnet und erhielt eine Kleinplanetennummer: Die vollständige Bezeichnung lautet (134340) Pluto. 	3	\N	\N
Beteigeuze	Beteigeuze ist ein Riesenstern und wird im Hertzsprung-Russell-Diagramm in die Klasse der Roten Überriesen eingeteilt. Er hat etwa den tausendfachen Durchmesser der Sonne und besitzt im sichtbaren Bereich eine etwa zehntausendmal so große Leuchtkraft.[10] Volumenmäßig passt die Sonne somit etwa eine Milliarde Mal in Beteigeuze. Von der Erde aus gesehen ist Beteigeuze der zehnthellste Stern.\r\n\r\nBeteigeuze ist von großem astronomischen Interesse. Sein Radius war der erste, der mittels Interferometrie bestimmt wurde. Es stellte sich heraus, dass er um zirka 15 Prozent schwankt.[11] Es variiert auch Beteigeuzes Helligkeit zwischen +0,3 und +0,6m mit einer halbregelmäßigen Periode von 2070 Tagen (Halbregelmäßig Veränderlicher vom Typ SRc). Er ist neben Mira, Altair und Antares einer der wenigen Sterne, die von der Erde aus mit Teleskoptechnik als Fläche sichtbar sind, sein Winkeldurchmesser beträgt 0,05 Bogensekunden.\r\n\r\nAnlässlich einer Bedeckung von Beteigeuze durch den Asteroiden (319) Leona am 12. Dezember 2023 wird es unter Umständen möglich sein, die Verteilung der Helligkeit über die Sternenscheibe genauer zu bestimmen, als dies mit der aktuellen Technik möglich ist.[12]\r\n\r\nDie Bestimmung der Entfernung von Beteigeuze erwies sich als schwierig, da die Parallaxe deutlich geringer ist als der Winkeldurchmesser des Sterns. Man vermutete lange Zeit eine Entfernung um 700 Lichtjahre, mit Hilfe des Satelliten Hipparcos wurde sie 1997 auf zirka 430 ± 100 Lichtjahre (130 ± 30 Parsec) bestimmt. Neuere Analysen der Hipparcos- und anderer Daten deuten jedoch auf eine größere Entfernung von etwa 640 ± 150 Lichtjahren (200 ± 45 Parsec) hin.[4] 	2020-02-11 10:12:26.964678	2020-02-11 13:40:13.712683	{Beteigeuze,ist,ein,Riesenstern,und,wird,im,HertzsprungRussellDiagramm,in,die,Klasse,der,Roten,berriesen,eingeteilt,Er,hat,etwa,den,tausendfachen,Durchmesser,der,Sonne,und,besitzt,im,sichtbaren,Bereich,eine,etwa,zehntausendmal,so,große,Leuchtkraft10,Volumenmäßig,passt,die,Sonne,somit,etwa,eine,Milliarde,Mal,in,Beteigeuze,Von,der,Erde,aus,gesehen,ist,Beteigeuze,der,zehnthellste,SternBeteigeuze,ist,von,großem,astronomischen,Interesse,Sein,Radius,war,der,"erste,",der,mittels,Interferometrie,bestimmt,wurde,Es,stellte,sich,"heraus,",dass,er,um,zirka,15,Prozent,schwankt11,Es,variiert,auch,Beteigeuzes,Helligkeit,zwischen,"0,3",und,"0,6m",mit,einer,halbregelmäßigen,Periode,von,2070,Tagen,Halbregelmäßig,Veränderlicher,vom,Typ,SRc,Er,ist,neben,"Mira,",Altair,und,Antares,einer,der,wenigen,"Sterne,",die,von,der,Erde,aus,mit,Teleskoptechnik,als,Fläche,sichtbar,"sind,",sein,Winkeldurchmesser,beträgt,"0,05",BogensekundenAnlässlich,einer,Bedeckung,von,Beteigeuze,durch,den,Asteroiden,319,Leona,am,12,Dezember,2023,wird,es,unter,Umständen,möglich,"sein,",die,Verteilung,der,Helligkeit,über,die,Sternenscheibe,genauer,zu,"bestimmen,",als,dies,mit,der,aktuellen,Technik,möglich,ist12Die,Bestimmung,der,Entfernung,von,Beteigeuze,erwies,sich,als,"schwierig,",da,die,Parallaxe,deutlich,geringer,ist,als,der,Winkeldurchmesser,des,Sterns,Man,vermutete,lange,Zeit,eine,Entfernung,um,700,"Lichtjahre,",mit,Hilfe,des,Satelliten,Hipparcos,wurde,sie,1997,auf,zirka,430,"",100,Lichtjahre,130,"",30,Parsec,bestimmt,Neuere,Analysen,der,Hipparcos,und,anderer,Daten,deuten,jedoch,auf,eine,größere,Entfernung,von,etwa,640,"",150,Lichtjahren,200,"",45,Parsec,hin4,""}	Beteigeuze Beteigeuze ist ein Riesenstern und wird im Hertzsprung-Russell-Diagramm in die Klasse der Roten Überriesen eingeteilt. Er hat etwa den tausendfachen Durchmesser der Sonne und besitzt im sichtbaren Bereich eine etwa zehntausendmal so große Leuchtkraft.[10] Volumenmäßig passt die Sonne somit etwa eine Milliarde Mal in Beteigeuze. Von der Erde aus gesehen ist Beteigeuze der zehnthellste Stern.\r\n\r\nBeteigeuze ist von großem astronomischen Interesse. Sein Radius war der erste, der mittels Interferometrie bestimmt wurde. Es stellte sich heraus, dass er um zirka 15 Prozent schwankt.[11] Es variiert auch Beteigeuzes Helligkeit zwischen +0,3 und +0,6m mit einer halbregelmäßigen Periode von 2070 Tagen (Halbregelmäßig Veränderlicher vom Typ SRc). Er ist neben Mira, Altair und Antares einer der wenigen Sterne, die von der Erde aus mit Teleskoptechnik als Fläche sichtbar sind, sein Winkeldurchmesser beträgt 0,05 Bogensekunden.\r\n\r\nAnlässlich einer Bedeckung von Beteigeuze durch den Asteroiden (319) Leona am 12. Dezember 2023 wird es unter Umständen möglich sein, die Verteilung der Helligkeit über die Sternenscheibe genauer zu bestimmen, als dies mit der aktuellen Technik möglich ist.[12]\r\n\r\nDie Bestimmung der Entfernung von Beteigeuze erwies sich als schwierig, da die Parallaxe deutlich geringer ist als der Winkeldurchmesser des Sterns. Man vermutete lange Zeit eine Entfernung um 700 Lichtjahre, mit Hilfe des Satelliten Hipparcos wurde sie 1997 auf zirka 430 ± 100 Lichtjahre (130 ± 30 Parsec) bestimmt. Neuere Analysen der Hipparcos- und anderer Daten deuten jedoch auf eine größere Entfernung von etwa 640 ± 150 Lichtjahren (200 ± 45 Parsec) hin.[4] 	4	\N	\N
Uranus	Der Uranus (Latinisierung von altgriechisch οὐρανός uranós ‚Himmel‘)[3] ist von der Sonne aus mit einer durchschnittlichen Sonnenentfernung von 2,9 Milliarden Kilometern der siebte Planet im Sonnensystem und wird zu den äußeren, jupiterähnlichen (jovianischen) Planeten gerechnet. Er wurde am 13. März 1781 von Wilhelm Herschel entdeckt und ist nach dem griechischen Himmelsgott Uranos benannt. Er ist damit als einziger Planet nach einem Gott der griechischen Götterwelt benannt.	2020-02-11 14:47:04.823366	2020-02-11 14:48:02.627532	{Der,Uranus,Latinisierung,von,altgriechisch,"",urans,Himmel3,ist,von,der,Sonne,aus,mit,einer,durchschnittlichen,Sonnenentfernung,von,"2,9",Milliarden,Kilometern,der,siebte,Planet,im,Sonnensystem,und,wird,zu,den,"äußeren,",jupiterähnlichen,jovianischen,Planeten,gerechnet,Er,wurde,am,13,März,1781,von,Wilhelm,Herschel,entdeckt,und,ist,nach,dem,griechischen,Himmelsgott,Uranos,benannt,Er,ist,damit,als,einziger,Planet,nach,einem,Gott,der,griechischen,Götterwelt,benannt}	Uranus Der Uranus (Latinisierung von altgriechisch οὐρανός uranós ‚Himmel‘)[3] ist von der Sonne aus mit einer durchschnittlichen Sonnenentfernung von 2,9 Milliarden Kilometern der siebte Planet im Sonnensystem und wird zu den äußeren, jupiterähnlichen (jovianischen) Planeten gerechnet. Er wurde am 13. März 1781 von Wilhelm Herschel entdeckt und ist nach dem griechischen Himmelsgott Uranos benannt. Er ist damit als einziger Planet nach einem Gott der griechischen Götterwelt benannt.	6	\N	\N
Spika	Spica (lateinisch Kornähre), auch α Virginis, Azimech oder Alaraph genannt, ist der hellste Stern im Sternbild Jungfrau und der fünfzehnthellste Stern am nächtlichen Sternenhimmel.\r\n\r\nIm Sternbild Jungfrau stellt Spica die Kornähre in der Hand der Jungfrau dar. In Mesopotamien war Spica unter dšala šubultu (Gott/Göttin Schala, die Kornähre), später auch Göttliche Jungfrau der Kornähre, bekannt. Die Römer glaubten, in Spica die Göttin Ceres zu sehen. Römische Namen sind Spicum, Spigha, Stachys (von gr. stakhum Kornähre) und Aristae Puella (Kornmädchen).\r\n\r\nDie IAU hat am 30. Juni 2016 den Eigennamen Spica als standardisierten Eigennamen festgelegt.[1]\r\n\r\nSpica ist ein bedeckungsveränderlicher Stern vom Typ der Beta-Cephei-Sterne wie der Algol. Die Helligkeit der Spica verändert sich mit einer Periode von 4,0142 Tagen zwischen +0,92 mag und +0,98 mag. Diese geringe Helligkeitsschwankung ist visuell kaum feststellbar.\r\n\r\nBeide Komponenten von Spica gehören zum Spektraltyp B (B1 bis B4), wobei sich der hellere Stern nahe am Ende seiner stabilen Zeit als Hauptreihenstern befindet. Die beiden Sterne gehören zu den heißesten und somit bläulichsten der hellen Sterne am Nachthimmel. Durch die hohe Temperatur wird ein Großteil des Lichtes im unsichtbaren ultravioletten Bereich abgestrahlt.\r\n\r\nDer hellere Stern hat eine Temperatur von 22.400 K und eine 13.500-fache Sonnenleuchtkraft. Der Radius beträgt das 7,8-fache des Sonnenradius und erstreckt sich auf fast 30 % des Abstandes der beiden Sterne. Die Masse des helleren Sternes beträgt das Elffache der Sonne. Das ist genug, um den Stern als Supernova enden zu lassen.\r\n\r\nDer nicht so bekannte weniger helle Begleitstern hat eine Oberflächentemperatur von 18.500 K, 1.700-fache Sonnenleuchtkraft, vierfachen Sonnenradius und etwas weniger als die siebenfache Sonnenmasse.\r\n\r\nSpica kann als ekliptiknaher Stern vom Mond und (sehr selten) von Planeten bedeckt werden. Zum letzten Mal von einem Planeten bedeckt wurde Spica am 10. November 1783 durch die Venus, die nächste Bedeckung wird am 2. September 2197 wieder durch die Venus erfolgen.\r\n\r\nSpica ist in der Flagge Brasiliens abgebildet, wo er den Bundesstaat Pará repräsentiert. 	2020-02-11 14:50:21.486712	\N	{Spica,lateinisch,"Kornähre,",auch,"","Virginis,",Azimech,oder,Alaraph,"genannt,",ist,der,hellste,Stern,im,Sternbild,Jungfrau,und,der,fünfzehnthellste,Stern,am,nächtlichen,SternenhimmelIm,Sternbild,Jungfrau,stellt,Spica,die,Kornähre,in,der,Hand,der,Jungfrau,dar,In,Mesopotamien,war,Spica,unter,dala,ubultu,GottGöttin,"Schala,",die,"Kornähre,",später,auch,Göttliche,Jungfrau,der,"Kornähre,",bekannt,Die,Römer,"glaubten,",in,Spica,die,Göttin,Ceres,zu,sehen,Römische,Namen,sind,"Spicum,","Spigha,",Stachys,von,gr,stakhum,Kornähre,und,Aristae,Puella,KornmädchenDie,IAU,hat,am,30,Juni,2016,den,Eigennamen,Spica,als,standardisierten,Eigennamen,festgelegt1Spica,ist,ein,bedeckungsveränderlicher,Stern,vom,Typ,der,BetaCepheiSterne,wie,der,Algol,Die,Helligkeit,der,Spica,verändert,sich,mit,einer,Periode,von,"4,0142",Tagen,zwischen,"0,92",mag,und,"0,98",mag,Diese,geringe,Helligkeitsschwankung,ist,visuell,kaum,feststellbarBeide,Komponenten,von,Spica,gehören,zum,Spektraltyp,B,B1,bis,"B4,",wobei,sich,der,hellere,Stern,nahe,am,Ende,seiner,stabilen,Zeit,als,Hauptreihenstern,befindet,Die,beiden,Sterne,gehören,zu,den,heißesten,und,somit,bläulichsten,der,hellen,Sterne,am,Nachthimmel,Durch,die,hohe,Temperatur,wird,ein,Großteil,des,Lichtes,im,unsichtbaren,ultravioletten,Bereich,abgestrahltDer,hellere,Stern,hat,eine,Temperatur,von,22400,K,und,eine,13500fache,Sonnenleuchtkraft,Der,Radius,beträgt,das,"7,8fache",des,Sonnenradius,und,erstreckt,sich,auf,fast,30,"",des,Abstandes,der,beiden,Sterne,Die,Masse,des,helleren,Sternes,beträgt,das,Elffache,der,Sonne,Das,ist,"genug,",um,den,Stern,als,Supernova,enden,zu,lassenDer,nicht,so,bekannte,weniger,helle,Begleitstern,hat,eine,Oberflächentemperatur,von,18500,"K,",1700fache,"Sonnenleuchtkraft,",vierfachen,Sonnenradius,und,etwas,weniger,als,die,siebenfache,SonnenmasseSpica,kann,als,ekliptiknaher,Stern,vom,Mond,und,sehr,selten,von,Planeten,bedeckt,werden,Zum,letzten,Mal,von,einem,Planeten,bedeckt,wurde,Spica,am,10,November,1783,durch,die,"Venus,",die,nächste,Bedeckung,wird,am,2,September,2197,wieder,durch,die,Venus,erfolgenSpica,ist,in,der,Flagge,Brasiliens,"abgebildet,",wo,er,den,Bundesstaat,Par,repräsentiert,""}	Spika Spica (lateinisch Kornähre), auch α Virginis, Azimech oder Alaraph genannt, ist der hellste Stern im Sternbild Jungfrau und der fünfzehnthellste Stern am nächtlichen Sternenhimmel.\r\n\r\nIm Sternbild Jungfrau stellt Spica die Kornähre in der Hand der Jungfrau dar. In Mesopotamien war Spica unter dšala šubultu (Gott/Göttin Schala, die Kornähre), später auch Göttliche Jungfrau der Kornähre, bekannt. Die Römer glaubten, in Spica die Göttin Ceres zu sehen. Römische Namen sind Spicum, Spigha, Stachys (von gr. stakhum Kornähre) und Aristae Puella (Kornmädchen).\r\n\r\nDie IAU hat am 30. Juni 2016 den Eigennamen Spica als standardisierten Eigennamen festgelegt.[1]\r\n\r\nSpica ist ein bedeckungsveränderlicher Stern vom Typ der Beta-Cephei-Sterne wie der Algol. Die Helligkeit der Spica verändert sich mit einer Periode von 4,0142 Tagen zwischen +0,92 mag und +0,98 mag. Diese geringe Helligkeitsschwankung ist visuell kaum feststellbar.\r\n\r\nBeide Komponenten von Spica gehören zum Spektraltyp B (B1 bis B4), wobei sich der hellere Stern nahe am Ende seiner stabilen Zeit als Hauptreihenstern befindet. Die beiden Sterne gehören zu den heißesten und somit bläulichsten der hellen Sterne am Nachthimmel. Durch die hohe Temperatur wird ein Großteil des Lichtes im unsichtbaren ultravioletten Bereich abgestrahlt.\r\n\r\nDer hellere Stern hat eine Temperatur von 22.400 K und eine 13.500-fache Sonnenleuchtkraft. Der Radius beträgt das 7,8-fache des Sonnenradius und erstreckt sich auf fast 30 % des Abstandes der beiden Sterne. Die Masse des helleren Sternes beträgt das Elffache der Sonne. Das ist genug, um den Stern als Supernova enden zu lassen.\r\n\r\nDer nicht so bekannte weniger helle Begleitstern hat eine Oberflächentemperatur von 18.500 K, 1.700-fache Sonnenleuchtkraft, vierfachen Sonnenradius und etwas weniger als die siebenfache Sonnenmasse.\r\n\r\nSpica kann als ekliptiknaher Stern vom Mond und (sehr selten) von Planeten bedeckt werden. Zum letzten Mal von einem Planeten bedeckt wurde Spica am 10. November 1783 durch die Venus, die nächste Bedeckung wird am 2. September 2197 wieder durch die Venus erfolgen.\r\n\r\nSpica ist in der Flagge Brasiliens abgebildet, wo er den Bundesstaat Pará repräsentiert. 	7	\N	\N
Peter-Prinzip	Peters These ist, dass jedes Mitglied einer ausreichend komplexen Hierarchie so lange befördert wird, solange es auf seiner Position erfolgreich ist. Übersteigen die Anforderungen der neuen Position aber die Fähigkeiten, bleiben weitere Beförderungen aus. Umgekehrt bleiben Mitglieder, deren Fähigkeiten für eine höhere Position geeignet wären, schon in den unteren Stufen hängen, in denen sie weniger erfolgreich sind: Dadurch markiert in der Regel das persönliche Maximum der Karriere­leiter das Maß einer maximalen Unfähigkeit innerhalb der Hierarchie. Peter konstatiert: „Nach einer gewissen Zeit wird jede Position von einem Mitarbeiter besetzt, der unfähig ist, seine Aufgabe zu erfüllen.“[2]\r\n\r\nDie einzige Einschränkung ist, dass die Hierarchie hoch genug ist, also genügend Hierarchie-Stufen enthalten muss. In dem Buch von Peter und Hull werden viele Beispiele für Hierarchien in Wirtschaft und Verwaltung sowie die Unfähigkeit der dort Beschäftigten beschrieben. Seine konkreten Erfahrungen mit Hierarchien hat Peter hauptsächlich aus der kanadischen Schulverwaltung.\r\n\r\nWeiterhin werden die Modelle der „geräuschlosen Sublimierung“ und der „seitlichen Arabeske“ beschrieben. Bei erstgenanntem Modell wird eine Beförderung eines als unfähig bekannten Angestellten nur deshalb durchgeführt, weil unter den anderen Mitarbeitern ein Anreiz ausgelöst werden soll, dass jeder auch befördert werden kann. Hierdurch wird eine Stabilisierung der Hierarchie erreicht. Bei Letzterem werden etwa Titel oder Abteilungen ohne Kompetenzen geschaffen, die es vorher nicht gab, um einen unfähigen Mitarbeiter quasi „auszulagern“.[4]\r\n\r\nDie Verteilung der Stufen der Inkompetenz stellt Peter anhand der Gaußschen Normalverteilung dar. Es stellt sich damit die Frage, wer in einer solchen Hierarchie die Arbeit leistet. Peter ist der Meinung, dass nicht alle zur gleichen Zeit ihre Stufe der Unfähigkeit erreichen: „Die Arbeit wird von den Mitarbeitern erledigt, die ihre Stufe der Inkompetenz noch nicht erreicht haben.“[2]\r\n\r\nEs schließt mit der These, dass man seine Energie vielleicht sinnvoller auf die Vermeidung einer Karriere verwenden sollte. 	2020-02-11 14:55:01.34063	\N	{Peters,These,"ist,",dass,jedes,Mitglied,einer,ausreichend,komplexen,Hierarchie,so,lange,befördert,"wird,",solange,es,auf,seiner,Position,erfolgreich,ist,bersteigen,die,Anforderungen,der,neuen,Position,aber,die,"Fähigkeiten,",bleiben,weitere,Beförderungen,aus,Umgekehrt,bleiben,"Mitglieder,",deren,Fähigkeiten,für,eine,höhere,Position,geeignet,"wären,",schon,in,den,unteren,Stufen,"hängen,",in,denen,sie,weniger,erfolgreich,sind,Dadurch,markiert,in,der,Regel,das,persönliche,Maximum,der,Karriereleiter,das,Maß,einer,maximalen,Unfähigkeit,innerhalb,der,Hierarchie,Peter,konstatiert,Nach,einer,gewissen,Zeit,wird,jede,Position,von,einem,Mitarbeiter,"besetzt,",der,unfähig,"ist,",seine,Aufgabe,zu,erfüllen2Die,einzige,Einschränkung,"ist,",dass,die,Hierarchie,hoch,genug,"ist,",also,genügend,HierarchieStufen,enthalten,muss,In,dem,Buch,von,Peter,und,Hull,werden,viele,Beispiele,für,Hierarchien,in,Wirtschaft,und,Verwaltung,sowie,die,Unfähigkeit,der,dort,Beschäftigten,beschrieben,Seine,konkreten,Erfahrungen,mit,Hierarchien,hat,Peter,hauptsächlich,aus,der,kanadischen,SchulverwaltungWeiterhin,werden,die,Modelle,der,geräuschlosen,Sublimierung,und,der,seitlichen,Arabeske,beschrieben,Bei,erstgenanntem,Modell,wird,eine,Beförderung,eines,als,unfähig,bekannten,Angestellten,nur,deshalb,"durchgeführt,",weil,unter,den,anderen,Mitarbeitern,ein,Anreiz,ausgelöst,werden,"soll,",dass,jeder,auch,befördert,werden,kann,Hierdurch,wird,eine,Stabilisierung,der,Hierarchie,erreicht,Bei,Letzterem,werden,etwa,Titel,oder,Abteilungen,ohne,Kompetenzen,"geschaffen,",die,es,vorher,nicht,"gab,",um,einen,unfähigen,Mitarbeiter,quasi,auszulagern4Die,Verteilung,der,Stufen,der,Inkompetenz,stellt,Peter,anhand,der,Gaußschen,Normalverteilung,dar,Es,stellt,sich,damit,die,"Frage,",wer,in,einer,solchen,Hierarchie,die,Arbeit,leistet,Peter,ist,der,"Meinung,",dass,nicht,alle,zur,gleichen,Zeit,ihre,Stufe,der,Unfähigkeit,erreichen,Die,Arbeit,wird,von,den,Mitarbeitern,"erledigt,",die,ihre,Stufe,der,Inkompetenz,noch,nicht,erreicht,haben2Es,schließt,mit,der,"These,",dass,man,seine,Energie,vielleicht,sinnvoller,auf,die,Vermeidung,einer,Karriere,verwenden,sollte,""}	Peter-Prinzip Peters These ist, dass jedes Mitglied einer ausreichend komplexen Hierarchie so lange befördert wird, solange es auf seiner Position erfolgreich ist. Übersteigen die Anforderungen der neuen Position aber die Fähigkeiten, bleiben weitere Beförderungen aus. Umgekehrt bleiben Mitglieder, deren Fähigkeiten für eine höhere Position geeignet wären, schon in den unteren Stufen hängen, in denen sie weniger erfolgreich sind: Dadurch markiert in der Regel das persönliche Maximum der Karriere­leiter das Maß einer maximalen Unfähigkeit innerhalb der Hierarchie. Peter konstatiert: „Nach einer gewissen Zeit wird jede Position von einem Mitarbeiter besetzt, der unfähig ist, seine Aufgabe zu erfüllen.“[2]\r\n\r\nDie einzige Einschränkung ist, dass die Hierarchie hoch genug ist, also genügend Hierarchie-Stufen enthalten muss. In dem Buch von Peter und Hull werden viele Beispiele für Hierarchien in Wirtschaft und Verwaltung sowie die Unfähigkeit der dort Beschäftigten beschrieben. Seine konkreten Erfahrungen mit Hierarchien hat Peter hauptsächlich aus der kanadischen Schulverwaltung.\r\n\r\nWeiterhin werden die Modelle der „geräuschlosen Sublimierung“ und der „seitlichen Arabeske“ beschrieben. Bei erstgenanntem Modell wird eine Beförderung eines als unfähig bekannten Angestellten nur deshalb durchgeführt, weil unter den anderen Mitarbeitern ein Anreiz ausgelöst werden soll, dass jeder auch befördert werden kann. Hierdurch wird eine Stabilisierung der Hierarchie erreicht. Bei Letzterem werden etwa Titel oder Abteilungen ohne Kompetenzen geschaffen, die es vorher nicht gab, um einen unfähigen Mitarbeiter quasi „auszulagern“.[4]\r\n\r\nDie Verteilung der Stufen der Inkompetenz stellt Peter anhand der Gaußschen Normalverteilung dar. Es stellt sich damit die Frage, wer in einer solchen Hierarchie die Arbeit leistet. Peter ist der Meinung, dass nicht alle zur gleichen Zeit ihre Stufe der Unfähigkeit erreichen: „Die Arbeit wird von den Mitarbeitern erledigt, die ihre Stufe der Inkompetenz noch nicht erreicht haben.“[2]\r\n\r\nEs schließt mit der These, dass man seine Energie vielleicht sinnvoller auf die Vermeidung einer Karriere verwenden sollte. 	13	\N	\N
Orion	Das Sternbild liegt auf dem Himmelsäquator zwischen dem Fluss Eridanus und dem Einhorn und ist in Mitteleuropa etwa von August (Morgenhimmel) bis April (Abendhimmel) zu sehen, auf der Südhalbkugel in höheren Breitengraden etwa von Juli (Morgenhimmel) bis Mai (Abendhimmel).\r\n\r\nIm Zyklus der Präzession erscheint es gegenwärtig an seiner fast nördlichsten Stellung, wird seine südlichste in 13.000 Jahren erreichen und dann von Mitteleuropa aus nicht mehr vollständig zu sehen sein.\r\n\r\nDer Orion ist ein mythischer Himmelsjäger, dabei bilden die Sterne Beteigeuze (α Orionis, Bestandteil des Winterdreiecks), und Bellatrix (γ) die Schulter, die Sterne Rigel (β Orionis, Eckpunkt des Wintersechsecks) und Saiph (κ) die Füße. Die Sterne des Gürtels Alnitak, Alnilam und Mintaka (ζ, ε und δ Orionis) in stark überstrecktem Winkel werden auch drei Könige, Jakobsstab oder Jakobsleiter genannt und sind Teil des offenen Sternhaufens Cr 70.\r\n\r\nDie Hauptsterne – abgesehen vom roten Riesen Beteigeuze – weisen ein ähnliches Alter und ähnliche Zustandsgrößen auf, was eine gemeinsame Entstehung vermuten lässt.\r\n\r\nIn der unteren Hälfte in der Mitte des „Schwertgehänges“ des Orion ist der flächenhellste Emissionsnebel als Orionnebel M 42 mit freiem Auge zu sehen. Das ausgeprägte Sternentstehungsgebiet umgibt die Trapezsterne θ1 Orionis und θ2 Orionis und stellt die leuchtende Spitze eines ausgedehnten Wolkenkomplexes interstellarer Materie dar, der das gesamte Sternbild durchzieht. Nördlich über M42 grenzt der Teilnebel M43 an, auch kleiner Orionnebel oder de Mairans Nebel bezeichnet.\r\n\r\nAls „Schwertgehänge“ wird eine Kette von Sternen bezeichnet, die sich von Norden nach Süden aus M42 , θ und ι Orionis zusammensetzt. Nördlich liegt der offene Sternhaufen NGC 1981.\r\n\r\nDer etwa 8° lange Bogen der schwächeren Sterne π1, π2, π3, π4, π5 und π6 Orionis wird in verschiedenen alten Darstellungen als Keule, Bogen und bei Albrecht Dürer als Umhang interpretiert.\r\n\r\nDer Stern Meissa (λ Orionis), der Orions Kopf markiert, befindet sich in dem offenen Sternhaufen Cr 69.\r\n\r\nEtwa ein halbes Grad südlich des linken Gürtelsterns Alnitak befindet sich der berühmte Pferdekopfnebel B 33, eine Dunkelwolke, die sich deutlich vor dem Emissionsnebel IC 434 abzeichnet.\r\n\r\nIm Orion befindet sich auch der Emissionsnebel Barnard’s Loop, der sich in einem weiten Bogen von etwa 12° Durchmesser von Norden her um die Gürtelsterne zieht und im Süden bis nahe Rigel reicht. 	2020-02-11 14:51:03.78117	\N	{Das,Sternbild,liegt,auf,dem,Himmelsäquator,zwischen,dem,Fluss,Eridanus,und,dem,Einhorn,und,ist,in,Mitteleuropa,etwa,von,August,Morgenhimmel,bis,April,Abendhimmel,zu,"sehen,",auf,der,Südhalbkugel,in,höheren,Breitengraden,etwa,von,Juli,Morgenhimmel,bis,Mai,AbendhimmelIm,Zyklus,der,Präzession,erscheint,es,gegenwärtig,an,seiner,fast,nördlichsten,"Stellung,",wird,seine,südlichste,in,13000,Jahren,erreichen,und,dann,von,Mitteleuropa,aus,nicht,mehr,vollständig,zu,sehen,seinDer,Orion,ist,ein,mythischer,"Himmelsjäger,",dabei,bilden,die,Sterne,Beteigeuze,"","Orionis,",Bestandteil,des,"Winterdreiecks,",und,Bellatrix,"",die,"Schulter,",die,Sterne,Rigel,"","Orionis,",Eckpunkt,des,Wintersechsecks,und,Saiph,"",die,Füße,Die,Sterne,des,Gürtels,"Alnitak,",Alnilam,und,Mintaka,",","",und,"",Orionis,in,stark,überstrecktem,Winkel,werden,auch,drei,"Könige,",Jakobsstab,oder,Jakobsleiter,genannt,und,sind,Teil,des,offenen,Sternhaufens,Cr,70Die,Hauptsterne,"",abgesehen,vom,roten,Riesen,Beteigeuze,"",weisen,ein,ähnliches,Alter,und,ähnliche,Zustandsgrößen,"auf,",was,eine,gemeinsame,Entstehung,vermuten,lässtIn,der,unteren,Hälfte,in,der,Mitte,des,Schwertgehänges,des,Orion,ist,der,flächenhellste,Emissionsnebel,als,Orionnebel,M,42,mit,freiem,Auge,zu,sehen,Das,ausgeprägte,Sternentstehungsgebiet,umgibt,die,Trapezsterne,1,Orionis,und,2,Orionis,und,stellt,die,leuchtende,Spitze,eines,ausgedehnten,Wolkenkomplexes,interstellarer,Materie,"dar,",der,das,gesamte,Sternbild,durchzieht,Nördlich,über,M42,grenzt,der,Teilnebel,M43,"an,",auch,kleiner,Orionnebel,oder,de,Mairans,Nebel,bezeichnetAls,Schwertgehänge,wird,eine,Kette,von,Sternen,"bezeichnet,",die,sich,von,Norden,nach,Süden,aus,M42,",","",und,"",Orionis,zusammensetzt,Nördlich,liegt,der,offene,Sternhaufen,NGC,1981Der,etwa,8,lange,Bogen,der,schwächeren,Sterne,"1,","2,","3,","4,",5,und,6,Orionis,wird,in,verschiedenen,alten,Darstellungen,als,"Keule,",Bogen,und,bei,Albrecht,Dürer,als,Umhang,interpretiertDer,Stern,Meissa,"","Orionis,",der,Orions,Kopf,"markiert,",befindet,sich,in,dem,offenen,Sternhaufen,Cr,69Etwa,ein,halbes,Grad,südlich,des,linken,Gürtelsterns,Alnitak,befindet,sich,der,berühmte,Pferdekopfnebel,B,"33,",eine,"Dunkelwolke,",die,sich,deutlich,vor,dem,Emissionsnebel,IC,434,abzeichnetIm,Orion,befindet,sich,auch,der,Emissionsnebel,Barnards,"Loop,",der,sich,in,einem,weiten,Bogen,von,etwa,12,Durchmesser,von,Norden,her,um,die,Gürtelsterne,zieht,und,im,Süden,bis,nahe,Rigel,reicht,""}	Orion Das Sternbild liegt auf dem Himmelsäquator zwischen dem Fluss Eridanus und dem Einhorn und ist in Mitteleuropa etwa von August (Morgenhimmel) bis April (Abendhimmel) zu sehen, auf der Südhalbkugel in höheren Breitengraden etwa von Juli (Morgenhimmel) bis Mai (Abendhimmel).\r\n\r\nIm Zyklus der Präzession erscheint es gegenwärtig an seiner fast nördlichsten Stellung, wird seine südlichste in 13.000 Jahren erreichen und dann von Mitteleuropa aus nicht mehr vollständig zu sehen sein.\r\n\r\nDer Orion ist ein mythischer Himmelsjäger, dabei bilden die Sterne Beteigeuze (α Orionis, Bestandteil des Winterdreiecks), und Bellatrix (γ) die Schulter, die Sterne Rigel (β Orionis, Eckpunkt des Wintersechsecks) und Saiph (κ) die Füße. Die Sterne des Gürtels Alnitak, Alnilam und Mintaka (ζ, ε und δ Orionis) in stark überstrecktem Winkel werden auch drei Könige, Jakobsstab oder Jakobsleiter genannt und sind Teil des offenen Sternhaufens Cr 70.\r\n\r\nDie Hauptsterne – abgesehen vom roten Riesen Beteigeuze – weisen ein ähnliches Alter und ähnliche Zustandsgrößen auf, was eine gemeinsame Entstehung vermuten lässt.\r\n\r\nIn der unteren Hälfte in der Mitte des „Schwertgehänges“ des Orion ist der flächenhellste Emissionsnebel als Orionnebel M 42 mit freiem Auge zu sehen. Das ausgeprägte Sternentstehungsgebiet umgibt die Trapezsterne θ1 Orionis und θ2 Orionis und stellt die leuchtende Spitze eines ausgedehnten Wolkenkomplexes interstellarer Materie dar, der das gesamte Sternbild durchzieht. Nördlich über M42 grenzt der Teilnebel M43 an, auch kleiner Orionnebel oder de Mairans Nebel bezeichnet.\r\n\r\nAls „Schwertgehänge“ wird eine Kette von Sternen bezeichnet, die sich von Norden nach Süden aus M42 , θ und ι Orionis zusammensetzt. Nördlich liegt der offene Sternhaufen NGC 1981.\r\n\r\nDer etwa 8° lange Bogen der schwächeren Sterne π1, π2, π3, π4, π5 und π6 Orionis wird in verschiedenen alten Darstellungen als Keule, Bogen und bei Albrecht Dürer als Umhang interpretiert.\r\n\r\nDer Stern Meissa (λ Orionis), der Orions Kopf markiert, befindet sich in dem offenen Sternhaufen Cr 69.\r\n\r\nEtwa ein halbes Grad südlich des linken Gürtelsterns Alnitak befindet sich der berühmte Pferdekopfnebel B 33, eine Dunkelwolke, die sich deutlich vor dem Emissionsnebel IC 434 abzeichnet.\r\n\r\nIm Orion befindet sich auch der Emissionsnebel Barnard’s Loop, der sich in einem weiten Bogen von etwa 12° Durchmesser von Norden her um die Gürtelsterne zieht und im Süden bis nahe Rigel reicht. 	8	\N	\N
Mars	Der Mars ist, von der Sonne aus gezählt, der vierte Planet im Sonnensystem und der äußere Nachbar der Erde. Er zählt zu den erdähnlichen (terrestrischen) Planeten.\r\n\r\nSein Durchmesser ist mit knapp 6800 Kilometern etwa halb so groß wie der der Erde, sein Volumen beträgt gut ein Siebtel des Erdvolumens. Damit ist der Mars nach dem Merkur der zweitkleinste Planet des Sonnensystems, hat jedoch eine vielfältige Geologie und die höchsten Vulkane des Sonnensystems. Mit einer durchschnittlichen Entfernung von 228 Millionen Kilometern ist er rund 1,5-mal so weit von der Sonne entfernt wie die Erde.\r\n\r\nDie Masse des Mars beträgt etwa ein Zehntel der Erdmasse. Die Fallbeschleunigung auf seiner Oberfläche beträgt 3,69 m/s², dies entspricht etwa 38 % der irdischen. Mit einer Dichte von 3,9 g/cm³ weist der Mars den geringsten Wert der terrestrischen Planeten auf. Deshalb ist die Schwerkraft auf ihm sogar geringfügig niedriger als auf dem kleineren, jedoch dichteren Merkur.\r\n\r\nDer Mars wird oft auch als der Rote Planet bezeichnet. Diese Färbung geht auf Eisenoxid-Staub (Rost) zurück, der sich auf der Oberfläche und in der dünnen CO2-Atmosphäre verteilt hat. Seine orange- bis blutrote Farbe und seine Helligkeitsschwankungen am irdischen Nachthimmel sind auch der Grund für seine Namensgebung nach dem römischen Kriegsgott Mars.[3]\r\n\r\nIn größeren Fernrohren deutlich sichtbar sind die zwei Polkappen und mehrere dunkle Ebenen, die sich im Frühjahr etwas verfärben. Fotos von Raumsonden zeigen eine teilweise mit Kratern bedeckte Oberfläche und starke Spuren früherer Tektonik (tiefe Canyons und einen über 20 km hohen Vulkan). Marsroboter haben schon mehrere Gebiete geologisch untersucht.\r\n\r\nDer Mars besitzt zwei kleine, unregelmäßig geformte Monde, die 1877 entdeckt wurden: Phobos und Deimos (griechisch für Furcht und Schrecken).\r\n\r\nDas astronomische Symbol des Mars ist ♂. 	2020-02-11 14:51:54.860224	\N	{Der,Mars,"ist,",von,der,Sonne,aus,"gezählt,",der,vierte,Planet,im,Sonnensystem,und,der,äußere,Nachbar,der,Erde,Er,zählt,zu,den,erdähnlichen,terrestrischen,PlanetenSein,Durchmesser,ist,mit,knapp,6800,Kilometern,etwa,halb,so,groß,wie,der,der,"Erde,",sein,Volumen,beträgt,gut,ein,Siebtel,des,Erdvolumens,Damit,ist,der,Mars,nach,dem,Merkur,der,zweitkleinste,Planet,des,"Sonnensystems,",hat,jedoch,eine,vielfältige,Geologie,und,die,höchsten,Vulkane,des,Sonnensystems,Mit,einer,durchschnittlichen,Entfernung,von,228,Millionen,Kilometern,ist,er,rund,"1,5mal",so,weit,von,der,Sonne,entfernt,wie,die,ErdeDie,Masse,des,Mars,beträgt,etwa,ein,Zehntel,der,Erdmasse,Die,Fallbeschleunigung,auf,seiner,Oberfläche,beträgt,"3,69","ms,",dies,entspricht,etwa,38,"",der,irdischen,Mit,einer,Dichte,von,"3,9",gcm,weist,der,Mars,den,geringsten,Wert,der,terrestrischen,Planeten,auf,Deshalb,ist,die,Schwerkraft,auf,ihm,sogar,geringfügig,niedriger,als,auf,dem,"kleineren,",jedoch,dichteren,MerkurDer,Mars,wird,oft,auch,als,der,Rote,Planet,bezeichnet,Diese,Färbung,geht,auf,EisenoxidStaub,Rost,"zurück,",der,sich,auf,der,Oberfläche,und,in,der,dünnen,CO2Atmosphäre,verteilt,hat,Seine,orange,bis,blutrote,Farbe,und,seine,Helligkeitsschwankungen,am,irdischen,Nachthimmel,sind,auch,der,Grund,für,seine,Namensgebung,nach,dem,römischen,Kriegsgott,Mars3In,größeren,Fernrohren,deutlich,sichtbar,sind,die,zwei,Polkappen,und,mehrere,dunkle,"Ebenen,",die,sich,im,Frühjahr,etwas,verfärben,Fotos,von,Raumsonden,zeigen,eine,teilweise,mit,Kratern,bedeckte,Oberfläche,und,starke,Spuren,früherer,Tektonik,tiefe,Canyons,und,einen,über,20,km,hohen,Vulkan,Marsroboter,haben,schon,mehrere,Gebiete,geologisch,untersuchtDer,Mars,besitzt,zwei,"kleine,",unregelmäßig,geformte,"Monde,",die,1877,entdeckt,wurden,Phobos,und,Deimos,griechisch,für,Furcht,und,SchreckenDas,astronomische,Symbol,des,Mars,ist,"",""}	Mars Der Mars ist, von der Sonne aus gezählt, der vierte Planet im Sonnensystem und der äußere Nachbar der Erde. Er zählt zu den erdähnlichen (terrestrischen) Planeten.\r\n\r\nSein Durchmesser ist mit knapp 6800 Kilometern etwa halb so groß wie der der Erde, sein Volumen beträgt gut ein Siebtel des Erdvolumens. Damit ist der Mars nach dem Merkur der zweitkleinste Planet des Sonnensystems, hat jedoch eine vielfältige Geologie und die höchsten Vulkane des Sonnensystems. Mit einer durchschnittlichen Entfernung von 228 Millionen Kilometern ist er rund 1,5-mal so weit von der Sonne entfernt wie die Erde.\r\n\r\nDie Masse des Mars beträgt etwa ein Zehntel der Erdmasse. Die Fallbeschleunigung auf seiner Oberfläche beträgt 3,69 m/s², dies entspricht etwa 38 % der irdischen. Mit einer Dichte von 3,9 g/cm³ weist der Mars den geringsten Wert der terrestrischen Planeten auf. Deshalb ist die Schwerkraft auf ihm sogar geringfügig niedriger als auf dem kleineren, jedoch dichteren Merkur.\r\n\r\nDer Mars wird oft auch als der Rote Planet bezeichnet. Diese Färbung geht auf Eisenoxid-Staub (Rost) zurück, der sich auf der Oberfläche und in der dünnen CO2-Atmosphäre verteilt hat. Seine orange- bis blutrote Farbe und seine Helligkeitsschwankungen am irdischen Nachthimmel sind auch der Grund für seine Namensgebung nach dem römischen Kriegsgott Mars.[3]\r\n\r\nIn größeren Fernrohren deutlich sichtbar sind die zwei Polkappen und mehrere dunkle Ebenen, die sich im Frühjahr etwas verfärben. Fotos von Raumsonden zeigen eine teilweise mit Kratern bedeckte Oberfläche und starke Spuren früherer Tektonik (tiefe Canyons und einen über 20 km hohen Vulkan). Marsroboter haben schon mehrere Gebiete geologisch untersucht.\r\n\r\nDer Mars besitzt zwei kleine, unregelmäßig geformte Monde, die 1877 entdeckt wurden: Phobos und Deimos (griechisch für Furcht und Schrecken).\r\n\r\nDas astronomische Symbol des Mars ist ♂. 	9	\N	\N
Venus	Die Venus ist mit einer durchschnittlichen Sonnenentfernung von 108 Millionen Kilometern der zweitinnerste und mit einem Durchmesser von ca. 12.100 Kilometern der drittkleinste Planet des Sonnensystems. Sie zählt zu den vier erdähnlichen Planeten, die auch terrestrische oder Gesteinsplaneten genannt werden.\r\n\r\nDie Venus ist der Planet, der auf seiner Umlaufbahn der Erdbahn mit einem minimalen Abstand von 38 Millionen Kilometern am nächsten kommt. Sie hat eine ähnliche Größe wie die Erde, unterscheidet sich aber in Bezug auf die Geologie und vor allem hinsichtlich ihrer Atmosphäre. Diese besteht zu 96 % aus CO2, und ihr Oberflächendruck ist 90-mal höher als auf der Erde.\r\n\r\nNach dem Mond ist die Venus das hellste Gestirn am nächtlichen Himmel. Weil sie als einer der unteren Planeten nur am Morgen- oder Abendhimmel sichtbar ist und nie gegen Mitternacht, wird sie auch Morgenstern und Abendstern genannt. Schon mit einem kleinen Fernrohr ist sie auch am Taghimmel beobachtbar, manchmal sogar freiäugig. Doch auch bei Erdnähe (ca. alle 1½ Jahre) lassen sich nur die Wolkenstreifen der äußerst dichten Atmosphäre erkennen. Die Erkundung der Oberfläche erfordert Radar.\r\n\r\nDas astronomische Symbol des Planeten Venus gilt als stilisierte Repräsentation des Handspiegels der namensgebenden römischen Liebesgöttin Venus: ♀[3] 	2020-02-11 14:52:41.527601	\N	{Die,Venus,ist,mit,einer,durchschnittlichen,Sonnenentfernung,von,108,Millionen,Kilometern,der,zweitinnerste,und,mit,einem,Durchmesser,von,ca,12100,Kilometern,der,drittkleinste,Planet,des,Sonnensystems,Sie,zählt,zu,den,vier,erdähnlichen,"Planeten,",die,auch,terrestrische,oder,Gesteinsplaneten,genannt,werdenDie,Venus,ist,der,"Planet,",der,auf,seiner,Umlaufbahn,der,Erdbahn,mit,einem,minimalen,Abstand,von,38,Millionen,Kilometern,am,nächsten,kommt,Sie,hat,eine,ähnliche,Größe,wie,die,"Erde,",unterscheidet,sich,aber,in,Bezug,auf,die,Geologie,und,vor,allem,hinsichtlich,ihrer,Atmosphäre,Diese,besteht,zu,96,"",aus,"CO2,",und,ihr,Oberflächendruck,ist,90mal,höher,als,auf,der,ErdeNach,dem,Mond,ist,die,Venus,das,hellste,Gestirn,am,nächtlichen,Himmel,Weil,sie,als,einer,der,unteren,Planeten,nur,am,Morgen,oder,Abendhimmel,sichtbar,ist,und,nie,gegen,"Mitternacht,",wird,sie,auch,Morgenstern,und,Abendstern,genannt,Schon,mit,einem,kleinen,Fernrohr,ist,sie,auch,am,Taghimmel,"beobachtbar,",manchmal,sogar,freiäugig,Doch,auch,bei,Erdnähe,ca,alle,1,Jahre,lassen,sich,nur,die,Wolkenstreifen,der,äußerst,dichten,Atmosphäre,erkennen,Die,Erkundung,der,Oberfläche,erfordert,RadarDas,astronomische,Symbol,des,Planeten,Venus,gilt,als,stilisierte,Repräsentation,des,Handspiegels,der,namensgebenden,römischen,Liebesgöttin,Venus,3,""}	Venus Die Venus ist mit einer durchschnittlichen Sonnenentfernung von 108 Millionen Kilometern der zweitinnerste und mit einem Durchmesser von ca. 12.100 Kilometern der drittkleinste Planet des Sonnensystems. Sie zählt zu den vier erdähnlichen Planeten, die auch terrestrische oder Gesteinsplaneten genannt werden.\r\n\r\nDie Venus ist der Planet, der auf seiner Umlaufbahn der Erdbahn mit einem minimalen Abstand von 38 Millionen Kilometern am nächsten kommt. Sie hat eine ähnliche Größe wie die Erde, unterscheidet sich aber in Bezug auf die Geologie und vor allem hinsichtlich ihrer Atmosphäre. Diese besteht zu 96 % aus CO2, und ihr Oberflächendruck ist 90-mal höher als auf der Erde.\r\n\r\nNach dem Mond ist die Venus das hellste Gestirn am nächtlichen Himmel. Weil sie als einer der unteren Planeten nur am Morgen- oder Abendhimmel sichtbar ist und nie gegen Mitternacht, wird sie auch Morgenstern und Abendstern genannt. Schon mit einem kleinen Fernrohr ist sie auch am Taghimmel beobachtbar, manchmal sogar freiäugig. Doch auch bei Erdnähe (ca. alle 1½ Jahre) lassen sich nur die Wolkenstreifen der äußerst dichten Atmosphäre erkennen. Die Erkundung der Oberfläche erfordert Radar.\r\n\r\nDas astronomische Symbol des Planeten Venus gilt als stilisierte Repräsentation des Handspiegels der namensgebenden römischen Liebesgöttin Venus: ♀[3] 	10	\N	\N
Poseidon	Poseidon (griechisch Ποσειδῶν Poseidṓn) ist in der griechischen Mythologie der Gott des Meeres, Bruder des Zeus und eine der zwölf olympischen Gottheiten, den Olympioi. Das Pferd ist ihm heilig, weshalb Hippios (lateinisch Hippius) einer seiner Beinamen ist.\r\n\r\nIn der etruskischen Mythologie wurde er dem Nethuns gleichgesetzt, in der römischen dem Neptun. In der Tiefe des Meeres steht sein kristallener Palast. 	2020-02-11 14:53:28.958975	\N	{Poseidon,griechisch,"",Poseidn,ist,in,der,griechischen,Mythologie,der,Gott,des,"Meeres,",Bruder,des,Zeus,und,eine,der,zwölf,olympischen,"Gottheiten,",den,Olympioi,Das,Pferd,ist,ihm,"heilig,",weshalb,Hippios,lateinisch,Hippius,einer,seiner,Beinamen,istIn,der,etruskischen,Mythologie,wurde,er,dem,Nethuns,"gleichgesetzt,",in,der,römischen,dem,Neptun,In,der,Tiefe,des,Meeres,steht,sein,kristallener,Palast,""}	Poseidon Poseidon (griechisch Ποσειδῶν Poseidṓn) ist in der griechischen Mythologie der Gott des Meeres, Bruder des Zeus und eine der zwölf olympischen Gottheiten, den Olympioi. Das Pferd ist ihm heilig, weshalb Hippios (lateinisch Hippius) einer seiner Beinamen ist.\r\n\r\nIn der etruskischen Mythologie wurde er dem Nethuns gleichgesetzt, in der römischen dem Neptun. In der Tiefe des Meeres steht sein kristallener Palast. 	11	\N	\N
Cäsar	Gaius Iulius Caesar (deutsch: Gaius Julius Cäsar; * 13. Juli[1] 100 v. Chr. in Rom; † 15. März 44 v. Chr. in Rom) war ein römischer Staatsmann, Feldherr und Autor, der maßgeblich zum Ende der Römischen Republik beitrug und dadurch an ihrer späteren Umwandlung in ein Kaiserreich beteiligt war.\r\n\r\nDer patrizischen Familie der Julier entstammend, absolvierte er die Ämterlaufbahn und gelangte durch ein Bündnis mit dem reichen Marcus Licinius Crassus und dem erfolgreichen Militär Gnaeus Pompeius Magnus im Jahr 59 v. Chr. zum Konsulat. In den folgenden Jahren ging Caesar als Prokonsul in die nördlichen Provinzen Illyrien und Gallia Cis- und Transalpina, von wo aus er in den Jahren 58 bis 51 v. Chr. ganz Gallien bis zum Rhein eroberte. Im anschließenden Römischen Bürgerkrieg von 49 bis 45 v. Chr. setzte er sich gegen seinen ehemaligen Verbündeten Pompeius und dessen Anhänger durch und errang die Alleinherrschaft. Nach seiner Ernennung zum Diktator auf Lebenszeit fiel er einem Attentat zum Opfer. Sein Großneffe und Haupterbe Gaius Octavius (später Kaiser Augustus) setzte das Prinzipat als neue Staatsform des Römischen Reiches endgültig durch.\r\n\r\nDer Name Caesars wurde zum Bestandteil des Titels aller nachfolgenden Herrscher des römischen Kaiserreichs. In der römischen Spätantike und im Byzantinischen Reich bezeichnete der Titel „Caesar“ einen Mitherrscher oder Thronfolger. In den entlehnten Formen Kaiser und Zar wurde der Name später auch zum Titel der Herrscher des Heiligen Römischen, des Österreichischen, des Deutschen, des Bulgarischen, des Serbischen und des Russischen Reiches. 	2020-02-11 14:53:51.670182	\N	{Gaius,Iulius,Caesar,deutsch,Gaius,Julius,Cäsar,"",13,Juli1,100,v,Chr,in,Rom,"",15,März,44,v,Chr,in,Rom,war,ein,römischer,"Staatsmann,",Feldherr,und,"Autor,",der,maßgeblich,zum,Ende,der,Römischen,Republik,beitrug,und,dadurch,an,ihrer,späteren,Umwandlung,in,ein,Kaiserreich,beteiligt,warDer,patrizischen,Familie,der,Julier,"entstammend,",absolvierte,er,die,mterlaufbahn,und,gelangte,durch,ein,Bündnis,mit,dem,reichen,Marcus,Licinius,Crassus,und,dem,erfolgreichen,Militär,Gnaeus,Pompeius,Magnus,im,Jahr,59,v,Chr,zum,Konsulat,In,den,folgenden,Jahren,ging,Caesar,als,Prokonsul,in,die,nördlichen,Provinzen,Illyrien,und,Gallia,Cis,und,"Transalpina,",von,wo,aus,er,in,den,Jahren,58,bis,51,v,Chr,ganz,Gallien,bis,zum,Rhein,eroberte,Im,anschließenden,Römischen,Bürgerkrieg,von,49,bis,45,v,Chr,setzte,er,sich,gegen,seinen,ehemaligen,Verbündeten,Pompeius,und,dessen,Anhänger,durch,und,errang,die,Alleinherrschaft,Nach,seiner,Ernennung,zum,Diktator,auf,Lebenszeit,fiel,er,einem,Attentat,zum,Opfer,Sein,Großneffe,und,Haupterbe,Gaius,Octavius,später,Kaiser,Augustus,setzte,das,Prinzipat,als,neue,Staatsform,des,Römischen,Reiches,endgültig,durchDer,Name,Caesars,wurde,zum,Bestandteil,des,Titels,aller,nachfolgenden,Herrscher,des,römischen,Kaiserreichs,In,der,römischen,Spätantike,und,im,Byzantinischen,Reich,bezeichnete,der,Titel,Caesar,einen,Mitherrscher,oder,Thronfolger,In,den,entlehnten,Formen,Kaiser,und,Zar,wurde,der,Name,später,auch,zum,Titel,der,Herrscher,des,Heiligen,"Römischen,",des,"sterreichischen,",des,"Deutschen,",des,"Bulgarischen,",des,Serbischen,und,des,Russischen,Reiches,""}	Cäsar Gaius Iulius Caesar (deutsch: Gaius Julius Cäsar; * 13. Juli[1] 100 v. Chr. in Rom; † 15. März 44 v. Chr. in Rom) war ein römischer Staatsmann, Feldherr und Autor, der maßgeblich zum Ende der Römischen Republik beitrug und dadurch an ihrer späteren Umwandlung in ein Kaiserreich beteiligt war.\r\n\r\nDer patrizischen Familie der Julier entstammend, absolvierte er die Ämterlaufbahn und gelangte durch ein Bündnis mit dem reichen Marcus Licinius Crassus und dem erfolgreichen Militär Gnaeus Pompeius Magnus im Jahr 59 v. Chr. zum Konsulat. In den folgenden Jahren ging Caesar als Prokonsul in die nördlichen Provinzen Illyrien und Gallia Cis- und Transalpina, von wo aus er in den Jahren 58 bis 51 v. Chr. ganz Gallien bis zum Rhein eroberte. Im anschließenden Römischen Bürgerkrieg von 49 bis 45 v. Chr. setzte er sich gegen seinen ehemaligen Verbündeten Pompeius und dessen Anhänger durch und errang die Alleinherrschaft. Nach seiner Ernennung zum Diktator auf Lebenszeit fiel er einem Attentat zum Opfer. Sein Großneffe und Haupterbe Gaius Octavius (später Kaiser Augustus) setzte das Prinzipat als neue Staatsform des Römischen Reiches endgültig durch.\r\n\r\nDer Name Caesars wurde zum Bestandteil des Titels aller nachfolgenden Herrscher des römischen Kaiserreichs. In der römischen Spätantike und im Byzantinischen Reich bezeichnete der Titel „Caesar“ einen Mitherrscher oder Thronfolger. In den entlehnten Formen Kaiser und Zar wurde der Name später auch zum Titel der Herrscher des Heiligen Römischen, des Österreichischen, des Deutschen, des Bulgarischen, des Serbischen und des Russischen Reiches. 	12	\N	\N
Dunnig-Kruger-Effekt	Die Neigung stammt von der Unfähigkeit ab, mittels der Metakognition sich selbst objektiv beurteilen zu können. Der populärwissenschaftliche Begriff geht auf eine Publikation von David Dunning und Justin Kruger aus dem Jahr 1999 zurück. Dunning und Kruger hatten in vorausgegangenen Studien bemerkt, dass etwa beim Erfassen von Texten, beim Schachspielen oder Autofahren Unwissenheit oft zu mehr Selbstvertrauen führt als Wissen.[3]\r\n\r\nAn der Cornell University erforschten die beiden Wissenschaftler diesen Effekt in weiteren Experimenten und kamen 1999 zum Resultat, dass weniger kompetente Personen\r\n\r\n    dazu neigen, ihre eigenen Fähigkeiten zu überschätzen,\r\n    überlegene Fähigkeiten bei anderen nicht erkennen,\r\n    das Ausmaß ihrer Inkompetenz nicht zu erkennen vermögen,\r\n    durch Bildung oder Übung nicht nur ihre Kompetenz steigern, sondern auch lernen können, sich und andere besser einzuschätzen.\r\n\r\nDunning und Kruger zeigten, dass schwache Leistungen bei solchen Menschen häufig mit größerer Selbstüberschätzung einhergehen als stärkere Leistungen.\r\n\r\n    „Wenn jemand inkompetent ist, dann kann er nicht wissen, dass er inkompetent ist. […] Die Fähigkeiten, die man braucht, um eine richtige Lösung zu finden, [sind] genau jene Fähigkeiten, die man braucht, um eine Lösung als richtig zu erkennen.“\r\n\r\n– David Dunning[4]\r\n\r\nIn der psychologischen Fachliteratur wird der Dunning-Kruger-Effekt nur selten angeführt, in Blogs und Diskussionsforen des Internets und in akademischen Publikationen außerhalb der Psychologie hingegen häufig.[5][6][7][8] In einer kognitionswissenschaftlichen Publikation zur Leugnung der menschengemachten globalen Erwärmung wird der Dunning-Kruger-Effekt als eine mögliche Erklärung für die Ignoranz gegenüber wissenschaftlichen Prozessen genannt.[9]\r\n\r\nIm Jahr 2000 erhielten Dunning und Kruger für ihre Studie den satirischen Ig-Nobelpreis im Bereich Psychologie.[10] 	2020-02-11 14:56:07.774088	2020-02-11 14:56:24.889097	{Die,Neigung,stammt,von,der,Unfähigkeit,"ab,",mittels,der,Metakognition,sich,selbst,objektiv,beurteilen,zu,können,Der,populärwissenschaftliche,Begriff,geht,auf,eine,Publikation,von,David,Dunning,und,Justin,Kruger,aus,dem,Jahr,1999,zurück,Dunning,und,Kruger,hatten,in,vorausgegangenen,Studien,"bemerkt,",dass,etwa,beim,Erfassen,von,"Texten,",beim,Schachspielen,oder,Autofahren,Unwissenheit,oft,zu,mehr,Selbstvertrauen,führt,als,Wissen3An,der,Cornell,University,erforschten,die,beiden,Wissenschaftler,diesen,Effekt,in,weiteren,Experimenten,und,kamen,1999,zum,"Resultat,",dass,weniger,kompetente,Personen,"","","",dazu,"neigen,",ihre,eigenen,Fähigkeiten,zu,"überschätzen,","","","",überlegene,Fähigkeiten,bei,anderen,nicht,"erkennen,","","","",das,Ausmaß,ihrer,Inkompetenz,nicht,zu,erkennen,"vermögen,","","","",durch,Bildung,oder,bung,nicht,nur,ihre,Kompetenz,"steigern,",sondern,auch,lernen,"können,",sich,und,andere,besser,einzuschätzenDunning,und,Kruger,"zeigten,",dass,schwache,Leistungen,bei,solchen,Menschen,häufig,mit,größerer,Selbstüberschätzung,einhergehen,als,stärkere,Leistungen,"","","",Wenn,jemand,inkompetent,"ist,",dann,kann,er,nicht,"wissen,",dass,er,inkompetent,ist,"",Die,"Fähigkeiten,",die,man,"braucht,",um,eine,richtige,Lösung,zu,"finden,",sind,genau,jene,"Fähigkeiten,",die,man,"braucht,",um,eine,Lösung,als,richtig,zu,erkennen,David,Dunning4In,der,psychologischen,Fachliteratur,wird,der,DunningKrugerEffekt,nur,selten,"angeführt,",in,Blogs,und,Diskussionsforen,des,Internets,und,in,akademischen,Publikationen,außerhalb,der,Psychologie,hingegen,häufig5678,In,einer,kognitionswissenschaftlichen,Publikation,zur,Leugnung,der,menschengemachten,globalen,Erwärmung,wird,der,DunningKrugerEffekt,als,eine,mögliche,Erklärung,für,die,Ignoranz,gegenüber,wissenschaftlichen,Prozessen,genannt9Im,Jahr,2000,erhielten,Dunning,und,Kruger,für,ihre,Studie,den,satirischen,IgNobelpreis,im,Bereich,Psychologie10,""}	Dunnig-Kruger-Effekt Die Neigung stammt von der Unfähigkeit ab, mittels der Metakognition sich selbst objektiv beurteilen zu können. Der populärwissenschaftliche Begriff geht auf eine Publikation von David Dunning und Justin Kruger aus dem Jahr 1999 zurück. Dunning und Kruger hatten in vorausgegangenen Studien bemerkt, dass etwa beim Erfassen von Texten, beim Schachspielen oder Autofahren Unwissenheit oft zu mehr Selbstvertrauen führt als Wissen.[3]\r\n\r\nAn der Cornell University erforschten die beiden Wissenschaftler diesen Effekt in weiteren Experimenten und kamen 1999 zum Resultat, dass weniger kompetente Personen\r\n\r\n    dazu neigen, ihre eigenen Fähigkeiten zu überschätzen,\r\n    überlegene Fähigkeiten bei anderen nicht erkennen,\r\n    das Ausmaß ihrer Inkompetenz nicht zu erkennen vermögen,\r\n    durch Bildung oder Übung nicht nur ihre Kompetenz steigern, sondern auch lernen können, sich und andere besser einzuschätzen.\r\n\r\nDunning und Kruger zeigten, dass schwache Leistungen bei solchen Menschen häufig mit größerer Selbstüberschätzung einhergehen als stärkere Leistungen.\r\n\r\n    „Wenn jemand inkompetent ist, dann kann er nicht wissen, dass er inkompetent ist. […] Die Fähigkeiten, die man braucht, um eine richtige Lösung zu finden, [sind] genau jene Fähigkeiten, die man braucht, um eine Lösung als richtig zu erkennen.“\r\n\r\n– David Dunning[4]\r\n\r\nIn der psychologischen Fachliteratur wird der Dunning-Kruger-Effekt nur selten angeführt, in Blogs und Diskussionsforen des Internets und in akademischen Publikationen außerhalb der Psychologie hingegen häufig.[5][6][7][8] In einer kognitionswissenschaftlichen Publikation zur Leugnung der menschengemachten globalen Erwärmung wird der Dunning-Kruger-Effekt als eine mögliche Erklärung für die Ignoranz gegenüber wissenschaftlichen Prozessen genannt.[9]\r\n\r\nIm Jahr 2000 erhielten Dunning und Kruger für ihre Studie den satirischen Ig-Nobelpreis im Bereich Psychologie.[10] 	14	\N	\N
Neu	Neues	2020-06-03 15:06:51.540759	\N	{Neues}	Neu Neues	15	\N	\N
adasda	adas asdasd aadsad	2020-10-29 16:57:20.238151	\N	{adas,asdasd,aadsad}	adasda adas asdasd aadsad	16	[1,2,3]	[1,2]
\.


--
-- Data for Name: kalender; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kalender (datum, f1, f2, f3, u1, b1, f1text, f2text, f3text, b1text, u1text, f4, f4text) FROM stdin;
2019-07-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-29	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-30	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-31	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-01	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-05	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-06	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-07	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-08	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-13	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-10-03	t	\N	\N	\N	\N	Tag der deutschen Einheit	\N	\N	\N	\N	\N	\N
2019-10-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2018-01-02	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-12	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-13	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-14	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-15	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-16	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-19	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-20	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-21	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-22	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-23	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-29	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-30	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	\N	\N	\N
2018-04-02	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	\N	\N	\N
2018-04-03	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-04	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-05	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-06	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-01	t	\N	\N	\N	\N	Tag der Arbeit	\N	\N	\N	\N	\N	\N
2018-05-10	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2018-05-11	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-21	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2018-05-22	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-02	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-03	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-04	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-05	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-06	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-09	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-10	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-11	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-12	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-13	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-16	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-17	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-18	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-19	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-20	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-23	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-24	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-25	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-26	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-27	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-30	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-31	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-01	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-02	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-03	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-06	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-07	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-08	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-09	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-10	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-08	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-09	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-10	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-11	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-12	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-15	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-16	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-17	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-18	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-19	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-03	t	\N	\N	\N	\N	Tag der Einheit	\N	\N	\N	\N	\N	\N
2018-10-31	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N	\N
2018-12-25	t	\N	\N	\N	\N	1. Weihnachtsfeiertag	\N	\N	\N	\N	\N	\N
2018-12-26	t	\N	\N	\N	\N	2.Weihnachtsfeiertag	\N	\N	\N	\N	\N	\N
2018-12-24	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-27	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-28	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-31	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2018-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2018-11-21	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2019-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2018-01-01	t	\N	\N	\N	\N	Neujahr	\N	\N	\N	\N	\N	\N
2019-11-20	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2019-12-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2019-01-01	t	\N	\N	t	\N	Neujahr	\N	\N	\N	Weihnachtsferien	\N	\N
2019-01-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2019-01-03	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2019-01-04	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2019-01-06	\N	\N	t	\N	\N	\N	\N	Heilige drei Könige	\N	\N	\N	\N
2019-02-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-02-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-02-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-02-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-02-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-02-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-02-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-02-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-02-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-03-01	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-04-19	t	\N	\N	t	\N	Karfreitag	\N	\N	\N	Osterferien	\N	\N
2019-04-21	t	\N	\N	\N	\N	Ostersonntag	\N	\N	\N	\N	\N	\N
2019-04-22	t	\N	\N	t	\N	Ostermontag	\N	\N	\N	Osterferien	\N	\N
2019-04-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2019-04-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2019-04-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2019-04-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2019-05-01	t	\N	\N	\N	\N	Tag der Arbeit	\N	\N	\N	\N	\N	\N
2019-05-30	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2019-05-31	\N	\N	\N	t	\N	\N	\N	\N	\N	Pfingstferien	\N	\N
2019-06-09	t	\N	\N	\N	\N	Pfingstsonntag	\N	\N	\N	\N	\N	\N
2019-06-10	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2019-06-20	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2019-07-08	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-10	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-12-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2019-12-25	t	\N	\N	t	\N	1. Weihnachtsfeiertag	\N	\N	\N	Weihnachtsferien	\N	\N
2019-12-26	t	\N	\N	t	\N	2.Weihnachtsfeiertag	\N	\N	\N	Weihnachtsferien	\N	\N
2019-12-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2019-12-30	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2019-12-31	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2021-11-17	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2023-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2024-11-20	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2019-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2020-01-01	t	\N	\N	\N	\N	Neujahrstag			\N		\N	
2020-01-02	\N	\N	\N	t	\N				\N	Weihnachtsferien	\N	
2020-01-03	\N	\N	\N	t	\N				\N	Weihnachtsferien	\N	
2020-01-06	\N	\N	t	\N	\N			Heilige Drei Könige	\N		\N	
2020-02-10	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-11	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-12	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-13	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-14	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-17	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-18	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-19	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-20	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-21	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-04-10	t	\N	\N	\N	\N	Karfreitag			\N		\N	
2020-04-13	t	\N	\N	\N	\N	Ostermontag			\N		\N	
2020-04-14	\N	\N	\N	t	\N				\N	Osterferien	\N	
2020-04-15	\N	\N	\N	t	\N				\N	Osterferien	\N	
2020-04-16	\N	\N	\N	t	\N				\N	Osterferien	\N	
2020-04-17	\N	\N	\N	t	\N				\N	Osterferien	\N	
2020-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai			\N		\N	
2020-05-21	t	\N	\N	\N	\N	Christi Himmelfahrt			\N		\N	
2020-05-22	\N	\N	\N	t	\N				\N	Brückentag	\N	
2020-06-01	t	\N	\N	\N	\N	Pfingstmontag			\N		\N	
2020-06-11	\N	\N	t	\N	\N			Fronleichnam	\N		\N	
2020-07-20	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-21	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-22	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-23	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-24	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-27	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-28	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-29	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-30	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-31	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-03	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-04	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-05	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-06	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-07	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-10	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-11	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-12	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-13	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-14	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-17	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-18	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-19	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-20	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-21	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-24	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-25	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-26	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-27	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-28	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit			\N		\N	
2020-10-19	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-20	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-21	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-22	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-23	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-26	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-27	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-28	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-29	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-30	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-31	\N	t	\N	\N	\N		Reformationstag		\N		\N	
2020-11-01	\N	\N	t	\N	\N			Allerheiligen	\N		\N	
2020-11-18	\N	t	\N	\N	\N		Buß- und Bettag		\N		\N	
2020-12-23	\N	\N	\N	t	\N				\N	Weihnachtsferien	\N	
2020-12-24	\N	\N	\N	t	\N				\N	Weihnachtsferien	\N	
2020-12-25	t	\N	\N	\N	\N	1. Weihnachtstag			\N		\N	
2020-12-26	t	\N	\N	\N	\N	2. Weihnachtstag			\N		\N	
2020-12-28	\N	\N	\N	t	\N				\N	Weihnachtsferien	\N	
2020-12-29	\N	\N	\N	t	\N				\N	Weihnachtsferien	\N	
2020-12-30	\N	\N	\N	t	\N				\N	Weihnachtsferien	\N	
2020-12-31	\N	\N	\N	t	\N				\N	Weihnachtsferien	\N	
2021-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	\N	\N	\N
2021-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2021-02-08	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-10	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-04-02	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	\N	\N	\N
2021-04-05	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	\N	\N	\N
2021-04-06	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2021-04-07	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2021-04-08	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2021-04-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2021-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2021-05-13	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2021-05-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Pfingsten	\N	\N
2021-05-24	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2021-06-03	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2021-07-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-07-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-07-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-07-29	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-07-30	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-03	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-04	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-05	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-06	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-10	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-13	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-30	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-31	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-09-01	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-09-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-09-03	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	\N	\N	\N
2021-10-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-29	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2021-12-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2021-12-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2021-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	\N	\N	\N
2021-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	\N	\N	\N
2021-12-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2021-12-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2021-12-29	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2021-12-30	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2021-12-31	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2022-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	\N	\N	\N
2022-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2022-02-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-04-15	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	\N	\N	\N
2022-04-18	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	\N	\N	\N
2022-04-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2022-04-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2022-04-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2022-04-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2022-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2022-05-26	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2022-06-06	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2022-06-16	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2022-07-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-29	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-01	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-03	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-04	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-05	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-08	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-10	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	\N	\N	\N
2022-10-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2022-12-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2022-12-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2022-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	\N	\N	\N
2022-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	\N	\N	\N
2022-12-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2022-12-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2022-12-29	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2022-12-30	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2023-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	\N	\N	\N
2023-01-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2023-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2023-02-13	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-04-07	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	Osterferien	\N	\N
2023-04-10	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	Osterferien	\N	\N
2023-04-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2023-04-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2023-04-13	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2023-04-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2023-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2023-05-18	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2023-05-19	\N	\N	\N	t	\N	\N	\N	\N	\N	schulfreier Tag	\N	\N
2023-05-29	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2023-06-08	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2023-07-10	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-13	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2022-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2022-11-16	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2023-07-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-31	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-01	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-03	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-04	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-07	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-08	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-10	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-10-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	Herbstferien	\N	\N
2023-10-04	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-05	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-06	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-10	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-13	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-30	\N	\N	\N	t	\N	\N	\N	\N	\N	schulfreier Tag	\N	\N
2023-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2023-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	Weihnachtsferien	\N	\N
2023-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	Weihnachtsferien	\N	\N
2023-12-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2023-12-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2023-12-29	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2024-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	Weihnachtsferien	\N	\N
2024-01-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2024-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2024-02-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-13	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-03-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2024-03-29	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	Osterferien	\N	\N
2024-04-01	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	Osterferien	\N	\N
2024-04-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2024-04-03	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2024-04-04	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2024-04-05	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2024-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2024-05-09	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2024-05-10	\N	\N	\N	t	\N	\N	\N	\N	\N	schulfreier Tag	\N	\N
2024-05-20	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	Pfingstferien	\N	\N
2024-05-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Pfingstferien	\N	\N
2024-05-30	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2024-06-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-06-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-06-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-06-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-06-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-06-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-06-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-01	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-03	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-04	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-05	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-08	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-10	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-29	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-30	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-31	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	\N	\N	\N
2024-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2024-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	\N	\N	\N
2024-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	\N	\N	\N
2025-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	\N	\N	\N
2025-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2025-04-18	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	\N	\N	\N
2025-04-21	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	\N	\N	\N
2025-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2025-05-29	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2025-06-09	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2025-06-19	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2025-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	\N	\N	\N
2025-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2025-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	\N	\N	\N
2025-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	\N	\N	\N
2026-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	\N	\N	\N
2026-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2026-04-03	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	\N	\N	\N
2026-04-06	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	\N	\N	\N
2026-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2026-05-14	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2026-05-25	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2026-06-04	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2026-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	\N	\N	\N
2026-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2026-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	\N	\N	\N
2026-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	\N	\N	\N
2027-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	\N	\N	\N
2027-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2027-03-26	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	\N	\N	\N
2025-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2025-11-19	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2026-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2023-11-22	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2026-11-18	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2024-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2027-03-29	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	\N	\N	\N
2027-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2027-05-06	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2027-05-17	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2027-05-27	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2027-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	\N	\N	\N
2027-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2027-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	\N	\N	\N
2027-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	\N	\N	\N
2028-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	\N	\N	\N
2028-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2028-04-14	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	\N	\N	\N
2028-04-17	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	\N	\N	\N
2028-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2028-05-25	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2028-06-05	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2028-06-15	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2028-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	\N	\N	\N
2028-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2028-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	\N	\N	\N
2028-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	\N	\N	\N
2029-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	\N	\N	\N
2029-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2029-03-30	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	\N	\N	\N
2029-04-02	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	\N	\N	\N
2029-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2029-05-10	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2029-05-21	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2029-05-31	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2029-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	\N	\N	\N
2029-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2029-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	\N	\N	\N
2029-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	\N	\N	\N
2027-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2028-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2027-11-17	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2029-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2028-11-22	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2029-11-21	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
\.


--
-- Data for Name: kalenderbasis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kalenderbasis (datum, f1, f1text, f2, f2text, f3, f3text, f4, f4text) FROM stdin;
2018-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-04	t	\N	t	\N	\N	\N	\N	\N
2018-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-09	\N	\N	t	\N	\N	\N	\N	\N
2018-01-14	\N	\N	\N	\N	t	\N	\N	\N
2018-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-01	t	\N	\N	\N	\N	\N	\N	\N
2018-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-01	t	Neujahr	\N	\N	\N	\N	t	Weihnachtsferien
2019-01-02	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-01-03	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-01-04	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-06	\N	\N	\N	\N	t	Heilige drei Könige	\N	\N
2019-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-18	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-19	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-20	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-21	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-22	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-23	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-24	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-25	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-26	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-27	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-28	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-03-01	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-03-02	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-19	t	Karfreitag	\N	\N	\N	\N	t	Osterferien
2019-04-20	\N	\N	\N	\N	\N	\N	t	Osterferien
2019-04-21	t	Ostersonntag	\N	\N	\N	\N	t	Osterferien
2019-04-22	t	Ostermontag	\N	\N	\N	\N	t	Osterferien
2019-04-23	\N	\N	\N	\N	\N	\N	t	Osterferien
2019-04-24	\N	\N	\N	\N	\N	\N	t	Osterferien
2019-04-25	\N	\N	\N	\N	\N	\N	t	Osterferien
2019-04-26	\N	\N	\N	\N	\N	\N	t	Osterferien
2019-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-01	t	Tag der Arbeit	\N	\N	\N	\N	\N	\N
2019-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-30	t	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2019-05-31	\N	\N	\N	\N	\N	\N	t	Pfingstferien
2019-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-09	t	Pfingstsonntag	\N	\N	\N	\N	\N	\N
2019-06-10	t	Pfingstmontag	\N	\N	\N	\N	\N	\N
2019-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-20	\N	\N	\N	\N	t	Fronleichnam	\N	\N
2019-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2019-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2019-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-07-08	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-09	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-10	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-11	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-12	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-13	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-14	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-15	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-16	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-17	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-18	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-19	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-20	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-21	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-22	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-23	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-24	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-25	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-26	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-27	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-28	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-29	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-30	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-31	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-01	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-02	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-03	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-04	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-05	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-06	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-07	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-08	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-09	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-10	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-11	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-12	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-13	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-14	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-15	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-16	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-03	t	Tag der deutschen Einheit	\N	\N	\N	\N	\N	\N
2019-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-14	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-15	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-16	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-17	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-18	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-19	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-20	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-21	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-22	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-23	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-24	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-25	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-31	\N	\N	t	Reformationstag	\N	\N	\N	\N
2019-11-01	\N	\N	\N	\N	t	Allerheiligen	\N	\N
2019-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-20	\N	\N	t	Buß- und Bettag	\N	\N	\N	\N
2019-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-21	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-22	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-23	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-24	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-25	t	1. Weihnachtsfeiertag	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-26	t	2.Weihnachtsfeiertag	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-27	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-28	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-29	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-30	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-31	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
\.


--
-- Data for Name: kontakte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kontakte (nachname, vorname, telefon1, telefon2, telefon3, email1, email2, email3, id, firma, fulltextarray, fulltext, user_id) FROM stdin;
Besprechungsraum		+49 35208 84 - 346						21	RF	{RF,Besprechungsraum,"",49,35208,84,"",346,"","","","",""}	RF Besprechungsraum  +49 35208 84 - 346     	\N
Andrich	Tobias	+49 35208 84 - 362			tobias.andrich@rf-fassaden.de			32	RF	{RF,Andrich,Tobias,49,35208,84,"",362,"","",tobiasandrichrffassadende,"",""}	RF Andrich Tobias +49 35208 84 - 362   tobias.andrich@rf-fassaden.de  	\N
Bewilogua	Ruben	+49 35208 84 - 354	\N	\N	ruben.bewilogua@rf-fassaden.de	\N	\N	27	RF	{bewilogua,ruben,493520884354,"","",rubenbewiloguarffassadende,"","",rf}	Bewilogua Ruben 493520884354   ruben.bewilogua@rf-fassaden.de   RF	\N
Zidek	Christian	+49 35208 84 - 342	\N	\N	christian.zidek@rf-fassaden.de	\N	\N	19	RF	{zidek,christian,493520884342,"","",christianzidekrffassadende,"","",rf}	Zidek Christian 493520884342   christian.zidek@rf-fassaden.de   RF	\N
Jahn	Thomas	+49 35208 84 - 327	\N	\N	thomas.jahn@rf-fassaden.de	\N	\N	15	RF	{jahn,thomas,493520884327,"","",thomasjahnrffassadende,"","",rf}	Jahn Thomas 493520884327   thomas.jahn@rf-fassaden.de   RF	\N
Wolf	Andreas	+49 35208 84 - 331	\N	\N	andreas.wolf@rf-fassaden.de	\N	\N	16	RF	{wolf,andreas,493520884331,"","",andreaswolfrffassadende,"","",rf}	Wolf Andreas 493520884331   andreas.wolf@rf-fassaden.de   RF	\N
Langer	Lars	+49 35208 84 - 384	\N	\N	lars.langer@rf-fassaden.de	\N	\N	43	RF	{langer,lars,493520884384,"","",larslangerrffassadende,"","",rf}	Langer Lars 493520884384   lars.langer@rf-fassaden.de   RF	\N
Kabella	Till	+49 35208 84 - 394	\N	\N	till.kabella@rf-fassaden.de	\N	\N	47	RF	{kabella,till,493520884394,"","",tillkabellarffassadende,"","",rf}	Kabella Till 493520884394   till.kabella@rf-fassaden.de   RF	\N
Zentrale	\N	+49 35208 84 - 310	\N	\N	\N	\N	\N	1	RF	{zentrale,"",493520884310,"","","","","",rf}	Zentrale  493520884310      RF	\N
Thomas	Maik	+49 35208 84 - 311	\N	\N	maik.thomas@rf-fassaden.de	\N	\N	2	RF	{thomas,maik,493520884311,"","",maikthomasrffassadende,"","",rf}	Thomas Maik 493520884311   maik.thomas@rf-fassaden.de   RF	\N
Richter	Anett	+49 35208 84 - 313			anett.richter@rf-fassaden.de	\N	\N	4	RF	{richter,anett,493520884313,"","",anettrichterrffassadende,"","",rf}	Richter Anett 493520884313   anett.richter@rf-fassaden.de   RF	\N
Drabe	Uwe	+49 35208 84 - 314			uwe.drabe@rf-fassaden.de			5	RF	{drabe,uwe,493520884314,"","",uwedraberffassadende,"","",rf}	Drabe Uwe 493520884314   uwe.drabe@rf-fassaden.de   RF	\N
Schubert	Sascha	+49 35208 84 - 315	\N	\N	sascha.schubert@rf-fassaden.de	\N	\N	6	RF	{schubert,sascha,493520884315,"","",saschaschubertrffassadende,"","",rf}	Schubert Sascha 493520884315   sascha.schubert@rf-fassaden.de   RF	\N
Besprechungsraum	\N	+49 35208 84 - 317	\N	\N	\N	\N	\N	8	RF	{besprechungsraum,"",493520884317,"","","","","",rf}	Besprechungsraum  493520884317      RF	\N
Hantschmann	Jens	+49 35208 84 - 318		\N	jens.hantschmann@rf-fassaden.de	\N	\N	9	RF	{hantschmann,jens,493520884318,"","",jenshantschmannrffassadende,"","",rf}	Hantschmann Jens 493520884318   jens.hantschmann@rf-fassaden.de   RF	\N
Pinkert	Maik	+49 35208 84 - 320	\N	\N	maik.pinkert@rf-fassaden.de	\N	\N	11	RF	{pinkert,maik,493520884320,"","",maikpinkertrffassadende,"","",rf}	Pinkert Maik 493520884320   maik.pinkert@rf-fassaden.de   RF	\N
Stuhler	Kerstin	+49 35208 84 - 339	\N	\N	kerstin.stuhler@rf-fassaden.de	\N	\N	18	RF	{stuhler,kerstin,493520884339,"","",kerstinstuhlerrffassadende,"","",rf}	Stuhler Kerstin 493520884339   kerstin.stuhler@rf-fassaden.de   RF	\N
Damme	Kerstin	+49 35208 84 - 324		\N		\N	\N	14	RF	{damme,kerstin,493520884324,"","","","","",rf}	Damme Kerstin 493520884324      RF	\N
Besprechungsraum EG	\N	+49 35208 84 - 347	\N	\N	\N	\N	\N	22	RF	{besprechungsraum,eg,"",493520884347,"","","","","",rf}	Besprechungsraum EG  493520884347      RF	\N
Lanzke	Andre	+49 35208 84 - 372	\N	\N	andre.lanzke@rf-fassaden.de	\N	\N	38	RF	{lanzke,andre,493520884372,"","",andrelanzkerffassadende,"","",rf}	Lanzke Andre 493520884372   andre.lanzke@rf-fassaden.de   RF	\N
Hähne	Janine	+49 35208 84 - 357		\N	janine.haehne@rf-fassaden.de	\N	\N	29	RF	{hähne,janine,493520884357,"","",janinehaehnerffassadende,"","",rf}	Hähne Janine 493520884357   janine.haehne@rf-fassaden.de   RF	\N
Stepanek	Rico	+49 35208 84 - 369	\N	\N	rico.stepanek@rf-fassaden.de	\N	\N	36	RF	{stepanek,rico,493520884369,"","",ricostepanekrffassadende,"","",rf}	Stepanek Rico 493520884369   rico.stepanek@rf-fassaden.de   RF	\N
Oehme	Stefan	+49 35208 84 - 379	\N	\N	stefan.oehme@rf-fassaden.de	\N	\N	41	RF	{oehme,stefan,493520884379,"","",stefanoehmerffassadende,"","",rf}	Oehme Stefan 493520884379   stefan.oehme@rf-fassaden.de   RF	\N
Minner	Sebastian	+49 35208 84 - 353	\N	\N	sebastian.minner@rf-fassaden.de	\N	\N	26	RF	{minner,sebastian,493520884353,"","",sebastianminnerrffassadende,"","",rf}	Minner Sebastian 493520884353   sebastian.minner@rf-fassaden.de   RF	\N
Stemmler	Bernd	+49 35208 84 - 355	\N	\N	bernd.stemmler@rf-fassaden.de	\N	\N	28	RF	{stemmler,bernd,493520884355,"","",berndstemmlerrffassadende,"","",rf}	Stemmler Bernd 493520884355   bernd.stemmler@rf-fassaden.de   RF	\N
Neumann	Regina	+49 35208 84 - 358	\N	\N	\N	\N	\N	30	RF	{neumann,regina,493520884358,"","","","","",rf}	Neumann Regina 493520884358      RF	\N
Pohl	Steffen	+49 35208 84 - 363	\N	\N	steffen.pohl@rf-fassaden.de	\N	\N	33	RF	{pohl,steffen,493520884363,"","",steffenpohlrffassadende,"","",rf}	Pohl Steffen 493520884363   steffen.pohl@rf-fassaden.de   RF	\N
Matthäus	Kai	+49 35208 84 - 374	\N	\N	kai.matthaeus@rf-fassaden.de	\N	\N	39	RF	{matthäus,kai,493520884374,"","",kaimatthaeusrffassadende,"","",rf}	Matthäus Kai 493520884374   kai.matthaeus@rf-fassaden.de   RF	\N
Plötner	Steffen	+49 35208 84 - 378	\N	\N	steffen.ploetner@rf-fassaden.de	\N	\N	40	RF	{plötner,steffen,493520884378,"","",steffenploetnerrffassadende,"","",rf}	Plötner Steffen 493520884378   steffen.ploetner@rf-fassaden.de   RF	\N
Geppert	Uwe	+49 35208 84 - 382			uwe.geppert@rf-fassaden.de			42	RF	{geppert,uwe,493520884382,"","",uwegeppertrffassadende,"","",rf}	Geppert Uwe 493520884382   uwe.geppert@rf-fassaden.de   RF	\N
Kürschner	Thomas	+49 35208 84 - 393	\N	\N	thomas.kuerschner@rf-fassaden.de	\N	\N	46	RF	{kürschner,thomas,493520884393,"","",thomaskuerschnerrffassadende,"","",rf}	Kürschner Thomas 493520884393   thomas.kuerschner@rf-fassaden.de   RF	\N
Schlenker	Silvio	+49 35208 84 - 319	\N	\N	silvio.schlenker@rf-fassaden.de	\N	\N	10	RF	{schlenker,silvio,493520884319,"","",silvioschlenkerrffassadende,"","",rf}	Schlenker Silvio 493520884319   silvio.schlenker@rf-fassaden.de   RF	\N
Richter	Steffen	+49 35208 84 - 333	\N	\N	steffen.richter@rf-fassaden.de	\N	\N	17	RF	{richter,steffen,493520884333,"","",steffenrichterrffassadende,"","",rf}	Richter Steffen 493520884333   steffen.richter@rf-fassaden.de   RF	\N
Verworner	Maria	+49 35208 84 - 343	\N	\N	maria.verworner@rf-fassaden.de	\N	\N	20	RF	{verworner,maria,493520884343,"","",mariaverwornerrffassadende,"","",rf}	Verworner Maria 493520884343   maria.verworner@rf-fassaden.de   RF	\N
Petzsch	Ingo	+49 35208 84 - 348	\N	\N	ingo.petzsch@rf-fassaden.de	\N	\N	23	RF	{petzsch,ingo,493520884348,"","",ingopetzschrffassadende,"","",rf}	Petzsch Ingo 493520884348   ingo.petzsch@rf-fassaden.de   RF	\N
Haupt	Madlen	+49 35208 84 - 351	\N	\N	madlen.haupt@rf-fassaden.de	\N	\N	24	RF	{haupt,madlen,493520884351,"","",madlenhauptrffassadende,"","",rf}	Haupt Madlen 493520884351   madlen.haupt@rf-fassaden.de   RF	\N
Helmert	Bettina	+49 35208 84 - 352	\N	\N	bettina.helmert@rf-fassaden.de	\N	\N	25	RF	{helmert,bettina,493520884352,"","",bettinahelmertrffassadende,"","",rf}	Helmert Bettina 493520884352   bettina.helmert@rf-fassaden.de   RF	\N
Tezner	Willy	+49 35208 84 - 365	\N	\N	willy.tezner@rf-fassaden.de	\N	\N	34	RF	{tezner,willy,493520884365,"","",willyteznerrffassadende,"","",rf}	Tezner Willy 493520884365   willy.tezner@rf-fassaden.de   RF	\N
Marschner	Mary Ann	+49 35208 84 - 387	\N	\N	maryann.marschner@rf-fassaden.de	\N	\N	44	RF	{marschner,mary,ann,493520884387,"","",maryannmarschnerrffassadende,"","",rf}	Marschner Mary Ann 493520884387   maryann.marschner@rf-fassaden.de   RF	\N
Maiwald	Hagen	+49 35208 84 - 312	\N	\N	hagen.maiwald@rf-fassaden.de	\N	\N	3	RF	{maiwald,hagen,493520884312,"","",hagenmaiwaldrffassadende,"","",rf}	Maiwald Hagen 493520884312   hagen.maiwald@rf-fassaden.de   RF	\N
Ottlinger	Conny	+49 35208 84 - 316	\N	\N	conny.ottlinger@rf-fassaden.de	\N	\N	7	RF	{ottlinger,conny,493520884316,"","",connyottlingerrffassadende,"","",rf}	Ottlinger Conny 493520884316   conny.ottlinger@rf-fassaden.de   RF	\N
Schubert	Falk	+49 35208 84 - 321	\N	\N	falk.schubert@rf-fassaden.de	\N	\N	12	RF	{schubert,falk,493520884321,"","",falkschubertrffassadende,"","",rf}	Schubert Falk 493520884321   falk.schubert@rf-fassaden.de   RF	\N
Förster	Steffen	+49 (0) 35208  84 - 350			steffen.foerster@rf-fassaden.de			51	RF	{RF,Förster,Steffen,49,0,35208,"",84,"",350,"","",steffenfoersterrffassadende,"",""}	RF Förster Steffen +49 (0) 35208  84 - 350   steffen.foerster@rf-fassaden.de  	\N
wrwer	wwerew	\N	\N	\N	\N	\N	\N	52	\N	\N	\N	\N
zzcxczcz	zzczczxczxc	\N	\N	\N	\N	\N	\N	53	\N	\N	\N	\N
asdasda	adad	\N	\N	\N	\N	\N	\N	54	\N	\N	\N	\N
qqewqewe	qwqwqwqwq	\N	\N	\N	\N	\N	\N	55	\N	\N	\N	\N
qeqweqw	qweqwqeqweqwe	\N	\N	\N	\N	\N	\N	56	\N	\N	\N	\N
adsadas	asddsadasd	\N	\N	\N	\N	\N	\N	57	\N	\N	\N	\N
sdfsdffsdfq	jony	\N	\N	\N	\N	\N	\N	58	\N	\N	\N	\N
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media (theme, name, path, iconpath, type, "timestamp", themeid, id) FROM stdin;
\N	Folien  Teil 1	training/videos/76ffa1eab1e46c8040e8dcaf836e1cef.mp4	training/videos/76ffa1eab1e46c8040e8dcaf836e1cef.jpg	video	\N	1	8
\N	VisualARQ 2 tutorial - 3.2.2 First floor interior walls	training/videos/8d1f38a70b4ce92da27b92bef0d514ff.mp4	training/videos/8d1f38a70b4ce92da27b92bef0d514ff.jpg	video	\N	38	43
AutoCAD	\N	\N	training/icons/59a248bd095f0ecd0ef43802c9058842.jpg	\N	\N	\N	3
\N	Blechquerschnitte Teil 1	training/videos/cdf41e4a3d43b89ed2525a9f58f1ee36.mp4	training/videos/cdf41e4a3d43b89ed2525a9f58f1ee36.jpg	video	\N	1	9
\N	RF - Wandschraffur ändern	training/documents/93e8f5460db5d90d0044441e48c0690f.pdf	training/documents/93e8f5460db5d90d0044441e48c0690f.jpg	handbook	\N	3	29
\N	Blechquerschnitte Teil 2	training/videos/611d4a30c3ad97c47d853f0bdef6c7dd.mp4	training/videos/611d4a30c3ad97c47d853f0bdef6c7dd.jpg	video	\N	1	10
\N	Vom Winkelrahmen zur 3D-Auswertung Teil 1	training/videos/915f963dc652f55f7238f2162ce26ad7.mp4	training/videos/915f963dc652f55f7238f2162ce26ad7.jpg	video	\N	1	11
\N	2D Dämmungen	training/videos/eaa9d98e3e7162e39d6cb8e675d73a72.mp4	training/videos/eaa9d98e3e7162e39d6cb8e675d73a72.jpg	video	\N	1	12
\N	Füllungen erstellen, verwalten Teil 1	training/videos/8f2ca49fa6f097c91df6d1f636d4c692.mp4	training/videos/8f2ca49fa6f097c91df6d1f636d4c692.jpg	video	\N	1	13
\N	Füllungen erstellen, verwalten Teil 2	training/videos/30ede7203c9b2e3d664b8ef287b71244.mp4	training/videos/30ede7203c9b2e3d664b8ef287b71244.jpg	video	\N	1	14
\N	Versiegelung / Klotz / Flachdichtung	training/videos/4d03b344df52f9b4e91889d6b33c4dce.mp4	training/videos/4d03b344df52f9b4e91889d6b33c4dce.jpg	video	\N	1	15
\N	Erstellen einer Zeichnung	training/documents/94d326215b8f8356a70953a3634d45b4.pdf	training/documents/94d326215b8f8356a70953a3634d45b4.jpg	handbook	\N	3	30
\N	Punkt-Koordinaten zu Excel exportieren	training/documents/12d49ce066a3f66f079c6d5915bd686d.pdf	training/documents/12d49ce066a3f66f079c6d5915bd686d.jpg	handbook	\N	3	31
\N	VisualARQ 2 tutorial - 2.8.2 Ground floor curtain wall styles	training/videos/64ccc4ea345e8021d29000fcb83c179c.mp4	training/videos/64ccc4ea345e8021d29000fcb83c179c.jpg	video	\N	38	44
ATHENA	\N	\N	training/icons/cf07d74436bcfcb7ef6fef5a901436c8.jpg	\N	\N	\N	1
\N	VisualARQ 2 tutorial - 0.3 Level Manager	training/videos/34000f16e39ff9b74d653341523e663c.mp4	training/videos/34000f16e39ff9b74d653341523e663c.jpg	video	\N	38	46
IKAVIOS	\N	\N	training/icons/c7574fed4b60f14cbcdac9488ce7e542.jpg	\N	\N	\N	2
SSP - Specialized Security Products	\N	\N	training/icons/c49faeaef38c25450d20a954f4ba5861.jpg	\N	\N	\N	36
\N	NT200 - Flush mount infrared no touch button with adjustable proximity range	training/videos/210f9ffbf657d61982ea6b88260c073d.mp4	training/videos/210f9ffbf657d61982ea6b88260c073d.jpg	video	\N	36	37
\N	Normteile / Halbzeuge Teil 2	training/videos/78a049d544b69738575e087839e12ef4.mp4	training/videos/78a049d544b69738575e087839e12ef4.jpg	video	\N	1	17
\N	Normteile / Halbzeuge Teil 3	training/videos/f10f1999fdc54188e391aee9a0a04702.mp4	training/videos/f10f1999fdc54188e391aee9a0a04702.jpg	video	\N	1	18
\N	Blechbearbeitung Teil 1	training/videos/f3b10058a009b40953c64c4e52ce8a46.mp4	training/videos/f3b10058a009b40953c64c4e52ce8a46.jpg	video	\N	1	20
\N	Vom Winkelrahmen zur 3D-Auswertung Teil 2	training/videos/96fb666a643905aaa263f3ed136cf315.mp4	training/videos/96fb666a643905aaa263f3ed136cf315.jpg	video	\N	1	19
\N	Blechbearbeitung Teil 2	training/videos/5aa85baae515deecfc3bc549f0b31f0e.mp4	training/videos/5aa85baae515deecfc3bc549f0b31f0e.jpg	video	\N	1	21
\N	Lieferziele	training/documents/845b176a0a5b2811af16c6f068df3555.pdf	training/documents/845b176a0a5b2811af16c6f068df3555.jpg	handbook	\N	2	6
VisualARQ	\N	\N	training/icons/05a7ec2a787742be3b644c7e84ee63c2.jpg	\N	\N	\N	38
\N	Folien Teil 2	training/videos/d16546898e20fb1706db3e1a07837c13.mp4	training/videos/d16546898e20fb1706db3e1a07837c13.jpg	video	\N	1	7
\N	Normteile / Halbzeuge Teil 1	training/videos/e2e7850d068288ac6a9762a31dcbbc06.mp4	training/videos/e2e7850d068288ac6a9762a31dcbbc06.jpg	video	\N	1	16
\N	Bedarfsmeldungen	training/documents/ea4cf99bbb0b890d647935d56334eff4.pdf	training/documents/ea4cf99bbb0b890d647935d56334eff4.jpg	handbook	\N	2	22
\N	Fertigungsaufträge	training/documents/d5d833fdd52baaa17f71366b08a0d543.pdf	training/documents/d5d833fdd52baaa17f71366b08a0d543.jpg	handbook	\N	2	23
\N	Lagerarten	training/documents/4fc56f49e8988601aeaecb5f75d4ccb2.pdf	training/documents/4fc56f49e8988601aeaecb5f75d4ccb2.jpg	handbook	\N	2	24
\N	Lagerbuchungen	training/documents/7db4e9e285d961596a0e8f36cc8a16d1.pdf	training/documents/7db4e9e285d961596a0e8f36cc8a16d1.jpg	handbook	\N	2	25
\N	VisualARQ 2 tutorial - 3.4.1 First floor ramps	training/videos/7c989c93f1759d74c78b573fa2c1dff5.mp4	training/videos/7c989c93f1759d74c78b573fa2c1dff5.jpg	video	\N	38	40
\N	VisualARQ 2 tutorial - 3.6.1 First floor windows	training/videos/e5f152dfa025f25221e4e13185f602f0.mp4	training/videos/e5f152dfa025f25221e4e13185f602f0.jpg	video	\N	38	41
\N	VisualARQ 2 Flexible BIM Presentation	training/videos/e61ad5fb0ca2aa283d4a4f52fe31c304.mp4	training/videos/e61ad5fb0ca2aa283d4a4f52fe31c304.jpg	video	\N	38	42
\N	VisualARQ 2 tutorial - 3.5.1 First floor doors	training/videos/a368ab03c71ca99aa8fe4e4e1a2dee9a.mp4	training/videos/a368ab03c71ca99aa8fe4e4e1a2dee9a.jpg	video	\N	38	47
\N	VisualARQ 2 tutorial - 3.1.1 First floor slab	training/videos/26b81f2cca16903a00a622ec1bf0f59d.mp4	training/videos/26b81f2cca16903a00a622ec1bf0f59d.jpg	video	\N	38	48
\N	Automatic 2D Plan Views in Rhino with Grasshopper and VisualARQ	training/videos/e9b8bc62d945af4ce0f3b8500df8ba21.mp4	training/videos/e9b8bc62d945af4ce0f3b8500df8ba21.jpg	video	\N	38	49
\N	Parametric Truss with a Beam Grasshopper style	training/videos/47dec4b46ae2891ca10302a02444953e.mp4	training/videos/47dec4b46ae2891ca10302a02444953e.jpg	video	\N	38	50
\N	2D Vector Drawing with lighting in Rhino	training/videos/cbb8b3dd5c87d8b540e08ad4de3c43d1.mp4	training/videos/cbb8b3dd5c87d8b540e08ad4de3c43d1.jpg	video	\N	38	51
\N	RF - CAD - Richtlinie 2	training/documents/99d3a5b9c8331b2b5df158e9012250b8.pdf	training/documents/99d3a5b9c8331b2b5df158e9012250b8.jpg	handbook	\N	1	27
\N	VisualARQ 2 tutorial - 3.6.3 First floor window styles	training/videos/1e017c44458831eca82f00198bd8cc6d.mp4	training/videos/1e017c44458831eca82f00198bd8cc6d.jpg	video	\N	38	52
\N	VisualARQ 2 tutorial - 2.9.1 Ground floor stair	training/videos/64c43763c566807a76480e19225902e8.mp4	training/videos/64c43763c566807a76480e19225902e8.jpg	video	\N	38	53
\N	VisualARQ 2 tutorial - 3.7.1 First floor openings	training/videos/7ce05d8821c77edea710187b096d4f6d.mp4	training/videos/7ce05d8821c77edea710187b096d4f6d.jpg	video	\N	38	54
\N	VisualARQ 2 tutorial - 3.2.1 First floor exterior walls	training/videos/95ba823499667568cbf9b64fec790aa3.mp4	training/videos/95ba823499667568cbf9b64fec790aa3.jpg	video	\N	38	55
\N	VisualARQ 2 tutorial - 3.6.2 First floor ramp windows	training/videos/6c6fc7a4b2f8894323b89fbbc0840684.mp4	training/videos/6c6fc7a4b2f8894323b89fbbc0840684.jpg	video	\N	38	56
\N	VisualARQ 2 tutorial - 3.3.1 First floor columns	training/videos/4fbf90b11387c5632d05d0ab5528cd30.mp4	training/videos/4fbf90b11387c5632d05d0ab5528cd30.jpg	video	\N	38	57
\N	VisualARQ 2 tutorial - 0.2 Objects and styles	training/videos/e3dd9737d86c08622ee8905ec5e41d1f.mp4	training/videos/e3dd9737d86c08622ee8905ec5e41d1f.jpg	video	\N	38	58
\N	VisualARQ 2 tutorial - 2.9.2 Ground floor stair styles	training/videos/ecd9e747829e22d1a5a82b8c65dd804c.mp4	training/videos/ecd9e747829e22d1a5a82b8c65dd804c.jpg	video	\N	38	59
\N	VisualARQ 2 tutorial - 3.5.2 First floor door styles	training/videos/a15518c340b9deb3cd4a507fe9692f23.mp4	training/videos/a15518c340b9deb3cd4a507fe9692f23.jpg	video	\N	38	60
\N	VisualARQ 2 tutorial - 3.3.2 First floor column styles	training/videos/567aa2e18dee852da7bf4218a8bc89b4.mp4	training/videos/567aa2e18dee852da7bf4218a8bc89b4.jpg	video	\N	38	61
\N	VisualARQ 2 tutorial - 2.10.2 Ground floor stair railing styles	training/videos/cc35542bee7822f16dddd278fd62239f.mp4	training/videos/cc35542bee7822f16dddd278fd62239f.jpg	video	\N	38	62
\N	VisualARQ running inside Revit with Rhino.Inside technology	training/videos/d56b36cf75000dbdc1ebdb8933f5bddb.mp4	training/videos/d56b36cf75000dbdc1ebdb8933f5bddb.jpg	video	\N	38	63
\N	VisualARQ 2 tutorial - 0.1 Toolbars overview	training/videos/7e5a79b7ec415cb4bc49f1102a85c0ce.mp4	training/videos/7e5a79b7ec415cb4bc49f1102a85c0ce.jpg	video	\N	38	64
\N	Automatic 4 Elevations from a room	training/videos/c102b8b3a83bf69b30d824a2c46c5a9e.mp4	training/videos/c102b8b3a83bf69b30d824a2c46c5a9e.jpg	video	\N	38	65
\N	Create a VisualARQ Grasshopper style in 3 steps	training/videos/de0aaeed754a736541bc1c4c8561a091.mp4	training/videos/de0aaeed754a736541bc1c4c8561a091.jpg	video	\N	38	66
\N	VisualARQ 2 tutorial - 2.6 Ground floor doors	training/videos/4b7147e7c84e13724fcd552e9ae0e8f1.mp4	training/videos/4b7147e7c84e13724fcd552e9ae0e8f1.jpg	video	\N	38	67
\N	VisualARQ 2 tutorial - 2.3 Ground floor Columns	training/videos/b7ce147bdf638060064cefa69f3dc6bd.mp4	training/videos/b7ce147bdf638060064cefa69f3dc6bd.jpg	video	\N	38	68
\N	VisualARQ 2 tutorial - 2.7.1 Ground floor windows	training/videos/be9db28a65a8c5b4fca602e38e384bd5.mp4	training/videos/be9db28a65a8c5b4fca602e38e384bd5.jpg	video	\N	38	69
\N	VisualARQ 2 tutorial - 2.2.1 Ground floor Walls	training/videos/a85ffaf6bc474ba01ac6f279e3135998.mp4	training/videos/a85ffaf6bc474ba01ac6f279e3135998.jpg	video	\N	38	70
\N	VisualARQ 2 tutorial - 2.1 Ground floor Slabs	training/videos/bb79fad05dbacc5d2a3dbeb5afbe0fa0.mp4	training/videos/bb79fad05dbacc5d2a3dbeb5afbe0fa0.jpg	video	\N	38	71
\N	VisualARQ 2 tutorial - 2.4.1 Ground floor ramp	training/videos/970325b596e941e8cd6c26e0678f54b2.mp4	training/videos/970325b596e941e8cd6c26e0678f54b2.jpg	video	\N	38	72
\N	VisualARQ 2 tutorial - 2.8.1 Ground floor curtain walls	training/videos/211ee4f00fddfa570b114ff9971c34ab.mp4	training/videos/211ee4f00fddfa570b114ff9971c34ab.jpg	video	\N	38	73
\N	VisualARQ 2 tutorial - 2.5 Ground floor beams	training/videos/19aa37eea7603f2637eacc34f054a44c.mp4	training/videos/19aa37eea7603f2637eacc34f054a44c.jpg	video	\N	38	74
\N	VisualARQ 2 tutorial - 2.10.1 Ground floor stair railings	training/videos/9e2d82da2e507f4eeff0f65d02c5822b.mp4	training/videos/9e2d82da2e507f4eeff0f65d02c5822b.jpg	video	\N	38	75
\N	VisualARQ 2 tutorial - 1.2 Insert drawing plans bitmaps	training/videos/5c8fb40446c0e8b4222cf7a69ae36f45.mp4	training/videos/5c8fb40446c0e8b4222cf7a69ae36f45.jpg	video	\N	38	77
\N	VisualARQ 2 tutorial - 1.3 Set Levels	training/videos/77f6e43b6c311ac2eebd0464ff94feac.mp4	training/videos/77f6e43b6c311ac2eebd0464ff94feac.jpg	video	\N	38	78
\N	VisualARQ 2 tutorial - 1.1. New document	training/videos/0c96fafe15b7651dc6bf6dc889086330.mp4	training/videos/0c96fafe15b7651dc6bf6dc889086330.jpg	video	\N	38	79
\N	Folien  Teil 1	training/videos/76ffa1eab1e46c8040e8dcaf836e1cef.mp4	training/videos/76ffa1eab1e46c8040e8dcaf836e1cef.jpg	video	\N	1	8
\N	VisualARQ 2 tutorial - 3.2.2 First floor interior walls	training/videos/8d1f38a70b4ce92da27b92bef0d514ff.mp4	training/videos/8d1f38a70b4ce92da27b92bef0d514ff.jpg	video	\N	38	43
AutoCAD	\N	\N	training/icons/59a248bd095f0ecd0ef43802c9058842.jpg	\N	\N	\N	3
\N	Blechquerschnitte Teil 1	training/videos/cdf41e4a3d43b89ed2525a9f58f1ee36.mp4	training/videos/cdf41e4a3d43b89ed2525a9f58f1ee36.jpg	video	\N	1	9
\N	RF - Wandschraffur ändern	training/documents/93e8f5460db5d90d0044441e48c0690f.pdf	training/documents/93e8f5460db5d90d0044441e48c0690f.jpg	handbook	\N	3	29
\N	Blechquerschnitte Teil 2	training/videos/611d4a30c3ad97c47d853f0bdef6c7dd.mp4	training/videos/611d4a30c3ad97c47d853f0bdef6c7dd.jpg	video	\N	1	10
\N	Vom Winkelrahmen zur 3D-Auswertung Teil 1	training/videos/915f963dc652f55f7238f2162ce26ad7.mp4	training/videos/915f963dc652f55f7238f2162ce26ad7.jpg	video	\N	1	11
\N	2D Dämmungen	training/videos/eaa9d98e3e7162e39d6cb8e675d73a72.mp4	training/videos/eaa9d98e3e7162e39d6cb8e675d73a72.jpg	video	\N	1	12
\N	Füllungen erstellen, verwalten Teil 1	training/videos/8f2ca49fa6f097c91df6d1f636d4c692.mp4	training/videos/8f2ca49fa6f097c91df6d1f636d4c692.jpg	video	\N	1	13
\N	Füllungen erstellen, verwalten Teil 2	training/videos/30ede7203c9b2e3d664b8ef287b71244.mp4	training/videos/30ede7203c9b2e3d664b8ef287b71244.jpg	video	\N	1	14
\N	Versiegelung / Klotz / Flachdichtung	training/videos/4d03b344df52f9b4e91889d6b33c4dce.mp4	training/videos/4d03b344df52f9b4e91889d6b33c4dce.jpg	video	\N	1	15
\N	Erstellen einer Zeichnung	training/documents/94d326215b8f8356a70953a3634d45b4.pdf	training/documents/94d326215b8f8356a70953a3634d45b4.jpg	handbook	\N	3	30
\N	Punkt-Koordinaten zu Excel exportieren	training/documents/12d49ce066a3f66f079c6d5915bd686d.pdf	training/documents/12d49ce066a3f66f079c6d5915bd686d.jpg	handbook	\N	3	31
\N	VisualARQ 2 tutorial - 2.8.2 Ground floor curtain wall styles	training/videos/64ccc4ea345e8021d29000fcb83c179c.mp4	training/videos/64ccc4ea345e8021d29000fcb83c179c.jpg	video	\N	38	44
ATHENA	\N	\N	training/icons/cf07d74436bcfcb7ef6fef5a901436c8.jpg	\N	\N	\N	1
\N	VisualARQ 2 tutorial - 0.3 Level Manager	training/videos/34000f16e39ff9b74d653341523e663c.mp4	training/videos/34000f16e39ff9b74d653341523e663c.jpg	video	\N	38	46
IKAVIOS	\N	\N	training/icons/c7574fed4b60f14cbcdac9488ce7e542.jpg	\N	\N	\N	2
SSP - Specialized Security Products	\N	\N	training/icons/c49faeaef38c25450d20a954f4ba5861.jpg	\N	\N	\N	36
\N	NT200 - Flush mount infrared no touch button with adjustable proximity range	training/videos/210f9ffbf657d61982ea6b88260c073d.mp4	training/videos/210f9ffbf657d61982ea6b88260c073d.jpg	video	\N	36	37
\N	Normteile / Halbzeuge Teil 2	training/videos/78a049d544b69738575e087839e12ef4.mp4	training/videos/78a049d544b69738575e087839e12ef4.jpg	video	\N	1	17
\N	Normteile / Halbzeuge Teil 3	training/videos/f10f1999fdc54188e391aee9a0a04702.mp4	training/videos/f10f1999fdc54188e391aee9a0a04702.jpg	video	\N	1	18
\N	Blechbearbeitung Teil 1	training/videos/f3b10058a009b40953c64c4e52ce8a46.mp4	training/videos/f3b10058a009b40953c64c4e52ce8a46.jpg	video	\N	1	20
\N	Vom Winkelrahmen zur 3D-Auswertung Teil 2	training/videos/96fb666a643905aaa263f3ed136cf315.mp4	training/videos/96fb666a643905aaa263f3ed136cf315.jpg	video	\N	1	19
\N	Blechbearbeitung Teil 2	training/videos/5aa85baae515deecfc3bc549f0b31f0e.mp4	training/videos/5aa85baae515deecfc3bc549f0b31f0e.jpg	video	\N	1	21
\N	Lieferziele	training/documents/845b176a0a5b2811af16c6f068df3555.pdf	training/documents/845b176a0a5b2811af16c6f068df3555.jpg	handbook	\N	2	6
VisualARQ	\N	\N	training/icons/05a7ec2a787742be3b644c7e84ee63c2.jpg	\N	\N	\N	38
\N	Folien Teil 2	training/videos/d16546898e20fb1706db3e1a07837c13.mp4	training/videos/d16546898e20fb1706db3e1a07837c13.jpg	video	\N	1	7
\N	Normteile / Halbzeuge Teil 1	training/videos/e2e7850d068288ac6a9762a31dcbbc06.mp4	training/videos/e2e7850d068288ac6a9762a31dcbbc06.jpg	video	\N	1	16
\N	Bedarfsmeldungen	training/documents/ea4cf99bbb0b890d647935d56334eff4.pdf	training/documents/ea4cf99bbb0b890d647935d56334eff4.jpg	handbook	\N	2	22
\N	Fertigungsaufträge	training/documents/d5d833fdd52baaa17f71366b08a0d543.pdf	training/documents/d5d833fdd52baaa17f71366b08a0d543.jpg	handbook	\N	2	23
\N	Lagerarten	training/documents/4fc56f49e8988601aeaecb5f75d4ccb2.pdf	training/documents/4fc56f49e8988601aeaecb5f75d4ccb2.jpg	handbook	\N	2	24
\N	Lagerbuchungen	training/documents/7db4e9e285d961596a0e8f36cc8a16d1.pdf	training/documents/7db4e9e285d961596a0e8f36cc8a16d1.jpg	handbook	\N	2	25
\N	VisualARQ 2 tutorial - 3.4.1 First floor ramps	training/videos/7c989c93f1759d74c78b573fa2c1dff5.mp4	training/videos/7c989c93f1759d74c78b573fa2c1dff5.jpg	video	\N	38	40
\N	VisualARQ 2 tutorial - 3.6.1 First floor windows	training/videos/e5f152dfa025f25221e4e13185f602f0.mp4	training/videos/e5f152dfa025f25221e4e13185f602f0.jpg	video	\N	38	41
\N	VisualARQ 2 Flexible BIM Presentation	training/videos/e61ad5fb0ca2aa283d4a4f52fe31c304.mp4	training/videos/e61ad5fb0ca2aa283d4a4f52fe31c304.jpg	video	\N	38	42
\N	VisualARQ 2 tutorial - 3.5.1 First floor doors	training/videos/a368ab03c71ca99aa8fe4e4e1a2dee9a.mp4	training/videos/a368ab03c71ca99aa8fe4e4e1a2dee9a.jpg	video	\N	38	47
\N	VisualARQ 2 tutorial - 3.1.1 First floor slab	training/videos/26b81f2cca16903a00a622ec1bf0f59d.mp4	training/videos/26b81f2cca16903a00a622ec1bf0f59d.jpg	video	\N	38	48
\N	Automatic 2D Plan Views in Rhino with Grasshopper and VisualARQ	training/videos/e9b8bc62d945af4ce0f3b8500df8ba21.mp4	training/videos/e9b8bc62d945af4ce0f3b8500df8ba21.jpg	video	\N	38	49
\N	Parametric Truss with a Beam Grasshopper style	training/videos/47dec4b46ae2891ca10302a02444953e.mp4	training/videos/47dec4b46ae2891ca10302a02444953e.jpg	video	\N	38	50
\N	2D Vector Drawing with lighting in Rhino	training/videos/cbb8b3dd5c87d8b540e08ad4de3c43d1.mp4	training/videos/cbb8b3dd5c87d8b540e08ad4de3c43d1.jpg	video	\N	38	51
\N	RF - CAD - Richtlinie 2	training/documents/99d3a5b9c8331b2b5df158e9012250b8.pdf	training/documents/99d3a5b9c8331b2b5df158e9012250b8.jpg	handbook	\N	1	27
\N	VisualARQ 2 tutorial - 3.6.3 First floor window styles	training/videos/1e017c44458831eca82f00198bd8cc6d.mp4	training/videos/1e017c44458831eca82f00198bd8cc6d.jpg	video	\N	38	52
\N	VisualARQ 2 tutorial - 2.9.1 Ground floor stair	training/videos/64c43763c566807a76480e19225902e8.mp4	training/videos/64c43763c566807a76480e19225902e8.jpg	video	\N	38	53
\N	VisualARQ 2 tutorial - 3.7.1 First floor openings	training/videos/7ce05d8821c77edea710187b096d4f6d.mp4	training/videos/7ce05d8821c77edea710187b096d4f6d.jpg	video	\N	38	54
\N	VisualARQ 2 tutorial - 3.2.1 First floor exterior walls	training/videos/95ba823499667568cbf9b64fec790aa3.mp4	training/videos/95ba823499667568cbf9b64fec790aa3.jpg	video	\N	38	55
\N	VisualARQ 2 tutorial - 3.6.2 First floor ramp windows	training/videos/6c6fc7a4b2f8894323b89fbbc0840684.mp4	training/videos/6c6fc7a4b2f8894323b89fbbc0840684.jpg	video	\N	38	56
\N	VisualARQ 2 tutorial - 3.3.1 First floor columns	training/videos/4fbf90b11387c5632d05d0ab5528cd30.mp4	training/videos/4fbf90b11387c5632d05d0ab5528cd30.jpg	video	\N	38	57
\N	VisualARQ 2 tutorial - 0.2 Objects and styles	training/videos/e3dd9737d86c08622ee8905ec5e41d1f.mp4	training/videos/e3dd9737d86c08622ee8905ec5e41d1f.jpg	video	\N	38	58
\N	VisualARQ 2 tutorial - 2.9.2 Ground floor stair styles	training/videos/ecd9e747829e22d1a5a82b8c65dd804c.mp4	training/videos/ecd9e747829e22d1a5a82b8c65dd804c.jpg	video	\N	38	59
\N	VisualARQ 2 tutorial - 3.5.2 First floor door styles	training/videos/a15518c340b9deb3cd4a507fe9692f23.mp4	training/videos/a15518c340b9deb3cd4a507fe9692f23.jpg	video	\N	38	60
\N	VisualARQ 2 tutorial - 3.3.2 First floor column styles	training/videos/567aa2e18dee852da7bf4218a8bc89b4.mp4	training/videos/567aa2e18dee852da7bf4218a8bc89b4.jpg	video	\N	38	61
\N	VisualARQ 2 tutorial - 2.10.2 Ground floor stair railing styles	training/videos/cc35542bee7822f16dddd278fd62239f.mp4	training/videos/cc35542bee7822f16dddd278fd62239f.jpg	video	\N	38	62
\N	VisualARQ running inside Revit with Rhino.Inside technology	training/videos/d56b36cf75000dbdc1ebdb8933f5bddb.mp4	training/videos/d56b36cf75000dbdc1ebdb8933f5bddb.jpg	video	\N	38	63
\N	VisualARQ 2 tutorial - 0.1 Toolbars overview	training/videos/7e5a79b7ec415cb4bc49f1102a85c0ce.mp4	training/videos/7e5a79b7ec415cb4bc49f1102a85c0ce.jpg	video	\N	38	64
\N	Automatic 4 Elevations from a room	training/videos/c102b8b3a83bf69b30d824a2c46c5a9e.mp4	training/videos/c102b8b3a83bf69b30d824a2c46c5a9e.jpg	video	\N	38	65
\N	Create a VisualARQ Grasshopper style in 3 steps	training/videos/de0aaeed754a736541bc1c4c8561a091.mp4	training/videos/de0aaeed754a736541bc1c4c8561a091.jpg	video	\N	38	66
\N	VisualARQ 2 tutorial - 2.6 Ground floor doors	training/videos/4b7147e7c84e13724fcd552e9ae0e8f1.mp4	training/videos/4b7147e7c84e13724fcd552e9ae0e8f1.jpg	video	\N	38	67
\N	VisualARQ 2 tutorial - 2.3 Ground floor Columns	training/videos/b7ce147bdf638060064cefa69f3dc6bd.mp4	training/videos/b7ce147bdf638060064cefa69f3dc6bd.jpg	video	\N	38	68
\N	VisualARQ 2 tutorial - 2.7.1 Ground floor windows	training/videos/be9db28a65a8c5b4fca602e38e384bd5.mp4	training/videos/be9db28a65a8c5b4fca602e38e384bd5.jpg	video	\N	38	69
\N	VisualARQ 2 tutorial - 2.2.1 Ground floor Walls	training/videos/a85ffaf6bc474ba01ac6f279e3135998.mp4	training/videos/a85ffaf6bc474ba01ac6f279e3135998.jpg	video	\N	38	70
\N	VisualARQ 2 tutorial - 2.1 Ground floor Slabs	training/videos/bb79fad05dbacc5d2a3dbeb5afbe0fa0.mp4	training/videos/bb79fad05dbacc5d2a3dbeb5afbe0fa0.jpg	video	\N	38	71
\N	VisualARQ 2 tutorial - 2.4.1 Ground floor ramp	training/videos/970325b596e941e8cd6c26e0678f54b2.mp4	training/videos/970325b596e941e8cd6c26e0678f54b2.jpg	video	\N	38	72
\N	VisualARQ 2 tutorial - 2.8.1 Ground floor curtain walls	training/videos/211ee4f00fddfa570b114ff9971c34ab.mp4	training/videos/211ee4f00fddfa570b114ff9971c34ab.jpg	video	\N	38	73
\N	VisualARQ 2 tutorial - 2.5 Ground floor beams	training/videos/19aa37eea7603f2637eacc34f054a44c.mp4	training/videos/19aa37eea7603f2637eacc34f054a44c.jpg	video	\N	38	74
\N	VisualARQ 2 tutorial - 2.10.1 Ground floor stair railings	training/videos/9e2d82da2e507f4eeff0f65d02c5822b.mp4	training/videos/9e2d82da2e507f4eeff0f65d02c5822b.jpg	video	\N	38	75
\N	VisualARQ 2 tutorial - 1.2 Insert drawing plans bitmaps	training/videos/5c8fb40446c0e8b4222cf7a69ae36f45.mp4	training/videos/5c8fb40446c0e8b4222cf7a69ae36f45.jpg	video	\N	38	77
\N	VisualARQ 2 tutorial - 1.3 Set Levels	training/videos/77f6e43b6c311ac2eebd0464ff94feac.mp4	training/videos/77f6e43b6c311ac2eebd0464ff94feac.jpg	video	\N	38	78
\N	VisualARQ 2 tutorial - 1.1. New document	training/videos/0c96fafe15b7651dc6bf6dc889086330.mp4	training/videos/0c96fafe15b7651dc6bf6dc889086330.jpg	video	\N	38	79
\.


--
-- Data for Name: medien; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medien (id, name, path, level1, level2, level3, type, iconpath, "timestamp", themeid, theme) FROM stdin;
2	\N	\N	ATHENA	\N	\N	\N	theme-icon/1dde4c9ca66877d987aca3ab6e850b4c.jpg	\N	\N	ATHENA
7	\N	\N	AUTOCAD	\N	\N	\N	theme-icon/d61e64d8fbfe5970a68a9544c543e6e4.jpg	\N	\N	AUTOCAD
1	\N	\N	IKAVIOS	\N	\N	\N	theme-icon/5b8aa6bfdb1fbc9f0396e47fd28f8b10.jpg	\N	\N	IKAVIOS
8	Athena-Handbuch	media/documents/4561dc9b6e62f310076f62fedd388b01.pdf	ATHENA	Handbücher	Athena-Handbuch	handbook	media/documents/4561dc9b6e62f310076f62fedd388b01.jpg	\N	2	\N
10	IKAVIOS-Bedarfsmeldungen	media/documents/b5bde05212325cdf9b8592a37c2e2944.pdf	IKAVIOS	Handbücher	IKAVIOS-Bedarfsmeldungen	handbook	media/documents/b5bde05212325cdf9b8592a37c2e2944.jpg	\N	1	\N
12	IKAVIOS-Lieferziele	media/documents/98cdb9c294e2cdb23b5307e9809fdc7d.pdf	IKAVIOS	Handbücher	IKAVIOS-Lieferziele	handbook	media/documents/98cdb9c294e2cdb23b5307e9809fdc7d.jpg	\N	1	\N
14	IKAVIOS-Lagerbuchungen	media/documents/eca2d076651716a6d1b1a98b6e07cc76.pdf	IKAVIOS	Handbücher	IKAVIOS-Lagerbuchungen	handbook	media/documents/eca2d076651716a6d1b1a98b6e07cc76.jpg	\N	1	\N
16	Athena - 2D - Folien Teil  2	media/videos/27007b38184522fa44c81b62a5fea56b.mp4	ATHENA	Videos	Athena - 2D - Folien Teil  2	video	media/videos/27007b38184522fa44c81b62a5fea56b.jpg	\N	2	\N
18	Athena - 2D - Blechquerschnitte Teil 2	media/videos/252a19f10bf11de28ad54f9f63429b4e.mp4	ATHENA	Videos	Athena - 2D - Blechquerschnitte Teil 2	video	media/videos/252a19f10bf11de28ad54f9f63429b4e.jpg	\N	2	\N
21	Test	media/documents/1dc284f5e0c93831e04a88362ca67ea4.pdf	ATHENA	Handbücher	Test	handbook	media/documents/1dc284f5e0c93831e04a88362ca67ea4.jpg	\N	\N	\N
9	Autocad-Tastaturkürzel	media/documents/9f8c4452149d3c8253a42540310a8aa7.pdf	AUTOCAD	Handbücher	Autocad-Tastaturkürzel	handbook	media/documents/9f8c4452149d3c8253a42540310a8aa7.jpg	\N	7	\N
11	IKAVIOS-Fertigungsaufträge	media/documents/951e918407b19b70b9d8c3bc673b6fd5.pdf	IKAVIOS	Handbücher	IKAVIOS-Fertigungsaufträge	handbook	media/documents/951e918407b19b70b9d8c3bc673b6fd5.jpg	\N	1	\N
13	IKAVIOS-Lagerarten	media/documents/91fa892fd2b23b7958f255a8176522a5.pdf	IKAVIOS	Handbücher	IKAVIOS-Lagerarten	handbook	media/documents/91fa892fd2b23b7958f255a8176522a5.jpg	\N	1	\N
17	Athena - 2D - Blechquerschnitte Teil 1	media/videos/08ab8f91236ebb00a435ed75b605a724.mp4	ATHENA	Videos	Athena - 2D - Blechquerschnitte Teil 1	video	media/videos/08ab8f91236ebb00a435ed75b605a724.jpg	\N	2	\N
19	Athena - 2D - Dämmungen	media/videos/9f4c34cb847cb713c990a16742b5fcac.mp4	ATHENA	Videos	Athena - 2D - Dämmungen	video	media/videos/9f4c34cb847cb713c990a16742b5fcac.jpg	\N	2	\N
15	Athena - 2D - Folien Teil  1	media/videos/b37cf6632ce60f306b5ae67d3f8e7101.mp4	ATHENA	Videos	Athena - 2D - Folien Teil  1	video	media/videos/b37cf6632ce60f306b5ae67d3f8e7101.jpg	\N	2	\N
20	Big Bang 1	media/videos/43f19f7bf7b524be91d5d0d1569f83f9.mp4	ATHENA	Videos	Big Bang 1	video	media/videos/43f19f7bf7b524be91d5d0d1569f83f9.jpg	\N	\N	\N
\.


--
-- Data for Name: mlevel1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mlevel1 (id, name) FROM stdin;
\.


--
-- Data for Name: mlevel2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mlevel2 (id, level1, name) FROM stdin;
\.


--
-- Data for Name: module; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.module (modulnr, modulname, beschreibung) FROM stdin;
1	bekanntmachung	\N
2	telefonnummern	innerbetriebliche telefonnummern
1	bekanntmachung	\N
2	telefonnummern	innerbetriebliche telefonnummern
\.


--
-- Data for Name: sessions_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions_log (user_id, session_id, start, finish) FROM stdin;
\.


--
-- Data for Name: stamm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stamm (id, text1, text2) FROM stdin;
1	erster text	zweiter text
2	zweiter erster text	zweiter zweiter text
3	dritter erster Text	dritter zweiter text
\.


--
-- Data for Name: user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_groups (id, user_id, group_id) FROM stdin;
7	1	4
8	1	9
9	1	10
10	1	11
11	1	12
12	1	13
13	1	14
14	2	4
15	3	11
16	3	12
17	4	4
18	4	9
19	4	10
20	5	4
21	6	4
22	7	10
23	7	14
24	7	17
25	7	23
\.


--
-- Data for Name: username; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.username (id, username, password, vorname, nachname) FROM stdin;
1	steffen	steffen	Steffen	Förster
2	heiner	muster	Heiner	Muster
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, last_name, login_name, password, user_type) FROM stdin;
1	adaddad	adasdsad	sadsada	adasdad	U
2	adasdasd	asdada	adsada	adasda	U
3	addadasd	adada	adasd	adadsad	U
4	adasdasd	adasdsa	dsadas	dasdasd	U
5	jony2	jony2	adadada	aasdasd	U
6	nkkasdsakndakaadsaka	asknaskdsakdsakdk	asknaskdnkasndk	askasdkasdk	U
7	adasd	adasdasd	adasd	adasd	U
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 25, true);


--
-- Name: information_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.information_id_seq', 17, true);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_id_seq', 83, true);


--
-- Name: user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_groups_id_seq', 1, false);


--
-- Name: user_groups_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_groups_id_seq1', 25, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: users_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq1', 7, true);


--
-- PostgreSQL database dump complete
--

