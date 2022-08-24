a=[[1],[1],[1]]

def test(a):
    del a[0][0]

test(a)
print(a)