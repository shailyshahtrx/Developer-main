# Credit Avs

The address verification system (AVS) checks the billing address of the credit card provided by the user with the address on file at the credit card company.

The ``<Postal>`` tag is required for the ``<Account>`` element.

## Example

The following example shows a request to check the billing address of the credit card. The following parameters in this request are optional: ``Stan``, ``Ip``, ``Eci``, ``FirstName``, ``LastName``, ``Email``, ``Address``, ``City``, and ``Region``. In this example, the response shows that the address verification system didn't find a matching record for the credit card specified in the request.

=== "Request"

    ``` xml 
    <Message>
        <Request>
            <Detail>
                <TranType>Credit</TranType>
                <TranAction>Avs</TranAction>
                <Stan>6</Stan>
                <Ip>192.168.1.31</Ip>
            </Detail>
            <IndustryData>
                <Industry>CardNotPresent</Industry>
                <Eci>7</Eci>
            </IndustryData>
            <Account>
                <Pan>4111111111111111</Pan>
                <Expiration>1227</Expiration>
                <FirstName>Terry</FirstName>
                <LastName>Whitlock</LastName>
                <Email>terry.whitlock@email.com</Email>
                <Postal>01020</Postal>
                <Address>123 Any Street</Address>
                <City>Anytown</City>
                <Region>US</Region>
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
                <Guid>1XGN16AFFKZEEL4</Guid>
                <TranDate>09/27/2023</TranDate>
                <TranTime>20:55:18</TranTime>
                <Stan>6</Stan>
                <AccountBrand>Visa</AccountBrand>
            </Reference>
            <Result>
                <ResponseCode>85</ResponseCode>
                <ResponseText>NO MATCH</ResponseText>
                <AvsResult>N</AvsResult>
                <ApprovalCode>PREATH</ApprovalCode>
            </Result>
        </Response>
        <Authentication>
            <Client>73</Client>
            <Source>1</Source>
        </Authentication>
    </Message>
    ```
