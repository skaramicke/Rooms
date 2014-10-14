//
//  GameScene.m
//  Rooms
//
//  Created by Mikael Grön on 2014-10-13.
//  Copyright (c) 2014 Mikael Grön. All rights reserved.
//

#import "GameScene.h"
#import "Player.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
	
	Player *player = [[Player new] init];
	player.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
	[self addChild:player];
	
//	NSMutableArray *walkFrames = [NSMutableArray array];
//	SKTextureAtlas *bearAnimatedAtlas = [SKTextureAtlas atlasNamed:@"player-redpants"];
//	NSInteger numImages = bearAnimatedAtlas.textureNames.count;
//	for (int i=1; i <= numImages/2; i++) {
//		NSString *textureName = [NSString stringWithFormat:@"bear%d", i];
//		SKTexture *temp = [bearAnimatedAtlas textureNamed:textureName];
//		[walkFrames addObject:temp];
//	}
//	NSArray *_bearWalkingFrames = walkFrames;
//	
//	SKTexture *temp = _bearWalkingFrames[0];
//	SKSpriteNode *_bear = [SKSpriteNode spriteNodeWithTexture:temp];
//	_bear.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
//	[self addChild:_bear];
//	
//	[_bear runAction:[SKAction repeatActionForever:
//					  [SKAction animateWithTextures:_bearWalkingFrames
//									   timePerFrame:0.1f
//											 resize:NO
//											restore:YES]] withKey:@"walkingInPlaceBear"];
	
}

@end
