unit Agenda.Interfaces.Compromissos;

interface

type
  ICompromisso = interface
    ['{9F2E6209-BAEC-493B-9832-D229632B5024}']

    function Codigo: integer; overload;
    function DataInicio: TDateTime; overload;
    function DataFim: TDateTime; overload;
    function Assunto: string; overload;
    function Descricao: string; overload;

    function Codigo(Value: integer):ICompromisso; overload;
    function DataInicio(Value: TDateTime):ICompromisso; overload;
    function DataFim(Value: TDateTime):ICompromisso; overload;
    function Assunto(Value: string):ICompromisso; overload;
    function Descricao(Value: string): ICompromisso; overload;
  end;

implementation

end.
