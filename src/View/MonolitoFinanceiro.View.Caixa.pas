unit MonolitoFinanceiro.View.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MonolitoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels;

type
  TfrmCaixa = class(TfrmCadastroPadrao)
    Label2: TLabel;
    edtNumero: TEdit;
    edtDescricao: TEdit;
    Label3: TLabel;
    edtValor: TEdit;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    cbTipo: TComboBox;
    Label5: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar; override;
  end;

var
  frmCaixa: TfrmCaixa;

implementation

{$R *.dfm}

uses MonolitoFinanceiro.Model.Caixa, MonolitoFinanceiro.Utilitarios;

{ TfrmCadastroPadrao1 }

procedure TfrmCaixa.btnAlterarClick(Sender: TObject);
begin
  inherited;
  edtNumero.Text := dmCaixa.cdsCaixaNUMERO_DOC.AsString;
  edtDescricao.Text := dmCaixa.cdsCaixaDESCRICAO.AsString;
  edtValor.Text := dmCaixa.cdsCaixaVALOR.AsString;
  if dmCaixa.cdsCaixaTIPO.AsString = 'R' then
    RadioGroup1.ItemIndex := 0
  else
    RadioGroup1.ItemIndex := 1;
end;

procedure TfrmCaixa.btnSalvarClick(Sender: TObject);
var
  LTipo : string;
begin
  if Trim(edtNumero.Text) = '' then
  begin
    edtNumero.SetFocus;
    Application.MessageBox('O campo N? de Documento n?o pode ser vazio.', 'Aten??o', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  if Trim(edtValor.Text) = '' then
  begin
    edtValor.SetFocus;
    Application.MessageBox('O campo valor n?o pode ser vazio.', 'Aten??o', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  if RadioGroup1.ItemIndex = -1 then
  begin
    edtValor.SetFocus;
    Application.MessageBox('Selecione o tipo do lan?amento', 'Aten??o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  LTipo := 'R';
  if RadioGroup1.ItemIndex = 1 then
    LTipo := 'D';

  if DataSource1.State in [dsInsert] then
  begin
    dmCaixa.cdsCaixaID.AsString :=  TUtilitarios.GetID;
    dmCaixa.cdsCaixaDATA_CADASTRO.AsDateTime := Now;
  end;

  dmCaixa.cdsCaixaNUMERO_DOC.AsString := Trim(edtNumero.Text);
  dmCaixa.cdsCaixaDESCRICAO.AsString := Trim(edtDescricao.Text);
  dmCaixa.cdsCaixaVALOR.AsCurrency := StrToFloat(edtValor.Text);
  dmCaixa.cdsCaixaTIPO.AsString := LTipo;

  inherited;
end;

procedure TfrmCaixa.Pesquisar;
var
  FiltroPesquisa : string;
  FiltroTipo : string;
begin
  case cbTipo.ItemIndex of
   1 : FiltroTipo := ' AND TIPO = ''R''';
   2 : FiltroTipo := ' AND TIPO = ''D''';
  end;
  FiltroPesquisa := TUtilitarios.LikeFind(edtPesquisar.Text, DBGrid1);
  dmCaixa.cdsCaixa.Close;
  dmCaixa.cdsCaixa.CommandText := 'Select * from Caixa where 1 = 1' + FiltroPesquisa + FiltroTipo;
  dmCaixa.cdsCaixa.Open;
  inherited;
end;

end.
