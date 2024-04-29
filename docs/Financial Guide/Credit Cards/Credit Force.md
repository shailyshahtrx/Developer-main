# Credit Force

Requests to submit a credit transaction in the batch without prior authorization. You can use credit force command for transactions that fall under the merchant's floor limit. Also, you can use credit force command when the authorization was unsuccessful but the merchant attempts to force the transaction. For example, this situation occurs when the cardholder isn't present but owes the merchant additional money, such as for extending a hotel stay or car rental.

If the merchant can't perform the credit authorization electronically, then they must call the 800 number for voice authorization. After the merchant receives the approval code, included this code in the ``<ApprovalCode>`` tag as shown in the following example.

## Example

The following example shows a successful credit force request.

In this example, the ``Account`` element uses the combination of ``<Pan>`` and ``<Expiration>`` tags as the primary identifier for the account. Alternatively, you can use the ``<Track1Data>`` or ``<Track2Data>`` tags as the primary identifier for the account.

If the transaction uses the TrxServices StorageSafe token system, then the account fields are automatically populated from the value of the ``<Guid>`` parameter. For more information, see the StorageSafe Transactions Guide.

If the transaction does not use the StorageSafe token system, you must include either a combination of ``<Pan>`` and ``<Expiration>`` tags or the ``<Track1Data>`` or ``<Track2Data>`` tags as the primary identifier for the account.

=== "Request"

    ``` xml 
    <Message>
        <Request>
            <Detail>
                <TranType>Credit</TranType>
                <TranAction>Force</TranAction>
                <Amount>17.56</Amount>
                <CurrencyCode>840</CurrencyCode>
            </Detail>
            <IndustryData>
                <Industry>Retail</Industry>
                <Eci>7</Eci>
            </IndustryData>
            <Account>
                <Pan>4111111111111111</Pan>
                <Expiration>1227</Expiration>
            </Account>
            <HostData>
                <ApprovalCode>457836</ApprovalCode>
            </HostData>
        </Request>
        <Authentication>
            <Client>73</Client>
            <Source>1</Source>
        </Authentication>
    </Message>
    ```

=== "Response"

    ``` xml
    <Message>
        <Response>
            <Reference>
                <Guid>1J2G8MQDFKMY5DW</Guid>
                <TranDate>09/27/2023</TranDate>
                <TranTime>18:43:24</TranTime>
            </Reference>
            <Result>
                <ResponseCode>00</ResponseCode>
                <ResponseText>Approved</ResponseText>
            </Result>
        </Response>
        <Authentication>
            <Client>73</Client>
            <Source>1</Source>
        </Authentication>
    </Message>
    ```
