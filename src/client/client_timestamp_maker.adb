pragma SPARK_Mode(On);

package body Client_Timestamp_Maker is

   procedure Create_Timestamp
     (Hash           : in  Hermes.Octet_Array;
      Timestamp      : out Hermes.Octet_Array;
      Timestamp_Size : out Natural) is
   begin
          procedure Make_Request is
       Local_Host      : Network.Addresses.IPv4;
       Request_Message : Messages.Network_Message;
       Network_Status  : Network.Socket.Writer.Status_Type;
       Address_Status  : Network.Addresses.Status_Type;
    begin
       Request_Message := (Data => (others => 0), Size => 0);
       Network.Addresses.To_IPv4_Address("127.0.0.1", Local_Host, Address_Status);
       if Address_Status /= Network.Addresses.Success then
          Ada.Text_IO.Put_Line("Failed to convert target address to binary form!");
       else
          Request_Message.Data(Messages.Index_Type'First) := Character'Pos('X');
          Writer.Send
            (Request_Message, Network.Addresses.To_UDPv4_Address(Local_Host, 4318), Network_Status);
          if Network_Status /= Writer.Success then
             Ada.Text_IO.Put_Line("Failed to send request message!");
          end if;
       end if;
      end Make_Request;

      -- Encode a request message.
      -- Send request to server.
      -- Receive response from server.
      -- Decode response and verify correctness.
      raise Program_Error with "Timestamp_Maker.Create_Timestamp not implemented";
   end Create_Timestamp;


   function Verify_Timestamp
     (Hash : Hermes.Octet_Array; Timestamp : Hermes.Octet_Array) return Boolean is
   begin
      -- Decode time stamp and verify correctness.
      raise Program_Error with "Timestamp_Maker.Verify_Timestamp not implemented";
      return False;
   end Verify_Timestamp;


end Client_Timestamp_Maker;
