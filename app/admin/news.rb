#encoding: utf-8
ActiveAdmin.register News do

  scope "已发布", :released
  scope "未发布", :unreleased

  menu :label => "新闻管理"

  index :download_links => false, :columns => 3 do
    column "标题", :title
    column "摘要", :summary
    column "发布者", :publisher
    column "更新时间", :updated_at do |new|
      if new.updated_at != nil
        new.updated_at.strftime('%Y-%m-%d')
      end
    end
    column "推送时间", :push_datetime do |new|
      if new.push_datetime != nil
        new.push_datetime.strftime('%Y年%m月%d日') << new.updated_at.strftime(" %H:%M %p")
      end
    end

    default_actions
  end

  form :partial => "form"

  controller do
    # This code is evaluated within the controller class

    def create
      # override the action here
      create! do |format|
        release = params[:news][:release]
        if release == "1" then
          @push_news = @news.create_push_news(:push_datetime => @news.push_datetime, :status => 0)
        else
          @news.update_attributes(:push_datetime => nil)
        end
        format.html
      end
    end

    def update
      update! do |format|
        release = params[:news][:release]
        p = release
        @push_news = @news.push_news
        if release == "1" then
          if @push_news != nil then
            @push_news.update_attributes(:push_datetime => @news.push_datetime, :status => 0)
          else
            @news.create_push_news(:push_datetime => @news.push_datetime, :status => 0)
          end
        else
          if @push_news != nil then
            @news.update_attributes(:push_datetime => nil)
            @news.push_news.destroy
          end
        end
        format.html
      end
    end

    def new
      @news = News.new
      @news.release = 0
      @news.is_top = 0
      t = Time.now
      @news.push_datetime = Time.utc(t.year, t.month, t.day+1, 9, 0, 0)
      new!
    end

  end
end
