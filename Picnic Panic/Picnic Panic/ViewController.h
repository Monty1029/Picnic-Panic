//
//  ViewController.h
//  Picnic Panic
//
//  Created by  on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController {
    UIImageView *PicnicTablecloth;
    UIImageView *GrassBackground;
    UIImageView *Ant2;
    UIImageView *menu;
    UIImageView *playButton;
    
    
    NSInteger gameState;
    
    NSInteger score;
    
    CGPoint antSpeed;

    UILabel *labelScore;
    
    AVAudioPlayer *splat;
    AVAudioPlayer *munch;
    AVAudioPlayer *menuMusic;
}

@property (nonatomic, retain) IBOutlet UIImageView *PicnicTablecloth;
@property (nonatomic, retain) IBOutlet UIImageView *GrassBackground;
@property (nonatomic, retain) IBOutlet UIImageView *Sandwich;
@property (nonatomic, retain) IBOutlet UILabel *labelScore;
@property (nonatomic, retain) IBOutlet UIImageView *Ant2;
@property (nonatomic, retain) IBOutlet UIImageView *Ant3;
@property (nonatomic, retain) IBOutlet UIImageView *Ant4;
@property (nonatomic, retain) IBOutlet UIImageView *Ant5;
@property (nonatomic, retain) IBOutlet UIImageView *Ant6;
@property (nonatomic, retain) IBOutlet UIImageView *menu;
@property (nonatomic, retain) IBOutlet UIImageView *playButton;
@property (nonatomic, retain) IBOutlet UIImageView *gameOver;
@property (nonatomic, retain) IBOutlet UIImageView *howTo;
@property (nonatomic, retain) IBOutlet UIImageView *howToButton;

@property (nonatomic) NSInteger gameState;
@property (nonatomic) NSInteger score;
@property (nonatomic) CGPoint antSpeed;

- (IBAction)antClick:(id)sender;

- (IBAction)playSplat;

- (void)gameStatePlayNormal;
- (void)showMeSomeButtons;


@end
