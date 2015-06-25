scrivito.content_browser.filters =
  obj_class:
    field: '_obj_class'
    options:
      simple_images:
        title: 'Simple Images'
        value: 'Image'
        icon: 'image'
      adam_assets:
        title: 'ADAM Assets'
        options:
          all:
            value: ['AdamImage', 'AdamPdf', 'AdamVideo']
            options:
              images:
                title: 'Images'
                value: 'AdamImage'
                icon: 'image'
                options:
                  jpg:
                    title: 'JPG'
                    query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'starts_with', 'JPG')
                    icon: 'image'
                  png:
                    title: 'PNG'
                    query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'starts_with', 'PNG')
                    icon: 'image'
              pdf:
                title: 'Pdf'
                value: 'AdamPdf'
                icon: 'pdf'
              video:
                title: 'Video'
                value: 'AdamVideo'
                icon: 'video'
          cad_cam_systems:
            title: 'CAD CAM Systems'
            value: ['AdamImage', 'AdamVideo']
          instruments:
            query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'starts_with', 'PNG')
          hygiene_systems:
            title: 'Hygiene Systems'
            value: 'AdamPdf'
          imaging_systems:
            title: 'Imaging Systems'
            value: 'AdamImage'

#filters for scrivito_tag
scrivito.on 'load', ->
  filters =
    adam_images:
      obj_class:
        field: '_obj_class'
        options:
          images:
            title: 'Images'
            value: 'AdamImage'
            icon: 'image'
            options:
              jpg:
                title: 'JPG'
                query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'starts_with', 'JPG')
                icon: 'image'
              png:
                title: 'PNG'
                query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'starts_with', 'PNG')
                icon: 'image'
    adam_pdf:
      obj_class:
        field: '_obj_class'
        options:
          pdf:
            title: 'Pdf'
            value: 'AdamPdf'
            icon: 'pdf'
    adam_video:
      obj_class:
        field: '_obj_class'
        options:
          video:
            title: 'Video'
            value: 'AdamVideo'
            icon: 'video'
    adam_assets:
      obj_class:
        field: '_obj_class'
        options:
          adam_assets:
            title: 'ADAM Assets'
            expanded: true
            options:
              all:
                value: ['AdamImage', 'AdamPdf', 'AdamVideo']
                options:
                  images:
                    title: 'Images'
                    value: 'AdamImage'
                    icon: 'image'
                    options:
                      jpg:
                        title: 'JPG'
                        query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'starts_with', 'JPG')
                        icon: 'image'
                      png:
                        title: 'PNG'
                        query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'starts_with', 'PNG')
                        icon: 'image'
                  pdf:
                    title: 'Pdf'
                    value: 'AdamPdf'
                    icon: 'pdf'
                  video:
                    title: 'Video'
                    value: 'AdamVideo'
                    icon: 'video'
              cad_cam_systems:
                title: 'CAD CAM Systems'
                value: ['AdamImage', 'AdamVideo']
              instruments:
                query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'starts_with', 'PNG')
              hygiene_systems:
                title: 'Hygiene Systems'
                value: 'AdamPdf'
              imaging_systems:
                title: 'Imaging Systems'
                value: 'AdamImage'
    all_images:
      obj_class:
        field: '_obj_class'
        options:
          simple_images:
            title: 'Simple Images'
            value: 'Image'
            icon: 'image'
          images:
            title: 'Images'
            value: 'AdamImage'
            icon: 'image'
            options:
              jpg:
                title: 'JPG'
                query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'starts_with', 'JPG')
                icon: 'image'
              png:
                title: 'PNG'
                query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'starts_with', 'PNG')
                icon: 'image'
          

  bind_filters = ->
    $('[data-filter-cb]').each (index, element) ->
      element = $(element)

      filterName = element.data('filter-cb')

      if filter = filters[filterName]
        $(element).data('filters', filter)


  scrivito.on 'content', ->
    bind_filters()