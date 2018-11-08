{PRODUZIDO E IDEALIZADO POR THIAGO DE G‡Z FERREIRA (562 LINHAS)
2ßP.D. MANH«, COLêGIO CRISTO REDENTOR}

PROGRAM CACA_NIQUEL; {VERS«O DEMO}
USES DOS,CRT,GRAPH;

VAR
  A,B,X,Y,CONT,CONT2,AUX,AUX2,DEMO:INTEGER;
  R:REGISTERS;
  SAIR:BOOLEAN;
  JOGO:ARRAY [1..3] OF INTEGER;

{A,B            = VARIµVEIS USADAS PARA INICIALIZAR O MODO GRµFICO.
 X,Y            = VARIµVEIS USADAS PARA DESENHAR OS S÷MBOLOS NA TELA.
 CONT,CONT2,AUX = VARIµVEIS USADAS NA ESCOLHA ALEAT‡RIA DOS S÷MBOLOS.
 AUX2           = VARIµVEL USADA PARA GARANTIR QUE AS MENSAGENS APAREÄAM S‡
 UMA VEZ.
 DEMO           = VARIµVEL USADA PARA O USUµRIO JOGAR APENAS 5 VEZES.
 R              = VARIµVEL USADA PARA INICIALIZAR O MOUSE.
 SAIR           = VARIµVEL USADA PARA SAIR DO PROGRAMA(TRUE=SAI/
 FALSE=CONTINUA).
 JOGO           = VETOR USADO PARA GUARDAR OS RESULTADOS DAS ESCOLHAS
 ALEAT‡RIAS DOS S÷MBOLOS.}

PROCEDURE PROPAGANDA;
  BEGIN
    CLRSCR;
    TEXTCOLOR(15);
    GOTOXY(20,10);
    WRITE('P'); DELAY(100);
    WRITE('R'); DELAY(100);
    WRITE('O'); DELAY(100);
    WRITE('D'); DELAY(100);
    WRITE('U'); DELAY(100);
    WRITE('Z'); DELAY(100);
    WRITE('I'); DELAY(100);
    WRITE('D'); DELAY(100);
    WRITE('O'); DELAY(100);
    WRITE(' '); DELAY(100);
    WRITE('E'); DELAY(100);
    WRITE(' '); DELAY(100);
    WRITE('I'); DELAY(100);
    WRITE('D'); DELAY(100);
    WRITE('E'); DELAY(100);
    WRITE('A'); DELAY(100);
    WRITE('L'); DELAY(100);
    WRITE('I'); DELAY(100);
    WRITE('Z'); DELAY(100);
    WRITE('A'); DELAY(100);
    WRITE('D'); DELAY(100);
    WRITE('O'); DELAY(100);
    WRITE(' '); DELAY(100);
    WRITE('P'); DELAY(100);
    WRITE('O'); DELAY(100);
    WRITE('R'); DELAY(100);
    WRITE(' '); DELAY(100);
    WRITE('T'); DELAY(100);
    WRITE('H'); DELAY(100);
    WRITE('I'); DELAY(100);
    WRITE('A'); DELAY(100);
    WRITE('G'); DELAY(100);
    WRITE('O'); DELAY(100);
    WRITE(' '); DELAY(100);
    WRITE('F'); DELAY(100);
    WRITE('E'); DELAY(100);
    WRITE('R'); DELAY(100);
    WRITE('R'); DELAY(100);
    WRITE('E'); DELAY(100);
    WRITE('I'); DELAY(100);
    WRITE('R'); DELAY(100);
    WRITE('A'); DELAY(400);
    GOTOXY(35,12);
    WRITE('V'); DELAY(100);
    WRITE('E'); DELAY(100);
    WRITE('R'); DELAY(100);
    WRITE('S'); DELAY(100);
    WRITE('«'); DELAY(100);
    WRITE('O'); DELAY(100);
    WRITE(' '); DELAY(100);
    WRITE('D'); DELAY(100);
    WRITE('E'); DELAY(100);
    WRITE('M'); DELAY(100);
    WRITE('O'); DELAY(1000);
  END;

