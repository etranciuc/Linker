# custom extensions to core classes
Dir.glob("lib/extensions/*.rb").each { |ext| require ext[4..-4] }
