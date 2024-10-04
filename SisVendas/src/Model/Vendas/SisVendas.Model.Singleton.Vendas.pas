unit SisVendas.Model.Singleton.Vendas;

interface

uses
  SisVendas.Interfaces.Cliente,
  SisVendas.Interfaces.Factory.Model.Cliente,
  System.Generics.Collections, System.SysUtils;

type
  TVendas = class
    private
      class var FInstance: TVendas;
      FCliente: ICliente;

      constructor Create;
      destructor Destroy; override;

      procedure SetCliente (Cliente: ICliente); overload;
      function GetCliente: ICliente; overload;
    public
      class function New: TVendas;
      class function NewInstance: TObject; override;
      property Cliente: ICliente read GetCliente write SetCliente;

  end;


implementation

{ TVendas }

{$REGION 'Construtores / Destrutores'}

constructor TVendas.Create;
begin
end;

destructor TVendas.Destroy;
begin
  inherited;
end;

class function TVendas.New: TVendas;
begin
  Result := Self.Create;
end;

class function TVendas.NewInstance: TObject;
begin
  if not Assigned(FInstance) then
    FInstance := TVendas(inherited NewInstance);

  Result := FInstance;
end;

{$ENDREGION}

procedure TVendas.SetCliente(Cliente: ICliente);
begin
  FCliente := Cliente;
end;

function TVendas.GetCliente: ICliente;
begin
  Result := FCliente;
end;

end.
