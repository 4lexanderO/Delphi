unit Agenda.View.Cadastro.Compromissos;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Buttons,
  System.DateUtils,
  Agenda.Interfaces.Agenda,
  Agenda.Interfaces.Compromissos;

type
  TForm_Cadastro_Compromisso = class(TForm)
    PnlBackground: TPanel;
    PnlBotoes: TPanel;
    PnlDados: TPanel;
    Label1: TLabel;
    EdtCodigo: TEdit;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    DateFinalizacao: TDateTimePicker;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    EdtAssunto: TEdit;
    MemoDescricao: TMemo;
    BtnSalvar: TSpeedButton;
    BtnCancelar: TSpeedButton;
    DateInicio: TDateTimePicker;
    Label6: TLabel;
    TimeFim: TDateTimePicker;
    TimeInicio: TDateTimePicker;
    Label7: TLabel;
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure DateFinalizacaoExit(Sender: TObject);
  private
    { Private declarations }
    FCompromisso: ICompromisso;
  public
    { Public declarations }
    procedure AdicionarCompromisso(Codigo: integer);
    procedure AlterarCompromisso(const Compromisso: ICompromisso);
  end;

var
  Form_Cadastro_Compromisso: TForm_Cadastro_Compromisso;

implementation

{$R *.dfm}

procedure TForm_Cadastro_Compromisso.AdicionarCompromisso(Codigo: integer);
begin
  EdtCodigo.Text := Codigo.ToString;
  Self.Caption := 'Adicionar Compromisso';

  DateInicio.Date := Now;
  TimeInicio.Time := Now;
  DateFinalizacao.Date := Now;
  TimeFim.Time := IncHour(Now, 1);

  Self.ShowModal;
end;

procedure TForm_Cadastro_Compromisso.AlterarCompromisso(const Compromisso: ICompromisso);
begin
  FCompromisso := Compromisso;

  EdtCodigo.Text := FCompromisso.Codigo.ToString;
  DateInicio.Date := FCompromisso.DataInicio;
  TimeInicio.Time := FCompromisso.HoraInicio;
  DateFinalizacao.Date := FCompromisso.DataFim;
  TimeFim.Time := FCompromisso.HoraFim;
  EdtAssunto.Text := FCompromisso.Assunto;
  MemoDescricao.Text := FCompromisso.Descricao;

  Self.ShowModal;
end;

procedure TForm_Cadastro_Compromisso.BtnCancelarClick(Sender: TObject);
begin
  ModalResult := mrAbort;
end;

procedure TForm_Cadastro_Compromisso.BtnSalvarClick(Sender: TObject);
begin
  PnlBotoes.SetFocus;

  if DateFinalizacao.Date < DateInicio.Date then
    begin
      DateInicio.SetFocus;
      raise Exception.Create('A data de in�cio n�o pode ser inferior � data de finaliza��o!');
    end;

  if Length(Trim(EdtAssunto.Text)) = 0 then
  begin
    EdtAssunto.SetFocus;
    raise Exception.Create('Informe um assunto!');
  end;

  if Length(Trim(MemoDescricao.Text)) = 0 then
  begin
    MemoDescricao.SetFocus;
    raise Exception.Create('Informe a descri��o do compromisso!');
  end;

  ModalResult := mrOk;
end;

procedure TForm_Cadastro_Compromisso.DateFinalizacaoExit(Sender: TObject);
begin
  DateFinalizacao.Time := DateFinalizacao.DateTime;
end;

end.
