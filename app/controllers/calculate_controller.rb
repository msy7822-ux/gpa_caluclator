class CalculateController < ApplicationController
  def input
  end
  
  # 成績情報の前の成績決定の種類や授業数を受け取って保存するアクション
  def actual_calc
    # 不具合などですでにid=1というデータが存在してしまっていた場合にそれをいったん削除する
    if  Calcdatum.find_by(id: 1)
       Calcdatum.find_by(id: 1).destroy
    end
    
    # 空欄がないようにする
    if params[:classnum] != "" && params[:s] != "" && params[:a] != "" && params[:b] != "" && params[:c] != "" && params[:d] != ""
      gradekind = "#{params[:s]} #{params[:a]} #{params[:b]} #{params[:c]} #{params[:d]}"
      @calcdata = Calcdatum.new(id: 1, classnum: params[:classnum], gradekind: gradekind)
    
      @calcdata.save
      redirect_to('/calculate/fillingrade');
    else
      
      # 万が一空欄があったときの処理
      flash[:notice] = "全ての欄を埋めてください"
      redirect_to('/calculate/input')
    end 
    
    # この後は、データベースに保存されたデータに沿って成績を計算し、それが終わったら、calcdataテーブルの中見をからにする。 
  end 
  
  # 実際の成績情報を入力するページを表示するアクション
  def fillingrade
    @calcdata = Calcdatum.find_by(id: 1);
    @classnum = @calcdata.classnum
    @gradekind = @calcdata.gradekind
    @gradekind = @gradekind.split(" ")
  end
  
  
  # 入力された情報を受け取る
  def fillindo
    # 不具合などで、すでにid=1のデータが存在してしまっていたときにそれを削除する
    if Seccalc.find_by(id: 1)
      Seccalc.find_by(id: 1).destroy
    end 
    
    # inputのページで受け取った情報をもう一度拾ってくる
    @classdata = Calcdatum.find_by(id: 1)
    @class_sum = @classdata.classnum
    
    # 空欄があるかどうかを判断する
    if params[:s] != "" && params[:a] != "" && params[:b] != "" && params[:c] != "" && params[:d] != ""
      @result = Seccalc.new(id: 1, s: params[:s], a: params[:a], b: params[:b], c: params[:c], d: params[:d])
      
      # 最初に受け取った科目数と、入力された数の合計値が異なっていたら？
      if @class_sum.to_i == (params[:s].to_i + params[:a].to_i + params[:b].to_i + params[:c].to_i + params[:d].to_i)
        
        # 情報を登録できたときの挙動
        if @result.save
          redirect_to('/calculate/result')
        else
          flash[:notice] = "もう一度最初からやり直してください"
          redirect_to('/calculate/input')
        end 
        
      # 最初に受け取った授業数と、入力されたデータの数が異なる時 
      elsif @class_sum.to_i != (params[:s].to_i + params[:a].to_i + params[:b].to_i + params[:c].to_i + params[:d].to_i)
        flash[:notice] = "授業数と一致しません。もう一度入力してください。"
        redirect_to('/calculate/fillingrade')
      end
      
    else
        # 空欄があったらもう一度入力してもらう 
        flash[:notice] = "全ての欄を埋めてください"
        redirect_to('/calculate/fillingrade')
    end 
  end

  
  # 成績を最後の画面に表示するときのアクション
  def result
     @result = Seccalc.find_by(id: 1)
     @class_num = Calcdatum.find_by(id: 1)
     
     sum = (4 * @result.s) + (3 * @result.a) + (2 * @result.b) + (1 * @result.c) + (0 * @result.d)
     
     @gpa = (sum.to_f / @class_num.classnum).round(3)
  end 
  
  
  # 確認ボタンを押したときの挙動
  def confirm
    @result = Seccalc.find_by(id: 1)
    
    @gradekind = Calcdatum.find_by(id: 1)
    if @gradekind && @result
      
      if @gradekind.destroy && @result.destroy
        flash[:notice] = "成績の確認が終了しました"
        redirect_to('/calculate/input')
      else
        flash[:notice] = "不具合が発生したので、最初からやり直してください"
        redirect_to('/calculate/input')
      end
    else
      flash[:notice] = "成績の確認が終了しました"
      redirect_to('/calculate/input')
    end 

    
  end  
  
  
  # # -------------------------------
  # def proto
  #   @use = @result
  # end 
end
