unit ClienteConsulta.GUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Util.ConsultaPadraoGUI, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Cliente.Controlador, Cliente.Dominio;

type
  TfrmClienteConsultaGUI = class(TfrmConsultaPadraoGUI)
    procedure btSelcionarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar(); override;

  public
    { Public declarations }

  end;

var
  frmClienteConsultaGUI: TfrmClienteConsultaGUI;

implementation

{$R *.dfm}

procedure TfrmClienteConsultaGUI.btSelcionarClick(Sender: TObject);
begin
  inherited;
  if not Assigned(DataSource.DataSet) then
    MessageDlg('É necessario pesquisar primeiro um item antes de selecionar!', TMsgDlgType.mtWarning, [mbOK], 0)
  else if DataSource.DataSet.RecordCount = 0 then
    MessageDlg('Não item a ser selecionado!', TMsgDlgType.mtWarning, [mbOK], 0)
  else
  begin
    TClienteDominio(FObjeto).PopularObjeto(DataSource.DataSet);
    ModalResult := mrOk;
  end;
end;

procedure TfrmClienteConsultaGUI.Pesquisar;
var
  lClienteControlador: TClienteControlador;
begin
  inherited;
  lClienteControlador := TClienteControlador.Create;
  try
    lClienteControlador.Consultar(edtNome.Text, FDataSet);
    DataSource.DataSet := FDataSet;
  finally
    FreeAndNil(lClienteControlador);
  end;
end;

end.
