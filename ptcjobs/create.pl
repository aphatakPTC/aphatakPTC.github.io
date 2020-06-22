#!/usr/bin/perl -w

open AUTO, "source.txt" or die "Could not open auto.txt";

@auto_contents = <AUTO>;

open FWRITE, ">content.html" or die "Could not open content.html to write";

print FWRITE "<!DOCTYPE html>\n";
print FWRITE "<html>\n";
print FWRITE "<head>\n";
print FWRITE "  <link rel=\"stylesheet\" href=\"styles.css\">\n";
print FWRITE "</head>\n";
print FWRITE "<body>\n";
print FWRITE "<h1>List of currently open job positions at PTC Inc. </h1>\n";
print FWRITE "<table>\n";
print FWRITE "  <tr>\n";
print FWRITE "    <th>Job Title (click to apply)</th>\n";
print FWRITE "    <th>Experience</th>\n";
print FWRITE "    <th>Job Location</th>\n";
print FWRITE "  </tr>\n";

foreach $test_line (@auto_contents)
{

	$test_line =~ s/\r|\n//g;  #remove new line/carriage return from line
	
	@s_contents = split(/,/, $test_line);
	
	$job_title = $s_contents[0];
	$experience = $s_contents[1];
	$location = $s_contents[2];
	$apply_url = $s_contents[3];
	
	print FWRITE "<tr>\n";
    print FWRITE "<td><a href=\"$apply_url\" target=\"_blank\">$job_title</a></td>\n";
    print FWRITE "<td>$experience</td>\n";
	print FWRITE "<td>$location</td>\n";
	print FWRITE "</tr>\n";

}

print FWRITE "</table>\n";
print FWRITE "</body>\n";
print FWRITE "</html>\n";

close FWRITE;

close AUTO;