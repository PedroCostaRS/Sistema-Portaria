unit uSobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  shellapi;

type
  TfrmSobre = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label2: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.dfm}

procedure TfrmSobre.SpeedButton1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://www.instagram.com/pedrocostar/', nil,
    nil, SW_SHOWMAXIMIZED);
end;

procedure TfrmSobre.SpeedButton2Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open',
    'https://www.linkedin.com/in/pedro-costa-714022121/', nil, nil,
    SW_SHOWMAXIMIZED);
end;

procedure TfrmSobre.SpeedButton3Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://github.com/PedroCostaRS', nil, nil,
    SW_SHOWMAXIMIZED);

end;

end.
