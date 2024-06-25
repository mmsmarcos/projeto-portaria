unit uCadastroVeiculos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmCadastroVeiculos = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    btnConfirmar: TPanel;
    btnCancelar: TPanel;
    edtPlaca: TEdit;
    Label2: TLabel;
    edtCertificado: TEdit;
    Label3: TLabel;
    edtUFVeiculo: TEdit;
    edtUFVeiculoDesc: TEdit;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    edtMarca: TEdit;
    Label5: TLabel;
    edtModelo: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtCor: TEdit;
    Label8: TLabel;
    edtAnoFab: TEdit;
    Label9: TLabel;
    edtAnoModelo: TEdit;
    chkAtivo: TCheckBox;
    edtRegistroANTT: TEdit;
    Label10: TLabel;
    edtTaraKG: TEdit;
    Label11: TLabel;
    edtRenavam: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    edtCapacidadeKG: TEdit;
    dbcbxTipoRodado: TDBLookupComboBox;
    Label14: TLabel;
    qCadastraVeiculo: TFDQuery;
    qTipoRodado: TFDQuery;
    dsTipoRodado: TDataSource;
    qTipoRodadoIDEMPRESA: TIntegerField;
    qTipoRodadoIDRODADO: TIntegerField;
    qTipoRodadoDESCRICAO: TStringField;
    qVeiculoRodado: TFDQuery;
    qVeiculoRodadoIDVEICULO: TIntegerField;
    qVeiculoRodadoIDRODADO: TIntegerField;
    qVeiculoRodadoDESCRICAO: TStringField;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtTaraKGKeyPress(Sender: TObject; var Key: Char);
    procedure edtCapacidadeKGKeyPress(Sender: TObject; var Key: Char);
    procedure edtAnoFabKeyPress(Sender: TObject; var Key: Char);
    procedure edtAnoModeloKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroVeiculos: TfrmCadastroVeiculos;

implementation

{$R *.dfm}

uses uDM, uErro, uEstados, uPrincipal, uOk;

procedure TfrmCadastroVeiculos.btnCancelarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadastroVeiculos.btnConfirmarClick(Sender: TObject);
Var
  erro : TfrmErro;
  formPrincipal : TfrmPrincipal;
  OK : TfrmOk;
  ativo, vAnoFab, vAnoMod, vTaraKg, vCapKg, i : Integer;
begin
if Tag = 1 then
Begin
if ((edtPlaca.Text = EmptyStr) or (dbcbxTipoRodado.Text = EmptyStr) or (edtUFVeiculo.Text = EmptyStr)) then
Begin
  erro := TfrmErro.Create(Self);
  erro.Memo1.Lines.Text := 'O campo obrigat�rios n�o preenchidos! ';
  erro.ShowModal;
End else
Begin
if chkAtivo.Checked = True then ativo := 1 else ativo := 0;
  Try
  with qCadastraVeiculo do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO TBVEICULOS (IDEMPRESA, CODETD, PLACA, CERTIFICADO, MARCA, MODELO, COR, ANOFAB, ANOMOD, RNTC, RENAVAN, TARAKG, CAPACIDADEKG, IDTIPORODADO, ATIVO, RECCREATEDBY, RECCREATEDON)'+
            ' VALUES (:IDEMPRESA, :CODETD, :PLACA, :CERTIFICADO, :MARCA, :MODELO, :COR, :ANOFAB, :ANOMOD, :RNTC, :RENAVAN, :TARAKG, :CAPACIDADEKG, :IDTIPORODADO, :ATIVO, :RECCREATEDBY, :RECCREATEDON)');


          Begin

           if edtAnoFab.Text = EmptyStr then vAnoFab := 0 else vAnoFab := StrToInt(edtAnoFab.Text);
           if edtAnoModelo.Text = EmptyStr then vAnoMod := 0 else vAnoMod := StrToInt(edtAnoModelo.Text);
           if edtTaraKG.Text = EmptyStr then vTaraKg := 0 else vTaraKg := StrToInt(edtTaraKG.Text);
           if edtCapacidadeKG.Text = EmptyStr then vCapKg := 0 else vCapKg := StrToInt(edtCapacidadeKG.Text);

           ParamByName('IDEMPRESA').Value   := DM.qUserEmpresaIDEMPRESA.Value;
           ParamByName('CODETD').Value      := edtUFVeiculo.Text;
           ParamByName('PLACA').Value       := edtPlaca.Text;
           ParamByName('CERTIFICADO').Value := edtCertificado.Text;
           ParamByName('MARCA').Value       := edtMarca.Text;
           ParamByName('MODELO').Value      := edtModelo.Text;
           ParamByName('COR').Value         := edtCor.Text;
           ParamByName('ANOFAB').Value      := vAnoFab;
           ParamByName('ANOMOD').Value      := vAnoMod;
           ParamByName('RNTC').Value        := edtRegistroANTT.Text;
           ParamByName('RENAVAN').Value     := edtRenavam.Text;
           ParamByName('TARAKG').Value      := vTaraKg;
           ParamByName('CAPACIDADEKG').Value:= vCapKg;
           ParamByName('IDTIPORODADO').Value:= qTipoRodadoIDRODADO.Value;
           ParamByName('ATIVO').Value       := ativo;
           ParamByName('RECCREATEDBY').Value:= DM.qUserEmpresaUSERNAME.Value;
           ParamByName('RECCREATEDON').Value:= Now;
           ExecSQL;
           OK := TfrmOk.Create(Self);
           OK.ShowModal;
           DM.qVeiculos.Close;
           DM.qVeiculos.Open;

             //Limpa os Edits
          for i := 0 to ComponentCount -1 do
            begin
              if (Components[i] is TEdit) then
                (Components[i] as TEdit).Clear;
            end;
          End;
  End;


  except
    on E: Exception do
    begin
      erro := TfrmErro.Create(Self);
      erro.Memo1.Lines.Text := 'Erro ao salvar o Ve�culo. '+E.Message;
      erro.ShowModal;
    end;
  end;
