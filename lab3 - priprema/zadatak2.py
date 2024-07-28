#python zadatak2.py ./TestPrimjeri/hipoteze2.txt

import sys

def main():
    if len(sys.argv) < 2:
        print("Nisu zadani potrebni argumenti!")
        return
    
    file_name = sys.argv[1]
    
    all_lines_as_floats = []
    with open(file_name, 'r', encoding='utf8') as dat:
        for line in dat:
            line_splited = line.split()
            line_splited_to_float = [float(s) for s in line_splited]
            line_splited_to_float.sort()
            all_lines_as_floats.append(line_splited_to_float)
            #print(line_splited_to_float)
    
    print("Hyp#Q10#Q20#Q30#Q40#Q50#Q60#Q70#Q80#Q90")
    for i, row in enumerate(all_lines_as_floats, start=1):
        quantils = []
        for quantil in range(1,10):
            quantils.append(row[int(len(row)*quantil/10)-1])  
        quantils = [str(s) for s in quantils]
        print(f"{i:03d}#{'#'.join(quantils)}")


if __name__ == "__main__":
    main()