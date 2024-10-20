unit Agenda.Interfaces.Agenda;

interface

uses
  Agenda.Interfaces.Compromissos,
  System.Generics.Collections;

type
  TFiltro = (ftCodigo);

  IAgenda = interface
    ['{E818393C-BB6E-41B6-A5DF-2FED208C8B51}']

    function Agendar(Compromisso: ICompromisso): IAgenda;
    function Alterar(Compromisso: ICompromisso): Boolean;
    function Remover(Compromisso: ICompromisso): Boolean;
    function Compromissos: TList<ICompromisso>;
    function Listar: TList<ICompromisso>;

    function PesquisarCompromisso(Codigo: integer): Boolean;
    function BuscarCompromisso(Codigo: integer): ICompromisso;

    function LimparAgenda: IAgenda;
    function Filtrar(Filtro: TFiltro; Agenda: IAgenda; Value: Variant): IAgenda;
  end;

implementation

end.
