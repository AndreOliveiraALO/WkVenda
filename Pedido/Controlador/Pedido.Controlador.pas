unit Pedido.Controlador;

interface

uses
  PedidoProduto.Controlador, Pedido.Repositorio, Util.ConexaoBanco,
  System.SysUtils, Pedido.Dominio, Cliente.Controlador, Cliente.Dominio,
  PedidoProduto.Dominio;

type
  TPedidoControlador = class
  private

  public
    procedure Salvar(pPedido: TPedidoDominio);
    procedure Excluir(pNumeroPedido: integer);
    procedure ObterPedido(pNumeroPedido: integer; var pPedido: TPedidoDominio;
      pCompleto: boolean = true);
  end;

implementation

{ TPedidoControlador }

procedure TPedidoControlador.Excluir(pNumeroPedido: integer);
var
//  lPedidoProdutoControlador: TPedidoProdutoControlador;
  lPedidoRepositorio: TPedidoRepositorio;
  lConexaoBanco: TConexaoBanco;
begin
//  lPedidoProdutoControlador := TPedidoProdutoControlador.Create;
  lPedidoRepositorio:= TPedidoRepositorio.Create;
  lConexaoBanco := TConexaoBanco.ObterInstancia;
  try
    try
      lConexaoBanco.Conexao.StartTransaction;
// foi resolvido com delete cascade, dexei comentado caso a wk tenha algum restrição em usar
//      lPedidoProdutoControlador.ExcluirPedidoProdutoPorPedido(pNumeroPedido);
      lPedidoRepositorio.Excluir(pNumeroPedido, lConexaoBanco);
      lConexaoBanco.Conexao.Commit;
    except
      on E: Exception do
      begin
        lConexaoBanco.Conexao.Rollback;
        raise Exception.Create('Erro ao excluir o Pedido! Mensagem tecnica: '+E.message);
      end;
    end;
  finally
    FreeAndNil(lPedidoRepositorio);
//    FreeAndNil(lPedidoProdutoControlador);
  end;
end;

procedure TPedidoControlador.ObterPedido(pNumeroPedido: integer;
  var pPedido: TPedidoDominio; pCompleto: boolean = true);
var
  lPedidoRepositorio : TPedidoRepositorio;
  lClienteControlador: TClienteControlador;
  lPedidoProdutoControlador: TPedidoProdutoControlador;
  lCliente: TClienteDominio;
  lListaPedidoProduto: TListaPedidoProduto;
begin
  lPedidoRepositorio := TPedidoRepositorio.Create;
  lClienteControlador := TClienteControlador.Create;
  lPedidoProdutoControlador := TPedidoProdutoControlador.Create;
  try
    lPedidoRepositorio.ObterPedido(pNumeroPedido, TConexaoBanco.ObterInstancia, pPedido);
    if pCompleto then
    begin
      lCliente := pPedido.Cliente;
      lClienteControlador.ObterCliente(pPedido.Cliente.Codigo, lCliente);
      lListaPedidoProduto := pPedido.ListaPedidoProduto;
      lPedidoProdutoControlador.ObterListaPedidoProduto(pNumeroPedido, lListaPedidoProduto);
    end;
  finally
    FreeAndNil(lPedidoRepositorio);
    FreeAndNil(lClienteControlador);
    FreeAndNil(lPedidoProdutoControlador);
  end;
end;

procedure TPedidoControlador.Salvar(pPedido: TPedidoDominio);
var
  I: Integer;
  lPedidoProduto: TPedidoProdutoDominio;
  lConexaoBanco: TConexaoBanco;
  lPedidoRepositorio: TPedidoRepositorio;
  lPedidoProdutoControlador: TPedidoProdutoControlador;
begin
  lConexaoBanco := TConexaoBanco.ObterInstancia;
  lPedidoRepositorio := TPedidoRepositorio.Create;
  lPedidoProdutoControlador := TPedidoProdutoControlador.Create;
  try
    lConexaoBanco.Conexao.StartTransaction;
    try
      if pPedido.NumeroPedido > 0 then
      begin
        lPedidoRepositorio.Alterar(pPedido, lConexaoBanco);
        lPedidoProdutoControlador.ExcluirPedidoProdutoPorPedido(pPedido.NumeroPedido);
      end
      else
        lPedidoRepositorio.Incluir(pPedido, lConexaoBanco);

      for I := 0 to pPedido.ListaPedidoProduto.PedidoProdutos.Count-1 do
      begin
        lPedidoProduto := pPedido.ListaPedidoProduto.PedidoProdutos.Items[I];
        lPedidoProdutoControlador.Incluir(pPedido.NumeroPedido, lPedidoProduto);
      end;
      lConexaoBanco.Conexao.Commit;
    Except
      on E: Exception do
      begin
        lConexaoBanco.Conexao.Rollback;
        raise Exception.Create('Erro ao salvar Pedido! Mensagem tecnica:'+E.Message);
      end;
    end;
  finally
    FreeAndNil(lPedidoRepositorio);
    FreeAndNil(lPedidoProdutoControlador);
  end;
end;

end.
