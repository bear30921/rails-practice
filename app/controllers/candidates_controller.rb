class CandidatesController < ApplicationController
	

	before_action :find_candidate, only: [:edit, :update, :destroy, :vote]

	#程式執行action之前會先呼叫set_event方法,並指定




	def index
		@candidates = Candidate.all

	end

	def new
		@candidate = Candidate.new
		
		
	end

	
	def edit
		#兩種find寫法都行
		# @candidate = Candidate.find_by(id: params[:id])

		# 使用了befroe_action 所以下面這行可以省略
		# @candidate = Candidate.find(params[:id])
		
	end

	def update
		# 使用了befroe_action 所以下面這行可以省略
		#@candidate = Candidate.find(params[:id])

	    if @candidate.update_attributes(candidate_params)
	      # 成功
	      redirect_to candidates_path, notice: "資料更新成功!"
	    else
	      # 失敗
	      render :edit
	    end
	end


	def create
		#修改前
		#@candidate = Candidate.new(params[:candidate])

		#修改後
		@candidate = Candidate.new(candidate_params)

		if @candidate.save
			#成功
			redirect_to candidates_path, notice: "新增候選人成功！"
		else
			#失敗
			render :new
		end
	end


	def destroy
		# 使用了befroe_action 所以下面這行可以省略
		# @candidate = Candidate.find(params[:id])
    	@candidate.destroy if @candidate
    	redirect_to candidates_path, notice: "候選人資料已刪除!"
	end


	def vote
		# 使用了befroe_action 所以下面這行可以省略
		# @candidate = Candidate.find(params[:id])
		@candidate.increment(:votes)
		@candidate.save
		redirect_to candidates_path, notice: "完成投票"
	end




	private

	def candidate_params
		params.require(:candidate).permit(:name, :age, :party, :politics)
	end

	def find_candidate
		@candidate = Candidate.find(params[:id])
	end

end
