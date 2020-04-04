// SPDX-License-Identifier: CC0-1.0

@import ResearchKit;

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const MedicationAtDiagnosisStepIdentifier;
FOUNDATION_EXPORT NSString * const MedicationAtDiagnosisStep_StatusIdentifier;

@interface RCRMedicationAtDiagnosisStep : ORKFormStep

+ (instancetype)new;
- (instancetype)init NS_DESIGNATED_INITIALIZER;


@end

NS_ASSUME_NONNULL_END
