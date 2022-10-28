unit uCadastraVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, frxClass,
  frxDBSet;

type
  TfrmCadastroDeVeiculo = class(TForm)
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
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroDeVeiculo: TfrmCadastroDeVeiculo;

implementation

{$R *.dfm}

uses uDataModule;

procedure TfrmCadastroDeVeiculo.DBGrid1TitleClick(Column: TColumn);
begin
  dtm.VeiculoTable.IndexFieldNames := Column.FieldName;
end;

procedure TfrmCadastroDeVeiculo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtm.VeiculoTable.Close;
end;

procedure TfrmCadastroDeVeiculo.FormShow(Sender: TObject);
begin
  dtm.VeiculoTable.Open();
  SpeedButton3.Enabled := True;
  SpeedButton5.Enabled := True;
end;

procedure TfrmCadastroDeVeiculo.SpeedButton1Click(Sender: TObject);
begin
  dtm.VeiculoTable.Prior;
end;

procedure TfrmCadastroDeVeiculo.SpeedButton2Click(Sender: TObject);
begin
  dtm.VeiculoTable.Next;
end;

procedure TfrmCadastroDeVeiculo.SpeedButton3Click(Sender: TObject);
begin
  try
    dtm.VeiculoTable.Edit;

    SpeedButton3.Enabled := False;
    SpeedButton5.Enabled := False;
  except

  end;
end;

procedure TfrmCadastroDeVeiculo.SpeedButton4Click(Sender: TObject);
begin
  try
    dtm.VeiculoTable.Delete;
  except

  end;
end;

procedure TfrmCadastroDeVeiculo.SpeedButton5Click(Sender: TObject);

var
  a: integer;
begin
  try
    dtm.VeiculoTable.Close;
    dtm.VeiculoTable.SQL.Clear;
    dtm.VeiculoTable.SQL.Add('select * from veiculo order by cod_veiculo');

    dtm.VeiculoTable.Open();

    dtm.VeiculoTable.Last;
    a := dtm.VeiculoTableCOD_VEICULO.Value;

    dtm.VeiculoTable.Insert;

    dtm.VeiculoTableCOD_VEICULO.Value := a + 1;;

    SpeedButton3.Enabled := False;
    SpeedButton5.Enabled := False;

  except

  end;
end;

procedure TfrmCadastroDeVeiculo.SpeedButton6Click(Sender: TObject);
begin
  try
    dtm.VeiculoTable.Post;

    dtm.VeiculoTable.Close;
    dtm.VeiculoTable.SQL.Clear;
    dtm.VeiculoTable.SQL.Add('select * from veiculo order by cod_veiculo');
    dtm.VeiculoTable.Open();

    SpeedButton3.Enabled := True;
    SpeedButton5.Enabled := True;

  except
    ShowMessage('Não há registro em edição!');
  end;
end;

procedure TfrmCadastroDeVeiculo.SpeedButton7Click(Sender: TObject);
begin
  try
    dtm.VeiculoTable.Locate('placa', Edit1.Text,
      [loPartialKey, loCaseInsensitive]);
  except

  end;
end;

end.