End;
end else
    Begin
      //Altera��o
      Try

        with qCadastraVeiculo do
          begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE TBVEICULOS SET CODETD = :CODETD, TARAKG = :TARAKG, CAPACIDADEKG = :CAPACIDADEKG, IDTIPORODADO = :IDTIPORODADO, ATIVO = :ATIVO, RECMODIFIEDBY = :RECMODIFIEDBY, RECMODIFIEDON = :RECMODIFIEDON '+
                  ' WHERE IDEMPRESA = '+IntToStr(DM.qVeiculosIDEMPRESA.Value)+' AND IDVEICULO = '+IntToStr(DM.qVeiculosIDVEICULO.Value));
          end;






      except
      on E: Exception do
      begin
        erro := TfrmErro.Create(Self);
        erro.Memo1.Lines.Text := 'Erro ao salvar o Ve�culo. '+E.Message;
        erro.ShowModal;
      end;
    end;




    End;
end;

procedure TfrmCadastroVeiculos.edtAnoFabKeyPress(Sender: TObject;
  var Key: Char);
begin
If not( key in['0'..'9',#08] ) then
  key:=#0;
end;

procedure TfrmCadastroVeiculos.edtAnoModeloKeyPress(Sender: TObject;
  var Key: Char);
begin
If not( key in['0'..'9',#08] ) then
  key:=#0;
end;

procedure TfrmCadastroVeiculos.edtCapacidadeKGKeyPress(Sender: TObject;
  var Key: Char);
begin
If not( key in['0'..'9',#08] ) then
  key:=#0;
end;

procedure TfrmCadastroVeiculos.edtTaraKGKeyPress(Sender: TObject;
  var Key: Char);
begin
If not( key in['0'..'9',#08] ) then
  key:=#0;
end;

procedure TfrmCadastroVeiculos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := CaFree;
end;

procedure TfrmCadastroVeiculos.FormShow(Sender: TObject);
Var
  erro : TfrmErro;
begin

  if Tag = 1 then
  Begin
  Try
  qTipoRodado.ParamByName('IDEMPRESA').AsInteger := DM.qUserEmpresaIDEMPRESA.Value;
  qTipoRodado.Open;
  except
    on E: Exception do
    begin
      erro := TfrmErro.Create(Self);
      erro.Memo1.Lines.Text := 'Erro ao recuperar os Tipos Rodados. '+E.Message;
      erro.ShowModal;
    end;
  end;
  end else
      Begin
      edtPlaca.Enabled               := False;
      edtAnoFab.Enabled              := False;
      edtAnoModelo.Enabled           := False;
      edtCertificado.Enabled         := False;
      edtMarca.Enabled               := False;
      edtModelo.Enabled              := False;
      edtCor.Enabled                 := False;
      edtRenavam.Enabled             := False;

      edtPlaca.Text                  := DM.qVeiculosPLACA.Value;
      edtUFVeiculo.Text              := DM.qVeiculosCODETD.Value;
      edtUFVeiculoDesc.Text          := DM.qVeiculosESTADO.Value;
      edtCertificado.Text            := DM.qVeiculosCERTIFICADO.Value;
      edtMarca.Text                  := DM.qVeiculosMARCA.Value;
      edtModelo.Text                 := DM.qVeiculosMODELO.Value;
      edtCor.Text                    := DM.qVeiculosCOR.Value;
      edtAnoFab.Text                 := IntToStr(DM.qVeiculosANOFAB.Value);
      edtAnoModelo.Text              := IntToStr(DM.qVeiculosANOMOD.Value);
      edtRegistroANTT.Text           := DM.qVeiculosRNTC.Value;
      edtRenavam.Text                := DM.qVeiculosRENAVAN.Value;
      edtTaraKG.Text                 := IntToStr(DM.qVeiculosTARAKG.Value);
      edtCapacidadeKG.Text           := IntToStr(DM.qVeiculosCAPACIDADEKG.Value);
      qVeiculoRodado.ParamByName('IDEMPRESA').AsInteger := DM.qUserEmpresaIDEMPRESA.Value;
      qVeiculoRodado.ParamByName('IDVEICULO').AsInteger := DM.qVeiculosIDVEICULO.Value;
      qVeiculoRodado.Open;
      dbcbxTipoRodado.KeyField := qVeiculoRodadoDESCRICAO.Value;
      if DM.qVeiculosATIVO.Value = 1 then chkAtivo.Checked := True else chkAtivo.Checked
      End;

end;

procedure TfrmCadastroVeiculos.SpeedButton1Click(Sender: TObject);
Var
  estados : TfrmEstados;
begin
  estados := TfrmEstados.Create(Self);
  estados.Show;
  estados.Tag := 1;
end;

end.
