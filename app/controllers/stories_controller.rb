class StoriesController < ApplicationController
  layout 'story'
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  

  # GET /stories
  # GET /stories.json
  def index

    @story = Story.new
    @stories = Story.all
    @project = Project.where(id: params[:id])
    @backlogs = @stories.backlog.where(project_id: params[:id])
    @commits = @stories.committed.where(project_id: params[:id])
    @starts = @stories.started.where(project_id: params[:id])
    @qas = @stories.qa.where(project_id: params[:id])
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
  end

  def tags
    projectid = params[:id]
    logger.debug projectid
    @stories = Story.where(project_id: 8)
    respond_to do |format|
      @backlogs = @stories.backlog.tagged_with(params[:search])
      @commits = @stories.committed.tagged_with(params[:search])
      @starts = @stories.started.tagged_with(params[:search])
      @qas = @stories.qa.tagged_with(params[:search])
      format.html { redirect_to stories_url }
      format.js { render layout: false}
      format.json { render json: {:story => @story,
                                    :backlog_div => render_to_string(partial: "backlog.html.erb"),
                                    committed_div: render_to_string(partial: "commit.html.erb"),
                                    qa_div: render_to_string(partial: "qa.html.erb"),
                                    started_div: render_to_string(partial: "start.html.erb")}, layout: false }
    end
  end


  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
    @stories = Story.all
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)
    projectid = @story.project_id
    logger.debug projectid
    respond_to do |format|
      if @story.save
        format.html { redirect_to project_path(projectid), notice: 'Story was successfully created.' }
        format.json { render action: 'show', status: :created, location: @story }
      else
        format.html { render action: 'new' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    projectid = @story.project_id
    @stories = Story.where(project_id: projectid)
    logger.debug @story.project_id
    respond_to do |format|
      if @story.update(story_params)
        @backlogs = @stories.backlog
        @commits = @stories.committed
        @starts = @stories.started
        @qas = @stories.qa
        format.html { redirect_to stories_url}
        format.js { render layout: false }
        format.json { render json: {:story => @story,
                                    :backlog_div => render_to_string(partial: "backlog.html.erb"),
                                    committed_div: render_to_string(partial: "commit.html.erb"),
                                    qa_div: render_to_string(partial: "qa.html.erb"),
                                    started_div: render_to_string(partial: "start.html.erb")}, layout: false }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    def setting_project
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:title, :audience, :want, :because, :estimate, :value, :status, :project_id, :sprintblock_id, :sprint_number, :tag_list)
    end
end
