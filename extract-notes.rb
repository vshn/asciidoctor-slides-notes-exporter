require 'asciidoctor'

if ARGV.length < 1 then
    puts 'Please provide the name of the file to parse'
    exit
end

file = ARGV[0]
if !File.exist?(file) then
    puts 'Cannot find file "' + file + '"'
    exit
end

doc = Asciidoctor.load_file ARGV[0], safe: :safe
notes = doc.find_by(role: :notes)

puts '= Speaker Notes'
puts ''

counter = 1

notes.each do |note|
    puts '== Slide ' + counter.to_s
    puts ''
    note.blocks.each do |block|
        if block.context == :paragraph
            puts block.source
            puts ''
        end
        if block.context == :ulist
            puts ''
            block.blocks.each do |item|
                puts '* ' + item.text
            end
            puts ''
        end
    end
    puts ''
    counter = counter + 1
end
