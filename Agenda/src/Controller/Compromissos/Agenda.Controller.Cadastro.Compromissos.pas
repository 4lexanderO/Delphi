unit Agenda.Controller.Cadastro.Compromissos;

interface

uses
  Agenda.Interfaces.Controller.Cadastro.Compromissos,
  Vcl.Forms,
  Agenda.Interfaces.Compromissos;

type
  TControllerCadastroCompromissos = class(TInterfacedObject, IControllerCadastroCompromissos)
    private
      FForm: TForm;

      constructor Create;
    public
      class function New: IControllerCadastroCompromissos;
      destructor Destroy; override;

      function Agendar(Codigo: integer): ICompromisso;
      function Alterar(Compromisso: ICompromisso): ICompromisso;
  end;

implementation

uses
  Agenda.View.Cadastro.Compromissos,
  System.SysUtils,
  System.DateUtils,
  Agenda.Model.Compromissos,
  Vcl.Controls;

{ TControllerCadastroCompromissos }

constructor TControllerCadastroCompromissos.Create;
begin
end;

destructor TControllerCadastroCompromissos.Destroy;
begin
  inherited;

  if assigned(FForm) then
    FreeAndNil(FForm);
end;

class function TControllerCadastroCompromissos.New: IControllerCadastroCompromissos;
begin
  Result := Self.Create;
end;

function TControllerCadastroCompromissos.Agendar(Codigo: integer): ICompromisso;
begin
  Application.CreateForm(TForm_Cadastro_Compromisso, Form_Cadastro_Compromisso);

  Form_Cadastro_Compromisso.EdtCodigo.Text := Codigo.ToString;
  Form_Cadastro_Compromisso.Caption := 'Adicionar Compromisso';

  Form_Cadastro_Compromisso.DateInicio.Date := Now;
  Form_Cadastro_Compromisso.TimeInicio.Time := Now;
  Form_Cadastro_Compromisso.DateFinalizacao.Date := Now;
  Form_Cadastro_Compromisso.TimeFim.Time := IncHour(Now, 1);

  Form_Cadastro_Compromisso.ShowModal;

  if Form_Cadastro_Compromisso.ModalResult = mrOk then
    Result := TCompromisso.New.Codigo(StrToInt(Form_Cadastro_Compromisso.EdtCodigo.Text))
                              .DataInicio(Form_Cadastro_Compromisso.DateInicio.Date)
                              .HoraInicio(Form_Cadastro_Compromisso.TimeInicio.Time)
                              .DataFim(Form_Cadastro_Compromisso.DateFinalizacao.Date)
                              .HoraFim(Form_Cadastro_Compromisso.TimeFim.Time)
                              .Assunto(Form_Cadastro_Compromisso.EdtAssunto.Text)
                              .Descricao(Form_Cadastro_Compromisso.MemoDescricao.Text)
  else
    Result := TCompromisso.New.Codigo(0);
end;

function TControllerCadastroCompromissos.Alterar(Compromisso: ICompromisso): ICompromisso;
begin
  Application.CreateForm(TForm_Cadastro_Compromisso, Form_Cadastro_Compromisso);

  Form_Cadastro_Compromisso.EdtCodigo.Text := Compromisso.Codigo.ToString;
  Form_Cadastro_Compromisso.DateInicio.Date := Compromisso.DataInicio;
  Form_Cadastro_Compromisso.TimeInicio.Time := Compromisso.HoraInicio;
  Form_Cadastro_Compromisso.DateFinalizacao.Date := Compromisso.DataFim;
  Form_Cadastro_Compromisso.TimeFim.Time := Compromisso.HoraFim;
  Form_Cadastro_Compromisso.EdtAssunto.Text := Compromisso.Assunto;
  Form_Cadastro_Compromisso.MemoDescricao.Text := Compromisso.Descricao;

  Form_Cadastro_Compromisso.ShowModal;

  if Form_Cadastro_Compromisso.ModalResult = mrOk then
      Result := TCompromisso.New.Codigo(StrToInt(Form_Cadastro_Compromisso.EdtCodigo.Text))
                              .DataInicio(Form_Cadastro_Compromisso.DateInicio.Date)
                              .HoraInicio(Form_Cadastro_Compromisso.TimeInicio.Time)
                              .DataFim(Form_Cadastro_Compromisso.DateFinalizacao.Date)
                              .HoraFim(Form_Cadastro_Compromisso.TimeFim.Time)
                              .Assunto(Form_Cadastro_Compromisso.EdtAssunto.Text)
                              .Descricao(Form_Cadastro_Compromisso.MemoDescricao.Text)
  else
    Result := Compromisso;
end;

end.
