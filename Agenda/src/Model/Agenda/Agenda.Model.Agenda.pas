unit Agenda.Model.Agenda;

interface

uses
  Agenda.Interfaces.Compromissos,
  Agenda.Interfaces.Agenda,
  System.Generics.Collections;

type
  TAgenda = class(TInterfacedObject, IAgenda)
    private
      FCompromissos: TList<ICompromisso>;

      constructor Create;
      destructor Destroy; override;
    public
      class function New: IAgenda;

      function Agendar(Compromisso: ICompromisso):IAgenda;
      function AlterarAgendamento(Codigo: integer):ICompromisso;
      function RemoverAgendamento(Codigo: integer):Boolean;
      function Compromissos: TList<ICompromisso>;
      function ListarAgendamentos(DataInicio, DataFim: TDateTime): TList<ICompromisso>; overload;
      function ListarAgendamentos: TList<ICompromisso>; overload;
      function Count: integer;
  end;

implementation

{ TAgenda }

constructor TAgenda.Create;
begin
  FCompromissos := TList<ICompromisso>.Create;
end;

destructor TAgenda.Destroy;
begin
  inherited;

  FCompromissos.Free;
end;

class function TAgenda.New: IAgenda;
begin
  Result := Self.Create;
end;

function TAgenda.Agendar(Compromisso: ICompromisso): IAgenda;
begin
  FCompromissos.Add(Compromisso);
end;

function TAgenda.AlterarAgendamento(Codigo: integer): ICompromisso;
begin
  for var i:integer := 0 to FCompromissos.Count -1 do
    begin
      if FCompromissos[i].Codigo = Codigo then
        Result := FCompromissos[i];
    end;
end;

function TAgenda.ListarAgendamentos(DataInicio, DataFim: TDateTime): TList<ICompromisso>;
var
  LCompromissos: TList<ICompromisso>;
begin
  LCompromissos := TList<ICompromisso>.Create;

  for var i:integer := 0 to FCompromissos.Count -1 do
    if (FCompromissos[i].DataInicio >= DataInicio) and (FCompromissos[i].DataFim <= DataFim) then
      LCompromissos.Add(FCompromissos[i]);

  Result := LCompromissos;
end;

function TAgenda.Compromissos: TList<ICompromisso>;
begin
  Result := FCompromissos;
end;

function TAgenda.Count: integer;
begin
  Result := FCompromissos.Count;
end;

function TAgenda.RemoverAgendamento(Codigo: integer): Boolean;
begin
  for var i: integer := 0 to FCompromissos.Count -1 do
    if FCompromissos[i].Codigo = Codigo then
      FCompromissos.Remove(FCompromissos[i]);
end;

function TAgenda.ListarAgendamentos: TList<ICompromisso>;
begin
  Result := FCompromissos;
end;

end.
