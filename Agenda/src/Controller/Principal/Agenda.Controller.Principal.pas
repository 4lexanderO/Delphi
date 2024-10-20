unit Agenda.Controller.Principal;

interface

uses
  System.SysUtils,
  Agenda.Interfaces.Controller.Principal,
  Agenda.Interfaces.Agenda;

type
  TControllerPrincipal = class(TInterfacedObject, IControllerPrincipal)
    private
      FAgenda: IAgenda;

      constructor Create;
    public
      class function New: IControllerPrincipal;
      destructor Destroy; override;

      function Agenda: IAgenda;
      function Agendar: IAgenda;
      function Alterar: IAgenda;
      function Excluir: IAgenda;
      function Pesquisar: IAgenda;
  end;

implementation

uses
  Agenda.Model.Agenda,
  Agenda.Model.Compromissos,
  Agenda.View.Cadastro.Compromissos,
  Vcl.Forms,
  Vcl.Controls,
  Vcl.Dialogs,
  Agenda.View.Pesquisa.Compromissos,
  Agenda.Controller.Cadastro.Compromissos,
  Agenda.Interfaces.Compromissos;

{ TControllerAgenda }

constructor TControllerPrincipal.Create;
begin
  FAgenda := TAgenda.New;
end;

destructor TControllerPrincipal.Destroy;
begin
  inherited;
end;

class function TControllerPrincipal.New: IControllerPrincipal;
begin
  Result := Self.Create;
end;

function TControllerPrincipal.Agenda: IAgenda;
begin
  Result := FAgenda;
end;

function TControllerPrincipal.Agendar: IAgenda;
var
  LCompromisso: ICompromisso;
begin
  LCompromisso := TControllerCadastroCompromissos.New.Agendar(FAgenda.Compromissos.Count + 1);

  if LCompromisso.Codigo > 0 then
    FAgenda.Agendar(LCompromisso);

  Result := FAgenda;
end;

function TControllerPrincipal.Alterar: IAgenda;
var
  LInputCodigo: string;
  LCodCompromisso: integer;
begin
  if not InputQuery('Alteração de compromisso','Informe o código do compromisso a ser alterado:', LInputCodigo) then
    Exit;

  LCodCompromisso := StrToIntDef(LInputCodigo, 0);

  if (LCodCompromisso <= 0) or (not FAgenda.PesquisarCompromisso(LCodCompromisso)) then
    raise Exception.Create('Compromisso não encontrado!');

  FAgenda.Alterar(TControllerCadastroCompromissos.New.Alterar(FAgenda.BuscarCompromisso(LCodCompromisso)));
  Result := FAgenda;
end;


function TControllerPrincipal.Excluir: IAgenda;
var
  LInputCodCompromisso: string;
  LCodCompromisso: integer;
begin
  if not InputQuery('Exclusão de Compromisso','Informe o código do compromisso a ser excluído:', LInputCodCompromisso) then
     Exit;

  LCodCompromisso := StrToIntDef(LInputCodCompromisso, 0);

  if (LCodCompromisso <= 0) or (not FAgenda.PesquisarCompromisso(LCodCompromisso)) then
    raise Exception.Create('Compromisso não encontrado!');

  FAgenda.Remover(FAgenda.BuscarCompromisso(LCodCompromisso));
  Result := FAgenda;
end;


function TControllerPrincipal.Pesquisar: IAgenda;
var
  LAgenda: IAgenda;
begin
  Application.CreateForm(TForm_Pesquisa_Compromissos, Form_Pesquisa_Compromissos);
  try
    LAgenda := TAgenda.New;
    LAgenda := FAgenda;

    Form_Pesquisa_Compromissos.Pesquisar(LAgenda);

    if Form_Pesquisa_Compromissos.ModalResult = mrOk then
      Result := Form_Pesquisa_Compromissos.Agenda
    else
      Result := FAgenda;

  finally
    FreeAndNil(Form_Pesquisa_Compromissos);
  end;
end;

end.
