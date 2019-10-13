unit UBkpRst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, FileCtrl, ExtCtrls;

type
  TFrmBkpRst = class(TForm)
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    Confirma: TSpeedButton;
    Sair: TSpeedButton;
    Animate1: TAnimate;
    procedure ConfirmaClick(Sender: TObject);
  private
    { Private declarations }
  public
  procedure Copia;
    { Public declarations }
  end;

var
  FrmBkpRst: TFrmBkpRst;

implementation

uses UMenuPrin, UDM;

{$R *.dfm}

procedure TFrmBkpRst.ConfirmaClick(Sender: TObject);
begin
  if MessageDlg('Antes de confirmar esta operação, feche o banco de dados' + #13
    + #13 + 'Deseja efetuar' + RadioGroup1.Items[RadioGroup1.ItemIndex] + '?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Abort;
  try
    Animate1.Visible := true;
    Animate1.Active := true;
    if RadioGroup1.ItemIndex = 0 then
    begin
      //FrmMenuPrin.Compactar;
      //Copia(ExtractFilePath(Application.ExeName) + '\DIAMANTE.FDB',
        //DirectoryListBox1.Directory);
    end;
    if RadioGroup1.ItemIndex = 1 then
    begin
      DM.Conexao.Connected := false;
    end;
  finally

  end;

end;

procedure TFrmBkpRst.Copia;
//var FileOpInfo : TSHFileOpStruct;
begin
//  with FileOpInfo do
//  begin
//    Wnd := Application.Handle;
//    wFunc := FO_COPY;
//    pFrom
//  end;
end;

end.
