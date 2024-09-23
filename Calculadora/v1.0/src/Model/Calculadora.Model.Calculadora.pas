unit Calculadora.Model.Calculadora;

interface

type
  TCalculadora = class
    private
      FNumero1: Double;
      FNumero2: Double;
    public
      procedure Numero1(Numero: Double); overload;
      procedure Numero2(Numero: Double); overload;
      function Numero1: Double; overload;
      function Numero2: Double; overload;
      function Somar: Double;
      function Subtrair: Double;
      function Dividir: Double;
      function Multiplicar: Double;

      constructor Create;
      destructor Destroy; override;

      class function New: TCalculadora;
  end;
implementation

{ TCalculadora }

{ TCalculadora }

constructor TCalculadora.Create;
begin
  inherited;
end;

destructor TCalculadora.Destroy;
begin
  inherited;
end;

function TCalculadora.Somar: Double;
begin
  Result := FNumero1 + FNumero2;
end;

function TCalculadora.Subtrair: Double;
begin
  Result := FNumero1 - FNumero2;
end;

function TCalculadora.Dividir: Double;
begin
  Result := FNumero1 / FNumero2;
end;

function TCalculadora.Multiplicar: Double;
begin
  Result := FNumero1 * FNumero2;
end;

class function TCalculadora.New: TCalculadora;
begin
  Result := Self.Create;
end;

procedure TCalculadora.Numero1(Numero: Double);
begin
  FNumero1 := Numero;
end;

function TCalculadora.Numero1: Double;
begin
  Result := FNumero1;
end;

function TCalculadora.Numero2: Double;
begin
  Result := FNumero2;
end;

procedure TCalculadora.Numero2(Numero: Double);
begin
  FNumero2 := Numero;
end;

end.
