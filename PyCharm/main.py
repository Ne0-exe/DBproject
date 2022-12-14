import os
import mysql.connector


class Guest:
    role = 'guest'

    def __init__(self, new_name: str = 'Guest', new_role: str = 'guest', new_counter: int = 0) -> None:
        self.name = new_name
        self.role = new_role
        self.counter = new_counter
        print('Utworzono obiekt ' + self.name)

    def __del__(self):
        print('Obiekt został usunięty')

    def reset_values(self, new_name: str = 'Guest', new_role: str = 'guest', new_counter: int = 0) -> None:
        self.name = new_name
        self.role = new_role
        self.counter = new_counter
        print('Wyzerowano wartości. Zalogowany jako: ' + self.name)

    def show_menu(self):
        print('1. Wyszukaj produkt')
        print('2. Zaloguj')
        print('3. Załóż konto')
        print('4. Exit')

    def who_am_i(self) -> None:
        print('Zalogowano jako: ' + self.name)

    def what_is_my_role(self) -> None:
        print('Moja rola to: ' + self.role)


class Unverified(Guest):

    def __del__(self):
        print('Obiekt został usunięty')

    def show_menu(self):
        print('1. Wyszukaj produkt')
        print('2. Zarzadzaj kontem')
        print('3. Wyloguj')
        print('4. Exit')

    def reset_parameters(self):
        self.name = ''
        self.role = ''
        self.counter = 0


class Verified(Unverified):
    def __del__(self):
        print('Obiekt został usunięty')

    def show_menu(self):
        print('1. Wyszukaj produkt')
        print('2. Zarzadzaj kontem')
        print('3. Wyloguj')
        print('4. Exit')


class Admin(Verified):
    def __del__(self):
        print('Obiekt został usunięty')

    def show_menu(self):
        print('1. Zarzadzaj bazą danych')
        print('2. Zarządzaj kontem')
        print('3. Przeglądaj kolejkę')
        print('4. Przeglądaj proponowane produkty')
        print('5. Wyloguj')
        print('6. Exit')


def clear_view():
    os.system('cls')


def create_object(nick, role, counter):
    if role == 'unverified':
        tmp_user = Unverified(nick, role, counter)
    elif role == 'verified':
        tmp_user = Verified(nick, role, counter)
    elif role == 'admin':
        tmp_user = Admin(nick, role, counter)
    return tmp_user


def register():
    print("Rejestracja")
    new_email = input("Email: ")
    new_password = input("Haslo: ")
    new_name = input("Nazwa w systemie: ")
    new_age = input("Wiek: ")

    sql_command = "SELECT email, nazwa_uzytkownika, haslo, ranga, licznik " \
                  "FROM uzytkownicy " \
                  "WHERE email ='%s' OR nazwa_uzytkownika ='%s'" % (new_email, new_name)
    mycursor.execute(sql_command)
    myresult = mycursor.fetchall()

    if myresult:
        # Jeżeli taki email juz znajduje się w bazie
        if myresult[0][0] == new_email:
            print("Uzytkownik o podanym email już istnieje!")
        else:
            print("Użytkownik o podanym loginie już istnieje!")
        print('1. Spróbuj ponownie')
        print('2. Powrót do menu')
        choice = input(":")
        if choice == '1':
            register()
        elif choice == '2':
            main_menu(guest)
    else:
        # Jeżeli taki email nie znajduje się w bazie
        sql_command = "INSERT INTO uzytkownicy (email, haslo, nazwa_uzytkownika, wiek) VALUES (%s, %s, %s, %s)"
        values_to_insert = (new_email, new_password, new_name, new_age)
        mycursor.execute(sql_command, values_to_insert)
        mydb.commit()
        main_menu(guest)


def del_acc(current_user):
    sql_command = "DELETE FROM  uzytkownicy WHERE nazwa_uzytkownika ='%s'" % current_user.name
    mycursor.execute(sql_command)
    mydb.commit()
    main_menu(guest)


