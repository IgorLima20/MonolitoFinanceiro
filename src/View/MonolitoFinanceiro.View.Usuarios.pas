unit MonolitoFinanceiro.View.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MonolitoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.WinXCtrls,  midaslib,
  Vcl.Menus;

type
  TfrmUsuarios = class(TfrmCadastroPadrao)
    edtNome: TEdit;
    edtLogin: TEdit;
    ToggleStatus: TToggleSwitch;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    PopupMenu1: TPopupMenu;
    mnuLimparSenha: TMenuItem;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure mnuLimparSenhaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    { Protected declarations }
    procedure Pesquisar; override;
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

uses MonolitoFinanceiro.Model.Usuarios, MonolitoFinanceiro.Utilitarios, BCrypt,
  System.SysUtils;



procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;
  edtNome.Text := dmUsuarios.cdsUsuariosnome.AsString;
  edtLogin.Text := dmUsuarios.cdsUsuarioslogin.AsString;
  ToggleStatus.State := tssOn;
  if dmUsuarios.cdsUsuariosstatus.AsString = 'B' then
    ToggleStatus.State := tssOff;
end;

procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
var LStatus : string;
begin
  if Trim(edtNome.Text) = '' then
  begin
    edtNome.SetFocus;
    Application.MessageBox('O campo Nome n?o pode ser vazio.', 'Aten??o', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  if Trim(edtLogin.Text) = '' then
  begin
    edtLogin.SetFocus;
    Application.MessageBox('O campo Login n?o pode ser vazio.', 'Aten??o', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  

  if dmUsuarios.TemLoginCadastrado(Trim(edtLogin.Text), dmUsuarios.cdsUsuarios.FieldByName('ID').AsString) then
  begin
    edtLogin.SetFocus;
    Application.MessageBox(PWideChar(Format('O login %s j? se encontra cadastrado.', [edtLogin.Text])), 'Aten??o', MB_OK + MB_ICONWARNING);
    Abort
  end;


  LStatus := 'A';
  if ToggleStatus.State = tssOff then
    LStatus := 'B';


  if DataSource1.State in [dsInsert] then
  begin
    dmUsuarios.cdsUsuariosid.AsString :=  TUtilitarios.GetID;
    dmUsuarios.cdsUsuariosdata_cadastro.AsDateTime := now;
    dmUsuarios.cdsUsuariossenha.AsString := TBCrypt.GenerateHash(dmUsuarios.TEMP_PASSWORD);
    dmUsuarios.cdsUsuariossenha_temporaria.AsString := 'S';
  end;

  dmUsuarios.cdsUsuariosnome.AsString := Trim(edtNome.Text);
  dmUsuarios.cdsUsuarioslogin.AsString := Trim(edtLogin.Text);
  dmUsuarios.cdsUsuariosstatus.AsString := LStatus;
  inherited;
end;


procedure TfrmUsuarios.mnuLimparSenhaClick(Sender: TObject);
begin
  inherited;
  if not DataSource1.DataSet.IsEmpty then
  begin
    dmUsuarios.LimparSenha(DataSource1.DataSet.FieldByName('ID').AsString);
    Application.MessageBox(PWidechar(Format('Foi definida a senha padr?o para o seu usu?rio "%s"', [DataSource1.DataSet.FieldByName('NOME').AsString])), 'Aten??o', MB_OK + MB_ICONINFORMATION);
  end;

end;

procedure TfrmUsuarios.Pesquisar;
var
  FiltroPesquisa : string;
begin
  FiltroPesquisa := TUtilitarios.LikeFind(edtPesquisar.Text, DBGrid1);

  dmUsuarios.cdsUsuarios.Close;
  dmUsuarios.cdsUsuarios.CommandText := 'Select * from Usuarios where 1 = 1' + FiltroPesquisa;
  dmUsuarios.cdsUsuarios.Open;
  inherited;
end;

end.
