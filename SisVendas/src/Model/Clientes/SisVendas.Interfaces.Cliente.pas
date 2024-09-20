unit SisVendas.Interfaces.Cliente;

interface

type
  ICliente = interface
    ['{1E929DC4-3679-4EB1-A9FD-FFC37F5FDE14}']

    function Codigo: integer; overload;
    function Nome: string; overload;
    function Idade: integer;

    function Codigo(Value: integer): ICliente; overload;
    function Nome(Value: string): ICliente; overload;
    function AnoNascimento(Value: integer): ICliente; overload;
  end;


implementation

end.
