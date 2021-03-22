#ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
#  parts = html_tag.split('>', 2)
#  parts[0] += ' class="field_with_errors">'
#  (parts[0] + parts[1]).html_safe
#end



ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|   
    unless html_tag =~ /^<label/
        %{<div class="field_with_errors">#{html_tag}<label for="#{instance.send(:tag_id)}" 
        class="message"><br>#{instance.error_message.first}</label></div>}.html_safe 
    else
        %{<div class="field_with_errors">#{html_tag}</div>}.html_safe   
    end 
end