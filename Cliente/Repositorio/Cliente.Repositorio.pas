unit Cliente.Repositorio;

interface

uses
  Util.ConexaoBanco, Cliente.Dominio, FireDAC.Comp.Client, System.SysUtils,
  Data.DB, FireDaC.Stan.Param;

type
  TClienteRepositorio = class
  public
    procedure ObterCliente(pCodigo: integer; pConexaoBanco: TConexaoBanco;
      var pCliente: TClienteDominio);
    procedure Consultar(pNome: String; pConexaoBanco: TConexaoBanco;
      var pDataSet: TDataSet);
  end;

implementation

{ TClienteRepositorio }

procedure TClienteRepositorio.Consultar(pNome: String;
  pConexaoBanco: TConexaoBanco; var pDataSet: TDataSet);
var
  lSql: string;
  lParam : TFDParams;
begin
  lParam := TFDParams.Create;
  try
    lParam.Add('NOME', '%'+pNome.ToUpper()+'%', ptInput);
    lSql:= 'SELECT CODIGO, NOME, CIDADE, UF FROM CLIENTE '+
      'WHERE UPPER(NOME) LIKE :NOME';
    pConexaoBanco.Conexao.ExecSQL(lSql, lParam, pDataSet);
  finally
    FreeAndNil(lParam);
  end;
end;

procedure TClienteRepositorio.ObterCliente(pCodigo: integer;
  pConexaoBanco: TConexaoBanco; var pCliente: TClienteDominio);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(nil);
  lQry.Connection := pConexaoBanco.ObterInstancia.Conexao;
  try
    lQry.Sql.Text := 'SELECT CODIGO, NOME, CIDADE, UF FROM CLIENTE WHERE CODIGO = :CODIGO';
    lQry.ParamByName('CODIGO').AsInteger := pCodigo;
    lQry.Close;
    lQry.Open;
    if lQry.RecordCount > 0 then
    begin
      lQry.First;
      pCliente.PopularObjeto(lQry);
    end;
  finally
    lQry.Close;
    FreeAndNil(lQry);
  end;
end;

end.
