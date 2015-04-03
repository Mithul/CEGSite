class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :approve, :apply]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  def approval
    @projects = Project.all
  end

  def approve
    @project.status = 'completed'
    @project.save
    redirect_to :back, notice: 'Project was successfully Approved.'
  end

  def apply
    @project.status = 'pending'
    @project.save
    redirect_to :back, notice: 'Project was successfully Approved.'
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    # Temp
    @students = User.all
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @students = User.all
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.status = :in_progress
    puts @project.members

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    puts @project.members
    @students = User.all

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
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
      params.require(:project).permit(:name, :description, :status, :domain, :tag_list, :mentor, :members, :mentor_id, members_attributes: [:name, :id ,:_destroy])
    end
end
