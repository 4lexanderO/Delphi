unit Agenda.Model.Compromissos;

interface

uses
  Agenda.Interfaces.Compromissos;

type
  TCompromisso = class(TInterfacedObject, ICompromisso)
    private
      FCodigo: integer;
      FDataInicio: TDateTime;
      FHoraInicio: TTime;
      FDataFim: TDateTime;
      FHoraFim: TTime;
      FAssunto: string;
      FDescricao: string;

      constructor Create;
    public
      class function New: ICompromisso;
      destructor Destroy; override;

      function Codigo: integer; overload;
      function DataInicio: TDateTime; overload;
      function HoraInicio: TTime; overload;
      function DataFim: TDateTime; overload;
      function HoraFim: TTime; overload;
      function Assunto: string; overload;
      function Descricao: string; overload;

      function Codigo(Value: integer):ICompromisso; overload;
      function DataInicio(Value: TDateTime):ICompromisso; overload;
      function HoraInicio(Value: TTime):ICompromisso; overload;
      function DataFim(Value: TDateTime):ICompromisso; overload;
      function HoraFim(Value: TTime):ICompromisso; overload;
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

function TCompromisso.HoraFim: TTime;
begin
  Result := FHoraFim;
end;

function TCompromisso.HoraFim(Value: TTime): ICompromisso;
begin
  FHoraFim := Value;
  Result := Self;
end;

function TCompromisso.HoraInicio: TTime;
begin
  Result := FHoraInicio;
end;

function TCompromisso.HoraInicio(Value: TTime): ICompromisso;
begin
  FHoraInicio := Value;
  Result := Self;
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
