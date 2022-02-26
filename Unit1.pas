unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, ComCtrls, id3v1, ShellCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    ShellTreeView1: TShellTreeView;
    InfoBevel: TBevel;
    TagExistsLabel: TLabel;
    TagVersionLabel: TLabel;
    TitleLabel: TLabel;
    ArtistLabel: TLabel;
    AlbumLabel: TLabel;
    YearLabel: TLabel;
    CommentLabel: TLabel;
    TrackLabel: TLabel;
    GenreLabel: TLabel;
    CloseButton: TButton;
    RemoveButton: TButton;
    SaveButton: TButton;
    TitleEdit: TEdit;
    ArtistEdit: TEdit;
    AlbumEdit: TEdit;
    TrackEdit: TEdit;
    YearEdit: TEdit;
    CommentEdit: TEdit;
    GenreComboBox: TComboBox;
    TagExistsValue: TEdit;
    TagVersionValue: TEdit;
    FileListBox1: TFileListBox;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FileListChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SaveButtonClick(Sender: TObject);
    procedure RemoveButtonClick(Sender: TObject);
    procedure ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure FileListBox1Change(Sender: TObject);
  private
    FileTag: TID3v1;
    procedure ClearAll;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ClearAll;
begin
  { Clear all captions }
  TagExistsValue.Text := '';
  TagVersionValue.Text := '';
  TitleEdit.Text := '';
  ArtistEdit.Text := '';
  AlbumEdit.Text := '';
  TrackEdit.Text := '';
  YearEdit.Text := '';
  GenreComboBox.ItemIndex := 0;
  CommentEdit.Text := '';
end;

procedure TForm1.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Iterator: Integer;
begin
  { Create object }
  FileTag := TID3v1.Create;
  { Fill and initialize genres }
  GenreComboBox.Items.Add('');
  for Iterator := 0 to MAX_MUSIC_GENRES - 1 do
    GenreComboBox.Items.Add(MusicGenre[Iterator]);
  { Reset }
  ClearAll;
end;

procedure TForm1.RemoveButtonClick(Sender: TObject);
begin
  { Delete tag data }
  if (FileExists(FileListBox1.FileName)) and
    (FileTag.RemoveFromFile(FileListBox1.FileName)) then ClearAll
  else ShowMessage('Can not remove tag from the file: ' + FileListBox1.FileName);
end;

procedure TForm1.FileListChange(Sender: TObject);
begin
  { Clear captions }
  ClearAll;
  if FileListbox1.FileName = '' then exit;
  if FileExists(FileListBox1.FileName) then
    { Load tag data }
    if FileTag.ReadFromFile(FileListBox1.FileName) then
      if FileTag.Exists then
      begin
        { Fill captions }
        TagExistsValue.Text := 'Yes';
        if FileTag.VersionID = TAG_VERSION_1_0 then
          TagVersionValue.Text := '1.0'
        else
          TagVersionValue.Text := '1.1';
        TitleEdit.Text := FileTag.Title;
        ArtistEdit.Text := FileTag.Artist;
        AlbumEdit.Text := FileTag.Album;
        TrackEdit.Text := IntToStr(FileTag.Track);
        YearEdit.Text := FileTag.Year;
        if FileTag.GenreID < MAX_MUSIC_GENRES then
          GenreComboBox.ItemIndex := FileTag.GenreID + 1;
        CommentEdit.Text := FileTag.Comment;
      end
      else
        { Tag not found }
        TagExistsValue.Text := 'No'
    else
      { Read error }
      ShowMessage('Can not read tag from the file: ' + FileListBox1.FileName)
  else
    { File does not exist }
    ShowMessage('The file does not exist: ' + FileListBox1.FileName);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FileTag.Free;
end;

procedure TForm1.SaveButtonClick(Sender: TObject);
var
  Value, Code: Integer;
begin
  { Prepare tag data }
  FileTag.Title := TitleEdit.Text;
  FileTag.Artist := ArtistEdit.Text;
  FileTag.Album := AlbumEdit.Text;
  FileTag.Year := YearEdit.Text;
  Val(TrackEdit.Text, Value, Code);
  if (Code = 0) and (Value > 0) then FileTag.Track := Value
  else FileTag.Track := 0;
  if GenreComboBox.ItemIndex = 0 then FileTag.GenreID := DEFAULT_GENRE
  else FileTag.GenreID := GenreComboBox.ItemIndex - 1;
  FileTag.Comment := CommentEdit.Text;
  { Save tag data }
  if (not FileExists(FileListBox1.FileName)) or
    (not FileTag.SaveToFile(FileListBox1.FileName)) then
    ShowMessage('Can not save tag to the file: ' + FileListBox1.FileName);
  FileListChange(Self);
end;

procedure TForm1.ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  Filelistbox1.Directory := ShellTreeView1.Path;
end;

procedure TForm1.FileListBox1Change(Sender: TObject);
begin
  { Clear captions }
  ClearAll;
  if FileListbox1.FileName = '' then exit;
  if FileExists(FileListBox1.FileName) then
    { Load tag data }
    if FileTag.ReadFromFile(FileListBox1.FileName) then
      if FileTag.Exists then
      begin
        { Fill captions }
        TagExistsValue.Text := 'Yes';
        if FileTag.VersionID = TAG_VERSION_1_0 then
          TagVersionValue.Text := '1.0'
        else
          TagVersionValue.Text := '1.1';
        TitleEdit.Text := FileTag.Title;
        ArtistEdit.Text := FileTag.Artist;
        AlbumEdit.Text := FileTag.Album;
        TrackEdit.Text := IntToStr(FileTag.Track);
        YearEdit.Text := FileTag.Year;
        if FileTag.GenreID < MAX_MUSIC_GENRES then
          GenreComboBox.ItemIndex := FileTag.GenreID + 1;
        CommentEdit.Text := FileTag.Comment;
      end
      else
        { Tag not found }
        TagExistsValue.Text := 'No'
    else
      { Read error }
      ShowMessage('Can not read tag from the file: ' + FileListBox1.FileName)
  else
    { File does not exist }
    ShowMessage('The file does not exist: ' + FileListBox1.FileName);
end;

end.
