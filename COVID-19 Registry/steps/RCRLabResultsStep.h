//
//  RCRLabResultsStep.h
//  COVID-19 Registry
//
//  Created by Fiumara, Gregory (Fed) on 4/4/20.
//

@import ResearchKit;

FOUNDATION_EXPORT NSString * const LabResultsInfoStepIdentifier;
FOUNDATION_EXPORT NSString * const LabResultsInfoStep_LabResultsExistIdentifier;

NS_ASSUME_NONNULL_BEGIN

@interface RCRLabResultsStep : ORKFormStep

+ (instancetype)new;
- (instancetype)init NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
