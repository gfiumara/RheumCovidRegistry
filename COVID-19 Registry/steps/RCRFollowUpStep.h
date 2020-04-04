// SPDX-License-Identifier: CC0-1.0

@import ResearchKit;

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const FollowUpStepIdentifier;
FOUNDATION_EXPORT NSString * const FollowUpStep_MayWeContactIdentifier;
FOUNDATION_EXPORT NSString * const FollowUpStep_EmailIdentifier;

@interface RCRFollowUpStep : ORKFormStep

+ (instancetype)new;
- (instancetype)init NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
