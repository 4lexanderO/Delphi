unit Agenda.View.Pesquisa.Compromissos;

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
  Vcl.StdCtrls,
  Agenda.Interfaces.Agenda;

type
  TForm_Pesquisa_Compromissos = class(TForm)
    PnlBackground: TPanel;
    PnlBotoes: TPanel;
    Panel2: TPanel;
    PnlOpcoes: TPanel;
    PnlLblOpcoes: TPanel;
    BtnConfirmar: TSpeedButton;
    BtnCancelar: TSpeedButton;
    ckCodigo: TCheckBox;
    EdtCodigo: TEdit;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    FAgenda: IAgenda;
  public
    { Public declarations }
    procedure Pesquisar(Agenda: IAgenda);
    property Agenda: IAgenda read FAgenda write FAgenda;
  end;

var
  Form_Pesquisa_Compromissos: TForm_Pesquisa_Compromissos;

implementation

{$R *.dfm}

{ TForm_Pesquisa_Compromissos }

procedure TForm_Pesquisa_Compromissos.BtnCancelarClick(Sender: TObject);
begin
  ModalResult := mrAbort;
end;

procedure TForm_Pesquisa_Compromissos.BtnConfirmarClick(Sender: TObject);
begin
  if ckCodigo.Checked then
    FAgenda := FAgenda.Filtrar(ftCodigo, FAgenda, StrToInt(EdtCodigo.Text));

  ModalResult := mrOk;
end;

procedure TForm_Pesquisa_Compromissos.Pesquisar(Agenda: IAgenda);
begin
  FAgenda := Agenda;
  Self.ShowModal;
end;

end.
