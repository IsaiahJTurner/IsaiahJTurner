//
//  IJTAppDelegate.h
//  IsaiahJTurner
//
//  Created by Isaiah Turner on 3/4/14.
//  Copyright (c) 2014 Isaiah Turner. All rights reserved.
//

#import "IJTViewController.h"
#import "IJTLifeEventsDataSource.h"
#import "IJTMyWebsiteViewController.h"

@interface IJTViewController ()

@end

#define PIPE_SPACE 200
#define PIPE_WIDTH 75
#define DEFAULT_OFFSET 320.0
#define NEPHRITIS [UIColor colorWithRed:144.0/255 green:204.0/255.0 blue:92.0/255.0 alpha:1.0]

@implementation IJTViewController {
    UIView *pipeBounds;
    UIDynamicAnimator *blockAnimator;
    
    UICollisionBehavior *blockCollision;
    UICollisionBehavior *groundCollision;
    UICollisionBehavior *outerSpaceCollision;
    UIDynamicItemBehavior *blockDynamicProperties;
    UIDynamicItemBehavior *groundDynamicProperties;
    UIDynamicItemBehavior *pipesDynamicProperties;
    UIGravityBehavior *gravity;
    UIPushBehavior *flapUp;
    UIPushBehavior *movePipes;
    int points2x;
    int lastYOffset;
    UIAlertView *gameOver;
    
    Boolean firstFlap;
    
    IJTBottomView *bottomView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.score = 0;
    firstFlap = NO;
    // Create Block Animator
    blockAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    groundDynamicProperties = [[UIDynamicItemBehavior alloc] initWithItems:@[self.ground, self.outerSpace]];
    groundDynamicProperties.allowsRotation = NO;
    groundDynamicProperties.density = 1000;
    
    blockDynamicProperties = [[UIDynamicItemBehavior alloc] initWithItems:@[self.block]];
    
    // Block flap behavior
    flapUp = [[UIPushBehavior alloc] initWithItems:@[self.block] mode:UIPushBehaviorModeInstantaneous];
    flapUp.pushDirection = CGVectorMake(0, -0.75);
    flapUp.active = NO;
    
    // Block Pipe Collision
    blockCollision = [[UICollisionBehavior alloc] initWithItems:@[self.block]];
    [blockCollision addBoundaryWithIdentifier:@"LEFT_WALL" fromPoint:CGPointMake(-1*PIPE_WIDTH, 0) toPoint:CGPointMake(-1*PIPE_WIDTH, self.view.bounds.size.height)];
    blockCollision.collisionDelegate = self;
    
    // Block Ground Collision
    groundCollision = [[UICollisionBehavior alloc] initWithItems:@[self.block, self.ground]];
    groundCollision.collisionDelegate = self;
    
    // Block Outer Space Collision
    outerSpaceCollision = [[UICollisionBehavior alloc] initWithItems:@[self.block, self.outerSpace]];
    outerSpaceCollision.collisionDelegate = self;
    
    [blockAnimator addBehavior:groundDynamicProperties];
    [blockAnimator addBehavior:blockDynamicProperties];
    
    [blockAnimator addBehavior:flapUp];
    [blockAnimator addBehavior:blockCollision];
    [blockAnimator addBehavior:groundCollision];
    [blockAnimator addBehavior:outerSpaceCollision];
    
    // Create Pipes Animator
    points2x = 0;
    lastYOffset = -100;
    
    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGesture:)];
    [self.view addGestureRecognizer:singleTapGestureRecognizer];
    [singleTapGestureRecognizer setNumberOfTapsRequired:1];
    self.title = @"Time Flies";
}

- (void)viewWillAppear:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    // Bottom info view
    bottomView = [[IJTBottomView alloc] initWithFrame:CGRectMake(0, 0, 320, 1136)];
    bottomView.openedCenter = CGPointMake(160,self.view.frame.size.height);
    bottomView.closedCenter = CGPointMake(160, self.view.frame.size.height + 500);
    bottomView.center = bottomView.closedCenter;
    bottomView.handleView.frame = CGRectMake(0, 0, 320, bottomView.frame.size.height);
    bottomView.delegate = self;
    [self.view addSubview:bottomView];
    //[bottomView enableGestures];
}

- (void) handleSingleTapGesture:(UITapGestureRecognizer *)gestureRecognizer {
    if (!firstFlap) {
        self.instructionsLabel.hidden = YES;
        gravity = [[UIGravityBehavior alloc] initWithItems:@[self.block]];
        gravity.magnitude = 1.1;
        [blockAnimator addBehavior:gravity];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            if (!gameOver.isHidden)[self generatePipesAndMove:DEFAULT_OFFSET];
        });
        [self performSelector:@selector(showBottom:) withObject:nil afterDelay:15.0];
        firstFlap = YES;
    }
    
    // Reset the velocity
    CGPoint v = [blockDynamicProperties linearVelocityForItem:self.block];
    v.y = -v.y;
    NSLog(@"%f,%f",v.x,v.y);
    [blockDynamicProperties addLinearVelocity:v forItem:self.block];
    
    [flapUp setActive:YES];
}

