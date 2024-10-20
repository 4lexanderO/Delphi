program Agenda;

uses
  Vcl.Forms,
  Agenda.View.Principal in 'View\Agenda.View.Principal.pas' {Form_Principal},
  Agenda.Model.Agenda in 'Model\Agenda\Agenda.Model.Agenda.pas',
  Agenda.Interfaces.Agenda in 'Model\Agenda\Agenda.Interfaces.Agenda.pas',
  Agenda.Interfaces.Compromissos in 'Model\Compromissos\Agenda.Interfaces.Compromissos.pas',
  Agenda.Model.Compromissos in 'Model\Compromissos\Agenda.Model.Compromissos.pas',
  Agenda.View.Cadastro.Compromissos in 'View\Compromissos\Agenda.View.Cadastro.Compromissos.pas' {Form_Cadastro_Compromisso},
  Agenda.View.Pesquisa.Compromissos in 'View\Compromissos\Agenda.View.Pesquisa.Compromissos.pas' {Form_Pesquisa_Compromissos},
  Agenda.Controller.Principal in 'Controller\Principal\Agenda.Controller.Principal.pas',
  Agenda.Interfaces.Controller.Principal in 'Controller\Principal\Agenda.Interfaces.Controller.Principal.pas',
  Agenda.Controller.Cadastro.Compromissos in 'Controller\Compromissos\Agenda.Controller.Cadastro.Compromissos.pas',
  Agenda.Interfaces.Controller.Cadastro.Compromissos in 'Controller\Compromissos\Agenda.Interfaces.Controller.Cadastro.Compromissos.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Principal, Form_Principal);
  Application.Run;
end.
