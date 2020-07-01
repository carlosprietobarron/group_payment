module GroupsHelper
  def group_list(groups)
    @content = content_tag(:span, '')
    groups.collect do |c|
      @content.concat(
        content_tag(:div, class: 'group-card') do
          concat(image_tag(c.icon.to_s) + ' ' +
                 content_tag(:span, c.name) + ' ' +
                 content_tag(:a, href: "groups/#{c.id}") do
                   'show'
                 end)
        end
      )
    end
    @content
  end

  def select_icon
    icons = {"car" => "icons/car.png", \
      "travel" => "icons/case.png", \
      "clothes" => "icons/clothes.png", \
      "grocery" => "icons/grocery.png", \
      "home" => "icons/home.png", \
      "office" => "icons/office.png", \
      "transport" => "icons/transport.png"}

    @content = content_tag(:span, '')
    icons.each do |icon|
      @content.concat(
        content_tag(:div, class: "form-radio-btn-item") do
            concat(
              content_tag(:div, class: "card-body-rad form-inline card-radio-btn") do
                radio_button_tag(:icon, icon[1])+ " " +
                image_tag("#{icon[1]}")
              end
            )
          end
      ) #content.tag
    end  
    @content
  end
end
