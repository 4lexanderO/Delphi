//
// Desenvolvido por Alexander Oliveira
//
// github: https://www.linkedin.com/in/alexanderwoliveira/
// linkedin: https://github.com/4lexanderO/
//

unit SisVendas.Model.Cliente;

interface

uses
  SisVendas.Interfaces.Cliente;

type
  TCliente = class(TInterfacedObject, ICliente)
    private
      FCodigo: integer;
      FNome: string;
      FAnoNascimento: integer;

      constructor Create;
      destructor Destroy; override;
    public
      function Codigo: integer; overload;
      function Nome: string; overload;
      function Idade: integer;

      function Codigo(Value: integer): ICliente; overload;
      function Nome(Value: string): ICliente; overload;
      function AnoNascimento(Value: integer): ICliente; overload;

      class function New: TCliente;
  end;

implementation

uses
  System.SysUtils;

{ TCliente }

constructor TCliente.Create;
begin
  inherited;
end;

destructor TCliente.Destroy;
begin
  inherited;
end;

class function TCliente.New: TCliente;
begin
  Result := Self.Create;
end;

function TCliente.AnoNascimento(Value: integer): ICliente;
begin
  FAnoNascimento := Value;
  Result := Self;
end;

function TCliente.Codigo: integer;
begin
  Result := FCodigo;
end;

function TCliente.Codigo(Value: integer): ICliente;
begin
  FCodigo := Value;
  Result := Self;
end;

function TCliente.Idade: integer;
var
  LIdade: integer;
begin
  LIdade := StrToInt(FormatDateTime('YYYY', Now)) - FAnoNascimento;

  Result := LIdade;
end;

function TCliente.Nome: string;
begin
  Result := FNome;
end;

function TCliente.Nome(Value: string): ICliente;
begin
  FNome := Value;
  Result := Self;
end;

end.
