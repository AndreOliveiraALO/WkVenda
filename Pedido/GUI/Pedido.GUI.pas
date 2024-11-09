unit Pedido.GUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Util.ConexaoBanco, ClienteConsulta.GUI, Cliente.Dominio, Cliente.Controlador,
  Produto.Controlador, Produto.Dominio, System.UITypes, ProdutoConsulta.GUI,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Pedido.Controlador,
  Pedido.Dominio, PedidoConsulta.GUI, PedidoProduto.Dominio, Util.Enumerados,
  midaslib;

type
  TfrmPedidoGUI = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtNumeroPedido: TEdit;
    Label2: TLabel;
    dtpDataEmissao: TDateTimePicker;
    Label3: TLabel;
    edtClienteCodigo: TEdit;
    btCliente: TButton;
    edtClienteNome: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    edtProdutoCodigo: TEdit;
    Label4: TLabel;
    btProduto: TButton;
    edtProdutoDescricao: TEdit;
    Label5: TLabel;
    edtValorUnitario: TEdit;
    Label6: TLabel;
    edtQuantidade: TEdit;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    btConsultaPedido: TButton;
    btAdicionar: TButton;
    DsPedidoProduto: TDataSource;
    btGravarPedido: TButton;
    btCancelarOperacao: TButton;
    Panel4: TPanel;
    btRemover: TButton;
    Panel5: TPanel;
    Label7: TLabel;
    edtValorTotalPedido: TEdit;
    CdsPedidoProduto: TClientDataSet;
    CdsPedidoProdutoCODIGO: TIntegerField;
    CdsPedidoProdutoNUMERO_PEDIDO: TIntegerField;
    CdsPedidoProdutoCODIGO_PRODUTO: TIntegerField;
    CdsPedidoProdutoDESCRICAO_PRODUTO: TStringField;
    CdsPedidoProdutoQUANTIDADE: TIntegerField;
    CdsPedidoProdutoVALOR_UNITARIO: TCurrencyField;
    CdsPedidoProdutoVALOR_TOTAL: TCurrencyField;
    btCancelarPedido: TButton;
    procedure btClienteClick(Sender: TObject);
    procedure edtClienteCodigoExit(Sender: TObject);
    procedure edtClienteCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtProdutoCodigoExit(Sender: TObject);
    procedure btProdutoClick(Sender: TObject);
    procedure edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure btAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CdsPedidoProdutoAfterPost(DataSet: TDataSet);
    procedure btRemoverClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btGravarPedidoClick(Sender: TObject);
    procedure btConsultaPedidoClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure btCancelarOperacaoClick(Sender: TObject);
    procedure btCancelarPedidoClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CdsPedidoProdutoAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
    FCodigoPedidoProduto: Integer;
    procedure CarregarCliente();
    procedure CarregarProduto();
    function VerificaCamposPedidoProduto(): boolean;
    procedure PopularCamposPedidoProduto();
    procedure InicializaVariaveis();
    procedure LimpaCamposPedidoProdutos();
    procedure CalculaValorTotalPedido();
    procedure PopularObjetos(pPedido: TPedidoDominio);
    procedure PopularControles(pPedido: TPedidoDominio);
    procedure LimpaCampos();
    procedure PopularCdsPedidoProduto(); overload;
    procedure PopularCdsPedidoProduto(pNumeroPedido: Integer;
      pListaPedidoProduto : TListaPedidoProduto); overload;
    procedure AlterarItemPedidoProduto();
  public
    { Public declarations }
  end;

var
  frmPedidoGUI: TfrmPedidoGUI;

implementation

{$R *.dfm}

procedure TfrmPedidoGUI.AlterarItemPedidoProduto;
begin
  PopularCamposPedidoProduto;
  CdsPedidoProduto.Edit;
end;

procedure TfrmPedidoGUI.btAdicionarClick(Sender: TObject);
begin
  if VerificaCamposPedidoProduto then
  begin
    if CdsPedidoProduto.State = dsBrowse then
      cdsPedidoProduto.Append;
    PopularCdsPedidoProduto;
    cdsPedidoProduto.Post;
    LimpaCamposPedidoProdutos
  end;
