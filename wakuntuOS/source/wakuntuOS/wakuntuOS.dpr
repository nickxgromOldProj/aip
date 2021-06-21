program wakuntuOS;

uses
  Vcl.Forms,
  login in '..\login\login.pas' {loging};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tloging, loging);
  Application.Run;
end.
