class ProjectsController < ApplicationController
    before_action :find_project, only: [:show, :edit, :update, :delete]
    
    def index
        @projects = Project.all
    end

    def show
        
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.create(project_params(:name, :goal))

        redirect_to project_path(@project)
    end

    def edit
        
    end

    def update
        
        amount = @project.donate(params[:project][:total_donated])
        @project.update(name: params[:project][:name], goal: params[:project][:goal], total_donated: amount)
        
        redirect_to project_path(@project)
    end

    def destroy
        
        @project.destroy
        redirect_to projects_path(@projects)
    end

    private

    def project_params(*args)
        params.require(:project).permit(*args)
    end

    def find_project
        @project = Project.find(params[:id])
    end
end
