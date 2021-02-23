unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite;

type
  TFPrincipal = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    conexao: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    Qry: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

procedure TFPrincipal.Button1Click(Sender: TObject);
const
  MyDBFile = 'C:\Users\DevDelphi\Desktop\Anderson D C\Estudos Delphi\Financeiro\ADC.db';
var
  op: boolean;

  Connection : TFDConnection;
  DriverLink : TFDPhysSQLiteDriverLink;
  Table : TFDTable;
begin
  op:=true;

  DeleteFile( MyDBFile );
  DriverLink := TFDPhysSQLiteDriverLink.Create( nil );
  Connection := TFDConnection.Create( nil );
  try
    Connection.Params.Values['DriverID'] := 'SQLite';
    Connection.Params.Values['Database'] := MyDBFile;
    Connection.Connected := True;

    Table := TFDTable.Create( nil );
    try
      Table.TableName := 'Entradas';
      Table.Connection := Connection;
      Table.FieldDefs.Add( 'descricao', ftString, 100 );
      Table.FieldDefs.Add( 'valor', ftExtended );
      Table.FieldDefs.Add( 'dataCad', ftDateTime);
      Table.FieldDefs.Add( 'obs', ftString, 200 );
      Table.CreateDataSet;

//      Table.TableName := 'Despesas';
//      Table.Connection := Connection;
//      Table.FieldDefs.Add( 'descricao', ftString, 100 );
//      Table.FieldDefs.Add( 'valor', ftExtended, 10 );
//      Table.FieldDefs.Add( 'data', ftDate, 8 );
//      Table.FieldDefs.Add( 'obs', ftString, 200 );
//      Table.CreateDataSet;

    finally
      Table.Free;
    end;
  except
    op:=false;
  end;

  if Op=true then ShowMessage('Banco criado com sucesso!')
  else ShowMessage('Erro ao Criar Banco!');
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  Conexao.Params.Values['DriverID'] := 'SQLite';
  Conexao.LoginPrompt := False;
//  Conexao.Params.Values['DataBase'] := 'C:\Users\DevDelphi\Desktop\Anderson D C\Estudos Delphi\Financeiro\Desktop para Criar Bancos de Dados\';
  Conexao.Connected := True;
end;

end.
