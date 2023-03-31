class RoomUserWordsController < ApplicationController
  before_action :set_room_user_word, only: %i[ show edit update destroy ]

  # GET /room_user_words or /room_user_words.json
  def index
    @room_user_words = RoomUserWord.all
  end

  # GET /room_user_words/1 or /room_user_words/1.json
  def show
  end

  # GET /room_user_words/new
  def new
    @room_user_word = RoomUserWord.new
  end

  # GET /room_user_words/1/edit
  def edit
  end

  # POST /room_user_words or /room_user_words.json
  def create
    @room_user_word = RoomUserWord.new(room_user_word_params)

    respond_to do |format|
      if @room_user_word.save
        format.html { redirect_to room_user_word_url(@room_user_word), notice: "Room user word was successfully created." }
        format.json { render :show, status: :created, location: @room_user_word }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room_user_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_user_words/1 or /room_user_words/1.json
  def update
    respond_to do |format|
      if @room_user_word.update(room_user_word_params)
        format.html { redirect_to room_user_word_url(@room_user_word), notice: "Room user word was successfully updated." }
        format.json { render :show, status: :ok, location: @room_user_word }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room_user_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_user_words/1 or /room_user_words/1.json
  def destroy
    @room_user_word.destroy

    respond_to do |format|
      format.html { redirect_to room_user_words_url, notice: "Room user word was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_user_word
      @room_user_word = RoomUserWord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_user_word_params
      params.fetch(:room_user_word, {})
    end
end
