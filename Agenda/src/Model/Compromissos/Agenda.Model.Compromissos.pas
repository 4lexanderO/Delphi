unit Agenda.Model.Compromissos;

interface

uses
  Agenda.Interfaces.Compromissos;

type
  TCompromisso = class(TInterfacedObject, ICompromisso)
    private
      FCodigo: integer;
      FDataInicio: TDateTime;
      FDataFim: TDateTime;
      FAssunto: string;
      FDescricao: string;

      constructor Create;
      destructor Destroy; override;
    public
      class function New: ICompromisso;

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

{ TCompromisso }

class function TCompromisso.New: ICompromisso;
begin
  Result := Self.Create;
end;

constructor TCompromisso.Create;
begin
end;

destructor TCompromisso.Destroy;
begin
  inherited;
end;

function TCompromisso.Codigo: integer;
begin
  Result := FCodigo;
end;

function TCompromisso.Codigo(Value: integer): ICompromisso;
begin
  FCodigo := Value;
  Result := Self;
end;

function TCompromisso.Assunto: string;
begin
  Result := FAssunto;
end;

function TCompromisso.Assunto(Value: string): ICompromisso;
begin
  FAssunto := Value;
  Result := Self;
end;

function TCompromisso.DataFim: TDateTime;
begin
  Result := FDataFim;
end;

function TCompromisso.DataFim(Value: TDateTime): ICompromisso;
begin
  FDataFim := Value;
  Result := Self;
end;

function TCompromisso.DataInicio: TDateTime;
begin
  Result := FDataInicio;
end;

function TCompromisso.DataInicio(Value: TDateTime): ICompromisso;
begin
  FDataInicio := Value;
  Result := Self;
end;

function TCompromisso.Descricao: string;
begin
  Result := FDescricao;
end;

function TCompromisso.Descricao(Value: string): ICompromisso;
begin
  FDescricao := Value;
  Result := Self;
end;

end.