- (void)generatePipesAndMove:(float)xOffset {
  //  [bottomView disableGestures];
    
    self.score = self.score + 1;
    NSLog(@"%d",self.score);
    IJTLifeEventsDataSource *events = [[IJTLifeEventsDataSource alloc] init];
    if ([[events allEvents] count] <= self.score) {
        // Diplay no more events.
    } else {
        IJTLifeEventObject *event = [events retrieveEvent:self.score];
        NSLog(@"%@", [event getDetails]);
        bottomView.contentView.dateLabel.text = [event getDate];
        bottomView.contentView.descriptionLabel.text = [event getDetails];
    }
    lastYOffset = lastYOffset +  (arc4random_uniform(3)*40) * myRandom();
    lastYOffset = (lastYOffset < -200)?-200:lastYOffset;
    lastYOffset = (lastYOffset > 0)?0:lastYOffset;
    
    UIView *topPipe = [[UIView alloc] initWithFrame:CGRectMake(xOffset, lastYOffset, PIPE_WIDTH, 300)];
    [topPipe setRestorationIdentifier:@"TOP"];
    [topPipe setBackgroundColor:NEPHRITIS];
    
    [self.view insertSubview:topPipe belowSubview:bottomView];
    UIView *bottomPipe = [[UIView alloc] initWithFrame:CGRectMake(xOffset, lastYOffset+topPipe.bounds.size.height+PIPE_SPACE, PIPE_WIDTH, 300)];
    [bottomPipe setRestorationIdentifier:@"BOTTOM"];
    [bottomPipe setBackgroundColor:NEPHRITIS];
    [self.view insertSubview:bottomPipe belowSubview:bottomView];
    
    pipesDynamicProperties= [[UIDynamicItemBehavior alloc] initWithItems:@[topPipe, bottomPipe]];
    pipesDynamicProperties.allowsRotation = NO;
    pipesDynamicProperties.density = 1000;
    
    [blockCollision addItem:topPipe];
    [blockCollision addItem:bottomPipe];
    
    // Push Pipes across the screen
    movePipes = [[UIPushBehavior alloc] initWithItems:@[topPipe, bottomPipe] mode:UIPushBehaviorModeInstantaneous];
    movePipes.pushDirection = CGVectorMake(-2800, 0);
    movePipes.active = YES;
    
    [blockAnimator addBehavior:pipesDynamicProperties];
    [blockAnimator addBehavior:movePipes];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3.9 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [bottomPipe removeFromSuperview];
        [topPipe removeFromSuperview];
    });
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p {
    if ([(NSString*)identifier isEqualToString:@"LEFT_WALL"]) {
        points2x++;
        [blockCollision removeItem:item];
        [blockAnimator removeBehavior:pipesDynamicProperties];
        [blockAnimator removeBehavior:movePipes];
        if (points2x%2 == 0) {
            [self generatePipesAndMove:DEFAULT_OFFSET];
        }
    }
}
int myRandom() {
    return (arc4random() % 2 ? 1 : -1);
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p {
    if (((UIView *)item1).tag != 2014 && ((UIView *)item2).tag != 2014) {
        [blockAnimator removeAllBehaviors];
        [self showBottom:true];
    }
}

- (void)showBottom:(BOOL)loss {
    self.instructionsLabel.selectable = true;
    self.instructionsLabel.hidden = NO;
    if (!loss) {
        if (!self.instructionsLabel.tag == 5)
    self.instructionsLabel.text = @"I diddn't have a whole lot of time to finish this app so this is the end of my timeline. I hope you enjoyed it! Want to see what my future holds? Check out my website! www.IsaiahJTurner.com";
    } else {
        self.instructionsLabel.text = @"I guess winning isn't for everyone.";
        self.instructionsLabel.tag = 5;
    }
    self.instructionsLabel.selectable = false;

   [bottomView setOpened:YES animated:YES];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (IBAction)viewGallery:(id)sender {
    IJTMyWebsiteViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"websiteVC"];;
    vc.fullURL = @"http://isaiahjturner.com";
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - PullableView Delegate

- (void)pullableView:(PullableView *)pView didChangeState:(BOOL)opened {
    if (opened) {
        //[bottomView enableGestures];
        self.title = bottomView.contentView.dateLabel.text;
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    } else {
        self.title = @"Time Flies";
        [self.view setNeedsDisplay];
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
        //[bottomView disableGestures];
    }
}

@end
