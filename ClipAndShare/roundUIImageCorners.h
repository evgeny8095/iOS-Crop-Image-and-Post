//
//  roundUIImageCorners.h
//  ClipAndShare
//
//  Created by Scott Twichel on 7/23/14.
//  Copyright (c) 2014 Pepper Gum Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface roundUIImageCorners : NSObject
+(UIImage*)roundCornersOf:(UIImage*)image toHaveRadiusOf:(float)radius;

@end
