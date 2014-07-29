//
//  clipScreenShot.m
//  ClipAndShare
//
//  Created by Scott Twichel on 7/22/14.
//  Copyright (c) 2014 Pepper Gum Games. All rights reserved.
//

#import "clipScreenShot.h"


@implementation clipScreenShot

+(UIImage *)clipResultsImageFrom:(UIView *)main{
    
    /* Obtains Screen Dimensions */
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize screenSize = CGSizeMake(main.frame.size.height * screenScale,main.frame.size.width * screenScale);
    CGRect screenBounds = CGRectMake(0, 0, main.frame.size.height, main.frame.size.width);
    
    /* Capture the screenshot of entire view */
    UIGraphicsBeginImageContextWithOptions(screenSize, YES, 0.0);
    if ([main drawViewHierarchyInRect:screenBounds afterScreenUpdates:YES]){
        NSLog(@"Successfully draw the screenshot.");
    } else {
        NSLog(@"Failed to draw the screenshot.");
    }
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    /* Clip the image to the selected rectangle */
    CGRect clipRegion;
    
        // Device specific clipping regions
        //   The x, y, width, and height values should be based on a non retina view and the
        //   screenScale multiplier will adjust the clipRegion's size according to the resolution
    const CGRect iPhone35Inch = CGRectMake(45*screenScale, 34*screenScale, 290*screenScale, 251*screenScale);
    const CGRect iPhone4inch = CGRectMake(89*screenScale, 33*screenScale, 290*screenScale, 251*screenScale);
    const CGRect iPad = CGRectMake(137*screenScale, 158*screenScale, 532*screenScale, 473*screenScale);

    if ([UIDevice currentDevice].userInterfaceIdiom==UIUserInterfaceIdiomPad) {
        // clipRegion for ipad devices
        clipRegion = iPad;
        // Check the height to width ratio to determine screen size
    } else if(main.frame.size.height/main.frame.size.width > 1.5f) {
        // clipRegion for 4 inch devices
        clipRegion = iPhone4inch;
    } else {
        // clipRegion for 3.5 inch devices
        clipRegion = iPhone35Inch;
    }

    CGImageRef ref = screenshot.CGImage;
    CGImageRef mySubimage = CGImageCreateWithImageInRect (ref, clipRegion);
    UIImage *clippedScreenshot = [UIImage imageWithCGImage:mySubimage];
    
    /* --OPTIONAL--
     Give the clipped image rounded corners*/
        // Requires improting the roundUIImageCorners class
    clippedScreenshot = [roundUIImageCorners roundCornersOf:clippedScreenshot toHaveRadiusOf:20];

    /* --OPTIONAL--
     Save Image to disk*/
        // Requires importing the saveImageToFile class
    [saveImageToFile saveImage:clippedScreenshot];
    
    /* Return the clipped image */
    return clippedScreenshot;

}
@end
