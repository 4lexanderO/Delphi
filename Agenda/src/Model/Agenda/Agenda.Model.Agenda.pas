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

    public
      class function New: IAgenda;
      destructor Destroy; override;

      function Agendar(Compromisso: ICompromisso): IAgenda;
      function Alterar(Compromisso: ICompromisso): Boolean;
      function Remover(Compromisso: ICompromisso): Boolean;
      function Compromissos: TList<ICompromisso>;
      function Listar: TList<ICompromisso>;

      function PesquisarCompromisso(Codigo: integer): Boolean;
      function BuscarCompromisso(Codigo: integer): ICompromisso;

      function LimparAgenda: IAgenda;
      function Filtrar(Filtro: TFiltro; Agenda: IAgenda; Value: Variant): IAgenda;
  end;

implementation

{ TAgenda }

constructor TAgenda.Create;
begin
  FCompromissos := TList<ICompromisso>.Create;
end;

class function TAgenda.New: IAgenda;
begin
  Result := Self.Create;
end;

destructor TAgenda.Destroy;
begin
  inherited;

  FCompromissos.Free;
end;

function TAgenda.Agendar(Compromisso: ICompromisso): IAgenda;
begin
  FCompromissos.Add(Compromisso);
end;

function TAgenda.Alterar(Compromisso: ICompromisso): Boolean;
begin
  Result := False;
  for var i: integer := 0 to FCompromissos.Count - 1 do
    if FCompromissos[i].Codigo = Compromisso.Codigo then
      FCompromissos[i] := Compromisso;
end;

function TAgenda.Remover(Compromisso: ICompromisso): Boolean;
begin
  Result := False;
  FCompromissos.Remove(Compromisso);
end;

function TAgenda.Compromissos: TList<ICompromisso>;
begin
  Result := FCompromissos;
end;

function TAgenda.Listar: TList<ICompromisso>;
begin
  Result := FCompromissos;
end;

function TAgenda.PesquisarCompromisso(Codigo: integer): Boolean;
begin
  Result := False;

  for var i: integer := 0 to FCompromissos.Count -1 do
    if FCompromissos[i].Codigo = Codigo then
      Result := True;
end;

function TAgenda.Filtrar(Filtro: TFiltro; Agenda: IAgenda; Value: Variant): IAgenda;
var
  LAgenda: IAgenda;
begin
  LAgenda := TAgenda.New;

  case Filtro of
    ftCodigo: begin
               for var i: integer := 0 to Agenda.Compromissos.Count -1 do
                 if Agenda.Compromissos[i].Codigo = Value then
                   LAgenda.Agendar(Agenda.Compromissos[i]);

               Result := LAgenda;
             end;
  end;
end;

function TAgenda.LimparAgenda: IAgenda;
begin
  for var i: integer := 0 to FCompromissos.Count -1 do
    Remover(FCompromissos[i]);

  Result := Self;
end;

function TAgenda.BuscarCompromisso(Codigo: integer): ICompromisso;
begin
  for var i: integer := 0 to FCompromissos.Count - 1 do
    if FCompromissos[i].Codigo = Codigo then
      begin
        Result := FCompromissos[i];
        Exit;
      end;
end;

end.
