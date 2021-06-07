unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, TeeProcs, TeEngine, Chart, Series,
  sSkinManager, ComCtrls, Spin, sEdit, sSpinEdit, acDBDecimalSpinEdit,
  acArcControls, sLabel, acDBTextFX, sGauge, sBevel, acProgressBar, sPanel,
  Mask, sMaskEdit, sCustomComboEdit, sComboEdit;

type
  TForm1 = class(TForm)
    button_create: TButton;
    graph: TChart;
    b_variable: TEdit;
    a_variable: TEdit;
    list_of_functions: TListBox;
    TLS: TLineSeries;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    sknmngr1: TsSkinManager;
    lbl5: TLabel;
    c_variable: TEdit;
    left_border_changer: TsDecimalSpinEdit;
    right_border_changer: TsDecimalSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure button_createClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   h, x: real;
   i,y_mod,x_int: Integer;
   a,b,x_arctan:Real;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  a_variable.Text:='0';
  b_variable.Text:='0';
  c_variable.Text:='0';
  

  with list_of_functions do
  begin
Items.Add('y=mod(x,a)');
Items.Add('y=x^3');
Items.Add('y=a*x^3');
Items.Add('y=cos(x)');
Items.Add('y=1/x)');
Items.Add('y=ln(cos(x))');
Items.Add('y=arctng(x)');
Items.Add('y=a*x^2+b*x+c');
Items.Add('y=a*sin(x*b)+c');
Items.Add('y=a*x+b');
end;
end;

procedure TForm1.button_createClick(Sender: TObject);
begin
     graph.SeriesList[0].Clear;

//первая формула
     if list_of_functions.Selected[0] then
     begin
  x := StrToInt(left_border_changer.text);
  h := 0.05;
  repeat
    {создание графика}
    x:=x*100;
    x_int:=trunc(x);
    y_mod:=(x_int) mod StrToInt(a_variable.text);
    graph.SeriesList[0].AddXY(x,y_mod);
    x:=x/100;
    x := x + h;
  until x > StrToInt(right_border_changer.text) ;
end;

     //вторая формула
     if list_of_functions.Selected[1] then
     begin
  x := StrToInt(left_border_changer.text);
  h := 0.05;
  repeat
    {создание графика}
    graph.SeriesList[0].AddXY(x,x*x*x);

    x := x + h;
  until x > StrToInt(right_border_changer.text) ;
end;

      //третья формула
     if list_of_functions.Selected[2] then
     begin
  x := StrToInt(left_border_changer.text);
  h := 0.05;
  repeat
    {создание графика}
    graph.SeriesList[0].AddXY(x,StrToInt(a_variable.text)*x*x*x);

    x := x + h;
  until x > StrToInt(right_border_changer.text) ;
end;

      //четвёртая формула
     if list_of_functions.Selected[3] then
     begin
  x := StrToInt(left_border_changer.text);
  h := 0.05;
  repeat
    {создание графика}
    graph.SeriesList[0].AddXY(x,Cos(x));

    x := x + h;
  until x > StrToInt(right_border_changer.text) ;
end;

     //пятая формула
     if list_of_functions.Selected[4] then
     begin
  x := StrToInt(left_border_changer.text);
  h := 0.05;
  repeat
    {создание графика}
    graph.SeriesList[0].AddXY(x,1/x);

    x := x + h;
  until x > StrToInt(right_border_changer.text) ;
end;

     //шестая формула
     if list_of_functions.Selected[5] then
     begin
  x := StrToInt(left_border_changer.text);
  h := 0.05;
  repeat
    {создание графика}
    graph.SeriesList[0].AddXY(x,ln(Cos(x)));

    x := x + h;
  until x > StrToInt(right_border_changer.text) ;
end;

     //седьмая формула
     if list_of_functions.Selected[6] then
     begin
  x := StrToInt(left_border_changer.text);
  h := 0.05;
  repeat
    {создание графика}
    x_arctan:=arctan(x);
    graph.SeriesList[0].AddXY(x,x_arctan);

    x := x + h;
  until x > StrToInt(right_border_changer.text) ;
end;

     //восьмая формула
     if list_of_functions.Selected[7] then
     begin
  x := StrToInt(left_border_changer.text);
  h := 0.05;
  repeat
    {создание графика}
    graph.SeriesList[0].AddXY(x,StrToInt(a_variable.Text)*x*x+StrToInt(b_variable.Text)*x+StrToInt(c_variable.Text));
    x := x + h;
  until x > StrToInt(right_border_changer.text) ;
end;

     //девятая формула
     if list_of_functions.Selected[8] then
     begin
  x := StrToInt(left_border_changer.text);
  h := 0.05;
  repeat
    {создание графика}
    graph.SeriesList[0].AddXY(x,Sin(x*strtoint(b_variable.text))+strtoint(c_variable.text));
    x := x + h;
  until x > StrToInt(right_border_changer.text) ;
end;

 //десятая формула
     if list_of_functions.Selected[9] then
     begin
  x := StrToInt(left_border_changer.text);
  h := 0.05;
  repeat
    {создание графика}
    graph.SeriesList[0].AddXY(x,strtoint(a_variable.text)*x+strtoint(b_variable.text));
    x := x + h;
  until x > StrToInt(right_border_changer.text) ;
end;
  end;




end.
