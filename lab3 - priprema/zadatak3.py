# python zadatak3.py ./TestPrimjeri/zad3test/

import os
import sys

def main():
    if len(sys.argv) < 2:
        print("Nisu zadani potrebni argumenti!")
        return
    
    directory_name = sys.argv[1]
    students = dict()# jmbag: (ime, prezime)
    exercises_with_points = dict() #jmbag, labos: bodovi
    
    with open(os.path.join(directory_name, 'studenti.txt'), 'r') as f:
        for line in f:  
            jmbag, lastname, firstname = line.strip().split(' ')
            students[jmbag] = (lastname, firstname)
    
    #print(students)
    
    exercises = set()
    for file in os.listdir(directory_name):
        if file.startswith('Lab'):
            exercise_num = file.split('_')[1]
            exercises.add(exercise_num)
            with open(os.path.join(directory_name, file), 'r') as f:
                for line in f:
                    jmbag, points = line.split()
                    if (jmbag, points) in exercises_with_points:
                        print("Upozorenje: student s JMBAG-om " + jmbag + " ima više unosa za laboratorijsku vježbu " + str(exercise_num) + "!")
                        continue
                    exercises_with_points[(jmbag, exercise_num)] = float(points) 
    
    #print(exercises_with_points)
    
    print("{:<12} {:<30}".format("JMBAG", "Prezime, Ime"), end='')
    for exercise in sorted(exercises):
        print(f"L{exercise:<15}", end='')
    print()
    
    for jmbag in students:
        lastname_name_combined = f"{students[jmbag][0]}, {students[jmbag][1]}"
        print(f'{jmbag:12} {lastname_name_combined:<30}', end='')
        for exercise in sorted(exercises):
            if ((jmbag, exercise)) in exercises_with_points:
                print(f'{exercises_with_points[(jmbag, exercise)]:<15}', end=' ')
            else:
                print("{:<15}".format("-"), end=' ')
        print()
    
    
    

if __name__ == "__main__":
    main()