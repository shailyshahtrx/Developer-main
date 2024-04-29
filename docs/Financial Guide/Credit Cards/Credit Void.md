# Credit Void

Voids a credit capture or sale identified by the ``<Guid>`` value. When you void a credit capture, the system automatically reverses the full amount in the original capture. 

!!! note
    You can void a transaction before you close its batch. To void a transaction after closing its batch, use a credit reversal.

## Example

The following example shows a successful credit void request.

=== "Request"
    ``` xml
    <Message> 
        <Request> 
            <Detail> 
                <TranType>Credit</TranType> 
                <TranAction>Void</TranAction> 
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
    ```xml
    <Message> 
        <Response> 
            <Reference> 
                <Guid>1XXN5N7PFKFKPE5</Guid> 
                <TranDate>09/21/2023</TranDate> 
                <TranTime>15:36:15</TranTime> 
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