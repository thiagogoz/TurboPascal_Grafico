{PRODUZIDO E IDEALIZADO POR THIAGO DE G‡Z FERREIRA (612 LINHAS)
2ßP.D. MANH«, COLêGIO CRISTO REDENTOR}

PROGRAM JOGO_DA_VELHA;
USES DOS,CRT,GRAPH;

VAR
  A,B,L,C,P1,P2,AUX:INTEGER;
  R:REGISTERS;
  X:ARRAY[1..3,1..3] OF INTEGER;
  P,SAIR:BOOLEAN;
  S1,S2:STRING;

{A,B   = VARIµVEIS USADAS PARA INICIALIZAR O MODO GRµFICO.
 L,C   = VARIµVEIS USADAS PARA INICIALIZAR A MATRIZ "X".
 P1,P2 = VARIµVEIS USADAS PARA CONTAR O NÈMERO DE VIT‡RIAS DOS DOIS JOGADORES.
 AUX   = VARIµVEL AUXILIAR, USADA NA ESCOLHA ALEAT‡RIA DE UM JOGADOR PARA
 COMEÄAR UMA NOVA PARTIDA QUANDO UM JOGO EMPATA.
 R     = VARIµVEL DO MOUSE.
 X     = MATRIZ ONDE FICA ARMAZENADO A JOGADA QUE UM DOS JOGADORES REALIZOU.
 P     = VARIµVEL USADA PARA SABER QUAL JOGADOR DEVE JOGAR(FALSE=JOGADOR1/
 TRUE=JOGADOR2).
 S1,S2 = VARIµVEIS AUXILIARES, USADAS PARA ARMAZENAR AS VARIµVEIS P1,P2
 CONVERTIDAS PARA STRING PELO COMANDO "STR", PARA QUE POSSAM SER ESCRITAS NA
 TELA COM O COMANDO "OUTTEXTXY".}

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
    SETCOLOR(15);
    SETFILLSTYLE(1,15);
    RECTANGLE(160,180,480,190);
    RECTANGLE(160,290,480,300);
    FLOODFILL(161,181,15);
    FLOODFILL(161,291,15);
    RECTANGLE(260,80,270,400);
    RECTANGLE(370,80,380,400);
    FLOODFILL(261,81,15);
    FLOODFILL(261,191,15);
    FLOODFILL(261,311,15);
    FLOODFILL(371,91,15);
    FLOODFILL(371,191,15);
    FLOODFILL(371,311,15);
    SETTEXTSTYLE(7,0,2);
    OUTTEXTXY(470,450,'2ß P.D. MANHA');
    OUTTEXTXY(622,445,'~');
    SETTEXTSTYLE(1,0,4);
    STR(P1,S1);
    STR(P2,S2);
    OUTTEXTXY(0,0,'X = ');
    OUTTEXTXY(70,0,S1);
    OUTTEXTXY(0,440,'O = ');
    OUTTEXTXY(70,440,S2);
    BOTAO_SAIR_CIMA;
    SETCOLOR(15);
    SETTEXTSTYLE(7,0,4);
  END;

BEGIN
  A:=DETECT;
  INITGRAPH(A,B,'C:\PIG\THIAGO');
{INICIALIZAÄ«O DAS VARIµVEIS}
  FOR L:=1 TO 3 DO
    FOR C:=1 TO 3 DO
        X[L,C]:=0;
  P:=FALSE;
  SAIR:=FALSE;
  P1:=0;
  P2:=0;
{MONTA TELA}
  CLEARVIEWPORT;
  TELA;
  SETCOLOR(15);
  OUTTEXTXY(380,0,'X');
  R.AX:=1;
  INTR(51,R);
  REPEAT
    R.AX:=3;
    INTR(51,R);
    IF (P=FALSE) THEN
      OUTTEXTXY(200,0,'JOGADOR = ')
    ELSE
      OUTTEXTXY(200,0,'JOGADOR = ');

