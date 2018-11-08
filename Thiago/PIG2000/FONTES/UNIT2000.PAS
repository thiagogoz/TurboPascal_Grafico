{PRODUZIDO E IDEALIZADO POR THIAGO DE G‡Z FERREIRA (2000 LINHAS)
2ßP.D. MANH«, COLêGIO CRISTO REDENTOR}

UNIT UNIT2000;{VERS«O 2.0}

INTERFACE

USES DOS,CRT,GRAPH,FINAL;

VAR
  A,B,X,Y,X1,Y1,XB,YB,XT,YT,XE1,XE2,XE3,XE4,YE1,YE2,YE3,YE4,COR,CORAUX:INTEGER;
  OK,NIVEL,XB1,YB1,CORBICHO,POINTS,POINTSAUX,VIDAS,CONT,SOM,CONT2,MODO:INTEGER;
  XZ,YZ,DIRZ,CORZ,Z:INTEGER;
  CH:CHAR;
  R:REGISTERS;
  OK1,OK2,OK3,V,MORTE,TOCA:BOOLEAN;
  PONTOS,HAUX,MAUX:STRING;
  H,M,S,C:WORD;
                                            { L I N H A }
{01} PROCEDURE NAVE(X,Y,COR:INTEGER);          {0049}
{02} PROCEDURE BOTAO_CIMA(X,Y:INTEGER);        {0061}
{03} PROCEDURE BOTAO_BAIXO(X,Y:INTEGER);       {0079}
{04} PROCEDURE FUNDO(X,Y:INTEGER);             {0097}
{05} PROCEDURE FUNDO2(X,Y:INTEGER);            {0120}
{06} PROCEDURE TELAPRIN;                       {0147}
{07} PROCEDURE BICHO(X,Y,COR:INTEGER);         {0165}
{08} PROCEDURE TELAOPTIONS;                    {0182}
{09} PROCEDURE CONFIRMA;                       {0200}
{10} PROCEDURE INICIA;                         {0341}
{11} PROCEDURE CORES;                          {0698}
{12} PROCEDURE LEVEL;                          {0740}
{13} PROCEDURE SAIR;                           {0845}
{14} PROCEDURE MENUPRINCIPAL;                  {0853}
{15} PROCEDURE OPTIONS;                        {0996}
{16} PROCEDURE EXPLODE_BICHO;                  {1167}
{17} PROCEDURE EXPLODE_NAVE;                   {1195}
{18} PROCEDURE GAMEOVER;                       {1223}
{19} PROCEDURE VIDA(X,Y,COR:INTEGER);          {1291}
{20} PROCEDURE ATIRA;                          {1303}
{21} PROCEDURE CHEFE(X,Y,COR:INTEGER);         {1615}
{22} PROCEDURE NAVE2(X,Y,COR:INTEGER);         {1636}
{23} PROCEDURE REDBARON(X,Y:INTEGER);          {1671}
{24} PROCEDURE AJUDA;                          {1708}
{25} PROCEDURE PAUSE;                          {1742}
{26} PROCEDURE CONFIRMA_EXIT;                  {1850}

IMPLEMENTATION

{===== <<< 01 >>> ==========================================================}
PROCEDURE NAVE(X,Y,COR:INTEGER);
  BEGIN
    SETCOLOR(COR);
    LINE(X,Y,X-20,Y+50);
    LINE(X,Y,X+20,Y+50);
    LINE(X-20,Y+50,X,Y+42);
    LINE(X+20,Y+50,X,Y+42);
    SETFILLSTYLE(1,COR);
    FLOODFILL(X,Y+25,COR);
  END;

{===== <<< 02 >>> ==========================================================}
PROCEDURE BOTAO_CIMA(X,Y:INTEGER);
  BEGIN
    SETFILLSTYLE(1,0);
    BAR(X-53,Y-13,X+53,Y+13);
    SETCOLOR(8);
    RECTANGLE(X-50,Y-10,X+50,Y+10);
    RECTANGLE(X-53,Y-13,X+53,Y+13);
    LINE(X+50,Y-10,X+53,Y-13);
    LINE(X-50,Y+10,X-53,Y+13);
    SETFILLSTYLE(1,15);
    FLOODFILL(X,Y-12,8);
    SETFILLSTYLE(1,8);
    FLOODFILL(X,Y+12,8);
    SETFILLSTYLE(1,7);
    FLOODFILL(X,Y,8);
  END;

{===== <<< 03 >>> ==========================================================}
PROCEDURE BOTAO_BAIXO(X,Y:INTEGER);
  BEGIN
    SETFILLSTYLE(1,0);
    BAR(X-53,Y-13,X+53,Y+13);
    SETCOLOR(8);
    RECTANGLE(X-50,Y-10,X+50,Y+10);
    RECTANGLE(X-53,Y-13,X+53,Y+13);
    LINE(X+50,Y-10,X+53,Y-13);
    LINE(X-50,Y+10,X-53,Y+13);
    SETFILLSTYLE(1,0);
    FLOODFILL(X,Y-12,8);
    SETFILLSTYLE(1,15);
    FLOODFILL(X,Y+12,8);
    SETFILLSTYLE(1,8);
    FLOODFILL(X,Y,8);
  END;

{===== <<< 04 >>> ==========================================================}
PROCEDURE FUNDO(X,Y:INTEGER);
  BEGIN
    SETCOLOR(8);
    RECTANGLE(X-80,Y-100,X+80,Y+100);
    RECTANGLE(X-77,Y-97,X+77,Y+97);
    RECTANGLE(X-74,Y-94,X+74,Y+94);
    RECTANGLE(X-71,Y-91,X+71,Y+91);
    LINE(X+80,Y-100,X+77,Y-97);
    LINE(X-80,Y+100,X-77,Y+97);
    LINE(X+74,Y-94,X+71,Y-91);
    LINE(X-74,Y+94,X-71,Y+91);
    SETFILLSTYLE(1,15);
    FLOODFILL(X,Y-98,8);
    FLOODFILL(X,Y+92,8);
    SETFILLSTYLE(1,8);
    FLOODFILL(X,Y+98,8);
    FLOODFILL(X,Y-92,8);
    SETFILLSTYLE(1,7);
    FLOODFILL(X,Y+95,8);
    FLOODFILL(X,Y,8);
  END;

{===== <<< 05 >>> ==========================================================}
PROCEDURE FUNDO2(X,Y:INTEGER);
  BEGIN
    R.AX:=2;
    INTR(51,R);
    SETCOLOR(8);
    RECTANGLE(X-160,Y-50,X+160,Y+50);
    RECTANGLE(X-157,Y-47,X+157,Y+47);
    RECTANGLE(X-154,Y-44,X+154,Y+44);
    RECTANGLE(X-151,Y-41,X+151,Y+41);
    LINE(X+160,Y-50,X+157,Y-47);
    LINE(X-160,Y+50,X-157,Y+47);
    LINE(X+154,Y-44,X+151,Y-41);
    LINE(X-154,Y+44,X-151,Y+41);
    SETFILLSTYLE(1,15);
    FLOODFILL(X,Y-48,8);
    FLOODFILL(X,Y+42,8);
    SETFILLSTYLE(1,8);
    FLOODFILL(X,Y+48,8);
    FLOODFILL(X,Y-42,8);
    SETFILLSTYLE(1,7);
    FLOODFILL(X,Y+45,8);
    FLOODFILL(X,Y,8);
    R.AX:=1;
    INTR(51,R);
  END;

{===== <<< 06 >>> ==========================================================}
PROCEDURE TELAPRIN;
  BEGIN
    CLEARVIEWPORT;
    SETTEXTSTYLE(1,0,4);
    SETCOLOR(15);
    OUTTEXTXY(130,0,'PIG IN THE STARS 2000');
    SETTEXTSTYLE(11,0,3);
    FUNDO(320,240);
    BOTAO_CIMA(320,190);
    BOTAO_CIMA(320,240);
    BOTAO_CIMA(320,290);
    SETCOLOR(0);
    OUTTEXTXY(293,187,'INICIAR');
    OUTTEXTXY(293,237,'OPTIONS');
    OUTTEXTXY(293,287,'ARREGAR');
  END;

{===== <<< 07 >>> ==========================================================}
PROCEDURE BICHO(X,Y,COR:INTEGER);
  BEGIN
    SETCOLOR(COR);
    RECTANGLE(X-30,Y-3,X+30,Y+3);
    LINE(X-20,Y-3,X-10,Y-15);
    LINE(X+20,Y-3,X+10,Y-15);
    LINE(X-10,Y-15,X+10,Y-15);
    LINE(X-20,Y+3,X-10,Y+15);
    LINE(X+20,Y+3,X+10,Y+15);
    LINE(X-10,Y+15,X+10,Y+15);
    SETFILLSTYLE(1,COR);
    FLOODFILL(X,Y-2,COR);
    FLOODFILL(X,Y-12,COR);
    FLOODFILL(X,Y+12,COR);
  END;

