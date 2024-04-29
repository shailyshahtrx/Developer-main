# Credit Sale

Requests a credit sale. A credit sale performs a credit authorization and captures it for settlement in one request. You can use this transaction when providing goods or services at the time of the transaction.

## Example

In the following example, the `Account` element uses a combination of the `<Pan>` and `<Expiration>` tags as the primary identifier for the account. Alternatively, you can use the ``<Track1Data>`` or ``<Track2Data>`` tags as the primary identifier for the account.

If the transaction uses the TrxServices StorageSafe token system, then the account fields are automatically populated from the value of the ``<Guid>`` parameter. For more information, see the StorageSafe Transactions Guide.

If the transaction doesn't use the StorageSafe token system, then you must include a combination of ``<Pan>`` and ``<Expiration>`` tags or the ``<Track1Data>`` or ``<Track2Data>`` tags as the primary identifier for the account.

=== "Request"

    ``` xml 
    <Message> 
        <Request> 
            <Detail> 
                <TranType>Credit</TranType> 
                <TranAction>Sale</TranAction> 
                <Amount>15.67</Amount> 
                <CurrencyCode>840</CurrencyCode> 
            </Detail> 
            <IndustryData> 
                <Industry>CardNotPresent</Industry> 
                <Eci>7</Eci> 
                <MarketSpecificId>B</MarketSpecificId> 
            </IndustryData> 
            <Account> 
                <Pan>4111111111111111</Pan> 
                <Expiration>1227</Expiration> 
                <Postal>197201234</Postal> 
                <Address>123 Any Street</Address>
            </Account> 
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
                <Guid>1XXMT3HBFLMQ666</Guid> 
                <TranDate>09/21/2023</TranDate> 
                <TranTime>15:31:33</TranTime> 
                <AccountBrand>Visa</AccountBrand> 
            </Reference> 
            <Result> 
                <ResponseCode>00</ResponseCode> 
                <ResponseText>NO MATCH</ResponseText> 
                <AvsResult>N</AvsResult> 
                <ApprovalCode>TAS926</ApprovalCode> 
            </Result> 
        </Response> 
        <Authentication> 
            <Client>73</Client> 
            <Source>1</Source> 
        </Authentication> 
    </Message>
    ```
