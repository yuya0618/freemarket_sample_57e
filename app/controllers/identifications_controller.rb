class IdentificationsController < ApplicationController
  # before_action :authenticate_user!

  def edit
    add_breadcrumb '本人確認'

    # TODO ログイン機能実装後使用予定
    # @profile = current_user.profile
  end

end
