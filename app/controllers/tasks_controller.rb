class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    
    def index
        @tasks = Task.order(id: :asc).page(params[:page]).per(20)
    end
    
    def show
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_params)
        
        if @task.save
            flash[:success] = 'Taskが正常に投稿されました。'
            redirect_to @task
        else
            flash[:danger] = 'Taskが投稿できませんでした。'
            render :new
        end
    end
    
    def edit
    end
    
    def update
        
        if @task.update(task_params)
            flash[:success] = 'Taskは正常に更新できました。'
            redirect_to @task
        else
            flash[:danger] = 'Taskは更新されませんでした。。'
            render :edit
        end
    end
    
    def destroy
        @task.destroy
        
        flash[:success] = 'Taskを正常に削除しました。'
        redirect_to tasks_url
    end
    
    private
    
    #繰り返し利用を共通化
    def set_task
        @task = Task.find(params[:id])
    end
    
    # ストロングパラメーター（入力データの精査機能）
    def task_params
        params.require(:task).permit(:content, :status)
    end
        
end
