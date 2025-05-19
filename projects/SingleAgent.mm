<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!---->
<DataRoot FormatVersion="1.1.0.0" ContentVersion="11.0.6.0" RuntimeVersion="11.0.9.1" FileName="">
    <Objects>
        <CustomProfile>
            <Attributes>
                <AttrObjectColor>
                    <Data v="[0.854902,0.666667,0.509804,1.000000]" t="2"/>
                    <Type v="DataTypeColor" t="3"/>
                </AttrObjectColor>
                <AttrProfileAction>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrProfileAction>
                <AttrProfileAvatar>
                    <Data v="00000000-0000-0000-0000-000000000000" t="3"/>
                    <Type v="DataTypeGlobalID" t="3"/>
                </AttrProfileAvatar>
                <AttrProfileDirectionBias>
                    <Data>
                        <EnumString v="DirectionBiasRightStrong" t="3"/>
                        <EnumValue v="4" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrProfileDirectionBias>
                <AttrProfileHeightDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Constant" t="3"/>
                        <Values v="[1.750000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrProfileHeightDistribution>
                <AttrProfileHorizontalCostDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Uniform" t="3"/>
                        <Values v="[0.750000,1.250000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrProfileHorizontalCostDistribution>
                <AttrProfileMaxAcceleration>
                    <Data v="3.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrProfileMaxAcceleration>
                <AttrProfileMaxTurnRateInDegrees>
                    <Data v="45.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrProfileMaxTurnRateInDegrees>
                <AttrProfileMovementStandard>
                    <Data>
                        <EnumString v="MovementStandardFruin" t="3"/>
                        <EnumValue v="1" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrProfileMovementStandard>
                <AttrProfileNetwork>
                    <Data v="00000000-0000-0000-0000-000000000000" t="3"/>
                    <Type v="DataTypeGlobalID" t="3"/>
                </AttrProfileNetwork>
                <AttrProfilePersonalSpaceDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Constant" t="3"/>
                        <Values v="[2.000000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrProfilePersonalSpaceDistribution>
                <AttrProfilePersonalSpaceEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrProfilePersonalSpaceEnabled>
                <AttrProfileProcessingCostDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Uniform" t="3"/>
                        <Values v="[0.750000,1.250000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrProfileProcessingCostDistribution>
                <AttrProfileProfileType>
                    <Data>
                        <EnumString v="ProfileTypeFruinCommuter" t="3"/>
                        <EnumValue v="1" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrProfileProfileType>
                <AttrProfileQueueCostDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Uniform" t="3"/>
                        <Values v="[0.750000,1.250000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrProfileQueueCostDistribution>
                <AttrProfileRadiusDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Constant" t="3"/>
                        <Values v="[0.250000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrProfileRadiusDistribution>
                <AttrProfileRadiusType>
                    <Data>
                        <EnumString v="RadiusTypeFruinCommuter" t="3"/>
                        <EnumValue v="1" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrProfileRadiusType>
                <AttrProfileShuffleSpeedFactor>
                    <Data v="0.100000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrProfileShuffleSpeedFactor>
                <AttrProfileSpeedDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Normal" t="3"/>
                        <Values v="[0.650000,2.050000,1.350000,0.250000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrProfileSpeedDistribution>
                <AttrProfileSpeedType>
                    <Data>
                        <EnumString v="SpeedTypeFruinCommuter" t="3"/>
                        <EnumValue v="1" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrProfileSpeedType>
                <AttrProfileUseDefaultNetwork>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrProfileUseDefaultNetwork>
                <AttrProfileVerticalCostDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Uniform" t="3"/>
                        <Values v="[0.750000,1.250000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrProfileVerticalCostDistribution>
            </Attributes>
            <GlobalID v="dad30a64-b928-493c-8d0d-a4f26b18710a" t="3"/>
            <ID v="8" t="1"/>
            <Name v="CustomProfile" t="3"/>
            <ObjectSubType v="Profile" t="3"/>
            <ObjectType v="Profile" t="3"/>
        </CustomProfile>
        <DefaultProfile>
            <Attributes>
                <AttrObjectColor>
                    <Data v="[0.854902,0.666667,0.509804,1.000000]" t="2"/>
                    <Type v="DataTypeColor" t="3"/>
                </AttrObjectColor>
                <AttrProfileAction>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrProfileAction>
                <AttrProfileAvatar>
                    <Data v="00000000-0000-0000-0000-000000000000" t="3"/>
                    <Type v="DataTypeGlobalID" t="3"/>
                </AttrProfileAvatar>
                <AttrProfileDirectionBias>
                    <Data>
                        <EnumString v="DirectionBiasRightStrong" t="3"/>
                        <EnumValue v="4" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrProfileDirectionBias>
                <AttrProfileHeightDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Constant" t="3"/>
                        <Values v="[1.750000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrProfileHeightDistribution>
                <AttrProfileHorizontalCostDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Uniform" t="3"/>
                        <Values v="[0.750000,1.250000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrProfileHorizontalCostDistribution>
                <AttrProfileMaxAcceleration>
                    <Data v="3.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrProfileMaxAcceleration>
                <AttrProfileMaxTurnRateInDegrees>
                    <Data v="45.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrProfileMaxTurnRateInDegrees>
                <AttrProfileMovementStandard>
                    <Data>
                        <EnumString v="MovementStandardFruin" t="3"/>
                        <EnumValue v="1" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrProfileMovementStandard>
                <AttrProfileNetwork>
                    <Data v="00000000-0000-0000-0000-000000000000" t="3"/>
                    <Type v="DataTypeGlobalID" t="3"/>
                </AttrProfileNetwork>
                <AttrProfilePersonalSpaceDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Constant" t="3"/>
                        <Values v="[2.000000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrProfilePersonalSpaceDistribution>
                <AttrProfilePersonalSpaceEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrProfilePersonalSpaceEnabled>
                <AttrProfileProcessingCostDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Uniform" t="3"/>
                        <Values v="[0.750000,1.250000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrProfileProcessingCostDistribution>
                <AttrProfileProfileType>
                    <Data>
                        <EnumString v="ProfileTypeFruinCommuter" t="3"/>
                        <EnumValue v="1" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrProfileProfileType>
                <AttrProfileQueueCostDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Uniform" t="3"/>
                        <Values v="[0.750000,1.250000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrProfileQueueCostDistribution>
                <AttrProfileRadiusDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Constant" t="3"/>
                        <Values v="[0.250000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrProfileRadiusDistribution>
                <AttrProfileRadiusType>
                    <Data>
                        <EnumString v="RadiusTypeFruinCommuter" t="3"/>
                        <EnumValue v="1" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrProfileRadiusType>
                <AttrProfileShuffleSpeedFactor>
                    <Data v="0.100000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrProfileShuffleSpeedFactor>
                <AttrProfileSpeedDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Normal" t="3"/>
                        <Values v="[0.650000,2.050000,1.350000,0.250000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrProfileSpeedDistribution>
                <AttrProfileSpeedType>
                    <Data>
                        <EnumString v="SpeedTypeFruinCommuter" t="3"/>
                        <EnumValue v="1" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrProfileSpeedType>
                <AttrProfileUseDefaultNetwork>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrProfileUseDefaultNetwork>
                <AttrProfileVerticalCostDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Uniform" t="3"/>
                        <Values v="[0.750000,1.250000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrProfileVerticalCostDistribution>
            </Attributes>
            <GlobalID v="a83e5662-81c5-4e8d-9823-a6e9fb979967" t="3"/>
            <ID v="0" t="1"/>
            <Name v="DefaultProfile" t="3"/>
            <ObjectSubType v="Profile" t="3"/>
            <ObjectType v="Profile" t="3"/>
        </DefaultProfile>
        <Floor>
            <Attributes>
                <AttrEnabled>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrEnabled>
                <AttrNetworkActorDistanceCost>
                    <Data v="0.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrNetworkActorDistanceCost>
                <AttrNetworkMemberActionEnter>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrNetworkMemberActionEnter>
                <AttrNetworkMemberActionExit>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrNetworkMemberActionExit>
                <AttrNetworkZonesAsPrimaryMember>
                    <Data v="[]" t="3"/>
                    <Type v="DataTypeSetGlobalID" t="3"/>
                </AttrNetworkZonesAsPrimaryMember>
                <AttrObjectColor>
                    <Data v="[0.584000,0.729000,0.788000,1.000000]" t="2"/>
                    <Type v="DataTypeColor" t="3"/>
                </AttrObjectColor>
                <AttrSceneObjectTransformGroup>
                    <Data v="00000000-0000-0000-0000-000000000000" t="3"/>
                    <Type v="DataTypeGlobalID" t="3"/>
                </AttrSceneObjectTransformGroup>
                <AttrSurfaceMapResolution>
                    <Data>
                        <EnumString v="SurfaceMapResolution10cm" t="3"/>
                        <EnumValue v="2" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrSurfaceMapResolution>
                <AttrVisible>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrVisible>
                <AttrWalkableActorIsIgnoreBarrieres>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorIsIgnoreBarrieres>
                <AttrWalkableActorIsIgnoreNeighbors>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorIsIgnoreNeighbors>
                <AttrWalkableActorIsVirtual>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorIsVirtual>
                <AttrWalkableActorLocalAgentRadius>
                    <Data v="0.250000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrWalkableActorLocalAgentRadius>
                <AttrWalkableActorLocalAgentRadiusEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalAgentRadiusEnabled>
                <AttrWalkableActorLocalDirectionBias>
                    <Data>
                        <EnumString v="DirectionBiasRightStrong" t="3"/>
                        <EnumValue v="4" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrWalkableActorLocalDirectionBias>
                <AttrWalkableActorLocalDirectionBiasEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalDirectionBiasEnabled>
                <AttrWalkableActorLocalMaxSpeedEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalMaxSpeedEnabled>
                <AttrWalkableActorLocalMaxSpeedFlat>
                    <Data v="1.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrWalkableActorLocalMaxSpeedFlat>
                <AttrWalkableActorLocalMovementStandard>
                    <Data>
                        <EnumString v="MovementStandardFruin" t="3"/>
                        <EnumValue v="1" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrWalkableActorLocalMovementStandard>
                <AttrWalkableActorLocalMovementStandardEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalMovementStandardEnabled>
            </Attributes>
            <Body>
                <Geometry>
                    <Geometry0>
                        <Faces v="[0,1,2,1,2,3]" t="1"/>
                        <GeometryType v="MeshGeometry" t="3"/>
                        <Vertices v="[-5.000000,0.000000,-5.000000,-5.000000,0.000000,5.000000,5.000000,0.000000,-5.000000,5.000000,0.000000,5.000000]" t="2"/>
                    </Geometry0>
                </Geometry>
            </Body>
            <GlobalID v="d6ecf126-9dd9-42fb-ba54-9a9179dcf9cc" t="3"/>
            <ID v="1" t="1"/>
            <Name v="Floor" t="3"/>
            <ObjectSubType v="FloorActor" t="3"/>
            <ObjectType v="Actor" t="3"/>
        </Floor>
        <Floor_dup>
            <Attributes>
                <AttrEnabled>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrEnabled>
                <AttrNetworkActorDistanceCost>
                    <Data v="0.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrNetworkActorDistanceCost>
                <AttrNetworkMemberActionEnter>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrNetworkMemberActionEnter>
                <AttrNetworkMemberActionExit>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrNetworkMemberActionExit>
                <AttrNetworkZonesAsPrimaryMember>
                    <Data v="[]" t="3"/>
                    <Type v="DataTypeSetGlobalID" t="3"/>
                </AttrNetworkZonesAsPrimaryMember>
                <AttrObjectColor>
                    <Data v="[0.584000,0.729000,0.788000,1.000000]" t="2"/>
                    <Type v="DataTypeColor" t="3"/>
                </AttrObjectColor>
                <AttrSceneObjectTransformGroup>
                    <Data v="00000000-0000-0000-0000-000000000000" t="3"/>
                    <Type v="DataTypeGlobalID" t="3"/>
                </AttrSceneObjectTransformGroup>
                <AttrSurfaceMapResolution>
                    <Data>
                        <EnumString v="SurfaceMapResolution10cm" t="3"/>
                        <EnumValue v="2" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrSurfaceMapResolution>
                <AttrVisible>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrVisible>
                <AttrWalkableActorIsIgnoreBarrieres>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorIsIgnoreBarrieres>
                <AttrWalkableActorIsIgnoreNeighbors>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorIsIgnoreNeighbors>
                <AttrWalkableActorIsVirtual>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorIsVirtual>
                <AttrWalkableActorLocalAgentRadius>
                    <Data v="0.250000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrWalkableActorLocalAgentRadius>
                <AttrWalkableActorLocalAgentRadiusEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalAgentRadiusEnabled>
                <AttrWalkableActorLocalDirectionBias>
                    <Data>
                        <EnumString v="DirectionBiasRightStrong" t="3"/>
                        <EnumValue v="4" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrWalkableActorLocalDirectionBias>
                <AttrWalkableActorLocalDirectionBiasEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalDirectionBiasEnabled>
                <AttrWalkableActorLocalMaxSpeedEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalMaxSpeedEnabled>
                <AttrWalkableActorLocalMaxSpeedFlat>
                    <Data v="1.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrWalkableActorLocalMaxSpeedFlat>
                <AttrWalkableActorLocalMovementStandard>
                    <Data>
                        <EnumString v="MovementStandardFruin" t="3"/>
                        <EnumValue v="1" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrWalkableActorLocalMovementStandard>
                <AttrWalkableActorLocalMovementStandardEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalMovementStandardEnabled>
            </Attributes>
            <Body>
                <Geometry>
                    <Geometry0>
                        <Faces v="[0,1,2,1,2,3]" t="1"/>
                        <GeometryType v="MeshGeometry" t="3"/>
                        <Vertices v="[-5.000000,0.000000,-15.887646,-5.000000,0.000000,-5.887646,5.000000,0.000000,-15.887646,5.000000,0.000000,-5.887646]" t="2"/>
                    </Geometry0>
                </Geometry>
            </Body>
            <GlobalID v="fb98a60c-a978-4167-b020-e3d2bcfed04b" t="3"/>
            <ID v="2" t="1"/>
            <Name v="Floor_dup" t="3"/>
            <ObjectSubType v="FloorActor" t="3"/>
            <ObjectType v="Actor" t="3"/>
        </Floor_dup>
        <Floor_dup_dup>
            <Attributes>
                <AttrEnabled>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrEnabled>
                <AttrNetworkActorDistanceCost>
                    <Data v="0.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrNetworkActorDistanceCost>
                <AttrNetworkMemberActionEnter>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrNetworkMemberActionEnter>
                <AttrNetworkMemberActionExit>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrNetworkMemberActionExit>
                <AttrNetworkZonesAsPrimaryMember>
                    <Data v="[]" t="3"/>
                    <Type v="DataTypeSetGlobalID" t="3"/>
                </AttrNetworkZonesAsPrimaryMember>
                <AttrObjectColor>
                    <Data v="[0.584000,0.729000,0.788000,1.000000]" t="2"/>
                    <Type v="DataTypeColor" t="3"/>
                </AttrObjectColor>
                <AttrSceneObjectTransformGroup>
                    <Data v="00000000-0000-0000-0000-000000000000" t="3"/>
                    <Type v="DataTypeGlobalID" t="3"/>
                </AttrSceneObjectTransformGroup>
                <AttrSurfaceMapResolution>
                    <Data>
                        <EnumString v="SurfaceMapResolution10cm" t="3"/>
                        <EnumValue v="2" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrSurfaceMapResolution>
                <AttrVisible>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrVisible>
                <AttrWalkableActorIsIgnoreBarrieres>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorIsIgnoreBarrieres>
                <AttrWalkableActorIsIgnoreNeighbors>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorIsIgnoreNeighbors>
                <AttrWalkableActorIsVirtual>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorIsVirtual>
                <AttrWalkableActorLocalAgentRadius>
                    <Data v="0.250000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrWalkableActorLocalAgentRadius>
                <AttrWalkableActorLocalAgentRadiusEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalAgentRadiusEnabled>
                <AttrWalkableActorLocalDirectionBias>
                    <Data>
                        <EnumString v="DirectionBiasRightStrong" t="3"/>
                        <EnumValue v="4" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrWalkableActorLocalDirectionBias>
                <AttrWalkableActorLocalDirectionBiasEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalDirectionBiasEnabled>
                <AttrWalkableActorLocalMaxSpeedEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalMaxSpeedEnabled>
                <AttrWalkableActorLocalMaxSpeedFlat>
                    <Data v="1.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrWalkableActorLocalMaxSpeedFlat>
                <AttrWalkableActorLocalMovementStandard>
                    <Data>
                        <EnumString v="MovementStandardFruin" t="3"/>
                        <EnumValue v="1" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrWalkableActorLocalMovementStandard>
                <AttrWalkableActorLocalMovementStandardEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalMovementStandardEnabled>
            </Attributes>
            <Body>
                <Geometry>
                    <Geometry0>
                        <Faces v="[0,1,2,1,2,3]" t="1"/>
                        <GeometryType v="MeshGeometry" t="3"/>
                        <Vertices v="[-5.000000,0.000000,-26.642218,-5.000000,0.000000,-16.642218,5.000000,0.000000,-26.642218,5.000000,0.000000,-16.642218]" t="2"/>
                    </Geometry0>
                </Geometry>
            </Body>
            <GlobalID v="6abb1817-56b5-442e-8948-2a1b7a2ce97c" t="3"/>
            <ID v="3" t="1"/>
            <Name v="Floor_dup_dup" t="3"/>
            <ObjectSubType v="FloorActor" t="3"/>
            <ObjectType v="Actor" t="3"/>
        </Floor_dup_dup>
        <Journey>
            <Attributes>
                <AttrEnabled>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrEnabled>
                <AttrEventBirthAction>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrEventBirthAction>
                <AttrEventBirthProfile>
                    <Data v="dad30a64-b928-493c-8d0d-a4f26b18710a" t="3"/>
                    <Type v="DataTypeGlobalID" t="3"/>
                </AttrEventBirthProfile>
                <AttrEventColorScheme>
                    <Data>
                        <FallbackData>
                            <Color v="[1.000000,0.500000,0.000000,1.000000]" t="2"/>
                        </FallbackData>
                        <Rules/>
                        <UseFallbackData v="1" t="0"/>
                    </Data>
                    <Type v="DataTypeTestColorScheme" t="3"/>
                </AttrEventColorScheme>
                <AttrEventColorType>
                    <Data>
                        <EnumString v="EventColorObjectEqual" t="3"/>
                        <EnumValue v="0" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrEventColorType>
                <AttrEventDemandType>
                    <Data>
                        <EnumString v="DemandDistribution" t="3"/>
                        <EnumValue v="2" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrEventDemandType>
                <AttrEventDemandWeightData>
                    <Data v="[]" t="2"/>
                    <Type v="DataTypeVectorDouble" t="3"/>
                </AttrEventDemandWeightData>
                <AttrEventDestinationType>
                    <Data>
                        <EnumString v="DestinationAssigned" t="3"/>
                        <EnumValue v="1" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrEventDestinationType>
                <AttrEventDurationDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Uniform" t="3"/>
                        <Values v="[0.000000,1.000000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrEventDurationDistribution>
                <AttrEventPopulationByDestination>
                    <Data v="[0.000000]" t="2"/>
                    <Type v="DataTypeVectorDouble" t="3"/>
                </AttrEventPopulationByDestination>
                <AttrEventPopulationByOrigin>
                    <Data v="[0.000000]" t="2"/>
                    <Type v="DataTypeVectorDouble" t="3"/>
                </AttrEventPopulationByOrigin>
                <AttrEventPopulationByOriginDestination>
                    <Data v="[0.000000]" t="2"/>
                    <Type v="DataTypeVectorDouble" t="3"/>
                </AttrEventPopulationByOriginDestination>
                <AttrEventPopulationCount>
                    <Data v="1" t="1"/>
                    <Type v="DataTypeInt" t="3"/>
                </AttrEventPopulationCount>
                <AttrEventPopulationCountByPortal>
                    <Data v="1" t="1"/>
                    <Type v="DataTypeInt" t="3"/>
                </AttrEventPopulationCountByPortal>
                <AttrEventPopulationCountType>
                    <Data>
                        <EnumString v="PopulationCountTotal" t="3"/>
                        <EnumValue v="0" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrEventPopulationCountType>
                <AttrEventPopulationDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Uniform" t="3"/>
                        <Values v="[50.000000,100.000000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrEventPopulationDistribution>
                <AttrEventPopulationScheduleData>
                    <Data v="[]" t="2"/>
                    <Type v="DataTypeVectorDouble" t="3"/>
                </AttrEventPopulationScheduleData>
                <AttrEventStartTrigger>
                    <Data>
                        <CompareType v="CompareEqual" t="3"/>
                        <CooldownSeconds v="0" t="1"/>
                        <TimeReference>
                            <GlobalID v="00000000-0000-0000-0000-000000000000" t="3"/>
                            <TimeInSeconds v="00:00:00" t="3"/>
                            <TimeType v="TimeSimulationStart" t="3"/>
                        </TimeReference>
                        <TriggerType v="TriggerTimeSimulationStart" t="3"/>
                    </Data>
                    <Type v="DataTypeTrigger" t="3"/>
                </AttrEventStartTrigger>
                <AttrEventWeightedDestinations>
                    <Data>
                        <GlobalIDs v="[aa7a4bb2-9118-45ab-83a3-66c2f47ec02a]" t="3"/>
                        <WeightedType v="WeightedNone" t="3"/>
                        <Weights v="[0.000000]" t="2"/>
                    </Data>
                    <Type v="DataTypeVectorWeightedGlobalID" t="3"/>
                </AttrEventWeightedDestinations>
                <AttrEventWeightedOrigins>
                    <Data>
                        <GlobalIDs v="[5d6b608d-31c0-4f01-a86d-2d1d203022f7]" t="3"/>
                        <WeightedType v="WeightedNone" t="3"/>
                        <Weights v="[0.000000]" t="2"/>
                    </Data>
                    <Type v="DataTypeVectorWeightedGlobalID" t="3"/>
                </AttrEventWeightedOrigins>
                <AttrObjectColor>
                    <Data v="[1.000000,0.500000,0.000000,1.000000]" t="2"/>
                    <Type v="DataTypeColor" t="3"/>
                </AttrObjectColor>
            </Attributes>
            <GlobalID v="a60a3a57-d66b-4705-9043-b64c5fd360ec" t="3"/>
            <ID v="9" t="1"/>
            <Name v="Journey" t="3"/>
            <ObjectSubType v="EventJourney" t="3"/>
            <ObjectType v="Event" t="3"/>
        </Journey>
        <Link>
            <Attributes>
                <AttrCEActorActionAlphaEnter>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrCEActorActionAlphaEnter>
                <AttrCEActorActionAlphaExit>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrCEActorActionAlphaExit>
                <AttrCEActorActionOmegaEnter>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrCEActorActionOmegaEnter>
                <AttrCEActorActionOmegaExit>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrCEActorActionOmegaExit>
                <AttrCEActorBank>
                    <Data v="00000000-0000-0000-0000-000000000000" t="3"/>
                    <Type v="DataTypeGlobalID" t="3"/>
                </AttrCEActorBank>
                <AttrCEActorControlFlowEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrCEActorControlFlowEnabled>
                <AttrCEActorControlFlowRate>
                    <Data v="100.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrCEActorControlFlowRate>
                <AttrCEActorControlFlowRatePerMeter>
                    <Data v="50.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrCEActorControlFlowRatePerMeter>
                <AttrCEActorControlFlowType>
                    <Data>
                        <EnumString v="FlowRateAbsolute" t="3"/>
                        <EnumValue v="0" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrCEActorControlFlowType>
                <AttrCEActorDelayInDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Constant" t="3"/>
                        <Values v="[0.000000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrCEActorDelayInDistribution>
                <AttrCEActorDelayOutDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Constant" t="3"/>
                        <Values v="[0.000000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrCEActorDelayOutDistribution>
                <AttrCEActorDirection>
                    <Data>
                        <EnumString v="DirectionBidirectional" t="3"/>
                        <EnumValue v="2" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrCEActorDirection>
                <AttrCEActorGateCost>
                    <Data v="20.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrCEActorGateCost>
                <AttrCEActorGateDefaultState>
                    <Data>
                        <EnumString v="CommandClose" t="3"/>
                        <EnumValue v="1" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrCEActorGateDefaultState>
                <AttrCEActorGateEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrCEActorGateEnabled>
                <AttrCEActorGateIgnoreOthersWhenWaiting>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrCEActorGateIgnoreOthersWhenWaiting>
                <AttrCEActorGateWaitStyle>
                    <Data>
                        <WaitStyleType v="WaitFocus" t="3"/>
                    </Data>
                    <Type v="DataTypeWaitStyle" t="3"/>
                </AttrCEActorGateWaitStyle>
                <AttrCEActorMarshalEnabled>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrCEActorMarshalEnabled>
                <AttrCEActorOpposingFlowCostFactor>
                    <Data v="1.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrCEActorOpposingFlowCostFactor>
                <AttrCEActorPerimeters>
                    <Data v="[]" t="3"/>
                    <Type v="DataTypeSetGlobalID" t="3"/>
                </AttrCEActorPerimeters>
                <AttrCEActorPriorityCommitWhenWaiting>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrCEActorPriorityCommitWhenWaiting>
                <AttrCEActorPriorityCost>
                    <Data v="10.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrCEActorPriorityCost>
                <AttrCEActorPriorityDirection>
                    <Data>
                        <EnumString v="DirectionAlphaToOmega" t="3"/>
                        <EnumValue v="0" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrCEActorPriorityDirection>
                <AttrCEActorPriorityDistance>
                    <Data v="1.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrCEActorPriorityDistance>
                <AttrCEActorPriorityEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrCEActorPriorityEnabled>
                <AttrCEActorPriorityPrimaryYieldToSecondary>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrCEActorPriorityPrimaryYieldToSecondary>
                <AttrCEActorPrioritySecondaryClearArea>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrCEActorPrioritySecondaryClearArea>
                <AttrCEActorPrioritySecondsUntilOpen>
                    <Data v="2.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrCEActorPrioritySecondsUntilOpen>
                <AttrDrawCEDirection>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrDrawCEDirection>
                <AttrDrawFlagGate>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrDrawFlagGate>
                <AttrDrawFlagGoalLine>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrDrawFlagGoalLine>
                <AttrDrawPriorityFlow>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrDrawPriorityFlow>
                <AttrEnabled>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrEnabled>
                <AttrLinkGeometryType>
                    <Data>
                        <EnumString v="MeshGeometry" t="3"/>
                        <EnumValue v="0" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrLinkGeometryType>
                <AttrLinkLength>
                    <Data v="2.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrLinkLength>
                <AttrLinkWidth>
                    <Data v="1.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrLinkWidth>
                <AttrNetworkActorDistanceCost>
                    <Data v="0.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrNetworkActorDistanceCost>
                <AttrNetworkActorQueueCostFactor>
                    <Data v="1.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrNetworkActorQueueCostFactor>
                <AttrNetworkZonesAsPrimaryMember>
                    <Data v="[]" t="3"/>
                    <Type v="DataTypeSetGlobalID" t="3"/>
                </AttrNetworkZonesAsPrimaryMember>
                <AttrObjectColor>
                    <Data v="[0.901961,0.901961,0.000000,1.000000]" t="2"/>
                    <Type v="DataTypeColor" t="3"/>
                </AttrObjectColor>
                <AttrSceneObjectTransformGroup>
                    <Data v="00000000-0000-0000-0000-000000000000" t="3"/>
                    <Type v="DataTypeGlobalID" t="3"/>
                </AttrSceneObjectTransformGroup>
                <AttrSurfaceMapResolution>
                    <Data>
                        <EnumString v="SurfaceMapResolution10cm" t="3"/>
                        <EnumValue v="2" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrSurfaceMapResolution>
                <AttrVisible>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrVisible>
                <AttrWalkableActorIsIgnoreBarrieres>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorIsIgnoreBarrieres>
                <AttrWalkableActorIsIgnoreNeighbors>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorIsIgnoreNeighbors>
                <AttrWalkableActorIsVirtual>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorIsVirtual>
                <AttrWalkableActorLocalAgentRadius>
                    <Data v="0.250000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrWalkableActorLocalAgentRadius>
                <AttrWalkableActorLocalAgentRadiusEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalAgentRadiusEnabled>
                <AttrWalkableActorLocalDirectionBias>
                    <Data>
                        <EnumString v="DirectionBiasRightStrong" t="3"/>
                        <EnumValue v="4" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrWalkableActorLocalDirectionBias>
                <AttrWalkableActorLocalDirectionBiasEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalDirectionBiasEnabled>
                <AttrWalkableActorLocalMaxSpeedEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalMaxSpeedEnabled>
                <AttrWalkableActorLocalMaxSpeedFlat>
                    <Data v="1.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrWalkableActorLocalMaxSpeedFlat>
                <AttrWalkableActorLocalMovementStandard>
                    <Data>
                        <EnumString v="MovementStandardFruin" t="3"/>
                        <EnumValue v="1" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrWalkableActorLocalMovementStandard>
                <AttrWalkableActorLocalMovementStandardEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalMovementStandardEnabled>
            </Attributes>
            <Body>
                <Attributes>
                    <AttrCEActorGoalLineTransposed>
                        <Data v="0" t="0"/>
                        <Type v="DataTypeBool" t="3"/>
                    </AttrCEActorGoalLineTransposed>
                    <AttrCEActorGoalPointPositions>
                        <Data v="[-0.061973,0.030000,-6.193759,-0.661973,0.030000,-6.193759,-0.661973,0.030000,-4.593759,-0.061973,0.030000,-4.593759]" t="2"/>
                        <Type v="DataTypeVectorDouble" t="3"/>
                    </AttrCEActorGoalPointPositions>
                    <AttrCEActorGoalVertexIndices>
                        <Data v="[2,0,1,3]" t="1"/>
                        <Type v="DataTypeVectorInt" t="3"/>
                    </AttrCEActorGoalVertexIndices>
                </Attributes>
                <Geometry>
                    <Geometry0>
                        <Faces v="[0,1,2,1,2,3]" t="1"/>
                        <GeometryType v="MeshGeometry" t="3"/>
                        <Vertices v="[-0.861973,0.020000,-6.393759,-0.861973,0.020000,-4.393759,0.138027,0.020000,-6.393759,0.138027,0.020000,-4.393759]" t="2"/>
                    </Geometry0>
                </Geometry>
            </Body>
            <GlobalID v="68c3790b-ed6a-4c3d-bca2-f9b1621e2286" t="3"/>
            <ID v="4" t="1"/>
            <Name v="Link" t="3"/>
            <ObjectSubType v="LinkActor" t="3"/>
            <ObjectType v="Actor" t="3"/>
        </Link>
        <Link_dup>
            <Attributes>
                <AttrCEActorActionAlphaEnter>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrCEActorActionAlphaEnter>
                <AttrCEActorActionAlphaExit>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrCEActorActionAlphaExit>
                <AttrCEActorActionOmegaEnter>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrCEActorActionOmegaEnter>
                <AttrCEActorActionOmegaExit>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrCEActorActionOmegaExit>
                <AttrCEActorBank>
                    <Data v="00000000-0000-0000-0000-000000000000" t="3"/>
                    <Type v="DataTypeGlobalID" t="3"/>
                </AttrCEActorBank>
                <AttrCEActorControlFlowEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrCEActorControlFlowEnabled>
                <AttrCEActorControlFlowRate>
                    <Data v="100.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrCEActorControlFlowRate>
                <AttrCEActorControlFlowRatePerMeter>
                    <Data v="50.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrCEActorControlFlowRatePerMeter>
                <AttrCEActorControlFlowType>
                    <Data>
                        <EnumString v="FlowRateAbsolute" t="3"/>
                        <EnumValue v="0" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrCEActorControlFlowType>
                <AttrCEActorDelayInDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Constant" t="3"/>
                        <Values v="[0.000000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrCEActorDelayInDistribution>
                <AttrCEActorDelayOutDistribution>
                    <Data>
                        <!--Constant: [value,,,], Uniform: [min,max,,], Normal: [min,max,mean,std], Triangular: [min,max,mode,], Exponential: [min,max,lambda]-->
                        <Type v="Constant" t="3"/>
                        <Values v="[0.000000]" t="2"/>
                    </Data>
                    <Type v="DataTypeDistribution" t="3"/>
                </AttrCEActorDelayOutDistribution>
                <AttrCEActorDirection>
                    <Data>
                        <EnumString v="DirectionBidirectional" t="3"/>
                        <EnumValue v="2" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrCEActorDirection>
                <AttrCEActorGateCost>
                    <Data v="20.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrCEActorGateCost>
                <AttrCEActorGateDefaultState>
                    <Data>
                        <EnumString v="CommandClose" t="3"/>
                        <EnumValue v="1" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrCEActorGateDefaultState>
                <AttrCEActorGateEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrCEActorGateEnabled>
                <AttrCEActorGateIgnoreOthersWhenWaiting>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrCEActorGateIgnoreOthersWhenWaiting>
                <AttrCEActorGateWaitStyle>
                    <Data>
                        <WaitStyleType v="WaitFocus" t="3"/>
                    </Data>
                    <Type v="DataTypeWaitStyle" t="3"/>
                </AttrCEActorGateWaitStyle>
                <AttrCEActorMarshalEnabled>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrCEActorMarshalEnabled>
                <AttrCEActorOpposingFlowCostFactor>
                    <Data v="1.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrCEActorOpposingFlowCostFactor>
                <AttrCEActorPerimeters>
                    <Data v="[]" t="3"/>
                    <Type v="DataTypeSetGlobalID" t="3"/>
                </AttrCEActorPerimeters>
                <AttrCEActorPriorityCommitWhenWaiting>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrCEActorPriorityCommitWhenWaiting>
                <AttrCEActorPriorityCost>
                    <Data v="10.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrCEActorPriorityCost>
                <AttrCEActorPriorityDirection>
                    <Data>
                        <EnumString v="DirectionAlphaToOmega" t="3"/>
                        <EnumValue v="0" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrCEActorPriorityDirection>
                <AttrCEActorPriorityDistance>
                    <Data v="1.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrCEActorPriorityDistance>
                <AttrCEActorPriorityEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrCEActorPriorityEnabled>
                <AttrCEActorPriorityPrimaryYieldToSecondary>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrCEActorPriorityPrimaryYieldToSecondary>
                <AttrCEActorPrioritySecondaryClearArea>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrCEActorPrioritySecondaryClearArea>
                <AttrCEActorPrioritySecondsUntilOpen>
                    <Data v="2.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrCEActorPrioritySecondsUntilOpen>
                <AttrDrawCEDirection>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrDrawCEDirection>
                <AttrDrawFlagGate>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrDrawFlagGate>
                <AttrDrawFlagGoalLine>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrDrawFlagGoalLine>
                <AttrDrawPriorityFlow>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrDrawPriorityFlow>
                <AttrEnabled>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrEnabled>
                <AttrLinkGeometryType>
                    <Data>
                        <EnumString v="MeshGeometry" t="3"/>
                        <EnumValue v="0" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrLinkGeometryType>
                <AttrLinkLength>
                    <Data v="2.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrLinkLength>
                <AttrLinkWidth>
                    <Data v="1.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrLinkWidth>
                <AttrNetworkActorDistanceCost>
                    <Data v="0.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrNetworkActorDistanceCost>
                <AttrNetworkActorQueueCostFactor>
                    <Data v="1.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrNetworkActorQueueCostFactor>
                <AttrNetworkZonesAsPrimaryMember>
                    <Data v="[]" t="3"/>
                    <Type v="DataTypeSetGlobalID" t="3"/>
                </AttrNetworkZonesAsPrimaryMember>
                <AttrObjectColor>
                    <Data v="[0.901961,0.901961,0.000000,1.000000]" t="2"/>
                    <Type v="DataTypeColor" t="3"/>
                </AttrObjectColor>
                <AttrSceneObjectTransformGroup>
                    <Data v="00000000-0000-0000-0000-000000000000" t="3"/>
                    <Type v="DataTypeGlobalID" t="3"/>
                </AttrSceneObjectTransformGroup>
                <AttrSurfaceMapResolution>
                    <Data>
                        <EnumString v="SurfaceMapResolution10cm" t="3"/>
                        <EnumValue v="2" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrSurfaceMapResolution>
                <AttrVisible>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrVisible>
                <AttrWalkableActorIsIgnoreBarrieres>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorIsIgnoreBarrieres>
                <AttrWalkableActorIsIgnoreNeighbors>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorIsIgnoreNeighbors>
                <AttrWalkableActorIsVirtual>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorIsVirtual>
                <AttrWalkableActorLocalAgentRadius>
                    <Data v="0.250000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrWalkableActorLocalAgentRadius>
                <AttrWalkableActorLocalAgentRadiusEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalAgentRadiusEnabled>
                <AttrWalkableActorLocalDirectionBias>
                    <Data>
                        <EnumString v="DirectionBiasRightStrong" t="3"/>
                        <EnumValue v="4" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrWalkableActorLocalDirectionBias>
                <AttrWalkableActorLocalDirectionBiasEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalDirectionBiasEnabled>
                <AttrWalkableActorLocalMaxSpeedEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalMaxSpeedEnabled>
                <AttrWalkableActorLocalMaxSpeedFlat>
                    <Data v="1.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrWalkableActorLocalMaxSpeedFlat>
                <AttrWalkableActorLocalMovementStandard>
                    <Data>
                        <EnumString v="MovementStandardFruin" t="3"/>
                        <EnumValue v="1" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrWalkableActorLocalMovementStandard>
                <AttrWalkableActorLocalMovementStandardEnabled>
                    <Data v="0" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrWalkableActorLocalMovementStandardEnabled>
            </Attributes>
            <Body>
                <Attributes>
                    <AttrCEActorGoalLineTransposed>
                        <Data v="0" t="0"/>
                        <Type v="DataTypeBool" t="3"/>
                    </AttrCEActorGoalLineTransposed>
                    <AttrCEActorGoalPointPositions>
                        <Data v="[-0.061973,0.030000,-17.078516,-0.661973,0.030000,-17.078516,-0.661973,0.030000,-15.478516,-0.061973,0.030000,-15.478516]" t="2"/>
                        <Type v="DataTypeVectorDouble" t="3"/>
                    </AttrCEActorGoalPointPositions>
                    <AttrCEActorGoalVertexIndices>
                        <Data v="[2,0,1,3]" t="1"/>
                        <Type v="DataTypeVectorInt" t="3"/>
                    </AttrCEActorGoalVertexIndices>
                </Attributes>
                <Geometry>
                    <Geometry0>
                        <Faces v="[0,1,2,1,2,3]" t="1"/>
                        <GeometryType v="MeshGeometry" t="3"/>
                        <Vertices v="[-0.861973,0.020000,-17.278517,-0.861973,0.020000,-15.278516,0.138027,0.020000,-17.278517,0.138027,0.020000,-15.278516]" t="2"/>
                    </Geometry0>
                </Geometry>
            </Body>
            <GlobalID v="3be004a3-35f5-4d36-9e8f-8ff22db731b1" t="3"/>
            <ID v="5" t="1"/>
            <Name v="Link_dup" t="3"/>
            <ObjectSubType v="LinkActor" t="3"/>
            <ObjectType v="Actor" t="3"/>
        </Link_dup>
        <Portal>
            <Attributes>
                <AttrDrawFlagGoalLine>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrDrawFlagGoalLine>
                <AttrDrawStartAngle>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrDrawStartAngle>
                <AttrEnabled>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrEnabled>
                <AttrNetworkActorDistanceCost>
                    <Data v="0.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrNetworkActorDistanceCost>
                <AttrObjectColor>
                    <Data v="[0.000000,0.533000,0.000000,1.000000]" t="2"/>
                    <Type v="DataTypeColor" t="3"/>
                </AttrObjectColor>
                <AttrPortalActionEnter>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrPortalActionEnter>
                <AttrPortalActionWaypoint>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrPortalActionWaypoint>
                <AttrPortalDistribution>
                    <Data>
                        <EnumString v="DistributionAlongLine" t="3"/>
                        <EnumValue v="0" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrPortalDistribution>
                <AttrPortalNetworkBehavior>
                    <Data>
                        <EnumString v="NetworkBehaviorEntranceAndWaypoint" t="3"/>
                        <EnumValue v="2" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrPortalNetworkBehavior>
                <AttrPortalSpawnAngleDegrees>
                    <Data v="0.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrPortalSpawnAngleDegrees>
                <AttrSceneObjectTransformGroup>
                    <Data v="00000000-0000-0000-0000-000000000000" t="3"/>
                    <Type v="DataTypeGlobalID" t="3"/>
                </AttrSceneObjectTransformGroup>
                <AttrVisible>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrVisible>
            </Attributes>
            <Body>
                <Attributes>
                    <AttrPortalGoalEdgeIndices>
                        <Data v="[0,4]" t="1"/>
                        <Type v="DataTypeVectorInt" t="3"/>
                    </AttrPortalGoalEdgeIndices>
                    <AttrPortalGoalPointPositions>
                        <Data v="[-2.304095,0.030000,4.072562,2.295905,0.030000,4.072562]" t="2"/>
                        <Type v="DataTypeVectorDouble" t="3"/>
                    </AttrPortalGoalPointPositions>
                </Attributes>
                <Geometry>
                    <Geometry0>
                        <Faces v="[0,1,2,1,2,3]" t="1"/>
                        <GeometryType v="MeshGeometry" t="3"/>
                        <Vertices v="[-2.504095,0.020000,3.822562,-2.504095,0.020000,4.322562,2.495905,0.020000,3.822562,2.495905,0.020000,4.322562]" t="2"/>
                    </Geometry0>
                </Geometry>
            </Body>
            <GlobalID v="5d6b608d-31c0-4f01-a86d-2d1d203022f7" t="3"/>
            <ID v="6" t="1"/>
            <Name v="Portal" t="3"/>
            <ObjectSubType v="PortalActor" t="3"/>
            <ObjectType v="Actor" t="3"/>
        </Portal>
        <Portal1>
            <Attributes>
                <AttrDrawFlagGoalLine>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrDrawFlagGoalLine>
                <AttrDrawStartAngle>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrDrawStartAngle>
                <AttrEnabled>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrEnabled>
                <AttrNetworkActorDistanceCost>
                    <Data v="0.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrNetworkActorDistanceCost>
                <AttrObjectColor>
                    <Data v="[0.000000,0.533000,0.000000,1.000000]" t="2"/>
                    <Type v="DataTypeColor" t="3"/>
                </AttrObjectColor>
                <AttrPortalActionEnter>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrPortalActionEnter>
                <AttrPortalActionWaypoint>
                    <Data>
                        <ActionType v="ActionNone" t="3"/>
                    </Data>
                    <Type v="DataTypeAction" t="3"/>
                </AttrPortalActionWaypoint>
                <AttrPortalDistribution>
                    <Data>
                        <EnumString v="DistributionAlongLine" t="3"/>
                        <EnumValue v="0" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrPortalDistribution>
                <AttrPortalNetworkBehavior>
                    <Data>
                        <EnumString v="NetworkBehaviorEntranceAndWaypoint" t="3"/>
                        <EnumValue v="2" t="1"/>
                    </Data>
                    <Type v="DataTypeEnum" t="3"/>
                </AttrPortalNetworkBehavior>
                <AttrPortalSpawnAngleDegrees>
                    <Data v="0.000000" t="2"/>
                    <Type v="DataTypeDouble" t="3"/>
                </AttrPortalSpawnAngleDegrees>
                <AttrSceneObjectTransformGroup>
                    <Data v="00000000-0000-0000-0000-000000000000" t="3"/>
                    <Type v="DataTypeGlobalID" t="3"/>
                </AttrSceneObjectTransformGroup>
                <AttrVisible>
                    <Data v="1" t="0"/>
                    <Type v="DataTypeBool" t="3"/>
                </AttrVisible>
            </Attributes>
            <Body>
                <Attributes>
                    <AttrPortalGoalEdgeIndices>
                        <Data v="[0,4]" t="1"/>
                        <Type v="DataTypeVectorInt" t="3"/>
                    </AttrPortalGoalEdgeIndices>
                    <AttrPortalGoalPointPositions>
                        <Data v="[-2.635713,0.030000,-25.416165,1.964287,0.030000,-25.416165]" t="2"/>
                        <Type v="DataTypeVectorDouble" t="3"/>
                    </AttrPortalGoalPointPositions>
                </Attributes>
                <Geometry>
                    <Geometry0>
                        <Faces v="[0,1,2,1,2,3]" t="1"/>
                        <GeometryType v="MeshGeometry" t="3"/>
                        <Vertices v="[-2.835713,0.020000,-25.666164,-2.835713,0.020000,-25.166164,2.164287,0.020000,-25.666164,2.164287,0.020000,-25.166164]" t="2"/>
                    </Geometry0>
                </Geometry>
            </Body>
            <GlobalID v="aa7a4bb2-9118-45ab-83a3-66c2f47ec02a" t="3"/>
            <ID v="7" t="1"/>
            <Name v="Portal1" t="3"/>
            <ObjectSubType v="PortalActor" t="3"/>
            <ObjectType v="Actor" t="3"/>
        </Portal1>
    </Objects>
    <Settings>
        <Attributes>
            <AttrSettingsDebugFolder>
                <Data v="debug" t="3"/>
                <Type v="DataTypeString" t="3"/>
            </AttrSettingsDebugFolder>
            <AttrSettingsDefaultBookmark>
                <Data v="00000000-0000-0000-0000-000000000000" t="3"/>
                <Type v="DataTypeGlobalID" t="3"/>
            </AttrSettingsDefaultBookmark>
            <AttrSettingsDumpCostTrees>
                <Data v="0" t="0"/>
                <Type v="DataTypeBool" t="3"/>
            </AttrSettingsDumpCostTrees>
            <AttrSettingsDumpSurfaceMaps>
                <Data v="0" t="0"/>
                <Type v="DataTypeBool" t="3"/>
            </AttrSettingsDumpSurfaceMaps>
            <AttrSettingsFileName>
                <Data v="C:\Users\76524\Desktop\MM_Test\projects\SingleAgent.mm" t="3"/>
                <Type v="DataTypeString" t="3"/>
            </AttrSettingsFileName>
            <AttrSettingsFrameRate>
                <Data v="5" t="1"/>
                <Type v="DataTypeInt" t="3"/>
            </AttrSettingsFrameRate>
            <AttrSettingsPopulationMultiplier>
                <Data v="1.000000" t="2"/>
                <Type v="DataTypeDouble" t="3"/>
            </AttrSettingsPopulationMultiplier>
            <AttrSettingsProjectOrigin>
                <Data v="[0.000000,0.000000,0.000000]" t="2"/>
                <Type v="DataTypeVec3" t="3"/>
            </AttrSettingsProjectOrigin>
            <AttrSettingsProjectOriginEnabled>
                <Data v="0" t="0"/>
                <Type v="DataTypeBool" t="3"/>
            </AttrSettingsProjectOriginEnabled>
            <AttrSettingsRandomSeed>
                <Data v="1234" t="1"/>
                <Type v="DataTypeInt" t="3"/>
            </AttrSettingsRandomSeed>
            <AttrSettingsSimTimeRange>
                <Data>
                    <BoundedEndTime v="00:15:00" t="3"/>
                    <BoundedStartTime v="00:00:00" t="3"/>
                    <TimeRangeType v="TimeRangeBounded" t="3"/>
                </Data>
                <Type v="DataTypeTimeRange" t="3"/>
            </AttrSettingsSimTimeRange>
            <AttrSettingsWorkingPath>
                <Data v="C:\Users\76524\Desktop\MM_Test\Results" t="3"/>
                <Type v="DataTypeString" t="3"/>
            </AttrSettingsWorkingPath>
            <AttrSettingsXSIExportVersion>
                <Data v="" t="3"/>
                <Type v="DataTypeString" t="3"/>
            </AttrSettingsXSIExportVersion>
        </Attributes>
    </Settings>
</DataRoot>
