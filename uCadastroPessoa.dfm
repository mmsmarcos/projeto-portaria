object frmCadastroPessoa: TfrmCadastroPessoa
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pessoa'
  ClientHeight = 478
  ClientWidth = 835
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 835
    Height = 478
    Cursor = crArrow
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitWidth = 829
    ExplicitHeight = 469
    object Label1: TLabel
      Left = 35
      Top = 20
      Width = 188
      Height = 23
      Caption = 'CADASTRO DE PESSOA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 40
      Top = 72
      Width = 34
      Height = 15
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 40
      Top = 132
      Width = 21
      Height = 15
      Caption = 'CPF'
    end
    object Label4: TLabel
      Left = 312
      Top = 75
      Width = 64
      Height = 15
      Caption = 'Tipo Pessoa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 542
      Top = 96
      Width = 23
      Height = 22
      Caption = '...'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object Label5: TLabel
      Left = 312
      Top = 135
      Width = 118
      Height = 15
      Caption = 'Registro de Identidade'
    end
    object Label6: TLabel
      Left = 40
      Top = 191
      Width = 34
      Height = 15
      Caption = 'E-mail'
    end
    object Label7: TLabel
      Left = 312
      Top = 191
      Width = 65
      Height = 15
      Caption = 'Respons'#225'vel'
    end
    object Label8: TLabel
      Left = 40
      Top = 246
      Width = 44
      Height = 15
      Caption = 'Telefone'
    end
    object SpeedButton2: TSpeedButton
      Left = 542
      Top = 267
      Width = 23
      Height = 22
      Caption = '...'
      Flat = True
      OnClick = SpeedButton2Click
    end
    object Label9: TLabel
      Left = 233
      Top = 246
      Width = 40
      Height = 15
      Caption = 'Ve'#237'culo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 25
      Top = 57
      Width = 782
      Height = 2
      Align = alCustom
      TabOrder = 9
    end
    object btnConfirmar: TPanel
      Left = 126
      Top = 386
      Width = 161
      Height = 41
      Cursor = crHandPoint
      BevelOuter = bvNone
      Caption = 'Confirmar'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 7
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TPanel
      Left = 293
      Top = 386
      Width = 161
      Height = 41
      Cursor = crHandPoint
      BevelOuter = bvNone
      Caption = 'Sair'
      Color = clActiveBorder
      ParentBackground = False
      TabOrder = 8
      OnClick = btnCancelarClick
    end
    object edtNome: TEdit
      Left = 40
      Top = 96
      Width = 257
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object edtCPF: TEdit
      Left = 40
      Top = 156
      Width = 257
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edtTipo: TEdit
      Left = 312
      Top = 96
      Width = 65
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object edtTipoDesc: TEdit
      Left = 383
      Top = 96
      Width = 153
      Height = 23
      Enabled = False
      TabOrder = 10
    end
    object edtRG: TEdit
      Left = 312
      Top = 156
      Width = 253
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object edtEmail: TEdit
      Left = 40
      Top = 212
      Width = 257
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 4
    end
    object edtResponsavel: TEdit
      Left = 312
      Top = 212
      Width = 253
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 5
    end
    object edtTelefone: TEdit
      Left = 40
      Top = 267
      Width = 186
      Height = 23
      TabOrder = 6
    end
    object chkAtivo: TCheckBox
      Left = 40
      Top = 320
      Width = 97
      Height = 17
      Caption = 'Ativo'
      Checked = True
      State = cbChecked
      TabOrder = 11
    end
    object edtVeiculo: TEdit
      Left = 232
      Top = 267
      Width = 65
      Height = 23
      Enabled = False
      TabOrder = 12
    end
    object edtVeiculoDesc: TEdit
      Left = 312
      Top = 267
      Width = 224
      Height = 23
      Enabled = False
      TabOrder = 13
    end
    object Panel3: TPanel
      Left = 608
      Top = 86
      Width = 185
      Height = 131
      BevelInner = bvRaised
      BevelKind = bkFlat
      BevelOuter = bvLowered
      Caption = 'Foto'
      TabOrder = 14
    end
  end
  object qCadastraPessoa: TFDQuery
    Connection = DM.fdConexao
    SQL.Strings = (
      'select * from tbpessoa where idempresa=-1')
    Left = 456
    Top = 328
  end
end
