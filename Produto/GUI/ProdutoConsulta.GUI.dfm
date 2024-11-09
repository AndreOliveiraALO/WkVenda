inherited frmProdutoConsultaGUI: TfrmProdutoConsultaGUI
  Caption = 'Consulta produtos'
  ClientHeight = 350
  ClientWidth = 530
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 530
    inherited Label1: TLabel
      Width = 51
      Caption = 'Descri'#231#227'o'
      ExplicitWidth = 51
    end
    inherited edtNome: TEdit
      Left = 76
      Anchors = [akLeft, akTop, akRight]
      ExplicitLeft = 76
    end
    inherited btPesquisar: TButton
      Anchors = [akTop, akRight]
    end
  end
  inherited Panel2: TPanel
    Width = 530
    Height = 209
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
          Width = 139
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 274
    Width = 530
    inherited btSelcionar: TButton
      OnClick = btSelcionarClick
    end
  end
end