{===== <<< 08 >>> ==========================================================}
PROCEDURE TELAOPTIONS;
  BEGIN
    CLEARVIEWPORT;
    SETTEXTSTYLE(1,0,4);
    SETCOLOR(15);
    OUTTEXTXY(35,0,'PIG IN THE STARS 2000 - OPTIONS');
    SETTEXTSTYLE(11,0,3);
    FUNDO(320,240);
    BOTAO_CIMA(320,190);
    BOTAO_CIMA(320,240);
    BOTAO_CIMA(320,290);
    SETCOLOR(0);
    OUTTEXTXY(302,187,'CORES');
    OUTTEXTXY(302,237,'LEVEL');
    OUTTEXTXY(289,287,'RETORNAR');
  END;

{===== <<< 09 >>> ==========================================================}
PROCEDURE CONFIRMA;
  BEGIN
    R.AX:=0;
    INTR(51,R);
    FUNDO2(320,240);
    BOTAO_CIMA(250,250);
    BOTAO_CIMA(390,250);
    SETCOLOR(0);
    OUTTEXTXY(258,215,'ABANDONAR O JOGO ?');
    OUTTEXTXY(238,247,'SIM');
    OUTTEXTXY(378,247,'NAO');
    R.AX:=1;
    INTR(51,R);
    OK1:=FALSE;
    OK2:=FALSE;
  REPEAT
    R.AX:=3;
    INTR(51,R);
{OPCAO 1}
    IF (R.BX=1) AND (R.CX>=200) AND (R.CX<=300) AND (R.DX>=240) AND (R.DX<=260) THEN
      BEGIN
        R.AX:=2;
        INTR(51,R);
        OK1:=TRUE;
        BOTAO_BAIXO(250,250);
        SETCOLOR(0);
        OUTTEXTXY(238,247,'SIM');
        R.AX:=1;
        INTR(51,R);
        REPEAT
          R.AX:=3;
          INTR(51,R);
          IF (R.BX=1) AND (R.CX<200) AND (OK1=TRUE) OR
             (R.BX=1) AND (R.CX>300) AND (OK1=TRUE) OR
             (R.BX=1) AND (R.DX<240) AND (OK1=TRUE) OR
             (R.BX=1) AND (R.DX>260) AND (OK1=TRUE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK1:=FALSE;
              BOTAO_CIMA(250,250);
              SETCOLOR(0);
              OUTTEXTXY(238,247,'SIM');
              R.AX:=1;
              INTR(51,R);
            END;
          IF (R.BX=1) AND (R.CX>=200) AND (R.CX<=300) AND (R.DX>=240) AND (R.DX<=260) AND (OK1=FALSE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK1:=TRUE;
              BOTAO_BAIXO(250,250);
              SETCOLOR(0);
              OUTTEXTXY(238,247,'SIM');
              R.AX:=1;
              INTR(51,R);
            END;
        UNTIL (R.BX=0);
      END;
{OPCAO 2}
    IF (R.BX=1) AND (R.CX>=340) AND (R.CX<=440) AND (R.DX>=240) AND (R.DX<=260) THEN
      BEGIN
        R.AX:=2;
        INTR(51,R);
        OK2:=TRUE;
        BOTAO_BAIXO(390,250);
        SETCOLOR(0);
        OUTTEXTXY(378,247,'NAO');
        R.AX:=1;
        INTR(51,R);
        REPEAT
          R.AX:=3;
          INTR(51,R);
          IF (R.BX=1) AND (R.CX<340) AND (OK2=TRUE) OR
             (R.BX=1) AND (R.CX>440) AND (OK2=TRUE) OR
             (R.BX=1) AND (R.DX<240) AND (OK2=TRUE) OR
             (R.BX=1) AND (R.DX>260) AND (OK2=TRUE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK2:=FALSE;
              BOTAO_CIMA(390,250);
              SETCOLOR(0);
              OUTTEXTXY(378,247,'NAO');
              R.AX:=1;
              INTR(51,R);
            END;
          IF (R.BX=1) AND (R.CX>=340) AND (R.CX<=440) AND (R.DX>=240) AND (R.DX<=260) AND (OK2=FALSE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK2:=TRUE;
              BOTAO_BAIXO(390,250);
              SETCOLOR(0);
              OUTTEXTXY(378,247,'NAO');
              R.AX:=1;
              INTR(51,R);
            END;
        UNTIL (R.BX=0);
      END;
  UNTIL (OK1=TRUE) OR (OK2=TRUE);
  IF OK1=TRUE THEN
    BEGIN
      R.AX:=2;
      INTR(51,R);
      CLEARVIEWPORT;
      V:=TRUE;
      MORTE:=TRUE;
      X1:=320;
      Y1:=400;
      XB1:=RANDOM(550)+40;
      YB1:=100;
      VIDAS:=5;
      POINTSAUX:=0;
      TELAPRIN;
      R.AX:=1;
      INTR(51,R);
      MENUPRINCIPAL;
    IF OK1=TRUE THEN
      INICIA;
    IF OK2=TRUE THEN
      OPTIONS;
    IF OK3=TRUE THEN
      CONFIRMA_EXIT;
    END;
  IF OK2=TRUE THEN
    BEGIN
      X1:=X;
      Y1:=Y;
      POINTSAUX:=POINTS;
      V:=TRUE;
      XB1:=XB;
      YB1:=YB;
      R.AX:=2;
      INTR(51,R);
      CLEARVIEWPORT;
      INICIA;
    END;
  END;

{===== <<< 10 >>> ==========================================================}
PROCEDURE INICIA;
  BEGIN
    R.AX:=2;
    INTR(51,R);
    CLEARVIEWPORT;
    CASE VIDAS OF
      5:BEGIN
          VIDA(500,10,COR);
          VIDA(530,10,COR);
          VIDA(560,10,COR);
          VIDA(590,10,COR);
          VIDA(620,10,COR);
        END;
      4:BEGIN
          VIDA(530,10,COR);
          VIDA(560,10,COR);
          VIDA(590,10,COR);
          VIDA(620,10,COR);
        END;
      3:BEGIN
          VIDA(560,10,COR);
          VIDA(590,10,COR);
          VIDA(620,10,COR);
        END;
      2:BEGIN
          VIDA(590,10,COR);
          VIDA(620,10,COR);
        END;
      1:BEGIN
          VIDA(620,10,COR);
        END;
      0:BEGIN
          CLEARVIEWPORT;
          V:=TRUE;
          VIDAS:=5;
          X1:=320;
          Y1:=400;
          XB1:=RANDOM(550)+40;
          YB1:=100;
          POINTSAUX:=0;
          GAMEOVER;
          R.AX:=0;
          INTR(51,R);
          TELAPRIN;
          R.AX:=1;
          INTR(51,R);
          MENUPRINCIPAL;
        END;
    END;
    X:=X1;
    Y:=Y1;
    XB:=XB1;
    YB:=YB1;
    POINTS:=POINTSAUX;
    NAVE(X,Y,COR);
    BICHO(XB,YB,CORBICHO);
    OK1:=FALSE;
    OK2:=FALSE;
    XE1:=RANDOM(550)+40;
    XE2:=RANDOM(550)+40;
    XE3:=RANDOM(550)+40;
    XE4:=RANDOM(550)+40;
    YE1:=100;
    YE2:=120;
    YE3:=140;
    YE4:=160;
    SETCOLOR(15);
    LINE(0,50,640,50);
    STR(POINTS,PONTOS);
    OUTTEXTXY(0,15,'PONTOS = ');
    OUTTEXTXY(0,0,'F1 = AJUDA');
    OUTTEXTXY(73,15,PONTOS);
    IF MORTE=TRUE THEN
      BEGIN
        MORTE:=FALSE;
        SETTEXTSTYLE(1,0,2);
        OUTTEXTXY(230,0,'< PRESS ENTER >');
        SETTEXTSTYLE(11,0,2);
        REPEAT
          CH:=READKEY;
          IF CH=#0 THEN
            CH:=READKEY;
        UNTIL (CH=#13) OR (CH=#27);
        SETFILLSTYLE(1,0);
        BAR(0,0,640,40);
        IF (CH=#27) THEN
          CONFIRMA;
      END;
    REPEAT
      REPEAT
        IF V=TRUE THEN
          CASE VIDAS OF
            5:BEGIN
                VIDA(500,10,COR);
                VIDA(530,10,COR);
                VIDA(560,10,COR);
                VIDA(590,10,COR);
                VIDA(620,10,COR);
                V:=FALSE;
              END;
            4:BEGIN
                VIDA(530,10,COR);
                VIDA(560,10,COR);
                VIDA(590,10,COR);
                VIDA(620,10,COR);
                V:=FALSE;
              END;
            3:BEGIN
                VIDA(560,10,COR);
                VIDA(590,10,COR);
                VIDA(620,10,COR);
                V:=FALSE;
              END;
            2:BEGIN
                VIDA(590,10,COR);
                VIDA(620,10,COR);
                V:=FALSE;
              END;
            1:BEGIN
                VIDA(620,10,COR);
                V:=FALSE;
              END;
            0:BEGIN
                V:=FALSE;
                CLEARVIEWPORT;
                GAMEOVER;
                R.AX:=2;
                INTR(51,R);
                R.AX:=0;
                INTR(51,R);
                TELAPRIN;
                R.AX:=1;
                INTR(51,R);
                MENUPRINCIPAL;
              END;
          END;
        IF (XE1<X-25) AND (YE1>Y) OR
           (XE1>X+25) AND (YE1>Y) OR
           (XE1<X-25) AND (YE1<Y+55) OR
           (XE1>X+25) AND (YE1<Y+55) THEN
          BEGIN
            PUTPIXEL(XE1,YE1,15);
            PUTPIXEL(XE1-1,YE1,15);
            PUTPIXEL(XE1+1,YE1,15);
            PUTPIXEL(XE1,YE1-1,15);
            PUTPIXEL(XE1,YE1+1,15);
            DELAY(2);
            PUTPIXEL(XE1,YE1,0);
            PUTPIXEL(XE1-1,YE1,0);
            PUTPIXEL(XE1+1,YE1,0);
            PUTPIXEL(XE1,YE1-1,0);
            PUTPIXEL(XE1,YE1+1,0);
          END;
        IF (XE2<X-25) AND (YE2>Y) OR
           (XE2>X+25) AND (YE2>Y) OR
           (XE2<X-25) AND (YE2<Y+55) OR
           (XE2>X+25) AND (YE2<Y+55) THEN
          BEGIN
            PUTPIXEL(XE2,YE2,15);
            PUTPIXEL(XE2-1,YE2,15);
            PUTPIXEL(XE2+1,YE2,15);
            PUTPIXEL(XE2,YE2-1,15);
            PUTPIXEL(XE2,YE2+1,15);
            DELAY(2);
            PUTPIXEL(XE2,YE2,0);
            PUTPIXEL(XE2-1,YE2,0);
            PUTPIXEL(XE2+1,YE2,0);
            PUTPIXEL(XE2,YE2-1,0);
            PUTPIXEL(XE2,YE2+1,0);
          END;
        IF (XE3<X-25) AND (YE3>Y) OR
           (XE3>X+25) AND (YE3>Y) OR
           (XE3<X-25) AND (YE3<Y+55) OR
           (XE3>X+25) AND (YE3<Y+55) THEN
          BEGIN
            PUTPIXEL(XE3,YE3,15);
            PUTPIXEL(XE3-1,YE3,15);
            PUTPIXEL(XE3+1,YE3,15);
            PUTPIXEL(XE3,YE3-1,15);
            PUTPIXEL(XE3,YE3+1,15);
            DELAY(2);
            PUTPIXEL(XE3,YE3,0);
            PUTPIXEL(XE3-1,YE3,0);
            PUTPIXEL(XE3+1,YE3,0);
            PUTPIXEL(XE3,YE3-1,0);
            PUTPIXEL(XE3,YE3+1,0);
          END;
        IF (XE4<X-25) AND (YE4>Y) OR
           (XE4>X+25) AND (YE4>Y) OR
           (XE4<X-25) AND (YE4<Y+55) OR
           (XE4>X+25) AND (YE4<Y+55) THEN
          BEGIN
            PUTPIXEL(XE4,YE4,15);
            PUTPIXEL(XE4-1,YE4,15);
            PUTPIXEL(XE4+1,YE4,15);
            PUTPIXEL(XE4,YE4-1,15);
            PUTPIXEL(XE4,YE4+1,15);
            DELAY(2);
            PUTPIXEL(XE4,YE4,0);
            PUTPIXEL(XE4-1,YE4,0);
            PUTPIXEL(XE4+1,YE4,0);
            PUTPIXEL(XE4,YE4-1,0);
            PUTPIXEL(XE4,YE4+1,0);
          END;
        IF (XB>=X-60) AND (XB<=X+60) AND (YB>=Y-20) AND (YB<=Y+50) THEN
          BEGIN
            MORTE:=TRUE;
            CORBICHO:=RANDOM(15)+1;
            V:=TRUE;
            VIDAS:=VIDAS-1;
            XB1:=RANDOM(550)+40;
            YB1:=100;
            EXPLODE_NAVE;
            X1:=320;
            Y1:=400;
            POINTSAUX:=POINTS;
            R.AX:=2;
            INTR(51,R);
            CLEARVIEWPORT;
            INICIA;
          END;
          BICHO(XB,YB,CORBICHO);
          DELAY(10);
          BICHO(XB,YB,0);
        IF CONT<>40 THEN
          BEGIN
            IF TOCA=TRUE THEN
              BEGIN
                IF CONT=0 THEN
                  BEGIN
                    SETFILLSTYLE(1,0);
                    BAR(250,0,400,30);
                  END;
                SETCOLOR(15);
                SETTEXTSTYLE(1,0,2);
                OUTTEXTXY(270,10,'SOUND ON');
                CONT:=CONT+1;
                SETTEXTSTYLE(11,0,2);
              END
            ELSE
              BEGIN
                NOSOUND;
                IF CONT=0 THEN
                  BEGIN
                    SETFILLSTYLE(1,0);
                    BAR(250,0,400,30);
                  END;
                SETCOLOR(15);
                SETTEXTSTYLE(1,0,2);
                OUTTEXTXY(265,10,'SOUND OFF');
                CONT:=CONT+1;
                SETTEXTSTYLE(11,0,2);
              END;
          END;
          IF CONT=40 THEN
            BEGIN
              SETFILLSTYLE(1,0);
              BAR(250,0,400,30);
            END;
          YE1:=YE1+10;
          YE2:=YE2+10;
          YE3:=YE3+10;
          YE4:=YE4+10;
          STR(POINTS,PONTOS);
          SETFILLSTYLE(1,0);
          BAR(0,0,200,40);
          SETCOLOR(15);
          OUTTEXTXY(0,15,'PONTOS = ');
          OUTTEXTXY(73,15,PONTOS);
          GETTIME(H,M,S,C);
          STR(H,HAUX);
          STR(M,MAUX);
          OUTTEXTXY(0,0,'F1 = AJUDA');
          OUTTEXTXY(0,30,'HORA =');
          OUTTEXTXY(72,30,':');
          OUTTEXTXY(56,30,HAUX);
          OUTTEXTXY(81,30,MAUX);
          CASE NIVEL OF
            1:YB:=YB+5;
            2:YB:=YB+8;
            3:YB:=YB+20;
          END;
        IF YE1=470 THEN
          BEGIN
            YE1:=100;
            XE1:=RANDOM(550)+40;
          END;
        IF YE2=470 THEN
          BEGIN
            YE2:=120;
            XE2:=RANDOM(550)+40;
          END;
        IF YE3=470 THEN
          BEGIN
            YE3:=140;
            XE3:=RANDOM(550)+40;
          END;
        IF YE4=470 THEN
          BEGIN
            YE4:=160;
            XE4:=RANDOM(550)+40;
          END;
        IF YB>=470 THEN
          BEGIN
            CORBICHO:=RANDOM(15)+1;
            YB:=100;
            XB:=RANDOM(550)+40;
            POINTS:=POINTS-50;
          END;
    UNTIL KEYPRESSED;
      CH:=READKEY;
      IF CH=#0 THEN
        CH:=READKEY;
      CASE CH OF
        #75:BEGIN
              IF X>=40 THEN
                BEGIN
                  NAVE(X,Y,0);
                  X:=X-20;
                  NAVE(X,Y,COR);
                END;
            END;
        #77:BEGIN
              IF X<=600 THEN
                BEGIN
                  NAVE(X,Y,0);
                  X:=X+20;
                  NAVE(X,Y,COR);
                END;
            END;
        #32:BEGIN
              ATIRA;
            END;
        #27:BEGIN
              CONFIRMA;
            END;
        #112,#80:BEGIN
                   PAUSE;
                 END;
        #59:AJUDA;
        #63:BEGIN
              IF (TOCA=TRUE) THEN
                BEGIN
                  TOCA:=FALSE;
                  CONT:=0;
                END
              ELSE
                BEGIN
                  TOCA:=TRUE;
                  CONT:=0;
                END;
            END;
      END;{CASE}
    UNTIL (OK1=TRUE);
  END;

{===== <<< 11 >>> ==========================================================}
PROCEDURE CORES;
  BEGIN
    R.AX:=2;
    INTR(51,R);
    CLEARVIEWPORT;
    SETTEXTSTYLE(1,0,4);
    SETCOLOR(15);
    OUTTEXTXY(55,0,'PIG IN THE STARS 2000 - CORES');
    SETTEXTSTYLE(1,0,1);
    OUTTEXTXY(20,450,'<-> = CORES / ENTER = CONFIRMA ESCOLHA / ESC = CANCELA');
    SETTEXTSTYLE(11,0,3);
    FUNDO(320,240);
    SETFILLSTYLE(1,0);
    BAR(290,200,350,290);
    NAVE(320,220,COR);
    CORAUX:=COR;
  REPEAT
    CH:=READKEY;
    IF CH=#0 THEN
      CH:=READKEY;
    CASE CH OF
      #75: BEGIN
             IF COR<>1 THEN
               BEGIN
                 COR:=COR-1;
                 NAVE(320,220,COR);
               END;
           END;
      #77: BEGIN
             IF COR<>15 THEN
               BEGIN
                 COR:=COR+1;
                 NAVE(320,220,COR);
               END;
           END;
    END;
  UNTIL(CH=#13) OR (CH=#27);
  IF (CH=#27) THEN
    COR:=CORAUX;
  END;

{===== <<< 12 >>> ==========================================================}
PROCEDURE LEVEL;
  BEGIN
    R.AX:=2;
    INTR(51,R);
    CLEARVIEWPORT;
    SETTEXTSTYLE(1,0,4);
    SETCOLOR(15);
    OUTTEXTXY(55,0,'PIG IN THE STARS 2000 - LEVEL');
    SETTEXTSTYLE(1,0,1);
    OUTTEXTXY(100,450,'ENTER = CONFIRMA ESCOLHA / ESC = CANCELA');
    SETTEXTSTYLE(11,0,3);
    FUNDO(320,240);
    IF NIVEL=1 THEN
      BEGIN
        BOTAO_BAIXO(320,190);
        BOTAO_CIMA (320,240);
        BOTAO_CIMA (320,290);
        OK:=1;
      END;
    IF NIVEL=2 THEN
      BEGIN
        BOTAO_CIMA (320,190);
        BOTAO_BAIXO(320,240);
        BOTAO_CIMA (320,290);
        OK:=2;
      END;
    IF NIVEL=3 THEN
      BEGIN
        BOTAO_CIMA (320,190);
        BOTAO_CIMA (320,240);
        BOTAO_BAIXO(320,290);
        OK:=3;
      END;
    SETCOLOR(0);
    OUTTEXTXY(304,187,'EASY');
    OUTTEXTXY(297,237,'NORMAL');
    OUTTEXTXY(304,287,'HARD');
    R.AX:=1;
    INTR(51,R);
  REPEAT
    REPEAT
      R.AX:=3;
      INTR(51,R);
{OPCAO 1}
    IF (R.BX=1) AND (R.CX>=270) AND (R.CX<=370) AND (R.DX>=180) AND (R.DX<=200) AND (NIVEL<>1) THEN
      BEGIN
        R.AX:=2;
        INTR(51,R);
        NIVEL:=1;
        BOTAO_BAIXO(320,190);
        BOTAO_CIMA (320,240);
        BOTAO_CIMA (320,290);
        SETCOLOR(0);
        OUTTEXTXY(304,187,'EASY');
        OUTTEXTXY(297,237,'NORMAL');
        OUTTEXTXY(304,287,'HARD');
        R.AX:=1;
        INTR(51,R);
      END;
{OPCAO 2}
    IF (R.BX=1) AND (R.CX>=270) AND (R.CX<=370) AND (R.DX>=230) AND (R.DX<=250) AND (NIVEL<>2) THEN
      BEGIN
        R.AX:=2;
        INTR(51,R);
        NIVEL:=2;
        BOTAO_CIMA (320,190);
        BOTAO_BAIXO(320,240);
        BOTAO_CIMA (320,290);
        SETCOLOR(0);
        OUTTEXTXY(304,187,'EASY');
        OUTTEXTXY(297,237,'NORMAL');
        OUTTEXTXY(304,287,'HARD');
        R.AX:=1;
        INTR(51,R);
      END;
{OPCAO 3}
    IF (R.BX=1) AND (R.CX>=270) AND (R.CX<=370) AND (R.DX>=280) AND (R.DX<=300) AND (NIVEL<>3) THEN
      BEGIN
        R.AX:=2;
        INTR(51,R);
        NIVEL:=3;
        BOTAO_CIMA (320,190);
        BOTAO_CIMA (320,240);
        BOTAO_BAIXO(320,290);
        SETCOLOR(0);
        OUTTEXTXY(304,187,'EASY');
        OUTTEXTXY(297,237,'NORMAL');
        OUTTEXTXY(304,287,'HARD');
        R.AX:=1;
        INTR(51,R);
      END;
    UNTIL KEYPRESSED;
    CH:=READKEY;
    IF CH=#0 THEN
      CH:=READKEY;
    IF CH=#13 THEN
      NIVEL:=NIVEL;
    IF CH=#27 THEN
      NIVEL:=OK;
    IF (CH<>#27) AND (CH<>#13) THEN
      NIVEL:=0;
  UNTIL (NIVEL<>0);
  END;

{===== <<< 13 >>> ==========================================================}
PROCEDURE SAIR;
  BEGIN
    R.AX:=2;
    INTR(51,R);
    FIM;
  END;

{===== <<< 14 >>> ==========================================================}
PROCEDURE MENUPRINCIPAL;
  BEGIN
    OK1:=FALSE;
    OK2:=FALSE;
    OK3:=FALSE;
    R.AX:=1;
    INTR(51,R);
  REPEAT
    R.AX:=3;
    INTR(51,R);
{OPCAO 1}
    IF (R.BX=1) AND (R.CX>=270) AND (R.CX<=370) AND (R.DX>=180) AND (R.DX<=200) THEN
      BEGIN
        R.AX:=2;
        INTR(51,R);
        OK1:=TRUE;
        BOTAO_BAIXO(320,190);
        SETCOLOR(0);
        OUTTEXTXY(293,187,'INICIAR');
        R.AX:=1;
        INTR(51,R);
        REPEAT
          R.AX:=3;
          INTR(51,R);
          IF (R.BX=1) AND (R.CX<270) AND (OK1=TRUE) OR
             (R.BX=1) AND (R.CX>370) AND (OK1=TRUE) OR
             (R.BX=1) AND (R.DX<180) AND (OK1=TRUE) OR
             (R.BX=1) AND (R.DX>200) AND (OK1=TRUE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK1:=FALSE;
              BOTAO_CIMA(320,190);
              SETCOLOR(0);
              OUTTEXTXY(293,187,'INICIAR');
              R.AX:=1;
              INTR(51,R);
            END;
          IF (R.BX=1) AND (R.CX>=270) AND (R.CX<=370) AND (R.DX>=180) AND (R.DX<=200) AND (OK1=FALSE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK1:=TRUE;
              BOTAO_BAIXO(320,190);
              SETCOLOR(0);
              OUTTEXTXY(293,187,'INICIAR');
              R.AX:=1;
              INTR(51,R);
            END;
        UNTIL (R.BX=0);
      END;
{OPCAO 2}
    IF (R.BX=1) AND (R.CX>=270) AND (R.CX<=370) AND (R.DX>=230) AND (R.DX<=250) THEN
      BEGIN
        R.AX:=2;
        INTR(51,R);
        OK2:=TRUE;
        BOTAO_BAIXO(320,240);
        SETCOLOR(0);
        OUTTEXTXY(293,237,'OPTIONS');
        R.AX:=1;
        INTR(51,R);
        REPEAT
          R.AX:=3;
          INTR(51,R);
          IF (R.BX=1) AND (R.CX<270) AND (OK2=TRUE) OR
             (R.BX=1) AND (R.CX>370) AND (OK2=TRUE) OR
             (R.BX=1) AND (R.DX<230) AND (OK2=TRUE) OR
             (R.BX=1) AND (R.DX>250) AND (OK2=TRUE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK2:=FALSE;
              BOTAO_CIMA(320,240);
              SETCOLOR(0);
              OUTTEXTXY(293,237,'OPTIONS');
              R.AX:=1;
              INTR(51,R);
            END;
          IF (R.BX=1) AND (R.CX>=270) AND (R.CX<=370) AND (R.DX>=230) AND (R.DX<=250) AND (OK2=FALSE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK2:=TRUE;
              BOTAO_BAIXO(320,240);
              SETCOLOR(0);
              OUTTEXTXY(293,237,'OPTIONS');
              R.AX:=1;
              INTR(51,R);
            END;
        UNTIL (R.BX=0);
      END;
{OPCAO 3}
    IF (R.BX=1) AND (R.CX>=270) AND (R.CX<=370) AND (R.DX>=280) AND (R.DX<=300) THEN
      BEGIN
        R.AX:=2;
        INTR(51,R);
        OK3:=TRUE;
        BOTAO_BAIXO(320,290);
        SETCOLOR(0);
        OUTTEXTXY(293,287,'ARREGAR');
        R.AX:=1;
        INTR(51,R);
        REPEAT
          R.AX:=3;
          INTR(51,R);
          IF (R.BX=1) AND (R.CX<270) AND (OK3=TRUE) OR
             (R.BX=1) AND (R.CX>370) AND (OK3=TRUE) OR
             (R.BX=1) AND (R.DX<280) AND (OK3=TRUE) OR
             (R.BX=1) AND (R.DX>300) AND (OK3=TRUE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK3:=FALSE;
              BOTAO_CIMA(320,290);
              SETCOLOR(0);
              OUTTEXTXY(293,287,'ARREGAR');
              R.AX:=1;
              INTR(51,R);
            END;
          IF (R.BX=1) AND (R.CX>=270) AND (R.CX<=370) AND (R.DX>=280) AND (R.DX<=300) AND (OK3=FALSE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK3:=TRUE;
              BOTAO_BAIXO(320,290);
              SETCOLOR(0);
              OUTTEXTXY(293,287,'ARREGAR');
              R.AX:=1;
              INTR(51,R);
            END;
        UNTIL (R.BX=0);
      END;
  UNTIL (OK1=TRUE) OR (OK2=TRUE) OR (OK3=TRUE);
  IF OK1=TRUE THEN
    INICIA;
  IF OK2=TRUE THEN
    OPTIONS;
  IF OK3=TRUE THEN
    CONFIRMA_EXIT;
  END;

{===== <<< 15 >>> ==========================================================}
PROCEDURE OPTIONS;
  BEGIN
    R.AX:=2;
    INTR(51,R);
    TELAOPTIONS;
    R.AX:=1;
    INTR(51,R);
    OK1:=FALSE;
    OK2:=FALSE;
    OK3:=FALSE;
{MENU OPTIONS}
  REPEAT
    R.AX:=3;
    INTR(51,R);
{OPCAO 1}
    IF (R.BX=1) AND (R.CX>=270) AND (R.CX<=370) AND (R.DX>=180) AND (R.DX<=200) THEN
      BEGIN
        R.AX:=2;
        INTR(51,R);
        OK1:=TRUE;
        BOTAO_BAIXO(320,190);
        SETCOLOR(0);
        OUTTEXTXY(302,187,'CORES');
        R.AX:=1;
        INTR(51,R);
        REPEAT
          R.AX:=3;
          INTR(51,R);
          IF (R.BX=1) AND (R.CX<270) AND (OK1=TRUE) OR
             (R.BX=1) AND (R.CX>370) AND (OK1=TRUE) OR
             (R.BX=1) AND (R.DX<180) AND (OK1=TRUE) OR
             (R.BX=1) AND (R.DX>200) AND (OK1=TRUE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK1:=FALSE;
              BOTAO_CIMA(320,190);
              SETCOLOR(0);
              OUTTEXTXY(302,187,'CORES');
              R.AX:=1;
              INTR(51,R);
            END;
          IF (R.BX=1) AND (R.CX>=270) AND (R.CX<=370) AND (R.DX>=180) AND (R.DX<=200) AND (OK1=FALSE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK1:=TRUE;
              BOTAO_BAIXO(320,190);
              SETCOLOR(0);
              OUTTEXTXY(302,187,'CORES');
              R.AX:=1;
              INTR(51,R);
            END;
        UNTIL (R.BX=0);
      END;
{OPCAO 2}
    IF (R.BX=1) AND (R.CX>=270) AND (R.CX<=370) AND (R.DX>=230) AND (R.DX<=250) THEN
      BEGIN
        R.AX:=2;
        INTR(51,R);
        OK2:=TRUE;
        BOTAO_BAIXO(320,240);
        SETCOLOR(0);
        OUTTEXTXY(302,237,'LEVEL');
        R.AX:=1;
        INTR(51,R);
        REPEAT
          R.AX:=3;
          INTR(51,R);
          IF (R.BX=1) AND (R.CX<270) AND (OK2=TRUE) OR
             (R.BX=1) AND (R.CX>370) AND (OK2=TRUE) OR
             (R.BX=1) AND (R.DX<230) AND (OK2=TRUE) OR
             (R.BX=1) AND (R.DX>250) AND (OK2=TRUE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK2:=FALSE;
              BOTAO_CIMA(320,240);
              SETCOLOR(0);
              OUTTEXTXY(302,237,'LEVEL');
              R.AX:=1;
              INTR(51,R);
            END;
          IF (R.BX=1) AND (R.CX>=270) AND (R.CX<=370) AND (R.DX>=230) AND (R.DX<=250) AND (OK2=FALSE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK2:=TRUE;
              BOTAO_BAIXO(320,240);
              SETCOLOR(0);
              OUTTEXTXY(302,237,'LEVEL');
              R.AX:=1;
              INTR(51,R);
            END;
        UNTIL (R.BX=0);
      END;
{OPCAO 3}
    IF (R.BX=1) AND (R.CX>=270) AND (R.CX<=370) AND (R.DX>=280) AND (R.DX<=300) THEN
      BEGIN
        R.AX:=2;
        INTR(51,R);
        OK3:=TRUE;
        BOTAO_BAIXO(320,290);
        SETCOLOR(0);
        OUTTEXTXY(289,287,'RETORNAR');
        R.AX:=1;
        INTR(51,R);
        REPEAT
          R.AX:=3;
          INTR(51,R);
          IF (R.BX=1) AND (R.CX<270) AND (OK3=TRUE) OR
             (R.BX=1) AND (R.CX>370) AND (OK3=TRUE) OR
             (R.BX=1) AND (R.DX<280) AND (OK3=TRUE) OR
             (R.BX=1) AND (R.DX>300) AND (OK3=TRUE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK3:=FALSE;
              BOTAO_CIMA(320,290);
              SETCOLOR(0);
              OUTTEXTXY(289,287,'RETORNAR');
              R.AX:=1;
              INTR(51,R);
            END;
          IF (R.BX=1) AND (R.CX>=270) AND (R.CX<=370) AND (R.DX>=280) AND (R.DX<=300) AND (OK3=FALSE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK3:=TRUE;
              BOTAO_BAIXO(320,290);
              SETCOLOR(0);
              OUTTEXTXY(289,287,'RETORNAR');
              R.AX:=1;
              INTR(51,R);
            END;
        UNTIL (R.BX=0);
      END;
  UNTIL (OK1=TRUE) OR (OK2=TRUE) OR (OK3=TRUE);
  IF (OK1=TRUE) THEN
    BEGIN
      CORES;
      R.AX:=1;
      INTR(51,R);
      OPTIONS;
    END;
  IF (OK2=TRUE) THEN
    BEGIN
      LEVEL;
      R.AX:=1;
      INTR(51,R);
      OPTIONS;
    END;
  IF (OK3=TRUE) THEN
    BEGIN
      R.AX:=2;
      INTR(51,R);
      CLEARVIEWPORT;
      TELAPRIN;
      R.AX:=1;
      INTR(51,R);
      MENUPRINCIPAL;
      IF OK1=TRUE THEN
        INICIA;
      IF OK2=TRUE THEN
        OPTIONS;
      IF OK3=TRUE THEN
        CONFIRMA_EXIT;
    END;
  END;

{===== <<< 16 >>> ==========================================================}
PROCEDURE EXPLODE_BICHO;
  VAR
    AUX:INTEGER;
  BEGIN
    SOM:=300;
    R.AX:=2;
    INTR(51,R);
    SETFILLSTYLE(1,0);
    BAR(XB-30,YB-15,XB+30,YB+15);
    FOR AUX:=5 TO 20 DO
      BEGIN
        SETFILLSTYLE(1,15);
        SETCOLOR(15);
        CIRCLE(XB,YB,AUX);
        FLOODFILL(XB,YB,15);
        IF TOCA=TRUE THEN
          SOUND(SOM);
        DELAY(1);
        SETFILLSTYLE(1,0);
        SETCOLOR(0);
        CIRCLE(XB,YB,AUX);
        FLOODFILL(XB,YB,0);
        SOM:=SOM-20;
      END;
    NOSOUND;
  END;

{===== <<< 17 >>> ==========================================================}
PROCEDURE EXPLODE_NAVE;
  VAR
    AUX:INTEGER;
  BEGIN
    SOM:=400;
    R.AX:=2;
    INTR(51,R);
    SETFILLSTYLE(1,0);
    BAR(X-30,Y-50,X+30,Y+50);
    FOR AUX:=5 TO 50 DO
      BEGIN
        SETFILLSTYLE(1,15);
        SETCOLOR(15);
        CIRCLE(X,Y+20,AUX);
        FLOODFILL(X,Y+20,15);
        IF TOCA=TRUE THEN
          SOUND(SOM);
        DELAY(1);
        SETFILLSTYLE(1,0);
        SETCOLOR(0);
        CIRCLE(X,Y+20,AUX);
        FLOODFILL(X,Y+20,0);
        SOM:=SOM-10;
      END;
    NOSOUND;
  END;

{===== <<< 18 >>> ==========================================================}
PROCEDURE GAMEOVER;
  VAR
    AUX:INTEGER;
  BEGIN
    R.AX:=2;
    INTR(51,R);
    AUX:=-60;
    SETCOLOR(15);
    SETTEXTSTYLE(1,0,3);
    OUTTEXTXY(105,450,'PRODUZIDO POR THIAGO G. FERREIRA');
    STR(POINTS,PONTOS);
    OUTTEXTXY(230,370,'PONTOS = ');
    OUTTEXTXY(355,370,PONTOS);
    LINE(0,281,640,281);
    SETTEXTSTYLE(10,0,5);
    REPEAT
      SETCOLOR(15);
      OUTTEXTXY(125,AUX,'G  ME OVER');
      NAVE(192,AUX+30,15);
      DELAY(50);
      SETCOLOR(0);
      OUTTEXTXY(125,AUX,'G  ME OVER');
      NAVE(192,AUX+30,0);
      AUX:=AUX+10;
  UNTIL (AUX>=200);
  SETCOLOR(15);
  OUTTEXTXY(125,AUX,'G  ME OVER');
  NAVE(192,AUX+30,15);
    REPEAT
      SETCOLOR(15);
      OUTTEXTXY(125,AUX,'G  ME OVER');
      NAVE(192,AUX+30,15);
      DELAY(50);
      SETCOLOR(0);
      OUTTEXTXY(125,AUX,'G  ME OVER');
      NAVE(192,AUX+30,0);
      AUX:=AUX-10;
  UNTIL (AUX<=100);
  SETCOLOR(15);
  OUTTEXTXY(125,AUX,'G  ME OVER');
  NAVE(192,AUX+30,15);
  DELAY(20);
    REPEAT
      SETCOLOR(15);
      OUTTEXTXY(125,AUX,'G  ME OVER');
      NAVE(192,AUX+30,15);
      DELAY(50);
      SETCOLOR(0);
      OUTTEXTXY(125,AUX,'G  ME OVER');
      NAVE(192,AUX+30,0);
      AUX:=AUX+10;
  UNTIL (AUX>=200);
  SETCOLOR(15);
  OUTTEXTXY(125,AUX,'G  ME OVER');
  NAVE(192,AUX+30,15);
  DELAY(2000);
  X:=192;
  Y:=AUX+30;
  EXPLODE_NAVE;
  SETCOLOR(15);
  LINE(0,281,640,281);
  OUTTEXTXY(125,AUX,'G  ME OVER');
  NAVE(192,AUX+30,15);
  CLEARVIEWPORT;
{  RANKING;}
END;

{===== <<< 19 >>> ==========================================================}
PROCEDURE VIDA(X,Y,COR:INTEGER);
  BEGIN
    SETCOLOR(COR);
    LINE(X,Y,X-10,Y+25);
    LINE(X,Y,X+10,Y+25);
    LINE(X-10,Y+25,X,Y+21);
    LINE(X+10,Y+25,X,Y+21);
    SETFILLSTYLE(1,COR);
    FLOODFILL(X,Y+12,COR);
  END;

{===== <<< 20 >>> ==========================================================}
PROCEDURE ATIRA;
  BEGIN
    XT:=X;
    YT:=Y;
    SOM:=1000;
    BICHO(XB,YB,CORBICHO);
  REPEAT
    REPEAT
      IF V=TRUE THEN
        CASE VIDAS OF
          5:BEGIN
              VIDA(500,10,COR);
              VIDA(530,10,COR);
              VIDA(560,10,COR);
              VIDA(590,10,COR);
              VIDA(620,10,COR);
              V:=FALSE;
            END;
          4:BEGIN
              VIDA(530,10,COR);
              VIDA(560,10,COR);
              VIDA(590,10,COR);
              VIDA(620,10,COR);
              V:=FALSE;
              END;
            3:BEGIN
                VIDA(560,10,COR);
                VIDA(590,10,COR);
                VIDA(620,10,COR);
                V:=FALSE;
              END;
            2:BEGIN
                VIDA(590,10,COR);
                VIDA(620,10,COR);
                V:=FALSE;
              END;
            1:BEGIN
                VIDA(620,10,COR);
                V:=FALSE;
              END;
            0:BEGIN
                V:=FALSE;
                X1:=320;
                Y1:=400;
                XB1:=RANDOM(550)+40;
                YB1:=100;
                VIDAS:=5;
                POINTSAUX:=0;
                CLEARVIEWPORT;
                GAMEOVER;
                R.AX:=2;
                INTR(51,R);
                R.AX:=0;
                INTR(51,R);
                TELAPRIN;
                R.AX:=1;
                INTR(51,R);
                MENUPRINCIPAL;
              END;
          END;
        IF (XE1<X-25) AND (YE1>Y) OR
           (XE1>X+25) AND (YE1>Y) OR
           (XE1<X-25) AND (YE1<Y+55) OR
           (XE1>X+25) AND (YE1<Y+55) THEN
          BEGIN
            PUTPIXEL(XE1,YE1,15);
            PUTPIXEL(XE1-1,YE1,15);
            PUTPIXEL(XE1+1,YE1,15);
            PUTPIXEL(XE1,YE1-1,15);
            PUTPIXEL(XE1,YE1+1,15);
            DELAY(2);
            PUTPIXEL(XE1,YE1,0);
            PUTPIXEL(XE1-1,YE1,0);
            PUTPIXEL(XE1+1,YE1,0);
            PUTPIXEL(XE1,YE1-1,0);
            PUTPIXEL(XE1,YE1+1,0);
          END;
        IF (XE2<X-25) AND (YE2>Y) OR
           (XE2>X+25) AND (YE2>Y) OR
           (XE2<X-25) AND (YE2<Y+55) OR
           (XE2>X+25) AND (YE2<Y+55) THEN
          BEGIN
            PUTPIXEL(XE2,YE2,15);
            PUTPIXEL(XE2-1,YE2,15);
            PUTPIXEL(XE2+1,YE2,15);
            PUTPIXEL(XE2,YE2-1,15);
            PUTPIXEL(XE2,YE2+1,15);
            DELAY(2);
            PUTPIXEL(XE2,YE2,0);
            PUTPIXEL(XE2-1,YE2,0);
            PUTPIXEL(XE2+1,YE2,0);
            PUTPIXEL(XE2,YE2-1,0);
            PUTPIXEL(XE2,YE2+1,0);
          END;
        IF (XE3<X-25) AND (YE3>Y) OR
           (XE3>X+25) AND (YE3>Y) OR
           (XE3<X-25) AND (YE3<Y+55) OR
           (XE3>X+25) AND (YE3<Y+55) THEN
          BEGIN
            PUTPIXEL(XE3,YE3,15);
            PUTPIXEL(XE3-1,YE3,15);
            PUTPIXEL(XE3+1,YE3,15);
            PUTPIXEL(XE3,YE3-1,15);
            PUTPIXEL(XE3,YE3+1,15);
            DELAY(2);
            PUTPIXEL(XE3,YE3,0);
            PUTPIXEL(XE3-1,YE3,0);
            PUTPIXEL(XE3+1,YE3,0);
            PUTPIXEL(XE3,YE3-1,0);
            PUTPIXEL(XE3,YE3+1,0);
          END;
        IF (XE4<X-25) AND (YE4>Y) OR
           (XE4>X+25) AND (YE4>Y) OR
           (XE4<X-25) AND (YE4<Y+55) OR
           (XE4>X+25) AND (YE4<Y+55) THEN
          BEGIN
            PUTPIXEL(XE4,YE4,15);
            PUTPIXEL(XE4-1,YE4,15);
            PUTPIXEL(XE4+1,YE4,15);
            PUTPIXEL(XE4,YE4-1,15);
            PUTPIXEL(XE4,YE4+1,15);
            DELAY(2);
            PUTPIXEL(XE4,YE4,0);
            PUTPIXEL(XE4-1,YE4,0);
            PUTPIXEL(XE4+1,YE4,0);
            PUTPIXEL(XE4,YE4-1,0);
            PUTPIXEL(XE4,YE4+1,0);
          END;
      IF (XT>=XB-30) AND (XT<=XB+30) AND (YT>=YB-15) AND (YT<=YB+55) THEN
        BEGIN
          IF TOCA=TRUE THEN
            SOUND(SOM);
          EXPLODE_BICHO;
          NOSOUND;
          POINTS:=POINTS+100;
          XB:=RANDOM(550)+40;
          YB:=100;
          CORBICHO:=RANDOM(15)+1;
          YT:=10;
        END;
      IF (XB>=X-60) AND (XB<=X+60) AND (YB>=Y-20) AND (YB<=Y+50) THEN
        BEGIN
          NOSOUND;
          V:=TRUE;
          MORTE:=TRUE;
          VIDAS:=VIDAS-1;
          XB:=RANDOM(550)+40;
          YB:=100;
          CORBICHO:=RANDOM(15)+1;
          X1:=320;
          Y1:=400;
          POINTSAUX:=POINTS;
          EXPLODE_NAVE;
          R.AX:=2;
          INTR(51,R);
          CLEARVIEWPORT;
          INICIA;
        END;
      IF (YT>=70) THEN
        BEGIN
          SETCOLOR(15);
          LINE(XT,YT,XT,YT-15);
          BICHO(XB,YB,CORBICHO);
          IF TOCA=TRUE THEN
            SOUND(SOM);
          DELAY(10);
          BICHO(XB,YB,0);
          SETCOLOR(0);
          LINE(XT,YT,XT,YT-15);
          YT:=YT-30;
          SOM:=SOM-20;
        END
      ELSE
        BEGIN
          BICHO(XB,YB,CORBICHO);
          DELAY(10);
          BICHO(XB,YB,0);
          NOSOUND;
        END;
        IF CONT<>40 THEN
          BEGIN
            IF TOCA=TRUE THEN
              BEGIN
                IF CONT=0 THEN
                  BEGIN
                    SETFILLSTYLE(1,0);
                    BAR(250,0,400,30);
                  END;
                SETCOLOR(15);
                SETTEXTSTYLE(1,0,2);
                OUTTEXTXY(270,10,'SOUND ON');
                CONT:=CONT+1;
                SETTEXTSTYLE(11,0,2);
              END
            ELSE
              BEGIN
                NOSOUND;
                IF CONT=0 THEN
                  BEGIN
                    SETFILLSTYLE(1,0);
                    BAR(250,0,400,30);
                  END;
                SETCOLOR(15);
                SETTEXTSTYLE(1,0,2);
                OUTTEXTXY(265,10,'SOUND OFF');
                CONT:=CONT+1;
                SETTEXTSTYLE(11,0,2);
              END;
          END;
          IF CONT=40 THEN
            BEGIN
              SETFILLSTYLE(1,0);
              BAR(250,0,400,30);
            END;
          YE1:=YE1+10;
          YE2:=YE2+10;
          YE3:=YE3+10;
          YE4:=YE4+10;
          STR(POINTS,PONTOS);
          SETFILLSTYLE(1,0);
          BAR(0,0,200,40);
          SETCOLOR(15);
          OUTTEXTXY(0,0,'F1 = AJUDA');
          OUTTEXTXY(0,15,'PONTOS = ');
          OUTTEXTXY(73,15,PONTOS);
          GETTIME(H,M,S,C);
          STR(H,HAUX);
          STR(M,MAUX);
          OUTTEXTXY(0,30,'HORA =');
          OUTTEXTXY(72,30,':');
          OUTTEXTXY(56,30,HAUX);
          OUTTEXTXY(81,30,MAUX);
          CASE NIVEL OF
            1:YB:=YB+5;
            2:YB:=YB+8;
            3:YB:=YB+20;
          END;
        IF YE1=470 THEN
          BEGIN
            YE1:=100;
            XE1:=RANDOM(550)+40;
          END;
        IF YE2=470 THEN
          BEGIN
            YE2:=120;
            XE2:=RANDOM(550)+40;
          END;
        IF YE3=470 THEN
          BEGIN
            YE3:=140;
            XE3:=RANDOM(550)+40;
          END;
        IF YE4=470 THEN
          BEGIN
            YE4:=160;
            XE4:=RANDOM(550)+40;
          END;
        IF YB>=470 THEN
          BEGIN
            CORBICHO:=RANDOM(15)+1;
            YB:=100;
            XB:=RANDOM(550)+40;
            POINTS:=POINTS-50;
          END;
    UNTIL KEYPRESSED;
      CH:=READKEY;
      IF CH=#0 THEN
        CH:=READKEY;
      CASE CH OF
        #75:BEGIN
              IF X>=40 THEN
                BEGIN
                  NAVE(X,Y,0);
                  X:=X-20;
                  NAVE(X,Y,COR);
                 END;
            END;
        #77:BEGIN
              IF X<=600 THEN
                BEGIN
                  NAVE(X,Y,0);
                  X:=X+20;
                  NAVE(X,Y,COR);
                END;
            END;
        #32:ATIRA;
        #27:BEGIN
              NOSOUND;
              CONFIRMA;
            END;
        #112,#80:BEGIN
                   NOSOUND;
                   PAUSE;
                 END;
        #59:AJUDA;
        #63:BEGIN
              IF (TOCA=TRUE) THEN
                BEGIN
                  TOCA:=FALSE;
                  CONT:=0;
                END
              ELSE
                BEGIN
                  TOCA:=TRUE;
                  CONT:=0;
                END;
            END;
       END;{CASE}
  UNTIL Y<=70;
  END;

{===== <<< 21 >>> ==========================================================}
PROCEDURE CHEFE(X,Y,COR:INTEGER);
  BEGIN
    SETCOLOR(COR);
    LINE(X,Y+30,X-10,Y+20);
    LINE(X,Y+30,X+10,Y+20);
    LINE(X-10,Y+20,X-10,Y-30);
    LINE(X+10,Y+20,X+10,Y-30);
    LINE(X-10,Y-30,X+10,Y-30);
    LINE(X-10,Y+15,X-30,Y);
    LINE(X+10,Y+15,X+30,Y);
    LINE(X-10,Y-15,X-30,Y-30);
    LINE(X+10,Y-15,X+30,Y-30);
    LINE(X-30,Y,X-30,Y-30);
    LINE(X+30,Y,X+30,Y-30);
    SETFILLSTYLE(1,COR);
    FLOODFILL(X,Y,COR);
    FLOODFILL(X-20,Y,COR);
    FLOODFILL(X+20,Y,COR);
  END;

{===== <<< 22 >>> ==========================================================}
PROCEDURE NAVE2(X,Y,COR:INTEGER);
  BEGIN
    SETCOLOR(COR);
    LINE(X-5,Y-20,X-5,Y-35);
    LINE(X+5,Y-20,X+5,Y-35);
    LINE(X-10,Y+37,X-10,Y-20);
    LINE(X+10,Y+37,X+10,Y-20);
    LINE(X-10,Y+37,X+10,Y+37);
    LINE(X-10,Y-20,X,Y-40);
    LINE(X+10,Y-20,X,Y-40);
    LINE(X-3,Y,X-3,Y-20);
    LINE(X+3,Y,X+3,Y-20);
    LINE(X-3,Y-20,X,Y-25);
    LINE(X+3,Y-20,X,Y-25);
    LINE(X+3,Y,X-3,Y);
{ASAS}
    LINE(X-10,Y-15,X-30,Y+5);
    LINE(X-10,Y+20,X-30,Y+20);
    LINE(X-30,Y+5,X-30,Y+20);
    LINE(X+10,Y-15,X+30,Y+5);
    LINE(X+10,Y+20,X+30,Y+20);
    LINE(X+30,Y+5,X+30,Y+20);
    LINE(X-25,Y+33,X+25,Y+33);
    LINE(X-25,Y+33,X-10,Y+23);
    LINE(X+25,Y+33,X+10,Y+23);
    SETFILLSTYLE(1,COR);
    FLOODFILL(X,Y+2,COR);
    FLOODFILL(X-20,Y+2,COR);
    FLOODFILL(X+20,Y+2,COR);
    FLOODFILL(X-13,Y+31,COR);
    FLOODFILL(X+13,Y+31,COR);
    FLOODFILL(X,Y+36,COR);
  END;

{===== <<< 23 >>> ==========================================================}
PROCEDURE REDBARON(X,Y:INTEGER);
  BEGIN
    SETCOLOR(15);
    LINE(X-40,Y-12,X+40,Y-12);
    LINE(X-40,Y+12,X+40,Y+12);
    ARC(X-40,Y,90,270,12);
    ARC(X+40,Y,270,90,12);
    LINE(X-15,Y-25,X-15,Y-12);
    LINE(X+15,Y-25,X+15,Y-12);
    LINE(X+15,Y-25,X-15,Y-25);
    LINE(X+10,Y-25,X+10,Y-28);
    LINE(X-10,Y-25,X-10,Y-28);
    LINE(X+10,Y-28,X-10,Y-28);
    LINE(X-1,Y-28,X-1,Y-30);
    LINE(X+1,Y-28,X+1,Y-30);
    RECTANGLE(X-20,Y-32,X+20,Y-31);
    LINE(X-15,Y+12,X-10,Y+50);
    LINE(X+15,Y+12,X+10,Y+50);
    LINE(X+10,Y+50,X-10,Y+50);
    RECTANGLE(X-2,Y+40,X+2,Y+60);
    LINE(X-10,Y+50,X-3,Y+53);
    LINE(X+10,Y+50,X+3,Y+53);
    SETFILLSTYLE(1,15);
    FLOODFILL(X,Y,15);
    FLOODFILL(X,Y-22,15);
    FLOODFILL(X,Y+22,15);
    FLOODFILL(X,Y+48,15);
    FLOODFILL(X,Y+52,15);
    FLOODFILL(X-5,Y+51,15);
    FLOODFILL(X+5,Y+51,15);
    ARC(X-11,Y+42,90,270,6);
    ARC(X+11,Y+42,270,90,6);
    FLOODFILL(X-15,Y+42,15);
    FLOODFILL(X+15,Y+42,15);
   END;

{===== <<< 24 >>> ==========================================================}
PROCEDURE AJUDA;
  BEGIN
    R.AX:=2;
    INTR(51,R);
    NOSOUND;
    CLEARVIEWPORT;
    SETTEXTSTYLE(1,0,4);
    SETCOLOR(15);
    OUTTEXTXY(45,0,'PIG IN THE STARS 2000 - AJUDA');
    SETTEXTSTYLE(1,0,2);
    OUTTEXTXY(250,450,'ESC - RETORNA');
    OUTTEXTXY(80,180,'-> = DIREITA                   <- = ESQUERDA');
    OUTTEXTXY(80,230,'SPACE = PIG LASERSTRATO           P = PAUSE');
    OUTTEXTXY(80,280,'F5 = SOUND OFF / ON');
    SETTEXTSTYLE(11,0,3);
    CH:=READKEY;
    IF (CH=#0) THEN
      CH:=READKEY;
    IF (CH=#59) THEN
      CH:=#0;
    X1:=X;
    Y1:=Y;
    POINTSAUX:=POINTS;
    V:=TRUE;
    MORTE:=FALSE;
    XB1:=XB;
    YB1:=YB;
    R.AX:=2;
    INTR(51,R);
    CLEARVIEWPORT;
    INICIA;
  END;

{===== <<< 25 >>> ==========================================================}
PROCEDURE PAUSE;
  BEGIN
    RANDOMIZE;
    Z:=0;
    XZ:=RANDOM(600)+20;
    YZ:=240;
    CLEARVIEWPORT;
    DIRZ:=RANDOM(4);
    SETTEXTSTYLE(1,0,2);
    SETCOLOR(15);
    OUTTEXTXY(250,30,'GAME PAUSED');
    SETTEXTSTYLE(11,0,3);
    REPEAT
      CORZ:=RANDOM(16);
      SETFILLSTYLE(1,CORZ);
      SETCOLOR(CORZ);
      CIRCLE(XZ,YZ,20);
      FLOODFILL(XZ,YZ,CORZ);
      SETCOLOR(0);
      CIRCLE(XZ,YZ,20);
      FLOODFILL(XZ,YZ,0);
      Z:=Z+1;
      CASE DIRZ OF
        0:BEGIN
            IF (XZ<=614)THEN
              BEGIN
                XZ:=XZ+1;
                YZ:=YZ+1;
              END
            ELSE
              DIRZ:=3;
              IF (YZ<= 454) THEN
                BEGIN
                  XZ:=XZ+1;
                  YZ:=YZ+1;
                END
              ELSE
                DIRZ:=1;
          END;
        1:BEGIN
            IF (XZ<=614) THEN
              BEGIN
                XZ:=XZ+1;
                YZ:=YZ-1;
              END
            ELSE
              DIRZ:=2;
              IF (YZ>= 96) THEN
                BEGIN
                  XZ:=XZ+1;
                  YZ:=YZ-1;
                END
              ELSE
                DIRZ:=0;
          END;
        2:BEGIN
            IF (XZ>=26) THEN
              BEGIN
                XZ:=XZ-1;
                YZ:=YZ-1;
              END
            ELSE
              DIRZ:=1;
              IF (YZ>= 96) THEN
                BEGIN
                  XZ:=XZ-1;
                  YZ:=YZ-1;
                END
              ELSE
                DIRZ:=3;
              END;
        3:BEGIN
            IF (XZ>=26) THEN
              BEGIN
                XZ:=XZ-1;
                YZ:=YZ+1;
              END
            ELSE
              DIRZ:=0;
              IF (YZ<= 454) THEN
                BEGIN
                  XZ:=XZ-1;
                  YZ:=YZ+1;
                END
              ELSE
                DIRZ:=2;
          END;
      END;{CASE}
    UNTIL KEYPRESSED OR (Z=8000);
    IF Z=8000 THEN
      PAUSE;
    CH:=READKEY;
    IF (CH=#112) OR (CH=#80) THEN
      CH:=#0;
    X1:=X;
    Y1:=Y;
    Z:=0;
    POINTSAUX:=POINTS;
    V:=TRUE;
    XB1:=XB;
    YB1:=YB;
    R.AX:=2;
    INTR(51,R);
    CLEARVIEWPORT;
    INICIA;
  END;

{===== <<< 26 >>> ==========================================================}
PROCEDURE CONFIRMA_EXIT;
  BEGIN
    R.AX:=2;
    INTR(51,R);
    CLEARVIEWPORT;
    FUNDO2(320,240);
    BOTAO_CIMA(250,250);
    BOTAO_CIMA(390,250);
    SETCOLOR(0);
    OUTTEXTXY(178,215,'ENCERRAR " PIG IN THE STARS 2000 " ?');
    OUTTEXTXY(238,247,'SIM');
    OUTTEXTXY(378,247,'NAO');
    R.AX:=1;
    INTR(51,R);
    OK1:=FALSE;
    OK2:=FALSE;
  REPEAT
    R.AX:=3;
    INTR(51,R);
{OPCAO 1}
    IF (R.BX=1) AND (R.CX>=200) AND (R.CX<=300) AND (R.DX>=240) AND (R.DX<=260) THEN
      BEGIN
        R.AX:=2;
        INTR(51,R);
        OK1:=TRUE;
        BOTAO_BAIXO(250,250);
        SETCOLOR(0);
        OUTTEXTXY(238,247,'SIM');
        R.AX:=1;
        INTR(51,R);
        REPEAT
          R.AX:=3;
          INTR(51,R);
          IF (R.BX=1) AND (R.CX<200) AND (OK1=TRUE) OR
             (R.BX=1) AND (R.CX>300) AND (OK1=TRUE) OR
             (R.BX=1) AND (R.DX<240) AND (OK1=TRUE) OR
             (R.BX=1) AND (R.DX>260) AND (OK1=TRUE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK1:=FALSE;
              BOTAO_CIMA(250,250);
              SETCOLOR(0);
              OUTTEXTXY(238,247,'SIM');
              R.AX:=1;
              INTR(51,R);
            END;
          IF (R.BX=1) AND (R.CX>=200) AND (R.CX<=300) AND (R.DX>=240) AND (R.DX<=260) AND (OK1=FALSE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK1:=TRUE;
              BOTAO_BAIXO(250,250);
              SETCOLOR(0);
              OUTTEXTXY(238,247,'SIM');
              R.AX:=1;
              INTR(51,R);
            END;
        UNTIL (R.BX=0);
      END;
{OPCAO 2}
    IF (R.BX=1) AND (R.CX>=340) AND (R.CX<=440) AND (R.DX>=240) AND (R.DX<=260) THEN
      BEGIN
        R.AX:=2;
        INTR(51,R);
        OK2:=TRUE;
        BOTAO_BAIXO(390,250);
        SETCOLOR(0);
        OUTTEXTXY(378,247,'NAO');
        R.AX:=1;
        INTR(51,R);
        REPEAT
          R.AX:=3;
          INTR(51,R);
          IF (R.BX=1) AND (R.CX<340) AND (OK2=TRUE) OR
             (R.BX=1) AND (R.CX>440) AND (OK2=TRUE) OR
             (R.BX=1) AND (R.DX<240) AND (OK2=TRUE) OR
             (R.BX=1) AND (R.DX>260) AND (OK2=TRUE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK2:=FALSE;
              BOTAO_CIMA(390,250);
              SETCOLOR(0);
              OUTTEXTXY(378,247,'NAO');
              R.AX:=1;
              INTR(51,R);
            END;
          IF (R.BX=1) AND (R.CX>=340) AND (R.CX<=440) AND (R.DX>=240) AND (R.DX<=260) AND (OK2=FALSE) THEN
            BEGIN
              R.AX:=2;
              INTR(51,R);
              OK2:=TRUE;
              BOTAO_BAIXO(390,250);
              SETCOLOR(0);
              OUTTEXTXY(378,247,'NAO');
              R.AX:=1;
              INTR(51,R);
            END;
        UNTIL (R.BX=0);
      END;
  UNTIL (OK1=TRUE) OR (OK2=TRUE);
  IF OK1=TRUE THEN
    SAIR;
  IF OK2=TRUE THEN
    BEGIN
      R.AX:=2;
      INTR(51,R);
      CLEARVIEWPORT;
      TELAPRIN;
      R.AX:=1;
      INTR(51,R);
      MENUPRINCIPAL;
    IF OK1=TRUE THEN
      INICIA;
    IF OK2=TRUE THEN
      OPTIONS;
    IF OK3=TRUE THEN
      CONFIRMA_EXIT;
    END;
  END;

BEGIN
  MODO:=LASTMODE;
  A:=DETECT;
  INITGRAPH(A,B,'C:\PIG\THIAGO');
  R.AX:=0;
  INTR(51,R);
  Z:=0;
  RANDOMIZE;
  CORBICHO:=RANDOM(15)+1;
  COR:=15;
  CONT:=40;
  OK1:=FALSE;
  OK2:=FALSE;
  OK3:=FALSE;
  MORTE:=TRUE;
  V:=TRUE;
  TOCA:=TRUE;
  OK:=2;
  NIVEL:=2;
  X1:=320;
  Y1:=400;
  XB1:=RANDOM(550)+40;
  YB1:=100;
  VIDAS:=5;
  POINTSAUX:=0;
  R.AX:=1;
  INTR(51,R);
END.{UNIT}