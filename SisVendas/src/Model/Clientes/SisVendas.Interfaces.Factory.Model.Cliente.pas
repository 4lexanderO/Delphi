unit SisVendas.Interfaces.Factory.Model.Cliente;

interface

uses
  SisVendas.Interfaces.Cliente;

type
  IFactoryCliente = interface
    ['{4AF7F261-63B7-4D64-9C21-2591E84283F2}']

    function Cliente: ICliente;
  end;

implementation

end.
