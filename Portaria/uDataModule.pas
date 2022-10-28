unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef;

type
  Tdtm = class(TDataModule)
    PortariaConnection: TFDConnection;
    VeiculoTable: TFDQuery;
    VeiculoTableCOD_VEICULO: TIntegerField;
    VeiculoTableMARCA: TStringField;
    VeiculoTableMODELO: TStringField;
    VeiculoTablePLACA: TStringField;
    MovimentoTable: TFDQuery;
    VisitanteTable: TFDQuery;
    VisitanteTableCOD_VISITANTE: TIntegerField;
    VisitanteTableNOME: TStringField;
    VisitanteTableDATA_NASCIMENTO: TStringField;
    VisitanteTableCPF: TStringField;
    MovimentoTableID_MOVIMENTO: TIntegerField;
    MovimentoTableCOD_VISITANTE: TIntegerField;
    MovimentoTableNOME: TStringField;
    MovimentoTableCPF: TStringField;
    MovimentoTableCOD_VEICULO: TIntegerField;
    MovimentoTableMARCA: TStringField;
    MovimentoTableMODELO: TStringField;
    MovimentoTablePLACA: TStringField;
    MovimentoTableHORA_ENTRADA: TStringField;
    MovimentoTableHORA_SAIDA: TStringField;
    MovimentoTableMOTIVO: TStringField;
    MovimentoTableDATA: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtm: Tdtm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
