#include <iostream>
#include <string>
#include <cstring>
#include <cctype>
#include <cmath>

using std::cin;
using std::cout;
using std::endl;
using std::string;
using std::getline;
using std::ostream;

template <typename T>
class Node
{    
    private:
        T value;
        Node* next;
    public:
        Node(const T newValue, Node* newNext = NULL){
            value = newValue;
            next = newNext;
        }
        T getValue(){
            return value;
        }
        void setValue(T newValue){
            value = newValue;
        }
        Node* getNext(){
            return next;
        }
        void setNext(Node* newNext){
            next = newNext;
        }
};

template <typename T>
class LinkedList
{
    private:
        Node<T>* head;
        int currentSize;
    public:
        LinkedList(){
            head=NULL;
            currentSize = 0;
        }
        void addNode(T newValue){
            Node<T>* node = new Node<T>(newValue, NULL);
            if(head==NULL){
                head = node;
            } else {
                Node<T>* temp = head;
                while(temp->getNext()!=NULL){
                    temp = temp->getNext();
                }
                temp->setNext(node);
            }
            currentSize++;
        }
        T getByIndex(int i){
            if(i>=0 && i<currentSize){
                Node<T>* temp = head;
                for(int j=1;j<=i;j++){
                    temp = temp->getNext();
                }
                return temp->getValue();
            } else {
                throw std::underflow_error("Erro de manipulacao");
            }
        }
        void removeByItemData(T item){
            if(!isEmpty()){
                if(getCurrentSize()>1){
                    Node<T>* temp = head;
                    Node<T>* prev = NULL;
                    while (temp!=NULL && temp->getValue()!=item){
                        prev = temp;
                        temp = temp->getNext();
                    }
                    
                    if(temp!= NULL){
                        if(prev==NULL){
                            //ele ta no inicio da lista
                            head = temp->getNext();
                            temp = NULL;
                        } else {
                            prev->setNext(temp->getNext());
                            temp=NULL;
                        }
                        currentSize--;
                    }

                } else {
                    if(head->getValue()==item){
                        removeFromBeginning();
                    }
                }
            } else {
                throw std::underflow_error("Erro de manipulacao");
            }
        }
        void displayDebug(){
            Node<T>* item = head;
            cout<<"===Linked List===="<<endl;
            cout<<"\tCurrentSize = "<<currentSize<<endl;
            while (item!=NULL)
            {
                cout<<item->getValue()<<" ";
                item = item->getNext();
            }
            cout<<"\n===Linked List===="<<endl;
            
        }
        T removeFromBeginning(){
            if(!isEmpty()){
                T valueD = head->getValue();
                head = head->getNext();
                currentSize--;
                return valueD;
            } else {
                throw std::underflow_error("Erro de manipulacao");
            }
        }
        T removeFromEnd(){
            if(!isEmpty()){
                if(getCurrentSize()==1){
                    T value = head->getValue();
                    head = NULL;
                    currentSize--;
                    return value;
                } else {
                    //Tem pelo menos dois elementos
                    Node<T>* temp = head;
                    Node<T>* antTemp = NULL;
                    while(temp->getNext()!=NULL){
                        antTemp = temp;
                        temp = temp->getNext();
                    }
                    if(antTemp==NULL){
                        throw std::underflow_error("Erro de manipulacao");
                    }
                    T value = temp->getValue();
                    antTemp->setNext(NULL);
                    temp=NULL;
                    currentSize--;
                    return value;
                }
            } else{
                throw std::underflow_error("Erro de manipulacao");
            }
        }
        bool isEmpty(){
            return head == NULL;
        }
        int getCurrentSize(){
            return currentSize;
        }
        void clear() {
            while (head != NULL) {
                Node<T>* temp = head;
                head = head->getNext();
                delete temp;
            }
            currentSize = 0;
        }
};

