unit uTipoPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmTipoPessoa = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    cbxItemTabela: TComboBox;
    edtPesquisa: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPesquisaChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoPessoa: TfrmTipoPessoa;

implementation

{$R *.dfm}

uses uDM, uErro, uCadastroPessoa, uPrincipal;

procedure TfrmTipoPessoa.DBGrid1DblClick(Sender: TObject);
begin
  if Tag = 1 then
    begin
      if Assigned(frmCadastroPessoa) then
      frmCadastroPessoa.edtTipo.Text := IntToStr(DM.qTipoPessoaIDTIPO.Value);
      frmCadastroPessoa.edtTipoDesc.Text := DM.qTipoPessoaDESCRICAO.Value;
      Close;
    end;
end;

procedure TfrmTipoPessoa.edtPesquisaChange(Sender: TObject);
var
  erro : TfrmErro;
begin
try
  with DM.qTipoPessoa do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT IDTIPO, DESCRICAO, ATIVO FROM TBTIPOPESSOA WHERE '+cbxItemTabela.Text+' LIKE ''%'+edtPesquisa.Text+'%'' AND IDEMPRESA = '+frmPrincipal.IDEMPRESA.Caption);
    Open;
  end;

  except
    on E: Exception do
    begin
    erro := TfrmErro.Create(Self);
    erro.Memo1.Lines.Text := 'Erro ao consultar os dados de Estados: '+E.Message;
    erro.ShowModal;
    end;
end;
end;

procedure TfrmTipoPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmTipoPessoa.FormShow(Sender: TObject);
Var
  I : Integer;
begin
  DM.qTipoPessoa.ParamByName('IDEMPRESA').Value := frmPrincipal.IDEMPRESA.Caption;
  DM.qTipoPessoa.Open;

  for I := 0 to DM.qTipoPessoa.FieldCount -1 do
  cbxItemTabela.Items.Add(DM.qTipoPessoa.Fields[i].DisplayName);

  cbxItemTabela.ItemIndex := 0;
end;

end.
