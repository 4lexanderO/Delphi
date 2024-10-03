//
// Desenvolvido por Alexander Oliveira
//
// github: https://www.linkedin.com/in/alexanderwoliveira/
// linkedin: https://github.com/4lexanderO/
//

unit SisVendas.Interfaces.Cliente;

interface

uses
  System.Classes,
  System.Generics.Collections;

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

  IDAOCliente = interface
    ['{ECFFD32B-085A-4F3E-901A-C274067BF76C}']

    function Add(Cliente: ICliente): IDAOCliente;
    function Salvar: IDAOCliente;
  end;


implementation

end.
