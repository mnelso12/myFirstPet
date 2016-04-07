//
//  ViewController.m
//  My First Pet
//
//  Created by MadelynNelson on 4/5/16.
//  Copyright (c) 2016 Madelyn Nelson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)collision
{
    // handle fish
    fishSinCount += .075;
    
    if ([self fishCollidesWithSideWall])
    {
        fishDx *= -1; // switch x direction
        fish.transform = CGAffineTransformMakeScale(fishDx, 1); // flip direction fish is facing
    }
    if ([self fishCollidesWithTopBottomWalls])
    {
        fishDy *= -1; // switch y direction
    }
    
    // handle wave
    if ([self waveHitsEnd])
    {
        [self resetWave];
    }
    else
    {
        [self moveWave];
    }
    
    
    [self moveFish];
    [self moveWave];
    
    //if (CGRectIntersectsRect(fish.frame, trumpOutline1.frame) || CGRectIntersectsRect(iv.frame, trumpOutline2.frame) || CGRectIntersectsRect(iv.frame, trumpOutline3.frame))
}

- (BOOL)fishCollidesWithSideWall
{
    //if (CGRectIntersectsRect(fish.frame, ))
    if (fish.center.x <= 50) // hits left side of screen
    {
        return YES;
    }
    else if (fish.center.x >= (sw - 50))
    {
        return YES;
    }
    
    return NO;
}

- (BOOL)fishCollidesWithTopBottomWalls
{
    if (fish.center.y <= 150) // hits the top of the water
    {
        return YES;
    }
    else if (fish.center.y >= (sh*.65)) // hits bottom
    {
        return YES;
    }
    
    return NO;
}

- (BOOL)waveHitsEnd
{
    if (wave.center.x >= (sh - wave.frame.size.width * .5))
    {
        return YES;
    }
    return NO;
}

- (void)moveFish
{
    CGPoint oldFishCenter = fish.center;
    CGPoint newFishCenter = CGPointMake(oldFishCenter.x + fishDx, oldFishCenter.y + fishDy + .4*sin(fishSinCount));
    [fish setCenter:newFishCenter];
}

- (void)resetWave
{
    CGPoint oldWaveCenter = wave.center;
    CGPoint newWaveCenter = CGPointMake(0, oldWaveCenter.y); // used to be 0
    //CGRect newWaveCenter = CGRectMake(sw, 0, sw*2, 300); // used to be 0
    //[wave setFrame:newWaveCenter];
    [wave setCenter:newWaveCenter];
}

- (void)moveWave
{
    CGPoint oldWaveCenter = wave.center;
    CGPoint newWaveCenter = CGPointMake(oldWaveCenter.x + waveDx, oldWaveCenter.y + waveDy);
    [wave setCenter:newWaveCenter];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    fishDx = .7;
    fishDy = .4;
    waveDx = .5;
    waveDy = 0;
    
    fishSinCount = 0;
    
    sw = [[UIScreen mainScreen] bounds].size.width;
    sh = [[UIScreen mainScreen] bounds].size.height;
    
    
    // make imageView stuff
    water = [[UIImageView alloc] initWithFrame:CGRectMake(0, sh*.1, sw, sh*.65)];
    [water setImage:[UIImage imageNamed:@"water1.jpeg"]];
    [self.view addSubview:water];
    
    fish = [[UIImageView alloc] initWithFrame:CGRectMake(sh*.2, 215, 100, 80)];
    [fish setImage:[UIImage imageNamed:@"fish2.png"]];
    [self.view addSubview:fish];
    
    wave = [[UIImageView alloc] initWithFrame:CGRectMake(sw, 0, sw*2, 100)];
    [wave setImage:[UIImage imageNamed:@"wave4.jpg"]];
    [self.view addSubview:wave];
    
    pebbles = [[UIImageView alloc] initWithFrame:CGRectMake(0, sh*.75, sw, sh*.1)];
    [pebbles setImage:[UIImage imageNamed:@"pebbles1.jpg"]];
    [self.view addSubview:pebbles];
    
    
    // start timer
    timer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(collision) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
