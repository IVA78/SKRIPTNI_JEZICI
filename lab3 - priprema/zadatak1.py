#python zadatak1.py ./TestPrimjeri/matrice4.txt rezultat.txt

import sys

def load_matrix(matrix_file_name):
    print(matrix_file_name)
    dat = open(matrix_file_name, 'r', encoding='utf8')
    
    dimA = dat.readline().split() #dimenzije, [0] - retci, [1] - stupci
    matrixA = dict()
    
    dimB = [] #dimenzije, [0] - retci, [1] - stupci
    matrixB = dict()
    
    a_read = False;
    cnt = 0;
    for line in dat.readlines():
        if line.strip() == '':
            a_read = True;
            continue
        if not a_read:
            line_splited = line.split()
            #print("line_splited: ", line_splited)
            matrixA[(int(line_splited[0]), int(line_splited[1]))] = float(line_splited[2])
        else:
            if cnt == 0:
                dimB = line.split()
                #print("dimB: ", dimB)
                cnt += 1
            else:
                line_splited = line.split()
                #print("line_splited: ", line_splited)
                matrixB[(int(line_splited[0]), int(line_splited[1]))] = float(line_splited[2])
            
    return matrixA, dimA, matrixB, dimB
    
def print_matrix(matrix, dim):
    #print(matrix)
    #print(dim)
    for i in range(int(dim[0])):
        for j in range(int(dim[1])):
            print(matrix.get((i, j), 0.0), end=' ')
        print()

def matrix_multiply(matrixA, dimA, matrixB, dimB):
    if int(dimA[0]) != int(dimB[1]): #dimenzije: retci != stupci
        raise ValueError('Dimenzije matrica nisu dobre!')
        
    result_matrix = dict()
    for i in range(int(dimA[0])):
        for j in range(int(dimB[1])):
            result_matrix[(i,j)] = sum(matrixA.get((i, k), 0.0) * matrixB.get((k, j), 0.0) for k in range(int(dimA[1])))
            if result_matrix[(i, j)] == 0:
                del result_matrix[(i, j)]
    return result_matrix, (dimA[0], dimB[1])
    
def save_matrix(matrix_result, dim_result, result_file_name):
    with open(result_file_name, 'w') as f:
        f.write(f'{dim_result[0]} {dim_result[1]}\n')
        for (r,c), v in matrix_result.items():
            f.write(f'{r} {c} {v}\n')
    

def main():
    if len(sys.argv) < 3:
        print("Nisu zadani potrebni argumenti!")
        return
        
    matrix_file_name = sys.argv[1]
    result_file_name = sys.argv[2]
    
    matrixA, dimA, matrixB, dimB = load_matrix(matrix_file_name)
    print("A:")
    print_matrix(matrixA, dimA)
    print("\nB:")
    print_matrix(matrixB, dimB)
    
    matrix_result, dim_result = matrix_multiply(matrixA, dimA, matrixB, dimB)
    print("\nA*B:")
    print_matrix(matrix_result, dim_result)
    
    save_matrix(matrix_result, dim_result, result_file_name)
    
    
if __name__ == "__main__":
    main()