program SisCadastro;

uses
  Vcl.Forms,
  SisCadastro.View.Principal in 'View\SisCadastro.View.Principal.pas' {Form_Principal},
  SisCadastro.View.Cadastro in 'View\Cadastro\SisCadastro.View.Cadastro.pas' {Form_Cadastro_Clientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Principal, Form_Principal);
  Application.Run;
end.
