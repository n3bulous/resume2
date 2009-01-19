class Generator
  def initialize(template_file, resume_file)
    begin
      yaml_data = YAML::load_file(resume_file)
  #    data = OpenStruct.new(yaml_data.to_hash)
      data = yaml_data.to_hash
      template = IO.read(template_file)
     
      @template_with_data = ERB.new(template, 0, ">").result(data.send(:binding))
      puts @template_with_data
      markdown = RDiscount.new(@template_with_data)
      # puts markdown.to_html
    rescue
      puts $!
    end
  end
  
  def write(output, format)
  end
end