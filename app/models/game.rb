class Game < ApplicationRecord
  before_create do
    self.uid = SecureRandom.uuid
    self.board = '.' * 9
  end

  def join
    token = SecureRandom.uuid
    unless self.token_a
      self.token_a = token
      return token
    end

    unless self.token_b
      self.token_b = token
      return token
    end

    nil
  end

  def move(token, move)
    turn = turn(token)
    return nil unless turn
    return nil unless valid_move?(move)

    self.board[move] = turn
  end

  def turn(token)
    return 'o' if self.token_a == token
    return 'x' if self.token_b == token
    nil
  end

  def self.find_by_anything(token)
    Game.where('uid = ? or token_a = ? or token_b = ?', token, token, token).first
  end

  private
  def valid_move?(move)
    self.board[move] == '.'
  end
end
