object frmRedefinirSenha: TfrmRedefinirSenha
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Redefinir Senha'
  ClientHeight = 342
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 415
    Height = 342
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 415
      Height = 105
      Align = alTop
      BevelOuter = bvNone
      Padding.Top = 20
      TabOrder = 0
      object lblUsuario: TLabel
        Left = 0
        Top = 20
        Width = 415
        Height = 37
        Align = alTop
        Alignment = taCenter
        Caption = 'Usu'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 99
      end
      object Label3: TLabel
        Left = 0
        Top = 57
        Width = 415
        Height = 16
        Align = alTop
        Alignment = taCenter
        Caption = 'Informe a sua nova senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 149
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 105
      Width = 415
      Height = 237
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 100
      Padding.Right = 100
      TabOrder = 1
      object Panel2: TPanel
        Left = 100
        Top = 0
        Width = 215
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 0
          Top = 0
          Width = 215
          Height = 13
          Align = alTop
          Caption = 'Senha'
          ExplicitWidth = 30
        end
        object edtSenha: TEdit
          Left = 0
          Top = 13
          Width = 215
          Height = 21
          Align = alTop
          PasswordChar = '*'
          TabOrder = 0
        end
      end
      object Panel4: TPanel
        Left = 100
        Top = 72
        Width = 215
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label2: TLabel
          Left = 0
          Top = 0
          Width = 215
          Height = 13
          Align = alTop
          Caption = 'Confirme a sua senha'
          ExplicitWidth = 104
        end
        object edtConfirmarSenha: TEdit
          Left = 0
          Top = 13
          Width = 215
          Height = 21
          Align = alTop
          PasswordChar = '*'
          TabOrder = 0
        end
      end
      object Panel5: TPanel
        Left = 100
        Top = 144
        Width = 215
        Height = 51
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object btnConfirmar: TButton
          Left = 140
          Top = 0
          Width = 75
          Height = 51
          Align = alRight
          Caption = 'Confirmar'
          TabOrder = 0
          OnClick = btnConfirmarClick
        end
        object Button1: TButton
          Left = 0
          Top = 0
          Width = 75
          Height = 51
          Align = alLeft
          Caption = 'Cancelar'
          TabOrder = 1
          OnClick = Button1Click
        end
      end
    end
  end
end
