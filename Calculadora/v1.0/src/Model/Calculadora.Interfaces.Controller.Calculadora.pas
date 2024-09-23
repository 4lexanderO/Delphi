unit Calculadora.Interfaces.Controller.Calculadora;

interface

type
  TOperacao = (tpNenhuma, tpSoma, tpSubtracao, tpDivisao, tpMultiplicacao);

  IControllerCalculadora = interface
    ['{413636D7-9331-433F-B123-6D3CA0E94A9D}']

    function Numero1(Numero: Double): IControllerCalculadora; overload;
    function Numero1: Double; overload;
    function Numero2(Numero: Double): IControllerCalculadora; overload;
    function Numero2: Double; overload;

    function Operador(Operador: TOperacao): IControllerCalculadora; overload;
    function Operador: TOperacao; overload;

    function Somar: Double;
    function Subtrair: Double;
    function Dividir: Double;
    function Multiplicar: Double;
    function Calcular: Double;
  end;
implementation

end.
