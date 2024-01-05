# n = int(input())
# a = list(map(int, input().split()))
# s = str(input())
# a, n = map(int, input().split())

base_salary = 32*12*0.8
bonus = 0
for experienced_year in range(1, 5):
    previous_base_salary = base_salary
    base_salaly = previous_base_salary * 1.06
    print('base_salaly',int( base_salary ))
    bonus = base_salary * 4/12
    print('bonus',int(bonus))
    print('year salary',int( base_salary + bonus))
    