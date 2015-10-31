//
//  ViewController.m
//  Picnic Panic
//
//  Created by  on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "MainMenu.h"

#define kStateRunning 1
#define kStateGameOver 2

//#define kAntSpeed 0.9
float AntSpeed = 0.9;
int playing = 0;
int playerLives = 3;
int clicked;
int munched;

@implementation ViewController

@synthesize PicnicTablecloth, GrassBackground, Ant2, Ant3, Ant4, Ant5, Ant6, Sandwich, gameOver, howTo;
@synthesize gameState;
@synthesize antSpeed;
@synthesize labelScore;
@synthesize score;
@synthesize menu, playButton, howToButton;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

//Timer for ants
- (void)viewDidLoad
{
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Soundtrack2.mp3", [[NSBundle mainBundle] resourcePath]]]; 
    NSError *error;
    menuMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    menuMusic.numberOfLoops = -1;
    
    [menuMusic play];
    
    Ant2.center = CGPointMake(arc4random()% 290+18, -30);
    Ant3.center = CGPointMake(arc4random()% 290+18, -750);
    Ant4.center = CGPointMake(arc4random()% 290+18, -70);
    Ant5.center = CGPointMake(arc4random()% 290+18, -1500);
    Ant6.center = CGPointMake(arc4random()% 290+18, -2250);
    [super viewDidLoad];
    gameState = kStateRunning;
    antSpeed = CGPointMake(0, AntSpeed);
    
    Sandwich.hidden = 1;
    gameOver.hidden = 1;
    howTo.hidden = 1;
    howToButton.hidden = 0;
    
    
    [NSTimer scheduledTimerWithTimeInterval:1.0/60 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
     
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)gameLoop {
    if (gameState == kStateRunning)
    {
        [self gameStatePlayNormal];
    }
    else if (gameState == kStateGameOver)
    {
        
    }
        
}



//Ants moving down
- (void)gameStatePlayNormal {
    if (clicked == 1) {
        NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Splat.mp3", [[NSBundle mainBundle] resourcePath]]]; 
        NSError *error;
        splat = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        splat.numberOfLoops = 0;
        
        [splat play];
        clicked = 0;
    }
    
    if (munched == 1) {
        NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/EatingSound.mp3", [[NSBundle mainBundle] resourcePath]]]; 
        NSError *error;
        munch = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        munch.numberOfLoops = 0;
        
        [munch play];
        munched = 0;
    }
    
    if (playing == 1) {
        
    Ant2.center = CGPointMake(Ant2.center.x + antSpeed.x , Ant2.center.y + antSpeed.y);
    Ant3.center = CGPointMake(Ant3.center.x + antSpeed.x , Ant3.center.y + antSpeed.y);
    Ant4.center = CGPointMake(Ant4.center.x + antSpeed.x , Ant4.center.y + antSpeed.y);
    Ant5.center = CGPointMake(Ant5.center.x + antSpeed.x , Ant5.center.y + antSpeed.y);
    Ant6.center = CGPointMake(Ant6.center.x + antSpeed.x , Ant6.center.y + antSpeed.y);
    if (Ant2.center.y > 360) {
        Ant2.center = CGPointMake(arc4random()% 290+18, -30);
        if (playerLives == 3){
        Sandwich.image = [UIImage imageNamed:@"Sandwich Bite 2.png"];
            playerLives --;
            munched = 1;
        }
        else if (playerLives == 2){
            Sandwich.image = [UIImage imageNamed:@"Sandwich Bite 4.png"];
            playerLives --;
            munched = 1;
        }
        else if (playerLives == 1){
            Sandwich.image = [UIImage imageNamed:@"Sandwich Bite 5.png"];
            playerLives --;
            munched = 1;
            gameOver.hidden = 0;
            playing = 0;
            Ant2.center = CGPointMake(arc4random()% 290+18, -30);
            Ant3.center = CGPointMake(arc4random()% 290+18, -750);
            Ant4.center = CGPointMake(arc4random()% 290+18, -70);
            Ant5.center = CGPointMake(arc4random()% 290+18, -1500);
            Ant6.center = CGPointMake(arc4random()% 290+18, -2250);
        }
       
    }
    if (Ant3.center.y > 360) {
        Ant3.center = CGPointMake(arc4random()% 290+18, -30);
        if (playerLives == 3){
            Sandwich.image = [UIImage imageNamed:@"Sandwich Bite 2.png"];
            playerLives --;
            munched = 1;
        }
        else if (playerLives == 2){
            Sandwich.image = [UIImage imageNamed:@"Sandwich Bite 4.png"];
            playerLives --;
            munched = 1;
        }
        else if (playerLives == 1){
            Sandwich.image = [UIImage imageNamed:@"Sandwich Bite 5.png"];
            playerLives --;
            munched = 1;
            gameOver.hidden = 0;
            playing = 0;
            Ant2.center = CGPointMake(arc4random()% 290+18, -30);
            Ant3.center = CGPointMake(arc4random()% 290+18, -750);
            Ant4.center = CGPointMake(arc4random()% 290+18, -70);
            Ant5.center = CGPointMake(arc4random()% 290+18, -1500);
            Ant6.center = CGPointMake(arc4random()% 290+18, -2250);
        }
        
    }
    if (Ant4.center.y > 360) {
        Ant4.center = CGPointMake(arc4random()% 290+18, -30);
        if (playerLives == 3){
            Sandwich.image = [UIImage imageNamed:@"Sandwich Bite 2.png"];
            playerLives --;
            munched = 1;
        }
        else if (playerLives == 2){
            Sandwich.image = [UIImage imageNamed:@"Sandwich Bite 4.png"];
            playerLives --;
            munched = 1;
        }
        else if (playerLives == 1){
            Sandwich.image = [UIImage imageNamed:@"Sandwich Bite 5.png"];
            playerLives --;
            munched = 1;
            gameOver.hidden = 0;
            playing = 0;
            Ant2.center = CGPointMake(arc4random()% 290+18, -30);
            Ant3.center = CGPointMake(arc4random()% 290+18, -750);
            Ant4.center = CGPointMake(arc4random()% 290+18, -70);
            Ant5.center = CGPointMake(arc4random()% 290+18, -1500);
            Ant6.center = CGPointMake(arc4random()% 290+18, -2250);
        }
       
    }
    if (Ant5.center.y > 360) {
        Ant5.center = CGPointMake(arc4random()% 290+18, -30);
        if (playerLives == 3){
            Sandwich.image = [UIImage imageNamed:@"Sandwich Bite 2.png"];
            playerLives --;
            munched = 1;
        }
        else if (playerLives == 2){
            Sandwich.image = [UIImage imageNamed:@"Sandwich Bite 4.png"];
            playerLives --;
            munched = 1;
        }
        else if (playerLives == 1){
            Sandwich.image = [UIImage imageNamed:@"Sandwich Bite 5.png"];
            playerLives --;
            munched = 1;
            gameOver.hidden = 0;
            playing = 0;
            Ant2.center = CGPointMake(arc4random()% 290+18, -30);
            Ant3.center = CGPointMake(arc4random()% 290+18, -750);
            Ant4.center = CGPointMake(arc4random()% 290+18, -70);
            Ant5.center = CGPointMake(arc4random()% 290+18, -1500);
            Ant6.center = CGPointMake(arc4random()% 290+18, -2250);
        }
       
    }
    if (Ant6.center.y > 360) {
        Ant6.center = CGPointMake(arc4random()% 290+18, -30);
        if (playerLives == 3){
            Sandwich.image = [UIImage imageNamed:@"Sandwich Bite 2.png"];
            playerLives --;
            munched = 1;
        }
        else if (playerLives == 2){
            Sandwich.image = [UIImage imageNamed:@"Sandwich Bite 4.png"];
            playerLives --;
            munched = 1;
        }
        else if (playerLives == 1){
            Sandwich.image = [UIImage imageNamed:@"Sandwich Bite 5.png"];
            playerLives --;
            munched = 1;
            gameOver.hidden = 0;
            playing = 0;
            Ant2.center = CGPointMake(arc4random()% 290+18, -30);
            Ant3.center = CGPointMake(arc4random()% 290+18, -750);
            Ant4.center = CGPointMake(arc4random()% 290+18, -70);
            Ant5.center = CGPointMake(arc4random()% 290+18, -1500);
            Ant6.center = CGPointMake(arc4random()% 290+18, -2250);
            
        }
        
    }
    }
}
//play splay sound


//Touching Ants
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
	
	UITouch *touch = [touches anyObject];
	CGPoint touchLocation = [touch locationInView:touch.view];
    
    if (touch.view == playButton) {
        menu.hidden = 1;
        playButton.hidden = 1;
        playing = 1;
        score = 0;
        howToButton.hidden = 1;
        NSString *nssScore = [NSString stringWithFormat: @"%i", score];
        labelScore.text = nssScore;
        Sandwich.hidden = 0;
    }
    
    if (touch.view == howToButton) {
        howTo.hidden = 0;
        howToButton.hidden = 1;
    }
    
    if (touch.view == Ant2) {
       // NSLog(@"TOUCH");
        Ant2.center = CGPointMake(arc4random()% 290+18, -50);
        AntSpeed = AntSpeed + 0.015;
        antSpeed = CGPointMake(0, AntSpeed);
        score = score + 1;
        NSString *nssScore = [NSString stringWithFormat: @"%i", score];
        labelScore.text = nssScore;
        clicked = 1;
        NSLog(@"SOUND");
        }   
       
    
    if (touch.view == Ant3) {
        // NSLog(@"TOUCH");
        Ant3.center = CGPointMake(arc4random()% 290+18, -45);
        AntSpeed = AntSpeed + 0.015;
        antSpeed = CGPointMake(0, AntSpeed);
        score = score + 1;
        NSString *nssScore = [NSString stringWithFormat: @"%i", score];
        labelScore.text = nssScore;
        clicked = 1;
        NSLog(@"SOUND");
    }
    if (touch.view == Ant4) {
        // NSLog(@"TOUCH");
        Ant4.center = CGPointMake(arc4random()% 290+18, -65);
        AntSpeed = AntSpeed + 0.015;
        antSpeed = CGPointMake(0, AntSpeed);
        score = score + 1;
        NSString *nssScore = [NSString stringWithFormat: @"%i", score];
        labelScore.text = nssScore;
        clicked = 1;
    }
    if (touch.view == Ant5) {
        // NSLog(@"TOUCH");
        Ant5.center = CGPointMake(arc4random()% 290+18, -65);
        AntSpeed = AntSpeed + 0.015;
        antSpeed = CGPointMake(0, AntSpeed);
        score = score + 1;
        NSString *nssScore = [NSString stringWithFormat: @"%i", score];
        labelScore.text = nssScore;
        clicked = 1;
    }  
    if (touch.view == Ant6) {
        // NSLog(@"TOUCH");
        Ant6.center = CGPointMake(arc4random()% 290+18, -65);
        AntSpeed = AntSpeed + 0.015;
        antSpeed = CGPointMake(0, AntSpeed);
        score = score + 1;
        NSString *nssScore = [NSString stringWithFormat: @"%i", score];
        labelScore.text = nssScore;
        clicked = 1;
    }
    if (touch.view == gameOver) {
        menu.hidden = 0;
        AntSpeed = 0.9;
        playButton.hidden = 0;
        playerLives = 3;
        gameOver.hidden = 1;
        Sandwich.hidden = 1;
        howToButton.hidden = 0;
        Sandwich.image = [UIImage imageNamed:@"Sandwich.png"];
        NSString *nssScore = [NSString stringWithFormat: @"%i", score];
        labelScore.text = nssScore;

    }
    
    if (touch.view == howTo) {
        howToButton.hidden = 0;
        howTo.hidden = 1;
        
    }
}


- (void)viewDidUnload
{
   
    score = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.PicnicTablecloth = nil;
    self.GrassBackground = nil;
    self.Ant2 = nil;
    self.Ant3 = nil;
    self.Ant4 = nil;
    self.Ant5 = nil;
    self.Ant6 = nil;
    self.labelScore = nil;
    self.menu = nil;
    self.playButton = nil;
    self.Sandwich = nil;
    self.gameOver = nil;
    self.howTo = nil;
    self.howToButton = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end