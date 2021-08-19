class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorise_user, only: [:edit, :update,:destroy ]
  before_action :set_categories, only: [:new, :edit]


  # GET /listings or /listings.json
  def index
    @listings = Listing.all.includes(:category)
  end

  # # GET /listings/1 or /listings/1.json
  # def show
  #   session = Stripe::Checkout::Session.create(
  #     payment_method_types: ['card'], 
  #     customer_email: current_user&.email, #current_user && current_user.email 
  #     line_items: [{
  #       name: @listing.title, 
  #       description: @listing.description, 
  #       amount: @listing.price * 100,
  #       currency: 'aud', 
  #       quantity: 1
  #     }], 
  #     payment_intent_data: {
  #       metadata: {
  #         user_id: current_user.id,
  #         listing_id: @listing.id
  #       }
  #     }, 
  #     success_url: "#{root_url}/listings#{@listing.id}", 
  #     cancel_url: "#{root_url}/listings"
  #   )

  #   @session_id = session.id 
  #   puts "*********"
  #   pp @session_id
  #   puts "*********"
  # end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = current_user.listings.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        set_categories
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        set_categories 
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:user_id, :category_id, :title, :picture, :description, :price, :sold, colour_ids: [])
    end

    def set_categories
      @categories = Category.all
      @colours = Colour.all
    end

    # Prevent users from edit/destroying other user's listings
    def authorise_user
      if current_user.id != @listing.user_id
        flash[:error] = "Sorry, you can't edit this listing."
        redirect_to listings_path
      end
    end
  end
