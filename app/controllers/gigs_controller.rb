class GigsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gig, only: [:show, :edit, :update, :destroy]

  # GET /gigs
  # GET /gigs.json
  def index
   # @project=Project.find(params[:id])
    @project = Project.find(params[:project_id])
    @gigs = @project.gigs.all
  end

  # GET /gigs/1
  # GET /gigs/1.json
  def show
    # @project = Project.find(params[:project_id])
    # @gig = @project.gigs.find(params[:id])
   # @gig = Gig.find(params[:id])
  end

  # GET /gigs/new
  def new
      @project = Project.find(params[:project_id])
     @gigs = @project.gigs.new
    #@gig = Gig.new
  end

  # GET /gigs/1/edit
  def edit
   #  @project = Project.find(params[:project_id])
   
  end

  # POST /gigs
  # POST /gigs.json
  def create
    @project = Project.friendly.find(params[:project_id])
    @gig = @project.gigs.new(gig_params)

    respond_to do |format|
      if @gig.save
        format.html { redirect_to @project, notice: 'Gig was successfully created.' }
        format.json { render :show, status: :created, location: @gig }
      else
        format.html { render :new }
        format.json { render json: @gig.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gigs/1
  # PATCH/PUT /gigs/1.json
  def update
    respond_to do |format|
      if @gig.update(gig_params)
        format.html { redirect_to @gig, notice: 'Gig was successfully updated.' }
        format.json { render :show, status: :ok, location: @gig }
      else
        format.html { render :edit }
        format.json { render json: @gig.errors, status: :unprocessable_entity }
      end
    end
  end

  def status
     @gig = Gig.find(params[:gig_id])
     @gig.update_attribute(:done,true)
    # respond_to do |format|
    #   if @gig.update(:done, true)
    #     format.html { redirect_to @gig, notice: 'Gig was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @gig }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @gig.errors, status: :unprocessable_entity }
    #   end
    # end
  end


  # DELETE /gigs/1
  # DELETE /gigs/1.json
  def destroy
    @gig.destroy
    respond_to do |format|
      format.html { redirect_to @gig, notice: 'Gig was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gig
      #@project = Project.find(params[:project_id])
      @gig = Gig.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gig_params
      params.require(:gig).permit(:name, :description, :done,:timeline)
    end
end
