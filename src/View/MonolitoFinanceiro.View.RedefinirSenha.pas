unit MonolitoFinanceiro.View.RedefinirSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,  MonolitoFinanceiro.Model.Entidades.Usuarios;

type
  TfrmRedefinirSenha = class(TForm)
    pnlPrincipal: TPanel;
    Panel1: TPanel;
    lblUsuario: TLabel;
    Panel3: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtSenha: TEdit;
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edtConfirmarSenha: TEdit;
    Panel5: TPanel;
    btnConfirmar: TButton;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    FUsuario: TModelEntidadeUsuario;
    procedure SetUsuario(const Value: TModelEntidadeUsuario);
    { Private declarations }
  public
    { Public declarations }
    property Usuario :  TModelEntidadeUsuario read FUsuario write SetUsuario;
  end;

var
  frmRedefinirSenha: TfrmRedefinirSenha;

implementation

{$R *.dfm}

uses MonolitoFinanceiro.Model.Usuarios;

procedure TfrmRedefinirSenha.btnConfirmarClick(Sender: TObject);
begin
  edtSenha.Text := Trim(edtSenha.Text);
  edtConfirmarSenha.Text := Trim(edtConfirmarSenha.Text);

  if edtSenha.Text = '' then
  begin
    edtSenha.SetFocus;
    Application.MessageBox('Informe a sua nova senha.', 'Aten??o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if edtConfirmarSenha.Text = '' then
  begin
    edtSenha.SetFocus;
    Application.MessageBox('Confirme a sua nova senha.', 'Aten??o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if edtSenha.Text <> edtConfirmarSenha.Text then
  begin
    edtConfirmarSenha.SetFocus;
    Application.MessageBox('Senha diferente da confirma??o!!', 'Aten??o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  Usuario.Senha := edtSenha.Text;
  dmUsuarios.RedefinirSenha(Usuario);
  Application.MessageBox('Senha alterada com sucesso.', 'Aten??o', MB_OK + MB_ICONINFORMATION);
  ModalResult := mrOk;
end;

procedure TfrmRedefinirSenha.Button1Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmRedefinirSenha.FormShow(Sender: TObject);
begin
  lblUsuario.Caption := FUsuario.Login;
end;

procedure TfrmRedefinirSenha.SetUsuario(const Value: TModelEntidadeUsuario);
begin
  FUsuario := Value;
end;

end.
