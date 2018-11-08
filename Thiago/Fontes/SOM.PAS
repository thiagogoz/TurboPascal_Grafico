{PRODUZIDO E IDEALIZADO POR THIAGO DE GàZ FERREIRA (379 LINHAS)
2§P.D. MANHÇ, COLGIO CRISTO REDENTOR}

PROGRAM TECLADO;{VERSÇO 2.2}
USES CRT,GRAPH;

VAR
  CH:CHAR;
  A,B,X,X2,MODO,AUX:INTEGER;

{CH   = VARIµVEL USADA PARA VERIFICAR QUAL TECLA O USUµRIO DIGITOU.
 A,B  = VARIµVEIS USADAS PARA INICIALIZAR O MODO GRµFICO.
 X    = VARIµVEL USADA PARA DESENHAR O CÖRCULO VERMELHO NA NOTA PRESSIONADA.
 X2   = VARIµVEL USADA PARA DESENHAR O CÖRCULO VERMELHO NO SUSTENIDO
 PRESSIONADO.
 MODO = VARIµVEL USADA PARA SABER O MODO QUE ESTµ SENDO UTILIZADO.
 AUX  = VARIµVEL AUXILIAR USADA PARA ESCREVER O MODO QUE ESTµ SENDO UTILIZADO
 UMA VEZ Sà NA TELA.}

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
    WRITE('Ç'); DELAY(100);
    WRITE('O'); DELAY(100);
    WRITE(' '); DELAY(100);
    WRITE('2'); DELAY(100);
    WRITE('.'); DELAY(100);
    WRITE('2'); DELAY(1000);
  END;

PROCEDURE TECLA;
  BEGIN
    SETCOLOR(4);
    SETFILLSTYLE(1,4);
    CIRCLE(X+20,270,10);
    FLOODFILL(X+20,270,4);
  END;

PROCEDURE TECLAP;
  BEGIN
    SETCOLOR(15);
    SETFILLSTYLE(1,15);
    CIRCLE(X+20,270,10);
    FLOODFILL(X+20,270,15);
  END;

PROCEDURE TECLAB;
  BEGIN
    SETCOLOR(4);
    SETFILLSTYLE(1,4);
    CIRCLE(X2+20,180,10);
    FLOODFILL(X2+20,180,4);
  END;

PROCEDURE TECLAPB;
  BEGIN
    SETCOLOR(0);
    SETFILLSTYLE(1,0);
    CIRCLE(X2+20,180,10);
    FLOODFILL(X2+20,180,0);
  END;

{MODO NOTAS}
PROCEDURE MODO1;
  BEGIN
    SETCOLOR(15);
    SETFILLSTYLE(1,0);
    BAR(30,290,600,320);
    BAR(10,70,640,100);
    BAR(0,470,100,480);
    OUTTEXTXY(65,295,CHR(39));
    OUTTEXTXY(105,295,CHR(39));
    OUTTEXTXY(185,295,CHR(39));
    OUTTEXTXY(265,295,CHR(39));
    OUTTEXTXY(345,295,CHR(39));
    OUTTEXTXY(385,295,CHR(39));
    OUTTEXTXY(465,295,CHR(39));
    OUTTEXTXY(545,295,CHR(39));
    OUTTEXTXY(80,75,CHR(39));
    OUTTEXTXY(120,75,CHR(39));
    OUTTEXTXY(200,75,CHR(39));
    OUTTEXTXY(280,75,CHR(39));
    OUTTEXTXY(360,75,CHR(39));
    OUTTEXTXY(400,75,CHR(39));
    OUTTEXTXY(480,75,CHR(39));
    OUTTEXTXY(560,75,CHR(39));
    OUTTEXTXY(55,300,'DO   RE   MI   FA  SOL   LA   SI   DO   RE   MI   FA  SOL   LA   SI');
    OUTTEXTXY(70,80,'DO#  RE#       FA#  SOL# LA#       DO#  RE#       FA#  SOL# LA#');
    OUTTEXTXY(0,470,'MODO: NOTAS');
    MODO:=1;
  END;

