module UserFeesHelper

	def find_one_time
		@one_time = @food.map(&:one_time)
	end

	def find_two_time
		@two_time = @food.map(&:two_time)
	end
end