PROCEDURE BOTAO_SAIR_CIMA;
  BEGIN
    SETFILLSTYLE(1,7);
    BAR(620,0,639,20);
    SETCOLOR(0);
    LINE(622,3,636,17);
    LINE(622,17,636,3);
    SETCOLOR(8);
    LINE(620,20,639,20);
    LINE(639,0,639,19);
    SETCOLOR(15);
    LINE(620,20,620,0);
    LINE(620,0,639,0);
  END;

PROCEDURE BOTAO_SAIR_BAIXO;
  BEGIN
    R.AX:=2;
    INTR(51,R);
    SETFILLSTYLE(1,8);
    BAR(620,0,639,20);
    SETCOLOR(0);
    LINE(622,3,636,17);
    LINE(622,17,636,3);
    SETCOLOR(15);
    LINE(620,20,639,20);
    LINE(639,0,639,19);
    SETCOLOR(0);
    LINE(620,20,620,0);
    LINE(620,0,639,0);
  END;

PROCEDURE TELA;
  BEGIN
{MµQUINA}
    SETCOLOR(15);
    RECTANGLE(150,50,490,477);
    RECTANGLE(148,48,492,479);
    RECTANGLE(200,100,440,200);
    RECTANGLE(198,98,442,202);
{ALAVANCA}
    LINE(492,300,520,300);
    LINE(492,320,540,320);
    LINE(520,300,520,200);
    LINE(540,320,540,200);
    CIRCLE(530,182,20);
{PINTURAS}
    SETFILLSTYLE(1,1);
    FLOODFILL(151,151,15);
    SETFILLSTYLE(5,15);
    FLOODFILL(521,300,15);
    SETFILLSTYLE(9,4);
    FLOODFILL(530,182,15);
{BURACO DAS FICHAS}
    SETCOLOR(15);
    RECTANGLE(260,350,380,400);
    SETCOLOR(15);
    LINE(260,400,250,420);
    LINE(380,400,390,420);
    LINE(250,420,390,420);
    LINE(260,350,250,420);
    LINE(380,350,390,420);
    SETFILLSTYLE(1,15);
    FLOODFILL(265,410,15);
    FLOODFILL(254,400,15);
    FLOODFILL(384,400,15);
    SETFILLSTYLE(1,0);
    FLOODFILL(261,351,15);
    SETCOLOR(0);
    LINE(260,400,250,420);
    LINE(380,400,390,420);
{BURACO PARA POR AS FICHAS}
    SETCOLOR(15);
    RECTANGLE(450,220,456,240);
    SETTEXTSTYLE(1,0,3);
    SETCOLOR(15);
    OUTTEXTXY(0,7,'VERSAO DEMO');
    OUTTEXTXY(57,0,'~');
    BOTAO_SAIR_CIMA;
    SETTEXTSTYLE(11,0,4);
  END;

PROCEDURE BOLA(X,Y:INTEGER);
  BEGIN
   SETFILLSTYLE(1,15);
   BAR(X-35,Y-35,X+35,Y+35);
   SETCOLOR(0);
   CIRCLE(X,Y,20);
   SETFILLSTYLE(1,4);
   FLOODFILL(X,Y,0);
  END;

PROCEDURE OURO(X,Y:INTEGER);
  BEGIN
   SETFILLSTYLE(1,15);
   BAR(X-35,Y-35,X+35,Y+35);
   SETCOLOR(0);
   LINE(X,Y-20,X-20,Y);
   LINE(X,Y-20,X+20,Y);
   LINE(X-20,Y,X,Y+20);
   LINE(X+20,Y,X,Y+20);
   SETFILLSTYLE(1,6);
   FLOODFILL(X,Y,0);
  END;

PROCEDURE SETE(X,Y:INTEGER);
  BEGIN
   SETFILLSTYLE(1,15);
   BAR(X-35,Y-35,X+35,Y+35);
   SETCOLOR(0);
   SETTEXTSTYLE(1,0,7);
   OUTTEXTXY(X-15,Y-40,'7');
   SETTEXTSTYLE(11,0,3);
  END;

