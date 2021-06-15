module ApplicationHelper
    # ページごとの完全なタイトルを返す。
    def full_title(page_title = '')
      base_title = 'Forza App'
      if page_title.empty? #page_titleは空でしょうか？
        base_title
      else
        page_title + " | " + base_title
      end
    end
end
