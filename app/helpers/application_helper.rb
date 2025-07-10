module ApplicationHelper
  def app_settings
    @app_settings ||= Setting.instance
  end
  
  def application_status_alert
    return unless app_settings.maintenance? || app_settings.offline?
    
    content_tag(:div, class: "alert alert-#{app_settings.maintenance? ? 'warning' : 'danger'}") do
      app_settings.application_status_message.presence || 
        "Application is currently #{app_settings.application_status.downcase}"
    end
  end
  def render_field(field, f)
      render(
          partial: "admin/fields/#{field.class.to_s.demodulize.underscore}/form",
          locals: { field: field, f: f }
      )
      rescue ActionView::MissingTemplate
          render partial: "admin/fields/base/form", locals: { field: field, f: f }
      end
  end
