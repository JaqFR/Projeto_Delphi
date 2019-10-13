unit UDM_Veiculo;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TDM_Veiculo = class(TDataModule)
    DSPVeiculo: TDataSetProvider;
    DSVeiculo: TDataSource;
    CDSVeiculo: TClientDataSet;
    SQLVeiculo: TSQLDataSet;
    SQLVeiculoIDVEICULO: TIntegerField;
    SQLVeiculoPLACA: TStringField;
    SQLVeiculoVEICULO: TStringField;
    SQLVeiculoANO: TIntegerField;
    SQLVeiculoMARCA: TStringField;
    SQLVeiculoMODELO: TStringField;
    SQLVeiculoCOR: TStringField;
    SQLVeiculoCOMBUSTIVEL: TStringField;
    SQLVeiculoCIDADE: TStringField;
    SQLVeiculoOBSERVACAO: TStringField;
    SQLVeiculoIDCLIENTE: TIntegerField;
    SQLVeiculoRAZAOSOCIAL_NOME: TStringField;
    CDSVeiculoIDVEICULO: TIntegerField;
    CDSVeiculoPLACA: TStringField;
    CDSVeiculoVEICULO: TStringField;
    CDSVeiculoANO: TIntegerField;
    CDSVeiculoMARCA: TStringField;
    CDSVeiculoMODELO: TStringField;
    CDSVeiculoCOR: TStringField;
    CDSVeiculoCOMBUSTIVEL: TStringField;
    CDSVeiculoCIDADE: TStringField;
    CDSVeiculoOBSERVACAO: TStringField;
    CDSVeiculoIDCLIENTE: TIntegerField;
    CDSVeiculoRAZAOSOCIAL_NOME: TStringField;
    CDSVeiculototal: TAggregateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_Veiculo: TDM_Veiculo;

implementation

uses UDM;

{$R *.dfm}

end.
