scrivito.content_browser.filters =
  obj_class:
    field: '_obj_class'
    options:
      assets:
        title: 'Assets'
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
                    query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'equals', 'JPG')
                    icon: 'image'
                  png:
                    title: 'PNG'
                    query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'equals', 'PNG')
                    icon: 'image'
              pdf:
                title: 'Pdf'
                value: 'AdamPdf'
                icon: 'pdf'
              video:
                title: 'Video'
                value: 'AdamVideo'
                icon: 'video'
          corporate:
            title: 'Corporate'
            query: scrivito.obj_where('_obj_class', 'equals', ['AdamImage', 'AdamPdf']).and_not('file_type', 'equals', 'JPG')
            options:
              topics:
                title: 'Topics'
                query: scrivito.obj_where('_obj_class', 'equals', ['AdamImage', 'AdamPdf']).and_not('file_type', 'equals', 'JPG')
                options:
                  sirona_workflows:
                    title: 'Sirona Workflows'
                    query: scrivito.obj_where('_obj_class', 'equals', ['AdamImage', 'AdamPdf']).and_not('file_type', 'equals', 'JPG')
          cad_cam_systems:
            title: 'CAD CAM Systems'
            value: 'AdamVideo'
            options:
              cerec_implantologie:
                title: 'CEREC Implantologie'
                value: 'AdamVideo'
                options:
                  general:
                    title: 'General'
                    value: 'AdamVideo'
          imaging_systems:
            title: 'Imaging Systems'
            query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'equals', 'JPG')
            options:
              software:
                title: 'Software'
                query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'equals', 'JPG')
                options:
                  sidexis_4:
                    title: 'SIDEXIS 4'
                    query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'equals', 'JPG')


#filters for scrivito_tag
scrivito.on 'load', ->
  filters =
    images:
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
                query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'equals', 'JPG')
                icon: 'image'
              png:
                title: 'PNG'
                query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'equals', 'PNG')
                icon: 'image'
    pdf:
      obj_class:
        field: '_obj_class'
        options:
          pdf:
            title: 'Pdf'
            value: 'AdamPdf'
            icon: 'pdf'
    video:
      obj_class:
        field: '_obj_class'
        options:
          video:
            title: 'Video'
            value: 'AdamVideo'
            icon: 'video'
    assets:
      obj_class:
        field: '_obj_class'
        options:
          assets:
            title: 'Assets'
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
                        query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'equals', 'JPG')
                        icon: 'image'
                      png:
                        title: 'PNG'
                        query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'equals', 'PNG')
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
                query: scrivito.obj_where('_obj_class', 'equals', 'AdamImage').and('file_type', 'equals', 'PNG')
              hygiene_systems:
                title: 'Hygiene Systems'
                value: 'AdamPdf'
              imaging_systems:
                title: 'Imaging Systems'
                value: 'AdamImage'
          

  bind_filters = ->
    $('[data-filter-cb]').each (index, element) ->
      element = $(element)

      filterName = element.data('filter-cb')

      if filter = filters[filterName]
        $(element).data('filters', filter)


  scrivito.on 'content', ->
    bind_filters()