object Form_Principal: TForm_Principal
  Left = 0
  Top = 0
  Caption = 'SisVendas'
  ClientHeight = 541
  ClientWidth = 587
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object PgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 587
    Height = 541
    ActivePage = TsCliente
    Align = alClient
    TabOrder = 0
    object TsPrincipal: TTabSheet
      Caption = 'Principal'
      object Button1: TButton
        Left = 416
        Top = 152
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 0
        OnClick = Button1Click
      end
    end
    object TsCliente: TTabSheet
      Caption = 'Cliente'
      ImageIndex = 1
      object PnlClienteDados: TPanel
        Left = 0
        Top = 0
        Width = 579
        Height = 89
        Align = alTop
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 0
        object Label2: TLabel
          Left = 95
          Top = 16
          Width = 38
          Height = 16
          Caption = 'Nome:'
        end
        object Label1: TLabel
          Left = 4
          Top = 16
          Width = 44
          Height = 16
          Caption = 'C'#243'digo:'
        end
        object Label3: TLabel
          Left = 444
          Top = 16
          Width = 115
          Height = 16
          Caption = 'Ano de Nascimento:'
        end
        object EdtClienteCodigo: TEdit
          Left = 4
          Top = 38
          Width = 85
          Height = 24
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object EdtClienteNome: TEdit
          Left = 95
          Top = 38
          Width = 343
          Height = 24
          TabOrder = 1
        end
        object EdtClienteAnoNascimento: TEdit
          Left = 444
          Top = 38
          Width = 131
          Height = 24
          TabOrder = 2
        end
      end
      object PnlClienteBotoes: TPanel
        Left = 0
        Top = 89
        Width = 579
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        Padding.Left = 4
        Padding.Top = 4
        Padding.Right = 4
        Padding.Bottom = 4
        ShowCaption = False
        TabOrder = 1
        object BtnClienteSalvar: TSpeedButton
          AlignWithMargins = True
          Left = 129
          Top = 4
          Width = 120
          Height = 42
          Margins.Left = 5
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Salvar'
          Enabled = False
          OnClick = BtnClienteSalvarClick
          ExplicitLeft = 131
          ExplicitTop = 6
          ExplicitHeight = 40
        end
        object BtnClienteAlterar: TSpeedButton
          Left = 4
          Top = 4
          Width = 120
          Height = 42
          Align = alLeft
          Caption = 'Alterar'
          OnClick = BtnClienteAlterarClick
          ExplicitLeft = -31
          ExplicitTop = 6
          ExplicitHeight = 40
        end
        object BtnClienteCancelar: TSpeedButton
          AlignWithMargins = True
          Left = 254
          Top = 4
          Width = 120
          Height = 42
          Margins.Left = 5
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Cancelar'
          Enabled = False
          OnClick = BtnClienteCancelarClick
          ExplicitLeft = 318
          ExplicitTop = 6
          ExplicitHeight = 40
        end
      end
    end
    object TsProduto: TTabSheet
      Caption = 'Produto'
      ImageIndex = 2
    end
    object TsVenda: TTabSheet
      Caption = 'Venda'
      ImageIndex = 3
    end
  end
end
