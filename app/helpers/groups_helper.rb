module GroupsHelper
  def group_list(groups)
    @content = content_tag(:span, '')
    groups.collect do |c|
      @content.concat(
                  content_tag(:div, :class => "group-card") do
                    concat(image_tag(c.icon.to_s) + " " +
                           content_tag(:span, c.name) + " " +
                           content_tag(:a, href: "groups/#{c.id}") do
                                'show'
                           end 
                    )                    
                  end
                )
    end

    @content
  end
end
