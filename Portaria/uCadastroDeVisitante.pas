unit uCadastroDeVisitante;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.Mask, ACBrBase, ACBrValidador,
  System.ImageList, Vcl.ImgList, Vcl.Buttons;

type
  TfrmConsultaVisitante = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    ACBrValidador1: TACBrValidador;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit4Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaVisitante: TfrmConsultaVisitante;

implementation

{$R *.dfm}

uses uDataModule;

procedure TfrmConsultaVisitante.DBEdit4Exit(Sender: TObject);
begin
  ACBrValidador1.Documento := DBEdit4.Text;

  if not ACBrValidador1.Validar then
  begin
    MessageDlg('O CPF Informado é inválido! Por favor, corrija-o! ', mtError,
      [mbOK], 0);
  end;

end;

procedure TfrmConsultaVisitante.DBGrid1TitleClick(Column: TColumn);
begin
  dtm.VisitanteTable.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConsultaVisitante.Edit1Click(Sender: TObject);
begin
  Edit1.Text := '';
end;

procedure TfrmConsultaVisitante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtm.VisitanteTable.Close;
end;

procedure TfrmConsultaVisitante.FormShow(Sender: TObject);
begin
  dtm.VisitanteTable.Open();
  SpeedButton3.Enabled := True;
  SpeedButton5.Enabled := True;
end;

procedure TfrmConsultaVisitante.SpeedButton1Click(Sender: TObject);
begin
  dtm.VisitanteTable.Prior;
end;

procedure TfrmConsultaVisitante.SpeedButton2Click(Sender: TObject);
begin
  dtm.VisitanteTable.Next;
end;

procedure TfrmConsultaVisitante.SpeedButton3Click(Sender: TObject);
begin
  try
    dtm.VisitanteTable.Edit;

    SpeedButton3.Enabled := False;
    SpeedButton5.Enabled := False;
  except

  end;
end;

procedure TfrmConsultaVisitante.SpeedButton4Click(Sender: TObject);
begin
  try
    dtm.VisitanteTable.Delete;
  except

  end;
end;

procedure TfrmConsultaVisitante.SpeedButton5Click(Sender: TObject);
var
  a: integer;
begin
  try
    dtm.VisitanteTable.Last;
    dtm.VisitanteTable.Close;
    dtm.VisitanteTable.SQL.Clear;
    dtm.VisitanteTable.SQL.Add
      ('select * from visitante order by cod_visitante');

    dtm.VisitanteTable.Open();

    dtm.VisitanteTable.Last;
    a := dtm.VisitanteTableCOD_VISITANTE.Value;

    dtm.VisitanteTable.Insert;

    dtm.VisitanteTableCOD_VISITANTE.Value := a + 1;;
    SpeedButton3.Enabled := False;
    SpeedButton5.Enabled := False;
  except

  end;
end;

procedure TfrmConsultaVisitante.SpeedButton6Click(Sender: TObject);
begin
  try
    dtm.VisitanteTable.Post;

    dtm.VisitanteTable.Close;
    dtm.VisitanteTable.SQL.Clear;
    dtm.VisitanteTable.SQL.Add
      ('select * from visitante order by cod_visitante');
    dtm.VisitanteTable.Open();

    SpeedButton3.Enabled := True;
    SpeedButton5.Enabled := True;

  except
    ShowMessage('Não há registro em edição!');
  end;
end;

procedure TfrmConsultaVisitante.SpeedButton7Click(Sender: TObject);
begin
  try
    dtm.VisitanteTable.Locate('nome', Edit1.Text,
      [loPartialKey, loCaseInsensitive]);
  except

  end;
end;

end.
