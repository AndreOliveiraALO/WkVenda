inherited frmProdutoConsultaGUI: TfrmProdutoConsultaGUI
  Caption = 'Consulta produtos'
  TextHeight = 15
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Width = 51
      Caption = 'Descri'#231#227'o'
      ExplicitWidth = 51
    end
    inherited edtNome: TEdit
      Left = 76
      ExplicitLeft = 76
    end
  end
  inherited Panel2: TPanel
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'Codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECOVENDA'
          Title.Caption = 'Pre'#231'o de venda'
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    inherited btSelcionar: TButton
      OnClick = btSelcionarClick
    end
  end
end
