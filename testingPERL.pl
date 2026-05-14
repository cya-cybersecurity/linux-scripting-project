#!/usr/bin/perl


#first file should give the variable values from the awkoutput, second file should be where to send the html format to
$inputFile = $ARGV[0];
$outputFile = $ARGV[1];
@statistics = ();

#open file and save contents to an array
open($openedFile, '<', $inputFile) or die "$inputFile cannot be opened";
while($line = <$openedFile>)
{
        chomp $line;
        push @statistics, $line;
}

close $openedFile;

#assign the variables from file
$weekstolose = pop @statistics;
$calories = pop @statistics;
$desiredweight = pop @statistics;
$age = pop @statistics;
$gender = pop @statistics;
$bmi = pop @statistics;
$height = pop @statistics;
$currentweight = pop @statistics;
$name = pop @statistics;

#make the calculation for calories of each nutrient
$fatsproteins = ($calories0.3);
$carbs = ($calories0.4);


#open file to put html format into
open(my $out, '>', $outputFile) or die "$outputFile cannot be opened";


print $out <<END_TEXT;
<!DOCTYPE html>
<html>
<head>
        <title>html</title>
</head>
<body>
        <h1>Information</h1>
        <p>
        Name: $name<br>
        Current Weight: $currentweight lbs<br>
        Desired Weight: $desiredweight lbs<br>

        Weeks required to meet weight loss goal: $weekstolose<br>
        </p>
        <h1>Nutrients</h1>
        <p>
        You will need to eat a variety of nutrients to remain healthy and lose weight. In general its good to have 40% of calories you consume to be carbohydrates,
        30% to be proteins, and the last 30% to be fats. For your weight loss journey the recommended intake will be as follows:
        </p>
        <p>
        Proteins: $fatsproteins calories<br>Carbohydrates: $carbs calories<br>Fats: $fatsproteins calories
        </p>
</body>
</html>
END_TEXT