class Soldier{
    public:
        string name; 
        string race; 
        unsigned long long force;
        LinkedList<Soldier> capturedSoldiers;

        Soldier(string newName, string newRace, unsigned long long newForce){
            name = newName;
            race = newRace;
            force = newForce;
            capturedSoldiers = LinkedList<Soldier>();
        }

        Soldier(){
            name="";
            race="";
            force = 0;
            capturedSoldiers = LinkedList<Soldier>();
        }

        void capture(Soldier soldier){
            capturedSoldiers.addNode(soldier);
            force += soldier.force;
        }

        friend std::ostream& operator<<(ostream& os,Soldier soldier) {
        os << "Soldier name: " << soldier.name
           << ", race: " << soldier.race
           << ", force: " << soldier.force
           << ", qtdCaptureds: " << soldier.capturedSoldiers.getCurrentSize()
           << std::endl;
        return os;
    }
};


class Troops{
    private:
        Node<Soldier>* top;
        int currentSize;

    public:
        Troops(){
            top = NULL;
            currentSize = 0;
        }
        void push(Soldier value){
            Node<Soldier>* newValue = new Node<Soldier>(value, top);
            top = newValue;
            currentSize++;
        }
        void pushAll(Troops troops){
            while (!troops.isEmpty())
            {
                push(troops.pop());
            } 
        }
        void pushOrdered(Soldier value){
            Troops temp;
            while (!isEmpty() && top->getValue().force > value.force){
                temp.push(pop());
            }
            push(value);
            while (!temp.isEmpty()) {
                push(temp.pop());
            }
        }
        void pushAllOrdered(Troops troops){
            while (!troops.isEmpty())
            {
                pushOrdered(troops.pop());
            } 
        }
        void displayDebug(){
            Node<Soldier>* item = top;
            cout<<"===Troops===="<<endl;
            cout<<"\tCurrentSize = "<<currentSize<<" Troop Force: "<<getTroopForce()<<endl;
            while (item!=NULL)
            {
                cout<<item->getValue()<<endl;
                item = item->getNext();
            }
            cout<<"===Troops====\n"<<endl;
            
        }
    
        Soldier pop(){
            if(isEmpty()){
                throw std::out_of_range("Erro na manipulacao da pilha");
            }
            Node<Soldier>* nodeD = top;
            Soldier value = nodeD->getValue();
            top= top->getNext();
            delete nodeD;
            currentSize--;
            return value;
        }

        Soldier getTop(){
            if(isEmpty()){
                return Soldier();
            }
            return top->getValue();
        }

        bool isEmpty(){
            return top == NULL;
        }
        int getCurrentSize(){
            return currentSize;
        }
        unsigned long long getTroopForce(){
            Node<Soldier>* item = top;
            unsigned long long troopForce = 0;
            while (item!=NULL)
            {
                troopForce+=item->getValue().force;
                item = item->getNext();
            }
            return troopForce;
        }
};

class HashTable{
    private:
        LinkedList<Soldier> table[43];
        int hashFunction(string key){
            int hash  = 0;
            for(char c: key){
                hash = (31*hash +c)%43;
            }
            return hash;
        }
        string concatenateAndToLower(string c1, string c2){
            string result = c1 + c2;
            string resultM = "";
            for(char c: result){
                resultM += tolower(c);
            }
            return resultM;
        }
    public:
        HashTable(){
            
        }
        void insert(Soldier soldier){
            int i = hashFunction(concatenateAndToLower(soldier.name, soldier.race));
            table[i].addNode(soldier);
        }

        unsigned long long consult(string name, string race){
            int i = hashFunction(concatenateAndToLower(name,race));
            unsigned long long totalForce = 0;
            for(int j=0;j<table[i].getCurrentSize();j++){
                totalForce+=table[i].getByIndex(j).force;
            }
            return totalForce;
        }

