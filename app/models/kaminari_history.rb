class KaminariHistory
  attr_accessor :histories,:page,:max_page

  def initialize(histories,page,max_count)
    @histories = histories
    @page = page
    @max_page = max_count / Kaminari.config.default_per_page
    @max_page += 1 if(max_count % Kaminari.config.default_per_page != 0)
  end

  def current_page
    return @page
  end

  def total_pages
    return @max_page
  end

  def limit_value
    Kaminari.config.default_per_page
  end
end
