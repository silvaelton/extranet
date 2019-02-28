class CrudGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :model, type: :string
  argument :type,  type: :string
  
  def generate_init
    case type
    when 'show.js'
      generate_with_show_modal
    when 'show.html'
      generate_without_show_modal
    else
      generate_without_show
    end
  end

  private

  def generate_without_show_modal
    files = %w(
                index.html.haml
                _index.html.haml
                _index_sidebar.html.haml
                index.js.haml
                show.html.haml
                _show_modal.html.haml
                _show.html.haml
                _show_sidebar.html.haml
                _new.html.haml
                _edit.html.haml
                update.js.haml
                create.js.haml
                destroy.js.haml
                _save.js.haml
              )

    generate!(files, model)    
  end

  def generate_without_show
    files = %w(
                index.html.haml
                _index.html.haml
                _index_sidebar.html.haml
                index.js.haml
                _new.html.haml
                _edit.html.haml
                update.js.haml
                create.js.haml
                destroy.js.haml
                _save.js.haml
              )

    generate!(files, model)
  end 

  def generate_with_show_modal
    files = %w(
                index.html.haml
                _index.html.haml
                _index_sidebar.html.haml
                index.js.haml
                show.html.haml
                show.js.haml
                _show_modal.html.haml
                _show.html.haml
                _show_sidebar.html.haml
                _new.html.haml
                _edit.html.haml
                update.js.haml
                create.js.haml
                destroy.js.haml
                _save.js.haml
              )

    generate!(files, model)
  end


  def generate!(files_path, model)
    files_path.each do |file|
      copy_file "views/#{file}", "engines/#{engine}/app/#{engine}/views/#{model.underscore}/#{file}"
    end

  end

  def generate_controller
    copy_file "controller/#{file}", "engines/#{engine}/app/#{engine}/controllers/#{model.underscore}/#{file}"
  end
  
  def generate_model
    copy_file "model/#{file}", "engines/#{engine}/app/#{engine}/models/#{model.underscore}/#{file}"
  end
end