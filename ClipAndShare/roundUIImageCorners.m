//
//  roundUIImageCorners.m
//  ClipAndShare
//
//  Created by Scott Twichel on 7/23/14.
//  Copyright (c) 2014 Pepper Gum Games. All rights reserved.
//

#import "roundUIImageCorners.h"

@implementation roundUIImageCorners
+(UIImage *)roundCornersOf:(UIImage *)image toHaveRadiusOf:(float)radius{
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    
    imageLayer.contents = (id)image.CGImage;
    imageLayer.masksToBounds = YES;
    imageLayer.cornerRadius = radius;
    
    UIGraphicsBeginImageContext(image.size);
    [imageLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *roundedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return roundedImage;
    
}
@end
