# Credit Return

Requests a return for a credit sale identified by the ``<Guid>`` value.

## Example

The following example shows a successful credit return request.

=== "Request"

    ``` xml 
    <Message>
        <Request>
            <Detail>
                <TranType>Credit</TranType>
                <TranAction>Return</TranAction>
                <Amount>19.99</Amount>
                <CurrencyCode>840</CurrencyCode>
            </Detail>
            <Reference>
                <Guid>1XXNV0B7FKDTBNB</Guid>
            </Reference>
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
                <Guid>1XXY5VQZFL5KJKR</Guid>
                <TranDate>09/21/2023</TranDate>
                <TranTime>15:53:53</TranTime>
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
