object frmPedidoConsultaGUI: TfrmPedidoConsultaGUI
  Left = 0
  Top = 0
  Caption = 'Consulta pedido'
  ClientHeight = 113
  ClientWidth = 278
  Color = clBtnFace
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
    Width = 278
    Height = 113
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 274
    ExplicitHeight = 112
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 101
      Height = 15
      Caption = 'Numero do Pedido'
    end
    object edtNumeroPedido: TEdit
      Left = 123
      Top = 21
      Width = 134
      Height = 23
      TabOrder = 0
      OnKeyPress = edtNumeroPedidoKeyPress
    end
    object btConfirmar: TButton
      Left = 42
      Top = 71
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 1
      OnClick = btConfirmarClick
    end
    object btCancelar: TButton
      Left = 146
      Top = 71
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btCancelarClick
    end
  end
end
