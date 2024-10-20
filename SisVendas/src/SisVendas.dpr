program SisVendas;

uses
  Vcl.Forms,
  SisVendas.View.Principal in 'View\SisVendas.View.Principal.pas' {Form1},
  SisVendas.Interfaces.Cliente in 'Model\Clientes\SisVendas.Interfaces.Cliente.pas',
  SisVendas.Model.Cliente in 'Model\Clientes\SisVendas.Model.Cliente.pas',
  SisVendas.Factory.Model.Cliente in 'Model\Clientes\SisVendas.Factory.Model.Cliente.pas',
  SisVendas.Interfaces.Factory.Model.Cliente in 'Model\Clientes\SisVendas.Interfaces.Factory.Model.Cliente.pas',
  SisVenda.Model.Sistema.Mensagens in 'Model\Sistema\Mensagens\SisVenda.Model.Sistema.Mensagens.pas' {Form_Sistema_Mensagens},
  SisVendas.Model.Sistema.Mensagens in 'Model\Sistema\Mensagens\SisVendas.Model.Sistema.Mensagens.pas',
  SisVendas.Interfaces.Model.Sistema.Mensagens in 'Model\Sistema\Mensagens\SisVendas.Interfaces.Model.Sistema.Mensagens.pas',
  SisVendas.Model.DAO.Cliente in 'Model\Clientes\SisVendas.Model.DAO.Cliente.pas',
  SisVendas.Model.Singleton.Vendas in 'Model\Vendas\SisVendas.Model.Singleton.Vendas.pas',
  SisVendas.View.Cadastro.Clientes in 'View\Clientes\SisVendas.View.Cadastro.Clientes.pas' {Form_Cadastro_Clientes};

{$R *.res}

begin
  {$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Principal, Form_Principal);
  Application.Run;
end.
