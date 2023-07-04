class GameController < ApplicationController
  def list
    render json: Game.select(:uid).map(&:uid).to_json
  end

  def new
    game = Game.create
    render json: game.uid.to_json
  end

  def join
    game = Game.find_by_anything(params[:_json])
    token = game.join
    game.save!
    render json: {"game": token, "turn": game.turn(token)}
  end

  def move
    token = params[:game]
    move = params[:move]

    game = Game.find_by_anything(token)
    ok = game.move(token, move).present?
    game.save!
    error = nil
    error = "Something went wrong!" unless ok
    render json: {"ok": ok, "error": error}
  end

  def board
    token = params[:_json]
    game = Game.find_by_anything(token)
    game.save!
    render json: game.board.split('').to_json
  end

  def giveup
    token = params[:_json]
    game = Game.find_by_anything(token)
    ok = game.present?
    error = nil
    error = "never_giveup" unless ok
    render json: {"ok": ok, "error": error}
  end
end