PROCEDURE QUADRADO(X,Y:INTEGER);
  BEGIN
   SETFILLSTYLE(1,15);
   BAR(X-35,Y-35,X+35,Y+35);
   SETCOLOR(0);
   RECTANGLE(X-20,Y-20,X+20,Y+20);
   SETFILLSTYLE(1,9);
   FLOODFILL(X,Y,0);
  END;

PROCEDURE BARRA(X,Y:INTEGER);
  BEGIN
   SETFILLSTYLE(1,15);
   BAR(X-35,Y-35,X+35,Y+35);
   SETCOLOR(0);
   RECTANGLE(X-20,Y-20,X+20,Y+20);
   SETFILLSTYLE(1,0);
   FLOODFILL(X,Y,0);
   SETCOLOR(15);
   OUTTEXTXY(X-11,Y-3,'BAR');
  END;

PROCEDURE LUA(X,Y:INTEGER);
  BEGIN
   SETFILLSTYLE(1,15);
   BAR(X-35,Y-35,X+35,Y+35);
   SETCOLOR(0);
   ARC(X+10,Y,90,270,20);
   ARC(X+45,Y,150,210,40);
   SETFILLSTYLE(1,2);
   FLOODFILL(X,Y,0);
  END;

PROCEDURE TRIANGULO(X,Y:INTEGER);
  BEGIN
   SETFILLSTYLE(1,15);
   BAR(X-35,Y-35,X+35,Y+35);
   SETCOLOR(0);
   LINE(X,Y-20,X-20,Y+20);
   LINE(X,Y-20,X+20,Y+20);
   LINE(X-20,Y+20,X+20,Y+20);
   SETFILLSTYLE(1,14);
   FLOODFILL(X,Y,0);
  END;

