unit Tablo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Menus, MPlayer;

type
  TAlarmForm = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PopupMenu1: TPopupMenu;
    Close1: TMenuItem;
    Minimize1: TMenuItem;
    SpeedButton3: TSpeedButton;
    SoundM: TCheckBox;
    OpenDialog1: TOpenDialog;
    Options1: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Minimize1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SoundMClick(Sender: TObject);
    procedure Options1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AlarmForm: TAlarmForm;
  BudilnikOk:Boolean;

implementation
uses mmsystem;
{$R *.DFM}

procedure TAlarmForm.Timer1Timer(Sender: TObject);
var i:longint;
begin
Label1.Caption := TimeToStr(Time);
if BudilnikOk then
   if (StrToTime(Edit1.Text)<Time) and (StrToTime(Edit1.Text)>Time-0.008) then
      if SoundM.Checked then sndPlaySound(PChar(OpenDialog1.FileName), SND_SYNC)
         else for i:=1 to 100 do Beep;
end;

procedure TAlarmForm.FormCreate(Sender: TObject);
begin
{Application.Minimize;}
BudilnikOk:=false;
{OpenDialog1.create(Self);}
end;

procedure TAlarmForm.SpeedButton1Click(Sender: TObject);
begin
Close;
end;

procedure TAlarmForm.SpeedButton2Click(Sender: TObject);
begin
if BudilnikOk then SpeedButton2.Caption:='Mute' else
   if SoundM.Checked then SpeedButton2.Caption:='Sound'
      else SpeedButton2.Caption:='Beep';
BudilnikOk:=not(BudilnikOk);
Edit1.ReadOnly:=BudilnikOk;
if BudilnikOk then AlarmForm.Hint:='Будильник зазвенит в '+Edit1.Text;
if BudilnikOk then
   if (StrToTime(Edit1.Text)<Time) and (StrToTime(Edit1.Text)>Time-0.008) then
      if SoundM.Checked then sndPlaySound(nil, 0);
end;

procedure TAlarmForm.Minimize1Click(Sender: TObject);
begin
Application.Minimize;
end;

procedure TAlarmForm.Close1Click(Sender: TObject);
begin
if BudilnikOk then
   if (StrToTime(Edit1.Text)<Time) and (StrToTime(Edit1.Text)>Time-0.008) then
      if SoundM.Checked then sndPlaySound(nil, 0);
Close;
end;

procedure TAlarmForm.SpeedButton3Click(Sender: TObject);
begin
OpenDialog1.Execute;
end;

procedure TAlarmForm.SoundMClick(Sender: TObject);
begin
if not(BudilnikOk) then SpeedButton2.Caption:='Mute' else
   if SoundM.Checked then SpeedButton2.Caption:='Sound'
      else SpeedButton2.Caption:='Beep';
end;

procedure TAlarmForm.Options1Click(Sender: TObject);
begin
OpenDialog1.Execute;
end;

end.
