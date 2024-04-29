# Credit Capture

Captures an authorized credit transaction identified by the ``<Guid>`` value and stores this trasaction in a batch with other authorized transactions. Typically, the system sends batches to the acquirer once in a day at the end of the business day. 

If you capture an amount that is less than the full amount of the original authorization, the system automatically reverses the remaining amount.

## Example

The following example shows a successful credit capture request.

=== "Request"

    ``` xml 
    <Message>
        <Request>
            <Detail>
                <TranType>Credit</TranType>
                <TranAction>Capture</TranAction>
                <Amount>19.99</Amount>
                <CurrencyCode>840</CurrencyCode>
            </Detail>
            <Reference>
                <Guid>1J2ERV3YFLDAAQR</Guid>
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
                <Guid>1J2G8MQDFKMY5DW</Guid>
                <TranDate>09/27/2023</TranDate>
                <TranTime>18:32:15</TranTime>
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
