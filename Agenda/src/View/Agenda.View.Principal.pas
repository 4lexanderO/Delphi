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
  Agenda.Interfaces.Agenda, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TForm_Principal = class(TForm)
    PnlBackground: TPanel;
    PnlOpcoes: TPanel;
    PnlDados: TPanel;
    PnlBotoes: TPanel;
    PnlLblOpcoes: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
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
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    FDataSource: TDataSource;
    FTableCompromissos: TFDMemTable;
    FAgenda: IAgenda;

    procedure CriarTabelaAgenda;
    procedure AtualizarGrid;
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
  Agenda.View.Cadastro.Compromissos;

{$R *.dfm}

procedure TForm_Principal.AtualizarGrid;
begin
  FTableCompromissos.DisableControls;
  try
    FTableCompromissos.Close;
    FTableCompromissos.Open;

    for var i:integer := 0 to FAgenda.Count -1 do
       begin
         FTableCompromissos.Append;
         FTableCompromissos.FieldByName('Codigo').AsInteger := FAgenda.Compromissos[i].Codigo;
         FTableCompromissos.FieldByName('DataInicio').AsDateTime := FAgenda.Compromissos[i].DataInicio;
         FTableCompromissos.FieldByName('DataFim').AsDateTime := FAgenda.Compromissos[i].DataFim;
         FTableCompromissos.FieldByName('Assunto').AsString := FAgenda.Compromissos[i].Assunto;
         FTableCompromissos.FieldByName('Descricao').AsString := FAgenda.Compromissos[i].Descricao;

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

procedure TForm_Principal.SpeedButton1Click(Sender: TObject);
begin
   Application.CreateForm(TForm_Cadastro_Compromisso, Form_Cadastro_Compromisso);
   try
     Form_Cadastro_Compromisso.EdtCodigo.Text := (FAgenda.Compromissos.Count + 1).ToString;
     Form_Cadastro_Compromisso.AdicionarCompromisso;

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

  AtualizarGrid;
end;

end.
