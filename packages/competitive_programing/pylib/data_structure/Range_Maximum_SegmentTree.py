class SegmentTree:
	def __init__(self, n):
		self.size = 1
		while self.size < n:
			self.size *= 2
		self.sells = [ 0 ] * (self.size * 2)
	
	def update(self, sell_index, value):
		sell_index += self.size 
		self.sells[sell_index] = value
		while sell_index >= 2:
			sell_index //= 2
			self.sells[sell_index] = max(self.sells[sell_index * 2], self.sells[sell_index * 2 + 1])
	
	def query(self, left, right, sell_left, sell_right, sell_index):
		if right <= sell_left or sell_right <= left:
			return -1000000000
		if left <= sell_left and sell_right <= right:
			return self.sells[sell_index]
		m = (sell_left + sell_right) // 2
		answerl = self.query(left, right, sell_left, m, sell_index * 2)
		answerr = self.query(left, right, m, sell_right, sell_index * 2 + 1)
		return max(answerl, answerr)

N, Q = map(int, input().split())
queries = [ list(map(int, input().split())) for _ in range(Q) ]
tree = SegmentTree(N)
for query in queries:
	query_num, *index_value = query
	if query_num == 1:
		sell_index, value = index_value
		tree.update(sell_index - 1, value) 
	if query_num == 2:
		left, right = index_value
		answer = tree.query(left - 1, right - 1, 0, tree.size, 1) 
		print(answer)
