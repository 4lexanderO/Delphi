object Form_Principal: TForm_Principal
  Left = 0
  Top = 0
  Caption = 'SisVendas'
  ClientHeight = 541
  ClientWidth = 587
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 587
    Height = 541
    ActivePage = TsClientes
    Align = alClient
    TabOrder = 0
    object TsPrincipal: TTabSheet
      Caption = 'Principal'
    end
    object TsClientes: TTabSheet
      Caption = 'Clientes'
      ImageIndex = 1
    end
    object TsProdutos: TTabSheet
      Caption = 'Produtos'
      ImageIndex = 2
    end
    object TsVendas: TTabSheet
      Caption = 'Vendas'
      ImageIndex = 3
    end
  end
end
