inherited frmClienteConsultaGUI: TfrmClienteConsultaGUI
  Caption = 'Consulta clientes'
  ClientWidth = 533
  Constraints.MinHeight = 0
  Constraints.MinWidth = 0
  ExplicitWidth = 545
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 533
    ExplicitWidth = 529
    inherited edtNome: TEdit
      Left = 72
      ExplicitLeft = 72
    end
  end
  inherited Panel2: TPanel
    Width = 533
    ExplicitWidth = 529
    inherited DBGrid1: TDBGrid
      Width = 531
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
    Width = 533
    ExplicitWidth = 529
    inherited btSelcionar: TButton
      OnClick = btSelcionarClick
    end
  end
end
