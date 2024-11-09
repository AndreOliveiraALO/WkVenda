unit PedidoProduto.Repositorio;

interface

uses
  PedidoProduto.Dominio, Util.ConexaoBanco, Data.DB, System.SysUtils,
  FireDAC.Stan.Param, System.Classes;

type
  TPedidoProdutoRepositorio = class
  private

  public
    procedure Incluir(pNumeroPedido: Integer; pPedidoProduto: TPedidoProdutoDominio;
      pConexaoBanco: TConexaoBanco);
    procedure ExcluirPedidoProdutoPorPedido(pNumeroPedido: Integer; pConexaoBanco: TConexaoBanco);
    procedure ObterListaPedidoProduto(pNumeroPedido:Integer; pConexaoBanco: TConexaoBanco;
      var pListaPedidoProduto: TListaPedidoProduto);
  end;

implementation

{ TPedidoProdutoRepositorio }

procedure TPedidoProdutoRepositorio.ExcluirPedidoProdutoPorPedido(
  pNumeroPedido: Integer; pConexaoBanco: TConexaoBanco);
var
  lSql: String;
begin
  lSql:= 'DELETE FROM PEDIDO_PRODUTO WHERE NUMERO_PEDIDO = :NUMERO_PEDIDO';
  pConexaoBanco.Conexao.ExecSQL(lsql, [pNumeroPedido], [ftInteger]);
end;

procedure TPedidoProdutoRepositorio.Incluir(pNumeroPedido: Integer;
  pPedidoProduto: TPedidoProdutoDominio; pConexaoBanco: TConexaoBanco);
var
  lSql: String;
begin
  lSql := 'INSERT INTO PEDIDO_PRODUTO (NUMERO_PEDIDO, CODIGO_PRODUTO, '+
    'QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL) VALUES (:NUMERO_PEDIDO, '+
    ':CODIGO_PRODUTO, :QUANTIDADE, :VALOR_UNITARIO, :VALOR_TOTAL)';
  pConexaoBanco.Conexao.ExecSQL(lSql,
    [pNumeroPedido, pPedidoProduto.Produto.Codigo, pPedidoProduto.Quantidade,
    pPedidoProduto.ValorUnitario, pPedidoProduto.ValorTotal],
    [ftInteger, ftInteger, ftInteger, ftFloat, ftFloat]);
end;

procedure TPedidoProdutoRepositorio.ObterListaPedidoProduto(
  pNumeroPedido: Integer; pConexaoBanco: TConexaoBanco;
  var pListaPedidoProduto: TListaPedidoProduto);
var
  lSql: String;
  lDataSet: TDataSet;
  lParam: TFDParams;
begin
  lDataSet := TDataSet.Create(nil);
  lParam:= TFDParams.Create();
  try
    lParam.Add('NUMERO_PEDIDO', pNumeroPedido, ptInput);
    lSql := 'SELECT PP.CODIGO, PP.CODIGO_PRODUTO, P.DESCRICAO AS DESCRICAO_PRODUTO, '+
      'PP.QUANTIDADE, PP.VALOR_UNITARIO, PP.VALOR_TOTAL '+
      'FROM PEDIDO_PRODUTO PP INNER JOIN PRODUTO P ON PP.CODIGO_PRODUTO = P.CODIGO '+
      'WHERE PP.NUMERO_PEDIDO = :NUMERO_PEDIDO';
    pConexaoBanco.Conexao.ExecSQL(lSql, lParam, lDataSet);
    lDataSet.First;
    pListaPedidoProduto.PopularListaPedidoProduto(lDataSet);
  finally
    FreeAndNil(lParam);
    FreeAndNil(lDataSet);
  end;
end;

end.
