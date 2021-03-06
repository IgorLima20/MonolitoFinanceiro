unit MonolitoFinanceiro.Model.Sistema;

interface

uses
  System.SysUtils, System.Classes, System.IniFiles;

type
  TdmSistema = class(TDataModule)
  private
    { Private declarations }
    function GetConfiguracao(Secao, Parametro, valorPadrao : string) : string;
    procedure SetConfiguracao(Secao, Parametro, Valor : string);
    const ARQUIVOCONFIGURACAO = 'MonolitoFinanceiro.cfg';
  public
    { Public declarations }
    function DataUltimoAcesso : string; overload;
    procedure DataUltimoAcesso(aValue : TDateTime); overload;
    function UsuarioUltimoAcesso : string; overload;
    procedure UsuarioUltimoAcesso(aValue : string); overload;
  end;

var
  dmSistema: TdmSistema;

implementation

uses
  Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TdmSistema.DataUltimoAcesso(aValue: TDateTime);
begin
  SetConfiguracao('ACESSO', 'Data', DateTimeToStr(aValue));
end;

function TdmSistema.DataUltimoAcesso: string;
begin
  Result := GetConfiguracao('ACESSO', 'Data', '');
end;

function TdmSistema.GetConfiguracao(Secao, Parametro,
  valorPadrao: string): string;
  var LArquivoConfig : TIniFile;
begin
  LArquivoConfig := TIniFile.Create(ExtractFilePath(Application.ExeName) + ARQUIVOCONFIGURACAO);
  try
    Result := LArquivoConfig.ReadString(Secao, Parametro, valorPadrao);
  finally
    LArquivoConfig.Free;
  end;
end;

procedure TdmSistema.SetConfiguracao(Secao, Parametro, Valor: string);
 var LArquivoConfig : TIniFile;
begin
  LArquivoConfig := TIniFile.Create(ExtractFilePath(Application.ExeName) + ARQUIVOCONFIGURACAO);
  try
    LArquivoConfig.WriteString(Secao, Parametro, Valor);
  finally
    LArquivoConfig.Free;
  end;
end;

function TdmSistema.UsuarioUltimoAcesso: string;
begin
  Result := GetConfiguracao('ACESSO', 'Usuario', '');
end;

procedure TdmSistema.UsuarioUltimoAcesso(aValue: string);
begin
  SetConfiguracao('ACESSO', 'Usuario', aValue);
end;

end.
