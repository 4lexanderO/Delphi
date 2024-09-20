program SisVendas;

uses
  Vcl.Forms,
  SisVendas.View.Principal in 'View\SisVendas.View.Principal.pas' {Form1},
  SisVendas.Interfaces.Cliente in 'Model\Clientes\SisVendas.Interfaces.Cliente.pas',
  SisVendas.Model.Cliente in 'Model\Clientes\SisVendas.Model.Cliente.pas',
  SisVendas.Factory.Model.Cliente in 'Model\Clientes\SisVendas.Factory.Model.Cliente.pas',
  SisVendas.Interfaces.Factory.Model.Cliente in 'Model\Clientes\SisVendas.Interfaces.Factory.Model.Cliente.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
