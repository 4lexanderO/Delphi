unit Agenda.Interfaces.Controller.Cadastro.Compromissos;

interface

uses
  Agenda.Interfaces.Compromissos;

type
  IControllerCadastroCompromissos = interface
    ['{B2C0A79E-EF94-4E51-9E9E-EB9F0DEB7A25}']

    function Agendar(Codigo: integer): ICompromisso;
    function Alterar(Compromisso: ICompromisso): ICompromisso;
  end;

implementation

end.
