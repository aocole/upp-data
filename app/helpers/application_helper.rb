module ApplicationHelper
  def control_group(object, fields, options={}, &block)
    fields = [fields].flatten
    default_options = {
      :class => "control-group#{if object.respond_to?(:errors) && fields.any?{|field|object.errors[field].any?} then ' error' else '' end} #{options.delete(:class)}"
    }
    options = options.merge(default_options)
    content_tag(:div, options, &block)
  end

  def inline_errors(form_builder, field)
    if form_builder.object.errors[field].any?
      %Q{<span class="help-inline">#{form_builder.error_message_on(field)}</span>}.html_safe
    else
      ''
    end
  end
end