        HashTable copy(){
            HashTable hashTable;
            for(int i=0;i<43;i++){
                LinkedList<Soldier> &currentList = table[i];
                for (int j = 0; j < currentList.getCurrentSize(); j++) {
                    Soldier currentSoldier = currentList.getByIndex(j);
                    hashTable.insert(currentSoldier);
                }
            }
            return hashTable;
        }

        void displayDebug(){
            for(int i=0;i<43;i++){
                cout<<"===Hash Table===="<<endl;
                cout<<"i: "<<i<<endl;
                table[i].displayDebug();
                cout<<"\n===Hash Table===="<<endl;
            }
        }
};

bool moveIsValid(int i1,int j1, int i2, int j2){
    bool isValid = false;
    int df_i = i2-i1;
    int df_j = j2-j1;
    // Pegando apenas o modulo dessa diferenca
    if(df_i<0){
        df_i = -df_i;
    }
    if(df_j<0){
        df_j = -df_j;
    }
    
    //Verificando os casos validos
    if(df_i==3 && df_j==0){
        isValid = true;
    } else if (df_i==2 && df_j==1){
        isValid = true;
    } else if(df_i==1 && df_j==2){
        isValid = true;
    } else if (df_i==0 && df_j==3){
        isValid = true;
    } else {
        isValid = false;
    }
    //Verificar se ele ultrapassou os limites do campo de batalha
    bool isValid_i = (i1<10 && i2<10) && (i1>=0 && i2>=0);
    bool isValid_j = (j1<10 && j2<10) && (j1>=0 && j2>=0);

    return isValid && isValid_i && isValid_j;
}

LinkedList<LinkedList<int>> getValidMoves(int i, int j){
    LinkedList<LinkedList<int>> moves = LinkedList<LinkedList<int>>();
    for (int di = -3; di <= 3; ++di) {
        for (int dj = -3; dj <= 3; ++dj) {
            int ni = i+di;
            int nj = j+dj;
            if(moveIsValid(i,j,ni,nj)){
                LinkedList<int> item;
                item.addNode(ni);
                item.addNode(nj);
                moves.addNode(item);
            }
        }
    }
    return moves;
}

void stringToValues(string& str, LinkedList<string>& list) {
    string word;
    for (char ch : str) {
        if (ch == ' ') {
            if (!word.empty()) {
                list.addNode(word);
                word.clear();
            }
        } else {
            word += ch;
        }
    }
    if (!word.empty()) {
        list.addNode(word);
    }
}

string strToLower(string st){
    string resultM = "";
    for(char c: st){
        resultM += tolower(c);
    }
    return resultM;
}

enum situationResult{
    TROOP_FORMATION = 10, ATTACK, DISPLACEMENT, NOTHING
};

situationResult mapMovementSituation(Troops battleMap[10][10], int i1, int j1, int i2, int j2){
    situationResult result = NOTHING;
    if(moveIsValid(i1,j1,i2,j2)){
        if(battleMap[i1][j1].isEmpty()){
            return NOTHING;
        } else {
            if(battleMap[i2][j2].isEmpty()){
                return DISPLACEMENT;
            } else {
                //Aqui os dois pontos estao ocupados
                string race1 = strToLower(battleMap[i1][j1].getTop().race);
                string race2 = strToLower(battleMap[i2][j2].getTop().race);
                if(race1==race2){
                    return TROOP_FORMATION;
                } else {
                    return ATTACK;
                }
            }
        }
    }
    return NOTHING;
}

enum readingState {
    READING_UTA, READING_STO, READING_CMD
};


