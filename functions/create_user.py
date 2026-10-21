import subprocess
import getpass
from datetime import datetime
import os
 

# Skapa logs-mapp
LOG_FOLDER = "logs"
os.makedirs(LOG_FOLDER, exist_ok=True)

# Loggfil
LOG_FILE = os.path.join(LOG_FOLDER, "user_creation.log")


def create_user():
    # Fråga efter användarnamn
    username = input("username: ")

    # Fråga efter lösenord (visas inte på skärmen)
    password = getpass.getpass("password: ")

    try:
        # Skapa Windows-användare
        command = ["net", "user", username, password, "/add"]

        result = subprocess.run(
            command,
            text=True,
            shell=True
        )

        if result.returncode == 0:
            print(f"user '{username}' created.")

            # Hämta information för loggning
            creator = os.getlogin()
            now = datetime.now()

            # Skapa loggrad
            log_text = (
                f"============================\n"
                f"new account created\n"
                f"username: {username}\n"
                f"password: {password}\n"
                f"created by: {creator}\n"
                f"time: {now.strftime('%Y-%m-%d %H:%M:%S')}\n"
            )

            # Spara i loggfil
            with open(LOG_FILE, "a", encoding="utf-8") as file:
                file.write(log_text)

            print("===================================.")
            print(" ")
            print("User created.")
            print("Information saved in logg.")
            print("OBS: passwords are not encrypted.")
            print(" ")
            print("===================================.")

        else:
            print("Fel vid skapande av användare:")
            print(result.stderr)

    except Exception as e:
        print(f"Ett fel uppstod: {e}")

# Kör endast om filen startas DIREKT
if __name__ == "__main__":

# Kör funktionen
    create_user()

