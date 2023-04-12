  before_action :authenticate_user!
  before_action :check_admin

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path, notice: 'カテゴリーを作成しました'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def check_admin
    redirect_to root_path, alert: "管理者権限が必要です" unless current_user.admin?
  end
end