end;

procedure TfrmPedidoGUI.btCancelarOperacaoClick(Sender: TObject);
begin
  LimpaCampos;
end;

procedure TfrmPedidoGUI.btCancelarPedidoClick(Sender: TObject);
var
  lFrmPedidoConsultaGUI : TfrmPedidoConsultaGUI;
  lPedido: TPedidoDominio;
  lPedidoControlador: TPedidoControlador;
begin
  lPedido := TPedidoDominio.Create;
  lPedidoControlador := TPedidoControlador.Create;
  lFrmPedidoConsultaGUI := TfrmPedidoConsultaGUI.Create(self, lPedido, otpExclucao);
  try
    if lFrmPedidoConsultaGUI.ShowModal = mrOk then
    begin
      try
        lPedidoControlador.ObterPedido(lPedido.NumeroPedido, lPedido, False);
        if lPedido.NumeroPedido = 0 then
          MessageDlg('Numero do pedido não encontrado!', TMsgDlgType.mtWarning, [mbOK], 0)
        else
        begin
          LimpaCampos;
          lPedidoControlador.Excluir(lPedido.NumeroPedido);
          MessageDlg('Pedido de numero '+lPedido.NumeroPedido.ToString+
            ' cancelado com sucesso !', TMsgDlgType.mtInformation, [mbOK], 0);
        end;
      except
        on E: Exception do
        begin
          MessageDlg('Erro ao cancelar pedido de numero '+lPedido.NumeroPedido.ToString+
            ' ! mensagem tecnica: '+E.Message, TMsgDlgType.mtError, [mbOK], 0);
        end;
      end;
    end;
  finally
    FreeAndNil(lPedido);
    FreeAndNil(lPedidoControlador);
    FreeAndNil(lFrmPedidoConsultaGUI);
  end;
end;

procedure TfrmPedidoGUI.btClienteClick(Sender: TObject);
var
  lFrmClienteConsultaGUI : TfrmClienteConsultaGUI;
  lCliente: TClienteDominio;
begin
  lCliente := TClienteDominio.Create;
  lFrmClienteConsultaGUI := TfrmClienteConsultaGUI.Create(self, lCliente);
  try
    if lFrmClienteConsultaGUI.ShowModal = mrOk then
    begin
      edtClienteCodigo.Text := lCliente.Codigo.ToString;
      edtClienteNome.Text := lCliente.Nome
    end;
  finally
    FreeAndNil(lCliente);
    FreeAndNil(lFrmClienteConsultaGUI);
  end;
end;

procedure TfrmPedidoGUI.btConsultaPedidoClick(Sender: TObject);
var
  lFrmPedidoConsultaGUI : TfrmPedidoConsultaGUI;
  lPedido: TPedidoDominio;
  lPedidoControlador: TPedidoControlador;
begin
  lPedido := TPedidoDominio.Create;
  lPedidoControlador := TPedidoControlador.Create;
  lFrmPedidoConsultaGUI := TfrmPedidoConsultaGUI.Create(self, lPedido, otpConsulta);
  try
    if lFrmPedidoConsultaGUI.ShowModal = mrOk then
    begin
      try
        LimpaCampos;
        lPedidoControlador.ObterPedido(lPedido.NumeroPedido, lPedido);
        if lPedido.NumeroPedido = 0 then
          MessageDlg('Numero do pedido não encontrado!', TMsgDlgType.mtWarning, [mbOK], 0)
        else
          PopularControles(lPedido);
      except
        on E: Exception do
        begin
          MessageDlg('Erro ao consultar pedido de numero '+lPedido.NumeroPedido.ToString+
            ' ! mensagem tecnica: '+E.Message, TMsgDlgType.mtError, [mbOK], 0);
        end;
      end;
    end;
  finally
    FreeAndNil(lPedido);
    FreeAndNil(lPedidoControlador);
    FreeAndNil(lFrmPedidoConsultaGUI);
  end;
end;

procedure TfrmPedidoGUI.btGravarPedidoClick(Sender: TObject);
var
  lPedidoControlador: TPedidoControlador;
  lPedido: TPedidoDominio;
