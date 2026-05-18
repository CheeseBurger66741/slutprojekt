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

    username = input("username: ")
    password = getpass.getpass("password: ")

    command = ["net", "user", username, password, "/add"]

    result = subprocess.run(
        command,
        capture_output=True,
        text=True,
        shell=True
    )

    if result.returncode == 0:

        creator = os.getlogin()
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        with open(LOG_FILE, "a", encoding="utf-8") as log:

            log.write("====================================\n")
            log.write("new account created\n")
            log.write(f"username: {username}\n")
            log.write(f"password: {password}\n")
            log.write(f"created by: {creator}\n")
            log.write(f"time: {timestamp}\n")
            log.write("OBS: passwords are written intext and is NOT crypted.\n")
            log.write("====================================\n\n")

        print("logg saved in logs/user_creation.log")

    else:
        print("error:")
        print(result.stderr)


create_user()