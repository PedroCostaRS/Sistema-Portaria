program SistemaPortaria;

uses
  Vcl.Forms,
  Portaria in 'Portaria.pas' {frmPrincipal},
  uCadastroDeVisitante in 'uCadastroDeVisitante.pas' {frmConsultaVisitante},
  uDataModule in 'uDataModule.pas' {dtm: TDataModule},
  uMovimento in 'uMovimento.pas' {frmMovimento},
  uCadastraVeiculo in 'uCadastraVeiculo.pas' {frmCadastroDeVeiculo},
  uSobre in 'uSobre.pas' {frmSobre};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmConsultaVisitante, frmConsultaVisitante);
  Application.CreateForm(Tdtm, dtm);
  Application.CreateForm(TfrmMovimento, frmMovimento);
  Application.CreateForm(TfrmCadastroDeVeiculo, frmCadastroDeVeiculo);
  Application.CreateForm(TfrmSobre, frmSobre);
  //Application.CreateForm(TfrmCadastroVeículo, frmCadastroVeículo);
  Application.Run;
end.
