//
//  UIColor+Names.h
//  UIColor+Names Example
//
//  Created by Sihao Lu on 9/17/13.
//  Copyright (c) 2013 Sihao Lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Names)

- (NSString *)possibleName;

- (NSArray *)possibleNamesWithinRanking:(NSUInteger)ranking;

- (NSArray *)allPossibleNames;

+ (UIColor *)colorWithName:(NSString *)name;

@end
