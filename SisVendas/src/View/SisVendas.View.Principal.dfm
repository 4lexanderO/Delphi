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
  OnShow = FormShow
  TextHeight = 16
  object PgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 587
    Height = 541
    ActivePage = TsCliente
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 585
    ExplicitHeight = 533
    object TsPrincipal: TTabSheet
      Caption = 'Principal'
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
        Color = clWhite
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
        OnEnter = EdtClienteNomeEnter
        ExplicitWidth = 577
        object lblClienteNome: TLabel
          Left = 103
          Top = 16
          Width = 38
          Height = 16
          Caption = 'Nome:'
        end
        object lblClienteCodigo: TLabel
          Left = 12
          Top = 16
          Width = 44
          Height = 16
          Caption = 'C'#243'digo:'
        end
        object lblClienteAnoNascimento: TLabel
          Left = 436
          Top = 16
          Width = 115
          Height = 16
          Caption = 'Ano de Nascimento:'
        end
        object EdtClienteCodigo: TEdit
          Left = 12
          Top = 38
          Width = 85
          Height = 24
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object EdtClienteNome: TEdit
          Left = 103
          Top = 38
          Width = 327
          Height = 24
          Enabled = False
          TabOrder = 1
          OnEnter = EdtClienteNomeEnter
        end
        object EdtClienteAnoNascimento: TEdit
          Left = 436
          Top = 38
          Width = 131
          Height = 24
          Enabled = False
          TabOrder = 2
          OnEnter = EdtClienteNomeEnter
        end
      end
      object PnlClienteBotoes: TPanel
        Left = 0
        Top = 460
        Width = 579
        Height = 50
        Align = alBottom
        BevelOuter = bvNone
        Color = clWhite
        Padding.Left = 4
        Padding.Top = 4
        Padding.Right = 4
        Padding.Bottom = 4
        ParentBackground = False
        ShowCaption = False
        TabOrder = 1
        ExplicitTop = 89
        ExplicitWidth = 577
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
