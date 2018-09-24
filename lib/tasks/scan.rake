require 'rubygems'
require 'bundler/setup'

namespace :scan do
  COUNT_FILES = 0
  COUNT_LINES = 1

  def scan(path, lines, counter = 0)
    entries = Dir.new(path).reject { |x| %w[. ..].include? x }
    entries.map! { |x| path.join x }
    entries.reduce(counter) do |count, item|
      if File.directory? item
        scan(item, lines, count)
      elsif item.extname == '.rb'
        print item
        if lines == 1
          size = open(item).read.count("\n")
          puts " - #{size}"
          count + size
        else
          puts
          count +1
        end
      else count
      end
    end
  end

  desc 'Возвращает кол-во Ruby-файлов в указанной папке и всех вложенных'
  task :files, [:path] do |_t, arg| # >rake scan:files['.']
    path = Pathname.new(arg[:path]?arg[:path]:'.') # Если путь не указан явно, использует текущую директорию
    puts "-\n#{scan(path,COUNT_FILES)} files" 
  end

  desc 'Возвращает кол-во строк всех Ruby-файлов в указанной папке и всех вложенных'
  task :lines, [:path] do |_t, arg| # >rake scan:lines['.']
    path = Pathname.new(arg[:path]?arg[:path]:'.') # Если путь не указан явно, использует текущую директорию
    puts "-\n#{scan(path,COUNT_LINES)} lines"
  end
end
