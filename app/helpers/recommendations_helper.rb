module RecommendationsHelper
  def render_intro(arguments={}, &blk)
    render 'recommendations/cards/intro', arguments.merge(content: capture(&blk))
  end
end
