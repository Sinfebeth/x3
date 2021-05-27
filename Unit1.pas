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
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
lst1.Items.Add('f1');
lst1.Items.Add('f2');
lst1.Items.Add('f3');
end;

procedure TForm1.btn1Click(Sender: TObject);
var

  h, x: real;
   i: Integer;
begin

     if lst1.Selected[0] then
     begin
  x := StrToInt(edt3.text);
  h := 0.05;


  repeat
    Cht1.SeriesList[0].AddXY(x,sin(x * Pi) );

    x := x + h;
  until x > StrToInt(edt4.text);
end;


  end;
end.
