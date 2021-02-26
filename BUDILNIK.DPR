program Budilnik;

uses
  Forms,
  Tablo in 'Tablo.pas' {AlarmForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TAlarmForm, AlarmForm);
  Application.Run;
end.
