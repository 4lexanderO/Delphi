object Form_Principal: TForm_Principal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Agenda de Compromissos'
  ClientHeight = 586
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object PnlBackground: TPanel
    Left = 0
    Top = 0
    Width = 596
    Height = 586
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 594
    ExplicitHeight = 578
    object PnlOpcoes: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 586
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      ExplicitHeight = 578
      object PnlBotoes: TPanel
        Left = 0
        Top = 41
        Width = 185
        Height = 545
        Align = alClient
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ShowCaption = False
        TabOrder = 0
        ExplicitHeight = 537
        object BtnAdicionar: TSpeedButton
          AlignWithMargins = True
          Left = 6
          Top = 54
          Width = 173
          Height = 43
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Adicionar'
          OnClick = BtnAdicionarClick
          ExplicitLeft = 9
        end
        object BtnAlterar: TSpeedButton
          AlignWithMargins = True
          Left = 6
          Top = 102
          Width = 173
          Height = 43
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Alterar'
          OnClick = BtnAlterarClick
          ExplicitLeft = 12
          ExplicitTop = 262
        end
        object BtnExcluir: TSpeedButton
          AlignWithMargins = True
          Left = 6
          Top = 150
          Width = 173
          Height = 43
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Excluir'
          OnClick = BtnExcluirClick
          ExplicitTop = 310
        end
        object BtnPesquisar: TSpeedButton
          Left = 6
          Top = 6
          Width = 173
          Height = 43
          Align = alTop
          Caption = 'Pesquisar'
          OnClick = BtnPesquisarClick
          ExplicitTop = -25
        end
      end
      object PnlLblOpcoes: TPanel
        Left = 0
        Top = 0
        Width = 185
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
    object PnlDados: TPanel
      Left = 185
      Top = 0
      Width = 411
      Height = 586
      Align = alClient
      Color = clWhite
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
      ExplicitWidth = 409
      ExplicitHeight = 578
      object DbgCompromissos: TDBCtrlGrid
        Left = 1
        Top = 1
        Width = 409
        Height = 584
        Align = alClient
        PanelHeight = 194
        PanelWidth = 388
        TabOrder = 0
        ExplicitWidth = 407
        ExplicitHeight = 576
        object lblCodigo: TDBText
          Left = 12
          Top = 30
          Width = 65
          Height = 17
        end
        object lblDataInicio: TDBText
          Left = 112
          Top = 30
          Width = 121
          Height = 17
        end
        object lblDataFim: TDBText
          Left = 248
          Top = 30
          Width = 129
          Height = 17
        end
        object lblAssunto: TDBText
          Left = 12
          Top = 75
          Width = 365
          Height = 17
        end
        object Label1: TLabel
          Left = 12
          Top = 8
          Width = 48
          Height = 16
          Caption = 'C'#243'digo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 112
          Top = 8
          Width = 94
          Height = 16
          Caption = 'Data de In'#237'cio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 248
          Top = 8
          Width = 129
          Height = 16
          Caption = 'Data de Finaliza'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 12
          Top = 53
          Width = 59
          Height = 16
          Caption = 'Assunto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 12
          Top = 98
          Width = 68
          Height = 16
          Caption = 'Descri'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object MemoDescricao: TDBMemo
          Left = 12
          Top = 120
          Width = 365
          Height = 60
          BorderStyle = bsNone
          ParentShowHint = False
          ReadOnly = True
          ScrollBars = ssVertical
          ShowHint = False
          TabOrder = 0
        end
      end
    end
  end
end
