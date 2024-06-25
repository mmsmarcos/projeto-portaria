object frmListagemPessoa: TfrmListagemPessoa
  Left = 0
  Top = 0
  Caption = 'Listagem das Pessoas do Sistema'
  ClientHeight = 581
  ClientWidth = 1196
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object pnl_Top: TPanel
    Left = 0
    Top = 0
    Width = 1196
    Height = 105
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1190
    object SpeedButton1: TSpeedButton
      Left = 496
      Top = 33
      Width = 49
      Height = 41
      Hint = 'Atualizar Registro'
      Flat = True
      Glyph.Data = {
        42040000424D4204000000000000420000002800000010000000100000000100
        20000300000000040000130B0000130B000000000000000000000000FF0000FF
        0000FF0000000000000000000000000000000000000055AA000667B5006C69B5
        00C668B400F369B400F068B400CA67B4006755AA0003000000000000000069B5
        008069B5008000000000000000000000000067B3001B68B500CF69B500FF69B5
        00FF69B500FF69B500FF69B500FF69B500FF69B500BB69B4001169B4007769B5
        00FF69B500FF00000000000000006DB6000768B500CF69B500FF68B400E369B4
        00556DB6000E73B9000B68B5005368B500E569B500FF69B400E669B500FF69B5
        00FF69B500FF000000000000000069B4006D69B500FF69B400D863B800120000
        000000000000000000000000000067B3001B69B500E969B500FF69B500FF69B5
        00FF69B500FF000000000000000068B500C869B500FF67B30051000000000000
        000000000000000000000000000069B4007769B500FF69B500FF69B500FF69B5
        00FF69B500FF000000000000000068B400F369B500FF62B0000D000000000000
        0000000000000000000069B4007769B500FF69B500FF69B500FF69B500FF69B5
        00FF69B500FF000000000000000069B500FF69B500FF00000000000000000000
        0000000000000000000069B5008069B500FF69B500FF69B500FF69B500FF69B5
        00FF69B500FF0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000069B500FF69B500FF69B500FF69B500FF69B500FF69B500FF68B4
        007F000000000000000000000000000000000000000069B500FF69B500FF0000
        00000000000069B500FF69B500FF69B500FF69B500FF69B500FF69B500FF69B5
        0088000000000000000000000000000000006DB6000E69B500FF69B500F20000
        00000000000069B500FF69B500FF69B500FF69B500FF69B500FF69B500880000
        00000000000000000000000000000000000069B4005569B500FF69B400C70000
        00000000000069B500FF69B500FF69B500FF69B500FF69B500EB66B700190000
        000000000000000000000000000063B8001268B400E369B500FF68B5006B0000
        00000000000069B500FF69B500FF69B500FF68B400EA69B500FF69B500E467B3
        005173B9000B62B0000D67B3005169B400D869B500FF69B400CE55AA00060000
        00000000000069B500FF69B500FF69B500886BAE001369B500BF69B500FF69B5
        00FF69B500FF69B500FF69B500FF69B500FF68B500CF67B3001B000000000000
        00000000000069B5008069B5008800000000000000007FBF000469B4006A68B5
        00CD68B400F168B400F468B500C867B5006C55AA000600000000000000000000
        000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object cbxItemTabela: TComboBox
      Left = 32
      Top = 42
      Width = 153
      Height = 23
      TabOrder = 0
    end
    object edtPesquisa: TEdit
      Left = 191
      Top = 42
      Width = 266
      Height = 23
      TabOrder = 1
      OnChange = edtPesquisaChange
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 105
    Width = 1196
    Height = 369
    Align = alClient
    DataSource = DM.dsPessoa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDEMPRESA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDPESSOA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDTIPO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RG'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDVEICULO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLACA'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESPONSAVEL'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATIVO'
        Visible = True
      end>
  end
  object pnl_Button: TPanel
    Left = 0
    Top = 474
    Width = 1196
    Height = 107
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 465
    ExplicitWidth = 1190
    object btnInserir: TButton
      Tag = 1
      Left = 191
      Top = 56
      Width = 75
      Height = 25
      Caption = '&Inserir'
      TabOrder = 0
      OnClick = btnInserirClick
    end
    object btnAlterar: TButton
      Tag = 2
      Left = 304
      Top = 56
      Width = 75
      Height = 25
      Caption = '&Alterar'
      TabOrder = 1
    end
    object btnVoltar: TButton
      Tag = 5
      Left = 517
      Top = 56
      Width = 75
      Height = 25
      Caption = '&Voltar'
      TabOrder = 2
      OnClick = btnVoltarClick
    end
    object btnImprimir: TButton
      Tag = 4
      Left = 413
      Top = 56
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 3
    end
  end
end
