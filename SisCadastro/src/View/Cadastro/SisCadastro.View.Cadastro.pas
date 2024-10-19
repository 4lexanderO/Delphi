unit SisCadastro.View.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm_Cadastro_Clientes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    ImgCliente: TImage;
    Edit3: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PnlImagem: TPanel;
    PnlBotoesImagem: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    FDMemTable1: TFDMemTable;
    DBGrid1: TDBGrid;
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
