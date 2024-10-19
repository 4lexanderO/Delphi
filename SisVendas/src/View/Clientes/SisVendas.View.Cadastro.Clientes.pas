unit SisVendas.View.Cadastro.Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm_Cadastro_Clientes = class(TForm)
    PnlBackground: TPanel;
    PnlBotoes: TPanel;
    PnlDados: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdtCodigo: TEdit;
    CbTipo: TComboBox;
    LblDocumento: TLabel;
    EdtDocumento: TEdit;
    Label3: TLabel;
    EdtRazaoSocial: TEdit;
    EdtNomeFantasia: TEdit;
    Label4: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Cadastro_Clientes: TForm_Cadastro_Clientes;

implementation

{$R *.dfm}

end.