{MODO TECLAS}
PROCEDURE MODO2;
  BEGIN
    SETCOLOR(15);
    SETFILLSTYLE(1,0);
    BAR(30,290,600,320);
    BAR(10,70,640,100);
    BAR(0,470,100,480);
    OUTTEXTXY(50,300,'TAB   Q    W    E    R    T    Y    U    I    O    P    [    ]  ENTER');
    OUTTEXTXY(70,80,' 1    2         4    5    6         8    9         -    +    \');
    OUTTEXTXY(0,470,'MODO: TECLAS');
    MODO:=2;
  END;

{MODO CIFRAS}
PROCEDURE MODO3;
  BEGIN
    SETCOLOR(15);
    SETFILLSTYLE(1,0);
    BAR(30,290,600,320);
    BAR(30,80,600,100);
    BAR(0,470,100,480);
    OUTTEXTXY(50,300,' C    D    E    F    G    A    B    C    D    E    F    G    A    B');
    OUTTEXTXY(72,80,'C#   D#        F#   G#   A#        C#   D#        F#   G#   A#');
    OUTTEXTXY(0,470,'MODO: CIFRAS');
    MODO:=3;
  END;

BEGIN
  A:=DETECT;
  INITGRAPH(A,B,'C:\PIG\THIAGO');
  X:=80;
  AUX:=1;
{FUNDO BRANCO}
  SETCOLOR(15);
  SETFILLSTYLE(1,15);
  REPEAT
    RECTANGLE(40,100,X,290);
    FLOODFILL(X-1,200,15);
    DELAY(50);
    X:=X+40;
  UNTIL X>=620;
{MONTANDO TECLAS}
  SETCOLOR(0);
  X:=80;
  REPEAT
    RECTANGLE(40,100,X,290);
    DELAY(50);
    X:=X+40;
  UNTIL X>=620;
{SUSTENIDOS}
  SETCOLOR(0);
  SETFILLSTYLE(1,0);
  BAR(65,100,95,200);
  DELAY(70);
  BAR(105,100,135,200);
  DELAY(70);
  BAR(185,100,215,200);
  DELAY(70);
  BAR(225,100,255,200);
  DELAY(70);
  BAR(265,100,295,200);
  DELAY(70);
  BAR(345,100,375,200);
  DELAY(70);
  BAR(385,100,415,200);
  DELAY(70);
  BAR(465,100,495,200);
  DELAY(70);
  BAR(505,100,535,200);
  DELAY(70);
  BAR(545,100,575,200);
  DELAY(70);
{INFORMA€åES}
  SETCOLOR(15);
  MODO1;
  OUTTEXTXY(0,5,'ESC = SAIR');
  OUTTEXTXY(631,465,'~');
  OUTTEXTXY(535,470,'2§ P.D. MANHA');
  OUTTEXTXY(587,0,'~');
  OUTTEXTXY(555,5,'VERSAO 2.2');
  OUTTEXTXY(0,455,'F1= ALTERNA MODO');
  CH:=READKEY;
  IF CH=#27 THEN
    BEGIN
      NOSOUND;
      CLEARVIEWPORT;
      CLOSEGRAPH;
      HALT(0);
    END;
  REPEAT
    REPEAT
      CASE CH OF
{NOTAS PRINCIPAIS}
        #9: BEGIN
              X:=40;
              TECLA;
              SOUND(500);
            END;
        'Q','q':BEGIN
                   X:=80;
                   TECLA;
                   SOUND(561);
                 END;
        'W','w':BEGIN
                   X:=120;
                   TECLA;
                   SOUND(630);
                END;
        'E','e':BEGIN
                   X:=160;
                   TECLA;
                   SOUND(667);
                 END;
        'R','r':BEGIN
                   X:=200;
                   TECLA;
                   SOUND(749);
                 END;
        'T','t':BEGIN
                   X:=240;
                   TECLA;
                   SOUND(841);
                 END;
        'Y','y':BEGIN
                   X:=280;
                   TECLA;
                   SOUND(944);
                 END;
        'U','u':BEGIN
                   X:=320;
                   TECLA;
                   SOUND(1000);
                 END;
        'I','i':BEGIN
                   X:=360;
                   TECLA;
                   SOUND(1122);
                 END;
        'O','o':BEGIN
                   X:=400;
                   TECLA;
                   SOUND(1260);
                 END;
        'P','p':BEGIN
                   X:=440;
                   TECLA;
                   SOUND(1335);
                 END;
        '[','{':BEGIN
                   X:=480;
                   TECLA;
                   SOUND(1498);
                 END;
        ']','}':BEGIN
                   X:=520;
                   TECLA;
                   SOUND(1682);
                 END;
        #13:BEGIN
                   X:=560;
                   TECLA;
                   SOUND(1888);
                 END;
{SUSTENIDOS}
        '1','!':BEGIN
                   X2:=60;
                   TECLAB;
                   SOUND(530);
                 END;
        '2','@':BEGIN
                   X2:=100;
                   TECLAB;
                   SOUND(595);
                 END;
        '4','$':BEGIN
                   X2:=180;
                   TECLAB;
                   SOUND(707);
                 END;
        '5','%':BEGIN
                   X2:=220;
                   TECLAB;
                   SOUND(794);
                 END;
        '6','^':BEGIN
                   X2:=260;
                   TECLAB;
                   SOUND(891);
                 END;
        '8','*':BEGIN
                   X2:=340;
                   TECLAB;
                   SOUND(1059);
                 END;
        '9','(':BEGIN
                   X2:=380;
                   TECLAB;
                   SOUND(1189);
                 END;
        '-','_':BEGIN
                   X2:=460;
                   TECLAB;
                   SOUND(1414);
                 END;
        '=','+':BEGIN
                   X2:=500;
                   TECLAB;
                   SOUND(1587);
                END;
        '\','|':BEGIN
                   X2:=540;
                   TECLAB;
                   SOUND(1782);
                END;
        #59:    BEGIN
                  IF AUX=1 THEN
                    CASE MODO OF
                      1:MODO2;
                      2:MODO3;
                      3:MODO1;
                    END;
                  AUX:=2;
                END;
      END;
    UNTIL KEYPRESSED;
    AUX:=1;
    TECLAP;
    TECLAPB;
    DELAY(50);
    NOSOUND;
    CH:=READKEY;
  UNTIL CH=#27;
  NOSOUND;
  CLEARVIEWPORT;
  CLOSEGRAPH;
  PROPAGANDA;
END.{PROGRAM}