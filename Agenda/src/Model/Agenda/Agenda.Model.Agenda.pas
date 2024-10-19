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
      function AlterarAgendamento(Compromisso: ICompromisso):Boolean;
      function RemoverAgendamento(Codigo: integer):Boolean;
      function Compromissos: TList<ICompromisso>;
      function ListarAgendamentos(DataInicio, DataFim: TDateTime): TList<ICompromisso>; overload;
      function ListarAgendamentos: TList<ICompromisso>; overload;
      function Count: integer;
      function BuscarCompromisso(Codigo: integer):ICompromisso;
      function PesquisarCompromisso(Codigo: integer): Boolean;
      function LimparCompromissos: IAgenda;
      function Filtrar(Filtro: TFiltro; Agenda: IAgenda; Value: Extended): IAgenda;
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

function TAgenda.Filtrar(Filtro: TFiltro; Agenda: IAgenda; Value: Extended): IAgenda;
var
  LAgenda: IAgenda;
begin
  case Filtro of
    fCodigo: begin
               LAgenda := TAgenda.New;

               for var i: integer := 0 to Agenda.Count -1 do
                 if Agenda.Compromissos[i].Codigo = Value then
                   LAgenda.Agendar(Agenda.Compromissos[i]);

               Result := LAgenda;
             end;
  end;

end;

class function TAgenda.New: IAgenda;
begin
  Result := Self.Create;
end;

function TAgenda.PesquisarCompromisso(Codigo: integer): Boolean;
begin
  Result := False;

  for var i: integer := 0 to FCompromissos.Count -1 do
    if FCompromissos[i].Codigo = Codigo then
      Result := True;
end;

function TAgenda.Agendar(Compromisso: ICompromisso): IAgenda;
begin
  FCompromissos.Add(Compromisso);
end;

function TAgenda.AlterarAgendamento(Compromisso: ICompromisso): Boolean;
begin
  for var i: integer := 0 to FCompromissos.Count - 1 do
    if FCompromissos[i].Codigo = Compromisso.Codigo then
      FCompromissos[i] := Compromisso;
end;

function TAgenda.BuscarCompromisso(Codigo: integer): ICompromisso;
begin
  for var i: integer := 0 to FCompromissos.Count - 1 do
    if FCompromissos[i].Codigo = Codigo then
      Result := FCompromissos[i];
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

function TAgenda.LimparCompromissos: IAgenda;
begin
  for var i: integer := 0 to FCompromissos.Count -1 do
    RemoverAgendamento(FCompromissos[i].Codigo);

  Result := Self;
end;

function TAgenda.ListarAgendamentos: TList<ICompromisso>;
begin
  Result := FCompromissos;
end;

end.
