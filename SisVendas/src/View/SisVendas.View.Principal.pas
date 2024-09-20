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
  SisVendas.Model.Cliente, SisVendas.Interfaces.Factory.Model.Cliente;
type
  TForm_Principal = class(TForm)
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
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
  SisVendas.Factory.Model.Cliente;

{$R *.dfm}

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
