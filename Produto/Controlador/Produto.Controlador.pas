unit Produto.Controlador;

interface

uses
  Produto.Dominio, Data.DB, Produto.Repositorio, Util.ConexaoBanco,
  System.SysUtils;

type
  TProdutoControlador = class
  private

  public
    procedure ObterProduto(pCodigo: integer; var pCliente: TProdutoDominio);
    procedure Consultar(pDescricao: String; var pDataSet: TDataSet);
  end;

implementation

{ TProdutoControlador }

procedure TProdutoControlador.Consultar(pDescricao: String;
  var pDataSet: TDataSet);
var
  lProdutoRepositorio : TProdutoRepositorio;
begin
  lProdutoRepositorio := TProdutoRepositorio.Create;
  try
    try
      lProdutoRepositorio.Consultar(pDescricao, TConexaoBanco.ObterInstancia, pDataSet);
    except
      on e: Exception do
        raise Exception.Create('Erro ao consultar o produto! Messagem tecnica: '+e.Message);
    end;
  finally
    FreeAndNil(lProdutoRepositorio);
  end;
end;

procedure TProdutoControlador.ObterProduto(pCodigo: integer;
  var pCliente: TProdutoDominio);
var
  lProdutoRepositorio : TProdutoRepositorio;
begin
  lProdutoRepositorio := TProdutoRepositorio.Create;
  try
    try
      lProdutoRepositorio.ObterProduto(pCodigo, TConexaoBanco.ObterInstancia, pCliente);
    except
      on e: Exception do
        raise Exception.Create('Erro ao obter o produto! Messagem tecnica: '+e.Message);
    end;
  finally
    FreeAndNil(lProdutoRepositorio);
  end;
end;

end.
