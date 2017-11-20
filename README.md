 * page nation 기능 추가
gem 'kaminari'

  def index
    # @tweets=Tweet.all
    @tweets = Tweet.order(:id).page params[:page]
  end

 *
gem 'devise' => 로그인

 * 특정 action에서만 sing in을 요구하는 법
before_action :authenticate_user! => 모든 것을 하기 전에 로그인을 체크함.
before_action :authenticate_user!, except: [:index, :show] # user가 로그인 되어있는지 확인하라


 * gem 'carrierwave', '~> 1.0' => photo upload 기능 추가
#Rails-on-Ruby_FormForTag
