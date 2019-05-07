class Api::V1::PublicationsController < Api::V1::ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  before_action :set_author, only: [:index]

  # GET /publications
  # GET /publications.json
  def index
    if @author_id
      @publications = @author.publications
    else
      @publications = Publication.all
    end
    render json: @publications
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
    render json: @publication
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  # POST /publications.json
  def create
    @publication = Publication.new(publication_params)

    if @publication.save
      render json: @publication, status: :created
    else
      reponse = { status: "error", code: 422,
                  message: "couldn't create the publication",
                  errors: @publication.errors }
      render json: reponse, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    if @publication.update(publication_params)
      render json: @publication, status: :ok
    else
      render json: @publication.errors, status: :unprocessable_entity
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    def set_author
      @author = Author.find(params[:author_id].to_i) if params[:author_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(:body, :title, :publication_date, :author_id)
    end
end
