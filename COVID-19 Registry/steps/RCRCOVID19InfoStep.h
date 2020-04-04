// SPDX-License-Identifier: CC0-1.0

#import <ResearchKit/ResearchKit.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const COVID19InfoStepIdentifier;
FOUNDATION_EXPORT NSString * const COVID19InfoStep_DiagnosisDateIdentifier;
FOUNDATION_EXPORT NSString * const COVID19InfoStep_DiagnosisLocationIdentifier;
FOUNDATION_EXPORT NSString * const COVID19InfoStep_DiagnosisHowMadeIdentifier;
FOUNDATION_EXPORT NSString * const COVID19InfoStep_HadSymptomsIdentifier;
FOUNDATION_EXPORT NSString * const COVID19InfoStep_TreatmentIdentifier;
FOUNDATION_EXPORT NSString * const COVID19InfoStep_TreatmentOtherIdentifier;
FOUNDATION_EXPORT NSString * const COVID19InfoStep_DeceasedIdentifier;
FOUNDATION_EXPORT NSString * const COVID19InfoStep_ComplicationsIdentifier;
FOUNDATION_EXPORT NSString * const COVID19InfoStep_InfectionInquisitionIdentifier;

@interface RCRCOVID19InfoStep : ORKFormStep

+ (instancetype)new;
- (instancetype)init NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
