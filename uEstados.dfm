object frmEstados: TfrmEstados
  Left = 0
  Top = 0
  Caption = 'Estados do Brasil'
  ClientHeight = 499
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 603
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 597
    object edtPesquisa: TEdit
      Left = 183
      Top = 36
      Width = 218
      Height = 23
      TabOrder = 0
      OnChange = edtPesquisaChange
    end
    object cbxItemTabela: TComboBox
      Left = 32
      Top = 36
      Width = 145
      Height = 23
      TabOrder = 1
      Text = 'cbxItemTabela'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 603
    Height = 402
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 597
    ExplicitHeight = 393
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 601
      Height = 400
      Align = alClient
      DataSource = DM.dsEstados
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODETD'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 500
          Visible = True
        end>
    end
  end
end