begin
  inherited;
  lPedidoControlador := TPedidoControlador.Create;
  lPedido := TPedidoDominio.Create;
  try
    PopularObjetos(lPedido);
    lPedidoControlador.Salvar(lPedido);
    edtNumeroPedido.Text := lPedido.NumeroPedido.ToString;
    MessageDlg('Pedido de Numero: '+lPedido.NumeroPedido.ToString+
      ' salva com sucesso !', TMsgDlgType.mtInformation, [mbOK], 0);
    LimpaCampos;
  finally
    FreeAndNil(lPedido);
    FreeAndNil(lPedidoControlador);
  end;
end;

procedure TfrmPedidoGUI.btProdutoClick(Sender: TObject);
var
  lFrmProdutoConsultaGUI : TfrmProdutoConsultaGUI;
  lProduto: TProdutoDominio;
begin
  lProduto := TProdutoDominio.Create;
  lFrmProdutoConsultaGUI := TfrmProdutoConsultaGUI.Create(self, lProduto);
  try
    if lFrmProdutoConsultaGUI.ShowModal = mrOk then
    begin
      edtProdutoCodigo.Text := lProduto.Codigo.ToString;
      edtProdutoDescricao.Text := lProduto.Descricao;
      edtValorUnitario.Text := lProduto.PrecoVenda.ToString;
    end;
  finally
    FreeAndNil(lProduto);
    FreeAndNil(lFrmProdutoConsultaGUI);
  end;
end;

procedure TfrmPedidoGUI.btRemoverClick(Sender: TObject);
begin
  if MessageBox(Handle, 'Deseja excluir o registro?', 'Exclusão', MB_YESNO + MB_ICONQUESTION) = ID_YES then
    CdsPedidoProduto.Delete;
end;

procedure TfrmPedidoGUI.CalculaValorTotalPedido;
var
  lValorTotal: Currency;
  lBookMark: TBookMark;
begin
  lValorTotal := 0;
  lBookMark := CdsPedidoProduto.Getbookmark;
  CdsPedidoProduto.DisableControls;
  try
    CdsPedidoProduto.First;
    while not CdsPedidoProduto.Eof do
    begin
      lValorTotal:= lValorTotal + CdsPedidoProduto.FieldByName('VALOR_TOTAL').AsCurrency;
      CdsPedidoProduto.Next;
    end;
    edtValorTotalPedido.Text := CurrToStrF(lValorTotal, ffNumber, 2);
  finally
    CdsPedidoProduto.GotoBookmark(lBookMark);
    CdsPedidoProduto.FreeBookmark(lBookMark);
    CdsPedidoProduto.EnableControls
  end;
end;

procedure TfrmPedidoGUI.CarregarCliente;
var
  lClienteControlador: TClienteControlador;
  lCliente: TClienteDominio;
begin
  inherited;
  lClienteControlador := TClienteControlador.Create;
  lCliente := TClienteDominio.Create;
  try
    lClienteControlador.ObterCliente(StrToInt(edtClienteCodigo.Text), lCliente);
    if lCliente.Codigo = 0 then
    begin
      messageDLG('Codigo do cliente não encontrado!',TMsgDlgType.mtWarning,[mbOK],0);
      edtClienteCodigo.SetFocus;
    end
    else
      edtClienteNome.Text := lCliente.Nome;
  finally
    FreeAndNil(lClienteControlador);
    FreeAndNil(lCliente);
  end;
end;

procedure TfrmPedidoGUI.CarregarProduto;
var
  lProdutoControlador: TProdutoControlador;
  lProduto: TProdutoDominio;
begin
  inherited;
  lProdutoControlador := TProdutoControlador.Create;
  lProduto := TProdutoDominio.Create;
  try
    lProdutoControlador.ObterProduto(StrToInt(edtProdutoCodigo.Text), lProduto);
    if lProduto.Codigo = 0 then
    begin
      messageDLG('Codigo do produto não encontrado!',TMsgDlgType.mtWarning,[mbOK],0);
      edtProdutoCodigo.SetFocus;
    end
    else
    begin
      edtProdutoDescricao.Text := lProduto.Descricao;
      edtValorUnitario.Text := lProduto.PrecoVenda.ToString;
    end;
  finally
    FreeAndNil(lProdutoControlador);
    FreeAndNil(lProduto);
  end;
