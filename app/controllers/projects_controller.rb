class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.create(project_params(:name, :goal))

        redirect_to project_path(@project)
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        amount = @project.donate(params[:project][:total_donated])
        @project.update(name: params[:project][:name], goal: params[:project][:goal], total_donated: amount)
        
        redirect_to project_path(@project)
    end

    def destroy
        @project = Project.find(params[:id])
        @project.delete
    end

    private

    def project_params(*args)
        params.require(:project).permit(*args)
    end
end