def log_in():
    input_email = input("Email: ")
    password = input("Hasło: ")

    sql_command = "SELECT email, haslo, nazwa_uzytkownika, ranga, licznik " \
                  "FROM uzytkownicy " \
                  "WHERE email ='%s'" % input_email
    mycursor.execute(sql_command)
    myresult = mycursor.fetchall()

    if myresult and input_email == myresult[0][0] and password == myresult[0][1]:
        current_user = create_object(myresult[0][2], myresult[0][3], myresult[0][4])
        print('Zalogowano pomyślnie!')
        main_menu(current_user)
    else:
        print('Błędny email lub hasło!')
        print('1. Spróbuj ponownie')
        print('2. Powrót do menu')
        choice = input(":")
        if choice == '1':
            log_in()
        elif choice == '2':
            main_menu(guest)


def log_out(current_user):
    current_user.reset_values()
    del current_user
    main_menu(guest)


def acc_management_menu(current_user):
    print('1. Usuń konto')
    print("2. Powrót do menu głównego")

    choice = input(":")

    if choice == '1':
        print("Czy na pewno chcesz to zrobić? Tej operacji nie można odwrócić!")
        print("1. TAK")
        print("2. NIE")
        choice = input(":")
        if choice == '1':
            # Delete acc
            del_acc(current_user)
        elif choice == '2':
            # Back to menu
            acc_management_menu(current_user)
    elif choice == '2':
        main_menu(current_user)


def check_existing_users(current_user):
    sql_command = "SELECT nazwa_w_systemie FROM uzytkownicy"
    mycursor.execute(sql_command)
    myresult = mycursor.fetchall()

    print('Istniejący użytkownicy w systemie:')

    tmp_counter = 0

    for nick in myresult:
        print(str(nick))
        tmp_counter += 1
        if tmp_counter == 10:
            tmp_counter = 0
            print('---------------------')
            print('1. Wyświetl kolejnych 10')
            print('2. Powrót')
            choice = input(":")
            if choice == '1':
                pass
            elif choice == '2':
                main_menu(current_user)
    main_menu(current_user)


def show_product(sql_command, current_id):
    mycursor.execute(sql_command)
    myresult = mycursor.fetchall()

    size = 42
    for i in range(current_id, current_id+3):
        if i < len(myresult):
            print('\n+', '-' * size, '+')
            str = '%s. %s %s |' % (myresult[i][0], myresult[i][2], myresult[i][1])
            str = str.upper()
            print("| %44s" % str)
            print('+', '-' * size, '+')
            print("| %20s: %20s |" % ("Marka", myresult[i][2]))
            print("| %20s: %20s |" % ("Nazwa", myresult[i][1]))
            print("| %20s: %20s |" % ("Gatunek", myresult[i][3]))
            print("| %20s: %20s |" % ("Średnia ocen", myresult[i][6]))
            print("| %20s: %20s |" % ("Wyprodukowano w", myresult[i][11]))
            print("| %20s: %20s |" % ("Voltaż", myresult[i][4]))
            print("| %20s: %20s |" % ("IBU", myresult[i][5]))
            print("| %20s: %20s |" % ("Opakowanie", myresult[i][7]))
            print("| %20s: %20s |" % ("Rodzaj fermentacji", myresult[i][8]))
            print("| %20s: %20s |" % ("Piana", myresult[i][9]))
            print("| %20s: %20s |" % ("Nasycenie CO2", myresult[i][10]))
            print('+', '-' * size, '+')
        if i + 1 == len(myresult):
            return False
    return True


