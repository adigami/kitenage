class AdAccountsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_ad_account, only: [:show, :edit, :update, :destroy]

  # GET /ad_accounts
  # GET /ad_accounts.json
  def index
    @ad_accounts = AdAccount.all
  end

  # GET /ad_accounts/1
  # GET /ad_accounts/1.json
  def show
  end

  # GET /ad_accounts/new
  def new
    @ad_account = AdAccount.new
  end

  # GET /ad_accounts/1/edit
  def edit
  end

  # POST /ad_accounts
  # POST /ad_accounts.json
  def create
    @ad_account = AdAccount.new(ad_account_params)
    @ad_account.user = current_user

    respond_to do |format|
      if @ad_account.save
        format.html { redirect_to @ad_account, notice: 'Ad account was successfully created.' }
        format.json { render :show, status: :created, location: @ad_account }
      else
        format.html { render :new }
        format.json { render json: @ad_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ad_accounts/1
  # PATCH/PUT /ad_accounts/1.json
  def update
    respond_to do |format|
      if @ad_account.update(ad_account_params)
        format.html { redirect_to @ad_account, notice: 'Ad account was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad_account }
      else
        format.html { render :edit }
        format.json { render json: @ad_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_accounts/1
  # DELETE /ad_accounts/1.json
  def destroy
    @ad_account.destroy
    respond_to do |format|
      format.html { redirect_to ad_accounts_url, notice: 'Ad account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad_account
      @ad_account = AdAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_account_params
      params.require(:ad_account).permit(:name, :source_id, :oauth_token, :active, :user_id)
    end
end
