class KaiketoolsController < ApplicationController
  def index
  end

  def new
    @kaiketool = Kaiketool.new
  end

  def create
    binding.pry
    @kaiketool = Kaiketool.new(kaiketool_params)
    if @kaiketool.save
      redirect_to kaiketool_path
    else
      render "google_custom_search/index"
    end
  end

  def show

  end

  def search
    google_custom_search
  end

  private

  def kaiketool_params
    params.require(:kaiketool).permit(:title, :background, :type_id, :image).merge(user_id: current_user.id)
  end

  def google_custom_search
    @title = params[:q]

    # Custom Search APIを呼び出すためのクライアントを作成します
    client = Google::Apis::CustomsearchV1::CustomSearchAPIService.new
    client.key = ENV['GOOGLE_API_KEY']

    # Custom Search APIの検索パラメータを設定します
    search_params = {
      q: params[:q], # 検索クエリ
      cx: ENV['GOOGLE_CX'], # カスタム検索エンジンID
      num: 3, # 1回のAPIリクエストで返される検索結果の数
      start: 1, # 検索結果の開始位置
      search_type: 'image', # 検索タイプ
      img_size: 'medium', # 画像サイズのフィルター
      cr: 'countryJP', # 検索範囲の指定
      safe: 'active', # セーフサーチの有効化
      gl: 'jp', # 地域の指
      googlehost: 'google.co.jp', # 検索するGoogleドメイン
    }

    # Custom Search APIを呼び出して検索結果を取得します
    search_result = client.list_cses(search_params)

    # 検索結果から画像を抽出して、@images変数に格納します
    if search_result.items.present?
      @image_urls = search_result.items.map { |item| item.link }
    else
    # 検索結果がない場合の処理を記述する
      @image_urls = []
    end
    render "kaiketools/new"
  end
end
