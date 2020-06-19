unit TBS.CompressDir;

interface

uses
  System.Zip, Vcl.FileCtrl;

type
  ITBSCompressDir = interface
    procedure Compress(const APath: String);
  end;

  ITBSSelectDir = interface
    function SelectedDir: String;
  end;

  TBSSelectDir = class(TInterfacedObject, ITBSSelectDir)
  public
    function SelectedDir: string;
    class function New: ITBSSelectDir;
  end;

  TBSCompressDir = class(TInterfacedObject, ITBSCompressDir)
  public
    procedure Compress(const APath: String);
    class function New: ITBSCompressDir;
  end;

implementation

{ TBSCompressDir }

procedure TBSCompressDir.Compress(const APath: String);
begin
  TZipFile.ZipDirectoryContents(APath + '.zip',APath);
end;

class function TBSCompressDir.New: ITBSCompressDir;
begin
  Result := Self.Create;
end;

{ TBSSelectDir }

class function TBSSelectDir.New: ITBSSelectDir;
begin
  Result := Self.Create;
end;

function TBSSelectDir.SelectedDir: string;
var
  sDir: TArray<String>;
begin
  SelectDirectory('',sDir,[],'Selecionar Pasta','Pasta selecionada:');
  Result := sDir[0];
end;

end.
