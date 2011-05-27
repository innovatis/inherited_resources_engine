require 'inherited_resources'

module InheritedResourcesEngine
  class Engine < ::Rails::Engine
  end
end

class ActionController::Base
  def self.inherit_resources
    super
    class_eval do
      define_method :resource, proc {
        if params[:version_at]
          z = end_of_association_chain.send(method_for_find, params[:id])
          ver = z.version_at(Time.parse(params[:version_at]))
          unless ver
            flash[:error] = "This #{resource_instance_name.to_s.humanize.downcase} did not exist at #{params[:version_at]}. Showing the initial version instead."
            ver = z.versions.second.try(:reify) || z
          end
          ver
        elsif params[:version_id]
          Version.where(:item_type => resource_class.name, :item_id => params[:id], :id => params[:version_id]).first.reify
        else
          get_resource_ivar || set_resource_ivar(end_of_association_chain.send(method_for_find, params[:id]))
        end
      }
    end
  end
end 
