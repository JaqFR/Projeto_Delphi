unit UCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, DBCtrls, Grids, DBGrids, ExtCtrls, DB,
  UDM_Cliente, Buttons, SqlExpr;

type
  TFrmCadCliente = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DTPDTCADASTRO: TDateTimePicker;
    Label4: TLabel;
    DBECNPJ_CPF: TDBEdit;
    Label5: TLabel;
    DBEIE_RG: TDBEdit;
    Label6: TLabel;
    DBERAZAOSOCIAL_NOME: TDBEdit;
    Label7: TLabel;
    DBENOMEFANTASIA_APELIDO: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    CBSEXO: TDBComboBox;
    DTPDTNASCIMENTO: TDateTimePicker;
    Label10: TLabel;
    DBEENDERECO: TDBEdit;
    Label11: TLabel;
    DBENUMERO: TDBEdit;
    Label12: TLabel;
    DBECOMPLEMENTO: TDBEdit;
    Label13: TLabel;
    DBEBAIRRO: TDBEdit;
    Label14: TLabel;
    DBECEP: TDBEdit;
    Label15: TLabel;
    DBECIDADE: TDBEdit;
    Label16: TLabel;
    CBUF: TDBComboBox;
    Label17: TLabel;
    DBETELEFONE1: TDBEdit;
    Label18: TLabel;
    DBETELEFONE2: TDBEdit;
    Label19: TLabel;
    DBECELULAR1: TDBEdit;
    Label20: TLabel;
    DBECELULAR2: TDBEdit;
    Label21: TLabel;
    DBEEMAIL: TDBEdit;
    Label22: TLabel;
    GroupBox5: TGroupBox;
    GroupBox7: TGroupBox;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBMOBSERVACAO: TDBMemo;
    TotalCli: TDBText;
    Label24: TLabel;
    DBTIDCLIENTE: TDBText;
    Novo: TSpeedButton;
    Excluir: TSpeedButton;
    Fechar: TSpeedButton;
    Salvar: TSpeedButton;
    Cancelar: TSpeedButton;
    GroupBox6: TGroupBox;
    CBOpcao: TComboBox;
    Pesquisar: TSpeedButton;
    EValor: TEdit;
    Label25: TLabel;
    Editar: TSpeedButton;
    CBTIPOPESSOA: TDBComboBox;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NovoClick(Sender: TObject);
    procedure EditarClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
    procedure FecharClick(Sender: TObject);
    procedure SalvarClick(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure PesquisarClick(Sender: TObject);
    procedure CBTIPOPESSOAExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);

  private
    DM_Cliente: TDM_Cliente;
    { Private declarations }
  public
    Call: string;
    constructor Create(AOwner: TComponent; ACall: string);
    procedure SetarMascara;
    procedure AtualizarData;
    procedure ManipularDados;
    procedure ManipularDados2;
  end;
  { Public declarations }

var
  FrmCadCliente: TFrmCadCliente;

implementation

uses UFuncoes, UCadVeiculo, UDM;

{$R *.dfm}

procedure TFrmCadCliente.FormCreate(Sender: TObject);
begin
  DM_Cliente := TDM_Cliente.Create(Self);
  DM_Cliente.CDSCliente.Open;
end;

procedure TFrmCadCliente.ManipularDados;
begin
  PageControl1.ActivePageIndex := 1;
  PageControl1.Pages[0].TabVisible := false;
  Salvar.Enabled := true;
  Cancelar.Enabled := true;
end;

procedure TFrmCadCliente.ManipularDados2;
begin
  PageControl1.ActivePageIndex := 0;
  PageControl1.Pages[0].TabVisible := true;
  Salvar.Enabled := false;
  Cancelar.Enabled := false;
  DBECNPJ_CPF.Field.EditMask := '';
  DBEIE_RG.Field.EditMask := '';
end;

procedure TFrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_Cliente.CDSCliente.Close;
  FreeAndNil(DM_Cliente);
end;

procedure TFrmCadCliente.NovoClick(Sender: TObject);
begin
  ManipularDados;
  DTPDTCADASTRO.SetFocus;
  AtualizarData;
  SetarMascara;
  DM_Cliente.CDSCliente.Append;
  DBTIDCLIENTE.Field.Value := gen_ID('CLIENTE', 'GEN_CLIENTE_ID');
