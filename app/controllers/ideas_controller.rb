class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
    if Material.all.size <= 1
      redirect_to new_material_path
    else
      material_first_id = Material.first.id
      material_last_id = Material.last.id
      rand_id_a = rand(material_first_id..material_last_id)
      rand_id_b = rand(material_first_id..material_last_id)
      rand_id_b = rand(material_first_id..material_last_id) while rand_id_a == rand_id_b
      @material_a = Material.find(rand_id_a)
      @material_b = Material.find(rand_id_b)
    end
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)
    @params = params.require(:idea).permit(:name, :content, :a_id, :b_id)

    respond_to do |format|
      if @idea.save
        a = @params[:a_id].to_i
        b = @params[:b_id].to_i
        a,b = b,a if a > b
        child_numbers = "#{a},#{b}"
        if Theme.all.empty?
          theme = Theme.create(child_numbers: child_numbers)
          theme.inputs << Input.create(material_id: a)
          theme.inputs << Input.create(material_id: b)
          theme.ideas << @idea
        else
          theme = Theme.find_by(child_numbers: child_numbers)
          if theme.nil?
            @theme = Theme.create(child_numbers: child_numbers)
            @theme.inputs << Input.create(material_id: a)
            @theme.inputs << Input.create(material_id: b)
            theme.ideas << @idea
          else
            theme.ideas << @idea
          end
        end

        format.html { redirect_to action: 'index', notice: 'Idea was successfully created.' }
        format.json { render :index, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:name, :content)
    end
end