{--- <<<  1,1  >>> ----------------------------------------------------------}
    IF (R.BX=1) AND (R.CX>160) AND (R.CX<260) AND (R.DX>80) AND (R.DX<180) AND (X[1,1]=0) THEN
      IF (P=FALSE) THEN
        BEGIN
          R.AX:=2;
          INTR(51,R);
          LINE(170,90,250,170);
          LINE(170,170,250,90);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'O');
          R.AX:=1;
          INTR(51,R);
          REPEAT
            R.AX:=3;
            INTR(51,R);
          UNTIL(R.BX=0);
          P:=TRUE;
          X[1,1]:=1;
        END
      ELSE
        BEGIN
          R.AX:=2;
          INTR(51,R);
          CIRCLE(210,130,40);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'X');
          R.AX:=1;
          INTR(51,R);
          REPEAT
            R.AX:=3;
            INTR(51,R);
          UNTIL(R.BX=0);
          P:=FALSE;
          X[1,1]:=2;
        END;
{--- <<<  1,2  >>> ----------------------------------------------------------}
    IF (R.BX=1) AND (R.CX>270) AND (R.CX<370) AND (R.DX>80) AND (R.DX<180) AND (X[1,2]=0) THEN
      IF (P=FALSE) THEN
        BEGIN
          R.AX:=2;
          INTR(51,R);
          LINE(280,90,360,170);
          LINE(280,170,360,90);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'O');
          R.AX:=1;
          INTR(51,R);
          REPEAT
            R.AX:=3;
            INTR(51,R);
          UNTIL(R.BX=0);
          P:=TRUE;
          X[1,2]:=1;
        END
      ELSE
        BEGIN
          R.AX:=2;
          INTR(51,R);
          CIRCLE(320,130,40);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'X');
          R.AX:=1;
          INTR(51,R);
          REPEAT
            R.AX:=3;
            INTR(51,R);
          UNTIL(R.BX=0);
          P:=FALSE;
          X[1,2]:=2;
        END;
{--- <<<  1,3  >>> ----------------------------------------------------------}
    IF (R.BX=1) AND (R.CX>380) AND (R.CX<480) AND (R.DX>80) AND (R.DX<180) AND (X[1,3]=0) THEN
      IF (P=FALSE) THEN
        BEGIN
          R.AX:=2;
          INTR(51,R);
          LINE(390,90,470,170);
          LINE(390,170,470,90);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'O');
          R.AX:=1;
          INTR(51,R);
          REPEAT
            R.AX:=3;
            INTR(51,R);
          UNTIL(R.BX=0);
          P:=TRUE;
          X[1,3]:=1;
        END
      ELSE
        BEGIN
          R.AX:=2;
          INTR(51,R);
          CIRCLE(430,130,40);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'X');
          R.AX:=1;
          INTR(51,R);
          REPEAT
            R.AX:=3;
            INTR(51,R);
          UNTIL(R.BX=0);
          P:=FALSE;
          X[1,3]:=2;
        END;
{--- <<<  2,1  >>> ----------------------------------------------------------}
    IF (R.BX=1) AND (R.CX>160) AND (R.CX<260) AND (R.DX>190) AND (R.DX<290) AND (X[2,1]=0) THEN
      IF (P=FALSE) THEN
        BEGIN
          R.AX:=2;
          INTR(51,R);
          LINE(170,200,250,280);
          LINE(170,280,250,200);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'O');
          R.AX:=1;
          INTR(51,R);
          REPEAT
            R.AX:=3;
            INTR(51,R);
          UNTIL(R.BX=0);
          P:=TRUE;
          X[2,1]:=1;
        END
      ELSE
        BEGIN
          R.AX:=2;
          INTR(51,R);
          CIRCLE(210,240,40);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'X');
          R.AX:=1;
          INTR(51,R);
          REPEAT
            R.AX:=3;
            INTR(51,R);
          UNTIL(R.BX=0);
          P:=FALSE;
          X[2,1]:=2;
        END;
{--- <<<  2,2  >>> ----------------------------------------------------------}
    IF (R.BX=1) AND (R.CX>270) AND (R.CX<370) AND (R.DX>190) AND (R.DX<290) AND (X[2,2]=0) THEN
      IF (P=FALSE) THEN
        BEGIN
          R.AX:=2;
          INTR(51,R);
          LINE(280,200,360,280);
          LINE(280,280,360,200);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'O');
          R.AX:=1;
          INTR(51,R);
          REPEAT
            R.AX:=3;
            INTR(51,R);
          UNTIL(R.BX=0);
          P:=TRUE;
          X[2,2]:=1;
        END
      ELSE
        BEGIN
          R.AX:=2;
          INTR(51,R);
          CIRCLE(320,240,40);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'X');
          R.AX:=1;
          INTR(51,R);
          REPEAT
            R.AX:=3;
            INTR(51,R);
          UNTIL(R.BX=0);
          P:=FALSE;
          X[2,2]:=2;
        END;
{--- <<<  2,3  >>> ----------------------------------------------------------}
    IF (R.BX=1) AND (R.CX>380) AND (R.CX<480) AND (R.DX>190) AND (R.DX<290) AND (X[2,3]=0) THEN
      IF (P=FALSE) THEN
        BEGIN
          R.AX:=2;
          INTR(51,R);
          LINE(390,200,470,280);
          LINE(390,280,470,200);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'O');
          R.AX:=1;
          INTR(51,R);
          REPEAT
            R.AX:=3;
            INTR(51,R);
          UNTIL(R.BX=0);
          P:=TRUE;
          X[2,3]:=1;
        END
      ELSE
        BEGIN
          R.AX:=2;
          INTR(51,R);
          CIRCLE(430,240,40);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'X');
          R.AX:=1;
          INTR(51,R);
          REPEAT
            R.AX:=3;
            INTR(51,R);
          UNTIL(R.BX=0);
          P:=FALSE;
          X[2,3]:=2;
        END;
{--- <<<  3,1  >>> ----------------------------------------------------------}
    IF (R.BX=1) AND (R.CX>160) AND (R.CX<260) AND (R.DX>300) AND (R.DX<400) AND (X[3,1]=0) THEN
      IF (P=FALSE) THEN
        BEGIN
          R.AX:=2;
          INTR(51,R);
          LINE(170,310,250,390);
          LINE(170,390,250,310);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'O');
          R.AX:=1;
          INTR(51,R);
          REPEAT
            R.AX:=3;
            INTR(51,R);
          UNTIL(R.BX=0);
          P:=TRUE;
          X[3,1]:=1;
        END
      ELSE
        BEGIN
          R.AX:=2;
          INTR(51,R);
          CIRCLE(210,350,40);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'X');
          R.AX:=1;
          INTR(51,R);
          REPEAT
            R.AX:=3;
            INTR(51,R);
          UNTIL(R.BX=0);
          P:=FALSE;
          X[3,1]:=2;
        END;
{--- <<<  3,2  >>> ----------------------------------------------------------}
    IF (R.BX=1) AND (R.CX>270) AND (R.CX<370) AND (R.DX>300) AND (R.DX<400) AND (X[3,2]=0) THEN
      IF (P=FALSE) THEN
        BEGIN
          R.AX:=2;
          INTR(51,R);
          LINE(280,310,360,390);
          LINE(280,390,360,310);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'O');
          R.AX:=1;
          INTR(51,R);
          REPEAT
            R.AX:=3;
            INTR(51,R);
          UNTIL(R.BX=0);
          P:=TRUE;
          X[3,2]:=1;
        END
      ELSE
        BEGIN
          R.AX:=2;
          INTR(51,R);
          CIRCLE(320,350,40);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'X');
          R.AX:=1;
          INTR(51,R);
          P:=FALSE;
          X[3,2]:=2;
        END;
{--- <<<  3,3  >>> ----------------------------------------------------------}
    IF (R.BX=1) AND (R.CX>380) AND (R.CX<480) AND (R.DX>300) AND (R.DX<400) AND (X[3,3]=0) THEN
      IF (P=FALSE) THEN
        BEGIN
          R.AX:=2;
          INTR(51,R);
          LINE(390,310,470,390);
          LINE(390,390,470,310);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'O');
          R.AX:=1;
          INTR(51,R);
          REPEAT
            R.AX:=3;
            INTR(51,R);
          UNTIL(R.BX=0);
          P:=TRUE;
          X[3,3]:=1;
        END
      ELSE
        BEGIN
          R.AX:=2;
          INTR(51,R);
          CIRCLE(430,350,40);
          SETFILLSTYLE(1,0);
          BAR(380,0,410,35);
          SETCOLOR(15);
          OUTTEXTXY(380,0,'X');
          R.AX:=1;
          INTR(51,R);
          REPEAT
            R.AX:=3;
            INTR(51,R);
          UNTIL(R.BX=0);
          P:=FALSE;
          X[3,3]:=2;
        END;
{--- <<< PLAYER 1 >>> -------------------------------------------------------}
    IF (X[1,1]=1) AND (X[1,2]=1) AND (X[1,3]=1) OR
       (X[2,1]=1) AND (X[2,2]=1) AND (X[2,3]=1) OR
       (X[3,1]=1) AND (X[3,2]=1) AND (X[3,3]=1) OR
       (X[1,1]=1) AND (X[2,1]=1) AND (X[3,1]=1) OR
       (X[1,2]=1) AND (X[2,2]=1) AND (X[3,2]=1) OR
       (X[1,3]=1) AND (X[2,3]=1) AND (X[3,3]=1) OR
       (X[1,1]=1) AND (X[2,2]=1) AND (X[3,3]=1) OR
       (X[1,3]=1) AND (X[2,2]=1) AND (X[3,1]=1)
    THEN
      BEGIN
        P1:=P1+1;
        R.AX:=2;
        INTR(51,R);
        DELAY(500);
        CLEARVIEWPORT;
        SETTEXTSTYLE(7,0,4);
        OUTTEXTXY(220,200,'X = GANHOU !');
        SETTEXTSTYLE(1,0,2);
        OUTTEXTXY(120,450,'BOTAO DIREITO PARA UMA NOVA PARTIDA...');
        OUTTEXTXY(158,445,'~');
        FOR L:=1 TO 3 DO
          FOR C:=1 TO 3 DO
            X[L,C]:=0;
        REPEAT
          R.AX:=3;
          INTR(51,R);
        UNTIL(R.BX=2);
        CLEARVIEWPORT;
        TELA;
        R.AX:=1;
        INTR(51,R);
        P:=TRUE;
        SETCOLOR(15);
        OUTTEXTXY(380,0,'O');
      END;
{--- <<< PLAYER 2 >>> -------------------------------------------------------}
    IF (X[1,1]=2) AND (X[1,2]=2) AND (X[1,3]=2) OR
       (X[2,1]=2) AND (X[2,2]=2) AND (X[2,3]=2) OR
       (X[3,1]=2) AND (X[3,2]=2) AND (X[3,3]=2) OR
       (X[1,1]=2) AND (X[2,1]=2) AND (X[3,1]=2) OR
       (X[1,2]=2) AND (X[2,2]=2) AND (X[3,2]=2) OR
       (X[1,3]=2) AND (X[2,3]=2) AND (X[3,3]=2) OR
       (X[1,1]=2) AND (X[2,2]=2) AND (X[3,3]=2) OR
       (X[1,3]=2) AND (X[2,2]=2) AND (X[3,1]=2)
    THEN
      BEGIN
        P2:=P2+1;
        R.AX:=2;
        INTR(51,R);
        DELAY(500);
        CLEARVIEWPORT;
        SETTEXTSTYLE(7,HORIZDIR,4);
        OUTTEXTXY(220,200,'O = GANHOU !');
        SETTEXTSTYLE(1,0,2);
        OUTTEXTXY(120,450,'BOTAO DIREITO PARA UMA NOVA PARTIDA...');
        OUTTEXTXY(158,445,'~');
        FOR L:=1 TO 3 DO
          FOR C:=1 TO 3 DO
            X[L,C]:=0;
        REPEAT
          R.AX:=3;
          INTR(51,R);
        UNTIL(R.BX=2);
        CLEARVIEWPORT;
        TELA;
        R.AX:=1;
        INTR(51,R);
        P:=FALSE;
        SETCOLOR(15);
        OUTTEXTXY(380,0,'X');
      END;
{--- <<< EMPATE >>> ---------------------------------------------------------}
  IF (X[1,1]<>0) AND (X[1,2]<>0) AND (X[1,3]<>0) AND
     (X[2,1]<>0) AND (X[2,2]<>0) AND (X[2,3]<>0) AND
     (X[3,1]<>0) AND (X[3,2]<>0) AND (X[3,3]<>0) THEN
  BEGIN
    R.AX:=2;
    INTR(51,R);
    FOR L:=1 TO 3 DO
      FOR C:=1 TO 3 DO
        X[L,C]:=0;
    CLEARVIEWPORT;
    SETTEXTSTYLE(7,HORIZDIR,4);
    OUTTEXTXY(240,200,'EMPATE !');
    SETTEXTSTYLE(1,0,2);
    OUTTEXTXY(120,450,'BOTAO DIREITO PARA UMA NOVA PARTIDA...');
    OUTTEXTXY(158,445,'~');
    REPEAT
      R.AX:=3;
      INTR(51,R);
    UNTIL(R.BX=2);
    CLEARVIEWPORT;
    TELA;
    RANDOMIZE;
    AUX:=(RANDOM(2));
    IF AUX=1 THEN
      BEGIN
        R.AX:=2;
        INTR(51,R);
        P:=FALSE;
        SETCOLOR(15);
        OUTTEXTXY(380,0,'X');
        R.AX:=1;
        INTR(51,R);
      END
    ELSE
      BEGIN
        R.AX:=2;
        INTR(51,R);
        P:=TRUE;
        SETCOLOR(15);
        OUTTEXTXY(380,0,'O');
        R.AX:=1;
        INTR(51,R);
      END;
    R.AX:=1;
    INTR(51,R);
  END;
  IF (R.BX=1) AND (R.CX>=620) AND (R.DX<=20) THEN
    BEGIN
      SAIR:=TRUE;
      BOTAO_SAIR_BAIXO;
      DELAY(200);
    END;
  UNTIL(SAIR=TRUE);
  R.AX:=2;
  INTR(51,R);
  CLEARVIEWPORT;
  SETCOLOR(15);
  SETTEXTSTYLE(7,0,4);
  OUTTEXTXY(260,100,'PLACAR');
  OUTTEXTXY(270,200,'X =');
  OUTTEXTXY(270,250,'0 =');
  STR(P1,S1);
  STR(P2,S2);
  OUTTEXTXY(350,200,S1);
  OUTTEXTXY(350,250,S2);
  SETTEXTSTYLE(1,0,2);
  OUTTEXTXY(190,450,'BOTAO DIREITO PARA SAIR...');
  OUTTEXTXY(228,445,'~');
  REPEAT
    R.AX:=3;
    INTR(51,R);
  UNTIL(R.BX=2);
  SETCOLOR(7);
  SETBKCOLOR(0);
  CLEARVIEWPORT;
  CLOSEGRAPH;
END.{PROGRAM}