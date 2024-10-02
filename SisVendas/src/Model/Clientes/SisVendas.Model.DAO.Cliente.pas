unit SisVendas.Model.DAO.Cliente;

interface

uses
  SisVendas.Interfaces.Cliente,
  System.Generics.Collections,
  System.SysUtils,
  IniFiles, System.Classes;

type
  TDAOCliente = class(TInterfacedObject, IDAOCliente)
    private
      FClientes: TList<ICliente>;

      constructor Create;
      destructor Destroy; override;
    public
      class function New: IDAOCliente;
      function Salvar(Clientes: TList<ICliente>): IDAOCliente;
  end;

implementation

{ TDAOCliente }

{$REGION 'Construtores / Destrutores'}

constructor TDAOCliente.Create;
begin
  FClientes := TList<ICliente>.Create;
end;

destructor TDAOCliente.Destroy;
begin
  inherited;
  FreeAndNil(FClientes);
end;

class function TDAOCliente.New: IDAOCliente;
begin
  Result := Self.Create;
end;

{$ENDREGION}

function TDAOCliente.Salvar(Clientes: TList<ICliente>): IDAOCliente;
var
  LArquivo: TStringList;
begin
  LArquivo := TStringList.Create;
  try
    LArquivo.Add('--------------------');
    LArquivo.Add('Bem-vindo(a) ao SisVendas!');
    LArquivo.Add('--------------------');

    for var i: integer := 0 to FClientes.Count - 1 do
    begin
      LArquivo.Add('--------------------');
      LArquivo.Add('C�digo:' + FClientes[i].Codigo.ToString);
      LArquivo.Add('Cliente:' + FClientes[i].Nome);
      LArquivo.Add('Idade:' + FClientes[i].Idade.ToString);
      LArquivo.Add('--------------------');
    end;

    LArquivo.SaveToFile(GetCurrentDir + '\Clientes.txt');
  finally
    FreeAndNil(LArquivo);
  end;
end;

end.
