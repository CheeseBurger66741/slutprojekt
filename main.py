from menu import show_menu
from menu import create_user  

def main():

    while True: # gör en evighetsloop
        show_menu() #Kör din meny från annan fil
        choice = input("\nChoose an operation (0-2): ") #Ta en input från terminalen dvs. vilket program du väljer
        
        if choice == "0": #Gör att 0 avslutar programmet.
            print("baibaiii!!")
            break
     
        

        try: #Gör om denna så du kan välja dina program istället för kalkylatorn
            if choice == "1":
                result = create_user() 
            elif choice == "2":
                result = ()
            
        except ValueError as e:
            print(f"Error: {e}")
  

main()