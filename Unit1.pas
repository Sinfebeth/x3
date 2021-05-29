unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, TeeProcs, TeEngine, Chart, Series;

type
  TForm1 = class(TForm)
    btn1: TButton;
    cht1: TChart;
    edt1: TEdit;
    edt2: TEdit;
    scrlbr1: TScrollBar;
    scrlbr2: TScrollBar;
    lst1: TListBox;
    TLS: TLineSeries;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edt3: TEdit;
    edt4: TEdit;
    tst: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure scrlbr2Change(Sender: TObject);
    procedure scrlbr1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   h, x: real;
   i: Integer;
   a,b:Real;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
lst1.Items.Add('y=mod(x,a)');
lst1.Items.Add('f2');
lst1.Items.Add('f3');

end;

procedure TForm1.btn1Click(Sender: TObject);
begin
     cht1.SeriesList[0].Clear;
     {левая и правая граница}
     scrlbr2.Max:=StrToInt(edt4.text);
     scrlbr1.Min:=StrToInt(edt3.text);

     if lst1.Selected[0] then
     begin
  x := StrToInt(edt3.text);
  h := 0.05;


  repeat
    {создание графика}
    Cht1.SeriesList[0].AddXY(x,Sin(x*Pi));

    x := x + h;
  until x > StrToInt(edt4.text) ;
end;


  end;
procedure TForm1.scrlbr2Change(Sender: TObject);
begin
  {изменение правого предела графика}
     edt4.Text:=IntToStr(scrlbr2.Position);

       btn1.Click;
end;

procedure TForm1.scrlbr1Change(Sender: TObject);
begin
      {изменение левого предела графика}
      edt3.Text:=IntToStr(scrlbr1.Position);
      btn1.Click;
end;

end.
