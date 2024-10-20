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
  Vcl.StdCtrls,
  Vcl.DBCtrls,
  Agenda.Interfaces.Agenda,
  Agenda.Interfaces.Controller.Principal;

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
    FControllerPrincipal: IControllerPrincipal;

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
  Agenda.Controller.Principal;

{$R *.dfm}

procedure TForm_Principal.FormCreate(Sender: TObject);
begin
  FDataSource := TDataSource.Create(nil);
  FTableCompromissos := TFDMemTable.Create(nil);

  FControllerPrincipal := TControllerPrincipal.New;

  CriarTabelaAgenda;
  FDataSource.DataSet := FTableCompromissos;
  DbgCompromissos.DataSource := FDataSource;
  ConfigurarExibicao;
end;

procedure TForm_Principal.CriarTabelaAgenda;
begin
  FTableCompromissos.FieldDefs.Add('Codigo', ftInteger, 0, False);
  FTableCompromissos.FieldDefs.Add('DataInicio', ftDateTime, 0, False);
  FTableCompromissos.FieldDefs.Add('DataFim', ftDateTime, 0, False);
  FTableCompromissos.FieldDefs.Add('Assunto', ftstring, 50, False);
  FTableCompromissos.FieldDefs.Add('Descricao', ftstring, 500, False);
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

procedure TForm_Principal.AtualizarGrid(Agenda: IAgenda);
begin
  FTableCompromissos.DisableControls;
  try
    FTableCompromissos.Close;
    FTableCompromissos.Open;

    if Agenda.Compromissos.Count <= 0 then
      Exit;

    for var i:integer := 0 to Agenda.Compromissos.Count -1 do
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

procedure TForm_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDataSource.Free;
  FTableCompromissos.Free;
end;

procedure TForm_Principal.BtnAdicionarClick(Sender: TObject);
begin
  FControllerPrincipal.Agendar;
  AtualizarGrid(FControllerPrincipal.Agenda);
end;

procedure TForm_Principal.BtnAlterarClick(Sender: TObject);
begin
  if FControllerPrincipal.Agenda.Compromissos.Count = 0 then
    raise Exception.Create('Não há compromissos para alterar!');

  FControllerPrincipal.Alterar;
  AtualizarGrid(FControllerPrincipal.Agenda);
end;

procedure TForm_Principal.BtnExcluirClick(Sender: TObject);
begin
  if FControllerPrincipal.Agenda.Compromissos.Count = 0 then
    raise Exception.Create('Não há compromissos para excluir!');

  FControllerPrincipal.Excluir;
  AtualizarGrid(FControllerPrincipal.Agenda);
end;

procedure TForm_Principal.BtnPesquisarClick(Sender: TObject);
begin
  if FControllerPrincipal.Agenda.Compromissos.Count = 0 then
    raise Exception.Create('Não há compromissos para pesquisar!');

  FControllerPrincipal.Pesquisar;
  AtualizarGrid(FControllerPrincipal.Agenda);
end;

end.
