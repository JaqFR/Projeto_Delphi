program SistemaDiamante;

uses
  SysUtils,
  Forms,
  UMenuPrin in 'UMenuPrin.pas' {FrmMenuPrin},
  USplash in 'USplash.pas' {FrmSplash},
  UDM in 'UDM.pas' {DM: TDataModule},
  UDM_Cliente in 'UDM_Cliente.pas' {DM_Cliente: TDataModule},
  UCadCliente in 'UCadCliente.pas' {FrmCadCliente},
  UDM_Veiculo in 'UDM_Veiculo.pas' {DM_Veiculo: TDataModule},
  UFuncoes in 'UFuncoes.pas',
  UCadVeiculo in 'UCadVeiculo.pas' {FrmCadVeiculo};

{$R *.res}

begin

  FrmSplash := TFrmSplash.Create(Application);
  FrmSplash.Refresh;
  Sleep(2000);
  FrmSplash.Release;
  FrmSplash.Free;
  FrmSplash := nil;

  try
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TFrmMenuPrin, FrmMenuPrin);
  Application.CreateForm(TDM, DM);
  finally
    FrmSplash.Free;
    FrmSplash := nil;
  end;

  Application.Run;

end.
