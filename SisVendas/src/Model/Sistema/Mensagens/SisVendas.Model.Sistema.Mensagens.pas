//
// Desenvolvido por Alexander Oliveira
//
// github: https://www.linkedin.com/in/alexanderwoliveira/
// linkedin: https://github.com/4lexanderO/
//

unit SisVendas.Model.Sistema.Mensagens;

interface

uses
  SisVendas.Interfaces.Model.Sistema.Mensagens,
  SisVenda.Model.Sistema.Mensagens;

type
  TMensagem = class(TInterfacedObject, IMensagem)
    private
      FForm: TForm_Sistema_Mensagens;
      constructor Create;
      destructor Destroy; override;
    public
      class function New: IMensagem;

      procedure Mensagem(TipoMensagem: TTipoMensagem; Titulo, Mensagem: string);
      procedure Exception(TipoMensagem: TTipoMensagem; TipoBotoes: TTipoBotoes; Titulo, Mensagem: string);
  end;

implementation

uses
  System.SysUtils;

{ TException }

constructor TMensagem.Create;
begin
  FForm := TForm_Sistema_Mensagens.Create(nil);
end;

destructor TMensagem.Destroy;
begin
  inherited;

  FreeAndNil(FForm);
end;

class function TMensagem.New: IMensagem;
begin
  Result := Self.Create;
end;

procedure TMensagem.Exception(TipoMensagem: TTipoMensagem; TipoBotoes: TTipoBotoes; Titulo, Mensagem: string);
begin
  FForm.ShowException(TipoMensagem, TipoBotoes, Titulo, Mensagem);
end;

procedure TMensagem.Mensagem(TipoMensagem: TTipoMensagem; Titulo, Mensagem: string);
begin
  FForm.ShowMessage(TipoMensagem, Titulo, Mensagem);
end;

end.
