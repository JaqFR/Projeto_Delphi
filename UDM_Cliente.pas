unit UDM_Cliente;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TDM_Cliente = class(TDataModule)
    CDSCliente: TClientDataSet;
    DSCliente: TDataSource;
    DSPCliente: TDataSetProvider;
    CDSClienteIDCLIENTE: TIntegerField;
    CDSClienteDTCADASTRO: TDateField;
    CDSClienteTIPOPESSOA: TStringField;
    CDSClienteRAZAOSOCIAL_NOME: TStringField;
    CDSClienteNOMEFANTASIA_APELIDO: TStringField;
    CDSClienteCNPJ_CPF: TStringField;
    CDSClienteIE_RG: TStringField;
    CDSClienteSEXO: TStringField;
    CDSClienteDTNASCIMENTO: TDateField;
    CDSClienteENDERECO: TStringField;
    CDSClienteNUMERO: TIntegerField;
    CDSClienteCOMPLEMENTO: TStringField;
    CDSClienteCEP: TStringField;
    CDSClienteBAIRRO: TStringField;
    CDSClienteCIDADE: TStringField;
    CDSClienteUF: TStringField;
    CDSClienteTELEFONE1: TStringField;
    CDSClienteTELEFONE2: TStringField;
    CDSClienteCELULAR1: TStringField;
    CDSClienteCELULAR2: TStringField;
    CDSClienteEMAIL: TStringField;
    CDSClienteOBSERVACAO: TStringField;
    CDSClientetotal: TAggregateField;
    SQLCliente: TSQLDataSet;
    SQLClienteIDCLIENTE: TIntegerField;
    SQLClienteDTCADASTRO: TDateField;
    SQLClienteTIPOPESSOA: TStringField;
    SQLClienteRAZAOSOCIAL_NOME: TStringField;
    SQLClienteNOMEFANTASIA_APELIDO: TStringField;
    SQLClienteCNPJ_CPF: TStringField;
    SQLClienteIE_RG: TStringField;
    SQLClienteSEXO: TStringField;
    SQLClienteDTNASCIMENTO: TDateField;
    SQLClienteENDERECO: TStringField;
    SQLClienteNUMERO: TIntegerField;
    SQLClienteCOMPLEMENTO: TStringField;
    SQLClienteCEP: TStringField;
    SQLClienteBAIRRO: TStringField;
    SQLClienteCIDADE: TStringField;
    SQLClienteUF: TStringField;
    SQLClienteTELEFONE1: TStringField;
    SQLClienteTELEFONE2: TStringField;
    SQLClienteCELULAR1: TStringField;
    SQLClienteCELULAR2: TStringField;
    SQLClienteEMAIL: TStringField;
    SQLClienteOBSERVACAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_Cliente: TDM_Cliente;

implementation

uses UDM, UCadCliente;

{$R *.dfm}

end.
