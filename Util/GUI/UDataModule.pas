unit UDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Util.ConexaoBanco,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.Phys.MSSQLDef,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL;

type
  TDMConexao = class(TDataModule)
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  DMConexao: TDMConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


end.
