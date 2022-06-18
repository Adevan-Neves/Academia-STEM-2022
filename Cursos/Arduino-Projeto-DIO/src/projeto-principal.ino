/* Projeto Lab da DIO 
   Programando um Robô do zero com Arduino*/

int trig=13;//Definindo que O TRIG está na porta 13
int echo=12;//Definindo que o ECHO está na porta 12
int chave=2;//Definindo que a chave está na porta 2

float distancia;

void setup(){
	pinMode(trig,OUTPUT);// Definindo que TRIG é do tipo saída
  	pinMode(echo,INPUT);// Definindo que ECHO é do tipo entrada
  	pinMode(chave,OUTPUT);// Definindo que chave é do tipo saída
  
  	Serial.begin(9600);// valor de transmissão de dados para o computador
}

void loop(){
	digitalWrite(trig,HIGH);// Saída ALTO no trig para mandar o som
  	delay(0010);            // contagem de 10 milisegundos para o evento
  	digitalWrite(trig,LOW); // Saída BAIXO no trig para acabar com o som
  
  	distancia=pulseIn(echo,HIGH); // Recupera a distância em cm do objeto
  	distancia=distancia/58;       // Logo, distância em cm = tempo / 58
  	if(distancia<=25.0){
  		digitalWrite(chave,HIGH);
    }  else{
    	digitalWrite(chave,LOW);
    }
  	Serial.println(distancia);    // Mostra o valor dessa distância
}