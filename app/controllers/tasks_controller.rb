class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    
    def index
        @tasks = Task.all
    end
    
    def show
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_params)
        
        if @task.save
            redirect_to @task
        else
            render :new
        end
    end
    
    def edit
    end
    
    def update
        
        if @task.update(task_params)
            redirect_to @task
        else
            render :edit
        end
    end
    
    def destroy
        
        @task.destroy
        
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
