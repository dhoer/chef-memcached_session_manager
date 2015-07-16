def update_context(context_xml_file, manager_xml_file)
  context = IO.read(context_xml_file)
  manager = IO.read(manager_xml_file)
  if (context =~ /<Manager.*\/>/m).nil?
    # add
    context.gsub(/<\/Context>/, "/n#{manager}/n</Context>")
  else
    # overwrite
    context.gsub(/<Manager.*\/>/m, manager)
  end
  File.open(context_xml_file, "w") {|file| file.puts context }
end
