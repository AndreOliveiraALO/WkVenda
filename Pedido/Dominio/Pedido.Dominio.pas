unit Pedido.Dominio;

interface

uses
  Cliente.Dominio, PedidoProduto.Dominio, Data.DB, System.SysUtils;

type
  TPedidoDominio = class
  private
    FCliente: TClienteDominio;
    FPedidoProdutos: TListaPedidoProduto;
    FValorTotal: Double;
    FDataEmissao: TDateTime;
    FNumeroPedido: Integer;

    procedure AfterConstruction; override;
    destructor Destroy; override;
    procedure SetCliente(const Value: TClienteDominio);
    procedure setDataEmissao(const Value: TDateTime);
    procedure setNumeroPedido(const Value: Integer);
    procedure setPedidoProdutos(const Value: TListaPedidoProduto);
    procedure SetValorTotal(const Value: Double);
  public
    property NumeroPedido: Integer read FNumeroPedido write setNumeroPedido;
    property DataEmissao: TDateTime read FDataEmissao write setDataEmissao;
    property Cliente: TClienteDominio read FCliente write SetCliente;
    property ValorTotal: Double read FValorTotal write SetValorTotal;
    property ListaPedidoProduto: TListaPedidoProduto read FPedidoProdutos write setPedidoProdutos;
    procedure PopularObjeto(pDataSet: TDataSet);
  end;

implementation

{ TPedidoDominio }

procedure TPedidoDominio.AfterConstruction;
begin
  inherited;
  FCliente := TClienteDominio.Create;
  FPedidoProdutos := TListaPedidoProduto.Create;
end;

destructor TPedidoDominio.Destroy;
begin
  FreeAndNil(FCliente);
  FreeAndNil(FPedidoProdutos);
  inherited;
end;

procedure TPedidoDominio.PopularObjeto(pDataSet: TDataSet);
begin
  FNumeroPedido := pDataset.FieldByName('NUMERO_PEDIDO').AsInteger;
  FDataEmissao := pDataset.FieldByName('DATA_EMISSAO').AsDateTime;
  FCliente.Codigo := pDataSet.FieldByName('CODIGO_CLIENTE').AsInteger;
  FValorTotal := pDataSet.FieldByName('VALOR_TOTAL').AsFloat;
end;

procedure TPedidoDominio.SetCliente(const Value: TClienteDominio);
begin
  FCliente := Value;
end;

procedure TPedidoDominio.setDataEmissao(const Value: TDateTime);
begin
  FDataEmissao := Value;
end;

procedure TPedidoDominio.setNumeroPedido(const Value: Integer);
begin
  FNumeroPedido := Value;
end;

procedure TPedidoDominio.setPedidoProdutos(const Value: TListaPedidoProduto);
begin
  FPedidoProdutos := Value;
end;

procedure TPedidoDominio.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

end.
