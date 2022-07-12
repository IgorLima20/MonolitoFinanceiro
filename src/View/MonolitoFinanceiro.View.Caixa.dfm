inherited frmCaixa: TfrmCaixa
  Caption = 'Caixa'
  ClientHeight = 421
  ClientWidth = 621
  ExplicitWidth = 627
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlPrincipal: TCardPanel
    Width = 621
    Height = 421
    inherited cardCadastro: TCard
      Width = 619
      Height = 419
      ExplicitLeft = 0
      ExplicitWidth = 619
      ExplicitHeight = 419
      object Label2: TLabel [0]
        Left = 40
        Top = 48
        Width = 69
        Height = 13
        Caption = 'N'#186' Documento'
      end
      object Label3: TLabel [1]
        Left = 40
        Top = 104
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label4: TLabel [2]
        Left = 41
        Top = 168
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      inherited Panel1: TPanel
        Top = 360
        Width = 619
        inherited btnCancelar: TButton
          Left = 536
        end
        inherited btnSalvar: TButton
          Left = 454
        end
      end
      object edtNumero: TEdit
        Left = 40
        Top = 67
        Width = 89
        Height = 21
        TabOrder = 1
      end
      object edtDescricao: TEdit
        Left = 41
        Top = 123
        Width = 256
        Height = 21
        TabOrder = 2
      end
      object edtValor: TEdit
        Left = 41
        Top = 187
        Width = 88
        Height = 21
        TabOrder = 3
      end
      object RadioGroup1: TRadioGroup
        Left = 40
        Top = 232
        Width = 257
        Height = 65
        Caption = 'Tipo'
        Columns = 2
        Items.Strings = (
          'Receita'
          'Despesa')
        TabOrder = 4
      end
    end
    inherited cardPesquisa: TCard
      Width = 619
      Height = 419
      inherited pnlPesquisa: TPanel
        Width = 619
        object Label5: TLabel [1]
          Left = 216
          Top = 8
          Width = 24
          Height = 14
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        inherited btnPesquisar: TButton
          Left = 537
        end
        object cbTipo: TComboBox
          Left = 216
          Top = 27
          Width = 145
          Height = 22
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 2
          Text = 'TODOS'
          Items.Strings = (
            'TODOS'
            'RECEITAS'
            'DESPESAS')
        end
      end
      inherited pnlBotoes: TPanel
        Top = 360
        Width = 619
        inherited btnFechar: TButton
          Left = 536
        end
      end
      inherited pnlGrind: TPanel
        Width = 619
        Height = 303
        inherited DBGrid1: TDBGrid
          Width = 617
          Height = 301
          DataSource = DataSource1
          Columns = <
            item
              Expanded = False
              FieldName = 'DATA_CADASTRO'
              Title.Caption = 'Data '
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO_DOC'
              Title.Caption = 'N'#186' Documento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 242
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Title.Alignment = taRightJustify
              Title.Caption = 'Tipo'
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Title.Alignment = taRightJustify
              Title.Caption = 'Valor'
              Visible = True
            end>
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = dmCaixa.cdsCaixa
  end
end
