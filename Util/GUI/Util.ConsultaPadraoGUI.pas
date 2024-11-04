unit Util.ConsultaPadraoGUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmConsultaPadraoGUI = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtNome: TEdit;
    btPesquisar: TButton;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    btSelcionar: TButton;
    btCancelar: TButton;
    DataSource: TDataSource;
    procedure btPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    FObjeto: TObject;
    FDataSet: TDataSet;
    procedure Pesquisar(); virtual; abstract;
  public
    { Public declarations }
    constructor Create(Sender: TComponent; pObjeto: TObject); overload;
  end;

var
  frmConsultaPadraoGUI: TfrmConsultaPadraoGUI;

implementation

{$R *.dfm}

{ TfrmConsultaPadraoGUI }

procedure TfrmConsultaPadraoGUI.btPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

constructor TfrmConsultaPadraoGUI.Create(Sender: TComponent; pObjeto: TObject);
begin
  Inherited Create(Sender);
  FObjeto := pObjeto;
end;

procedure TfrmConsultaPadraoGUI.FormShow(Sender: TObject);
begin
  FDataSet := TDataSet.Create(Self);
end;

end.
