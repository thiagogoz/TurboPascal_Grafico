{PRODUZIDO E IDEALIZADO POR THIAGO DE G‡Z FERREIRA (98 LINHAS)
2ßP.D. MANH«, COLêGIO CRISTO REDENTOR}

PROGRAM BOLA;
USES GRAPH,CRT;

VAR
  A,B,X,Y,DIR,COR:INTEGER;

{A,B = VARIµVEIS USADAS PARA INICIALIZAR O MODO GRµFICO.
 X,Y = VARIµVEIS USADAS PARA DESENHAR A BOLA NAS COORDENADAS(X,Y).
 DIR = VARIµVEL USADA PARA INDICAR A DIREÄ«O EM QUE A BOLA VAI ANDAR.
 COR = VARIµVEL USADA PARA INDICAR A COR DA BOLA A SER DESENHADA.}

BEGIN
  RANDOMIZE;
  X:=RANDOM(600)+20;
  Y:=RANDOM(440)+20;
  A:=DETECT;
  INITGRAPH(A,B,'C:\PIG\THIAGO\');
  CLEARVIEWPORT;
  DIR:=RANDOM(3);
REPEAT
  COR:=RANDOM(15)+1;
  SETFILLSTYLE(1,COR);
  SETCOLOR(COR);
  CIRCLE(X,Y,20);
  FLOODFILL(X,Y,COR);
 CASE DIR OF
   0: BEGIN
       IF (X<=614)THEN
         BEGIN
           X:=X+1;
           Y:=Y+1;
         END
       ELSE
         DIR:=3;
       IF (Y<= 454) THEN
         BEGIN
           X:=X+1;
           Y:=Y+1;
         END
       ELSE
         DIR:=1;
      END;
   1: BEGIN
       IF (X<=614) THEN
         BEGIN
           X:=X+1;
           Y:=Y-1;
         END
       ELSE
         DIR:=2;
       IF (Y>= 26) THEN
         BEGIN
           X:=X+1;
           Y:=Y-1;
         END
       ELSE
         DIR:=0;
      END;
   2: BEGIN
       IF (X>=26) THEN
         BEGIN
           X:=X-1;
           Y:=Y-1;
         END
       ELSE
         DIR:=1;
       IF (Y>= 26) THEN
         BEGIN
           X:=X-1;
           Y:=Y-1;
         END
       ELSE
         DIR:=3;
      END;
   3: BEGIN
       IF (X>=26) THEN
         BEGIN
           X:=X-1;
           Y:=Y+1;
         END
       ELSE
         DIR:=0;
       IF (Y<= 454) THEN
         BEGIN
           X:=X-1;
           Y:=Y+1;
         END
       ELSE
         DIR:=2;
      END;
  END;{CASE}
UNTIL KEYPRESSED;
CLEARVIEWPORT;
CLOSEGRAPH;
END.{PROGRAM}