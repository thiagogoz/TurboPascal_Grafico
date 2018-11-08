{PRODUZIDO E IDEALIZADO POR THIAGO DE G‡Z FERREIRA (421 LINHAS)
2ßP.D. MANH«, COLêGIO CRISTO REDENTOR}

PROGRAM DERTERMINANTE_5_X_5;
USES DOS,CRT;

TYPE
  MATRIZ_5X5=ARRAY[1..5,1..5] OF INTEGER;
  MATRIZ_4X4=ARRAY[1..4,1..4] OF INTEGER;
  MATRIZ_3X3=ARRAY[1..3,1..3] OF INTEGER;

VAR
  X,Y,R1,R2,R3,R4,R5,ELEMENTO,RF:INTEGER;
  MP:                  MATRIZ_5X5;
  MS1,MS2,MS3,MS4,MS5: MATRIZ_4X4;
  MS11,MS12,MS13,MS14: MATRIZ_3X3;
  MS21,MS22,MS23,MS24: MATRIZ_3X3;
  MS31,MS32,MS33,MS34: MATRIZ_3X3;
  MS41,MS42,MS43,MS44: MATRIZ_3X3;
  MS51,MS52,MS53,MS54: MATRIZ_3X3;
  ELMP,RPMS,RFMS:               ARRAY[1..5] OF INTEGER;
  ELMS1,ELMS2,ELMS3,ELMS4,ELMS5:ARRAY[1..4] OF INTEGER;
  RDMS:                         ARRAY[1..20] OF INTEGER;

PROCEDURE CENTRA(X:INTEGER;TEXT:STRING);
  BEGIN
    GOTOXY(40-(LENGTH(TEXT) DIV 2),X);
    WRITE(TEXT);
  END;

PROCEDURE TELAPRIN;
  BEGIN
   TEXTCOLOR(15);
   TEXTBACKGROUND(1);
   CLRSCR;
   CENTRA(1,'PROGRAMA QUE CALCULA A DETERMINANTE DE UMA MATRIZ 5 X 5');
   CENTRA(11,'DIGITE OS VALORES DA MATRIZ');
   CENTRA(24,'PRODUZIDO POR THIAGO G. FERREIRA   2ß P.D.');
  END;

