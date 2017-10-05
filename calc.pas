unit Calc;

{$mode objfpc}
{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Calctext: TLabel;
    Label1: TLabel;
    Memory: TLabel;
    MemClear: TButton;
    MemRead: TButton;
    MemSave: TButton;
    MemPlus: TButton;
    MemMinus: TButton;
    Num7: TButton;
    Num0: TButton;
    Tochka: TButton;
    Plus: TButton;
    Minus: TButton;
    Multi: TButton;
    Divi: TButton;
    Invert: TButton;
    FullDel: TButton;
    DelAll: TButton;
    DelOne: TButton;
    Num4: TButton;
    SqrtBut: TButton;
    QrtBut: TButton;
    DivOnX: TButton;
    Enter: TButton;
    Num1: TButton;
    Num8: TButton;
    Num9: TButton;
    Num5: TButton;
    Num6: TButton;
    Num2: TButton;
    Num3: TButton;


    procedure DivOnXClick(Sender: TObject);

    procedure FormKeyPress(Sender: TObject; var Key: char);


    procedure FullDelClick(Sender: TObject);
    procedure DelAllClick(Sender: TObject);
    procedure DelOneClick(Sender: TObject);
    procedure ActClick(Sender: TObject);


   procedure ButClick(Sender: TObject);
   procedure EnterClick(Sender: TObject);
   procedure InvertClick(Sender: TObject);
   procedure MemClearClick(Sender: TObject);
   procedure MemMinusClick(Sender: TObject);
   procedure MemPlusClick(Sender: TObject);
   procedure MemReadClick(Sender: TObject);
   procedure MemSaveClick(Sender: TObject);
   procedure QrtButClick(Sender: TObject);
   procedure SqrtButClick(Sender: TObject);
   procedure TochkaClick(Sender: TObject);


  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  a,b,c,M:double;
  Act,hist:string;
  NewAct,point:Boolean;
  Key1:char;

implementation

{$R *.lfm}

{ TForm1 }



procedure TForm1.DelOneClick(Sender: TObject);
var
  str : string;
begin
    str:=Calctext.Caption;
    if copy(str, length(str),1)= ','then
    Point:=false;

    if str <> '' then
    Delete(str, length(str),1);
    Calctext.Caption:=str;

end;

procedure TForm1.DelAllClick(Sender: TObject);
begin
  Calctext.caption:='';
  label1.caption:='';
  Point:=false;
end;

procedure TForm1.FullDelClick(Sender: TObject);
begin
  Calctext.caption:='';
  label1.caption:='';
  A:=0;
  b:=0;
  C:=0;
  Point:=false;
end;

procedure TForm1.DivOnXClick(Sender: TObject);
begin
  try
    a:= strtofloat( Calctext.Caption);
  a:=1/a;
   Calctext.Caption:= floattostr(A);
  a:=0;
   except
       on EConvertError do;
     end;


end;



procedure TForm1.FormKeyPress(Sender: TObject; var Key: char);
begin

    case  key of
       '0'..'9' : Calctext.Caption:=Calctext.caption+Key;

         end;

end;







 procedure TForm1.ActClick(Sender: TObject);
begin
  try
        label1.Caption:='';
  a:=strtofloat( Calctext.Caption);
        except
       on EConvertError do;
     end;

     Calctext.Caption :='';
     Point:=false;

     Act:=(Sender As TButton).Caption;

     label1.Caption:= Label1.Caption + floattostr(a)+Act;
     NewAct:=false;

end;

procedure TForm1.ButClick(Sender: TObject);

begin
  if     NewAct = true then begin
       CalcText.caption:='';
        NewAct:=false;
         label1.Caption:='';

  end;


  Calctext.Caption:= Calctext.Caption + ( Sender as TButton).Caption ;


end;

procedure TForm1.EnterClick(Sender: TObject);
begin
  try
  B:= strtofloat( Calctext.Caption);
   Calctext.Caption:='';

     label1.Caption:= Label1.Caption + floattostr(b);
   except
       on EConvertError do;
     end;

  case act of
  '+' : c := a+b;
  '-' : c := a-b;
  '*' : c := a*b;
  '/' :
    begin
      try

      c := a/b ;

      except
        on EZeroDivide Do  showmessage(' 123');

      end;
      end ;
   end;
     try
  Calctext.Caption:= Floattostr(C);

     except
       on EConvertError do;
     end;
    NewAct:=true;


end;













procedure TForm1.InvertClick(Sender: TObject);
begin
  try
    a:= strtofloat( Calctext.Caption);
  a:=a*(-1);
   Calctext.Caption:= floattostr(A);
  a:=0;

       except
       on EConvertError do;
     end;
end;

procedure TForm1.MemClearClick(Sender: TObject);
begin
  M:=0;
  Memory.Caption :=''

end;

procedure TForm1.MemMinusClick(Sender: TObject);
begin
  try
  M:=M - StrtoFloat( Calctext.Caption);
  if M <> 0 then
  Memory.Caption :='M'
  else Memory.Caption :=''

       except
       on EConvertError do;
     end;
end;

procedure TForm1.MemPlusClick(Sender: TObject);
begin
  try
  M:=M + StrtoFloat( Calctext.Caption);
  if M <> 0 then
  Memory.Caption :='M'
  else Memory.Caption :=''

       except
       on EConvertError do;
     end;
end;

procedure TForm1.MemReadClick(Sender: TObject);
begin
  try
   Calctext.Caption:= Floattostr(M);

       except
       on EConvertError do;
     end;
end;

procedure TForm1.MemSaveClick(Sender: TObject);
begin
  try
  M:= StrtoFloat( Calctext.Caption);
  if M <> 0 then
  Memory.Caption :='M'
  else Memory.Caption :=''

       except
       on EConvertError do;
     end;
end;

procedure TForm1.QrtButClick(Sender: TObject);
begin
  try
    a:= strtofloat( Calctext.Caption);
  a:=sqr(a);
   Calctext.Caption:= floattostr(A);
  a:=0;

       except
       on EConvertError do;
     end;

end;

procedure TForm1.SqrtButClick(Sender: TObject);

begin
  try
  a:= strtofloat( Calctext.Caption);
  a:=sqrt(a);
  Calctext.Caption:= floattostr(A);
  a:=0;


  except
        Calctext.Caption:='отрицательное значение';

  end;


end;

procedure TForm1.TochkaClick(Sender: TObject);
begin
  if   not point    then
   if Length (Calctext.Caption) = 0 then begin

   Calctext.Caption:='0'+','  ;
   Point:=true
   end
   else       begin
     Calctext.Caption:=Calctext.Caption+','     ;
      Point:=true    ;
   end
  else
  exit


end;




end.