end;

procedure TFrmCadCliente.EditarClick(Sender: TObject);
begin
  if (DM_Cliente.CDSCliente.RecordCount = 0) then
  begin
    ShowMessage('N�o h� clientes cadastrado.');
    Exit;
  end;
  ManipularDados;
  If (DM_Cliente.CDSCliente.State in [dsInsert, dsEdit]) then
    Exit;
  DM_Cliente.CDSCliente.Edit;
  DTPDTCADASTRO.Date := DM_Cliente.CDSClienteDTCADASTRO.AsDateTime;
  DTPDTNASCIMENTO.Date := DM_Cliente.CDSClienteDTNASCIMENTO.AsDateTime;
  SetarMascara;
end;

procedure TFrmCadCliente.ExcluirClick(Sender: TObject);
var
  Sql: TSQLDataSet;
begin
  if (DM_Cliente.CDSCliente.RecordCount = 0) then
  begin
    ShowMessage('N�o h� clientes cadastrado.');
    Exit;
  end;
  DM := TDM.Create(nil);
  Sql := TSQLDataSet.Create(nil);
  try
    Sql.SQLConnection := DM.Conexao;
    Sql.CommandText :=
      'Select count(*) from VEICULO where IDCLIENTE = :IDCLIENTE';
    Sql.ParamByName('IDCLIENTE').AsString :=
      DM_Cliente.CDSClienteIDCLIENTE.AsString;
    Sql.Open;
    // tratar excessao access violation
    if (Sql.Fields[0].AsInteger > 0) then
    begin
      if MessageDlg
        ('Existem veiculos vinculados a esse cliente. Deseja excluir mesmo assim?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        DM_Cliente.CDSCliente.Delete;
        DM_Cliente.CDSCliente.ApplyUpdates(0);
        ShowMessage('Cliente excluido com sucesso!');
      end
      else
        DM_Cliente.CDSCliente.Cancel;
    end
    else if MessageDlg('Deseja excluir cliente?', mtConfirmation, [mbYes, mbNo],
      0) = mrYes then
    begin
      DM_Cliente.CDSCliente.Delete;
      DM_Cliente.CDSCliente.ApplyUpdates(0);
      ShowMessage('Cliente excluido com sucesso!');
    end
    else
      DM_Cliente.CDSCliente.Cancel;
  finally
    Sql.Close;
    Sql.Free;
    FreeAndNil(DM);
  end;
end;

procedure TFrmCadCliente.FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadCliente.SalvarClick(Sender: TObject);
begin
  DM_Cliente.CDSClienteDTCADASTRO.AsDateTime := DTPDTCADASTRO.Date;
  DM_Cliente.CDSClienteDTNASCIMENTO.AsDateTime := DTPDTNASCIMENTO.Date;
  if (CBTIPOPESSOA.ItemIndex = 1) then
    DM_Cliente.CDSClienteDTNASCIMENTO.AsString := '';
  DM_Cliente.CDSCliente.Post;
  DM_Cliente.CDSCliente.ApplyUpdates(0);
  ShowMessage('Cliente cadastrado com sucesso!');
  ManipularDados2;
end;

procedure TFrmCadCliente.AtualizarData;
var
  dia, mes, ano: string;
  data: Tdatetime;
begin
  dia := formatdatetime('dd', Date);
  mes := formatdatetime('mm', Date);
  ano := formatdatetime('yyyy', Date);
  data := strtodate(dia + '/' + mes + '/' + ano);
  DTPDTCADASTRO.Date := data;
  DTPDTNASCIMENTO.Date := data;
end;

procedure TFrmCadCliente.CancelarClick(Sender: TObject);
begin
  DM_Cliente.CDSCliente.CancelUpdates;
  ManipularDados2;
end;

procedure TFrmCadCliente.PageControl1Change(Sender: TObject);
begin
  If (DM_Cliente.CDSCliente.State = dsBrowse) then
  begin
    DTPDTCADASTRO.Date := DM_Cliente.CDSClienteDTCADASTRO.AsDateTime;
    DTPDTNASCIMENTO.Date := DM_Cliente.CDSClienteDTNASCIMENTO.AsDateTime;
  end;
end;

procedure TFrmCadCliente.PesquisarClick(Sender: TObject);
var
  pCampo: string;
begin
  case CBOpcao.ItemIndex of
    0:
      begin
        pCampo := 'DTCADASTRO'
      end;
    1:
      begin
        pCampo := 'TIPOPESSOA'
      end;
    2:
      begin
        pCampo := 'RAZAOSOCIAL_NOME'
      end;
    3:
      begin
        pCampo := 'NOMEFANTASIA_APELIDO'
      end;
    4:
      begin
        pCampo := 'CNPJ_CPF'
      end;
    5:
      begin
        pCampo := 'IE_RG'
      end;
    6:
      begin
        pCampo := 'SEXO'
      end;
    7:
      begin
        pCampo := 'ENDERECO'
      end;
    8:
      begin
        pCampo := 'BAIRRO'
      end;
    9:
      begin
        pCampo := 'CIDADE'
      end;
  end;
  DM_Cliente.CDSCliente.Close;
  DM_Cliente.SQLCliente.CommandText := 'select * from CLIENTE ' + 'where ' +
    pCampo + ' like ' + QuotedStr('%' + EValor.Text + '%');
  DM_Cliente.CDSCliente.Open;
  if (DM_Cliente.CDSCliente.RecordCount = 0) then
    ShowMessage('Cliente n�o encontrado!');
end;

procedure TFrmCadCliente.CBTIPOPESSOAExit(Sender: TObject);
begin
  SetarMascara;
end;

procedure TFrmCadCliente.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Odd(DM_Cliente.CDSCliente.RecNo) then
  begin
    DBGrid1.Canvas.Brush.Color := clScrollBar;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TFrmCadCliente.DBGrid1DblClick(Sender: TObject);
begin
  If (Call = 'CADCLI') then
  begin
    if (DM_Cliente.CDSCliente.RecordCount = 0) then
    begin
      ShowMessage('N�o h� clientes cadastrado.');
      Exit;
    end;
    ManipularDados;
    if (DM_Cliente.CDSCliente.State in [dsInsert, dsEdit]) then
      Exit;
    DM_Cliente.CDSCliente.Edit;
    DTPDTCADASTRO.Date := DM_Cliente.CDSClienteDTCADASTRO.AsDateTime;
    DTPDTNASCIMENTO.Date := DM_Cliente.CDSClienteDTNASCIMENTO.AsDateTime;
    SetarMascara;
  end
  else if (Call = 'CADVEI') then
  begin
    FrmCadVeiculo.DBEIDCLIENTE.Text := DM_Cliente.CDSClienteIDCLIENTE.AsString;
    FrmCadVeiculo.DBERAZAOSOCIAL_NOME.Text :=
      DM_Cliente.CDSClienteRAZAOSOCIAL_NOME.AsString;
    Close;
  end;
end;

constructor TFrmCadCliente.Create(AOwner: TComponent; ACall: string);
begin
  Call := ACall;
  inherited Create(AOwner);
end;

procedure TFrmCadCliente.SetarMascara;
begin
  if (CBTIPOPESSOA.ItemIndex = 0) then
  begin // F
    DBECNPJ_CPF.Field.EditMask := '999.999.999-99;1;_';
    DBEIE_RG.Field.EditMask := '99.999.999-9;1;_';
    CBSEXO.Enabled := true;
    DTPDTNASCIMENTO.Enabled := true;
  end;
  if (CBTIPOPESSOA.ItemIndex = 1) then
  begin // J
    DBECNPJ_CPF.Field.EditMask := '99.999.999/9999-99;1;_';
    DBEIE_RG.Field.EditMask := '999.999.999.999;1;_';
    CBSEXO.Enabled := false;
    DTPDTNASCIMENTO.Enabled := false;
  end;
end;

procedure TFrmCadCliente.SpeedButton1Click(Sender: TObject);
var
  frmVeiculo: TFrmCadVeiculo;
begin
  frmVeiculo := TFrmCadVeiculo.Create(Self, DM_Cliente.CDSClienteIDCLIENTE.AsFloat);
  frmVeiculo.ShowModal;
end;

end.
