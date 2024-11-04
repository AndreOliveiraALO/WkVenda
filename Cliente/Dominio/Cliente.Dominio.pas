unit Cliente.Dominio;

interface

uses
  Data.DB;

type
  TClienteDominio = class(TObject)
  private
    FUf: string;
    FCodigo: Integer;
    FNome: string;
    FCidade: string;
    procedure SetCidade(const Value: string);
    procedure setCodigo(const Value: Integer);
    procedure setNome(const Value: string);
    procedure SetUf(const Value: string);
  public
    property Codigo: Integer read FCodigo write setCodigo;
    property Nome: string read FNome write setNome;
    property Cidade: string read FCidade write SetCidade;
    property Uf: string read FUf write SetUf;
    procedure PopularObjeto(pDataSet: TDataSet);
  end;

implementation

{ TCliente }

procedure TClienteDominio.PopularObjeto(pDataSet: TDataSet);
begin
  FCodigo := pDataset.FieldByName('CODIGO').AsInteger;
  FNome := pDataset.FieldByName('NOME').AsString;
  FCidade := pDataSet.FieldByName('CIDADE').AsString;
  FUf := pDataSet.FieldByName('UF').AsString;
end;

procedure TClienteDominio.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TClienteDominio.setCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TClienteDominio.setNome(const Value: string);
begin
  FNome := Value;
end;

procedure TClienteDominio.SetUf(const Value: string);
begin
  FUf := Value;
end;

end.
