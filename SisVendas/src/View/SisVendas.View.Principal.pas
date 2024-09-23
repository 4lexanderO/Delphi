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
  SisVendas.Interfaces.Cliente,
  SisVendas.Model.Cliente, SisVendas.Interfaces.Factory.Model.Cliente,
  Vcl.ComCtrls, SisVenda.Model.Sistema.Mensagens;
type
  TForm_Principal = class(TForm)
    PgcPrincipal: TPageControl;
    TsPrincipal: TTabSheet;
    TsClientes: TTabSheet;
    TsProdutos: TTabSheet;
    TsVendas: TTabSheet;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LCliente: ICliente;
  end;

var
  Form_Principal: TForm_Principal;

implementation

uses
  SisVendas.Factory.Model.Cliente,
  SisVendas.Model.Sistema.Mensagens,
  SisVendas.Interfaces.Model.Sistema.Mensagens;

{$R *.dfm}

procedure TForm_Principal.FormShow(Sender: TObject);
begin
  PgcPrincipal.ActivePageIndex := 0;

  TMensagem.New.Mensagem(tmCustom, 'Bem-vindo(a) ao SisVendas!', 'Este sistema est� sendo desenvolvido como portf�lio de Alexander Oliveira!');
end;

procedure TForm_Principal.SpeedButton1Click(Sender: TObject);
begin
  LCliente := TFactoryCliente.New.Cliente;
  LCliente := TCliente.New.Codigo(123)
                          .Nome('Cliente A')
                          .AnoNascimento(1997);

  ShowMessage('Cliente: ' + LCliente.Nome + sLineBreak +
              'C�digo: ' + LCliente.Codigo.ToString + sLineBreak +
              'Idade: ' + LCliente.Idade.ToString + ' anos');
end;

end.
