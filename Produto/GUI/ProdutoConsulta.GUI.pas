unit ProdutoConsulta.GUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Util.ConsultaPadraoGUI, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Produto.Dominio,
  Produto.Controlador;

type
  TfrmProdutoConsultaGUI = class(TfrmConsultaPadraoGUI)
    procedure btSelcionarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar(); override;
  public
    { Public declarations }
  end;

var
  frmProdutoConsultaGUI: TfrmProdutoConsultaGUI;

implementation

{$R *.dfm}

procedure TfrmProdutoConsultaGUI.btSelcionarClick(Sender: TObject);
begin
  inherited;
  if not Assigned(DataSource.DataSet) then
    MessageDlg('É necessario pesquisar primeiro um item antes de selecionar!', TMsgDlgType.mtWarning, [mbOK], 0)
  else if DataSource.DataSet.RecordCount = 0 then
    MessageDlg('Não item a ser selecionado!', TMsgDlgType.mtWarning, [mbOK], 0)
  else
  begin
    TProdutoDominio(FObjeto).PopularObjeto(DataSource.DataSet);
    ModalResult := mrOk;
  end;
end;

procedure TfrmProdutoConsultaGUI.Pesquisar;
var
  lProdutoControlador: TProdutoControlador;
begin
  inherited;
  lProdutoControlador := TProdutoControlador.Create;
  try
    lProdutoControlador.Consultar(edtNome.Text, FDataSet);
    DataSource.DataSet := FDataSet;
  finally
    FreeAndNil(lProdutoControlador);
  end;
end;

end.
