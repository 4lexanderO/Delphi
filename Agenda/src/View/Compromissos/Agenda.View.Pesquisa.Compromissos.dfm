object Form_Pesquisa_Compromissos: TForm_Pesquisa_Compromissos
  Left = 0
  Top = 0
  Caption = 'Pesquisa de Compromissos'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  TextHeight = 15
  object PnlBackground: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 622
    ExplicitHeight = 433
    object PnlBotoes: TPanel
      Left = 0
      Top = 0
      Width = 136
      Height = 441
      Align = alLeft
      Color = clWhite
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      ExplicitHeight = 433
      object PnlOpcoes: TPanel
        Left = 1
        Top = 42
        Width = 134
        Height = 398
        Align = alClient
        Color = clWhite
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
        ExplicitHeight = 390
        object BtnConfirmar: TSpeedButton
          Left = 1
          Top = 1
          Width = 132
          Height = 43
          Align = alTop
          Caption = 'Confirmar'
          OnClick = BtnConfirmarClick
          ExplicitLeft = 2
          ExplicitTop = 9
        end
        object BtnCancelar: TSpeedButton
          Left = 1
          Top = 44
          Width = 132
          Height = 43
          Align = alTop
          Caption = 'Cancelar'
          OnClick = BtnCancelarClick
          ExplicitLeft = 6
          ExplicitTop = -25
          ExplicitWidth = 173
        end
      end
      object PnlLblOpcoes: TPanel
        Left = 1
        Top = 1
        Width = 134
        Height = 41
        Align = alTop
        Caption = 'Op'#231#245'es'
        Color = clHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel2: TPanel
      Left = 136
      Top = 0
      Width = 488
      Height = 441
      Align = alClient
      Color = clWhite
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
      ExplicitWidth = 486
      ExplicitHeight = 433
      object ckCodigo: TCheckBox
        Left = 16
        Top = 17
        Width = 97
        Height = 17
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object EdtCodigo: TEdit
        Left = 16
        Top = 40
        Width = 121
        Height = 23
        TabOrder = 1
      end
    end
  end
end