unsigned long long simulator(HashTable& sanctuary, Troops battleMap[10][10], int i1, int j1, int i2, int j2) {
    unsigned long long value = battleMap[i1][j1].getTroopForce();
    situationResult result = mapMovementSituation(battleMap,i1,j1,i2,j2);
    if(result!=ATTACK){
        return value;
    }

    if( battleMap[i1][j1].getTroopForce() > battleMap[i2][j2].getTroopForce() ){
        
        if(battleMap[i2][j2].getTop().capturedSoldiers.isEmpty()){
            value += battleMap[i2][j2].getTop().force;
        }
    } else if ( battleMap[i1][j1].getTroopForce() <= (2/3.0)*battleMap[i2][j2].getTroopForce() ) {
        string name = battleMap[i1][j1].getTop().name;
        string race = battleMap[i1][j1].getTop().race;
        unsigned long long strengthOfWisdom = sanctuary.consult(name,race);
        if( (battleMap[i1][j1].getTroopForce()+(70.0/100)*strengthOfWisdom) > battleMap[i2][j2].getTroopForce() ){
            if(battleMap[i2][j2].getTop().capturedSoldiers.isEmpty()){
                value += battleMap[i2][j2].getTop().force;
            }
        }
    }
    return value;
}


void attackWhenAttackerStronger(HashTable& sanctuary,Troops battleMap[10][10],int i1, int j1, int i2, int j2){
    if(battleMap[i2][j2].getTop().capturedSoldiers.isEmpty()){
        Soldier captured = battleMap[i2][j2].pop();
        Soldier soldier = battleMap[i1][j1].pop();
        soldier.capture(captured);
        battleMap[i1][j1].pushOrdered(soldier);
    } else {
        Soldier attackedLeader = battleMap[i2][j2].pop();
        Soldier captured = attackedLeader.capturedSoldiers.removeFromBeginning();
        battleMap[i2][j2].pushOrdered(attackedLeader);
        sanctuary.insert(captured);

    }
    
    if(battleMap[i2][j2].isEmpty()){
        battleMap[i2][j2] = battleMap[i1][j1];
        battleMap[i1][j1] = Troops();
        cout<<"unidade "<<battleMap[i2][j2].getTop().name<<"+"<<battleMap[i2][j2].getTop().race<<" avanca para ("<<i2<<", "<<j2<<")"<<endl;
    }
}

void attackIfForceLessThanOrEqualToTwoThirdsOfAttacked(HashTable& sanctuary, Troops battleMap[10][10],int i1, int j1, int i2, int j2){
    string name = battleMap[i1][j1].getTop().name;
    string race = battleMap[i1][j1].getTop().race;
    unsigned long long strengthOfWisdom = sanctuary.consult(name,race);
    if((battleMap[i1][j1].getTroopForce()+(70.0/100)*strengthOfWisdom)>battleMap[i2][j2].getTroopForce()){
        cout<<"Ataque bem sucedido"<<endl;
        attackWhenAttackerStronger(sanctuary,battleMap,i1,j1,i2,j2);
    } else if ((battleMap[i1][j1].getTroopForce()+(70.0/100)*strengthOfWisdom)<battleMap[i2][j2].getTroopForce()){
        cout<<"Contra-ataque!"<<endl; 
        attackWhenAttackerStronger(sanctuary,battleMap,i2,j2,i1,j1);
    }
}

bool raceIsPresent(string race, Troops battleMap[10][10]){
    bool isPresent = false;
    for(int i=0;i<10;i++){
        for(int j=0;j<10;j++){
            if(!battleMap[i][j].isEmpty()){
                if(race.substr(0)==battleMap[i][j].getTop().race.substr(0)){
                    isPresent = true;
                    break;
                }
            }
        }
    }
    return isPresent;
}

