Rails.application.routes.draw do
  
  # 自分の成績を確認したら、データを削除する
  post 'calculate/confirm' => 'calculate#confirm'
  
  # 成績の結果を表示するページ
  get 'calculate/result' => 'calculate#result'
  
  post 'calculate/fillindo' => 'calculate#fillindo'
  # それぞれの成績の数を入力して送信するルーティング
  post '/application/grade_num' => 'application#grade_num'
  
  # 成績入力ページに飛んでくれる
  get 'calculate/fillingrade' => 'calculate#fillingrade'
  
  # input.html.erbからデータを受け取ってデータベースに保存する
  post 'calculate/actual_calc' => 'calculate#actual_calc'
  
  # 計算をする前のセッティングのページ
  get 'calculate/input' => 'calculate#input'
  
  
  # トップページを開くためのルーティング
  get '/' => 'home#top'
  
  # 何か試すときのルーティング
  get 'calculate/proto'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
