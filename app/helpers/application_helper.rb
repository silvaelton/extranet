module ApplicationHelper
  include Pagy::Frontend

  def link_to(name = nil, options = nil, html_options = nil, &block)
    html_options, options, name = options, name, block if block_given?
    options ||= {}
    html_options ||= {}

    # => Quando usuario nao possui permissao
    if current_user.present? && current_user.administrator
      user_permitted = true
    else
      attr_options = options.present? ? options : nil

      permissions = Pivotal::EnginePermission.where(url: attr_options, status: true) rescue nil

      if current_user.present? && permissions.present?
        user_permissions = Pivotal::UserPermission.where(user_id: current_user.id).where(permission_id: permissions)
        user_permitted   = user_permissions.present? ? true : false
      else
        user_permitted = true
      end
    end

    if !user_permitted
      if html_options[:class].present?
        html_options[:class] += " unpermitted"
      else
        html_options[:class] = " unpermitted"
      end

      html_options[:remote] = true

      url = main_app.unpermitted_path
    else
      url = url_for(options)
    end

    html_options[:data] = html_options[:data].present? ? html_options[:data] : {}
    html_options[:data][:disable_with] = I18n.t(:disable_with)

    html_options = convert_options_to_data_attributes(options, html_options)

    html_options["href".freeze] ||= url

    content_tag("a".freeze, name || url, html_options, &block)
  end
end
