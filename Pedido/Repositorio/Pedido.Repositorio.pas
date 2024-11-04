unit Pedido.Repositorio;

interface

uses
  Pedido.Dominio, Util.ConexaoBanco, Data.DB, System.Classes, System.SysUtils;

type
  TPedidoRepositorio = class
  private
    function ObterID(pConexaoBanco: TConexaoBanco): integer;

  public
    procedure Incluir(pPedido: TPedidoDominio; pConexaoBanco: TConexaoBanco);
    procedure Alterar(pPedido: TPedidoDominio; pConexaoBanco: TConexaoBanco);
    procedure Excluir(pNumeroPedido: integer; pConexaoBanco: TConexaoBanco);
    procedure ObterPedido(pNumeroPedido: Integer; pConexaoBanco: TConexaoBanco;
      var pPedido: TPedidoDominio);
  end;


implementation

{ TPedidoRepositorio }

procedure TPedidoRepositorio.Alterar(pPedido: TPedidoDominio;
  pConexaoBanco: TConexaoBanco);
var
  lSql: string;
begin
  lSql := 'UPDATE PEDIDO SET DATA_EMISSAO = :DATA_EMISSAO, '+
    'CODIGO_CLIENTE = :CODIGOO_CLIENTE, VALOR_TOTAL = :VALOR_TOTAL '+
    'WHERE NUMERO_PEDIDO = :NUMERO_PEDIDO';
  pConexaoBanco.Conexao.ExecSQL(lSql,
    [pPedido.DataEmissao, pPedido.Cliente.Codigo, pPedido.ValorTotal, pPedido.NumeroPedido],
    [ftDateTime, ftInteger, ftFloat, ftInteger]);
end;


procedure TPedidoRepositorio.Excluir(pNumeroPedido: integer;
  pConexaoBanco: TConexaoBanco);
var
  lSql: string;
begin
  lSql:= 'DELETE FROM PEDIDO WHERE NUMERO_PEDIDO = :NUMERO_PEDIDO';
  pConexaoBanco.Conexao.ExecSQL(lSql, [pNumeroPedido], [ftInteger]);
end;

procedure TPedidoRepositorio.Incluir(pPedido: TPedidoDominio;
  pConexaoBanco: TConexaoBanco);
var
  lSql: string;
begin
  lSql := 'INSERT INTO PEDIDO( DATA_EMISSAO, CODIGO_CLIENTE, VALOR_TOTAL) '+
    'VALUES (:DATA_EMISSAO, :CODIGO_CLIENTE, :VALOR_TOTAL)';
  pConexaoBanco.Conexao.ExecSQL(lSql,
    [pPedido.DataEmissao, pPedido.Cliente.Codigo, pPedido.ValorTotal],
    [ftDateTime, ftInteger, ftFloat]);
  pPedido.NumeroPedido := ObterID(pConexaoBanco);
end;

function TPedidoRepositorio.ObterID(pConexaoBanco: TConexaoBanco): integer;
var
  lSql: string;
  DataSet: TDataSet;
begin
  DataSet:= TDataSet.Create(nil);
  try
    lSql := 'SELECT LAST_INSERT_ID() AS ID';
    pConexaoBanco.Conexao.ExecSQL(lSql, DataSet);
    Result := DataSet.FieldByName('ID').AsInteger;
  finally
    FreeAndNil(DataSet);
  end;
end;

procedure TPedidoRepositorio.ObterPedido(pNumeroPedido: integer;
  pConexaoBanco: TConexaoBanco; var pPedido: TPedidoDominio);
var
  lSql: string;
  lDataSet: TDataSet;
begin
  lSql:= 'SELECT NUMERO_PEDIDO, DATA_EMISSAO, CODIGO_CLIENTE, VALOR_TOTAL '+
    'FROM PEDIDO WHERE NUMERO_PEDIDO = '+pNumeroPedido.ToString;
  pConexaoBanco.Conexao.ExecSQL(lSql, lDataSet);
  lDataSet.First;
  pPedido.PopularObjeto(lDataSet);
end;

end.
