class ApplicationController < ActionController::Base
    before_action :authenticate_customer!,except: [:top]
    before_action :configure_permitted_parameters, if: :devise_controller?

    def forbit_login_customer
        if @current_customer
            redirect_to root_path
        end
    end

    def after_sign_in_path_for(resource)

        case resource
        when Admin
            admin_root_path
        when Customer
            customer_path(:id)
        end
    end

    def after_sign_up_path_for(resource)
        case resource
        when Admin
            admins_root_path
        when Customer
            customers_path
        end
    end

    private
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :telephone_number, :postal_code, :address])
    end
end
