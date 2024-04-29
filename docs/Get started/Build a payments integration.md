# Build a payments integration

## Credit Sale

```xml linenums="1"
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xs:include schemaLocation="ElementDefs.xsd"/>
<xs:include schemaLocation="PurchaseData.xsd"/>
<xs:annotation>
<xs:documentation xml:lang="en">TrxServices Schema v1.0 09/09/2010</xs:documentation>
</xs:annotation>
<!--  ***** TrxServices Message Copyright="TrxServices 2010" Version="1" *****  -->
<xs:element name="Message" type="Message"/>
<xs:complexType name="Message">
<xs:all>
<xs:element name="Authentication" minOccurs="1" maxOccurs="1" type="Authentication"/>
<xs:element name="Request" minOccurs="1" maxOccurs="1" type="Request"/>
</xs:all>
<xs:attribute name="Signature" type="SignatureType"/>
<xs:attribute name="Protocol" type="ProtocolType"/>
</xs:complexType>
<xs:complexType name="Authentication">
<xs:all>
<xs:element name="Client" type="ClientType" minOccurs="1" maxOccurs="1"/>
<xs:element name="Source" type="SourceType" minOccurs="1" maxOccurs="1"/>
<xs:element name="Token" type="MD5HashType" minOccurs="0" maxOccurs="1"/>
</xs:all>
</xs:complexType>
<xs:complexType name="Request">
<xs:all>
<xs:element name="Batch" minOccurs="0" maxOccurs="1" type="Batch"/>
<xs:element name="Detail" minOccurs="1" maxOccurs="1" type="Detail"/>
<xs:element name="User" minOccurs="0" maxOccurs="1" type="User"/>
<xs:element name="StorageSafe" minOccurs="0" maxOccurs="1" type="StorageSafe"/>
<xs:element name="Token" minOccurs="0" maxOccurs="1" type="Token"/>
<xs:element name="Account" minOccurs="1" maxOccurs="1" type="Account"/>
<xs:element name="Reference" minOccurs="0" maxOccurs="1" type="Reference"/>
<xs:element name="IndustryData" minOccurs="1" maxOccurs="1" type="IndustryData"/>
<xs:element name="PurchaseData" minOccurs="0" maxOccurs="1" type="PurchaseData"/>
<xs:element name="Shipping" minOccurs="0" maxOccurs="1" type="Shipping"/>
<xs:element name="CardSecurity" minOccurs="0" maxOccurs="1" type="CardSecurity"/>
<xs:element name="SoftDescriptors" minOccurs="0" maxOccurs="1" type="SoftDescriptors"/>
<xs:element name="UserDefined" minOccurs="0" maxOccurs="1" type="UserDefined"/>
<xs:element name="HostData" minOccurs="0" maxOccurs="1" type="HostData"/>
<xs:element name="Recurring" minOccurs="0" maxOccurs="1" type="Recurring"/>
<xs:element name="Template" minOccurs="0" maxOccurs="1" type="Template"/>
<xs:element name="PayPage" minOccurs="0" maxOccurs="1" type="PayPage"/>
<xs:element name="Echo" minOccurs="0" maxOccurs="1" type="Echo"/>
</xs:all>
</xs:complexType>
<xs:complexType name="Batch">
<xs:all>
<xs:element name="BatchName" type="BatchNameType" minOccurs="1" maxOccurs="1"/>
</xs:all>
</xs:complexType>
<xs:complexType name="Detail">
<xs:all>
<xs:element name="TranType" type="TransType" minOccurs="1" maxOccurs="1"/>
<xs:element name="TranAction" type="TransAction" minOccurs="1" maxOccurs="1"/>
<xs:element name="CurrencyCode" type="CurrencyCodeType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Amount" type="AmountNonZeroType" minOccurs="1" maxOccurs="1"/>
<xs:element name="Stan" type="StanType" minOccurs="0" maxOccurs="1"/>
<xs:element name="FraudLookup" type="BooleanType" minOccurs="0" maxOccurs="1"/>
<xs:element name="BankLookup" type="BooleanType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Ip" type="IPType" minOccurs="0" maxOccurs="1"/>
<xs:element name="TimeZone" type="TimeZoneType" minOccurs="0" maxOccurs="1"/>
<xs:element name="TerminalId" type="TerminalIdType" minOccurs="0" maxOccurs="1"/>
<xs:element name="AllowDuplicate" type="BooleanType" minOccurs="0" maxOccurs="1"/>
<xs:element name="DuplicateInterval" type="DuplicateIntervalType" minOccurs="0" maxOccurs="1"/>
</xs:all>
</xs:complexType>
<xs:complexType name="User">
<xs:all>
<xs:element name="UserName" type="UserNameType" minOccurs="1" maxOccurs="1"/>
<xs:element name="Token" type="HashType" minOccurs="1" maxOccurs="1"/>
</xs:all>
</xs:complexType>
<xs:complexType name="StorageSafe">
<xs:choice minOccurs="1" maxOccurs="1">
<xs:element name="Guid" type="GuidType"/>
<xs:element name="Generate" type="GenerateType"/>
</xs:choice>
</xs:complexType>
<xs:complexType name="Token">
<xs:all>
<xs:element name="Guid" type="GuidType" minOccurs="1" maxOccurs="1"/>
</xs:all>
</xs:complexType>
<xs:complexType name="IndustryData">
<xs:all>
<xs:element name="Industry" type="IndustryType" minOccurs="1" maxOccurs="1"/>
<xs:element name="Eci" type="EciType" minOccurs="0" maxOccurs="1"/>
<xs:element name="GoodsIndicator" type="GoodsIndicatorType" minOccurs="0" maxOccurs="1"/>
<xs:element name="PurchaseId" type="PurchaseIdType" minOccurs="0" maxOccurs="1"/>
<xs:element name="MarketSpecificId" type="MarketSpecificIdType" minOccurs="0" maxOccurs="1"/>
<xs:element name="TipAmount" type="AmountType" minOccurs="0" maxOccurs="1"/>
<xs:element name="PartialApproval" type="BooleanType" minOccurs="0" maxOccurs="1"/>
<xs:element name="StoreAndForward" type="BooleanType" minOccurs="0" maxOccurs="1"/>
<xs:element name="CheckInDate" type="DateType" minOccurs="0" maxOccurs="1"/>
<xs:element name="CheckOutDate" type="DateType" minOccurs="0" maxOccurs="1"/>
<xs:element name="NoShow" type="BooleanType" minOccurs="0" maxOccurs="1"/>
<xs:element name="AdvanceDeposit" type="BooleanType" minOccurs="0" maxOccurs="1"/>
<xs:element name="DailyRate" type="AmountType" minOccurs="0" maxOccurs="1"/>
<xs:element name="StayDuration" type="DurationType" minOccurs="0" maxOccurs="1"/>
<xs:element name="DebtPayment" type="BooleanType" minOccurs="0" maxOccurs="1"/>
</xs:all>
</xs:complexType>
<xs:complexType name="Shipping">
<xs:all>
<xs:element name="Description" type="DescriptionType" minOccurs="0" maxOccurs="1"/>
<xs:element name="FirstName" type="FirstNameType" minOccurs="0" maxOccurs="1"/>
<xs:element name="LastName" type="LastNameType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Address" type="AddrType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Address2" type="AddrType" minOccurs="0" maxOccurs="1"/>
<xs:element name="City" type="CityType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Postal" type="PostalType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Country" type="CountryType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Region" type="RegionType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Phone" type="PhoneType" minOccurs="0" maxOccurs="1"/>
<xs:element name="CellPhone" type="PhoneCellType" minOccurs="0" maxOccurs="1"/>
<xs:element name="CellCarrier" type="PhoneCellCarrierType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Email" type="EmailType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Carrier" type="ShippingCarrierType" minOccurs="0" maxOccurs="1"/>
<xs:element name="TrackingNumber" type="ShippingTrackingNumberType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Guid" type="GuidType" minOccurs="0" maxOccurs="1"/>
</xs:all>
</xs:complexType>
<xs:complexType name="Account">
<xs:all>
<xs:element name="Description" type="DescriptionType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Pan" type="PanType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Expiration" type="ExpType" minOccurs="0" maxOccurs="1"/>
<xs:element name="TrackData" type="TrackDataType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Track1Data" type="Track1DataType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Track2Data" type="Track2DataType" minOccurs="0" maxOccurs="1"/>
<!-- EMV - Chip and PIN -->
<xs:element name="PinBlock" type="PinBlockType" minOccurs="0" maxOccurs="1"/>
<xs:element name="PinPadSerialNum" type="PinPadSerialNumType" minOccurs="0" maxOccurs="1"/>
<xs:element name="KeySerialId" type="KeySerialIdType" minOccurs="0" maxOccurs="1"/>
<xs:element name="EmvType" type="EmvType" minOccurs="0" maxOccurs="1"/>
<!-- EMV - Chip and PIN -->
<xs:element name="Cvv" type="CvvType" minOccurs="0" maxOccurs="1"/>
<xs:element name="FirstName" type="FirstNameType" minOccurs="0" maxOccurs="1"/>
<xs:element name="LastName" type="LastNameType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Address" type="AddrType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Address2" type="AddrType" minOccurs="0" maxOccurs="1"/>
<xs:element name="City" type="CityType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Postal" type="PostalType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Country" type="CountryType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Region" type="RegionType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Phone" type="PhoneType" minOccurs="0" maxOccurs="1"/>
<xs:element name="CellPhone" type="PhoneCellType" minOccurs="0" maxOccurs="1"/>
<xs:element name="CellCarrier" type="PhoneCellCarrierType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Email" type="EmailType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Guid" type="GuidType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Encrypted" type="EncryptedAccount" minOccurs="0" maxOccurs="1"/>
<xs:element name="SmartCard" type="SmartCardAccount" minOccurs="0" maxOccurs="1"/>
<xs:element name="Signature" type="SignatureAccount" minOccurs="0" maxOccurs="1"/>
<xs:element name="Par" type="ParType" minOccurs="0" maxOccurs="1"/>
<xs:element name="OnFile" type="BooleanType" minOccurs="0" maxOccurs="1"/>
<xs:element name="RegisteredUser" type="BooleanType" minOccurs="0" maxOccurs="1"/>
<xs:element name="RegisteredUserPasswordChangeDate" type="DateType" minOccurs="0" maxOccurs="1"/>
<xs:element name="TokenSource" type="AccountTokenSourceType" minOccurs="0" maxOccurs="1"/>
</xs:all>
</xs:complexType>
<xs:complexType name="EncryptedAccount">
<xs:all>
<xs:element name="TrackData" type="TrackDataEncryptedType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Track1Data" type="Track1DataEncryptedType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Track2Data" type="Track2DataEncryptedType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Pan" type="xs:string" minOccurs="0" maxOccurs="1"/>
<xs:element name="Expiration" type="xs:string" minOccurs="0" maxOccurs="1"/>
<xs:element name="SwipeDevice" type="xs:string" minOccurs="0" maxOccurs="1"/>
<xs:element name="KeySerialNum" type="KeySerialNumType" minOccurs="0" maxOccurs="1"/>
<xs:element name="DeviceSerialNum" type="xs:string" minOccurs="0" maxOccurs="1"/>
<xs:element name="SmartCard" type="xs:string" minOccurs="0" maxOccurs="1"/>
<xs:element name="Variant" type="EncryptedVariantType" minOccurs="0" maxOccurs="1"/>
</xs:all>
</xs:complexType>
<xs:complexType name="SmartCardAccount">
<xs:sequence>
<xs:element name="Tag" type="xs:string" minOccurs="2" maxOccurs="38"/>
<xs:element name="DataReadMethod" type="DataReadMethodType" minOccurs="0" maxOccurs="1"/>
<xs:element name="ContactlessSource" type="ContactlessSourceType" minOccurs="0" maxOccurs="1"/>
</xs:sequence>
</xs:complexType>
<xs:complexType name="SignatureAccount">
<xs:all>
<!-- Base64 encoded image of cardholders signature -->
<xs:element name="Data" type="InlineFileType" minOccurs="1" maxOccurs="1"/>
<!-- optional file name - api will default to sigGUID.png if not present -->
<xs:element name="FileName" type="FileNameType" minOccurs="0" maxOccurs="1"/>
<!-- optional elements to ensure data was not altered or lost during transmission -->
<xs:element name="FileSize" type="FileSizeType" minOccurs="0" maxOccurs="1"/>
<xs:element name="FileHash" type="MD5HashType" minOccurs="0" maxOccurs="1"/>
</xs:all>
</xs:complexType>
<xs:complexType name="Reference">
<xs:all>
<xs:element name="Guid" type="GuidType" minOccurs="1" maxOccurs="1"/>
</xs:all>
</xs:complexType>
<xs:complexType name="Recurring">
<xs:choice minOccurs="1" maxOccurs="1">
<xs:group ref="RecurringCreate"/>
<xs:group ref="RecurringExisiting"/>
</xs:choice>
</xs:complexType>
<xs:group name="RecurringCreate">
<xs:sequence>
<xs:element name="Generate" type="GenerateType" minOccurs="1" maxOccurs="1"/>
<!--  Recurring elements will be validated during the system generate Recurring Insert -->
<xs:any namespace="##any" minOccurs="0" maxOccurs="unbounded" processContents="skip"/>
</xs:sequence>
</xs:group>
<xs:group name="RecurringExisiting">
<xs:sequence>
<xs:element name="Guid" type="GuidType" minOccurs="0" maxOccurs="1"/>
<xs:element name="InstallmentCount" type="InstallmentCountType" minOccurs="0" maxOccurs="1"/>
<xs:element name="InstallmentTotal" type="InstallmentTotalType" minOccurs="0" maxOccurs="1"/>
</xs:sequence>
</xs:group>
<xs:complexType name="HostData">
<xs:all>
<xs:element name="HostResponse" type="BooleanType" minOccurs="0" maxOccurs="1"/>
<!-- required for credential on file transactions -->
<xs:element name="TransactionId" type="xs:string" minOccurs="0" maxOccurs="1"/>
<xs:element name="Amount" type="AmountType" minOccurs="0" maxOccurs="1"/>
</xs:all>
</xs:complexType>
<xs:complexType name="CardSecurity">
<xs:sequence>
<xs:choice minOccurs="1" maxOccurs="1">
<xs:group ref="Cavv"/>
<xs:group ref="Ucaf"/>
</xs:choice>
<xs:element name="DSTransactionId" type="DSTransactionIdType" minOccurs="0" maxOccurs="1"/>
<xs:element name="DSTransactionId3DS" type="DSTransactionIdType" minOccurs="0" maxOccurs="1"/>
<xs:element name="Version" type="CardSecurityVersionType" minOccurs="1" maxOccurs="1"/>
</xs:sequence>
</xs:complexType>
<xs:group name="Cavv">
<xs:sequence>
<xs:element name="Cavv" type="CavvType" minOccurs="1" maxOccurs="1"/>
<xs:element name="Xid" type="XidType" minOccurs="0" maxOccurs="1"/>
</xs:sequence>
</xs:group>
<xs:group name="Ucaf">
<xs:sequence>
<xs:element name="UcafIndicator" type="UcafIndicatorType" minOccurs="0" maxOccurs="1"/>
<xs:element name="UcafData" type="UcafDataType" minOccurs="0" maxOccurs="1"/>
<xs:element name="DSRPCryptogram" type="DSRPCryptogramType" minOccurs="0" maxOccurs="1"/>
</xs:sequence>
</xs:group>
<xs:complexType name="SoftDescriptors">
<xs:all>
<xs:element name="MerchantName" type="MerchantNameType" minOccurs="1" maxOccurs="1"/>
<xs:element name="MerchantPhone" type="MerchantPhoneType" minOccurs="0" maxOccurs="1"/>
<xs:element name="MerchantState" type="MerchantStateType" minOccurs="0" maxOccurs="1"/>
</xs:all>
</xs:complexType>
<xs:complexType name="Template">
<xs:all>
<xs:element name="Guid" type="GuidType" minOccurs="1" maxOccurs="1"/>
</xs:all>
</xs:complexType>
<xs:complexType name="PayPage">
<xs:all>
<xs:element name="Guid" type="GuidType" minOccurs="1" maxOccurs="1"/>
</xs:all>
</xs:complexType>
<xs:complexType name="UserDefined">
<xs:sequence>
<xs:any namespace="##any" minOccurs="0" maxOccurs="unbounded" processContents="skip"/>
</xs:sequence>
</xs:complexType>
<xs:complexType name="Echo">
<xs:sequence>
<xs:any namespace="##any" minOccurs="0" maxOccurs="unbounded" processContents="skip"/>
</xs:sequence>
</xs:complexType>
</xs:schema>
```