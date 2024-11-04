unit PedidoProduto.Controlador;

interface

uses
  PedidoProduto.Dominio, Util.ConexaoBanco, PedidoProduto.Repositorio,
  System.SysUtils;

type
  TPedidoProdutoControlador = class
  public
    procedure Incluir(pNumeroPedido: Integer; pPedidoProduto: TPedidoProdutoDominio);
    procedure ExcluirPedidoProdutoPorPedido(pNumeroPedido: integer);
    procedure ObterListaPedidoProduto(pNumeroPedido:Integer;
      var pListaPedidoProduto: TListaPedidoProduto);
  end;


implementation

{ TPedidoProdutoControlador }

procedure TPedidoProdutoControlador.ExcluirPedidoProdutoPorPedido(
  pNumeroPedido: integer);
var
  lPedidoProdutoRepositorio: TPedidoProdutoRepositorio;
  lConexaoBanco: TConexaoBanco;
begin
  lPedidoProdutoRepositorio := TPedidoProdutoRepositorio.Create;
  lConexaoBanco := TConexaoBanco.ObterInstancia;
  try
    try
      lConexaoBanco.Conexao.StartTransaction;
      lPedidoProdutoRepositorio.ExcluirPedidoProdutoPorPedido(pNumeroPedido, lConexaoBanco);
      lConexaoBanco.Conexao.Commit;
    except
      on E : Exception do
      begin
        lConexaoBanco.Conexao.Rollback;
        raise Exception.Create('Erro ao excluir os itens do pedido de numero '+
          pNumeroPedido.ToString+'! Mensagem tecnica: '+E.Message);
      end;
    end;
  finally
    FreeAndNil(lPedidoProdutoRepositorio);
  end;
end;

procedure TPedidoProdutoControlador.Incluir(pNumeroPedido: Integer;
  pPedidoProduto: TPedidoProdutoDominio);
var
  lPedidoProdutoRepositorio: TPedidoProdutoRepositorio;
  lConexaoBanco: TConexaoBanco;
begin
  lPedidoProdutoRepositorio := TPedidoProdutoRepositorio.Create;
  try
    try
      lConexaoBanco := TConexaoBanco.ObterInstancia;
      lConexaoBanco.Conexao.StartTransaction;
      lPedidoProdutoRepositorio.Incluir(pNumeroPedido, pPedidoProduto, lConexaoBanco);
      lConexaoBanco.Conexao.Commit;
    except
      on E : Exception do
      begin
        lConexaoBanco.Conexao.Rollback;
        raise Exception.Create('Erro ao incluir o item do pedido! Messagem tecnica: '+E.Message);
      end;
    end;
  finally
    FreeAndNil(lPedidoProdutoRepositorio);
  end;
end;

procedure TPedidoProdutoControlador.ObterListaPedidoProduto(
  pNumeroPedido: Integer; var pListaPedidoProduto: TListaPedidoProduto);
var
  lPedidoProdutoRepositorio: TPedidoProdutoRepositorio;
begin
  lPedidoProdutoRepositorio := TPedidoProdutoRepositorio.Create;
  try
    try
      lPedidoProdutoRepositorio.ObterListaPedidoProduto(pNumeroPedido,
        TConexaoBanco.ObterInstancia, pListaPedidoProduto);
    except
      on E : Exception do
        raise Exception.Create('Erro ao obter lista de itens do pedido! Messagem tecnica: '+E.Message);
    end;
  finally
    FreeAndNil(lPedidoProdutoRepositorio);
  end;
end;

end.
