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
    type_l = ['pszeniczne', 'jasny lager', 'ciemny lager', 'marcowe', 'mocny lager', 'koźlak', 'pilzner',
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


def name():
    name_l = ['Export', 'Chmielowe', 'Miodowe', 'Summer', 'Tropical', 'Porter', 'Ale', 'Exclusive', 'Strong', 'Mocne',
              'Karmelowe', 'IPA', 'APA']
    return random.choice(name_l)


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
    for i in range(10):
        tmp_list = []
        tmp_list.append(additionals())
        tmp_list.append(malt())
        tmp_list.append(water())
        ingredients_list.append(tmp_list)

    for i in range(10):
        tmp_list_2 = []
        tmp_list_2.append(name())
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

    sql_insert_ingredients = "INSERT INTO sklad (woda, slod, dodatki) VALUES (%s, %s, %s)"
    for i in ingredients_list:
        ingredients = ",".join(i[0])
        values = (i[2], i[1], ingredients)
        mycursor.execute(sql_insert_ingredients, values)
        mydb.commit()

    sql_insert_beer = "INSERT INTO piwa (nazwa_piwa, marka, gatunek, voltaz, IBU, opakowanie, rodzaj_fermentacji," \
                      "piana, nasycenie_co2, kraj) " \
                      "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
    for i in beer_list:
        values_2 = (i[0], i[1], i[2], i[3], i[6], i[4], i[5], i[7], i[8], i[9])
        mycursor.execute(sql_insert_beer, values_2)
        mydb.commit()

    # sql_find_duplicate = "SELECT nazwa_piwa, marka FROM piwa " \
    #                      "GROUP BY nazwa_piwa, marka HAVING COUNT(nazwa_piwa) > 1 AND COUNT(marka)"
    # mycursor.execute(sql_find_duplicate)
    # result = mycursor.fetchall()
    #
    # sql_find_id = "SELECT ID_piwa FROM piwa WHERE nazwa_piwa = '%s' AND marka = '%s'" % (result[0][0], result[0][1])
    # mycursor.execute(sql_find_id)
    # result2 = mycursor.fetchall()
    #
    # for i in result2:
    #     sql_set_ingredients = "INSERT INTO piwa (id_skladu) WHERE ID_pwia = '%i' VALUES (%i)" % (i[0], random.randint(1, 10))
    #     mycursor.execute(sql_set_ingredients)
    #     result3 = mycursor.fetchall()
    #     print(result3)

