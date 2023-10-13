# formオブジェクト
class RegistrationForm
  include ActiveModel::Model

  # User attributes
  attr_accessor :nickname, :email, :password, :family_name, :first_name, :family_name_kana, :first_name_kana,
                :gender_id, :birth_date, :phone_number

  # Address attributes
  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building

  # Membership Plan attributes
  attr_accessor :monthly_fee_id, :yearly_fee_id

  # Membership Payments attributes
  attr_accessor :membership_payment

  # Associations
  attr_accessor :user, :address, :membership_plan, :membership_payments

  with_options presence: true do

    # userモデルのバリデーション
    validates :nickname,         length: { maximum: 40 }
    validates :password,         format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :family_name,      format: { with: /\A[^ -~｡-ﾟ]+\z/ }
    validates :first_name,       format: { with: /\A[^ -~｡-ﾟ]+\z/ }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :gender_id,        numericality: { other_than: 1 }
    validates :birth_date
    validates :phone_number,     format: { with: /\A[0-9]{10,11}\z/ }
    validates_length_of :phone_number, maximum: 11
    validates_length_of :phone_number, minimum: 10

    # addressモデルのバリデーション
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :street_address

    # membership_planモデルのバリデーション
    validates :monthly_fee_id
    validates :yearly_fee_id

    # membership_paymentsモデルのバリデーション
    validates :membership_payment

    # PAY.JPトークン
    # validates :token

  end

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end
