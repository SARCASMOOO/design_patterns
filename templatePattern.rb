# Template method pattern
# Template Method pattern is to build an abstract base class with a skeletal method (template method)
#
# This skeletal method (also called a template method) drives the bit of the processing
# that needs to vary, but it does so by making calls to abstract methods, which are
# then supplied by the concrete subclasses.
# We pick the variation that we want by selecting one of those concrete subclasses.

class Report
     attr_reader :title, :text
     attr_accessor :formatter

     def initialize(formatter)
       @title = 'Monthly Report'
       @text =  ['Things are going', 'really, really well.']
       @formatter = formatter
     end

     def output_report()
       @formatter.output_report(self)
     end
   end

   class HTMLFormatter
     def output_report(context)
       puts('<html>')
       puts('  <head>')
       # Output The rest of the report ...

       puts("    <title>#{context.title}</title>")
       puts('  </head>')
       puts('  <body>')
       context.text.each do |line|
         puts("    <p>#{line}</p>")
       end
       puts('  </body>')

       puts('</html>')
     end
   end

   class PlainTextFormatter
     def output_report(context)
       puts("***** #{context.title} *****")
       context.text.each do |line|
         puts(line)
       end
     end
   end

   #Invoke
   report = HTMLReport.new
   report.output_report