int main(){
    LinkedList<string> lines = LinkedList<string>();
    LinkedList<string> cmdLines = LinkedList<string>();
    Troops battleMap[10][10]; // Campo de batalha
    HashTable sanctuary;
    string line = "FLAG";
    readingState state = READING_UTA;
        
    while (true)
    {
        getline(cin, line);
        if(line=="FIM"){
            break;
        }else{
            if(line=="UTA"){
                continue;
            } else if (line=="STO"){
                state = READING_STO;
                continue;
            } else if (line=="CMD"){
                state = READING_CMD;
                continue;
            }

            LinkedList<string> listValues;
            switch (state)
            {
            case READING_UTA:
                {
                    listValues.clear();
                    stringToValues(line,listValues);
                    int bmI = atoi(listValues.getByIndex(2).c_str());
                    int bmJ = atoi(listValues.getByIndex(3).c_str());
                    if(listValues.getCurrentSize()>5){
                        Soldier soldier = Soldier(
                                    listValues.getByIndex(0),               // name
                                    listValues.getByIndex(1),               // race
                                    atoll(listValues.getByIndex(4).c_str())  // force
                                );
                        
                        int index = 5;
                        while(index<listValues.getCurrentSize()){
                            soldier.capture(
                                Soldier(
                                    listValues.getByIndex(index),                   // name
                                    listValues.getByIndex(index+1),                 // race
                                    atoll(listValues.getByIndex(index+2).c_str())    // force
                                )
                            );
                            index+=3;
                        }
                        battleMap[bmI][bmJ].pushOrdered(soldier);
                    } else {
                        battleMap[bmI][bmJ].pushOrdered(
                            Soldier(
                                listValues.getByIndex(0),               // name
                                listValues.getByIndex(1),               // race
                                atoll(listValues.getByIndex(4).c_str())  // force
                                )
                            );
                    }
                    break;
                }
            case READING_STO:
                {
                    listValues.clear();
                    stringToValues(line,listValues);
                    sanctuary.insert(
                        Soldier(
                            listValues.getByIndex(0),               // name
                            listValues.getByIndex(1),               // race
                            atoll(listValues.getByIndex(2).c_str())  // force
                        )
                    );
                    break;
                }
            case READING_CMD:
                {
                    cmdLines.addNode(line);
                    break;
                }
            default:
                break;
            }
        }
    }

    for(int i=0;i<cmdLines.getCurrentSize();i++){
        
        if(cmdLines.getByIndex(i).substr(0,6)=="FORCA "){



            LinkedList<string> stValues = LinkedList<string>();
            stValues.clear();
            string rest = cmdLines.getByIndex(i).substr(6);
            stringToValues(rest,stValues);

            int mbi = atoi(stValues.getByIndex(0).c_str());
            int mbj = atoi(stValues.getByIndex(1).c_str());
            

            if ((mbi >= 0 && mbi < 10) && (mbj >= 0 && mbj < 10)) {
                

                if(battleMap[mbi][mbj].getCurrentSize()==0){
                    cout<<-1<<endl;
                } else {
                    
                    cout<<battleMap[mbi][mbj].getTroopForce()<<endl;
                }

            } else {
                cout<<-1<<endl;
            }




        } else if (cmdLines.getByIndex(i).substr(0,5)=="TERR "){

            LinkedList<string> stValues = LinkedList<string>();
            stValues.clear();
            string rest = cmdLines.getByIndex(i).substr(5);
            stringToValues(rest,stValues);

            int mbi = atoi(stValues.getByIndex(0).c_str());
            int mbj = atoi(stValues.getByIndex(1).c_str());
            
            if (mbi >= 0 && mbi < 10 && mbj >= 0 && mbj < 10) {

                if(battleMap[mbi][mbj].getCurrentSize()==0){
                    cout<<"[ ]"<<endl;
                } else {
                    Soldier soldierTop = battleMap[mbi][mbj].getTop();
                    if(battleMap[mbi][mbj].getCurrentSize()==1){
                        cout<<"["<<soldierTop.name<<" "<<soldierTop.race<<" "<<soldierTop.force<<"]"<<endl;
                    } else {
                        cout<<"[["<<soldierTop.name<<" "<<soldierTop.race<<" "<<battleMap[mbi][mbj].getTroopForce()<<"]]"<<endl;
                    }
                }
            } else {
                cout<<"[ ]"<<endl;
            }

        } else if (cmdLines.getByIndex(i).substr(0,11)=="FORCA_RACA "){
            string Nrace = cmdLines.getByIndex(i).substr(11);
            unsigned long long sum = 0;
            for(int fi=0;fi<10;fi++){
                for(int fj=0;fj<10;fj++){
                    string race = strToLower(Nrace);
                    string troopRace = strToLower(battleMap[fi][fj].getTop().race);
                    if(race==troopRace){
                        sum+=battleMap[fi][fj].getTroopForce();
                    }
                }
            }
            cout<<sum<<endl;
        } else if (cmdLines.getByIndex(i).substr(0,5)=="MOVA "){

            
            LinkedList<string> stValues = LinkedList<string>();
            stValues.clear();
            string rest = cmdLines.getByIndex(i).substr(5);
            stringToValues(rest,stValues);


            int i1=atoi(stValues.getByIndex(0).c_str());
            int j1=atoi(stValues.getByIndex(1).c_str());
            int i2=atoi(stValues.getByIndex(2).c_str());
            int j2=atoi(stValues.getByIndex(3).c_str());

            situationResult result = mapMovementSituation(battleMap, i1, j1, i2, j2);
            switch (result)
            {
            case TROOP_FORMATION:
                {
                   
                    battleMap[i2][j2].pushAllOrdered(battleMap[i1][j1]);
                    battleMap[i1][j1]=Troops();
                }
                break;

            case ATTACK:
                {
                    bool umashiPresent = raceIsPresent("UMASHI",battleMap);
                    bool iantecoPresent = raceIsPresent("IANTECO",battleMap);
                    bool azuriPresent = raceIsPresent("AZURI",battleMap);
                    int cont = 0;
                    if(umashiPresent){
                        cont++;
                    }
                    if(iantecoPresent){
                        cont++;
                    }
                    if(azuriPresent){
                        cont++;
                    }


                    if(battleMap[i1][j1].getTroopForce() > battleMap[i2][j2].getTroopForce()){
                        string race = battleMap[i2][j2].getTop().race;
                        cout<<"Ataque bem sucedido"<<endl; // URGENTE ADICIONEI ESSE CODIGO AQUI
                        attackWhenAttackerStronger(sanctuary,battleMap,i1,j1,i2,j2);
                        if(!raceIsPresent(race,battleMap)){
                            cout<<race<<" foi eliminada"<<endl;
                        }
                    } else if(battleMap[i1][j1].getTroopForce() <= (2/3.0)*(battleMap[i2][j2].getTroopForce())){
                        string race1 = battleMap[i1][j1].getTop().race;
                        string race2 = battleMap[i2][j2].getTop().race;
                        attackIfForceLessThanOrEqualToTwoThirdsOfAttacked(sanctuary,battleMap,i1,j1,i2,j2);
                        if(!raceIsPresent(race1,battleMap)){
                            cout<<race1<<" foi eliminada"<<endl;
                        }
                        if(!raceIsPresent(race2,battleMap)){
                            cout<<race2<<" foi eliminada"<<endl;
                        }
                    } else if(battleMap[i1][j1].getTroopForce() == battleMap[i2][j2].getTroopForce()){
                        //FAZ NADA
                    } else {
                        cout<<"Contra-ataque!"<<endl;
                        string race1 = battleMap[i1][j1].getTop().race;
                        //cout<<"EXTRA:Veio da primeira vez que eles compararam forca"<<endl;
                        //cout<<"EXTRA: CONTRA ATAQUE"<<endl;
                        attackWhenAttackerStronger(sanctuary,battleMap,i2,j2,i1,j1);
                        if(!raceIsPresent(race1,battleMap)){
                            cout<<race1<<" foi eliminada"<<endl;
                        }
                    }

                    bool recentumashiPresent = raceIsPresent("UMASHI",battleMap);
                    bool recentIantecoPresent = raceIsPresent("IANTECO",battleMap);
                    bool recentAzuriPresent = raceIsPresent("AZURI",battleMap);
                    int recentCont = 0;
                    if(recentumashiPresent){
                        recentCont++;
                    }
                    if(recentIantecoPresent){
                        recentCont++;
                    }
                    if(recentAzuriPresent){
                        recentCont++;
                    }
                    if(cont>=2 && recentCont==1){
                        if(recentumashiPresent){
                            cout<<"UMASHI tem supremacia sobre Tau!"<<endl;
                        } else if(recentIantecoPresent){
                            cout<<"IANTECO tem supremacia sobre Tau!"<<endl;
                        } else {
                            cout<<"AZURI tem supremacia sobre Tau!"<<endl;
                        }
                    }
                }
                break;

            case DISPLACEMENT:
                {
                    battleMap[i2][j2].pushAllOrdered(battleMap[i1][j1]);
                    battleMap[i1][j1]=Troops();
                }
                break;

            case NOTHING:
                break;

            default:
                break;
            }
        } else if (cmdLines.getByIndex(i).substr(0,11)=="MAX_ATAQUE "){

            LinkedList<string> stValues = LinkedList<string>();
            stValues.clear();
            string rest = cmdLines.getByIndex(i).substr(11);
            stringToValues(rest,stValues);
            
            //SIMULA O MELHOR ATAQUE e IMPRIME A FORCA DA UNIDADE TATICA (i,j) DEPOIS DESSE ATAQUE SIMULADO
            bool existReachableEnemyTacticalUnits = false; // Variavel que verifica se existe inimigos perto
            int li=atoi(stValues.getByIndex(0).c_str());
            int lj=atoi(stValues.getByIndex(1).c_str());

            if (li >= 0 && li < 10 && lj >= 0 && lj < 10) {

            
                if(battleMap[li][lj].isEmpty()){
                    //CASO EM QUE EM I,J nao tem unidade tatica
                    cout<<-1<<endl;
                } else {
                    LinkedList<LinkedList<int>> moves = getValidMoves(li,lj);
                    LinkedList<int> enemyIndices;
                    if(!moves.isEmpty()){
                        for(int ni=0;ni<moves.getCurrentSize();ni++){
                            if(!moves.getByIndex(ni).isEmpty()){
                                int enemyI = moves.getByIndex(ni).getByIndex(0);
                                int enemyJ = moves.getByIndex(ni).getByIndex(1);
                                if(!battleMap[enemyI][enemyJ].isEmpty() && battleMap[enemyI][enemyJ].getTop().race != battleMap[li][lj].getTop().race){ // URGENTE RETIREI ISSO AQUI : DA CONDICAO  && battleMap[enemyI][enemyJ].getTop().race != battleMap[li][lj].getTop().race
                                    enemyIndices.addNode(ni);
                                    existReachableEnemyTacticalUnits = true;
                                }
                            }
                        }
                    }
                    if(!existReachableEnemyTacticalUnits){
                        cout<<-1<<endl;
                    } else {
                        LinkedList<unsigned long long> forces;
                        for(int ni=0;ni<enemyIndices.getCurrentSize();ni++){
                            int enemyI = moves.getByIndex(enemyIndices.getByIndex(ni)).getByIndex(0);
                            int enemyJ = moves.getByIndex(enemyIndices.getByIndex(ni)).getByIndex(1);
                            forces.addNode(simulator(sanctuary,battleMap,li,lj,enemyI,enemyJ));
                        }
                            
                        if(!forces.isEmpty()){
                            unsigned long long maxForce = forces.getByIndex(0);
                            for(int ii=1;ii<forces.getCurrentSize();ii++){
                                if(forces.getByIndex(ii)>maxForce){
                                    maxForce = forces.getByIndex(ii);
                                    }
                            }
                            cout<<maxForce<<endl;
                        }
                    }
                }

            } else {
                cout<<-1<<endl;
            }

        }  
    }
    
    return 0;
}
