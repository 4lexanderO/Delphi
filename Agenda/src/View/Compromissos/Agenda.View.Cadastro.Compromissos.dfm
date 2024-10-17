object Form_Cadastro_Compromisso: TForm_Cadastro_Compromisso
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Compromissos'
  ClientHeight = 482
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object PnlBackground: TPanel
    Left = 0
    Top = 0
    Width = 423
    Height = 482
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object PnlBotoes: TPanel
      Left = 0
      Top = 438
      Width = 423
      Height = 44
      Align = alBottom
      ShowCaption = False
      TabOrder = 0
      object BtnSalvar: TSpeedButton
        Left = 1
        Top = 1
        Width = 100
        Height = 42
        Align = alLeft
        Caption = 'Salvar'
        OnClick = BtnSalvarClick
      end
      object BtnCancelar: TSpeedButton
        Left = 101
        Top = 1
        Width = 100
        Height = 42
        Align = alLeft
        Caption = 'Cancelar'
        OnClick = BtnCancelarClick
        ExplicitLeft = 234
        ExplicitTop = 6
      end
    end
    object PnlDados: TPanel
      Left = 0
      Top = 0
      Width = 423
      Height = 438
      Align = alClient
      ShowCaption = False
      TabOrder = 1
      object Label1: TLabel
        Left = 26
        Top = 16
        Width = 44
        Height = 16
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object EdtCodigo: TEdit
        Left = 26
        Top = 38
        Width = 89
        Height = 24
        TabStop = False
        ReadOnly = True
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 16
        Top = 68
        Width = 393
        Height = 77
        TabOrder = 1
        object Label2: TLabel
          Left = 10
          Top = 15
          Width = 83
          Height = 16
          Caption = 'Data de In'#237'cio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 10
          Top = 41
          Width = 116
          Height = 16
          Caption = 'Data de Finaliza'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 241
          Top = 15
          Width = 47
          Height = 16
          Caption = 'Hor'#225'rio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 241
          Top = 41
          Width = 47
          Height = 16
          Caption = 'Hor'#225'rio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DateFinalizacao: TDateTimePicker
          Left = 132
          Top = 41
          Width = 103
          Height = 24
          Date = 45580.000000000000000000
          Format = 'dd/MM/yyyy'
          Time = 45580.000000000000000000
          MinDate = 36526.000000000000000000
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          TabStop = False
          OnExit = DateFinalizacaoExit
        end
        object DateInicio: TDateTimePicker
          Left = 130
          Top = 11
          Width = 105
          Height = 24
          CalAlignment = dtaRight
          Date = 45580.000000000000000000
          Format = 'dd/MM/yyyy'
          Time = 45580.000000000000000000
          MinDate = 36526.000000000000000000
          TabOrder = 1
          TabStop = False
        end
        object TimeFim: TDateTimePicker
          Left = 294
          Top = 41
          Width = 83
          Height = 24
          Date = 45580.000000000000000000
          Format = 'HH:mm:ss'
          Time = 0.625073761577368700
          Kind = dtkTime
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TabStop = False
          OnExit = DateFinalizacaoExit
        end
        object TimeInicio: TDateTimePicker
          Left = 294
          Top = 11
          Width = 83
          Height = 24
          CalAlignment = dtaRight
          Date = 45580.000000000000000000
          Format = 'HH:mm:ss'
          Time = 0.625073761577368700
          Kind = dtkTime
          TabOrder = 3
          TabStop = False
        end
      end
      object Panel2: TPanel
        Left = 16
        Top = 152
        Width = 393
        Height = 265
        TabOrder = 2
        object Label4: TLabel
          Left = 10
          Top = 0
          Width = 50
          Height = 16
          Caption = 'Assunto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 10
          Top = 54
          Width = 60
          Height = 16
          Caption = 'Descricao:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object EdtAssunto: TEdit
          Left = 10
          Top = 22
          Width = 367
          Height = 24
          MaxLength = 50
          TabOrder = 0
        end
        object MemoDescricao: TMemo
          Left = 10
          Top = 76
          Width = 367
          Height = 173
          MaxLength = 500
          TabOrder = 1
        end
      end
    end
  end
end
