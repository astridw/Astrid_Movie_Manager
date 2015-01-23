module MoviesHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    link_to title, movies_path(:sort => column, :direction => direction), {:class => css_class}
  end
end
