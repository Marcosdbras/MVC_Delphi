unit uConexao;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.FB, System.SysUtils, FireDAC.DApt, FireDAC.VCLUI.Wait;

type
  TConexao = class
  private
    FConn: TFDConnection;

    procedure ConfigurarConexao;

    function CriarQuery: TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;

    function GetConn: TFDConnection;
  end;

  const
    PATH_BANCO: string = 'E:\MVC_DELPHI\DB_MVC.FDB';

implementation

{ TConexao }

procedure TConexao.ConfigurarConexao;
begin
  FConn.Params.DriverID := 'FB';
  FConn.Params.Database := PATH_BANCO;
  FConn.Params.UserName := 'SYSDBA';
  FConn.Params.Password := 'masterkey';
  FConn.LoginPrompt     := False;
end;

constructor TConexao.Create;
begin
  FConn := TFDConnection.Create(nil);

  Self.ConfigurarConexao();
end;

function TConexao.CriarQuery: TFDQuery;
var
  VQuery: TFDQuery;
begin
  VQuery := TFDQuery.Create(nil);
  VQuery.Connection := FConn;

  Result := VQuery;
end;

destructor TConexao.Destroy;
begin
  FreeAndNil(FConn);

  inherited;
end;

function TConexao.GetConn: TFDConnection;
begin
  Result := FConn;
end;

end.
