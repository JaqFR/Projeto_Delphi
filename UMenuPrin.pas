unit UMenuPrin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, ActnList, Menus, ComCtrls, StdCtrls, UDM;

type
  TFrmMenuPrin = class(TForm)
    ActionList1: TActionList;
    ActCliente: TAction;
    ActVeiculo: TAction;
    ActSair: TAction;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Movimentos1: TMenuItem;
    Relatrios1: TMenuItem;
    Clientes1: TMenuItem;
    N1: TMenuItem;
    Veiculos1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Image1: TImage;
    Label1: TLabel;
    procedure ActSairExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActClienteExecute(Sender: TObject);
    procedure ActVeiculoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    dmPrinc: TDM;
  public
    { Public declarations }
  end;

var
  FrmMenuPrin: TFrmMenuPrin;

implementation

uses USplash, UCadCliente, UCadVeiculo;

{$R *.dfm}

procedure TFrmMenuPrin.ActClienteExecute(Sender: TObject);
begin
  FrmCadCliente := TFrmCadCliente.Create(Self, 'CADCLI');
  FrmCadCliente.ShowModal;
  FrmCadCliente.Release;
  FrmCadCliente := nil;
end;

procedure TFrmMenuPrin.ActSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmMenuPrin.ActVeiculoExecute(Sender: TObject);
begin
  FrmCadVeiculo := TFrmCadVeiculo.Create(Self);
  FrmCadVeiculo.ShowModal;
  FrmCadVeiculo.Release;
  FrmCadVeiculo := nil;
end;

procedure TFrmMenuPrin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg('Deseja fechar a aplicação?', mtConfirmation, [mbYes, mbNo], 0)
    = mrYes then
  begin
    Application.Terminate;
    Action := caFree;
  end
  else
    Action := caNone;
end;

procedure TFrmMenuPrin.FormCreate(Sender: TObject);
begin
  dmPrinc := TDM.Create(Self);
end;

procedure TFrmMenuPrin.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := '' + FormatDateTime('hh:nn:ss', now);
  StatusBar1.Panels[1].Text := '' + FormatDateTime
    ('dddd", "dd" de "mmmm" de "yyyy', now);
end;

end.
