inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlPrincipal: TCardPanel
    inherited cardCadastro: TCard
      object Label2: TLabel [0]
        Left = 32
        Top = 45
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label3: TLabel [1]
        Left = 32
        Top = 109
        Width = 25
        Height = 13
        Caption = 'Login'
      end
      object Label5: TLabel [2]
        Left = 32
        Top = 173
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object edtNome: TEdit
        Left = 32
        Top = 64
        Width = 281
        Height = 21
        TabOrder = 1
      end
      object edtLogin: TEdit
        Left = 32
        Top = 128
        Width = 153
        Height = 21
        TabOrder = 2
      end
      object ToggleStatus: TToggleSwitch
        Left = 32
        Top = 192
        Width = 106
        Height = 20
        StateCaptions.CaptionOn = 'Ativo'
        StateCaptions.CaptionOff = 'Bloqueado'
        TabOrder = 3
      end
    end
    inherited cardPesquisa: TCard
      inherited pnlGrind: TPanel
        inherited DBGrid1: TDBGrid
          DataSource = DataSource1
          PopupMenu = PopupMenu1
          Columns = <
            item
              Expanded = False
              FieldName = 'nome'
              Title.Caption = 'Nome'
              Width = 326
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'login'
              Title.Caption = 'Login'
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'status'
              Title.Caption = 'Status'
              Width = 46
              Visible = True
            end>
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu [2]
    Left = 521
    Top = 218
    object mnuLimparSenha: TMenuItem
      Caption = 'Limpar Senha'
      OnClick = mnuLimparSenhaClick
    end
  end
  inherited DataSource1: TDataSource
    DataSet = dmUsuarios.cdsUsuarios
    Left = 521
    Top = 282
  end
end
