program WkVenda;

uses
  Vcl.Forms,
  Pedido.GUI in 'Pedido\GUI\Pedido.GUI.pas' {frmPedidoGUI},
  Util.ConexaoBanco in 'Util\Util.ConexaoBanco.pas',
  Cliente.Dominio in 'Cliente\Dominio\Cliente.Dominio.pas',
  Cliente.Repositorio in 'Cliente\Repositorio\Cliente.Repositorio.pas',
  Cliente.Controlador in 'Cliente\Controlador\Cliente.Controlador.pas',
  Util.ConsultaPadraoGUI in 'Util\GUI\Util.ConsultaPadraoGUI.pas' {frmConsultaPadraoGUI},
  ClienteConsulta.GUI in 'Cliente\GUI\ClienteConsulta.GUI.pas' {frmClienteConsultaGUI},
  Produto.Dominio in 'Produto\Dominio\Produto.Dominio.pas',
  Produto.Repositorio in 'Produto\Repositorio\Produto.Repositorio.pas',
  Produto.Controlador in 'Produto\Controlador\Produto.Controlador.pas',
  ProdutoConsulta.GUI in 'Produto\GUI\ProdutoConsulta.GUI.pas' {frmProdutoConsultaGUI},
  PedidoProduto.Dominio in 'PedidoProduto\Dominio\PedidoProduto.Dominio.pas',
  PedidoProduto.Repositorio in 'PedidoProduto\Repositorio\PedidoProduto.Repositorio.pas',
  PedidoProduto.Controlador in 'PedidoProduto\Controlador\PedidoProduto.Controlador.pas',
  Pedido.Dominio in 'Pedido\Dominio\Pedido.Dominio.pas',
  Pedido.Repositorio in 'Pedido\Repositorio\Pedido.Repositorio.pas',
  Pedido.Controlador in 'Pedido\Controlador\Pedido.Controlador.pas',
  PedidoConsulta.GUI in 'Pedido\GUI\PedidoConsulta.GUI.pas' {frmPedidoConsultaGUI},
  Util.Enumerados in 'Util\Util.Enumerados.pas',
  UDataModule in 'Util\GUI\UDataModule.pas' {DMConexao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'WkVenda';
  Application.CreateForm(TfrmPedidoGUI, frmPedidoGUI);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.Run;
end.
