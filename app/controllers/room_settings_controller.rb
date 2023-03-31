class RoomSettingsController < ApplicationController
  before_action :set_room_setting, only: %i[ show edit update destroy ]

  # GET /room_settings or /room_settings.json
  def index
    @room_settings = RoomSetting.all
  end

  # GET /room_settings/1 or /room_settings/1.json
  def show
  end

  # GET /room_settings/new
  def new
    @room_setting = RoomSetting.new
  end

  # GET /room_settings/1/edit
  def edit
  end

  # POST /room_settings or /room_settings.json
  def create
    @room_setting = RoomSetting.new(room_setting_params)

    respond_to do |format|
      if @room_setting.save
        format.html { redirect_to room_setting_url(@room_setting), notice: "Room setting was successfully created." }
        format.json { render :show, status: :created, location: @room_setting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_settings/1 or /room_settings/1.json
  def update
    respond_to do |format|
      if @room_setting.update(room_setting_params)
        format.html { redirect_to room_setting_url(@room_setting), notice: "Room setting was successfully updated." }
        format.json { render :show, status: :ok, location: @room_setting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_settings/1 or /room_settings/1.json
  def destroy
    @room_setting.destroy

    respond_to do |format|
      format.html { redirect_to room_settings_url, notice: "Room setting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_setting
      @room_setting = RoomSetting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_setting_params
      params.fetch(:room_setting, {})
    end
end
