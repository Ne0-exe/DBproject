import random

def water(): # randomly generates kind of water
    water_l = ['miekka', 'twarda']
    print(random.choice(water_l))

def malt(): # randomly generates 1 type of malt
    malt_l = ['jeczmienny', 'pszeniczny', 'zytni', 'palony', 'wedzony', 'karmelowy']
    print(random.choice(malt_l))

def additionals(): # randomly generates from 0 to 3 different additionals
    add_l = ['miod wielokwiatowy', 'kwiat lotosu', 'aloes', 'wanilia', 'brzoskwinia', 'ananas', 'kokos', 'chili',
             'gruszka', 'cytryna', 'kawa', 'malina', 'trawa cytrynowa', 'rum', 'limonka', 'grejpfrut', 'winogrono',
             'jasmin', 'borowka amerykanska', 'poziomka', 'jagoda', 'ciastko', 'smoczy owoc', 'persymona',
             'czekolada', 'karmel', 'truskawka']
    n = random.randint(0, 3)
    print(random.sample(add_l, n))

additionals()