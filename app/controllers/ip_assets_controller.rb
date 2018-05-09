class IpAssetsController < ApplicationController
  before_action :set_ip_asset, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 
  

  # GET /ip_assets
  # GET /ip_assets.json

  def index
    if params[:tag]
    @ip_assets = IpAsset.tagged_with(params[:tag])
  else
    @ip_assets = IpAsset.all
  end
  @user = current_user
  @ownerships = @user.ownerships
  end
  def approve
    
      @ip = IpAsset.all
          @user = current_user

    @ip_comm = IpComm.all
  
  end
  def approve1
    @ip=IpAsset.find(params[:my_ip])
    @user = current_user
    @ip_comm = IpComm.where(ip_asset_id: @ip.id).where(user_id: @user.id).first
   
    @approves=@ip.approved_by

   if @ip.status == 0
      @ip_comm.vote=1
      @ip_comm.save
     @vote = IpComm.where(ip_asset_id: @ip.id).sum(:vote)
       if @vote >=2
          @ip.status =1
      else
      end
      if @approves.blank?
        @approvals = @user.email
      else
        @approvals = @approves + @user.email
      end  
      @ip.approved_by=@approvals
      @ip.save
      redirect_to '/approve'
    end
    else
    end
  def approve2
    @ip=IpAsset.find(params[:my_ip])
     @user = current_user
    @ip_comm = IpComm.where(ip_asset_id: @ip.id).where(user_id: @user.id).first
   if @ip.status == 0
      @ip.status=2
      @ip.save
      redirect_to '/approve'
    end
    else

  end
  def approve3
    @ip=IpAsset.find(params[:my_ip])
   if @ip.status == 2 || @ip.status == 0
      @ip.status=3
      @ip.save
      redirect_to '/approve'
    end
    else

  end
  def resubmit
 @ip=IpAsset.find(params[:my_ip])
  if @ip.status==2
    @ip.status=0
    @ip.save
  else
  end
  redirect_to '/accept'
end
  def stake
    @ip=IpAsset.find(params[:my_ip])
    @ownerships= @ip.ownerships
  end
  # GET /ip_assets/1
  # GET /ip_assets/1.json
  def show
      

  end

  # GET /ip_assets/new
  def new
    @ip_asset = IpAsset.new
    @users = User.all
    
  end

  # GET /ip_assets/1/edit
  def edit
  end

  # POST /ip_assets
  # POST /ip_assets.json
  def create
    @ip_asset = current_user.ip_assets.build(ip_asset_params)
    respond_to do |format|
      if @ip_asset.save
        @per = @ip_asset.ownerships.sum(:percentage)
        if @per <= 80
          @rem = 100 - @per
          @obj = Ownership.create(:user_id => 26, :percentage => @rem, :ip_asset_id => @ip_asset.id)
        format.html { redirect_to @ip_asset, notice: 'Ip asset was successfully created.' }
        format.json { render :show, status: :created, location: @ip_asset }
      else
        @ip_asset.destroy
        format.html { redirect_to "/ip_assets/new", notice: 'percentage cannot be greater than 80. Atleast 20 percent must be given to IIITB' }
        format.json { render json: @ip_asset.errors, status: :unprocessable_entity }
      end
      else
        format.html { render :new }
        format.json { render json: @ip_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ip_assets/1
  # PATCH/PUT /ip_assets/1.json
  def update
    respond_to do |format|
      if @ip_asset.update(ip_asset_params)
        format.html { redirect_to @ip_asset, notice: 'Ip asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @ip_asset }
      else
        format.html { render :edit }
        format.json { render json: @ip_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ip_assets/1
  # DELETE /ip_assets/1.json
  def destroy
    @ip_asset.destroy
    respond_to do |format|
      format.html { redirect_to ip_assets_url, notice: 'Ip asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ip_asset
      @ip_asset = IpAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ip_asset_params
      params.require(:ip_asset).permit(:title, :description, :filename, :attachment, :tag_list, :ownerships_attributes=> [:id, :user_id, :percentage, :_destroy])
    end
end
