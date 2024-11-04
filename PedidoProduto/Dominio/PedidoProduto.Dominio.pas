unit PedidoProduto.Dominio;

interface

uses
  Produto.Dominio, Data.DB, System.Generics.Collections, System.SysUtils;

type
  TPedidoProdutoDominio = class(TObject)
  private
    FProduto: TProdutoDominio;
    FCodigo: Integer;
    FValorUnitario: Double;
    FValorTotal: Double;
    FQuantidade: Integer;
    procedure setCodigo(const Value: Integer);
    procedure setProduto(const Value: TProdutoDominio);
    procedure setQuantidade(const Value: Integer);
    procedure SetValorTotal(const Value: Double);
    procedure SetValorUnitario(const Value: Double);

  public
    property Codigo : Integer read FCodigo write setCodigo;
    property Produto: TProdutoDominio read FProduto write setProduto;
    property Quantidade: Integer read FQuantidade write setQuantidade;
    property ValorUnitario: Double read FValorUnitario write SetValorUnitario;
    property ValorTotal: Double read FValorTotal write SetValorTotal;
  end;

  TListaPedidoProduto = class
  private
    FPedidoProdutos: TObjectList<TPedidoProdutoDominio>;
  procedure setPedidoProdutos(const Value: TObjectList<TPedidoProdutoDominio>);

  public
    property PedidoProdutos: TObjectList<TPedidoProdutoDominio> read FPedidoProdutos write setPedidoProdutos;
    procedure PopularListaPedidoProduto(pDataSet: TDataSet);
    procedure AfterConstruction; override;
    destructor Destroy; override;
  end;

implementation

{ TPedidoProdutoDominio }

procedure TPedidoProdutoDominio.setCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TPedidoProdutoDominio.setProduto(const Value: TProdutoDominio);
begin
  FProduto := Value;
end;

procedure TPedidoProdutoDominio.setQuantidade(const Value: Integer);
begin
  FQuantidade := Value;
end;

procedure TPedidoProdutoDominio.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

procedure TPedidoProdutoDominio.SetValorUnitario(const Value: Double);
begin
  FValorUnitario := Value;
end;

{ TListaPedidoProduto }

procedure TListaPedidoProduto.AfterConstruction;
begin
  inherited;
  FPedidoProdutos := TObjectList<TPedidoProdutoDominio>.Create;
end;

destructor TListaPedidoProduto.Destroy;
begin
  FreeAndNil(FPedidoProdutos);
  inherited;
end;

procedure TListaPedidoProduto.PopularListaPedidoProduto(pDataSet: TDataSet);
var
  lPedidoProduto: TPedidoProdutoDominio;
begin
  pDataSet.First;
  while not pDataSet.eof do
  begin
    lPedidoProduto := TPedidoProdutoDominio.Create;
    lPedidoProduto.Codigo := pDataSet.FieldByName('CODIGO').AsInteger;
    lPedidoProduto.Produto := TProdutoDominio.Create;
    lPedidoProduto.Produto.Codigo := pDataSet.FieldByName('CODIGO_PRODUTO').AsInteger;
    lPedidoProduto.Produto.Descricao := pDataSet.FieldByName('DESCRICAO_PRODUTO').AsString;
    lPedidoProduto.ValorUnitario := pDataSet.FieldByName('VALOR_UNITARIO').AsFloat;
    lPedidoProduto.Quantidade := pDataSet.FieldByName('QUANTIDADE').AsInteger;
    lPedidoProduto.ValorTotal := pDataSet.FieldByName('VALOR_TOTAL').AsFloat;
    FPedidoProdutos.Add(lPedidoProduto);
    pDataSet.Next;
  end;
end;

procedure TListaPedidoProduto.setPedidoProdutos(
  const Value: TObjectList<TPedidoProdutoDominio>);
begin
  FPedidoProdutos := Value;
end;

end.
