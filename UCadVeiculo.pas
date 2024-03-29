unit UCadVeiculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, StdCtrls, Mask, Grids, DBGrids, ExtCtrls, DB,
  UDM_Veiculo, Buttons, SqlExpr;

type
  TFrmCadVeiculo = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    DBEPLACA: TDBEdit;
    Label3: TLabel;
    DBEVEICULO: TDBEdit;
    Label4: TLabel;
    DBEANO: TDBEdit;
    Label5: TLabel;
    DBEMARCA: TDBEdit;
    Label6: TLabel;
    DBEMODELO: TDBEdit;
    Label7: TLabel;
    DBECOR: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBECIDADE: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBTIDVEICULO: TDBText;
    DBMOBSERVACAO: TDBMemo;
    CBCOMBUSTIVEL: TDBComboBox;
    GroupBox4: TGroupBox;
    GroupBox6: TGroupBox;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label12: TLabel;
    DBEIDCLIENTE: TDBEdit;
    Label13: TLabel;
    DBERAZAOSOCIAL_NOME: TDBEdit;
    Salvar: TSpeedButton;
    Cancelar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Editar: TSpeedButton;
    Excluir: TSpeedButton;
    Fechar: TSpeedButton;
    Novo: TSpeedButton;
    BuscarCli: TSpeedButton;
    GroupBox5: TGroupBox;
    CBOpcao: TComboBox;
    Pesquisar: TSpeedButton;
    EValor: TEdit;
    Label14: TLabel;
    Label24: TLabel;
    TotalVei: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NovoClick(Sender: TObject);
    procedure EditarClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
    procedure FecharClick(Sender: TObject);
    procedure SalvarClick(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure BuscarCliClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure PesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    DM_Veiculo: TDM_Veiculo;

    constructor Create( AOnwer: TComponent ); overload;
    constructor Create( AOnwer: TComponent; AIdCli: double ); overload;

    procedure ManipularDados;
    procedure ManipularDados2;
  end;
  { Public declarations }

var
  FrmCadVeiculo: TFrmCadVeiculo;

implementation

uses UFuncoes, UDM_Cliente, UCadCliente;

{$R *.dfm}

procedure TFrmCadVeiculo.ManipularDados;
begin
  PageControl1.ActivePageIndex := 1;
  PageControl1.Pages[0].TabVisible := false;
  Salvar.Enabled := true;
  Cancelar.Enabled := true;
end;

procedure TFrmCadVeiculo.ManipularDados2;
begin
  PageControl1.ActivePageIndex := 0;
  PageControl1.Pages[0].TabVisible := true;
  Salvar.Enabled := false;
  Cancelar.Enabled := false;
end;

procedure TFrmCadVeiculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_Veiculo.CDSVeiculo.Close;
  FreeAndNil(DM_Veiculo);
end;

procedure TFrmCadVeiculo.NovoClick(Sender: TObject);
begin
  ManipularDados;
  DBEPLACA.SetFocus;
  DM_Veiculo.CDSVeiculo.Append;
  DBTIDVEICULO.Field.Value := gen_ID('VEICULO', 'GEN_VEICULO_ID');
end;

procedure TFrmCadVeiculo.PesquisarClick(Sender: TObject);
var
  pCampo: string;
begin
  case CBOpcao.ItemIndex of
    0:
      begin
        pCampo := 'PLACA'
      end;
    1:
      begin
        pCampo := 'VEICULO'
      end;
    2:
      begin
        pCampo := 'ANO'
      end;
    3:
      begin
        pCampo := 'MARCA'
      end;
    4:
      begin
        pCampo := 'MODELO'
      end;
    5:
      begin
        pCampo := 'COR'
      end;
    6:
      begin
        pCampo := 'COMBUSTIVEL'
      end;
    7:
      begin
        pCampo := 'RAZAOSOCIAL_NOME'
      end;
  end;
  //tratar com try and finally
  //qdo nao encontrar mostrar todos
  DM_Veiculo.CDSVeiculo.Close;
  DM_Veiculo.SQLVeiculo.CommandText :=
    'select v.*, cli.RAZAOSOCIAL_NOME from veiculo v left outer join CLIENTE ' +
    'cli on cli.IDCLIENTE = v.IDCLIENTE where ' + pCampo + ' like ' +
    QuotedStr('%' + EValor.Text + '%');
  DM_Veiculo.CDSVeiculo.Open;
  if DM_Veiculo.CDSVeiculo.RecordCount = 0 then
    ShowMessage('Veiculo n�o encontrado!');
end;

procedure TFrmCadVeiculo.EditarClick(Sender: TObject);
begin
  if (DM_Veiculo.CDSVeiculo.RecordCount = 0) then
  begin
    ShowMessage('N�o h� veiculos cadastrado.');
    Exit;
  end;
  ManipularDados;
  DBEPLACA.SetFocus;
  If DM_Veiculo.CDSVeiculo.State in [dsInsert, dsEdit] then
    Exit;
  DM_Veiculo.CDSVeiculo.Edit;
end;

procedure TFrmCadVeiculo.ExcluirClick(Sender: TObject);
begin
  if DM_Veiculo.CDSVeiculo.RecordCount = 0 then
  begin
    ShowMessage('N�o h� veiculos cadastrado.');
    Exit;
  end;
  if MessageDlg('Deseja excluir registro?', mtConfirmation, [mbYes, mbNo], 0)
    = mrYes then
  begin
    DM_Veiculo.CDSVeiculo.Delete;
    DM_Veiculo.CDSVeiculo.ApplyUpdates(0);
    ShowMessage('Veiculo excluido com sucesso!');
  end
  else
    DM_Veiculo.CDSVeiculo.Cancel;
end;

procedure TFrmCadVeiculo.FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadVeiculo.SalvarClick(Sender: TObject);
begin
  if ((Trim(DBEIDCLIENTE.Text)) = '') Then
  begin
    ShowMessage('Preencha os dados do cliente!');
    Exit;
  end;
  DM_Veiculo.CDSVeiculo.Post;
  DM_Veiculo.CDSVeiculo.ApplyUpdates(0);
  ShowMessage('Veiculo cadastrado com sucesso!');
  ManipularDados2;
end;

procedure TFrmCadVeiculo.CancelarClick(Sender: TObject);
begin
  DM_Veiculo.CDSVeiculo.CancelUpdates;
  ManipularDados2;
end;

constructor TFrmCadVeiculo.Create(AOnwer: TComponent);
begin
  DM_Veiculo := TDM_Veiculo.Create(AOnwer);
  DM_Veiculo.CDSVeiculo.Open;
  inherited;
end;

constructor TFrmCadVeiculo.Create(AOnwer: TComponent; AIdCli: double);
var SQL: string;
begin
  DM_Veiculo := TDM_Veiculo.Create(Self);

  SQL := DM_Veiculo.SQLVeiculo.CommandText;

  DM_Veiculo.SQLVeiculo.Close;
  DM_Veiculo.CDSVeiculo.Close;

  DM_Veiculo.SQLVeiculo.CommandText := SQL + ' where v.IDCLIENTE = ' + FloatToStr(AIdCli);
  DM_Veiculo.SQLVeiculo.Open;
  DM_Veiculo.CDSVeiculo.Open;

  inherited Create(AOnwer);
end;

procedure TFrmCadVeiculo.BuscarCliClick(Sender: TObject);
var
  frmCliente: TFrmCadCliente;
begin
  frmCliente := TFrmCadCliente.Create(Self, 'CADVEI');
  frmCliente.ShowModal;
end;

procedure TFrmCadVeiculo.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Odd(DM_Veiculo.CDSVeiculo.RecNo) then
  begin
    DBGrid1.Canvas.Brush.Color := clScrollBar;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  end
end;

procedure TFrmCadVeiculo.DBGrid1DblClick(Sender: TObject);
begin
  if (DM_Veiculo.CDSVeiculo.RecordCount = 0) then
  begin
    ShowMessage('N�o h� veiculos cadastrado.');
    Exit;
  end;
  ManipularDados;
  If DM_Veiculo.CDSVeiculo.State in [dsInsert, dsEdit] then
    Exit;
  DM_Veiculo.CDSVeiculo.Edit;
end;

end.
