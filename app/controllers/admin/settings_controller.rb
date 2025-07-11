module Admin
  class SettingsController < Admin::ApplicationController
    before_action :set_setting

    def show
      render locals: {
        page: Administrate::Page::Show.new(dashboard, requested_resource)
      }
    end

    def edit
        render locals: {
            page: Administrate::Page::Form.new(SettingDashboard.new, Setting.instance)
        }
    end

    def update
        if requested_resource.update(setting_params)
            redirect_to admin_settings_path, notice: 'Settings were successfully updated.'
        else
            render :edit
        end
    end

    private

    def dashboard
      @dashboard ||= SettingDashboard.new
    end

    def set_setting
      @setting = Setting.instance
    end

    def requested_resource
      @setting
    end

    def setting_params
      params.require(:setting).permit(
        :app_name, :company_name, :email_address, :office_number, 
        :cell_number, :whats_app_number, :facebook_url, :twitter_url, 
        :linkedin_url, :application_status, :application_status_message,
        :application_version, :application_developer, :address
      )
    end
  end
end