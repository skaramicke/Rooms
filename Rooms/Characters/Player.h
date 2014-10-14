//
//  Player.h
//  Rooms
//
//  Created by Mikael Grön on 2014-10-14.
//  Copyright (c) 2014 Mikael Grön. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>


typedef NS_ENUM(NSInteger, playerState) {
	playerStateStand,
	playerStateStandPunch,
	playerStateRun,
	playerStateFall,
	playerStateFallen,
	playerStateJumpUp,
	playerStateJumpDown,
	playerStateJumpPunch,
	playerStateCrouch,
	playerStateCrouchPunch
};

@interface Player : SKNode

@property (assign, nonatomic) playerState state;

@end
