def mean_val(list_number):
    sum_shu = 0
    for num in list_number:
        sum_shu = sum_shu + num
    length = len(list_number)
    mean = sum_shu*1.0/length
    return mean

#list1_num = [2, 3, 0, 10]
#mean1 = mean_val(list1_num)
#print(mean1)
#sum_shu = 0
#for num in list1_num:
#    sum_shu = sum_shu + num
#
#length = len(list1_num)
#mean1 = sum_shu*1.0/length
#print(mean)

#list2_num = [2, 3, 0, 10, 9, 8]
#mean2 = mean_val(list2_num)
#print(mean2)

