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

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    flash[:success] = 'Task は正常に削除されました'

    # indexへのリダイレクト: prefix_url または tasks_url
    redirect_to tasks_url
  end

# #########################################
  private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end
# #########################################

end
