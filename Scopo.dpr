program Scopo;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uLogin in 'uLogin.pas' {frmLogin},
  uMovimentacao in 'uMovimentacao.pas' {frmMovimentacao},
  uListaUsuario in 'uListaUsuario.pas' {frmListaUsuario},
  uFuncoes in 'uFuncoes.pas',
  uCadastroUsuario in 'uCadastroUsuario.pas' {frmCadastroUsuario},
  uAvisos in 'uAvisos.pas' {frmAvisos},
  uErro in 'uErro.pas' {frmErro},
  uOk in 'uOk.pas' {frmOk},
  uImpressao in 'uImpressao.pas' {frmImpressao},
  uListaEmpresa in 'uListaEmpresa.pas' {frmListaEmpresa},
  uDM in 'uDM.pas' {TDataModule: TDataModule},
  uCadastroEmpresa in 'uCadastroEmpresa.pas' {frmCadastroEmpresa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  frmLogin := TfrmLogin.Create(nil);
  frmLogin.ShowModal;

  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TDM, DM);
  frmLogin.Hide;
  frmLogin.Free;

  Application.Run;
end.