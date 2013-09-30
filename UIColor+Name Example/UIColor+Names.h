//
//  UIColor+Names.h
//  UIColor+Names Example
//
//  Created by Sihao Lu on 9/17/13.
//  Copyright (c) 2013 Sihao Lu. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * A category on UIColor that can recognize color names. Color names are defined in CSS 3 standard.
 * Visit http://www.w3schools.com/cssref/css_colornames.asp to learn more.
 */
@interface UIColor (Names)

/**
 * Get the most possible name of current color.
 * @return The most possible name.
 */
- (NSString *)possibleName;

/**
 * Get the top "ranking" possible names of current color.
 * @param ranking Color names within this ranking value will be counted as possible names.
 * @return The top "ranking" possible names.
 */
- (NSArray *)possibleNamesWithinRanking:(NSUInteger)ranking;

/**
 * Get all the possible names of current color, ranked from the most possible to least possible.
 * @return All the possible names of current color.
 * @discussion If you need to get the least possible color name, just access the last object of the array returned.
 */
- (NSArray *)allPossibleNames;

/**
 * Initialize an `UIColor` object by name.
 * @param name The name of the color requested.
 * @return An `UIColor` object.
 * @discussion The name of color must conform to CSS 3 standard. Return `nil` if corresponding color of this name is not found.
 */
+ (UIColor *)colorWithName:(NSString *)name;

@end
