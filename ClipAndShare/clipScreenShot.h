//
//  clipScreenShot.h
//  ClipAndShare
//
//  Created by Scott Twichel on 7/22/14.
//  Copyright (c) 2014 Pepper Gum Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "saveImageToFile.h"
#import "roundUIImageCorners.h"

@interface clipScreenShot : NSObject
+(UIImage*)clipResultsImageFrom:(UIView*)screenShot;
@end
