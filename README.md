UIColor-Names
=============

A handy category on UIColor that could find the name of any color.

What does it do?
-------------
1.  Find the name for any color.
    
        UIColor *color = [UIColor color...]; // Your color
        NSLog("Name = %@", [color possibleName]);

2. List an array of colors from the best match color with your color to the worst match.
    
        UIColor *color = [UIColor color...]; // Your color
        NSLog("Name = %@", [color allPossibleNames]);
    
    or

        NSLog("Name = %@", [color possibleNamesWithRanking:10]); // Get the top 10 best-matched color with your color

3.  Initialize a color object from name

        UIColor *color = [UIColor colorWithName:@"Snow"];

Usage
-------------
Copy the UIColor+Names folder to your project. Add `#import "UIColor+Names.h"` to the headers of your source code.

Screenshot
-------------
![https://raw.github.com/DJBen/UIColor-Names/master/Screenshot%202013.09.30%2013.56.00.png]()
