from menu import show_menu


def main():

    while True: # gör en evighetsloop
        show_menu() #Kör din meny från annan fil
        choice = input("\nChoose an operation (0-4): ") #Ta en input från terminalen dvs. vilket program du väljer
        
        if choice == "0": #Gör att 0 avslutar programmet.
            print("baibaiii!!")
            break
        
        

        try: #Gör om denna så du kan välja dina program istället för kalkylatorn
            if choice == "1":
                result = () 
            elif choice == "2":
                result = ()
            elif choice == "3":
                result = ()
            elif choice == "4":
                result = ()    
            
        except ValueError as e:
            print(f"Error: {e}")
  

main()