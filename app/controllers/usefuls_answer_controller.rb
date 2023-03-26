before_action :authenticate_user!

def create
  @useful_answer = current_user.useful_answers.build(useful_answer_params)
  if @useful_answer.save
    redirect_back(fallback_location: root_path, notice: "回答が役に立ったと投票しました")
  else
    redirect_back(fallback_location: root_path, alert: "回答の評価に失敗しました")
  end
end

def destroy
  @useful_answer = current_user.useful_answers.find_by(answer_id: params[:answer_id])
  if @useful_answer.destroy
    redirect_back(fallback_location: root_path, notice: "回答の評価を取り消しました")
  else
    redirect_back(fallback_location: root_path, alert: "回答の評価取り消しに失敗しました")
  end
end

private

def useful_answer_params
  params.permit(:answer_id)
end
end
