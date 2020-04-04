//
//  RCRMorePatientInfoStep.h
//  COVID-19 Registry
//
//  Created by Fiumara, Gregory (Fed) on 4/4/20.
//

@import ResearchKit;

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const MorePatientInfoStepIdentifier;
FOUNDATION_EXPORT NSString * const MorePatientInfoStep_ComorbidityIdentifier;
FOUNDATION_EXPORT NSString * const MorePatientInfoStep_RaceIdentifier;
FOUNDATION_EXPORT NSString * const MorePatientInfoStep_SmokerIdentifier;
FOUNDATION_EXPORT NSString * const MorePatientInfoStep_VaperIdentifier;

@interface RCRMorePatientInfoStep : ORKFormStep

+ (instancetype)new;
- (instancetype)init NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
