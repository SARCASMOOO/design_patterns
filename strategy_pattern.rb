class Report
     attr_reader :title, :text
     attr_accessor :formatter

     def initialize(&formatter)
       @title = 'Monthly Report'
       @text =  ['Things are going', 'really, really well.']
       @formatter = formatter
     end

     def output_report()
       @formatter.call(self)
     end
end

HTML_FORMATTER = lambda do |context|
     puts('<html>')
     puts('  <head>')
     puts("    <title>#{context.title}</title>")
     puts('  </head>')
     puts('  <body>')
     context.text.each do |line|
       puts("    <p>#{line}</p>" )
     end
     puts('  </body>')
     puts('</html>')
   end

   report = Report.new do |context|
     puts("***** #{context.title} *****")
     context.text.each do |line|
    puts(line)
  end
end

    #Usage
    report = Report.new &HTML_FORMATTER
    report.output_report

#lambda proc
#     hello = lambda do
#       puts('Hello')
#       puts('I am inside a proc')
#     end
#
# name = 'John'
# proc = Proc.new do
#   name = 'Mary'
# end
#
# proc.call
# puts(name)
#
# hello2 = lambda {puts('Hello, I am inside a proc')}
#
#
# multiply = lambda {|x, y| x * y}
# puts(multiply.call(2, 50))
#
# def run_it
#   puts("Before the yield")
#   yield(24)
#   puts("After the yield")
# end
#
# # Proc connected to a do block
#
# #Explicit statement of proc
# def run_it_with_parameter(&block)
#   puts('Before the call')
#   block.call(24)
#   puts('After the call')
# end
#
# run_it_with_parameter do |x|
#   puts(x)
#   puts('Coming to you from inside the block')
# end
