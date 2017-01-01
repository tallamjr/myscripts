#!/Users/tarek_allam/anaconda/bin/python

import os
import sys

name  = "Tarek"
def menu():

    while True:
        print("""1 - Spin & Go\n2 - Cash Game\n3 - Sit & Go\n4 - Tournament\nQ - Quit\n""")

        choice = raw_input(">>> ").lower().rstrip()
        if choice=="q":
            break
        elif choice=="1":
            spin()
        elif choice=="2":
            cash()
        elif choice=="3":
            sit()
        elif choice=="4":
            tournament()
        else:
            print("Invalid choice, please choose again\n")

    print("Good luck!",name)

def spin():
    pass

def cash():
    pass

def sit():
    pass

def tournament():
    pass

if __name__ == '__main__':
    menu()


