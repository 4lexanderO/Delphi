unit Agenda.View.Principal;

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
  Vcl.Buttons,
  Vcl.DBCGrids,
  Data.DB,
  FireDAC.Comp.Client,
  Agenda.Interfaces.Agenda,
  Vcl.StdCtrls,
  Vcl.DBCtrls;

type
  TForm_Principal = class(TForm)
    PnlBackground: TPanel;
    PnlOpcoes: TPanel;
    PnlDados: TPanel;
    PnlBotoes: TPanel;
    PnlLblOpcoes: TPanel;
    BtnAdicionar: TSpeedButton;
    BtnAlterar: TSpeedButton;
    BtnExcluir: TSpeedButton;
    BtnPesquisar: TSpeedButton;
    DbgCompromissos: TDBCtrlGrid;
    lblCodigo: TDBText;
    lblDataInicio: TDBText;
    lblDataFim: TDBText;
    lblAssunto: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MemoDescricao: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    FDataSource: TDataSource;
    FTableCompromissos: TFDMemTable;
    FAgenda: IAgenda;

    procedure CriarTabelaAgenda;
    procedure AtualizarGrid(Agenda: IAgenda);
    procedure ConfigurarExibicao;
  public
    { Public declarations }
  end;

var
  Form_Principal: TForm_Principal;

implementation

uses
  Agenda.Model.Agenda,
  Agenda.Interfaces.Compromissos,
  Agenda.Model.Compromissos,
  Agenda.View.Cadastro.Compromissos, Agenda.View.Pesquisa.Compromissos;

{$R *.dfm}

procedure TForm_Principal.AtualizarGrid(Agenda: IAgenda);
begin
  FTableCompromissos.DisableControls;
  try
    FTableCompromissos.Close;
    FTableCompromissos.Open;

    for var i:integer := 0 to Agenda.Count -1 do
       begin
         FTableCompromissos.Append;
         FTableCompromissos.FieldByName('Codigo').AsInteger := Agenda.Compromissos[i].Codigo;
         FTableCompromissos.FieldByName('DataInicio').AsDateTime := Agenda.Compromissos[i].DataInicio;
         FTableCompromissos.FieldByName('DataFim').AsDateTime := Agenda.Compromissos[i].DataFim;
         FTableCompromissos.FieldByName('Assunto').AsString := Agenda.Compromissos[i].Assunto;
         FTableCompromissos.FieldByName('Descricao').AsString := Agenda.Compromissos[i].Descricao;

         FTableCompromissos.Post;
       end;
  finally
    FTableCompromissos.EnableControls;
  end;
end;

procedure TForm_Principal.ConfigurarExibicao;
begin
  lblCodigo.DataSource := FDataSource;
  lblDataInicio.DataSource := FDataSource;
  lblDataFim.DataSource := FDataSource;
  lblAssunto.DataSource := FDataSource;
  memoDescricao.DataSource := FDataSource;

  lblCodigo.DataField := 'Codigo';
  lblDataInicio.DataField := 'DataInicio';
  lblDataFim.DataField := 'DataFim';
  lblAssunto.DataField := 'Assunto';
  memoDescricao.DataField := 'Descricao';
end;

procedure TForm_Principal.CriarTabelaAgenda;
begin
  FTableCompromissos.FieldDefs.Add('Codigo', ftInteger, 0, False);
  FTableCompromissos.FieldDefs.Add('DataInicio', ftDateTime, 0, False);
  FTableCompromissos.FieldDefs.Add('DataFim', ftDateTime, 0, False);
  FTableCompromissos.FieldDefs.Add('Assunto', ftstring, 50, False);
  FTableCompromissos.FieldDefs.Add('Descricao', ftstring, 500, False);
end;

procedure TForm_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDataSource.Free;
  FTableCompromissos.Free;
end;

procedure TForm_Principal.FormCreate(Sender: TObject);
begin
  FDataSource := TDataSource.Create(nil);
  FTableCompromissos := TFDMemTable.Create(nil);

  FAgenda := TAgenda.New;

  CriarTabelaAgenda;

  FDataSource.DataSet := FTableCompromissos;
  DbgCompromissos.DataSource := FDataSource;
  ConfigurarExibicao;
