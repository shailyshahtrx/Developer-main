# Credit Reversal

Tells the card-issuing bank to release funds reserved in a credit authorization identified by the ``<Guid>`` value.

When you void a credit authorization, the system automatically reverses the full amount in the original authorization. You do not need to manually request a reversal.

## Example

The following example shows a successful credit reversal request.

=== "Request"

    ``` xml 
    <Message>
        <Request>
            <Detail>
                <TranType>Credit</TranType>
                <TranAction>Reversal</TranAction>
                <Amount>15.67</Amount>
                <CurrencyCode>840</CurrencyCode>
            </Detail>
            <Reference>
                <Guid>1XXMT3HBFLMQ666</Guid>
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
                <Guid>1XXNFVQXFKYALHY</Guid>
                <TranDate>09/21/2023</TranDate>
                <TranTime>15:41:52</TranTime>
            </Reference>
            <Result>
                <ResponseCode>00</ResponseCode>
                <ResponseText>APPROVAL</ResponseText>
                <AvsResult>0</AvsResult>
                <ApprovalCode>TAS188</ApprovalCode>
            </Result>
        </Response>
        <Authentication>
            <Client>73</Client>
            <Source>1</Source>
        </Authentication>
    </Message>
    ```
