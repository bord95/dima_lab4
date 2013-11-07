unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAGraph, TASeries, Forms, Controls, Graphics,
  Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
function f(x: real): real;

begin
  F := x * arctan(x) - 1;
end;

procedure TForm1.Button1Click(Sender: TObject);

var
  a, b, eps, x: real;
  Ta, Tb: string;
  Code: byte;
  i: real;
begin
  begin
    memo1.Clear;
    val(edit1.Text, a, code);
    if (code = 0) then
    begin
      val(edit2.Text, b, code);
      if (code = 0) then
      begin
        val(edit3.Text, eps, code);
        if (code = 0) then
        begin
          Code := 0;
          repeat
            Code := Code + 1;
            x := (a + b) / 2;
            if f(a) * f(x) < 0 then
              b := x
            else
              a := x;
            if (Code > 100) then
            begin
              memo1.Lines.add('Невозможно вычислить');
              exit;
            end;
          until abs(f(x)) < eps;
          val(edit1.Text, a, code);
          val(edit2.Text, b, code);
          i := a;
          Chart1LineSeries1.Clear;
          while (i < b) do
          begin
            Chart1LineSeries1.AddXY(i, f(i));
            i := i + 0.01;
          end;
          Str(x: 3: 3, Ta);
          Str(F(x): 4: 4, Tb);
          memo1.Lines.add('x=' + Ta);
          memo1.Lines.add('F(x)=' + Tb);
        end
        else
          memo1.Lines.add('Точность введена неверно');
      end
      else
        memo1.Lines.add('Конечная граница введена неверно');
    end
    else
      memo1.Lines.add('Начальная граница введена неверно');
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    begin
  close;
end;
    end;

end.
