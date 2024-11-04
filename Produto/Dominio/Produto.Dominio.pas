unit Produto.Dominio;

interface

uses
  Data.DB;

type
  TProdutoDominio = class(TObject)
  private
    FDescricao: string;
    FCodigo: Integer;
    FPrecoVenda: Double;
    procedure setCodigo(const Value: Integer);
    procedure setDescricao(const Value: string);
    procedure SetPrecoVenda(const Value: Double);

  public
    property Codigo: Integer read FCodigo write setCodigo;
    property Descricao: String read FDescricao write setDescricao;
    property PrecoVenda: Double read FPrecoVenda write SetPrecoVenda;
    procedure PopularObjeto(pDataSet: TDataSet);
  end;

implementation

{ TProdutoDominio }

procedure TProdutoDominio.PopularObjeto(pDataSet: TDataSet);
begin
  FCodigo := pDataset.FieldByName('CODIGO').AsInteger;
  FDescricao := pDataset.FieldByName('DESCRICAO').AsString;
  FPrecoVenda := pDataSet.FieldByName('PRECOVENDA').AsFloat;
end;

procedure TProdutoDominio.setCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProdutoDominio.setDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProdutoDominio.SetPrecoVenda(const Value: Double);
begin
  FPrecoVenda := Value;
end;

end.
