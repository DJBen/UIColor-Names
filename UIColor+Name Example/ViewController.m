//
//  ViewController.m
//  UIColor+Name Example
//
//  Created by Sihao Lu on 9/17/13.
//  Copyright (c) 2013 Sihao Lu. All rights reserved.
//

#import "ViewController.h"

#import "UIColor+Names.h"
#import <ISColorWheel.h>

@interface ViewController () <ISColorWheelDelegate> {
    NSArray *similarColors;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.colorWheel = [[ISColorWheel alloc] initWithFrame:CGRectMake(10, 54, 300, 300)];
    self.colorWheel.delegate = self;
    [self.view addSubview:self.colorWheel];
    
    [self.carousel setType:iCarouselTypeLinear];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)colorWheelDidChangeColor:(ISColorWheel *)colorWheel {
    similarColors = [colorWheel.currentColor allPossibleNames];
    [self.carousel reloadData];
    [self.carousel scrollToItemAtIndex:1 animated:YES];
}

#pragma mark - iCarousel
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return (similarColors)?similarColors.count + 1:1;
    
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view {
    NSString *colorName;
    UIColor *color;
    if (index == 0) {
        colorName = @"Selected";
        color = self.colorWheel.currentColor;
    } else {
        colorName = similarColors[index - 1];
        color = [UIColor colorWithName:colorName];
    }
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        UILabel *colorNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 100, 40)];
        [colorNameLabel setTextAlignment:NSTextAlignmentCenter];
        [colorNameLabel setTag:1023];
        [colorNameLabel setFont:[UIFont systemFontOfSize:12]];
        [view addSubview:colorNameLabel];
        [colorNameLabel setTextColor:[UIColor colorWithName:[[color allPossibleNames] lastObject]]];
        [colorNameLabel setText:colorName];
    } else {
        UILabel *colorNameLabel = (UILabel *)[view viewWithTag:1023];
        [colorNameLabel setText:colorName];
        [colorNameLabel setTextColor:[UIColor colorWithName:[[color allPossibleNames] lastObject]]];

    }
    view.backgroundColor = color;
    return view;
}

@end
