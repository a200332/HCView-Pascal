unit frm_HCViewDemo;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ComCtrls, Menus, ImgList, ToolWin, XPMan, HCCommon, HCCustomRichData, HCItem,
  HCCustomData, HCView, HCParaStyle, HCTextStyle, ExtCtrls, System.ImageList,
  System.Actions, Vcl.ActnList;

type
  TfrmHCViewDemo = class(TForm)
    il1: TImageList;
    tlbFontSize: TToolBar;
    btnOpen: TToolButton;
    btnSymmetryMargin: TToolButton;
    btnAnnotation: TToolButton;
    btnAlignLeft: TToolButton;
    btnAlignCenter: TToolButton;
    btnAlignRight: TToolButton;
    btnAlignJustify: TToolButton;
    btnAlignScatter: TToolButton;
    mm1: TMainMenu;
    mniN1: TMenuItem;
    mniOpen: TMenuItem;
    mniSave: TMenuItem;
    mniSaveAs: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    ToolButton1: TToolButton;
    btnBold: TToolButton;
    btn2: TToolButton;
    xpmnfst: TXPManifest;
    btnSave: TToolButton;
    btn3: TToolButton;
    btnItalic: TToolButton;
    btnUnderLine: TToolButton;
    btnStrikeOut: TToolButton;
    btnSuperScript: TToolButton;
    btnSubScript: TToolButton;
    btn9: TToolButton;
    btn10: TToolButton;
    btn11: TToolButton;
    cbbFont: TComboBox;
    btn1: TToolButton;
    cbbFontColor: TColorBox;
    cbbBackColor: TColorBox;
    btnprint: TToolButton;
    btn12: TToolButton;
    cbbFontSize: TComboBox;
    mniInsertTable: TMenuItem;
    mniN3: TMenuItem;
    mniCopy: TMenuItem;
    mniPaste: TMenuItem;
    mniCut: TMenuItem;
    mniN5: TMenuItem;
    pmRichEdit: TPopupMenu;
    mniN6: TMenuItem;
    mniN7: TMenuItem;
    mniN8: TMenuItem;
    mniTable: TMenuItem;
    cbbZoom: TComboBox;
    mniN9: TMenuItem;
    statbar: TStatusBar;
    mniN12: TMenuItem;
    mniN13: TMenuItem;
    mniN14: TMenuItem;
    mniN15: TMenuItem;
    mniC1: TMenuItem;
    btnLineSpace: TToolButton;
    pmLineSpace: TPopupMenu;
    mniLineSpace: TMenuItem;
    mniN17: TMenuItem;
    mniN21: TMenuItem;
    mniDisBorder: TMenuItem;
    mniInsertRowTop: TMenuItem;
    mniInsertRowBottom: TMenuItem;
    mniInsertColLeft: TMenuItem;
    mniInsertColRight: TMenuItem;
    mniDeleteRow: TMenuItem;
    mniDeleteCol: TMenuItem;
    mniN25: TMenuItem;
    mniN26: TMenuItem;
    mniN27: TMenuItem;
    mniN28: TMenuItem;
    mniN29: TMenuItem;
    mniN30: TMenuItem;
    mniN31: TMenuItem;
    mniN32: TMenuItem;
    actlst: TActionList;
    btnNew: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAnnotationClick(Sender: TObject);
    procedure btnAlignLeftClick(Sender: TObject);
    procedure btnSymmetryMarginClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure btnBoldClick(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbFontChange(Sender: TObject);
    procedure cbbFontColorChange(Sender: TObject);
    procedure cbbBackColorChange(Sender: TObject);
    procedure cbbFontSizeChange(Sender: TObject);
    procedure mniInsertTableClick(Sender: TObject);
    procedure mniCopyClick(Sender: TObject);
    procedure mniPasteClick(Sender: TObject);
    procedure mniCutClick(Sender: TObject);
    procedure mniN5Click(Sender: TObject);
    procedure pmRichEditPopup(Sender: TObject);
    procedure btnprintClick(Sender: TObject);
    procedure cbbZoomChange(Sender: TObject);
    procedure mniN9Click(Sender: TObject);
    procedure mniN14Click(Sender: TObject);
    procedure mniN13Click(Sender: TObject);
    procedure mniC1Click(Sender: TObject);
    procedure mniLineSpaceClick(Sender: TObject);
    procedure mniDisBorderClick(Sender: TObject);
    procedure mniInsertRowTopClick(Sender: TObject);
    procedure mniInsertRowBottomClick(Sender: TObject);
    procedure mniInsertColLeftClick(Sender: TObject);
    procedure mniInsertColRightClick(Sender: TObject);
    procedure mniDeleteRowClick(Sender: TObject);
    procedure mniDeleteColClick(Sender: TObject);
    procedure mniN26Click(Sender: TObject);
    procedure mniSaveAsClick(Sender: TObject);
    procedure mniSaveClick(Sender: TObject);
    procedure mniOpenClick(Sender: TObject);
    procedure mniN27Click(Sender: TObject);
    procedure mniN28Click(Sender: TObject);
    procedure mniN30Click(Sender: TObject);
    procedure mniN31Click(Sender: TObject);
    procedure mniN32Click(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
    FFileName: TFileName;
    FHCView: THCView;
    procedure SetFileName(const AFileName: string);
    procedure DrawItemClick(Shift: TShiftState; X, Y, AItemNo, ADItemNo: Integer;
      ADrawRect: TRect);
    function GetFontSize(AFontSize: string): Integer;              //获取字体大小
    function GetFontSizeStr(AFontSize: Integer): string;
    function GetPaperSizeStr(APaperSize: Integer): string;
    procedure GetPagesAndActive;
    procedure DoCaretChange(Sender: TObject);
    procedure DoVerScroll(Sender: TObject);
    procedure CurTextStyleChange(const ANewStyleNo: Integer);
    procedure CurParaStyleChange(const ANewStyleNo: Integer);
    procedure DoCanDelete(const Sender: THCCustomRichData; const AItemNo,
      AItemOffs: Integer; var ACanDelete: Boolean);
    procedure DoItemLoaded(const AItem: THCCustomItem);
  public
    { Public declarations }
  end;

var
  frmHCViewDemo: TfrmHCViewDemo;

implementation

uses
  frm_InsertTable, frm_PageSet, HCStyle, HCTableItem, HCTextItem, HCDrawItem,
  HCExpressItem, HCLineItem, HCCheckBoxItem, EmrGroupItem, frm_Paragraph;

{$R *.dfm}

function GetVersionInfo: string;
const
  SNotAvailable = 'Value Not Available';
var
  vFilePath: string;
  vLanguageID: string;
  vCodePage: string;
  vTranslationLength: Cardinal;
  vTranslationTable: Pointer;
  vInfoSize, vTemp, vLen: DWord;
  vInfoBuf: Pointer;
  vCompanyName, vFileDescription, vFileVersion, vInternalName, vLegalCopyright: string;
  vLegalTradeMarks, vOriginalFilename, vProductName, vProductVersion, vComments: string;
  vValue: PChar;
  vLookupString: string;
  vPathStz: array[ 0..MAX_PATH ] of Char;
begin
  Result := '';
  GetModuleFileName(HInstance, vPathStz, SizeOf( vPathStz ) );
  vFilePath := vPathStz;

  vInfoSize := GetFileVersionInfoSize( PChar( vFilePath ), vTemp );

  if vInfoSize > 0 then
  begin
    vInfoBuf := AllocMem( vInfoSize );
    try
      GetFileVersionInfo( PChar( vFilePath ), 0, vInfoSize, vInfoBuf );


      if VerQueryValue( vInfoBuf, '\VarFileInfo\Translation', vTranslationTable, vTranslationLength ) then
      begin
        vCodePage := Format( '%.4x', [ HiWord( PLongInt( vTranslationTable )^ ) ] );
        vLanguageID := Format( '%.4x', [ LoWord( PLongInt( vTranslationTable )^ ) ] );
      end;

      vLookupString := 'StringFileInfo\' + vLanguageID + vCodePage + '\';

      if VerQueryValue( vInfoBuf, PChar( vLookupString + 'CompanyName' ), Pointer( vValue ), vLen ) then
        vCompanyName := vValue;
      if VerQueryValue( vInfoBuf, PChar( vLookupString + 'FileDescription' ), Pointer( vValue ), vLen ) then
        vFileDescription := vValue;
      if VerQueryValue( vInfoBuf, PChar( vLookupString + 'FileVersion' ), Pointer( vValue ), vLen ) then
        vFileVersion := vValue;
      if VerQueryValue( vInfoBuf, PChar( vLookupString + 'InternalName' ), Pointer( vValue ), vLen ) then
        vInternalName := vValue;
      if VerQueryValue( vInfoBuf, PChar( vLookupString + 'LegalCopyright' ), Pointer( vValue ), vLen ) then
        vLegalCopyright := vValue;
      if VerQueryValue( vInfoBuf, PChar( vLookupString + 'LegalTrademarks' ), Pointer( vValue ), vLen ) then
        vLegalTradeMarks := vValue;
      if VerQueryValue( vInfoBuf, PChar( vLookupString + 'OriginalFilename' ), Pointer( vValue ), vLen ) then
        vOriginalFilename := vValue;
      if VerQueryValue( vInfoBuf, PChar( vLookupString + 'ProductName' ), Pointer( vValue ), vLen ) then
        vProductName := vValue;
      if VerQueryValue( vInfoBuf, PChar( vLookupString + 'ProductVersion' ), Pointer( vValue ), vLen ) then
        vProductVersion := vValue;
      if VerQueryValue( vInfoBuf, PChar( vLookupString + 'Comments' ), Pointer( vValue ), vLen ) then
        vComments := vValue;
    finally
      FreeMem( vInfoBuf, vInfoSize );
    end;
  end
  else
  begin
    vCompanyName := SNotAvailable;
    vFileDescription := SNotAvailable;
    vFileVersion := SNotAvailable;
    vInternalName := SNotAvailable;
    vLegalCopyright := SNotAvailable;
    vLegalTrademarks := SNotAvailable;
    vOriginalFilename := SNotAvailable;
    vProductName := SNotAvailable;
    vProductVersion := SNotAvailable;
    vComments := SNotAvailable;
  end;
  Result := vFileVersion;
end;

procedure TfrmHCViewDemo.btnSymmetryMarginClick(Sender: TObject);
begin
  FHCView.SymmetryMargin := not FHCView.SymmetryMargin;
end;

procedure TfrmHCViewDemo.cbbFontSizeChange(Sender: TObject);
begin
  FHCView.ApplyTextFontSize(GetFontSize(cbbFontSize.Text));
  if not FHCView.Focused then
    FHCView.SetFocus;
end;

procedure TfrmHCViewDemo.cbbZoomChange(Sender: TObject);
begin
  FHCView.Zoom := (StrToInt(cbbZoom.Text) / 100);
end;

procedure TfrmHCViewDemo.cbbBackColorChange(Sender: TObject);
begin
  FHCView.ApplyTextBackColor(cbbBackColor.Selected);
end;

procedure TfrmHCViewDemo.cbbFontChange(Sender: TObject);
begin
  FHCView.ApplyTextFontName(cbbFont.Text);
  if not FHCView.Focused then
    FHCView.SetFocus;
end;

procedure TfrmHCViewDemo.cbbFontColorChange(Sender: TObject);
begin
  FHCView.ApplyTextColor(cbbFontColor.Selected);
  if not FHCView.Focused then
    FHCView.SetFocus;
end;

procedure TfrmHCViewDemo.DoCanDelete(const Sender: THCCustomRichData;
  const AItemNo, AItemOffs: Integer; var ACanDelete: Boolean);
begin

end;

procedure TfrmHCViewDemo.DoCaretChange(Sender: TObject);
begin
  GetPagesAndActive;

  CurTextStyleChange(FHCView.Style.CurStyleNo);
  CurParaStyleChange(FHCView.Style.CurParaNo);
end;

procedure TfrmHCViewDemo.DoItemLoaded(const AItem: THCCustomItem);
begin
  if AItem.StyleNo < THCStyle.RsNull then

  else
  if AItem.Text = '姓名' then
    AItem.Text := '张三';
end;

procedure TfrmHCViewDemo.CurParaStyleChange(const ANewStyleNo: Integer);
var
  vAlignHorz: TParaAlignHorz;
begin
  if ANewStyleNo >= 0 then
  begin
    vAlignHorz := FHCView.Style.ParaStyles[ANewStyleNo].AlignHorz;

    btnAlignLeft.Down := vAlignHorz = TParaAlignHorz.pahLeft;
    btnAlignRight.Down := vAlignHorz = TParaAlignHorz.pahRight;
    btnAlignCenter.Down := vAlignHorz = TParaAlignHorz.pahCenter;
    btnAlignJustify.Down := vAlignHorz = TParaAlignHorz.pahJustify;
    btnAlignScatter.Down := vAlignHorz = TParaAlignHorz.pahScatter;
  end;
end;

procedure TfrmHCViewDemo.CurTextStyleChange(const ANewStyleNo: Integer);
begin
  if ANewStyleNo >= 0 then
  begin
    cbbFont.ItemIndex := cbbFont.Items.IndexOf(FHCView.Style.TextStyles[ANewStyleNo].Family);
    cbbFontSize.ItemIndex := cbbFontSize.Items.IndexOf(GetFontSizeStr(FHCView.Style.TextStyles[ANewStyleNo].Size));
    btnBold.Down := tsBold in FHCView.Style.TextStyles[ANewStyleNo].FontStyle;
    btnItalic.Down := tsItalic in FHCView.Style.TextStyles[ANewStyleNo].FontStyle;
    btnUnderline.Down := tsUnderline in FHCView.Style.TextStyles[ANewStyleNo].FontStyle;
    btnStrikeOut.Down := tsStrikeOut in FHCView.Style.TextStyles[ANewStyleNo].FontStyle;
    btnSuperscript.Down := tsSuperscript in FHCView.Style.TextStyles[ANewStyleNo].FontStyle;
    btnSubscript.Down := tsSubscript in FHCView.Style.TextStyles[ANewStyleNo].FontStyle;
  end
  else
  begin
    btnBold.Down := False;
    btnItalic.Down := False;
    btnUnderline.Down := False;
    btnStrikeOut.Down := False;
    btnSuperscript.Down := False;
    btnSubscript.Down := False;
  end;
end;

procedure TfrmHCViewDemo.DoVerScroll(Sender: TObject);
begin
  GetPagesAndActive;
end;

procedure TfrmHCViewDemo.DrawItemClick(Shift: TShiftState; X, Y, AItemNo,
  ADItemNo: Integer; ADrawRect: TRect);
begin
//  Caption := 'X:' + IntToStr(X) + ' Y:' + IntToStr(Y)
//    + ' DItemNo:' + IntToStr(ADItemNo)
//    + ' DrawRect:' + IntToStr(ADrawRect.Left) + ','
//    + IntToStr(ADrawRect.Top) + ','
//    + IntToStr(ADrawRect.Right) + ','
//    + IntToStr(ADrawRect.Bottom);
end;

procedure TfrmHCViewDemo.btnAnnotationClick(Sender: TObject);
begin
  FHCView.ShowAnnotation := not FHCView.ShowAnnotation;
end;

procedure TfrmHCViewDemo.btnBoldClick(Sender: TObject);
begin
  case (Sender as TToolButton).Tag of
    0: FHCView.ApplyTextStyle(TFontStyleEx.tsBold);
    1: FHCView.ApplyTextStyle(TFontStyleEx.tsItalic);
    2: FHCView.ApplyTextStyle(TFontStyleEx.tsUnderline);
    3: FHCView.ApplyTextStyle(TFontStyleEx.tsStrikeOut);
    4: FHCView.ApplyTextStyle(TFontStyleEx.tsSuperscript);
    5: FHCView.ApplyTextStyle(TFontStyleEx.tsSubscript);
  end;
end;

procedure TfrmHCViewDemo.btnNewClick(Sender: TObject);
begin
  FHCView.ClearData;
end;

procedure TfrmHCViewDemo.btnprintClick(Sender: TObject);
begin
  FHCView.Print('');
end;

procedure TfrmHCViewDemo.btn10Click(Sender: TObject);
begin
  FHCView.MergeTableSelectCells;
end;

procedure TfrmHCViewDemo.btn11Click(Sender: TObject);
begin
  // FHCView.SaveToBitmap('C:\Users\Thinkpad\Desktop\a.bmp');
end;

procedure TfrmHCViewDemo.btnAlignLeftClick(Sender: TObject);
begin
  case (Sender as TToolButton).Tag of
    0: FHCView.ApplyParaAlignHorz(TParaAlignHorz.pahLeft);
    1: FHCView.ApplyParaAlignHorz(TParaAlignHorz.pahCenter);
    2: FHCView.ApplyParaAlignHorz(TParaAlignHorz.pahRight);
    3: FHCView.ApplyParaAlignHorz(TParaAlignHorz.pahJustify);  // 两端
    4: FHCView.ApplyParaAlignHorz(TParaAlignHorz.pahScatter);  // 分散
  end;
end;

procedure TfrmHCViewDemo.FormCreate(Sender: TObject);
begin
  Caption := 'HCViewDemo ' + GetVersionInfo;
  FHCView := THCView.Create(Self);
  FHCView.OnCaretChange := DoCaretChange;
  FHCView.OnVerScroll := DoVerScroll;
  FHCView.Parent := Self;
  FHCView.Align := alClient;
  FHCView.PopupMenu := pmRichEdit;
end;

procedure TfrmHCViewDemo.FormDestroy(Sender: TObject);
begin
  FHCView.Free;
end;

procedure TfrmHCViewDemo.FormShow(Sender: TObject);
begin
  cbbFont.Items := Screen.Fonts;
  cbbFont.ItemIndex := cbbFont.Items.IndexOf('宋体');
  FHCView.SetFocus;
end;

function TfrmHCViewDemo.GetFontSize(AFontSize: string): Integer;
begin
  Result := 10;
  if not TryStrToInt(AFontSize, Result) then
  begin
    if AFontSize = '初号' then Result := 42
    else
    if AFontSize = '小初' then Result := 36
    else
    if AFontSize = '一号' then Result := 26
    else
    if AFontSize = '小一' then Result := 24
    else
    if AFontSize = '二号' then Result := 22
    else
    if AFontSize = '小二' then Result := 18
    else
    if AFontSize = '三号' then Result := 16
    else
    if AFontSize = '小三' then Result := 15
    else
    if AFontSize = '四号' then Result := 14
    else
    if AFontSize = '小四' then Result := 12
    else
    if AFontSize = '五号' then Result := Round(10.5)//Trunc(10.5)
    else
    if AFontSize = '小五' then Result := 9
    else
    if AFontSize = '六号' then Result := Round(7.5)
    else
    if AFontSize = '小六' then Result := Round(6.5)
    else
    if AFontSize = '七号' then Result := Round(5.5);
  end;
end;

function TfrmHCViewDemo.GetFontSizeStr(AFontSize: Integer): string;
begin
  Result := IntToStr(AFontSize);
  if AFontSize = 42 then Result := '初号';
  if AFontSize = 36 then Result := '小初';
  if AFontSize = 26 then Result := '一号';
  if AFontSize = 24 then Result := '小一';
  if AFontSize = 22 then Result := '二号';
  if AFontSize = 18 then Result := '小二';
  if AFontSize = 16 then Result := '三号';
  if AFontSize = 15 then Result := '小三';
  if AFontSize = 14 then Result := '四号';
  if AFontSize = 12 then Result := '小四';
  if AFontSize = 11 then Result := '五号';
  if AFontSize = 9 then Result := '小五';
  if AFontSize = 7 then Result := '六号';
  if AFontSize = 6 then Result := '小六';
  if AFontSize = 5 then Result := '七号';
end;

procedure TfrmHCViewDemo.GetPagesAndActive;
begin
  statbar.Panels[0].Text := '预览' + IntToStr(FHCView.PagePreviewFirst + 1)
    + '页 光标' + IntToStr(FHCView.ActivePageIndex + 1)
    + '页 共' + IntToStr(FHCView.PageCount) + '页';
end;

function TfrmHCViewDemo.GetPaperSizeStr(APaperSize: Integer): string;
begin
  case APaperSize of
    DMPAPER_A3: Result := 'A3';
    DMPAPER_A4: Result := 'A4';
    DMPAPER_A5: Result := 'A5';
    DMPAPER_B5: Result := 'B5';
  else
    Result := '自定义';
  end;
end;

procedure TfrmHCViewDemo.mniC1Click(Sender: TObject);
var
  vCheckBox: TCheckBoxItem;
begin
  vCheckBox := TCheckBoxItem.Create(FHCView.Style.CurStyleNo, '勾选框', False);
  FHCView.InsertItem(vCheckBox);
end;

procedure TfrmHCViewDemo.mniCopyClick(Sender: TObject);
begin
  FHCView.Copy;
end;

procedure TfrmHCViewDemo.mniInsertTableClick(Sender: TObject);
var
  vFrmInsertTable: TfrmInsertTable;
begin
  vFrmInsertTable := TfrmInsertTable.Create(Self);
  try
    vFrmInsertTable.ShowModal;
    if vFrmInsertTable.ModalResult = mrOk then
      FHCView.InsertTable(StrToInt(vFrmInsertTable.edtRows.Text),
        StrToInt(vFrmInsertTable.edtCols.Text));
  finally
    FreeAndNil(vFrmInsertTable);
  end;
end;

procedure TfrmHCViewDemo.mniLineSpaceClick(Sender: TObject);
begin
  if Sender is TMenuItem then
  begin
    case (Sender as TMenuItem).Tag of
      0: FHCView.ApplyParaLineSpace(8);
      1: FHCView.ApplyParaLineSpace(12);
      2: FHCView.ApplyParaLineSpace(16);
    end;
  end;
end;

procedure TfrmHCViewDemo.mniCutClick(Sender: TObject);
begin
  FHCView.Cut;
end;

procedure TfrmHCViewDemo.mniN13Click(Sender: TObject);
var
  vExpress: TExperssItem;
begin
  vExpress := TExperssItem.Create('12', '5-6', '2017-6-3', '28-30');
  FHCView.InsertItem(vExpress);
end;

procedure TfrmHCViewDemo.mniN14Click(Sender: TObject);
begin
  FHCView.InsertLine(1);
end;

procedure TfrmHCViewDemo.mniDisBorderClick(Sender: TObject);
var
  vTable: THCTableItem;
begin
  if FHCView.ActiveSection.ActiveData.GetCurItem is THCTableItem then
  begin
    vTable := FHCView.ActiveSection.ActiveData.GetCurItem as THCTableItem;
    vTable.BorderVisible := not vTable.BorderVisible;
    FHCView.UpdateBuffer;
  end;
end;

procedure TfrmHCViewDemo.mniInsertRowTopClick(Sender: TObject);
begin
  FHCView.ActiveTableInsertRowBefor(1);
end;

procedure TfrmHCViewDemo.mniInsertRowBottomClick(Sender: TObject);
begin
  FHCView.ActiveTableInsertRowAfter(1);
end;

procedure TfrmHCViewDemo.mniInsertColLeftClick(Sender: TObject);
begin
  FHCView.ActiveTableInsertColBefor(1);
end;

procedure TfrmHCViewDemo.mniInsertColRightClick(Sender: TObject);
begin
  FHCView.ActiveTableInsertColAfter(1);
end;

procedure TfrmHCViewDemo.mniDeleteRowClick(Sender: TObject);
begin
  FHCView.ActiveTableDeleteRow(1);
end;

procedure TfrmHCViewDemo.mniDeleteColClick(Sender: TObject);
begin
  FHCView.ActiveTableDeleteCol(1);
end;

procedure TfrmHCViewDemo.mniN26Click(Sender: TObject);
var
  vFrmParagraph: TfrmParagraph;
begin
  vFrmParagraph := TfrmParagraph.Create(Self);
  try
    vFrmParagraph.edtLineSpace.Text := IntToStr(FHCView.Style.ParaStyles[FHCView.Style.CurParaNo].LineSpace);
    vFrmParagraph.cbbAlignHorz.ItemIndex := Ord(FHCView.Style.ParaStyles[FHCView.Style.CurParaNo].AlignHorz);
    vFrmParagraph.cbbAlignVert.ItemIndex := Ord(FHCView.Style.ParaStyles[FHCView.Style.CurParaNo].AlignVert);
    vFrmParagraph.clrbxBG.Color := FHCView.Style.ParaStyles[FHCView.Style.CurParaNo].BackColor;

    vFrmParagraph.ShowModal;
    if vFrmParagraph.ModalResult = mrOk then
    begin
      FHCView.BeginUpdate;
      try
        FHCView.ApplyParaLineSpace(StrToIntDef(vFrmParagraph.edtLineSpace.Text, 8));
        FHCView.ApplyParaAlignHorz(TParaAlignHorz(vFrmParagraph.cbbAlignHorz.ItemIndex));
        FHCView.ApplyParaAlignVert(TParaAlignVert(vFrmParagraph.cbbAlignVert.ItemIndex));
        FHCView.ApplyParaBackColor(vFrmParagraph.clrbxBG.Color);
      finally
        FHCView.EndUpdate;
      end;
    end;
  finally
    FreeAndNil(vFrmParagraph);
  end;
end;

procedure TfrmHCViewDemo.mniN27Click(Sender: TObject);
begin
  FHCView.InsertPageBreak;
end;

procedure TfrmHCViewDemo.mniN28Click(Sender: TObject);
begin
  FHCView.InsertPageSeparator;
end;

procedure TfrmHCViewDemo.mniN30Click(Sender: TObject);
begin
  FHCView.DeleteSelected;
end;

procedure TfrmHCViewDemo.mniN31Click(Sender: TObject);
begin
  FHCView.DeleteSection;
end;

procedure TfrmHCViewDemo.mniN32Click(Sender: TObject);
var
  vMemory: TMemoryStream;
begin
  vMemory := TMemoryStream.Create;
  try
    vMemory.LoadFromFile('C:\Users\jingtong\Desktop\a.cff');
    FHCView.InsertStream(vMemory);
  finally
    FreeAndNil(vMemory);
  end;
end;

procedure TfrmHCViewDemo.mniN5Click(Sender: TObject);
var
  vFrmPageSet: TFrmPageSet;
begin
  vFrmPageSet := TFrmPageSet.Create(Self);
  try
    vFrmPageSet.cbbPaper.ItemIndex := vFrmPageSet.cbbPaper.Items.IndexOf(GetPaperSizeStr(FHCView.ActiveSection.PaperSize));
    if vFrmPageSet.cbbPaper.ItemIndex < 0 then
      vFrmPageSet.cbbPaper.ItemIndex := 0;
    vFrmPageSet.edtWidth.Text := FloatToStr(FHCView.ActiveSection.PaperWidth);
    vFrmPageSet.edtHeight.Text := FloatToStr(FHCView.ActiveSection.PaperHeight);

    vFrmPageSet.edtTop.Text := FloatToStr(FHCView.ActiveSection.PaperMarginTop);
    vFrmPageSet.edtLeft.Text := FloatToStr(FHCView.ActiveSection.PaperMarginLeft);
    vFrmPageSet.edtRight.Text := FloatToStr(FHCView.ActiveSection.PaperMarginRight);
    vFrmPageSet.edtBottom.Text := FloatToStr(FHCView.ActiveSection.PaperMarginBottom);
    vFrmPageSet.chkShowLineNo.Checked := FHCView.ShowLineNo;
    vFrmPageSet.chkShowLineActiveMark.Checked := FHCView.ShowLineActiveMark;
    vFrmPageSet.chkShowUnderLine.Checked := FHCView.ShowUnderLine;
    vFrmPageSet.ShowModal;
    if vFrmPageSet.ModalResult = mrOk then
    begin
      FHCView.ActiveSection.PaperSize := DMPAPER_A4;
      FHCView.ActiveSection.PaperWidth := StrToFloat(vFrmPageSet.edtWidth.Text);
      FHCView.ActiveSection.PaperHeight := StrToFloat(vFrmPageSet.edtHeight.Text);

      FHCView.ActiveSection.PaperMarginTop := StrToFloat(vFrmPageSet.edtTop.Text);
      FHCView.ActiveSection.PaperMarginLeft := StrToFloat(vFrmPageSet.edtLeft.Text);
      FHCView.ActiveSection.PaperMarginRight := StrToFloat(vFrmPageSet.edtRight.Text);
      FHCView.ActiveSection.PaperMarginBottom := StrToFloat(vFrmPageSet.edtBottom.Text);
      FHCView.ShowLineNo := vFrmPageSet.chkShowLineNo.Checked;
      FHCView.ShowLineActiveMark := vFrmPageSet.chkShowLineActiveMark.Checked;
      FHCView.ShowUnderLine := vFrmPageSet.chkShowUnderLine.Checked;
      FHCView.ReMarginPaper;
    end;
  finally
    FreeAndNil(vFrmPageSet);
  end;
end;

procedure TfrmHCViewDemo.mniN9Click(Sender: TObject);
var
  vBmp: TBitmap;
begin
  vBmp := TBitmap.Create;
  vBmp.LoadFromFile('辅助设计\test.bmp');
//  FHCView.InsertItem .InsertGraphic(vBmp);
end;

procedure TfrmHCViewDemo.mniOpenClick(Sender: TObject);
var
  vOpenDlg: TOpenDialog;
  vt1, vt2: Cardinal;
begin
  vOpenDlg := TOpenDialog.Create(Self);
  try
    vOpenDlg.Filter := '文件|*' + HC_EXT;
    if vOpenDlg.Execute then
    begin
      if vOpenDlg.FileName <> '' then
      begin
        FFileName := vOpenDlg.FileName;
        vt1 := GetTickCount;
        FHCView.LoadFromFile(FFileName);
        vt2 := GetTickCount - vt1;
        //Caption := IntToStr(vt2);
      end;
    end;
  finally
    FreeAndNil(vOpenDlg);
  end;
end;

procedure TfrmHCViewDemo.mniPasteClick(Sender: TObject);
begin
  FHCView.Paste;
end;

procedure TfrmHCViewDemo.mniSaveAsClick(Sender: TObject);
var
  vDlg: TSaveDialog;
begin
  vDlg := TSaveDialog.Create(Self);
  try
    vDlg.Filter := '文件|*.cff';
    vDlg.Execute;
    if vDlg.FileName <> '' then
    begin
      if ExtractFileName(vDlg.FileName) <> '.cff' then
        vDlg.FileName := vDlg.FileName + '.cff';
      FHCView.SaveToFile(vDlg.FileName);
      SetFileName(vDlg.FileName);
    end;
  finally
    vDlg.Free;
  end;
end;

procedure TfrmHCViewDemo.mniSaveClick(Sender: TObject);
var
  vDlg: TSaveDialog;
begin
  if FFileName <> '' then
    FHCView.SaveToFile(FFileName)
  else
  begin
    vDlg := TSaveDialog.Create(Self);
    try
      vDlg.Filter := '文件|*' + HC_EXT;
      vDlg.Execute;
      if vDlg.FileName <> '' then
      begin
        if ExtractFileName(vDlg.FileName) <> HC_EXT then
          vDlg.FileName := vDlg.FileName + HC_EXT;
        FHCView.SaveToFile(vDlg.FileName);
      end;
    finally
      vDlg.Free;
    end;
  end;
end;

procedure TfrmHCViewDemo.N2Click(Sender: TObject);
begin
  FHCView.MergeTableSelectCells;
end;

procedure TfrmHCViewDemo.pmRichEditPopup(Sender: TObject);
var
  vItem: THCCustomItem;
  vData: THCCustomRichData;
begin
  vData := FHCView.ActiveSection.ActiveData;
  vItem := vData.GetCurItem;
  mniTable.Enabled := vItem.StyleNo = THCStyle.RsTable;
  if mniTable.Enabled then
  begin
    mniInsertRowTop.Enabled := (vItem as THCTableItem).GetEditCell <> nil;
    mniInsertRowBottom.Enabled := mniInsertRowTop.Enabled;
    mniInsertColLeft.Enabled := mniInsertRowTop.Enabled;
    mniInsertColRight.Enabled := mniInsertRowTop.Enabled;
    mniDeleteRow.Enabled := mniInsertRowTop.Enabled;
    mniDeleteCol.Enabled := mniInsertRowTop.Enabled;
  end;
  mniCut.Enabled := vData.SelectExists;
  mniCopy.Enabled := mniCut.Enabled;
  //mniPaste :=
end;

procedure TfrmHCViewDemo.SetFileName(const AFileName: string);
begin
  FFileName := AFileName;
  statbar.Panels[1].Text := FFileName;
end;

end.
