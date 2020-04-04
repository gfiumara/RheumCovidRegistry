//
//  RCRBiographicalInfoStep.h
//  COVID-19 Registry
//
//  Created by Fiumara, Gregory (Fed) on 4/2/20.
//

@import ResearchKit;

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const BiographicalInfoStepIdentifier;
FOUNDATION_EXPORT NSString * const BiographicalInfoStep_AgeQuestionIdentifier;
FOUNDATION_EXPORT NSString * const BiographicalInfoStep_GenderQuestionIdentifier;

@interface RCRBiographicalInfoStep : ORKFormStep

+ (instancetype)new;
- (instancetype)init NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