BEGIN
{LEITURA DA MATRIZ PRINCIPAL}
  FOR X:=1 TO 5 DO
    FOR Y:=1 TO 5 DO
      BEGIN
        TELAPRIN;
        GOTOXY(30,12);
        WRITE('POSIÄAO ',X,'X',Y,' = ');
        READ(MP[X,Y]);
        CLRSCR;
      END;
{FRESCURA}
  CENTRA(12,'AGUARDE, CALCULANDO...');
  CENTRA(24,'PRODUZIDO POR THIAGO G. FERREIRA   2ß P.D.');
  FOR X:=1 TO 10 DO
    BEGIN
      TEXTCOLOR(15); GOTOXY(53,12); WRITE('|'); DELAY(70);
      TEXTCOLOR(0);  GOTOXY(53,12); WRITE('|');
      TEXTCOLOR(15); GOTOXY(53,12); WRITE('/'); DELAY(70);
      TEXTCOLOR(0);  GOTOXY(53,12); WRITE('/');
      TEXTCOLOR(15); GOTOXY(53,12); WRITE('-'); DELAY(70);
      TEXTCOLOR(0);  GOTOXY(53,12); WRITE('-');
      TEXTCOLOR(15); GOTOXY(53,12); WRITE('\'); DELAY(70);
      TEXTCOLOR(0);  GOTOXY(53,2); WRITE('\');
    END;
 { DELAY(2000);}
  TEXTCOLOR(15);
  CLRSCR;
{PREENCHIMENTO DO VETOR "ELMP" COM OS ELEMENTOS DA 1ß COLUNA DA "MP"}
FOR X:=1 TO 5 DO
  ELMP[X]:=MP[X,1];

{1ß FASE, DIVIDIR A MATRIZ 5X5 EM 5 MATRIZES 4X4(MS1,MS2,MS3,MS4 E MS5).}
  FOR ELEMENTO:=1 TO 5 DO
    CASE ELEMENTO OF
      1:BEGIN
          FOR Y:=1 TO 4 DO
            BEGIN
              MS1[1,Y]:=MP[2,Y+1];
              MS1[2,Y]:=MP[3,Y+1];
              MS1[3,Y]:=MP[4,Y+1];
              MS1[4,Y]:=MP[5,Y+1];
            END;
        END;
      2:BEGIN
          FOR Y:=1 TO 4 DO
            BEGIN
              MS2[1,Y]:=MP[1,Y+1];
              MS2[2,Y]:=MP[3,Y+1];
              MS2[3,Y]:=MP[4,Y+1];
              MS2[4,Y]:=MP[5,Y+1];
            END;
        END;
      3:BEGIN
          FOR Y:=1 TO 4 DO
            BEGIN
              MS3[1,Y]:=MP[1,Y+1];
              MS3[2,Y]:=MP[2,Y+1];
              MS3[3,Y]:=MP[4,Y+1];
              MS3[4,Y]:=MP[5,Y+1];
            END;
        END;
      4:BEGIN
          FOR Y:=1 TO 4 DO
            BEGIN
              MS4[1,Y]:=MP[1,Y+1];
              MS4[2,Y]:=MP[2,Y+1];
              MS4[3,Y]:=MP[3,Y+1];
              MS4[4,Y]:=MP[5,Y+1];
            END;
        END;
      5:BEGIN
          FOR Y:=1 TO 4 DO
            BEGIN
              MS5[1,Y]:=MP[1,Y+1];
              MS5[2,Y]:=MP[2,Y+1];
              MS5[3,Y]:=MP[3,Y+1];
              MS5[4,Y]:=MP[4,Y+1];
            END;
        END;
    END;{CASE}

{2ß FASE, PARTE 1 DIVIDIR A MATRIZ "MS1" EM QUATRO MATRIZES 3X3(MS11, MS12,
MS13 E MS14)}
  FOR ELEMENTO:=1 TO 4 DO
    CASE ELEMENTO OF
      1:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS11[1,Y]:=MS1[2,Y+1];
              MS11[2,Y]:=MS1[3,Y+1];
              MS11[3,Y]:=MS1[4,Y+1];
            END;
        END;
      2:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS12[1,Y]:=MS1[1,Y+1];
              MS12[2,Y]:=MS1[3,Y+1];
              MS12[3,Y]:=MS1[4,Y+1];
            END;
        END;
      3:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS13[1,Y]:=MS1[1,Y+1];
              MS13[2,Y]:=MS1[2,Y+1];
              MS13[3,Y]:=MS1[4,Y+1];
            END;
        END;
      4:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS14[1,Y]:=MS1[1,Y+1];
              MS14[2,Y]:=MS1[2,Y+1];
              MS14[3,Y]:=MS1[3,Y+1];
            END;
        END;
    END;{CASE}
{2ß FASE, PARTE 2 DIVIDIR A MATRIZ "MS2" EM QUATRO MATRIZES 3X3(MS21, MS22,
MS23 E MS24)}
  FOR ELEMENTO:=1 TO 4 DO
    CASE ELEMENTO OF
      1:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS21[1,Y]:=MS2[2,Y+1];
              MS21[2,Y]:=MS2[3,Y+1];
              MS21[3,Y]:=MS2[4,Y+1];
            END;
        END;
      2:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS22[1,Y]:=MS2[1,Y+1];
              MS22[2,Y]:=MS2[3,Y+1];
              MS22[3,Y]:=MS2[4,Y+1];
            END;
        END;
      3:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS23[1,Y]:=MS2[1,Y+1];
              MS23[2,Y]:=MS2[2,Y+1];
              MS23[3,Y]:=MS2[4,Y+1];
            END;
        END;
      4:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS24[1,Y]:=MS2[1,Y+1];
              MS24[2,Y]:=MS2[2,Y+1];
              MS24[3,Y]:=MS2[3,Y+1];
            END;
        END;
    END;{CASE}
{2ß FASE, PARTE 3 DIVIDIR A MATRIZ "MS3" EM QUATRO MATRIZES 3X3(MS31, MS32,
MS33 E MS34)}
  FOR ELEMENTO:=1 TO 4 DO
    CASE ELEMENTO OF
      1:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS31[1,Y]:=MS3[2,Y+1];
              MS31[2,Y]:=MS3[3,Y+1];
              MS31[3,Y]:=MS3[4,Y+1];
            END;
        END;
      2:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS32[1,Y]:=MS3[1,Y+1];
              MS32[2,Y]:=MS3[3,Y+1];
              MS32[3,Y]:=MS3[4,Y+1];
            END;
        END;
      3:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS33[1,Y]:=MS3[1,Y+1];
              MS33[2,Y]:=MS3[2,Y+1];
              MS33[3,Y]:=MS3[4,Y+1];
            END;
        END;
      4:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS34[1,Y]:=MS3[1,Y+1];
              MS34[2,Y]:=MS3[2,Y+1];
              MS34[3,Y]:=MS3[3,Y+1];
            END;
        END;
    END;{CASE}
{2ß FASE, PARTE 4 DIVIDIR A MATRIZ "MS4" EM QUATRO MATRIZES 3X3(MS41, MS42,
MS43 E MS44)}
  FOR ELEMENTO:=1 TO 4 DO
    CASE ELEMENTO OF
      1:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS41[1,Y]:=MS4[2,Y+1];
              MS41[2,Y]:=MS4[3,Y+1];
              MS41[3,Y]:=MS4[4,Y+1];
            END;
        END;
      2:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS42[1,Y]:=MS4[1,Y+1];
              MS42[2,Y]:=MS4[3,Y+1];
              MS42[3,Y]:=MS4[4,Y+1];
            END;
        END;
      3:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS43[1,Y]:=MS4[1,Y+1];
              MS43[2,Y]:=MS4[2,Y+1];
              MS43[3,Y]:=MS4[4,Y+1];
            END;
        END;
      4:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS44[1,Y]:=MS4[1,Y+1];
              MS44[2,Y]:=MS4[2,Y+1];
              MS44[3,Y]:=MS4[3,Y+1];
            END;
        END;
    END;{CASE}
{2ß FASE, PARTE 5 DIVIDIR A MATRIZ "MS5" EM QUATRO MATRIZES 3X3(MS51, MS52,
MS53 E MS54)}
  FOR ELEMENTO:=1 TO 4 DO
    CASE ELEMENTO OF
      1:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS51[1,Y]:=MS5[2,Y+1];
              MS51[2,Y]:=MS5[3,Y+1];
              MS51[3,Y]:=MS5[4,Y+1];
            END;
        END;
      2:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS52[1,Y]:=MS5[1,Y+1];
              MS52[2,Y]:=MS5[3,Y+1];
              MS52[3,Y]:=MS5[4,Y+1];
            END;
        END;
      3:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS53[1,Y]:=MS5[1,Y+1];
              MS53[2,Y]:=MS5[2,Y+1];
              MS53[3,Y]:=MS5[4,Y+1];
            END;
        END;
      4:BEGIN
          FOR Y:=1 TO 3 DO
            BEGIN
              MS54[1,Y]:=MS5[1,Y+1];
              MS54[2,Y]:=MS5[2,Y+1];
              MS54[3,Y]:=MS5[3,Y+1];
            END;
        END;
    END;{CASE}
{PREENCHIMENTO DO VETOR "ELMS1" COM OS ELEMENTOS DA 1ß COLUNA DA MATRIZ "MS1"}
FOR X:=1 TO 4 DO
  ELMS1[X]:=MS1[X,1];
{PREENCHIMENTO DO VETOR "ELMS2" COM OS ELEMENTOS DA 1ß COLUNA DA MATRIZ "MS2"}
FOR X:=1 TO 4 DO
  ELMS2[X]:=MS2[X,1];
{PREENCHIMENTO DO VETOR "ELMS3" COM OS ELEMENTOS DA 1ß COLUNA DA MATRIZ "MS3"}
FOR X:=1 TO 4 DO
  ELMS3[X]:=MS3[X,1];
{PREENCHIMENTO DO VETOR "ELMS4" COM OS ELEMENTOS DA 1ß COLUNA DA MATRIZ "MS4"}
FOR X:=1 TO 4 DO
  ELMS4[X]:=MS4[X,1];
{PREENCHIMENTO DO VETOR "ELMS5" COM OS ELEMENTOS DA 1ß COLUNA DA MATRIZ "MS5"}
FOR X:=1 TO 4 DO
  ELMS5[X]:=MS5[X,1];

{3ß FASE, CALCULAR A DETERMINANTE DAS 20 MATRIZES 3X3 RESULTANTES(MS11,...)}
  RDMS[1]:=(MS11[1,1]*MS11[2,2]*MS11[3,3])+(MS11[1,2]*MS11[2,3]*MS11[3,1])+
           (MS11[1,3]*MS11[2,1]*MS11[3,2])-(MS11[3,1]*MS11[2,2]*MS11[1,3])-
           (MS11[3,2]*MS11[2,3]*MS11[1,1])-(MS11[3,3]*MS11[2,1]*MS11[1,2]);
  RDMS[2]:=(MS12[1,1]*MS12[2,2]*MS12[3,3])+(MS12[1,2]*MS12[2,3]*MS12[3,1])+
           (MS12[1,3]*MS12[2,1]*MS12[3,2])-(MS12[3,1]*MS12[2,2]*MS12[1,3])-
           (MS12[3,2]*MS12[2,3]*MS12[1,1])-(MS12[3,3]*MS12[2,1]*MS12[1,2]);
  RDMS[3]:=(MS13[1,1]*MS13[2,2]*MS13[3,3])+(MS13[1,2]*MS13[2,3]*MS13[3,1])+
           (MS13[1,3]*MS13[2,1]*MS13[3,2])-(MS13[3,1]*MS13[2,2]*MS13[1,3])-
           (MS13[3,2]*MS13[2,3]*MS13[1,1])-(MS13[3,3]*MS13[2,1]*MS13[1,2]);
  RDMS[4]:=(MS14[1,1]*MS14[2,2]*MS14[3,3])+(MS14[1,2]*MS14[2,3]*MS14[3,1])+
           (MS14[1,3]*MS14[2,1]*MS14[3,2])-(MS14[3,1]*MS14[2,2]*MS14[1,3])-
           (MS14[3,2]*MS14[2,3]*MS14[1,1])-(MS14[3,3]*MS14[2,1]*MS14[1,2]);
  RDMS[5]:=(MS21[1,1]*MS21[2,2]*MS21[3,3])+(MS21[1,2]*MS21[2,3]*MS21[3,1])+
           (MS21[1,3]*MS21[2,1]*MS21[3,2])-(MS21[3,1]*MS21[2,2]*MS21[1,3])-
           (MS21[3,2]*MS21[2,3]*MS21[1,1])-(MS21[3,3]*MS21[2,1]*MS21[1,2]);
  RDMS[6]:=(MS22[1,1]*MS22[2,2]*MS22[3,3])+(MS22[1,2]*MS22[2,3]*MS22[3,1])+
           (MS22[1,3]*MS22[2,1]*MS22[3,2])-(MS22[3,1]*MS22[2,2]*MS22[1,3])-
           (MS22[3,2]*MS22[2,3]*MS22[1,1])-(MS22[3,3]*MS22[2,1]*MS22[1,2]);
  RDMS[7]:=(MS23[1,1]*MS23[2,2]*MS23[3,3])+(MS23[1,2]*MS23[2,3]*MS23[3,1])+
           (MS23[1,3]*MS23[2,1]*MS23[3,2])-(MS23[3,1]*MS23[2,2]*MS23[1,3])-
           (MS23[3,2]*MS23[2,3]*MS23[1,1])-(MS23[3,3]*MS23[2,1]*MS23[1,2]);
  RDMS[8]:=(MS24[1,1]*MS24[2,2]*MS24[3,3])+(MS24[1,2]*MS24[2,3]*MS24[3,1])+
           (MS24[1,3]*MS24[2,1]*MS24[3,2])-(MS24[3,1]*MS24[2,2]*MS24[1,3])-
           (MS24[3,2]*MS24[2,3]*MS24[1,1])-(MS24[3,3]*MS24[2,1]*MS24[1,2]);
  RDMS[9]:=(MS31[1,1]*MS31[2,2]*MS31[3,3])+(MS31[1,2]*MS31[2,3]*MS31[3,1])+
           (MS31[1,3]*MS31[2,1]*MS31[3,2])-(MS31[3,1]*MS31[2,2]*MS31[1,3])-
           (MS31[3,2]*MS31[2,3]*MS31[1,1])-(MS31[3,3]*MS31[2,1]*MS31[1,2]);
 RDMS[10]:=(MS32[1,1]*MS32[2,2]*MS32[3,3])+(MS32[1,2]*MS32[2,3]*MS32[3,1])+
           (MS32[1,3]*MS32[2,1]*MS32[3,2])-(MS32[3,1]*MS32[2,2]*MS32[1,3])-
           (MS32[3,2]*MS32[2,3]*MS32[1,1])-(MS32[3,3]*MS32[2,1]*MS32[1,2]);
 RDMS[11]:=(MS33[1,1]*MS33[2,2]*MS33[3,3])+(MS33[1,2]*MS33[2,3]*MS33[3,1])+
           (MS33[1,3]*MS33[2,1]*MS33[3,2])-(MS33[3,1]*MS33[2,2]*MS33[1,3])-
           (MS33[3,2]*MS33[2,3]*MS33[1,1])-(MS33[3,3]*MS33[2,1]*MS33[1,2]);
 RDMS[12]:=(MS34[1,1]*MS34[2,2]*MS34[3,3])+(MS34[1,2]*MS34[2,3]*MS34[3,1])+
           (MS34[1,3]*MS34[2,1]*MS34[3,2])-(MS34[3,1]*MS34[2,2]*MS34[1,3])-
           (MS34[3,2]*MS34[2,3]*MS34[1,1])-(MS34[3,3]*MS34[2,1]*MS34[1,2]);
 RDMS[13]:=(MS41[1,1]*MS41[2,2]*MS41[3,3])+(MS41[1,2]*MS41[2,3]*MS41[3,1])+
           (MS41[1,3]*MS41[2,1]*MS41[3,2])-(MS41[3,1]*MS41[2,2]*MS41[1,3])-
           (MS41[3,2]*MS41[2,3]*MS41[1,1])-(MS41[3,3]*MS41[2,1]*MS41[1,2]);
 RDMS[14]:=(MS42[1,1]*MS42[2,2]*MS42[3,3])+(MS42[1,2]*MS42[2,3]*MS42[3,1])+
           (MS42[1,3]*MS42[2,1]*MS42[3,2])-(MS42[3,1]*MS42[2,2]*MS42[1,3])-
           (MS42[3,2]*MS42[2,3]*MS42[1,1])-(MS42[3,3]*MS42[2,1]*MS42[1,2]);
 RDMS[15]:=(MS43[1,1]*MS43[2,2]*MS43[3,3])+(MS43[1,2]*MS43[2,3]*MS43[3,1])+
           (MS43[1,3]*MS43[2,1]*MS43[3,2])-(MS43[3,1]*MS43[2,2]*MS43[1,3])-
           (MS43[3,2]*MS43[2,3]*MS43[1,1])-(MS43[3,3]*MS43[2,1]*MS43[1,2]);
 RDMS[16]:=(MS44[1,1]*MS44[2,2]*MS44[3,3])+(MS44[1,2]*MS44[2,3]*MS44[3,1])+
           (MS44[1,3]*MS44[2,1]*MS44[3,2])-(MS44[3,1]*MS44[2,2]*MS44[1,3])-
           (MS44[3,2]*MS44[2,3]*MS44[1,1])-(MS44[3,3]*MS44[2,1]*MS44[1,2]);
 RDMS[17]:=(MS51[1,1]*MS51[2,2]*MS51[3,3])+(MS51[1,2]*MS51[2,3]*MS51[3,1])+
           (MS51[1,3]*MS51[2,1]*MS51[3,2])-(MS51[3,1]*MS51[2,2]*MS51[1,3])-
           (MS51[3,2]*MS51[2,3]*MS51[1,1])-(MS51[3,3]*MS51[2,1]*MS51[1,2]);
 RDMS[18]:=(MS52[1,1]*MS52[2,2]*MS52[3,3])+(MS52[1,2]*MS52[2,3]*MS52[3,1])+
           (MS52[1,3]*MS52[2,1]*MS52[3,2])-(MS52[3,1]*MS52[2,2]*MS52[1,3])-
           (MS52[3,2]*MS52[2,3]*MS52[1,1])-(MS52[3,3]*MS52[2,1]*MS52[1,2]);
 RDMS[19]:=(MS53[1,1]*MS53[2,2]*MS53[3,3])+(MS53[1,2]*MS53[2,3]*MS53[3,1])+
           (MS53[1,3]*MS53[2,1]*MS53[3,2])-(MS53[3,1]*MS53[2,2]*MS53[1,3])-
           (MS53[3,2]*MS53[2,3]*MS53[1,1])-(MS53[3,3]*MS53[2,1]*MS53[1,2]);
 RDMS[20]:=(MS54[1,1]*MS54[2,2]*MS54[3,3])+(MS54[1,2]*MS54[2,3]*MS54[3,1])+
           (MS54[1,3]*MS54[2,1]*MS54[3,2])-(MS54[3,1]*MS54[2,2]*MS54[1,3])-
           (MS54[3,2]*MS54[2,3]*MS54[1,1])-(MS54[3,3]*MS54[2,1]*MS54[1,2]);
{4ß FASE, CALCULAR RESULTADOS PARCIAIS DAS MATRIZES "MS's"}
  RPMS[1]:=(RDMS[1]*ELMS1[1]*1)+(RDMS[2]*ELMS1[2]*1*-1)+(RDMS[3]*ELMS1[3]*1)+
  (RDMS[4]*ELMS1[4]*-1);
  RPMS[2]:=(RDMS[5]*ELMS2[1]*1)+(RDMS[6]*ELMS2[2]*1*-1)+(RDMS[7]*ELMS2[3]*1)+
  (RDMS[8]*ELMS2[4]*-1);
  RPMS[3]:=(RDMS[9]*ELMS3[1]*1)+(RDMS[10]*ELMS3[2]*1*-1)+(RDMS[11]*ELMS3[3]*1)+
  (RDMS[12]*ELMS3[4]*-1);
  RPMS[4]:=(RDMS[13]*ELMS4[1]*1)+(RDMS[14]*ELMS4[2]*1*-1)+(RDMS[15]*ELMS4[3]*1)+
  (RDMS[16]*ELMS4[4]*-1);
  RPMS[5]:=(RDMS[17]*ELMS4[1]*1)+(RDMS[18]*ELMS4[2]*1*-1)+(RDMS[19]*ELMS4[3]*1)+
  (RDMS[20]*ELMS4[4]*-1);
{5ß FASE, CALCULAR RESULTADOS FINAIS DAS MATRIZES "MS's"}
  RFMS[1]:=(RPMS[1]*ELMP[1]*1);
  RFMS[2]:=(RPMS[2]*ELMP[2]*-1);
  RFMS[3]:=(RPMS[3]*ELMP[3]*1);
  RFMS[4]:=(RPMS[4]*ELMP[4]*-1);
  RFMS[5]:=(RPMS[5]*ELMP[5]*1);
{6ß FASE, CALCULAR O RESULADO FINAL DA MATRIZ PRINCIPAL}
  RF:=RFMS[1]+RFMS[2]+RFMS[3]+RFMS[4]+RFMS[5];
{FASE FINAL, EXIBIR OS RESULTADOS}
  CENTRA(2,'A DETERMINANTE DA MATRIZ ê =    ');
  CENTRA(24,'PRODUZIDO POR THIAGO G. FERREIRA   2ß P.D.');
  CENTRA(23,'PRESSIONE ALGO...');
  CENTRA(6,'MATRIZ 5 X 5');
  FOR X:=1 TO 5 DO
    BEGIN
      GOTOXY(X*5+24,8); WRITE(MP[1,X]);
      GOTOXY(X*5+24,10); WRITE(MP[2,X]);
      GOTOXY(X*5+24,12); WRITE(MP[3,X]);
      GOTOXY(X*5+24,14); WRITE(MP[4,X]);
      GOTOXY(X*5+24,16); WRITE(MP[5,X]);
    END;
  TEXTCOLOR(15+BLINK);
  GOTOXY(53,2);
  WRITE(RF);
  READKEY;
END.