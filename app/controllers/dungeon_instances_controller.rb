require 'dungeon'

class DungeonInstancesController < ApplicationController
  before_action :set_dungeon_instance, only: [:show, :edit, :update, :destroy]

  # GET /dungeon_instances
  # GET /dungeon_instances.json
  def index
    @dungeon_instances = DungeonInstance.all
  end

  # GET /dungeon_instances/1
  # GET /dungeon_instances/1.json
  def show
    dungeon = Dungeon.from_json( @dungeon_instance.dungeon_data )
    dungeon.draw_current_room( 'app/assets/images/current_room.jpg' )
    @directions = dungeon.available_directions
  end

  # GET /dungeon_instances/new
  def new
    @dungeon_instance = DungeonInstance.new
  end

  # GET /dungeon_instances/1/edit
  def edit
  end

  # POST /dungeon_instances
  # POST /dungeon_instances.json
  def create

    dungeon = Dungeon.new( 5 )
    dungeon.generate_dungeon
    pp dungeon.to_json

    @dungeon_instance = DungeonInstance.new( dungeon_data: dungeon.to_json )

    respond_to do |format|
      if @dungeon_instance.save
        format.html { redirect_to @dungeon_instance, notice: 'Dungeon instance was successfully created.' }
        format.json { render :show, status: :created, location: @dungeon_instance }
      else
        format.html { render :new }
        format.json { render json: @dungeon_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dungeon_instances/1
  # PATCH/PUT /dungeon_instances/1.json
  def update
    respond_to do |format|
      if @dungeon_instance.update(dungeon_instance_params)
        format.html { redirect_to @dungeon_instance, notice: 'Dungeon instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @dungeon_instance }
      else
        format.html { render :edit }
        format.json { render json: @dungeon_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dungeon_instances/1
  # DELETE /dungeon_instances/1.json
  def destroy
    @dungeon_instance.destroy
    respond_to do |format|
      format.html { redirect_to dungeon_instances_url, notice: 'Dungeon instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dungeon_instance
      @dungeon_instance = DungeonInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dungeon_instance_params
      params.require(:dungeon_instance).permit(:dungeon_data)
    end
end