PROCEDURE JOGA;
  BEGIN
    RANDOMIZE;
    FOR CONT:=1 TO 3 DO
      BEGIN
        IF CONT<>1 THEN
          BEGIN
            SOUND(900);
            DELAY(50);
            NOSOUND;
          END;
        FOR CONT2:=1 TO 20 DO
          BEGIN
            SOUND(800);
            DELAY(10);
            NOSOUND;
            DELAY(100);
            AUX:=RANDOM(8);
            IF (CONT=1) THEN
              BEGIN
                CASE AUX OF
                  1:BEGIN
                      BOLA(240,150);
                      JOGO[1]:=1;
                    END;
                  2:BEGIN
                      LUA(240,150);
                      JOGO[1]:=2;
                    END;
                  3:BEGIN
                      QUADRADO(240,150);
                      JOGO[1]:=3;
                    END;
                  4:BEGIN
                      TRIANGULO(240,150);
                      JOGO[1]:=4;
                    END;
                  5:BEGIN
                      BARRA(240,150);
                      JOGO[1]:=5;
                    END;
                  6:BEGIN
                      OURO(240,150);
                      JOGO[1]:=6;
                    END;
                  7:BEGIN
                      SETE(240,150);
                      JOGO[1]:=7;
                    END;
                END;
              END;
            AUX:=RANDOM(8);
            IF (CONT=1) OR (CONT=2) THEN
              BEGIN
                CASE AUX OF
                  1:BEGIN
                      BOLA(320,150);
                      JOGO[2]:=1;
                    END;
                  2:BEGIN
                      LUA(320,150);
                      JOGO[2]:=2;
                    END;
                  3:BEGIN
                      QUADRADO(320,150);
                      JOGO[2]:=3;
                    END;
                  4:BEGIN
                      TRIANGULO(320,150);
                      JOGO[2]:=4;
                    END;
                  5:BEGIN
                      BARRA(320,150);
                      JOGO[2]:=5;
                    END;
                  6:BEGIN
                      OURO(320,150);
                      JOGO[2]:=6;
                    END;
                  7:BEGIN
                      SETE(320,150);
                      JOGO[2]:=7;
                    END;
                END;
              END;
              AUX:=RANDOM(8);
              IF (CONT=1) OR (CONT=2) OR (CONT=3) THEN
                BEGIN
                CASE AUX OF
                  1:BEGIN
                      BOLA(400,150);
                      JOGO[3]:=1;
                    END;
                  2:BEGIN
                      LUA(400,150);
                      JOGO[3]:=2;
                    END;
                  3:BEGIN
                      QUADRADO(400,150);
                      JOGO[3]:=3;
                    END;
                  4:BEGIN
                      TRIANGULO(400,150);
                      JOGO[3]:=4;
                    END;
                  5:BEGIN
                      BARRA(400,150);
                      JOGO[3]:=5;
                    END;
                  6:BEGIN
                      OURO(400,150);
                      JOGO[3]:=6;
                    END;
                  7:BEGIN
                      SETE(400,150);
                      JOGO[3]:=7;
                    END;
                END;
                END;
          END;{FOR}
      END;{FOR}
    SOUND(900);
    DELAY(50);
    NOSOUND;
    IF (JOGO[1]=JOGO[2]) AND (JOGO[2]=JOGO[3]) AND (AUX2=1) THEN
      BEGIN
        DELAY(500);
        CLEARVIEWPORT;
        SETCOLOR(15);
        SETTEXTSTYLE(1,0,7);
        OUTTEXTXY(170,100,'PARABENS');
        OUTTEXTXY(382,80,CHR(39));
        DELAY(500);
        OUTTEXTXY(70,280,'VOCE GANHOU !!!');
        OUTTEXTXY(183,260,CHR(94));
        AUX2:=2;
        REPEAT
          R.AX:=3;
          INTR(51,R);
        UNTIL(R.BX<>0);
        CLEARVIEWPORT;
        TELA;
      END;
    IF (JOGO[1]=7) AND (JOGO[2]=7) AND (JOGO[3]=5) AND (AUX2=1) OR
       (JOGO[1]=7) AND (JOGO[2]=5) AND (JOGO[3]=7) AND (AUX2=1) OR
       (JOGO[1]=7) AND (JOGO[2]=5) AND (JOGO[3]=5) AND (AUX2=1) OR
       (JOGO[1]=5) AND (JOGO[2]=7) AND (JOGO[3]=7) AND (AUX2=1) OR
       (JOGO[1]=5) AND (JOGO[2]=7) AND (JOGO[3]=5) AND (AUX2=1) OR
       (JOGO[1]=5) AND (JOGO[2]=5) AND (JOGO[3]=7) AND (AUX2=1) THEN
      BEGIN
        DELAY(500);
        CLEARVIEWPORT;
        SETCOLOR(15);
        SETTEXTSTYLE(1,0,7);
        OUTTEXTXY(170,100,'PARABENS');
        OUTTEXTXY(382,80,CHR(39));
        DELAY(500);
        OUTTEXTXY(40,280,'JOGUE + 1 VEZ !!!');
        AUX2:=2;
        REPEAT
          R.AX:=3;
          INTR(51,R);
        UNTIL(R.BX<>0);
        CLEARVIEWPORT;
        TELA;
      END;
    IF (JOGO[1]=JOGO[2]) AND (JOGO[2]<>JOGO[3]) AND (AUX2=1) OR
       (JOGO[1]<>JOGO[2]) AND (JOGO[2]=JOGO[3]) AND (AUX2=1) OR
       (JOGO[1]=JOGO[3]) AND (JOGO[2]<>JOGO[3]) AND (AUX2=1) THEN
      BEGIN
        DELAY(500);
        CLEARVIEWPORT;
        SETCOLOR(15);
        SETTEXTSTYLE(1,0,7);
        OUTTEXTXY(80,100,'QUASE HEIN ?!?');
        DELAY(500);
        OUTTEXTXY(40,280,'TENTE + 1 VEZ !!!');
        AUX2:=2;
        REPEAT
          R.AX:=3;
          INTR(51,R);
        UNTIL(R.BX<>0);
        CLEARVIEWPORT;
        TELA;
      END;
    IF (JOGO[1]<>JOGO[2]) AND (JOGO[2]<>JOGO[3]) AND (JOGO[1]<>JOGO[3])
       AND (AUX2=1) THEN
      BEGIN
        DELAY(500);
        CLEARVIEWPORT;
        SETCOLOR(15);
        SETTEXTSTYLE(1,0,7);
        OUTTEXTXY(60,100,'TA MAL HEIN ?!?');
        OUTTEXTXY(115,80,CHR(39));
        DELAY(500);
        OUTTEXTXY(40,280,'TENTE + 1 VEZ !!!');
        AUX2:=2;
        REPEAT
          R.AX:=3;
          INTR(51,R);
        UNTIL(R.BX<>0);
        CLEARVIEWPORT;
        TELA;
      END;
  END;

