require 'niceql'

sql = STDIN.read
puts Niceql::Prettifier.prettify_sql(sql)
