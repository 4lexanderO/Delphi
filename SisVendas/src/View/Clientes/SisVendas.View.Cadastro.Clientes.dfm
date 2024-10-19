object Form_Cadastro_Clientes: TForm_Cadastro_Clientes
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 420
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 17
  object PnlBackground: TPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 420
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 470
    ExplicitHeight = 412
    object PnlBotoes: TPanel
      Left = 0
      Top = 379
      Width = 472
      Height = 41
      Align = alBottom
      Color = clWhite
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      ExplicitTop = 371
      ExplicitWidth = 470
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 130
        Height = 39
        Align = alLeft
        ShowCaption = False
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 131
        Top = 1
        Width = 210
        Height = 39
        Align = alClient
        ShowCaption = False
        TabOrder = 1
        ExplicitLeft = 240
        ExplicitTop = -8
        ExplicitWidth = 185
        ExplicitHeight = 41
        object SpeedButton1: TSpeedButton
          Left = 1
          Top = 1
          Width = 100
          Height = 37
          Align = alLeft
          Caption = 'Salvar'
        end
        object SpeedButton2: TSpeedButton
          Left = 109
          Top = 1
          Width = 100
          Height = 37
          Align = alRight
          Caption = 'Cancelar'
          ExplicitLeft = 161
          ExplicitTop = 5
        end
      end
      object Panel3: TPanel
        Left = 341
        Top = 1
        Width = 130
        Height = 39
        Align = alRight
        ShowCaption = False
        TabOrder = 2
        ExplicitLeft = 351
      end
    end
    object PnlDados: TPanel
      Left = 0
      Top = 0
      Width = 472
      Height = 379
      Align = alClient
      Color = clWhite
      Enabled = False
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 46
        Height = 17
        Caption = 'C'#243'digo:'
      end
      object Label2: TLabel
        Left = 152
        Top = 16
        Width = 29
        Height = 17
        Caption = 'Tipo:'
      end
      object LblDocumento: TLabel
        Left = 288
        Top = 16
        Width = 70
        Height = 17
        Caption = 'Documento:'
      end
      object Label3: TLabel
        Left = 16
        Top = 72
        Width = 77
        Height = 17
        Caption = 'Raz'#227'o Social:'
      end
      object Label4: TLabel
        Left = 16
        Top = 128
        Width = 90
        Height = 17
        Caption = 'Nome Fantasia:'
      end
      object EdtCodigo: TEdit
        Left = 16
        Top = 39
        Width = 121
        Height = 25
        TabOrder = 0
      end
      object CbTipo: TComboBox
        Left = 152
        Top = 39
        Width = 121
        Height = 25
        TabOrder = 1
        Text = 'CbTipo'
      end
      object EdtDocumento: TEdit
        Left = 288
        Top = 39
        Width = 161
        Height = 25
        TabOrder = 2
      end
      object EdtRazaoSocial: TEdit
        Left = 16
        Top = 95
        Width = 433
        Height = 25
        TabOrder = 3
      end
      object EdtNomeFantasia: TEdit
        Left = 16
        Top = 151
        Width = 433
        Height = 25
        TabOrder = 4
      end
    end
  end
end
