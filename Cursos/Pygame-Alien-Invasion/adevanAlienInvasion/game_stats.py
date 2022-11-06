class GameStats():
    '''Armazena dados estatísticos da Invasão Alienígena.'''

    def __init__(self,ai_settings):
        '''Inicializa os dados estatísticos.'''
        self.ai_settings=ai_settings
        self.reset_stats()

        #Inicia o jogo em um estado inativo
        self.game_active=False

        # A pontuação máxima jamais pode ser reiniciada
        self.high_score=0


    def reset_stats(self):
        '''Inicializa os dados estatísticos que podem mudar durante o jogo.'''
        self.obj_left=self.ai_settings.person_limit
        self.score=0
        self.level=1
        