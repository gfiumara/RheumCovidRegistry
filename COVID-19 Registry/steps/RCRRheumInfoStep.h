// SPDX-License-Identifier: CC0-1.0

@import ResearchKit;

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const RheumInfoStepIdentifier;
FOUNDATION_EXPORT NSString * const RheumInfoStep_PrimaryDiseaseIdentifier;
FOUNDATION_EXPORT NSString * const RheumInfoStep_ActivityIdentifier;

@interface RCRRheumInfoStep : ORKFormStep

+ (instancetype)new;
- (instancetype)init NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