end;

procedure TForm_Principal.BtnAdicionarClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Cadastro_Compromisso, Form_Cadastro_Compromisso);
   try
     Form_Cadastro_Compromisso.AdicionarCompromisso(FAgenda.Compromissos.Count + 1);

     if Form_Cadastro_Compromisso.ModalResult = mrOk then
     begin
       FAgenda.Agendar( TCompromisso.New.Codigo(FAgenda.Compromissos.Count + 1)
                                        .DataInicio(Form_Cadastro_Compromisso.DateInicio.Date + Form_Cadastro_Compromisso.TimeInicio.Time)
                                        .DataFim(Form_Cadastro_Compromisso.DateFinalizacao.Date + Form_Cadastro_Compromisso.TimeFim.Time)
                                        .Assunto(Form_Cadastro_Compromisso.EdtAssunto.Text)
                                        .Descricao(Form_Cadastro_Compromisso.MemoDescricao.Text))
     end
     else
       Exit;
   finally
     FreeAndNil(Form_Cadastro_Compromisso);
   end;

  AtualizarGrid(FAgenda);
end;

procedure TForm_Principal.BtnAlterarClick(Sender: TObject);
var
  LInputCompromisso: string;
  LCodCompromisso: integer;

begin
   if not InputQuery('Altera��o de compromisso','Informe o c�digo do compromisso a ser alterado:', LInputCompromisso) then
     Exit;

   LCodCompromisso := StrToIntDef(LInputCompromisso, 0);

   if (LCodCompromisso <= 0) or (not FAgenda.PesquisarCompromisso(LCodCompromisso)) then
     raise Exception.Create('Compromisso n�o encontrado!');

   Application.CreateForm(TForm_Cadastro_Compromisso, Form_Cadastro_Compromisso);
   try
     Form_Cadastro_Compromisso.AlterarCompromisso(FAgenda.BuscarCompromisso(LCodCompromisso));

     if Form_Cadastro_Compromisso.ModalResult = mrOk then
       FAgenda.AlterarAgendamento(TCompromisso.New.Codigo(LCodCompromisso)
                                                  .DataInicio(Form_Cadastro_Compromisso.DateInicio.Date)
                                                  .HoraInicio(Form_Cadastro_Compromisso.TimeInicio.Time)
                                                  .DataFim(Form_Cadastro_Compromisso.DateFinalizacao.Date)
                                                  .HoraFim(Form_Cadastro_Compromisso.TimeFim.Time)
                                                  .Assunto(Form_Cadastro_Compromisso.EdtAssunto.Text)
                                                  .Descricao(Form_Cadastro_Compromisso.MemoDescricao.Text)
                                  );
   finally
     FreeAndNil(Form_Cadastro_Compromisso);
   end;

   AtualizarGrid(FAgenda);
end;

procedure TForm_Principal.BtnExcluirClick(Sender: TObject);
var
  LInputCodCompromisso: string;
  LCodCompromisso: integer;
begin
  if not InputQuery('Exclus�o de Compromisso','Informe o c�digo do compromisso a ser exclu�do:', LInputCodCompromisso) then
     Exit;

  LCodCompromisso := StrToIntDef(LInputCodCompromisso, 0);

  if (LCodCompromisso <= 0) or (not FAgenda.PesquisarCompromisso(LCodCompromisso)) then
    raise Exception.Create('Compromisso n�o encontrado!');

  FAgenda.RemoverAgendamento(LCodCompromisso);

  AtualizarGrid(FAgenda)
end;

procedure TForm_Principal.BtnPesquisarClick(Sender: TObject);
var
  LAgenda: IAgenda;
begin
  Application.CreateForm(TForm_Pesquisa_Compromissos, Form_Pesquisa_Compromissos);
  try
    LAgenda := TAgenda.New;
    LAgenda := FAgenda;

    Form_Pesquisa_Compromissos.Pesquisar(LAgenda);

    if Form_Pesquisa_Compromissos.ModalResult = mrOk then
      AtualizarGrid(Form_Pesquisa_Compromissos.Agenda)
    else
      AtualizarGrid(FAgenda);

  finally
    FreeAndNil(Form_Pesquisa_Compromissos);
  end;
end;

end.
