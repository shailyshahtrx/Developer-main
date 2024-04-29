# Credit Auth

Requests a credit authorization. The specified balance is held as unavailable, until the merchant clears the transaction or the hold falls off. Holds may remain in place for a period that depends on the policy of the card issuing bank. For credit transactions, holds may last up to 30 days.

After the authorization is approved, run the Credit Capture operatoion. This operation marks an authorized transaction for settlement and stores it in a batch with other authorized transactions.

You can use the authorization process (also known as capture) when you receive orders but don't immediately ship goods or deliver services. Therefore, you must run the Credit Capture operation when the order is completed.

## Example

The following example shows a request for a credit authorization. The following parameters in this request are optional: ``Eci``, ``Postal``, and ``Address``. In this example, the response shows that the credit authorization request failed.

In this example, the ``Account`` element uses a combination of the ``<Pan>`` and ``<Expiration>`` tags as the primary identifier for the account. Alternatively, you can use the ``<Track1Data>`` or ``<Track2Data>`` tags as the primary identifier for the account, as shown in the next example.

If the transaction uses the TrxServices StorageSafe token system, then the account fields are automatically populated from the value of the ``<Guid>`` parameter. For more information, see the StorageSafe Transactions Guide.

If the transaction doesn't use the StorageSafe token system, then you must include a combination of ``<Pan>`` and ``<Expiration>`` tags or the ``<Track1Data>`` or ``<Track2Data>`` tags as the primary identifier for the account.

=== "Request"

    ``` xml 
    <Message>
        <Request>
            <Detail>
                <TranType>Credit</TranType>
                <TranAction>Auth</TranAction>
                <Amount>19.99</Amount>
                <CurrencyCode>840</CurrencyCode>
            </Detail>
            <IndustryData>
                <Industry>CardNotPresent</Industry>
                <Eci>7</Eci>
            </IndustryData>
            <Account>
                <Pan>4111111111111111</Pan>
                <Expiration>1227</Expiration>
                <Postal>01020</Postal>
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
                <Guid>1J2ERV3YFLDAAQR</Guid>
                <TranDate>09/27/2023</TranDate>
                <TranTime>18:18:58</TranTime>
                <AccountBrand>Visa</AccountBrand>
            </Reference>
            <Result>
                <ResponseCode>85</ResponseCode>
                <ResponseText>NO MATCH</ResponseText>
                <AvsResult>N</AvsResult>
                <ApprovalCode>TAS905</ApprovalCode>
            </Result>
        </Response>
        <Authentication>
            <Client>73</Client>
            <Source>1</Source>
        </Authentication>
    </Message>
    ```

The following example uses the ``<Track2Data>`` attribute to request authorization for a transaction. Because in this example the ``<Industry>`` is set to ``Retail``, you muse provide the ``<PurchaseId>`` value.

=== "Request"

    ``` xml 
    <Message>
        <Request>
            <Detail>
                <TranType>Credit</TranType>
                <TranAction>Auth</TranAction>
                <Amount>14.95</Amount>
                <CurrencyCode>840</CurrencyCode>
            </Detail>
            <IndustryData>
                <Industry>Retail</Industry>
                <PurchaseId>0081010010001</PurchaseId>
            </IndustryData>
            <Account>
                <Track2Data>5472508450015102=08111010000012600000</Track2Data>
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
                <Guid>1J55K0FTFLN8GWN</Guid>
                <TranDate>09/28/2023</TranDate>
                <TranTime>19:35:03</TranTime>
                <AccountBrand>MasterCard</AccountBrand>
            </Reference>
            <Result>
                <ResponseCode>00</ResponseCode>
                <ResponseText>APPROVAL TAS599</ResponseText>
                <AvsResult>0</AvsResult>
                <ApprovalCode>TAS599</ApprovalCode>
            </Result>
        </Response>
        <Authentication>
            <Client>73</Client>
            <Source>1</Source>
        </Authentication>
    </Message>
    ```