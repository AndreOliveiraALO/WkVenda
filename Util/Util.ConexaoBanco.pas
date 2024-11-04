unit Util.ConexaoBanco;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, FireDAC.Phys.MySQL, System.IniFiles,
  FireDAC.Stan.Def, FireDAC.DApt;

type
  TConexaoBanco = class
  strict  private
    class var FInstancia: TConexaoBanco;
    FDriverID: String;
    FDatabase: String;
    FUserName: String;
    FPassword: String;
    FServer: String;
    FPort: String;
    FVendorLib: String;
  private
    FConexao: TFDConnection;
    FMySQLDriverLink: TFDPhysMySQLDriverLink;

    procedure carregarConfiguracaoIni;
    constructor Create(); overload;
    destructor Destroy; override;

  public
    property Conexao: TFDConnection Read FConexao Write FConexao;
    class function ObterInstancia(): TConexaoBanco;

  end;

implementation

{ TConexao }

procedure TConexaoBanco.carregarConfiguracaoIni;
var
  lArquivoIni: Tinifile;
begin
  if not FileExists(ExtractFilePath(ParamStr(0)) + 'WkConfiguracao.ini') then
    raise Exception.Create('Arquivo WkConfiguracao.ini não encontrado! Entre em contato com o suporte');

  lArquivoINI := Tinifile.Create(ExtractFilePath(ParamStr(0)) + 'WkConfiguracao.ini');
  try
    FDriverID := 'MYSQL';
    FDatabase := lArquivoINI.ReadString('MYSQL', 'Databasem', EmptyStr);
    FUserName := lArquivoINI.ReadString('MYSQL', 'Usernamem', EmptyStr);
    FServer := lArquivoINI.ReadString('MYSQL', 'Serverm', EmptyStr);
    FPort := lArquivoINI.ReadString('MYSQL', 'Portm', EmptyStr);
    FPassword := lArquivoINI.ReadString('MYSQL', 'Password', EmptyStr);
    FVendorLib := lArquivoINI.ReadString('MYSQL', 'VendorLib', EmptyStr);
  finally
    FreeAndNil(lArquivoINI);
  end;
end;

constructor TConexaoBanco.Create();
begin
  inherited Create;
  try
    carregarConfiguracaoIni;
    FConexao := TFDConnection.Create(nil);
    FConexao.Params.DriverID := FDriverID;
    FConexao.Params.Database := FDataBase;
    FConexao.Params.UserName := FUserName;
    FConexao.Params.Password := FPassword;
    FConexao.Params.Values['Server'] := FServer;
    FConexao.Params.Values['port'] := FPort;
    FConexao.LoginPrompt := False;

    FMySQLDriverLink := TFDPhysMySQLDriverLink.Create(nil);
    FMySQLDriverLink.VendorLib := FVendorLib;
    FConexao.Connected := True;
  except
    on E: Exception do
      raise Exception.Create('Erro ao criar conexão com o banco de dados! mensagem tecnica: '+E.Message);
  end;
end;

destructor TConexaoBanco.Destroy;
begin
  FreeAndNil(FConexao);
  FreeAndNil(FMySQLDriverLink);
  inherited;
end;

class function TConexaoBanco.ObterInstancia: TConexaoBanco;
begin
  if FInstancia = nil then
    FInstancia := TConexaoBanco.Create();
  Result := FInstancia;
end;

end.