def search_by_parameter(current_user, parameter, parameter_value, current_id=0):
    sql_command = "SELECT * FROM piwa WHERE %s='%s'" % (parameter, parameter_value)


    while(show_product(sql_command, current_id)):
        current_id += 3
        if current_id > 3:
            print('1. Wyświetl kolejne')
            print('2. Wyświetl poprzednie')
            print('3. Wyszukaj ponownie')
            print('4. Menu główne')
            choice = input(':')
            if choice == '1':
                search_by_parameter(current_user, parameter, parameter_value, current_id)
            elif choice == '2':
                current_id -= 3
                search_by_parameter(current_user, parameter, parameter_value, current_id)
            elif choice == '3':
                search_product_menu(current_user)
            elif choice == '4':
                main_menu(current_user)
        else:
            print('1. Wyświetl kolejne')
            print('2. Wyszukaj ponownie')
            print('3. Menu główne')
            choice = input(':')
            if choice == '1':
                search_by_parameter(current_user, parameter, parameter_value, current_id)
            elif choice == '2':
                search_product_menu(current_user)
            elif choice == '3':
                main_menu(current_user)

    if current_id == 0:
        print('1. Wyszukaj ponownie')
        print('2. Menu główne')
        choice = input(':')
        if choice == '1':
            search_product_menu(current_user)
        elif choice == '2':
            main_menu(current_user)
    else:
        print('1. Wyświetl poprzednie')
        print('2. Wyszukaj ponownie')
        print('3. Menu główne')
        choice = input(':')
        if choice == '1':
            current_id -= 3
            search_by_parameter(current_user, parameter, parameter_value, current_id)
        elif choice == '2':
            search_product_menu(current_user)
        elif choice == '3':
            main_menu(current_user)

    print('Zakonczono wyszukiwanie')
    search_product_menu(current_user)


def search_product_menu(current_user):
    print('Wyszukaj produkt: ')
    print('1. Nazwa')
    print('2. Marka')
    print('3. Gatunek')
    print('4. Voltaż')
    print('5. Skład')
    print('6. Menu główne')

    choice = input(':')

    if choice == '1':
        choice_value = input('Nazwa szukanego produktu: ')
        search_by_parameter(current_user, "nazwa_piwa", choice_value)
        # Search by product name
    elif choice == '2':
        choice_value = input('Marka szukanego produktu: ')
        search_by_parameter(current_user, "marka", choice_value)
    elif choice == '3':
        choice_value = input('Gatunek szukanego produktu: ')
        search_by_parameter(current_user, "gatunek", choice_value)
    elif choice == '4':
        choice_value = input('Voltaż szukanego produktu: ')
        search_by_parameter(current_user, "voltaz", choice_value)
    elif choice == '5':
        pass
    elif choice == '6':
        main_menu(current_user)


def main_menu(current_user):
    clear_view()
    print('MENU \n')

    current_user.show_menu()

    choice = input(":")

    if current_user.role == 'guest':
        if choice == '1':
            pass
            search_product_menu(current_user)
            # Search product
        elif choice == '2':
            # Log in
            log_in()
        elif choice == '3':
            # Register
            register()
        elif choice == '4':
            # End program
            exit()
    elif current_user.role == 'unverified' or current_user.role == 'verified':
        if choice == '1':
            # Search product
            pass
            search_product_menu(current_user)
        elif choice == '2':
            # Account manage
            acc_management_menu(current_user)
        elif choice == '3':
            # Log out
            log_out(current_user)
        elif choice == '4':
            # End program
            exit()
    elif current_user.role == 'admin':
        if choice == '1':
            # Data base management
            check_existing_users(current_user)
        elif choice == '2':
            # Account management
            acc_management_menu(current_user)
        elif choice == '3':
            # Opinion queue
            pass
        elif choice == '4':
            # New product queue
            pass
        elif choice == '5':
            # Log out
            log_out(current_user)
        elif choice == '6':
            # End program
            exit()


if __name__ == '__main__':
    mydb = mysql.connector.connect(
        host="projektdb.chit4dyq2s1j.us-east-1.rds.amazonaws.com",
        user="root",
        password="ciscocisco123",
        database="projektDB"
    )
    mycursor = mydb.cursor()
    guest = Guest()
    main_menu(guest)
