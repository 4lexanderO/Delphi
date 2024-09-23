program Calculadora;

uses
  Vcl.Forms,
  Calculadora.View.Principal in 'View\Calculadora.View.Principal.pas' {FormPrincipal},
  Calculadora.Model.Calculadora in 'Model\Calculadora.Model.Calculadora.pas',
  Calculadora.Controller.Calculadora in 'Controller\Calculadora.Controller.Calculadora.pas',
  Calculadora.Interfaces.Controller.Calculadora in 'Model\Calculadora.Interfaces.Controller.Calculadora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
