module GroupsHelper
  def group_list(groups)
    @content = content_tag(:span, '')
    groups.collect do |c|
      @content.concat(image_tag(c.icon.to_s))
      @content.concat(content_tag(:span, c.name))
      @content.concat(content_tag(:a, href: "groups/#{c.id}") do
                        'show'
                      end)
      @content.concat(content_tag(:a, href: 'group', method: :delete, data: { confirm: 'Are you sure?' }) do
                        'delete'
                      end)
    end
    @content.concat(:br)
    @content
  end
end
