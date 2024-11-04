unit PedidoConsulta.GUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Pedido.Dominio, Util.Enumerados;

type
  TfrmPedidoConsultaGUI = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtNumeroPedido: TEdit;
    btConfirmar: TButton;
    btCancelar: TButton;
    procedure edtNumeroPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure btConfirmarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FPedido: TPedidoDominio;
    FOperacao: TOperacaoTelaPedido;
    function VerificaCampos(): boolean;
  public
    { Public declarations }
    constructor Create(Sender: TComponent; pPedido: TPedidoDominio; pOperacao: TOperacaoTelaPedido); overload;
  end;

var
  frmPedidoConsultaGUI: TfrmPedidoConsultaGUI;

implementation

{$R *.dfm}

procedure TfrmPedidoConsultaGUI.btCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPedidoConsultaGUI.btConfirmarClick(Sender: TObject);
begin
  if VerificaCampos then
  begin
    FPedido.NumeroPedido := StrToInt(edtNumeroPedido.Text);
    ModalResult := mrOk;
  end;
end;

constructor TfrmPedidoConsultaGUI.Create(Sender: TComponent;
  pPedido: TPedidoDominio; pOperacao: TOperacaoTelaPedido);
begin
  inherited Create(Sender);
  FPedido := pPedido;
  FOperacao := pOperacao;
end;

procedure TfrmPedidoConsultaGUI.edtNumeroPedidoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8, #127])) then
    key := #0;
end;

procedure TfrmPedidoConsultaGUI.FormShow(Sender: TObject);
begin
  if FOperacao = otpConsulta then
    self.Caption := 'Consulta pedido'
  else
    self.Caption := 'Cancelamento de pedido';
end;

function TfrmPedidoConsultaGUI.VerificaCampos: boolean;
begin
  Result := True;
  if edtNumeroPedido.Text = '' then
  begin
    MessageDlg('Numero do Pedido não informado! Preencha. ', TMsgDlgType.mtWarning, [mbOK], 0);
    edtNumeroPedido.SetFocus;
    Result := false;
  end
end;

end.
