unit Produto.Repositorio;

interface

uses
  Util.ConexaoBanco, Produto.Dominio, Data.DB, FireDAC.Comp.Client,
  System.SysUtils;

type
  TProdutoRepositorio = class
  public
    procedure ObterProduto(pCodigo: integer; pConexaoBanco: TConexaoBanco;
      var pProduto: TProdutoDominio);
    procedure Consultar(pDescricao: String; pConexaoBanco: TConexaoBanco;
      var pDataSet: TDataSet);
  end;

implementation

{ TProdutoRepositorio }

procedure TProdutoRepositorio.Consultar(pDescricao: String;
  pConexaoBanco: TConexaoBanco; var pDataSet: TDataSet);
var
  lSql: string;
begin
  lSql:= 'SELECT CODIGO, DESCRICAO, PRECOVENDA FROM PRODUTO '+
    'WHERE UPPER(DESCRICAO) LIKE '+ QuotedStr('%'+pDescricao.ToUpper+'%');
  pConexaoBanco.Conexao.ExecSQL(lSql, pDataSet);
end;

procedure TProdutoRepositorio.ObterProduto(pCodigo: integer;
  pConexaoBanco: TConexaoBanco; var pProduto: TProdutoDominio);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(nil);
  lQry.Connection := pConexaoBanco.ObterInstancia.Conexao;
  try
    lQry.Sql.Text := 'SELECT CODIGO, DESCRICAO, PRECOVENDA FROM PRODUTO WHERE CODIGO = :CODIGO';
    lQry.ParamByName('CODIGO').AsInteger := pCodigo;
    lQry.Close;
    lQry.Open;
    if lQry.RecordCount > 0 then
    begin
      lQry.First;
      pProduto.PopularObjeto(lQry);
    end;
  finally
    lQry.Close;
    FreeAndNil(lQry);
  end;
end;

end.
