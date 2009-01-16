# TODO: Use a .resume2 RC file for templates and resume file defaults.
class Resume2Application  
  DEFAULT_SOURCE_FILENAME = "resume.yml"
  SUPPORTED_FORMATS = ['pdf', 'rtf', 'txt']
  
  def run
    called_as = File.basename($0)
    @formats = formats_are(called_as)
    @template_file = templates_are
    @resume_file = source_is

    generator = Generator.new(@template_file, @resume_file)

    # TODO: Support output direction
    # @formats.each do |format|
    #   generator.write format, :stdout
    # end
  end
  
private
  def usage
    supported_formats = SUPPORTED_FORMATS.join(", ")
    puts "resume2[format] [format] path-to-template [resume.yml]"
    puts "  examples:"
    puts "    resume2 txt templates/fancy.markdown resume.yml"
    puts "    resume2txt templates/clean.markdown"
    puts "  Supported formats: " + supported_formats
      
    Process.exit!
  end
    
  def formats_are(filename)
    format_name = filename.split("2", 2)[1]
    if format_name.length == 0
      ARGV.size > 1 ? format_name = ARGV[0]  : usage
    end
    
    formats = case format_name
      when "all": SUPPORTED_FORMATS
      else [format_name]
    end
    
    return formats
  end
  
  def templates_are
    templates = case ARGV.size
      when 1: ARGV[0]
      when 2: @formats.include?(ARGV[0]) ? ARGV[1] : ARGV[0]
      when 3: ARGV[1]
      else usage
    end
    
    return templates
  end
  
  def source_is
    source = case ARGV.size
      when 1: DEFAULT_SOURCE_FILENAME
      when 2: @formats.include?(ARGV[0]) ? DEFAULT_SOURCE_FILENAME : ARGV[-1]
      else ARGV[-1]
    end
  end
end