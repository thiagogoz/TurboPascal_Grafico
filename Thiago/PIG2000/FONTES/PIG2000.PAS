{PRODUZIDO E IDEALIZADO POR THIAGO DE G‡Z FERREIRA (40 LINHAS)
2ßP.D. MANH«, COLêGIO CRISTO REDENTOR}

PROGRAM NAVE2000;
USES DOS,CRT,GRAPH,UNIT2000,BMP;

var
 Gd, Gm: Integer;
 Palette: PaletteType;

BEGIN
  Load_BMP('PIG2000.PIG',$A000);
  READKEY;
  Gd := Detect;
  InitGraph(Gd, Gm, 'C:\PIG\THIAGO');
  with Palette do
 begin
   Size := 4;
   Colors[0] := 0;
   Colors[1] := 1;
   Colors[2] := 2;
   Colors[3] := 3;
   Colors[4] := 4;
   Colors[5] := 5;
   Colors[6] := 6;
   Colors[7] := 7;
   Colors[8] := 8;
   Colors[9] := 9;
   Colors[10] := 10;
   Colors[11] := 11;
   Colors[12] := 12;
   Colors[13] := 13;
   Colors[14] := 14;
   Colors[15] := 15;
   SetAllPalette(Palette);
 end;
  TELAPRIN;
  MENUPRINCIPAL;

END.{PROGRAM}