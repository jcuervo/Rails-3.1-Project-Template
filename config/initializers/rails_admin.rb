#         ooooooooo.              o8o  oooo                 .o.             .o8                     o8o              
#         `888   `Y88.            `"'  `888                .888.           "888                     `"'              
#          888   .d88'  .oooo.   oooo   888   .oooo.o     .8"888.      .oooo888  ooo. .oo.  .oo.   oooo  ooo. .oo.   
#          888ooo88P'  `P  )88b  `888   888  d88(  "8    .8' `888.    d88' `888  `888P"Y88bP"Y88b  `888  `888P"Y88b  
#          888`88b.     .oP"888   888   888  `"Y88b.    .88ooo8888.   888   888   888   888   888   888   888   888  
#          888  `88b.  d8(  888   888   888  o.  )88b  .8'     `888.  888   888   888   888   888   888   888   888  
#         o888o  o888o `Y888""8o o888o o888o 8""888P' o88o     o8888o `Y8bod88P" o888o o888o o888o o888o o888o o888o 

# RailsAdmin config file. Generated on September 06, 2011 12:34
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|
  
  config.current_user_method { current_user } #auto-generated

  #  ==> Authentication (before_filter)
  # This is run inside the controller instance so you can setup any authentication you need to.
  # By default, the authentication will run via warden if available.
  # and will run on the default user scope.
  # If you use devise, this will authenticate the same as authenticate_user!
  # Example Devise admin
  # RailsAdmin.config do |config|
  #   config.authenticate_with do
  #     authenticate_admin!
  #   end
  # end
  # Example Custom Warden
  # RailsAdmin.config do |config|
  #   config.authenticate_with do
  #     warden.authenticate! :scope => :paranoid
  #   end
  # end
  
  #  ==> Authorization
  # Use cancan https://github.com/ryanb/cancan for authorization:
  # config.authorize_with :cancan
  
  # Or use a custom dead-stupid authorization rule:
  # config.authorize_with do
  #   redirect_to root_path unless warden.user.is_admin?
  # end
  
  # Use a specific role for ActiveModel's :attr_acessible :attr_protected
  # Default is :default
  # current_user is accessible in the block if you want to make it user specific.
  # config.attr_accessible_role { :default }
  
  #  ==> Dev. settings
  # Reload rails_admin with each request (can be slow) in development mode
  # config.reload_between_requests = true
  
  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false
  
  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 50
  
  #  ==> Included models
  # Add all excluded models here:
  # -- Ckeditor assets
  config.excluded_models = ["Ckeditor::Picture", "Ckeditor::AttachmentFile", "Ckeditor::Asset"]
  config.models do
    list do
      fields_of_type :datetime do
        date_format :short
      end
    end
    create do
      fields_of_type :text do
        ckeditor true
      end
    end
    edit do
      fields_of_type :text do
        ckeditor true
      end
    end
  end
  
  # Add models here if you want to go 'whitelist mode':
  # config.included_models << []
  
  # Application wide tried label methods for models' instances
  # config.label_methods << [:description] # Default is [:name, :title]
  
  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #   
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #     
  #     fields :name, :other_name do
  #       # Configuration here will affect all fields named [:name, :other_name], in the list section, for all included models
  #     end
  #     
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional. 
  # RailsAdmin will try his best to provide the best defaults for each section, for each field! 
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead. 
  # Less code is better code!
  config.model Page do
      # Here goes your cross-section field configuration for ModelName.
      object_label_method :title     # Name of the method called for pretty printing an *instance* of ModelName
      label 'Public Page'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
      label_plural 'Public Pages'      # Same plural
      weight -1                     # Navigation priority. Bigger is higher.
      # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
      # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
      # Section specific configuration:
      list do
        # filters [:title]  # Array of field names which filters should be shown by default in the table header
        items_per_page 20    # Override default_items_per_page
        sort_by :title           # Sort column (default is primary key)
        sort_reverse true     # Sort direction (default is true for primary key, last created first)
        # Here goes the fields configuration for the list view
        field :title
        field :created_at
        field :updated_at
      end
      show do
        # Here goes the fields configuration for the show view
      end
      export do
        # Here goes the fields configuration for the export view (CSV, yaml, XML)
      end
      edit do
        # Here goes the fields configuration for the edit view (for create and update view)
      end
      create do
        # Here goes the fields configuration for the create view, overriding edit section settings
      end
      update do
        # Here goes the fields configuration for the update view, overriding edit section settings
      end
    end
    
    config.model SubPage do
      object_label_method :title
      label "Public Sub-Page"
      label_plural "Public Sub-Pages"
      list do
        items_per_page 10
        sort_by :title
        
        field :title
        field :page
        field :created_at
        field :updated_at
      end
    end
  
# fields configuration is described in the Readme, if you have other question, ask us on the mailing-list! 

#  ==> Your models configuration, to help you get started!

end

# You made it this far? You're looking for something that doesn't exist! Add it to RailsAdmin and send us a Pull Request!