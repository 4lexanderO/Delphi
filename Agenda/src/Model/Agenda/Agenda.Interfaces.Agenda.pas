unit Agenda.Interfaces.Agenda;

interface

uses
  Agenda.Interfaces.Compromissos,
  System.Generics.Collections;

type
  IAgenda = interface
    ['{E818393C-BB6E-41B6-A5DF-2FED208C8B51}']

    function Agendar(Compromisso: ICompromisso):IAgenda;
    function AlterarAgendamento(Compromisso: ICompromisso): Boolean;
    function RemoverAgendamento(Codigo: integer):Boolean;
    function Compromissos: TList<ICompromisso>;
    function ListarAgendamentos(DataInicio, DataFim: TDateTime): TList<ICompromisso>; overload;
    function ListarAgendamentos: TList<ICompromisso>; overload;
    function Count: integer;
    function BuscarCompromisso(Codigo: integer):ICompromisso;
    function PesquisarCompromisso(Codigo: integer): Boolean;
  end;

implementation

end.
