object frmConsultaPadraoGUI: TfrmConsultaPadraoGUI
  Left = 0
  Top = 0
  Caption = 'frmConsultaPadraoGUI'
  ClientHeight = 350
  ClientWidth = 530
  Color = clBtnFace
  Constraints.MinHeight = 388
  Constraints.MinWidth = 542
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 530
    Height = 65
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 526
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object edtNome: TEdit
      Left = 64
      Top = 21
      Width = 345
      Height = 23
      TabOrder = 0
    end
    object btPesquisar: TButton
      Left = 432
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btPesquisarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 530
    Height = 209
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 526
    ExplicitHeight = 208
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 528
      Height = 207
      Align = alClient
      DataSource = DataSource
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 274
    Width = 530
    Height = 76
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 273
    ExplicitWidth = 526
    object btSelcionar: TButton
      Left = 136
      Top = 24
      Width = 89
      Height = 33
      Caption = 'Selecionar'
      TabOrder = 0
    end
    object btCancelar: TButton
      Left = 272
      Top = 24
      Width = 89
      Height = 33
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DataSource: TDataSource
    Left = 456
    Top = 89
  end
end
