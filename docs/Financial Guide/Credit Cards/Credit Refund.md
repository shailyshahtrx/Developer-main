# Credit Return

Requests a refund of a credit sale.

## Example

The following example shows a successful credit refund request. The ``Consumer`` element in this request is optional.

In this example, the ``Account`` element uses the combination of ``<Pan>`` and ``<Expiration>`` tags as the primary identifier for the account. Alternatively, you can use the ``<Track1Data>`` or ``<Track2Data>`` tags as the primary identifier for the account.

If the transaction uses the TrxServices StorageSafe token system, then the account fields are automatically populated from the value of the ``<Guid>`` parameter. For more information, see the StorageSafe Transactions Guide.

=== "Request"

    ``` xml 
    <Message>
        <Request>
            <Detail>
                <TranType>Credit</TranType>
                <TranAction>Refund</TranAction>
                <Amount>12.37</Amount>
                <CurrencyCode>840</CurrencyCode>
            </Detail>
            <Consumer>
                <FirstName>Terry</FirstName>
                <LastName>Whitlock</LastName>
            </Consumer>
            <IndustryData>
                <Industry>CardNotPresent</Industry>
                <Eci>7</Eci>
            </IndustryData>
            <Account>
                <Pan>4111111111111111</Pan>
                <Expiration>1227</Expiration>
                <Postal>01020</Postal>
                <Address>123 Any Street, Anytown, USA</Address>
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
                <Guid>1XGL7AE0FL4RQZF</Guid>
                <TranDate>09/20/2023</TranDate>
                <TranTime>20:23:42</TranTime>
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
