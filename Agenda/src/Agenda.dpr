program Agenda;

uses
  Vcl.Forms,
  Agenda.View.Principal in 'View\Agenda.View.Principal.pas' {Form_Principal},
  Agenda.Model.Agenda in 'Model\Agenda\Agenda.Model.Agenda.pas',
  Agenda.Interfaces.Agenda in 'Model\Agenda\Agenda.Interfaces.Agenda.pas',
  Agenda.Interfaces.Compromissos in 'Model\Compromissos\Agenda.Interfaces.Compromissos.pas',
  Agenda.Model.Compromissos in 'Model\Compromissos\Agenda.Model.Compromissos.pas',
  Agenda.View.Cadastro.Compromissos in 'View\Compromissos\Agenda.View.Cadastro.Compromissos.pas' {Form_Cadastro_Compromisso};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Principal, Form_Principal);
  Application.Run;
end.
