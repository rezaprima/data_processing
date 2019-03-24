#!/usr/bin/env ruby
filename=ARGV.first
headers=[]
out_header = %w(Identifier CompanyName Country SectorName Quarter Value)
puts out_header.join("\t")
File.foreach(filename).with_index do |line, line_num|
	fields = line.split("\t")
	if(line_num==0) then
		headers = fields
	else
		ticker,name,negara,sectorname,industryname=fields[0..4]
		# ticker,name,negara,sectorname,industryname,sector_code,industry_group_code,industry_code=fields[0..7]
		fields.each_with_index do |field, index|
			if(index>=5) then
			# if(index>=8) then
				quarter=headers[index].strip
				puts [ticker,name,negara,sectorname,quarter,field.strip].join("\t") #unless quarter.nil?
			end
		end
	end
end
