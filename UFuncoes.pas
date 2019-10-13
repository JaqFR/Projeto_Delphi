unit UFuncoes;

interface

function gen_ID(tabela: string; generator: string): integer;

implementation

uses UDM, SqlExpr, SysUtils;

function gen_ID(tabela: string; generator: string): integer;
var
  sql: TSqlDataSet;
begin
  DM := TDM.Create(nil);
  sql := TSqlDataSet.Create(nil);
  try
    sql.SQLConnection := DM.Conexao;
    sql.CommandText := 'Select FIRST 1 gen_id(' + generator +
      ', 1) from ' + tabela;
    sql.Open;
    if sql.RecordCount = 0 then
      Result := 1
    else
      Result := sql.Fields[0].AsInteger;
  finally
    sql.Close;
    sql.Free;
    FreeAndNil(DM);
  end;
end;

end.
