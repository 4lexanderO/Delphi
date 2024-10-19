object Form_Cadastro_Clientes: TForm_Cadastro_Clientes
  Left = 0
  Top = 0
  Caption = 'Adicionar Clientes'
  ClientHeight = 441
  ClientWidth = 581
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 581
    Height = 441
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 396
      Width = 581
      Height = 45
      Align = alBottom
      Color = clWhite
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      ExplicitTop = 388
      ExplicitWidth = 579
      object SpeedButton1: TSpeedButton
        Left = 158
        Top = 6
        Width = 115
        Height = 33
        Caption = 'Salvar'
      end
      object SpeedButton2: TSpeedButton
        Left = 294
        Top = 6
        Width = 115
        Height = 33
        Caption = 'Cancelar'
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 581
      Height = 396
      Align = alClient
      Color = clWhite
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
      ExplicitWidth = 579
      ExplicitHeight = 388
      object Label1: TLabel
        Left = 8
        Top = 14
        Width = 53
        Height = 21
        Caption = 'C'#243'digo:'
      end
      object Label2: TLabel
        Left = 8
        Top = 57
        Width = 46
        Height = 21
        Caption = 'Nome:'
      end
      object Label3: TLabel
        Left = 192
        Top = 14
        Width = 33
        Height = 21
        Caption = 'Tipo:'
      end
      object Label4: TLabel
        Left = 8
        Top = 102
        Width = 33
        Height = 21
        Caption = 'CPF:'
      end
      object Edit1: TEdit
        Left = 65
        Top = 11
        Width = 112
        Height = 29
        TabOrder = 0
      end
      object ComboBox1: TComboBox
        Left = 231
        Top = 11
        Width = 123
        Height = 29
        TabOrder = 1
        Text = 'ComboBox1'
      end
      object Edit2: TEdit
        Left = 65
        Top = 99
        Width = 289
        Height = 29
        TabOrder = 2
      end
      object Edit3: TEdit
        Left = 65
        Top = 54
        Width = 289
        Height = 29
        TabOrder = 3
      end
      object PnlImagem: TPanel
        Left = 367
        Top = 11
        Width = 201
        Height = 228
        Color = clWhite
        ParentBackground = False
        ShowCaption = False
        TabOrder = 4
        object ImgCliente: TImage
          Left = 1
          Top = 1
          Width = 199
          Height = 185
          Align = alClient
          ExplicitLeft = 31
          ExplicitTop = 45
          ExplicitWidth = 185
          ExplicitHeight = 198
        end
        object PnlBotoesImagem: TPanel
          Left = 1
          Top = 186
          Width = 199
          Height = 41
          Align = alBottom
          Color = clWhite
          Padding.Left = 5
          Padding.Top = 5
          Padding.Right = 5
          Padding.Bottom = 5
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          ExplicitLeft = 96
          ExplicitTop = 120
          ExplicitWidth = 185
          object SpeedButton3: TSpeedButton
            Left = 6
            Top = 6
            Width = 88
            Height = 29
            Align = alLeft
            Caption = 'Alterar'
          end
          object SpeedButton4: TSpeedButton
            Left = 105
            Top = 6
            Width = 88
            Height = 29
            Align = alRight
            Caption = 'Remover'
          end
        end
      end
      object DBGrid1: TDBGrid
        Left = 24
        Top = 176
        Width = 320
        Height = 120
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 296
    Top = 264
  end
end
