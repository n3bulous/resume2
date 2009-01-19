# Resume2 ##

## Description ##

Resume2 is a command line tool to manage your resume from a central data (YAML) file.  Why YAML? Because no one should ever have to write an XML file.

Right now it will process a Markdown file and merge the data into it. From there you can create a PDF or HTML via TextMate.  Plenty of refinements before I even contemplate labeling it ready for public consumption.

## Installation ##

sudo gem install n3bulous-resume2 --source=http://gems.github.com

## Usage ##

Initial instructions:

1. Create a resume.yml file, nesting your data as appropriate to capture the data, basically a collection of hashes and arrays:

		name:
			given: Kevin
			surname: McFadden

		skills:
		  brief:
		    - [ "Databases", "MySQL, Oracle 8i/9i, Informix 7, PostgreSQL" ]
		    - [ "Programming", "Ruby, PHP, Java, BASH, Forth, Perl, C, C++, Objective C" ]
		    - [ "Operating Systems", "Linux, Solaris, OS X, HP-UX, MS Windows" ]
		    - [ "Miscellaneous", "Scrum, XP, Subversion, Git, CVS, XHTML, XML, XML-RPC, AJAX" ]
	
2. Create a [Markdown](http://daringfireball.net/projects/markdown/syntax) template to style the resume.

		<div style="font-style: bold; font-size: 1.4em; text-align: center"><%= "#{name.given} #{name.surname}" %></div>
		<div style="text-align: center">
		<p>
		<%= "#{address.street}, #{address.city}, #{address.state}, #{address.postal.to_s}" %><br/>
		<%= "#{contact.email} | #{contact.mobile}" %><br/>
		<%= contact.urls.linkedin %><br/>
		</p>
		</div>

		<table>
		<% skills.brief.each do |a| %>
			<tr>
				<th><%= a[0] %></th>
				<td><%= a[1] %></td>
			</tr>
		<% end %>
		</table>

3. Combine the two with resume2 to generate the Markdown output.

		resume2 markdown resume.markdown.erb resume.yml > resume.markdown

4. Right now I'm using [MultiMarkDown](http://fletcherpenney.net/multimarkdown/multimarkdown_bundle_for_textm/) with TextMate to generate the HTML/PDF, but I'm aiming to streamline the process and avoid using TextMate in my process.  MultiMarkDown supports CSS allowing for better styling.

MultiMarkDown is a Perl script, so the final version may require its installation...

## TODO ##

* .resume2rc config file to specify defaults for resume file paths, resume.yml, and theme.
* Refine 
* Refactor generator to handle the different outputs.
* Support direct, PDF output.
* Support RTF templates.
* Support XHTML, Markdown, and text templates.  (essentially done, needs cleanup)
* Full examples.

## License ##

Resume2 is free software; it is released under a BSD-style license that allows you to do as you wish with it as long as you don’t attempt to claim it as your own work.  

By downloading this software, you agree to NOT blame the author if you fail to get a job, fail to apply for a job, or continue living in your mother's basement or garage.  The author is also not responsible for any typos, either mine or yours.  Use at your own risk.  Software is not approved for use in mission critical systems.
