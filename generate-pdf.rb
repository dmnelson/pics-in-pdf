#!/usr/bin/env ruby

require 'prawn'

abort "Usage: generate-pdf <pdf_file_name> <img-folder>." unless ARGV.size == 2

pdf = ARGV[0]
folder = ARGV[1]

Prawn::Document.generate(pdf, :page_size => [820, 620], :margin => 10, :layout => :portrait) do
  images = Dir.glob("#{folder}/*.{png,jpg,jpeg}", File::FNM_CASEFOLD).sort
  images.each do |image_file|
    start_new_page if image_file != images.first 
    text image_file
    image image_file, :fit => [800, 570] 
  end
end
