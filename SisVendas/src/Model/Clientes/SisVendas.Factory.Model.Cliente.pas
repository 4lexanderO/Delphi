//
// Desenvolvido por Alexander Oliveira
//
// github: https://www.linkedin.com/in/alexanderwoliveira/
// linkedin: https://github.com/4lexanderO/
//

unit SisVendas.Factory.Model.Cliente;

interface

uses
  SisVendas.Model.Cliente,
  SisVendas.Interfaces.Cliente,
  SisVendas.Interfaces.Factory.Model.Cliente;

type
  TFactoryCliente = class(TInterfacedObject, IFactoryCliente)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IFactoryCliente;

      function Cliente: ICliente;
  end;

implementation

{ TFactoryCliente }

constructor TFactoryCliente.Create;
begin
  inherited;
end;

destructor TFactoryCliente.Destroy;
begin
  inherited;
end;

class function TFactoryCliente.New: IFactoryCliente;
begin
  Result := Self.Create;
end;

function TFactoryCliente.Cliente: ICliente;
begin
  Result := TCliente.New;
end;

end.
