# Credit Cancel

Cancels a credit transaction identified by the ``<Guid>`` value.

## Example

The following example shows an approved credit cancellation request. The ``TerminalId`` tag in this request is optional.

=== "Request"

    ``` xml 
    <Message>
        <Request>
            <Detail>
                <TranType>Credit</TranType>
                <TranAction>Cancel</TranAction>
                <Amount>19.99</Amount>
                <CurrencyCode>840</CurrencyCode>
                <TerminalId>1</TerminalId>
            </Detail>
            <Reference>
                <Guid>1J2FK97MFLQRD3K</Guid>
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
                <Guid>1J2FR77MFK5ZX8K</Guid>
                <TranDate>09/27/2023</TranDate>
                <TranTime>18:36:02</TranTime>
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
