class ApiController < ApplicationController
  include Api

  def import
    Scrivito::Workspace.current = Scrivito::Workspace.find_by_title('test')
    
    status = ''
    obj_ids = %w(54692 54690 54688 54686)
    
    obj_ids.each do |id|
      obj = get_entity_from_adam id
      obj_class, file_type = get_class_by_file_type obj
      unless AdamAsset.find_by_adam_id id
        Obj.create(_obj_class: obj_class, adam_id: id, file_type: file_type)
        status << "#{obj_class} with id #{id} has been imported to scrivito.\n"
      end
    end
    
    status = 'Nothing to import' if status.empty?

    render text: status
  end
end