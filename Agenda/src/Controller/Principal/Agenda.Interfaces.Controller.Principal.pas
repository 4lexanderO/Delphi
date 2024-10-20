unit Agenda.Interfaces.Controller.Principal;

interface

uses
  Agenda.Interfaces.Agenda;

type
  IControllerPrincipal = interface
    ['{F376CEA1-5F7E-427B-82B5-D7F750B349B4}']

    function Agenda: IAgenda;
    function Agendar: IAgenda;
    function Alterar: IAgenda;
    function Excluir: IAgenda;
    function Pesquisar: IAgenda;
  end;

implementation

end.
