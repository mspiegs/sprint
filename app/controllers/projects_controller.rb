class ProjectsController < ApplicationController
  layout 'project', only: [:show, :destroy]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @stories = Story.where(project_id: params[:id])
    @projects = Project.all
    @story = Story.new
    @backlogs = Story.where(project_id: params[:id], status: 'backlog')
    @commits = Story.where(project_id: params[:id], status: 'committed')
    @starts = Story.where(project_id: params[:id], status: 'started')
    @qas = Story.where(project_id: params[:id], status: 'qa')
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @story = Story.new
    @stories = Story.where(project_id: params[:id])
    @projects = Project.all
    @backlogs = Story.where(project_id: params[:id], status: 'backlog')
    @commits = Story.where(project_id: params[:id], status: 'committed')
    @starts = Story.where(project_id: params[:id], status: 'started')
    @qas = Story.where(project_id: params[:id], status: 'qa')
    @sprintblocks = Sprintblock.all.current_sprint.where(project_id: params[:id]).first
    logger.debug "I am project show"
  end

  # GET /projects/new
  def new
    @project = Project.new
    @story = Story.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
        @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :start_number, :sprint_length, :start_date, :duration_number, :duration_length. :user_ids => [] )
    end
end
