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
  System.Generics.Collections,
  Vcl.ExtCtrls,
  AnsiStrings,
  SisVendas.Model.Singleton.Vendas;

type
  TForm_Principal = class(TForm)
    PgcPrincipal: TPageControl;
    TsPrincipal: TTabSheet;
    TsCliente: TTabSheet;
    TsProduto: TTabSheet;
    TsVenda: TTabSheet;
    lblClienteCodigo: TLabel;
    EdtClienteCodigo: TEdit;
    lblClienteNome: TLabel;
    EdtClienteNome: TEdit;
    EdtClienteAnoNascimento: TEdit;
    lblClienteAnoNascimento: TLabel;
    PnlClienteDados: TPanel;
    PnlClienteBotoes: TPanel;
    BtnClienteSalvar: TSpeedButton;
    BtnClienteAlterar: TSpeedButton;
    BtnClienteCancelar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure BtnClienteAlterarClick(Sender: TObject);
    procedure BtnClienteSalvarClick(Sender: TObject);
    procedure BtnClienteCancelarClick(Sender: TObject);
    procedure EdtClienteNomeEnter(Sender: TObject);
  private
    { Private declarations }
    procedure AlterarDadosCliente(Alterar: Boolean);
    procedure ClearFocusLabels;
    procedure SetFocusLabels(Obj: TObject);
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

procedure TForm_Principal.FormShow(Sender: TObject);
begin
  PgcPrincipal.ActivePageIndex := 0;

  TMensagem.New.Mensagem(tmCustom, 'Bem-vindo(a) ao SisVendas!', 'Este sistema est� sendo desenvolvido como portf�lio de Alexander Oliveira!');
end;

{$REGION 'Focus Labels'}

procedure TForm_Principal.EdtClienteNomeEnter(Sender: TObject);
begin
  ClearFocusLabels;
  SetFocusLabels(Sender);
end;

procedure TForm_Principal.ClearFocusLabels;
begin
  for var i: integer := 0 to Self.ComponentCount -1 do
    if Self.Components[i].ClassType = TLabel then
    begin
      TLabel(Self.Components[i]).Font.Color := clBlack;
      TLabel(Self.Components[i]).Font.Style := [];
    end;
end;

procedure TForm_Principal.SetFocusLabels(Obj: TObject);
begin
  if Obj.ClassName = 'TEdit' then
  begin
    case AnsiIndexStr(TEdit(Obj).Name, ['EdtClienteNome', 'EdtClienteAnoNascimento']) of
      0: begin
            lblClienteNome.Font.Color := clHighlight;
            lblClienteNome.Font.Style := [fsBold];
         end;
      1: begin
           lblClienteAnoNascimento.Font.Color := clHighlight;
           lblClienteAnoNascimento.Font.Style := [fsbold];
         end;
    end;

  end;
end;

{$ENDREGION}

{$REGION 'Clientes'}

procedure TForm_Principal.AlterarDadosCliente(Alterar: Boolean);
begin
  BtnClienteAlterar.Enabled := not Alterar;
  BtnClienteSalvar.Enabled := Alterar;
  BtnClienteCancelar.Enabled := Alterar;

  EdtClienteNome.Enabled := Alterar;
  EdtClienteAnoNascimento.Enabled := Alterar;
end;

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
  TVendas.New.Cliente := TFactoryCliente.New.Cliente
                                            .Codigo(1)
                                            .Nome(EdtClienteNome.Text)
                                            .AnoNascimento(StrToInt(EdtClienteAnoNascimento.Text));

  TDAOCliente.New.Add(TVendas.New.Cliente).Salvar;

  AlterarDadosCliente(False);
end;

{$ENDREGION}

end.
