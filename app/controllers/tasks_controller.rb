class TasksController < ApplicationController

# インスタンス変数
# @tasks : string[]
# @task  : string

# メソッド名	  用途
# all  	        全てのレコードを取得する
# new	          新規レコードのためのモデルインスタンスを作成する
# find	        idを指定して検索
# save	        レコードの作成
# update, save	データの更新
# destroy	      データの削除

# 以下、resourceで生成される全てのアクションを実装

  # 共通処理
  # ログインユーザ確認
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  # 各アクション
  def index
    if logged_in?
      @user = current_user
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page]).per(3)
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy

    flash[:success] = 'Task は正常に削除されました'

    # indexへのリダイレクト: prefix_url または tasks_url
    redirect_to tasks_url
  end

# #########################################
  private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end

  # ログインユーザのtask所有確認
  # （違うユーザの場合はトップページに戻す）
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
# #########################################

end
