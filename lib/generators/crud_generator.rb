class CrudGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  argument :model,      type: :string
  argument :type,       type: :string
  argument :attributes, type: :array
  
  attr_accessor :engine, :model_name

  def generate_init
    @model   = @model.underscore.split('/')
    
    @engine_name = @model[0] 
    @model_name  = @model[1]
    
    generate_files!

    case type
    when 'show'
      generate_show
    when 'show.js'
      generate_show_modal
    when 'no_show'
      generate_without_show
    end
  end

  private

  def generate_files!
    view_files = %w(
      _new.html.haml
      new.js.haml
      edit.js.haml
      _edit.html.haml
      create.js.haml
      destroy.js.haml
      update.js.haml
      _save.js.haml
      index.js.haml
      index.html.haml
      _index.html.haml
      _index_sidebar.html.haml
      _form.html.haml
    )

    view_files.each do |file|
      copy(view_files, @engine_name, @model_name, 'views')
    end

    copy(['controller.template'], @engine_name, @model_name, 'controllers')
    copy(['model.template'], @engine_name, @model_name, 'models') 
  end

  def generate_show_modal
    
    view_files = %w(
      show.js.haml
      _show_modal.html.haml
    )
    
    view_files.each do |file|
      copy(view_files, @engine_name, @model_name, 'views')
    end
  end

  def generate_show
    view_files = %w(
      show.html.haml
      _show.html.haml
      _show_sidebar.html.haml
    )

    view_files.each do |file|
      copy(view_files, @engine_name, @model_name, 'views')
    end
  end


  def copy(files_path, engine, model, folder)

    files_path.each do |file|
      case folder
      when 'views'
        template "#{folder}/#{file}", "engines/#{engine}/app/#{folder}/#{engine}/#{model.underscore.pluralize}/#{file}"
      when 'controllers'
        template  "#{folder}/#{file}", "engines/#{engine}/app/#{folder}/#{engine}/#{model.underscore.pluralize}_controller.rb"
      when 'models'
        template  "#{folder}/#{file}", "engines/#{engine}/app/#{folder}/#{engine}/#{model.underscore}.rb"
      else
      end
    end

  end

end