//
//  NNGame.m
//  Car_Race
//
//  Created by Neema Mahida on 2014-11-20.
//  Copyright (c) 2014 Neema Mahida. All rights reserved.
//

#import "NNGame.h"
#import "NNGameOverScene.h"
#import "NNGameChange.h"

static const uint32_t carCategory =  0x1 << 0;
static const uint32_t obstacleCategory =  0x1 << 1;

int count;
int c;
NSString *carColor;
NSString *cr;

NSUserDefaults *prefs;
NSUserDefaults *prefs1;
NSUserDefaults *prefs2;


float BG_VELOCITY;
float OBJECT_VELOCITY;

static inline CGPoint CGPointAdd(const CGPoint a, const CGPoint b)
{
    return CGPointMake(a.x + b.x, a.y + b.y);
}

static inline CGPoint CGPointMultiplyScalar(const CGPoint a, const CGFloat b)
{
    return CGPointMake(a.x * b, a.y * b);
}


@implementation NNGame{
    SKSpriteNode *car;
    SKAction *actionRight;
    SKAction *actionLeft;
    NSTimeInterval _lastUpdateTime;
    NSTimeInterval _dt;
    NSTimeInterval _lastEnemyAdded;
}

-(id)initWithSize:(CGSize)size {
    
    
    if (self = [super initWithSize:size]) {
        
        extern int level;
        prefs = [NSUserDefaults standardUserDefaults];
        BG_VELOCITY = [prefs floatForKey:@"screenMovingSpeed"];
        prefs2 = [NSUserDefaults standardUserDefaults];
        OBJECT_VELOCITY = [prefs2 floatForKey:@"objectMoivingSpeed"];

        
        self.backgroundColor = [SKColor whiteColor];
        [self initalizingScrollingBackground];
        
        [self addCar];
       // [self addEnemyCar];
        self.physicsWorld.contactDelegate = self;
        self.physicsWorld.gravity = CGVectorMake(0.0f, 0.0f);
        count = 0;
        
    }
     return self;
}

-(void)initalizingScrollingBackground
{
    for (int i = 0; i < 2; i++) {
        SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
        bg.position = CGPointMake(0,i * bg.size.height);
        bg.anchorPoint = CGPointZero;
        bg.name = @"bg";
        [self addChild:bg];
    }
    
}

-(void)addCar
{
    NSUserDefaults *p = [NSUserDefaults standardUserDefaults];
    c = [p integerForKey:@"carNo"];
    if (c == 1) {
        car = [SKSpriteNode spriteNodeWithImageNamed:@"red"];
        [car setScale:0.9];
        carColor = redCar;
        
        car.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:car.size];
        car.physicsBody.categoryBitMask = carCategory;
        car.physicsBody.dynamic = YES;
        car.physicsBody.contactTestBitMask = obstacleCategory;
        car.physicsBody.collisionBitMask = 0;
        car.physicsBody.usesPreciseCollisionDetection = YES;
        self.physicsWorld.gravity = CGVectorMake(0.0f, 0.0f);
        
        car.name = redCar;
        car.position = CGPointMake(160, 40);
        
        actionRight = [SKAction moveByX:-30 y:0 duration:.2];
        actionLeft = [SKAction moveByX:30 y:0 duration:.2];
         [self addChild:car];
    }
    if (c == 2) {
        car = [SKSpriteNode spriteNodeWithImageNamed:@"white"];
        [car setScale:0.7];
        carColor = whitecar;
        car.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:car.size];
        car.physicsBody.categoryBitMask = carCategory;
        car.physicsBody.dynamic = YES;
        car.physicsBody.contactTestBitMask = obstacleCategory;
        car.physicsBody.collisionBitMask = 0;
        car.physicsBody.usesPreciseCollisionDetection = YES;
        self.physicsWorld.gravity = CGVectorMake(0.0f, 0.0f);

        car.name = whitecar;
        car.position = CGPointMake(160, 40);
        actionRight = [SKAction moveByX:-30 y:0 duration:.2];
        actionLeft = [SKAction moveByX:30 y:0 duration:.2];
        [self addChild:car];
    }
    if (c == 3) {
        car = [SKSpriteNode spriteNodeWithImageNamed:@"grey"];
        [car setScale:1.4];
        carColor = greycar;
        car.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:car.size];
        car.physicsBody.categoryBitMask = carCategory;
        car.physicsBody.dynamic = YES;
        car.physicsBody.contactTestBitMask = obstacleCategory;
        car.physicsBody.collisionBitMask = 0;
        car.physicsBody.usesPreciseCollisionDetection = YES;
        self.physicsWorld.gravity = CGVectorMake(0.0f, 0.0f);

        car.name = greycar;
        car.position = CGPointMake(160, 40);
        actionRight = [SKAction moveByX:-30 y:0 duration:.2];
        actionLeft = [SKAction moveByX:30 y:0 duration:.2];
         [self addChild:car];
    }
    
    
    
}

