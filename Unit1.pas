unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, TeeProcs, TeEngine, Chart, Series,
  sSkinManager;

type
  TForm1 = class(TForm)
    button_create: TButton;
    graph: TChart;
    b_variable: TEdit;
    a_variable: TEdit;
    left_border_scroll: TScrollBar;
    right_border_scroll: TScrollBar;
    list_of_functions: TListBox;
    TLS: TLineSeries;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    left_border_edit: TEdit;
    right_border_edit: TEdit;
    sknmngr1: TsSkinManager;
    procedure FormCreate(Sender: TObject);
    procedure button_createClick(Sender: TObject);
    procedure right_border_scrollChange(Sender: TObject);
    procedure left_border_scrollChange(Sender: TObject);
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
  with list_of_functions do
  begin
Items.Add('y=x^3');
Items.Add('f2');
Items.Add('f3');
end;
end;

procedure TForm1.button_createClick(Sender: TObject);
begin
     graph.SeriesList[0].Clear;
     {левая и правая граница}
     right_border_scroll.Max:=StrToInt(right_border_edit.text);
     left_border_scroll.Min:=StrToInt(left_border_edit.text);

     if list_of_functions.Selected[0] then
     begin
  x := StrToInt(left_border_edit.text);
  h := 0.05;


  repeat
    {создание графика}
    graph.SeriesList[0].AddXY(x,x*x*x);

    x := x + h;
  until x > StrToInt(right_border_edit.text) ;
end;


  end;
procedure TForm1.right_border_scrollChange(Sender: TObject);
begin
  {изменение правого предела графика}
     right_border_edit.Text:=IntToStr(right_border_scroll.Position);

       button_create.Click;
end;

procedure TForm1.left_border_scrollChange(Sender: TObject);
begin
      {изменение левого предела графика}
      left_border_edit.Text:=IntToStr(left_border_scroll.Position);
      button_create.Click;
end;

end.
