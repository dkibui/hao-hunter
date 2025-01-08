module ListingsHelper
  def group_images(array)
    i = 0
    result = []
    prev_count = 0

    while i < array.length
      count = [ 3, 1, 2, 3, 1, 2, 1, 2, 4, 1, 2 ].reject { |n| n == prev_count }
                                            .sample
      result << array.slice(i, count)
      i += count
      prev_count = count
    end

    result
  end

  def render_grouped_images(images)
    grouped_images = group_images(images)

    content_tag :div, class: "image-groups" do
      grouped_images.each_with_index.map do |group, index|
        content_tag :div, class: "image-group group-of-#{group.size}s" do
          group.map do |image|
            content_tag :div, class: "image-wrapper" do
              image_tag(image, alt: "Image #{image}")
            end
          end.join.html_safe
        end
      end.join.html_safe
    end
  end
end
