object Form1: TForm1
  Left = 227
  Top = 230
  Width = 491
  Height = 389
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object InfoBevel: TBevel
    Left = 4
    Top = 148
    Width = 473
    Height = 209
  end
  object TagExistsLabel: TLabel
    Left = 20
    Top = 164
    Width = 51
    Height = 13
    Caption = 'Tag exists:'
  end
  object TagVersionLabel: TLabel
    Left = 228
    Top = 164
    Width = 59
    Height = 13
    Caption = 'Tag version:'
  end
  object TitleLabel: TLabel
    Left = 20
    Top = 196
    Width = 23
    Height = 13
    Caption = 'Title:'
  end
  object ArtistLabel: TLabel
    Left = 20
    Top = 228
    Width = 26
    Height = 13
    Caption = 'Artist:'
  end
  object AlbumLabel: TLabel
    Left = 20
    Top = 260
    Width = 32
    Height = 13
    Caption = 'Album:'
  end
  object YearLabel: TLabel
    Left = 140
    Top = 292
    Width = 25
    Height = 13
    Caption = 'Year:'
  end
  object CommentLabel: TLabel
    Left = 20
    Top = 324
    Width = 47
    Height = 13
    Caption = 'Comment:'
  end
  object TrackLabel: TLabel
    Left = 20
    Top = 292
    Width = 31
    Height = 13
    Caption = 'Track:'
  end
  object GenreLabel: TLabel
    Left = 252
    Top = 292
    Width = 32
    Height = 13
    Caption = 'Genre:'
  end
  object ShellTreeView1: TShellTreeView
    Left = 4
    Top = 4
    Width = 229
    Height = 137
    ObjectTypes = [otFolders]
    Root = 'rfDesktop'
    UseShellImages = True
    AutoRefresh = False
    Indent = 19
    ParentColor = False
    RightClickSelect = True
    ShowRoot = False
    TabOrder = 0
    OnChange = ShellTreeView1Change
  end
  object CloseButton: TButton
    Left = 386
    Top = 98
    Width = 83
    Height = 25
    Cancel = True
    Caption = 'Close'
    TabOrder = 1
    OnClick = CloseButtonClick
  end
  object RemoveButton: TButton
    Left = 386
    Top = 58
    Width = 83
    Height = 25
    Caption = 'Remove'
    TabOrder = 2
    OnClick = RemoveButtonClick
  end
  object SaveButton: TButton
    Left = 386
    Top = 18
    Width = 83
    Height = 25
    Caption = 'Save'
    TabOrder = 3
    OnClick = SaveButtonClick
  end
  object TitleEdit: TEdit
    Left = 92
    Top = 192
    Width = 369
    Height = 21
    MaxLength = 30
    TabOrder = 4
  end
  object ArtistEdit: TEdit
    Left = 92
    Top = 224
    Width = 369
    Height = 21
    MaxLength = 30
    TabOrder = 5
  end
  object AlbumEdit: TEdit
    Left = 92
    Top = 256
    Width = 369
    Height = 21
    MaxLength = 30
    TabOrder = 6
  end
  object TrackEdit: TEdit
    Left = 92
    Top = 288
    Width = 33
    Height = 21
    MaxLength = 2
    TabOrder = 7
  end
  object YearEdit: TEdit
    Left = 180
    Top = 288
    Width = 57
    Height = 21
    MaxLength = 4
    TabOrder = 8
  end
  object CommentEdit: TEdit
    Left = 92
    Top = 320
    Width = 369
    Height = 21
    MaxLength = 30
    TabOrder = 9
  end
  object GenreComboBox: TComboBox
    Left = 300
    Top = 288
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 10
  end
  object TagExistsValue: TEdit
    Left = 92
    Top = 161
    Width = 121
    Height = 19
    TabStop = False
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 11
  end
  object TagVersionValue: TEdit
    Left = 300
    Top = 161
    Width = 161
    Height = 19
    TabStop = False
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 12
  end
  object FileListBox1: TFileListBox
    Left = 234
    Top = 4
    Width = 147
    Height = 137
    ItemHeight = 13
    Mask = '*.mp3'
    TabOrder = 13
    OnChange = FileListBox1Change
  end
end
