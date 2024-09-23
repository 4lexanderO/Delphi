//
// Desenvolvido por Alexander Oliveira
//
// github: https://www.linkedin.com/in/alexanderwoliveira/
// linkedin: https://github.com/4lexanderO/
//

unit SisVenda.Model.Sistema.Mensagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.Skia, Vcl.Skia,
  Vcl.StdCtrls, Vcl.Mask, System.ImageList, Vcl.ImgList, Vcl.Buttons, ShellAPI;

type
  TTipoMensagem = (tmAlert, tmError, tmSuccess, tmCustom);

  TTipoBotoes = (tbYesNo, tbOk);

  TForm_Sistema_Mensagens = class(TForm)
    PnlMensagem: TPanel;
    PnlBotoes: TPanel;
    pnlImagem: TPanel;
    SkImage: TSkAnimatedImage;
    MemoMensagem: TMemo;
    PnlDados: TPanel;
    ImlBotoes: TImageList;
    BtnFechar: TSpeedButton;
    BtnConfirmar: TSpeedButton;
    BtnCancelar: TSpeedButton;
    MemoTitulo: TMemo;
    MemoReferencia: TMemo;
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure MemoReferenciaClick(Sender: TObject);
  private
    { Private declarations }
    LPathImagem: string;
    procedure ConfigurarExibicao(TipoMensagem: TTipoMensagem; TipoBotoes: TTipoBotoes;
                                 Titulo, Mensagem: string);
  public
    { Public declarations }
    procedure ShowMessage(TipoMensagem: TTipoMensagem; Titulo, Mensagem: string);
    procedure ShowException(TipoMensagem: TTipoMensagem; TipoBotoes: TTipoBotoes;
                            Titulo, Mensagem: string);
  end;

var
  Form_Sistema_Mensagens: TForm_Sistema_Mensagens;

implementation

{$R *.dfm}

{ TForm_Sistema_Mensagens }

procedure TForm_Sistema_Mensagens.ShowException(TipoMensagem:
                                           TTipoMensagem; TipoBotoes: TTipoBotoes;
                                           Titulo, Mensagem: string);
begin
  ConfigurarExibicao(TipoMensagem, TipoBotoes, Titulo, Mensagem);
  Self.ShowModal;
end;

procedure TForm_Sistema_Mensagens.ShowMessage(TipoMensagem: TTipoMensagem;
  Titulo, Mensagem: string);
begin
  ConfigurarExibicao(TipoMensagem, tbOk, Titulo, Mensagem);

  MemoReferencia.Visible := True;
  Self.ShowModal;
end;

procedure TForm_Sistema_Mensagens.BtnConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TForm_Sistema_Mensagens.BtnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TForm_Sistema_Mensagens.BtnFecharClick(Sender: TObject);
begin
  ModalResult := mrAbort;
end;

procedure TForm_Sistema_Mensagens.ConfigurarExibicao(
  TipoMensagem: TTipoMensagem; TipoBotoes: TTipoBotoes; Titulo, Mensagem: string);
begin
  case TipoMensagem of
    tmAlert: begin
               Self.Caption := 'Alerta';
               LPathImagem := GetCurrentDir + '\Resources\Images\Alertgif.gif';
             end;
    tmError: begin
               Self.Caption := 'Erro';
               LPathImagem := GetCurrentDir + '\Resources\Images\ErrorGif.gif';
             end;
  tmSuccess: begin
               Self.Caption := 'Sucesso';
               LPathImagem := GetCurrentDir + '\Resources\Images\SuccessGif.gif';
             end;
   tmCustom: begin
               Self.Caption := 'Mensagem';
               LPathImagem := GetCurrentDir + '\Resources\Images\Custom2.gif';
               SkImage.Animation.Speed := 1;
             end;
  end;

  case TipoBotoes of
    tbYesNo: begin
               BtnConfirmar.Visible := True;
               BtnCancelar.Visible := True;
             end;
    tbOk: BtnFechar.Visible := True;

  end;

  if Length(Trim(Titulo)) > 0 then
    MemoTitulo.Lines.Add(Titulo);

  if Length(Trim(Mensagem)) > 0 then
    MemoMensagem.Lines.Add(Mensagem);

  if FileExists(LPathImagem) then
    SKImage.LoadFromFile(LPathImagem);
end;

procedure TForm_Sistema_Mensagens.MemoReferenciaClick(Sender: TObject);
begin
  ShellExecute(handle, 'open', 'https://www.linkedin.com/in/alexanderwoliveira/', '', nil, SW_SHOWMAXIMIZED);
end;

end.
