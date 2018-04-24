require 'dungeon'

class DungeonInstancesController < ApplicationController

  before_action :require_logged_in!
  before_action :set_dungeon_instance, only: [:show, :play, :edit, :move, :clear_room]

  DIFFICULTY = [:easy, :medium, :hard, :deadly]

  # GET /dungeon_instances
  # GET /dungeon_instances.json
  def index
    @dungeon_instances = current_user.dungeon_instances.all
  end

  # GET /dungeon_instances/1
  # GET /dungeon_instances/1.json
  def play
    if Rails.env.production?
      @dungeon.draw_current_room( "public/rooms/current_room_#{@dungeon_instance.id}.jpg" )
    else
      @dungeon.draw_current_room( 'app/assets/images/current_room.jpg' )
    end

    @directions = @dungeon.available_directions
    @dungeon_content = @dungeon.current_room.content_description
  end

  def show
  end

  # GET /dungeon_instances/new
  def new
    @dungeon_instance = DungeonInstance.new( size: 5, hero2_level: 1, hero3_level: 1 )
  end

  # POST /dungeon_instances
  # POST /dungeon_instances.json
  def create
    party = []
    (1..6).each do |p_number|
      level = params[:dungeon_instance]["hero#{p_number}_level"].to_i
      party << level if level > 0
    end

    dungeon = Dungeon.new
    dungeon.generate( params[:dungeon_instance][:size].to_i, party,
                           encounters_difficulty: params[:dungeon_instance][:difficulty].to_sym )
    # p dungeon.to_json

    @dungeon_instance = DungeonInstance.new( dungeon_instance_params.merge( dungeon_data: dungeon.to_json ) )

    respond_to do |format|
      if current_user.dungeon_instances << @dungeon_instance
        format.html { redirect_to dungeon_instance_play_path( @dungeon_instance ), notice: 'Dungeon instance was successfully created.' }
      else
        format.html { redirect_to dungeon_instances_path, error: 'Dungeon instance was successfully created.'  }
      end
    end
  end

  # PATCH/PUT /dungeon_instances/1
  # PATCH/PUT /dungeon_instances/1.json
  def move
    @dungeon.set_next_room( params[:direction].to_sym)
    if @dungeon_instance.update(dungeon_data: @dungeon.to_json)
      redirect_to dungeon_instance_play_path( @dungeon_instance )
    end
  end

  def clear_room
    @dungeon.current_room.clear
    if @dungeon_instance.update(dungeon_data: @dungeon.to_json)
      redirect_to dungeon_instance_play_path( @dungeon_instance )
    end
  end

  # DELETE /dungeon_instances/1
  # DELETE /dungeon_instances/1.json
  def destroy
    @dungeon_instance = @current_user.dungeon_instances.find(params[:id])
    @dungeon_instance.destroy
    respond_to do |format|
      format.html { redirect_to dungeon_instances_url, notice: 'Dungeon instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dungeon_instance
      @dungeon_instance = current_user.dungeon_instances.find(params[:id]||params[:dungeon_instance_id])
      @dungeon = Dungeon.from_json( @dungeon_instance.dungeon_data )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dungeon_instance_params
      params.require(:dungeon_instance).permit(:difficulty, :hero1_level, :hero2_level,
         :hero3_level, :hero4_level, :hero5_level, :hero6_level, :size )
    end
end
