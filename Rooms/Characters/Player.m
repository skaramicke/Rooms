//
//  Player.m
//  Rooms
//
//  Created by Mikael Grön on 2014-10-14.
//  Copyright (c) 2014 Mikael Grön. All rights reserved.
//

#import "Player.h"

@interface Player()

// Sprites and animation stuff
@property (strong, nonatomic) SKTextureAtlas *atlas;
@property (strong, nonatomic) SKSpriteNode *spriteNode;
@property (assign, nonatomic) CGFloat normalAnimationInterval;

// Actions
@property (strong, nonatomic) NSDictionary *actions;

@end

@implementation Player

-(instancetype)init {
	self = [super init];
	
	if (self != nil) {
		
		// Get sprites from here
		self.atlas = [SKTextureAtlas atlasNamed:@"player-redpants"];
		
		// Generally animate at this interval
		self.normalAnimationInterval = 0.05;
		
		// Set up the sprite node (to hold animations and whatnot)
		self.spriteNode = [SKSpriteNode spriteNodeWithTexture:[self.atlas textureNamed:@"stand"]];
		[self addChild:self.spriteNode];
		
		// Set up the physical body
		
		// Define animations
		[self buildAnimations];
		
		// Set a state
		[self setState:playerStateJumpPunch];
	}
	
	return self;
}

#pragma Init fragments
-(void)buildAnimations
{
	self.actions =
	@{
	  // STAND
	  [NSNumber numberWithInt:playerStateStand]:
		  [SKAction repeatActionForever:
		   [SKAction
			animateWithTextures:@[[self.atlas textureNamed:@"stand"]]
			timePerFrame:self.normalAnimationInterval
			resize:YES
			restore:YES]],
	  
	  // RUN
	  [NSNumber numberWithInt:playerStateRun]:
		  [SKAction repeatActionForever:
		   [SKAction
			animateWithTextures:@[
								  [self.atlas textureNamed:@"run_0"],
								  [self.atlas textureNamed:@"run_1"],
								  [self.atlas textureNamed:@"run_2"],
								  [self.atlas textureNamed:@"run_3"],
								  [self.atlas textureNamed:@"run_4"],
								  [self.atlas textureNamed:@"run_5"],
								  [self.atlas textureNamed:@"run_6"],
								  [self.atlas textureNamed:@"run_7"]
								  ]
			timePerFrame:self.normalAnimationInterval
			resize:YES
			restore:YES]],
	  
	  // PUNCH
	  [NSNumber numberWithInt:playerStateStandPunch]:
		  [SKAction
		   animateWithTextures:@[
								 [self.atlas textureNamed:@"punch_0"],
								 [self.atlas textureNamed:@"punch_1"],
								 [self.atlas textureNamed:@"punch_2"],
								 [self.atlas textureNamed:@"punch_3"],
								 [self.atlas textureNamed:@"stand"]
								 ]
		   timePerFrame:self.normalAnimationInterval
		   resize:YES
		   restore:YES],
	  
	  // FALL ( being hit )
	  [NSNumber numberWithInt:playerStateFall]:
		  [SKAction sequence:@[
							   [SKAction
								animateWithTextures:@[
													  [self.atlas textureNamed:@"fall_0"],
													  [self.atlas textureNamed:@"fall_1"],
													  [self.atlas textureNamed:@"fall_2"]
													  ]
								timePerFrame:self.normalAnimationInterval
								resize:YES
								restore:YES],
							   [SKAction customActionWithDuration:0.0 actionBlock:
								^(SKNode *node, CGFloat elapsedTime) {
									[(Player*)node.parent setState:playerStateFallen];
								}]
							   ]],
	  
	  
	  // FALLEN
	  [NSNumber numberWithInt:playerStateFallen]:
		  [SKAction repeatActionForever:
		   [SKAction
			animateWithTextures:@[
								  [self.atlas textureNamed:@"fall_2"]
								  ]
			timePerFrame:self.normalAnimationInterval
			resize:YES
			restore:YES]],
	  
	  // JUMP UP
	  [NSNumber numberWithInt:playerStateJumpUp]:
		  [SKAction repeatActionForever:
		   [SKAction
			animateWithTextures:@[[self.atlas textureNamed:@"jump_up"]]
			timePerFrame:self.normalAnimationInterval
			resize:YES
			restore:YES]],
	  
	  // JUMP DOWN ( like falling, but in control )
	  [NSNumber numberWithInt:playerStateJumpDown]:
		  [SKAction repeatActionForever:
		   [SKAction
			animateWithTextures:@[[self.atlas textureNamed:@"jump_down"]]
			timePerFrame:self.normalAnimationInterval
			resize:YES
			restore:YES]],
	  
	  // JUMP PUNCH
	  [NSNumber numberWithInt:playerStateJumpPunch]:
		  [SKAction
		   animateWithTextures:@[
								 [self.atlas textureNamed:@"jump_punch_0"],
								 [self.atlas textureNamed:@"jump_punch_1"],
								 [self.atlas textureNamed:@"jump_punch_2"],
								 [self.atlas textureNamed:@"jump_punch_3"],
								 ]
		   timePerFrame:self.normalAnimationInterval
		   resize:YES
		   restore:YES],
	  
	  // CROUCH
	  [NSNumber numberWithInt:playerStateCrouch]:
		  [SKAction repeatActionForever:
		   [SKAction
			animateWithTextures:@[[self.atlas textureNamed:@"crouch"]]
			timePerFrame:self.normalAnimationInterval
			resize:YES
			restore:YES]],
	  
	  // CROUCH PUNCH
	  [NSNumber numberWithInt:playerStateCrouchPunch]:
		  [SKAction
		   animateWithTextures:@[
								 [self.atlas textureNamed:@"sit_punch_0"],
								 [self.atlas textureNamed:@"sit_punch_1"],
								 [self.atlas textureNamed:@"sit_punch_2"],
								 [self.atlas textureNamed:@"sit_punch_3"],
								 ]
		   timePerFrame:self.normalAnimationInterval
		   resize:YES
		   restore:YES],
	  
	  };
}

-(void)setState:(playerState)state
{
	_state = state;
	[self runActionForState:state];
}

-(void)runActionForState:(playerState)state
{
	[self.spriteNode runAction:self.actions[[NSNumber numberWithInt:state]] withKey:[NSString stringWithFormat:@"%ld", state]];
}

@end
