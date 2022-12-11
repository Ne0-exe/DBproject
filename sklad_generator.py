import random
import mysql.connector

def water(): # randomly generates kind of water
    water_l = ['miekka', 'twarda']
    return random.choice(water_l)

def malt(): # randomly generates 1 type of malt
    malt_l = ['jeczmienny', 'pszeniczny', 'zytni', 'palony', 'wedzony', 'karmelowy']
    return random.choice(malt_l)

def additionals(): # randomly generates from 0 to 3 different additionals
    add_l = ['miod wielokwiatowy', 'kwiat lotosu', 'aloes', 'wanilia', 'brzoskwinia', 'ananas', 'kokos', 'chili',
             'gruszka', 'cytryna', 'kawa', 'malina', 'trawa cytrynowa', 'rum', 'limonka', 'grejpfrut', 'winogrono',
             'jasmin', 'borowka amerykanska', 'poziomka', 'jagoda', 'ciastko', 'smoczy owoc', 'persymona',
             'czekolada', 'karmel', 'truskawka']
    n = random.randint(0, 3)
    return random.sample(add_l, n)

def brand():
    brand_l = ['Budweiser', 'Bud Light', 'Heineken', 'Stella Artois', 'Skol', 'Corona', 'Guinness', 'Coors Light',
            'Brahma', 'Żywiec', 'Okocim', 'Lech', 'Tyskie', 'Namysłów', 'Perła', 'Żubr', 'Harnaś', 'Desperados']

    val = random.sample(brand_l, 1)
    return val[0]


def type():
    type_l = ['pszeniczne', 'jasny lagier', 'ciemny lagier', 'marcowe', 'mocny lagier', 'koźlak', 'pilzner',
              'porter bałtycki', 'stout', 'pale ale', 'india pale ale']
    return random.choice(type_l)


def voltage():
    volt_l = [0, 2, 3, 3.5, 4, 4.5, 5, 5.5, 6, 7, 7.5, 8, 8.5, 9, 10, 11, 12]
    return random.choice(volt_l)


def package():
    package_l = ['szklana butelka', 'puszka', 'beczka', 'plastikowa butelka']
    return random.choice(package_l)


def type_of_fermentation():
    type_l = ['dolna', 'górna']
    return random.choice(type_l)


def IBU():
    val = random.randint(8, 121)
    return val


def foam():
    foam_l = ['gęsta i biała', 'wodnista i biała', 'gęsta i kremowa', 'wodnista i kremowa']
    return random.choice(foam_l)


def CO2():
    co2_l = ['mocno gazowane', 'średnio gazowane', 'lekko gazowane']
    return random.choice(co2_l)


def country():
    country_l = ['Chiny', 'USA', 'Brazylia', 'Niemcy', 'Meksyk', 'Wielka Brytania', 'Polska', 'Hiszpania', 'Japonia',
                 'Nigeria', 'Republika Południowej Afryki', 'Czechy']
    return random.choice(country_l)


if __name__ == '__main__':
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        # Wprowadzcie haslo do swojej bazy danych
        password="",
        database="wyroby_slodowe_projekt"
    )
    mycursor = mydb.cursor()

    ingredients_list = []
    beer_list = []
    for i in range(1):
        tmp_list = []
        tmp_list.append(additionals())
        tmp_list.append(malt())
        tmp_list.append(water())
        ingredients_list.append(tmp_list)

        tmp_list_2 = []
        tmp_list_2.append(brand())
        tmp_list_2.append(type())
        tmp_list_2.append(voltage())
        tmp_list_2.append(package())
        tmp_list_2.append(type_of_fermentation())
        tmp_list_2.append(IBU())
        tmp_list_2.append(foam())
        tmp_list_2.append(CO2())
        tmp_list_2.append(country())
        beer_list.append(tmp_list_2)




    for i in ingredients_list:
        print('Sklad: ', i[0])
        print('Slod: ', i[1])
        print('Woda: ', i[2])

    for i in beer_list:
        print('Marka: ', i[0])
        print('Rodzaj: ', i[1])
        print('Voltage: ', i[2])
        print('Opakowanie: ', i[3])
        print('Rodzaj fermentacji: ', i[4])
        print('IBU: ', i[5])
        print('Piana: ', i[6])
        print('CO2: ', i[7])
        print('Kraj: ', i[8])
