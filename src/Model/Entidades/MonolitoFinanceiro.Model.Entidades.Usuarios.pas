unit MonolitoFinanceiro.Model.Entidades.Usuarios;

interface
type
  TModelEntidadeUsuario = class
  private
    FLogin: string;
    FNome: string;
    FId: string;
    FSenha: string;
    FSenhaTemporaria: Boolean;
    procedure SetId(const Value: string);
    procedure SetLogin(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetSenha(const Value: string);
    procedure SetSenhaTemporaria(const Value: Boolean);
  public
    property Nome : string read FNome write SetNome;
    property Login : string read FLogin write SetLogin;
    property ID : string read FId write SetId;
    property Senha : string read FSenha write SetSenha;
    property SenhaTemporaria : Boolean read FSenhaTemporaria write SetSenhaTemporaria;
  end;

implementation

{ TModelEntidadeUsuario }

procedure TModelEntidadeUsuario.SetId(const Value: string);
begin
  FId := Value;
end;

procedure TModelEntidadeUsuario.SetLogin(const Value: string);
begin
  FLogin := Value;
end;

procedure TModelEntidadeUsuario.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TModelEntidadeUsuario.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TModelEntidadeUsuario.SetSenhaTemporaria(const Value: Boolean);
begin
  FSenhaTemporaria := Value;
end;

end.