-(void)addEnemyCar
{
    //initalizing spaceship node
    int v = (rand()%5);
    switch (v) {
        case 0:
            cr = blueCar;
            break;
            
        case 1:
            cr = yellowcar;
            break;
        
        case 2:
            cr = skyCar;
            break;
            
        case 3:
            cr = greenCar;
            break;
        
        case 4:
            cr = lightCar;
            break;
            
        default:
            break;
    }
    SKSpriteNode *enemycar;
    enemycar = [SKSpriteNode spriteNodeWithImageNamed:cr];
    [enemycar setScale:0.9];
    
    //Adding SpriteKit physicsBody for collision detection
    enemycar.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:enemycar.size];
    enemycar.physicsBody.categoryBitMask = obstacleCategory;
    enemycar.physicsBody.dynamic = YES;
    enemycar.physicsBody.contactTestBitMask = carCategory;
    enemycar.physicsBody.collisionBitMask = 0;
    enemycar.physicsBody.usesPreciseCollisionDetection = YES;
    enemycar.name = cr;
    
    //selecting random y position for missile
    int r = arc4random_uniform(self.frame.size.width);
    
    //int y = arc4random_uniform(self.frame.size.height) /2;
    if (r > 210) {
        r = r - 210;
        if (r < 130) {
             r = r + 130;
            if (r > 210) {
                r = r - 50;
            }
        }
    }
    if (r < 130 ) {
        r = r + 130;
        if (r > 210) {
            r = r - 210;
            if (r < 130) {
                r = r + 90;
            }
        }
    }
    enemycar.position = CGPointMake(r,self.frame.size.height - 7);
    
    [self addChild:enemycar];
}

- (void)moveObstacle
{
    NSArray *nodes = self.children;
    
    for(SKNode * node in nodes){
        
        NSUserDefaults *l = [NSUserDefaults standardUserDefaults];
        int level = [l integerForKey:@"level"];
        if (![node.name  isEqual: @"bg"] && ![node.name  isEqual: carColor]) {
            SKSpriteNode *ob = (SKSpriteNode *) node;
            CGPoint obVelocity = CGPointMake(0, -OBJECT_VELOCITY);
            CGPoint amtToMove = CGPointMultiplyScalar(obVelocity,_dt);
            
            ob.position = CGPointAdd(amtToMove,ob.position);
            if(ob.position.y < -10)
            {
                count++;
                if (count == 1000) {
                   if (level == 1) {
                        [self changeGame];

                    }
                    if (level == 2) {
                        [self overGame];
                    }
                }
                //[ob removeFromParent];
            }
        }
    }
    
    
}


-(void)update:(CFTimeInterval)currentTime {

    
    if (_lastUpdateTime)
    {
        _dt = currentTime - _lastUpdateTime;
    }
    else
    {
        _dt = 0;
    }
    _lastUpdateTime = currentTime;
    
    if( currentTime - _lastEnemyAdded > 2.5)
    {
        _lastEnemyAdded = currentTime + 1;
        [self addEnemyCar];
    }

    [self moveBg];
    [self moveObstacle];
}

- (void)moveBg
{
    [self enumerateChildNodesWithName:@"bg" usingBlock: ^(SKNode *node, BOOL *stop)
     {
         SKSpriteNode * bg = (SKSpriteNode *) node;
         CGPoint bgVelocity = CGPointMake(0,-BG_VELOCITY);
         CGPoint amtToMove = CGPointMultiplyScalar(bgVelocity,_dt);
         bg.position = CGPointAdd(bg.position, amtToMove);
         
         //Checks if bg node is completely scrolled of the screen, if yes then put it at the end of the other node
         if (bg.position.y <= -bg.size.height)
         {
             bg.position = CGPointMake(bg.position.x,
                                       bg.position.y  + bg.size.height*2);
         }
     }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self.scene];
    if(touchLocation.x >car.position.x){
        if(car.position.x < 210){
            [car runAction:actionLeft];
        }
    }else{
        if(car.position.x > 130){
            
            [car runAction:actionRight];
        }
    }
}

- (void)didBeginContact:(SKPhysicsContact *)contact
{
    SKPhysicsBody *firstBody, *secondBody;
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
    {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    }
    else
    {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
    if ((firstBody.categoryBitMask & carCategory) != 0 &&
        (secondBody.categoryBitMask & obstacleCategory) != 0)
    {
        [car removeFromParent];
        SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
        SKScene * gameOverScene = [[NNGameOverScene alloc] initWithSize:self.size];
        [self.view presentScene:gameOverScene transition: reveal];
        
    }
}

-(void) changeGame
{
    NNGameChange *gameChange = [NNGameChange sceneWithSize:self.size];
    SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionLeft duration:1.0];
    [self.scene.view presentScene:gameChange transition:reveal];
    
}

-(void) overGame
{
    NNGameOverScene *gameOver = [NNGameOverScene sceneWithSize:self.size];
    SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionLeft duration:1.0];
    [self.scene.view presentScene:gameOver transition:reveal];
    
}

@end
