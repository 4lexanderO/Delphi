//
// Desenvolvido por Alexander Oliveira
//
// github: https://www.linkedin.com/in/alexanderwoliveira/
// linkedin: https://github.com/4lexanderO/
//

unit SisVendas.View.Principal;

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
  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  System.Generics.Collections, Vcl.ExtCtrls, SisVendas.Model.Singleton.Vendas;

type
  TForm_Principal = class(TForm)
    PgcPrincipal: TPageControl;
    TsPrincipal: TTabSheet;
    TsCliente: TTabSheet;
    TsProduto: TTabSheet;
    TsVenda: TTabSheet;
    Button1: TButton;
    Label1: TLabel;
    EdtClienteCodigo: TEdit;
    Label2: TLabel;
    EdtClienteNome: TEdit;
    EdtClienteAnoNascimento: TEdit;
    Label3: TLabel;
    PnlClienteDados: TPanel;
    PnlClienteBotoes: TPanel;
    BtnClienteSalvar: TSpeedButton;
    BtnClienteAlterar: TSpeedButton;
    BtnClienteCancelar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtnClienteAlterarClick(Sender: TObject);
    procedure BtnClienteSalvarClick(Sender: TObject);
    procedure BtnClienteCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AlterarDadosCliente(Alterar: Boolean);
  public
    { Public declarations }
    LVendas : TVendas;
  end;

var
  Form_Principal: TForm_Principal;

implementation

uses
  SisVendas.Factory.Model.Cliente,
  SisVendas.Model.Sistema.Mensagens,
  SisVendas.Interfaces.Model.Sistema.Mensagens,
  SisVendas.Model.DAO.Cliente,
  SisVendas.Interfaces.Factory.Model.Cliente,
  SisVendas.Interfaces.Cliente,
  SisVendas.Model.Cliente,
  SisVenda.Model.Sistema.Mensagens;

{$R *.dfm}

{$REGION 'Clientes'}

procedure TForm_Principal.BtnClienteAlterarClick(Sender: TObject);
begin
  AlterarDadosCliente(True);
end;

procedure TForm_Principal.BtnClienteCancelarClick(Sender: TObject);
begin
  AlterarDadosCliente(False);
end;

procedure TForm_Principal.BtnClienteSalvarClick(Sender: TObject);
begin
  LVendas.New.Cliente := TFactoryCliente.New.Cliente
                                     .Codigo(1)
                                     .Nome(EdtClienteNome.Text)
                                     .AnoNascimento(StrToInt(EdtClienteAnoNascimento.Text));

  ShowMessage(LVendas.New.Cliente.Nome);

  AlterarDadosCliente(False);
end;

{$ENDREGION}



procedure TForm_Principal.Button1Click(Sender: TObject);
begin
  TDAOCliente.New
             .Add(TFactoryCliente.New.Cliente
                  .Codigo(123)
                  .Nome('Cliente A')
                  .AnoNascimento(1997))
             .Add(TFactoryCliente.New.Cliente
                  .Codigo(456)
                  .Nome('Cliente B')
                  .AnoNascimento(1998))
             .Add(TFactoryCliente.New.Cliente
                  .Codigo(789)
                  .Nome('Cliente C')
                  .AnoNascimento(1999))
             .Salvar;
end;

procedure TForm_Principal.AlterarDadosCliente(Alterar: Boolean);
begin
  BtnClienteAlterar.Enabled := not Alterar;
  BtnClienteSalvar.Enabled := Alterar;
  BtnClienteCancelar.Enabled := Alterar;
end;

procedure TForm_Principal.FormCreate(Sender: TObject);
begin
  LVendas := TVendas.New;
end;

procedure TForm_Principal.FormShow(Sender: TObject);
begin
  PgcPrincipal.ActivePageIndex := 0;

  TMensagem.New.Mensagem(tmCustom, 'Bem-vindo(a) ao SisVendas!', 'Este sistema est� sendo desenvolvido como portf�lio de Alexander Oliveira!');
end;

end.
