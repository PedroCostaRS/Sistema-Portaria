unit Portaria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, frxClass, frxDBSet, Data.DB,
  Vcl.Menus, Vcl.Imaging.jpeg;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Image1: TImage;
    PopupMenu1: TPopupMenu;
    Label1: TLabel;
    N2: TMenuItem;
    Sobre2: TMenuItem;
    SpeedButton5: TSpeedButton;
    Edit1: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Sobre2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadastroDeVisitante, uCadastraVeiculo, uMovimento, uDataModule, uSobre;

procedure TfrmPrincipal.Edit1DblClick(Sender: TObject);
var
  a: string;
begin
  a := Edit1.Text;
  if a = 'Rone2010' then
  begin
    frmCadastroDeVeiculo.SpeedButton4.Visible := true;
    frmConsultaVisitante.SpeedButton4.Visible := true;
    frmMovimento.SpeedButton5.Visible := true;

  end;
  Edit1.Visible := False;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  Image1.Picture.LoadFromFile('c:/Portaria/icones/imagem.jpg');
end;

procedure TfrmPrincipal.Image1DblClick(Sender: TObject);
begin
  ShowMessage
    ('Para substituir a imagem, altere o arquivo imagem.jpg dentro da pasta icones!!               (Dimensões 300x600)');
end;

procedure TfrmPrincipal.Sobre2Click(Sender: TObject);
begin
  frmSobre.ShowModal;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  frmConsultaVisitante.ShowModal;
end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  frmCadastroDeVeiculo.ShowModal;
end;

procedure TfrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
  frmMovimento.ShowModal;
end;

procedure TfrmPrincipal.SpeedButton4Click(Sender: TObject);
begin
  Edit1.Visible := true;
end;

procedure TfrmPrincipal.SpeedButton5Click(Sender: TObject);
begin
  frmSobre.ShowModal;
end;

end.
