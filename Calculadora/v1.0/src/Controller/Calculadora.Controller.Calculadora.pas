unit Calculadora.Controller.Calculadora;

interface

uses
  Calculadora.Interfaces.Controller.Calculadora, Calculadora.Model.Calculadora;

type
  TControllerCalculadora = class(TInterfacedObject, iControllerCalculadora)
  private
    FCalculadora: TCalculadora;
    FOperador: TOperacao;
  public
    function Numero1(Numero: Double): IControllerCalculadora; overload;
    function Numero1: Double; overload;
    function Numero2(Numero: Double): IControllerCalculadora; overload;
    function Numero2: Double; overload;

    function Somar: Double;
    function Subtrair: Double;
    function Dividir: Double;
    function Multiplicar: Double;

    function Operador(Operador: TOperacao): IControllerCalculadora; overload;
    function Operador: TOperacao; overload;
    function Calcular: Double;

    constructor Create;
    destructor Destroy; override;

    class function New: TControllerCalculadora;
end;

implementation

{ TControllerCalculadora }

function TControllerCalculadora.Calcular: Double;
begin
  Result := 0;

  case FOperador of
    tpSoma: Result := Numero1 + Numero2;
    tpSubtracao: Result := Numero1 - Numero2;
    tpDivisao: Result := Numero1 / Numero2;
    tpMultiplicacao: Result := Numero1 * Numero2;
  end;
end;

constructor TControllerCalculadora.Create;
begin
  if not Assigned(FCalculadora) then
    FCalculadora := TCalculadora.New;

  Operador(tpNenhuma);
end;

destructor TControllerCalculadora.Destroy;
begin
  inherited;
end;

function TControllerCalculadora.Dividir: Double;
begin
  Operador(tpDivisao);
  Result := FCalculadora.Dividir;
end;

function TControllerCalculadora.Multiplicar: Double;
begin
  Operador(tpMultiplicacao);
  Result := FCalculadora.Multiplicar;
end;

function TControllerCalculadora.Numero1(Numero: Double): IControllerCalculadora;
begin
  FCalculadora.Numero1(Numero);
  Result := Self;
end;

class function TControllerCalculadora.New: TControllerCalculadora;
begin
  Result := Self.Create;
end;

function TControllerCalculadora.Numero1: Double;
begin
  Result := FCalculadora.Numero1;
end;

function TControllerCalculadora.Numero2: Double;
begin
  Result := FCalculadora.Numero2;
end;

function TControllerCalculadora.Operador: TOperacao;
begin
  Result := FOperador;
end;

function TControllerCalculadora.Operador(Operador: TOperacao): IControllerCalculadora;
begin
  FOperador := Operador;
  Result := Self;
end;

function TControllerCalculadora.Numero2(Numero: Double): IControllerCalculadora;
begin
  FCalculadora.Numero2(Numero);
  Result := Self;
end;

function TControllerCalculadora.Somar: Double;
begin
  Operador(tpSoma);
  Result := FCalculadora.Somar;
end;

function TControllerCalculadora.Subtrair: Double;
begin
  Operador(tpSubtracao);
  Result := FCalculadora.Subtrair;
end;

end.
