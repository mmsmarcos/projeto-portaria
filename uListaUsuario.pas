unit uListaUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmListaUsuario = class(TForm)
    pnl_Top: TPanel;
    pnl_Button: TPanel;
    btnInserir: TButton;
    btnAlterar: TButton;
    btnVoltar: TButton;
    cbxItemTabela: TComboBox;
    edtPesquisa: TEdit;
    SpeedButton1: TSpeedButton;
    btnImprimir: TButton;
    DBGrid1: TDBGrid;
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnInserirClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmListaUsuario: TfrmListaUsuario;


implementation

{$R *.dfm}

uses uCadastroUsuario, uErro, uImpressao, ConsultaUsuarios, uDM;

procedure TfrmListaUsuario.btnImprimirClick(Sender: TObject);
var
  vPrint : TfrmImpressao;
begin

  vPrint := TfrmImpressao.Create(nil);
  vPrint.Show;
  vPrint.Tag := 1; //Usu�rio

end;

procedure TfrmListaUsuario.btnInserirClick(Sender: TObject);
var
  cadUser : TfrmCadastroUsuario;
begin
  caduser := TfrmCadastroUsuario.Create(Self);
  caduser.acao := 1;
  caduser.Show;
end;

procedure TfrmListaUsuario.btnAlterarClick(Sender: TObject);
var
  cadUser : TfrmCadastroUsuario;
begin
  caduser := TfrmCadastroUsuario.Create(Self);
  caduser.acao := 2;
  caduser.UserName := DM.qListaUsuarioUSERNAME.Value;
  caduser.Show;
end;

procedure TfrmListaUsuario.btnVoltarClick(Sender: TObject);
begin
Close;
frmListaUsuario := nil;
end;

procedure TfrmListaUsuario.DBGrid1TitleClick(Column: TColumn);

begin
  if DM.qListaUsuario.IndexFieldNames = Column.FieldName then
    DM.qListaUsuario.IndexFieldNames := Column.FieldName + ':D'
  else
    DM.qListaUsuario.IndexFieldNames := Column.FieldName;
end;

procedure TfrmListaUsuario.edtPesquisaChange(Sender: TObject);
var
  erro : TfrmErro;
begin
try
  with DM.qListaUsuario do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT USERNAME, NOME, EMAIL, CASE WHEN (ATIVO = 1) THEN ''Ativo'' ELSE ''Inativo'' END AS ATIVO, ULTLOGIN,  PASSWORD'+
            '  FROM TBUSUARIO WHERE '+cbxItemTabela.Text+' LIKE ''%'+edtPesquisa.Text+'%''');
    Open;
  end;

  except
    on E: Exception do
    begin
    erro := TfrmErro.Create(Self);
    erro.Memo1.Lines.Text := 'Erro ao consultar os dados de Usu�rio: '+E.Message;
    erro.ShowModal;
    end;

end;

end;

procedure TfrmListaUsuario.FormShow(Sender: TObject);
Var
  I : Integer;
begin

  DM.qListaUsuario.Active := true;

  for I := 0 to DM.qListaUsuario.FieldCount -1 do
  cbxItemTabela.Items.Add(DM.qListaUsuario.Fields[i].DisplayName);

  cbxItemTabela.ItemIndex := 0;

end;

procedure TfrmListaUsuario.SpeedButton1Click(Sender: TObject);
begin
if edtPesquisa.Text <> EmptyStr then edtPesquisa.Clear;

if DM.qListaUsuario.Active = true then
  begin
    DM.qListaUsuario.Close;
    DM.qListaUsuario.Open;
  end else DM.qListaUsuario.Open;

end;

end.
