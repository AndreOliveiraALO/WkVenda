object frmPedidoGUI: TfrmPedidoGUI
  Left = 0
  Top = 0
  Caption = 'Pedido'
  ClientHeight = 538
  ClientWidth = 803
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
    Width = 803
    Height = 97
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 799
    object Label1: TLabel
      Left = 19
      Top = 9
      Width = 44
      Height = 15
      Caption = 'Numero'
    end
    object Label2: TLabel
      Left = 19
      Top = 40
      Width = 70
      Height = 15
      Caption = 'Data emiss'#227'o'
    end
    object Label3: TLabel
      Left = 19
      Top = 69
      Width = 37
      Height = 15
      Caption = 'Cliente'
    end
    object edtNumeroPedido: TEdit
      Left = 100
      Top = 6
      Width = 82
      Height = 23
      Color = clBtnFace
      Enabled = False
      TabOrder = 0
      OnKeyPress = edtClienteCodigoKeyPress
    end
    object dtpDataEmissao: TDateTimePicker
      Left = 100
      Top = 37
      Width = 141
      Height = 23
      Date = 45596.000000000000000000
      Time = 0.940789710650278700
      Kind = dtkDateTime
      TabOrder = 2
    end
    object edtClienteCodigo: TEdit
      Left = 100
      Top = 66
      Width = 109
      Height = 23
      TabOrder = 3
      OnExit = edtClienteCodigoExit
      OnKeyPress = edtClienteCodigoKeyPress
    end
    object btCliente: TButton
      Left = 209
      Top = 66
      Width = 33
      Height = 25
      Caption = '...'
      TabOrder = 4
      OnClick = btClienteClick
    end
    object edtClienteNome: TEdit
      Left = 242
      Top = 66
      Width = 482
      Height = 23
      Color = clBtnFace
      Enabled = False
      TabOrder = 5
    end
    object btConsultaPedido: TButton
      Left = 189
      Top = 5
      Width = 121
      Height = 25
      Caption = 'Consultar Pedido'
      TabOrder = 1
      OnClick = btConsultaPedidoClick
    end
    object btCancelarPedido: TButton
      Left = 319
      Top = 5
      Width = 121
      Height = 25
      Caption = 'Cancelar Pedido'
      TabOrder = 6
      OnClick = btCancelarPedidoClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 97
    Width = 803
    Height = 441
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 799
    ExplicitHeight = 440
    object TabSheet1: TTabSheet
      Caption = 'Itens do Pedido'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 795
        Height = 52
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 791
        object Label4: TLabel
          Left = 10
          Top = 15
          Width = 43
          Height = 15
          Caption = 'Produto'
        end
        object Label5: TLabel
          Left = 397
          Top = 15
          Width = 71
          Height = 15
          Caption = 'Valor Unitario'
        end
        object Label6: TLabel
          Left = 562
          Top = 15
          Width = 62
          Height = 15
          Caption = 'Quantidade'
        end
        object edtProdutoCodigo: TEdit
          Left = 58
          Top = 12
          Width = 70
          Height = 23
          TabOrder = 0
          OnExit = edtProdutoCodigoExit
          OnKeyPress = edtClienteCodigoKeyPress
        end
        object btProduto: TButton
          Left = 120
          Top = 11
          Width = 33
          Height = 25
          Caption = '...'
          TabOrder = 1
          OnClick = btProdutoClick
        end
        object edtProdutoDescricao: TEdit
          Left = 150
          Top = 12
          Width = 241
          Height = 23
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
        end
        object edtValorUnitario: TEdit
          Left = 474
          Top = 12
          Width = 81
          Height = 23
          TabOrder = 3
          OnKeyPress = edtValorUnitarioKeyPress
        end
        object edtQuantidade: TEdit
          Left = 630
          Top = 12
          Width = 48
          Height = 23
          TabOrder = 4
          OnKeyPress = edtClienteCodigoKeyPress
        end
        object btAdicionar: TButton
          Left = 709
          Top = 11
          Width = 75
          Height = 25
          Caption = 'Adicionar'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 5
          OnClick = btAdicionarClick
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 52
        Width = 697
        Height = 285
        Align = alClient
        DataSource = DsPedidoProduto
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        OnKeyDown = DBGrid1KeyDown
        OnKeyPress = DBGrid1KeyPress
      end
      object Panel3: TPanel
        Left = 0
        Top = 370
        Width = 795
        Height = 41
        Align = alBottom
        TabOrder = 2
        ExplicitTop = 369
        ExplicitWidth = 791
        object btGravarPedido: TButton
          Left = 224
          Top = 6
          Width = 121
          Height = 25
          Caption = 'Gravar Pedido'
          TabOrder = 0
          OnClick = btGravarPedidoClick
        end
        object btCancelarOperacao: TButton
          Left = 368
          Top = 6
          Width = 121
          Height = 25
          Caption = 'Cancelar Opera'#231#227'o'
          TabOrder = 1
          OnClick = btCancelarOperacaoClick
        end
      end
      object Panel4: TPanel
        Left = 697
        Top = 52
        Width = 98
        Height = 285
        Align = alRight
        TabOrder = 3
        ExplicitLeft = 693
        ExplicitHeight = 284
      end
      object btRemover: TButton
        Left = 709
        Top = 58
        Width = 75
        Height = 25
        Caption = 'Remover'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 4
        OnClick = btRemoverClick
      end
      object Panel5: TPanel
        Left = 0
        Top = 337
        Width = 795
        Height = 33
        Align = alBottom
        TabOrder = 5
        ExplicitTop = 336
        ExplicitWidth = 791
        object Label7: TLabel
          Left = 568
          Top = 11
          Width = 115
          Height = 15
          Caption = 'Valor Total do Pedido:'
        end
        object edtValorTotalPedido: TEdit
          Left = 697
          Top = 5
          Width = 96
          Height = 23
          Color = clBtnFace
          Enabled = False
          TabOrder = 0
          OnKeyPress = edtValorUnitarioKeyPress
        end
      end
    end
  end
  object DsPedidoProduto: TDataSource
    DataSet = CdsPedidoProduto
    Left = 620
    Top = 187
  end
  object CdsPedidoProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = CdsPedidoProdutoAfterPost
    Left = 620
    Top = 243
    object CdsPedidoProdutoCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Visible = False
    end
    object CdsPedidoProdutoNUMERO_PEDIDO: TIntegerField
      DisplayLabel = 'Numero pedido'
      FieldName = 'NUMERO_PEDIDO'
      Visible = False
    end
    object CdsPedidoProdutoCODIGO_PRODUTO: TIntegerField
      DisplayLabel = 'Codigo produto'
      FieldName = 'CODIGO_PRODUTO'
    end
    object CdsPedidoProdutoDESCRICAO_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o produto'
      DisplayWidth = 50
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 100
    end
    object CdsPedidoProdutoQUANTIDADE: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
    end
    object CdsPedidoProdutoVALOR_UNITARIO: TCurrencyField
      DisplayLabel = 'Valor unitario'
      FieldName = 'VALOR_UNITARIO'
    end
    object CdsPedidoProdutoVALOR_TOTAL: TCurrencyField
      DisplayLabel = 'Valor total'
      FieldName = 'VALOR_TOTAL'
    end
  end
end
