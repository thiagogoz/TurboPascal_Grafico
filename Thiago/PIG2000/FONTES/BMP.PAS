{PRODUZIDO E IDEALIZADO POR THIAGO DE G‡Z FERREIRA (90 LINHAS)
2ßP.D. MANH«, COLêGIO CRISTO REDENTOR}

UNIT BMP;

INTERFACE

USES CRT;

PROCEDURE LOAD_BMP(NAME:STRING;WHERE:WORD);

IMPLEMENTATION

Procedure Load_BMP(Name:String;where:word);

type
  Virtual = Array [1..64000] of byte;

VAR
  PicBuf          :^Virtual;
  Data            :File;
  RGB             :ARRAY[0..255,1..4] OF Byte;
  Header          :Array[1..54] of Byte;
  aAddr           :word;
  I               :Byte;

Procedure SetPal(Col,R,G,B : Byte); assembler;

asm
  mov    dx,3c8h
  mov    al,[col]
  out    dx,al
  inc    dx
  mov    al,[r]
  out    dx,al
  mov    al,[g]
  out    dx,al
  mov    al,[b]
  out    dx,al
end;

begin
  GetMem (PicBuf,64000);
  Assign(Data,Name); Reset(Data,1);
  BlockRead(Data,Header,54);
  BlockRead(Data,RGB,1024);
  for i :=0 to 255 do
    SetPal(I,RGB[I,3] div 4,RGB[I,2] div 4,RGB[I,1] div 4);
  BlockRead(Data,PicBuf^,64000);
  Close(Data);
  aAddr := seg (PicBuf^);

  asm
    push si
    push di
    push es
    push ds
    mov es, [where]
    mov ds, [aAddr]
    mov di, 0
    mov dx, 63680
    mov cx, 200
  @page:
    push cx
    mov cx, 320
    mov si, dx
  @line:
    mov bh, byte ptr ds:[si]
    mov es:[di], bh
    inc di
    inc si
    loop @line
    sub dx, 320
    pop cx
    loop @page
    pop ds
    pop es
    pop di
    pop si
  end;
  freeMem(PicBuf,64000);
end;

BEGIN
  asm
    mov ax,0013h;
    int 10h;
  end;

END.{UNIT}