PROCEDURE MEXEALAVANCA;
  VAR
    X:INTEGER;
  BEGIN
    X:=200;
  REPEAT
    SETFILLSTYLE(1,0);
    BAR(493,100,640,400);
{ALAVANCA}
    SETCOLOR(15);
    LINE(492,300,520,300);
    LINE(492,320,540,320);
    LINE(520,300,520,X);
    LINE(540,320,540,X);
    CIRCLE(530,X-18,20);
{PINTURA}
    SETFILLSTYLE(5,15);
    FLOODFILL(493,310,15);
    SETFILLSTYLE(9,4);
    FLOODFILL(530,X-18,15);
    X:=X+10;
    DELAY(10);
  UNTIL(X>=310);
  X:=340;
  REPEAT
    SETFILLSTYLE(1,0);
    BAR(493,100,640,480);
{ALAVANCA}
    LINE(492,300,540,300);
    LINE(492,320,520,320);
    LINE(540,300,540,X);
    LINE(520,320,520,X);
    CIRCLE(530,X+18,20);
{PINTURA}
    SETFILLSTYLE(4,15);
    FLOODFILL(493,310,15);
    SETFILLSTYLE(9,4);
    FLOODFILL(530,X+18,15);
    X:=X+10;
    DELAY(10);
  UNTIL(X>=420);
  REPEAT
    SETFILLSTYLE(1,0);
    BAR(493,100,640,480);
{ALAVANCA}
    LINE(492,300,540,300);
    LINE(492,320,520,320);
    LINE(540,300,540,X);
    LINE(520,320,520,X);
    CIRCLE(530,X+18,20);
{PINTURA}
    SETFILLSTYLE(4,15);
    FLOODFILL(493,310,15);
    SETFILLSTYLE(9,4);
    FLOODFILL(530,X+18,15);
    X:=X-10;
    DELAY(10);
  UNTIL(X<=310);
  REPEAT
    SETFILLSTYLE(1,0);
    BAR(493,100,640,400);
{ALAVANCA}
    LINE(492,300,520,300);
    LINE(492,320,540,320);
    LINE(520,300,520,X);
    LINE(540,320,540,X);
    CIRCLE(530,X-18,20);
{PINTURA}
    SETFILLSTYLE(5,15);
    FLOODFILL(493,310,15);
    SETFILLSTYLE(9,4);
    FLOODFILL(530,X-18,15);
    X:=X-10;
    DELAY(10);
  UNTIL(X<=198);
  END;

BEGIN
  A:=DETECT;

  INITGRAPH(A,B,'C:\PIG\THIAGO');
  SAIR:=FALSE;
  DEMO:=0;
  AUX2:=1;
  TELA;
  R.AX:=1;
  INTR(51,R);
  REPEAT
    R.AX:=3;
    INTR(51,R);
    IF (R.BX=1) AND (R.CX>=510) AND (R.CX<=550) AND (R.DX>=162) AND (R.DX<=202) THEN
      BEGIN
        AUX2:=1;
        R.AX:=2;
        INTR(51,R);
        MEXEALAVANCA;
        JOGA;
        R.AX:=1;
        INTR(51,R);
        DEMO:=DEMO+1;
      END;
    IF (R.BX=1) AND (R.CX>=620) AND (R.DX<=20) THEN
      BEGIN
        BOTAO_SAIR_BAIXO;
        DELAY(200);
        SAIR:=TRUE;
      END;
  UNTIL (SAIR=TRUE) OR (DEMO=5);
  CLEARVIEWPORT;
  CLOSEGRAPH;
  PROPAGANDA;
END.