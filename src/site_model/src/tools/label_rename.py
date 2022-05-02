def main(filename):
    f_read = open(filename, 'r', encoding='utf-8')
    write = []
    for line in f_read:
        write = line.split(' ')
        write[0] = 'Car'
    strs = ''
    for i in range(len(write)):
        strs = strs + write[i]
        if i != len(write)-1:
            strs = strs + ' '
    # print(strs)
    f_write = open(filename, 'w', encoding='utf-8')
    f_write.write(strs)
    

if __name__=='__main__':
    root_path = '/home/zonlin/CRLFnet/src/site_model/dataset/point_cloud_data/labels_temporary/'

    for num in range(1275,1376):
        if num < 10:
            num_str = '0'+'0'+'0'+'0'+'0'+str(num) 
        if num >= 10 and num < 100:
            num_str = '0'+'0'+'0'+'0'+str(num)
        if num >= 100 and num < 1000:
            num_str = '0'+'0'+'0'+str(num)
        if num >=1000 and num <10000:
            num_str = '0'+'0'+str(num)
        print(num_str, 'Dnoe.')        
        main(root_path+num_str+'.txt')