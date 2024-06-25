unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmPrincipal = class(TForm)
    pnlFundo: TPanel;
    pnlLateral: TPanel;
    pnlTopo: TPanel;
    SpeedButton1: TSpeedButton;
    btnconfiguracoes: TSpeedButton;
    btnCadastros: TSpeedButton;
    btnMovimentacoes: TSpeedButton;
    Image1: TImage;
    Label1: TLabel;
    pnl_movimentacao: TPanel;
    btn_movimentacao: TSpeedButton;
    pnl_configuracoes: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    pnl_cadastro: TPanel;
    btnPessoas: TSpeedButton;
    btnVeiculos: TSpeedButton;
    lblEmpresa: TLabel;
    btn_Reports: TSpeedButton;
    pnl_report: TPanel;
    btn_ReportMov: TSpeedButton;
    lblUsuarioLogado: TLabel;
    Label2: TLabel;
    IDEMPRESA: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnParametrosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnconfiguracoesClick(Sender: TObject);
    procedure btnCadastrosClick(Sender: TObject);
    procedure btnMovimentacoesClick(Sender: TObject);
    procedure btn_movimentacaoClick(Sender: TObject);
    procedure btn_ReportsClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure btnVeiculosClick(Sender: TObject);
    procedure btnPessoasClick(Sender: TObject);
  private
    procedure prc_retrair_menu;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uMovimentacao, uConfigurarServidor, uListaUsuario,
  System.IniFiles, uListaEmpresa, uDM, uErro, uListagemVeiculos,
  uListagemPessoa;

procedure TfrmPrincipal.FormShow(Sender: TObject);
Var
  erro : TfrmErro;
begin
  prc_retrair_menu;
  try
    DM.qUserEmpresa.Open;
     except
      on E: Exception do
      begin
        erro := TfrmErro.Create(Self);
        erro.Memo1.Lines.Text := 'Erro na '+E.Message;
        erro.ShowModal;
      end;
   end;
 lblEmpresa.Caption := DM.qUserEmpresaNOMEFANTASIA.AsString;
 lblUsuarioLogado.Caption := DM.qUserEmpresaUSERNAME.AsString;
 IDEMPRESA.Caption := IntToStr(DM.qUserEmpresaIDEMPRESA.Value);

end;

procedure TfrmPrincipal.prc_retrair_menu;
var
  i : Integer;
begin
  for I := 0 to frmPrincipal.ComponentCount -1 do
  begin
    if (frmPrincipal.Components[i] is Tpanel) and
      ((frmPrincipal.Components[i] as Tpanel).Tag = 10 ) then
      (frmPrincipal.Components[i] as Tpanel).Height := 0;
  end;
    
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
var
  i : integer;
begin

prc_retrair_menu;

  if pnlLateral.Width = 40 then
  begin
    for I := 40 to 180 do
      pnlLateral.Width := I;

  end else
      begin
        for I := 180 downto 40 do
        pnlLateral.Width := I;
      end;
end;

procedure TfrmPrincipal.SpeedButton5Click(Sender: TObject);
var
  user : TfrmListaUsuario;
begin
if not Assigned(user) then
begin
  user := TfrmListaUsuario.Create(Self);
  user.Parent      := pnlFundo;
  user.Align       := alClient;
  user.BorderStyle := bsNone;
  user.Show;
end;
end;

procedure TfrmPrincipal.SpeedButton6Click(Sender: TObject);
var
  fListaEmpresa : TfrmListaEmpresa;
Begin
if not Assigned(fListaEmpresa) then
begin
  fListaEmpresa := TfrmListaEmpresa.Create(Self);
  fListaEmpresa.Parent      := pnlFundo;
  fListaEmpresa.Align       := alClient;
  fListaEmpresa.BorderStyle := bsNone;
  fListaEmpresa.Show;
end;
end;

procedure TfrmPrincipal.btnCadastrosClick(Sender: TObject);
begin
prc_retrair_menu;
pnl_cadastro.Height := 130;
pnl_cadastro.Top := btnCadastros.Top +1;


end;

procedure TfrmPrincipal.btnconfiguracoesClick(Sender: TObject);
begin
prc_retrair_menu;
pnl_configuracoes.Height := 230;
pnl_configuracoes.Top := btnconfiguracoes.Top +1;

end;

procedure TfrmPrincipal.btnMovimentacoesClick(Sender: TObject);
begin
prc_retrair_menu;
pnl_movimentacao.Height := 90;
pnl_movimentacao.Top := btnMovimentacoes.Top +1;

end;

procedure TfrmPrincipal.btnParametrosClick(Sender: TObject);
begin
frmMovimentacao := TfrmMovimentacao.Create(Self);
frmMovimentacao.Parent := pnlFundo;
frmMovimentacao.Align := alClient;
frmMovimentacao.BorderStyle := bsNone;
frmMovimentacao.Show;
end;

procedure TfrmPrincipal.btnPessoasClick(Sender: TObject);
var
  pessoa : TfrmListagemPessoa;
begin
if not Assigned(pessoa) then
begin
  pessoa := TfrmListagemPessoa.Create(Self);
  pessoa.Parent      := pnlFundo;
  pessoa.Align       := alClient;
  pessoa.BorderStyle := bsNone;
  pessoa.Show;
  with DM.qPessoa do
  Begin
    if active = True then close;
    ParamByName('IDEMPRESA').Value := DM.qUserEmpresaIDEMPRESA.Value;
    Open;
  End;

end;
end;

procedure TfrmPrincipal.btnVeiculosClick(Sender: TObject);
var
  veiculo : TfrmListagemVeiculos;
begin
if not Assigned(veiculo) then
begin
  veiculo := TfrmListagemVeiculos.Create(Self);
  veiculo.Parent      := pnlFundo;
  veiculo.Align       := alClient;
  veiculo.BorderStyle := bsNone;
  veiculo.Show;
end;
end;

procedure TfrmPrincipal.btn_movimentacaoClick(Sender: TObject);
begin
if not Assigned(frmMovimentacao) then
begin
  frmMovimentacao             := TfrmMovimentacao.Create(Self);
  frmMovimentacao.Parent      := pnlFundo;
  frmMovimentacao.Align       := alClient;
  frmMovimentacao.BorderStyle := bsNone;
  frmMovimentacao.Show;
end;
end;

procedure TfrmPrincipal.btn_ReportsClick(Sender: TObject);
begin
prc_retrair_menu;
pnl_report.Height := 90;
pnl_report.Top := btn_Reports.Top +1;


end;





end.
