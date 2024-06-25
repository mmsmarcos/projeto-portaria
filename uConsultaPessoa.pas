unit uConsultaPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmConsultaPessoa = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    cbxItemTabela: TComboBox;
    edtPesquisa: TEdit;
    SpeedButton1: TSpeedButton;
    qConsultaPessoa: TFDQuery;
    dsConsultaPessoa: TDataSource;
    qConsultaPessoaIDEMPRESA: TIntegerField;
    qConsultaPessoaIDPESSOA: TIntegerField;
    qConsultaPessoaIDTIPO: TIntegerField;
    qConsultaPessoaDESCRICAO: TStringField;
    qConsultaPessoaNOME: TStringField;
    qConsultaPessoaCPF: TStringField;
    qConsultaPessoaRG: TStringField;
    qConsultaPessoaIDVEICULO: TIntegerField;
    qConsultaPessoaPLACA: TStringField;
    qConsultaPessoaRESPONSAVEL: TStringField;
    qConsultaPessoaEMAIL: TStringField;
    qConsultaPessoaTELEFONE: TStringField;
    qConsultaPessoaATIVO: TSmallintField;
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaPessoa: TfrmConsultaPessoa;

implementation

{$R *.dfm}

uses uDM, uPrincipal, uErro, uMovimentacao, uCadastroPessoa;

procedure TfrmConsultaPessoa.DBGrid1DblClick(Sender: TObject);
Var
  i, x : Integer;
begin
  x := 0;
  if MessageDlg('Deseja incluir: '+qConsultaPessoaNOME.AsString,
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin

    i := frmMovimentacao.memoPessoa.Lines.Count;

    if i = 0 then
    begin
      frmMovimentacao.memoPessoa.Lines.Add(qConsultaPessoaNOME.Value);
      frmMovimentacao.Memo2.Lines.Add(IntToStr(qConsultaPessoaIDPESSOA.Value));
    end else
          begin
          for i := 0 to frmMovimentacao.memoPessoa.Lines.Count do
            begin
              if frmMovimentacao.memoPessoa.Lines[i] = qConsultaPessoaNOME.Value then
              begin
                ShowMessage('Pessoa j� adicionada!');
                x := 1;
              end;
            end;
            if x = 0 then
            begin
              frmMovimentacao.memoPessoa.Lines.Add(qConsultaPessoaNOME.Value);
              frmMovimentacao.Memo2.Lines.Add(IntToStr(qConsultaPessoaIDPESSOA.Value));
            end;
          end;



  end else
      begin
        Close;
      end;
end;

procedure TfrmConsultaPessoa.edtPesquisaChange(Sender: TObject);
var
  erro : TfrmErro;
begin
try
  with qConsultaPessoa do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT t.IDEMPRESA, t.IDPESSOA , t.IDTIPO , t2.DESCRICAO , t.nome,t.CPF,t.RG ,t.IDVEICULO , t3.PLACA, t.RESPONSAVEL , t.EMAIL , t.TELEFONE ,t.ativo '+
            ' FROM TBPESSOA t JOIN TBTIPOPESSOA t2 ON t.IDEMPRESA = t2.IDEMPRESA AND t.IDTIPO = t2.IDTIPO '+
            '      LEFT OUTER JOIN TBVEICULOS t3 ON t.IDEMPRESA = t3.IDEMPRESA AND t.IDVEICULO = t3.IDVEICULO '+
            ' WHERE  t.IDEMPRESA = '+frmPrincipal.IDEMPRESA.Caption+' AND '+cbxItemTabela.Text+' LIKE ''%'+edtPesquisa.Text+'%''');
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

procedure TfrmConsultaPessoa.FormShow(Sender: TObject);
Var
  I : Integer;
begin
  if qConsultaPessoa.Active = False then
  begin
    qConsultaPessoa.ParamByName('IDEMPRESA').Value := frmPrincipal.IDEMPRESA.Caption;
    qConsultaPessoa.Open;
    for I := 0 to qConsultaPessoa.FieldCount -1 do
    cbxItemTabela.Items.Add(qConsultaPessoa.Fields[i].DisplayName);
    cbxItemTabela.ItemIndex := 0;
  end else
        begin
          qConsultaPessoa.Close;
          qConsultaPessoa.ParamByName('IDEMPRESA').Value := frmPrincipal.IDEMPRESA.Caption;
          qConsultaPessoa.Open;
          for I := 0 to qConsultaPessoa.FieldCount -1 do
          cbxItemTabela.Items.Add(qConsultaPessoa.Fields[i].DisplayName);
          cbxItemTabela.ItemIndex := 0;
        end;
end;

procedure TfrmConsultaPessoa.SpeedButton1Click(Sender: TObject);
var
  pessoa : TfrmCadastroPessoa;
begin
  pessoa := TfrmCadastroPessoa.Create(Self);
  pessoa.ShowModal;
end;

end.
