inherited frmClienteConsultaGUI: TfrmClienteConsultaGUI
  Caption = 'Consulta clientes'
  ClientHeight = 350
  ClientWidth = 530
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 530
    ExplicitWidth = 529
    inherited edtNome: TEdit
      Left = 72
      Anchors = [akLeft, akTop, akRight]
      ExplicitLeft = 72
    end
    inherited btPesquisar: TButton
      Anchors = [akTop, akRight]
    end
  end
  inherited Panel2: TPanel
    Width = 530
    Height = 209
    ExplicitWidth = 529
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
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CIDADE'
          Title.Caption = 'Cidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF'
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 274
    Width = 530
    ExplicitWidth = 529
    inherited btSelcionar: TButton
      OnClick = btSelcionarClick
    end
  end
end
