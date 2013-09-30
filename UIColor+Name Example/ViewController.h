//
//  ViewController.h
//  UIColor+Name Example
//
//  Created by Sihao Lu on 9/17/13.
//  Copyright (c) 2013 Sihao Lu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <iCarousel.h>

@class ISColorWheel;
@interface ViewController : UIViewController <iCarouselDataSource, iCarouselDelegate>

@property (strong, nonatomic) ISColorWheel *colorWheel;
@property (weak, nonatomic) IBOutlet iCarousel *carousel;

@end
