require 'niceql'

if ARGV.length != 1
  puts "Usage: bundle exec #{$0} <base file name>"
  exit(-1)
end

name = ARGV[0]

query = File.read("inputs/#{name}.sql")
params = File.read("inputs/#{name}.params")

parsed_params = params.split(",").map { |p| p.split("=").last.strip }
sql = parsed_params.each_with_index.reduce(query) { |q, (param, index)| q.sub("$#{index + 1}", param) }

puts Niceql::Prettifier.prettify_sql(sql)
