class AboutPagesController < ApplicationController
  before_action :set_about_page, only: %i[ show edit update destroy ]

  # GET /about_pages or /about_pages.json
  def index
    @about_pages = AboutPage.all
    @about_page = @about_pages.first
  end

  def show
    redirect_to about_pages_path
  end

  # GET /about_pages/new
  def new
    head 401 if !(current_user && current_user.email == 'matthias@matthiasclee.com')
    @about_page = AboutPage.new
  end

  # GET /about_pages/1/edit
  def edit
    head 401 if !(current_user && current_user.email == 'matthias@matthiasclee.com')
  end

  # POST /about_pages or /about_pages.json
  def create
    head 401 if !(current_user && current_user.email == 'matthias@matthiasclee.com')
    @about_page = AboutPage.new(about_page_params)

    respond_to do |format|
      if @about_page.save
        format.html { redirect_to about_page_url(@about_page), notice: "About page was successfully created." }
        format.json { render :show, status: :created, location: @about_page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @about_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /about_pages/1 or /about_pages/1.json
  def update
    head 401 if !(current_user && current_user.email == 'matthias@matthiasclee.com')
    respond_to do |format|
      if @about_page.update(about_page_params)
        format.html { redirect_to about_page_url(@about_page), notice: "About page was successfully updated." }
        format.json { render :show, status: :ok, location: @about_page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @about_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /about_pages/1 or /about_pages/1.json
  def destroy
    head 401 if !(current_user && current_user.email == 'matthias@matthiasclee.com')
    @about_page.destroy

    respond_to do |format|
      format.html { redirect_to about_pages_url, notice: "About page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about_page
      @about_page = AboutPage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def about_page_params
      params.require(:about_page).permit(:content)
    end
end
