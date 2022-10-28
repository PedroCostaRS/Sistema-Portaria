unit uMovimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmMovimento = class(TForm)
    dtsMovimento: TDataSource;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    SpeedButton7: TSpeedButton;
    SpeedButton2: TSpeedButton;
    dtsVeiculo: TDataSource;
    dtsVisitante: TDataSource;
    edtVisitante: TEdit;
    edtPlaca: TEdit;
    DBGrid3: TDBGrid;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Edit1: TEdit;
    SpeedButton5: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovimento: TfrmMovimento;

implementation

{$R *.dfm}

uses uDataModule;

procedure TfrmMovimento.BitBtn1Click(Sender: TObject);
var
  a, cod_visit, cod_veiculo: integer;
  nome, cpf, marca, modelo, placa: string;
begin
  try
    dtm.MovimentoTable.Close;
    dtm.MovimentoTable.SQL.Clear;
    dtm.MovimentoTable.SQL.Add('select * from movimento order by id_movimento');

    dtm.MovimentoTable.Open();

    dtm.MovimentoTable.Last;
    a := dtm.MovimentoTableID_MOVIMENTO.Value;

    dtm.MovimentoTable.Insert;

    dtm.MovimentoTableID_MOVIMENTO.Value := a + 1;

    /// /////////////////////////////////////////////////
    /// /////////// ADICIONA VISITANTE //////////////////
    cod_visit := dtm.VisitanteTableCOD_VISITANTE.Value;
    nome := dtm.VisitanteTableNOME.Value;
    cpf := dtm.VisitanteTableCPF.Value;

    dtm.MovimentoTableCOD_VISITANTE.Value := cod_visit;
    dtm.MovimentoTableNOME.Value := nome;
    dtm.MovimentoTableCPF.Value := cpf;
    dtm.MovimentoTableDATA.Value := Now;

    /// /////////////////////////////////////////////////
    /// /////////// ADICIONA VEÍCULO ////////////////////
    cod_veiculo := dtm.VeiculoTableCOD_VEICULO.Value;
    marca := dtm.VeiculoTableMARCA.Value;
    modelo := dtm.VeiculoTableMODELO.Value;
    placa := dtm.VeiculoTablePLACA.Value;

    dtm.MovimentoTableCOD_VEICULO.Value := cod_veiculo;
    dtm.MovimentoTableMARCA.Value := marca;
    dtm.MovimentoTableMODELO.Value := modelo;
    dtm.MovimentoTablePLACA.Value := placa;

    dtm.MovimentoTableHORA_ENTRADA.Value := TimeToStr(Time);
    dtm.MovimentoTableMOTIVO.Value := Edit1.Text;

    Edit1.Text := '';
    BitBtn1.Enabled := False;
    SpeedButton1.Enabled := False;

  except

  end;

end;

procedure TfrmMovimento.DBGrid1CellClick(Column: TColumn);
begin
  try
    dtm.MovimentoTableCOD_VISITANTE.Value :=
      dtm.VisitanteTableCOD_VISITANTE.Value;
    dtm.MovimentoTableNOME.Value := dtm.MovimentoTableNOME.Value;
    dtm.MovimentoTableCPF.Value := dtm.MovimentoTableCPF.Value;
  except

  end;
end;

procedure TfrmMovimento.DBGrid1DblClick(Sender: TObject);
begin
  try
    dtm.MovimentoTableCOD_VISITANTE.Value :=
      dtm.VisitanteTableCOD_VISITANTE.Value;
    dtm.MovimentoTableNOME.Value := dtm.MovimentoTableNOME.Value;
    dtm.MovimentoTableCPF.Value := dtm.MovimentoTableCPF.Value;
  except

  end;
end;

procedure TfrmMovimento.DBGrid1TitleClick(Column: TColumn);
begin
  dtm.VisitanteTable.IndexFieldNames := Column.FieldName;
end;

procedure TfrmMovimento.DBGrid2TitleClick(Column: TColumn);
begin
  dtm.VeiculoTable.IndexFieldNames := Column.FieldName;
end;

procedure TfrmMovimento.DBGrid3TitleClick(Column: TColumn);
begin
  dtm.MovimentoTable.IndexFieldNames := Column.FieldName;
end;

procedure TfrmMovimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtm.VeiculoTable.Close;
  dtm.VisitanteTable.Close;
  dtm.MovimentoTable.Close;
end;

procedure TfrmMovimento.FormShow(Sender: TObject);
begin
  dtm.VeiculoTable.Open();
  dtm.VisitanteTable.Open();
  dtm.MovimentoTable.Open();

  BitBtn1.Enabled := True;
  SpeedButton1.Enabled := True;
end;

procedure TfrmMovimento.SpeedButton1Click(Sender: TObject);
begin
  try
    dtm.MovimentoTable.Edit;
    dtm.MovimentoTableHORA_SAIDA.Value := TimeToStr(Time);

    BitBtn1.Enabled := False;
    SpeedButton1.Enabled := False;
  except

  end;
end;

procedure TfrmMovimento.SpeedButton2Click(Sender: TObject);
begin
  try
    dtm.VeiculoTable.Locate('placa', edtPlaca.Text,
      [loPartialKey, loCaseInsensitive]);

    edtPlaca.Text := '';
  except

  end;
end;

procedure TfrmMovimento.SpeedButton3Click(Sender: TObject);
begin
  try
    dtm.MovimentoTable.Post;
    edtVisitante.Text := '';
    edtPlaca.Text := '';

    BitBtn1.Enabled := True;
    SpeedButton1.Enabled := True;
  except

  end;
end;

procedure TfrmMovimento.SpeedButton4Click(Sender: TObject);
begin
  try
    dtm.MovimentoTable.Cancel;
    BitBtn1.Enabled := True;
    SpeedButton1.Enabled := True;
  except

  end;
end;

procedure TfrmMovimento.SpeedButton5Click(Sender: TObject);
begin

  dtm.MovimentoTable.Delete;

end;

procedure TfrmMovimento.SpeedButton7Click(Sender: TObject);
begin
  try
    dtm.VisitanteTable.Locate('nome', edtVisitante.Text,
      [loPartialKey, loCaseInsensitive]);

    edtVisitante.Text := '';
  except

  end;
end;

end.
