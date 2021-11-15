module ActsAsCsv

    class CsvRow
        attr_accessor :headers, :contents
        def initialize
            @contents = []
        end
        def method_missing(name, *args)
            pos = @headers.index name.to_s
            @contents[pos] if pos
        end
    end

    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods   
        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                r = CsvRow.new()
                r.headers = @headers
                r.contents = row.chomp.split(', ')
                @csv_contents << r
            end
        end
    end

    def each (&block)
        @csv_contents.each(&block)
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
        read 
    end
end

class RubyCsv  
    include ActsAsCsv
    acts_as_csv
end

csv = RubyCsv.new
puts "Header and content:"
puts csv.headers.inspect
puts csv.csv_contents.inspect
puts
puts "Each row:"
puts csv.each {|row| puts row.contents.inspect}
puts
puts "Acessing all names:"
puts csv.each {|row| puts "#{row.Language} was born in #{row.Release}"}