end;

procedure TfrmPedidoGUI.CdsPedidoProdutoAfterDelete(DataSet: TDataSet);
begin
  CalculaValorTotalPedido;
end;

procedure TfrmPedidoGUI.CdsPedidoProdutoAfterPost(DataSet: TDataSet);
begin
  CalculaValorTotalPedido;
end;

procedure TfrmPedidoGUI.DBGrid1DblClick(Sender: TObject);
begin
  AlterarItemPedidoProduto;
end;

procedure TfrmPedidoGUI.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
    btRemoverClick(self);
end;

procedure TfrmPedidoGUI.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,[#32])) then
    AlterarItemPedidoProduto
end;

procedure TfrmPedidoGUI.edtClienteCodigoExit(Sender: TObject);
var
  lFlag : boolean;
begin
  lFlag := Trim(edtClienteCodigo.Text) = '';
  btConsultaPedido.Visible := lFlag;
  btCancelarPedido.Visible := lFlag;
  if Trim(edtClienteCodigo.Text) <> '' then
    CarregarCliente;
end;

procedure TfrmPedidoGUI.edtClienteCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8, #127])) then
    key := #0;
end;

procedure TfrmPedidoGUI.edtProdutoCodigoExit(Sender: TObject);
begin
  if Trim(edtProdutoCodigo.Text) <> '' then
    CarregarProduto;
end;

procedure TfrmPedidoGUI.edtValorUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8, #44, #127])) then
    key := #0;
end;

procedure TfrmPedidoGUI.FormShow(Sender: TObject);
begin
  InicializaVariaveis;
  CdsPedidoProduto.Close;
  CdsPedidoProduto.CreateDataSet;
  CdsPedidoProduto.Open;
end;

procedure TfrmPedidoGUI.InicializaVariaveis;
begin
  dtpDataEmissao.DateTime := now;
  FCodigoPedidoProduto := 0;
  edtNumeroPedido.Text := '0';
  btConsultaPedido.Visible := True;
  btCancelarPedido.Visible := True
end;

procedure TfrmPedidoGUI.LimpaCampos;
begin
  InicializaVariaveis;
  edtClienteCodigo.Text := '';
  edtClienteNome.Text := '';
  LimpaCamposPedidoProdutos;
  CdsPedidoProduto.Close;
  CdsPedidoProduto.CreateDataSet;
  edtValorTotalPedido.Text := '';
end;

procedure TfrmPedidoGUI.LimpaCamposPedidoProdutos;
begin
  FCodigoPedidoProduto := 0;
  edtProdutoCodigo.Text := '';
  edtProdutoDescricao.Text := '';
  edtQuantidade.Text := '';
  edtValorUnitario.Text := '';
end;

procedure TfrmPedidoGUI.PopularCamposPedidoProduto;
begin
  FCodigoPedidoProduto := CdsPedidoProduto.FieldByName('CODIGO').AsInteger;
  edtProdutoCodigo.Text := CdsPedidoProduto.FieldByName('CODIGO_PRODUTO').AsString;
  edtProdutoDescricao.Text := CdsPedidoProduto.FieldByName('DESCRICAO_PRODUTO').AsString;
  edtQuantidade.Text := CdsPedidoProduto.FieldByName('QUANTIDADE').AsString;
  edtValorUnitario.Text := CdsPedidoProduto.FieldByName('VALOR_UNITARIO').AsString;
end;

procedure TfrmPedidoGUI.PopularCdsPedidoProduto(pNumeroPedido: Integer;
  pListaPedidoProduto: TListaPedidoProduto);
var
  I: Integer;
begin
  for I := 0 to pListaPedidoProduto.PedidoProdutos.Count-1 do
  begin
    CdsPedidoProduto.Append;
    CdsPedidoProduto.FieldByName('NUMERO_PEDIDO').AsInteger := pNumeroPedido;
    CdsPedidoProduto.FieldByName('CODIGO').AsInteger := pListaPedidoProduto.PedidoProdutos.Items[I].Codigo;
    CdsPedidoProduto.FieldByName('CODIGO_PRODUTO').AsInteger := pListaPedidoProduto.PedidoProdutos.Items[I].Produto.Codigo;
    CdsPedidoProduto.FieldByName('DESCRICAO_PRODUTO').AsString := pListaPedidoProduto.PedidoProdutos.Items[I].Produto.Descricao;
    CdsPedidoProduto.FieldByName('QUANTIDADE').AsInteger := pListaPedidoProduto.PedidoProdutos.Items[I].Quantidade;
    CdsPedidoProduto.FieldByName('VALOR_UNITARIO').AsCurrency := pListaPedidoProduto.PedidoProdutos.Items[I].ValorUnitario;
    CdsPedidoProduto.FieldByName('VALOR_tOTAL').AsCurrency := pListaPedidoProduto.PedidoProdutos.Items[I].ValorTotal;
    CdsPedidoProduto.Post;
  end;
end;

procedure TfrmPedidoGUI.PopularCdsPedidoProduto;
begin
  CdsPedidoProduto.FieldByName('NUMERO_PEDIDO').AsString := edtNumeroPedido.Text;
  CdsPedidoProduto.FieldByName('CODIGO').AsInteger := FCodigoPedidoProduto;
  CdsPedidoProduto.FieldByName('CODIGO_PRODUTO').AsString := edtProdutoCodigo.Text;
  CdsPedidoProduto.FieldByName('DESCRICAO_PRODUTO').AsString := edtProdutoDescricao.Text;
  CdsPedidoProduto.FieldByName('QUANTIDADE').AsString := edtQuantidade.Text;
  CdsPedidoProduto.FieldByName('VALOR_UNITARIO').AsString := edtValorUnitario.Text;
  CdsPedidoProduto.FieldByName('VALOR_tOTAL').AsString := CurrToStr(
    (StrToInt(edtQuantidade.Text)* StrToCurr(edtValorUnitario.Text)));
end;

procedure TfrmPedidoGUI.PopularControles(pPedido: TPedidoDominio);
begin
  edtNumeroPedido.Text := pPedido.NumeroPedido.ToString;
  dtpDataEmissao.DateTime := pPedido.DataEmissao;
  edtClienteCodigo.Text := pPedido.Cliente.Codigo.ToString;
  edtClienteNome.Text := pPedido.Cliente.Nome;
  PopularCdsPedidoProduto(pPedido.NumeroPedido, pPedido.ListaPedidoProduto);
end;

procedure TfrmPedidoGUI.PopularObjetos(pPedido: TPedidoDominio);
begin
  pPedido.NumeroPedido := StrToInt(edtNumeroPedido.Text);
  pPedido.DataEmissao := dtpDataEmissao.DateTime;
  pPedido.Cliente.Codigo := StrToInt(edtClienteCodigo.Text);
  pPedido.ListaPedidoProduto.PopularListaPedidoProduto(CdsPedidoProduto);
  pPedido.ValorTotal := StrToCurr(StringReplace(edtValorTotalPedido.Text,'.','', [rfReplaceAll]));
end;

function TfrmPedidoGUI.VerificaCamposPedidoProduto: boolean;
begin
  Result := True;
  if edtProdutoCodigo.Text = '' then
  begin
    MessageDlg('Codigo do produto não informado! Preencha. ', TMsgDlgType.mtWarning, [mbOK], 0);
    edtProdutoCodigo.SetFocus;
    Result := false;
  end
  else if edtProdutoDescricao.Text = '' then
  begin
    MessageDlg('Descricao do produto não informado! Preencha. ', TMsgDlgType.mtWarning, [mbOK], 0);
    edtProdutoCodigo.SetFocus;
    Result := false;
  end
  else if edtValorUnitario.Text = '' then
  begin
    MessageDlg('Valor unitario não informado! Preencha. ', TMsgDlgType.mtWarning, [mbOK], 0);
    edtValorUnitario.SetFocus;
    Result := false;
  end
  else if edtQuantidade.Text = '' then
  begin
    MessageDlg('Quantidade não informado! Preencha. ', TMsgDlgType.mtWarning, [mbOK], 0);
    edtQuantidade.SetFocus;
    Result := false;
  end
end;

end.
