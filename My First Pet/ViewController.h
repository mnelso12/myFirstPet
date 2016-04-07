//
//  ViewController.h
//  My First Pet
//
//  Created by MadelynNelson on 4/5/16.
//  Copyright (c) 2016 Madelyn Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSTimer *timer;
    UIImageView *fish;
    UIImageView *wave;
    UIImageView *pebbles;
    UIImageView *water;
    UIImageView *toolbar;
    
    CGFloat fishSinCount; // fish going up and down a little
    
    CGFloat sw; // screen width
    CGFloat sh; // screen height
    
    CGFloat fishDx; // x velocity
    CGFloat fishDy; // y velocity
    CGFloat waveDx; // x velocity
    CGFloat waveDy; // y velocity
}

@end

