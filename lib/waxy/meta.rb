module Waxy

  # Instances of Meta contain attributes
  # that describe the visual appearance of a single hexagon.
  class Meta

    ## -- Attributes for solid hex layouts

    # Hex border SVG stroke
    attr_accessor :stroke

    # Hex fill
    # not applicable to all templates 
    attr_accessor :fill
   
    # a URL for the whole hexagon
    # not applicable to all templates
    attr_accessor :link

    # title value for hex <a>
    attr_accessor :link_title 

    ## -- Attributes for "pie" layouts
     
    # Array of 6 * (0.0..1.0)
    #  scales "pie" slices
    attr_accessor :size

    # An Array (0..5) of links, one for each slice of 'Pie' 
    attr_accessor :pie_links

    # An Array (0..5) of SVG color values  
    attr_accessor :colors

    # @return [Array]
    #   6 strings with SVG color= values
    def colors
      @colors.nil? ? Waxy::COLORS.values : @colors
    end

    def pie_links
      @pie_links.nil? ? [] : @pie_links 
    end

    # Describes how "full" a pie hexagon is 
    def sum_size
      size.sum
    end
   
    #  Helper methods
     
    def hex_link_start
      return nil unless link
      [
        '<a href="' + link + '"',
        'class="waxy__link"',
        '>'
      ].compact.join(' ')
    end

    def hex_link_title
      return nil unless link_title 
      "<title>#{link_title}</title>"
    end

    def hex_link_end
      '</a>' if link
    end

  end
end
