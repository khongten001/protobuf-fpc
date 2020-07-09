unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    procedure WriteLog(S:string);
    procedure WriteLog(S:string; Args: array of const);
  public

  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  W: TChildJSONObj;
begin
  W:=TChildJSONObj.Create;
  W.Code:=1;
  W.Name:='Привет мир';
  W.SaveToFile('test1.json');
  W.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  W: TChildJSONObj;
begin
  W:=TChildJSONObj.Create;
  W.LoadFromFile('test1.json');
  WriteLog('W.Code = %d', [W.Code]);
  WriteLog('W.Name = %s', [W.Name]);
  W.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  W: TMainSONObj;
begin
  W:=TMainSONObj.Create;
  W.Version:=1;
  W.Adress:='г.Москва, ул.';
  W.Child.Code:=1;
  W.Child.Name:='Наименование';
  W.SaveToFile('test2.json');
  W.Free;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  W: TMainSONObj;
begin
  W:=TMainSONObj.Create;
  W.LoadFromFile('test2.json');

  WriteLog('W.Version = %d', [W.Version]);
  WriteLog('W.Adress = %s', [W.Adress]);

  WriteLog('W.Child.Code = %d', [W.Child.Code]);
  WriteLog('W.Child.Name = %s', [W.Child.Name]);
  W.Free;
end;

procedure TForm1.WriteLog(S: string);
begin
  Memo1.Lines.Add(S);
end;

procedure TForm1.WriteLog(S: string; Args: array of const);
begin
  Memo1.Lines.Add(S, Args);
end;

end.

