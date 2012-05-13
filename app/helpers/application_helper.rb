module ApplicationHelper
  def control_group(object, fields, &block)
    fields = [fields].flatten
    content = capture(&block)
    concat(%Q{<div class="control-group#{if object.respond_to?(:errors) && fields.any?{|field|object.errors[field].any?} then ' error' else '' end}">}.html_safe)
    concat(content)
    concat("</div>".html_safe)
  end

  def inline_errors(form_builder, field)
    if form_builder.object.errors[field].any?
      %Q{<span class="help-inline">#{form_builder.error_message_on(field)}</span>}.html_safe
    else
      ''
    end
  end
end
