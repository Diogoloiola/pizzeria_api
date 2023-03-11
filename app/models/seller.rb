# frozen_string_literal: true

class Seller < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :skip_password_validation

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :name, :profile, :cpf, presence: true
  validates :email, uniqueness: true

  has_many :orders, dependent: :destroy

  enum profile: {
    admin: 0,
    functionarty: 1
  }

  def active_for_authentication?
    super && active?
  end

  protected

  def password_required?
    return false if skip_password_validation

    super
  end
end
