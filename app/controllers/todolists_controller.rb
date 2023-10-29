class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = List.new
  end

  def create
    # データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    # データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 詳細画面へリダイレクト
    redirect_to todolist_path(list.id)
  end

  def index
    @lists = List.all # データを全て取得
  end

  def show
    @list = List.find(params[:id]) # データを1件取得
  end

  def edit
    @list = List.find(params[:id]) # データを1件取得
  end

  def update
    list = List.find(params[:id]) # データを1件取得
    list.update(list_params) # データを更新
    redirect_to todolist_path(list.id) # List詳細画面へリダイレクト
  end

  def destroy
    list = List.find(params[:id]) # データを1件取得
    list.destroy # データを削除
    redirect_to todolists_path # List一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
