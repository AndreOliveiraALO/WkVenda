unit Cliente.Controlador;

interface

uses
  Cliente.Dominio, Cliente.Repositorio, Util.ConexaoBanco, System.SysUtils,
  Data.DB;

type
  TClienteControlador = class
  private

  public
    procedure ObterCliente(pCodigo: integer; var pCliente: TClienteDominio);
    procedure Consultar(pNome: String; var pDataSet: TDataSet);
  end;


implementation

{ TClienteControlador }

procedure TClienteControlador.Consultar(pNome: String; var pDataSet: TDataSet);
var
  lClienteRepositorio : TClienteRepositorio;
begin
  lClienteRepositorio := TClienteRepositorio.Create;
  try
    try
      lClienteRepositorio.Consultar(pNome, TConexaoBanco.ObterInstancia, pDataSet);
    except
      on e: Exception do
        raise Exception.Create('Erro ao consultar o cliente! Messagem tecnica: '+e.Message);
    end;
  finally
    FreeAndNil(lClienteRepositorio);
  end;
end;

procedure TClienteControlador.ObterCliente(pCodigo: integer;
  var pCliente: TClienteDominio);
var
  lClienteRepositorio : TClienteRepositorio;
begin
  lClienteRepositorio := TClienteRepositorio.Create;
  try
    try
      lClienteRepositorio.ObterCliente(pCodigo, TConexaoBanco.ObterInstancia, pCliente);
    except
      on e: Exception do
        raise Exception.Create('Erro ao obter o cliente! Messagem tecnica: '+e.Message);
    end;
  finally
    FreeAndNil(lClienteRepositorio);
  end;
end;

end.
