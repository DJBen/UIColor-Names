//
//  UIColor+Names.m
//  UIColor+Names Example
//
//  Created by Sihao Lu on 9/17/13.
//  Copyright (c) 2013 Sihao Lu. All rights reserved.
//

#import "UIColor+Names.h"

#import <UIColor+HexString.h>

@implementation UIColor (Names)

static NSDictionary *colorNames = nil;

- (NSString *)possibleName {
    return [self possibleNamesWithinRanking:1][0];
}

- (NSArray *)allPossibleNames {
    return [self possibleNamesWithinRanking:NSUIntegerMax];
}

- (NSArray *)possibleNamesWithinRanking:(NSUInteger)ranking {
    if (!colorNames) [UIColor initializeColorNames];
    
    __block NSMutableDictionary *colorStandardDeviations = [[NSMutableDictionary alloc] initWithCapacity:colorNames.count];
    [colorNames enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        UIColor *currentColor = [UIColor colorWithHexString:obj];
        CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
        [self getRed:&red green:&green blue:&blue alpha:&alpha];
        
        CGFloat refRed = 0.0, refGreen = 0.0, refBlue = 0.0, refAlpha = 0.0;
        [currentColor getRed:&refRed green:&refGreen blue:&refBlue alpha:&refAlpha];
        
        CGFloat standardDeviation = sqrtf((powf(refRed - red, 2) + powf(refGreen - green, 2) + powf(refBlue - blue, 2)) / 3);
        colorStandardDeviations[@(standardDeviation)] = key;
    }];
    NSArray *orderedStandardDeviations = [[colorStandardDeviations allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSNumber *value1 = obj1;
        NSNumber *value2 = obj2;
        return [value1 compare:value2];
    }];
    NSMutableArray *orderedColorNames = [[NSMutableArray alloc] initWithCapacity:colorNames.count];
    [orderedStandardDeviations enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [orderedColorNames addObject:colorStandardDeviations[obj]];
        if (idx + 1 >= ranking) *stop = YES;
    }];
    return [orderedColorNames copy];
}

+ (UIColor *)colorWithName:(NSString *)name {
    if (!colorNames) [UIColor initializeColorNames];
    NSString *colorHexValue = colorNames[name];
    if (!colorHexValue) return nil;
    return [UIColor colorWithHexString:colorHexValue];
}

+ (void)initializeColorNames {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"UIColorNames" ofType:@"plist"];
    colorNames = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
}

@end
