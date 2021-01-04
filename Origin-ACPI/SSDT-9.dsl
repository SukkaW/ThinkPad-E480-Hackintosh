/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200214 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-9.aml, Sun Jun 21 18:40:05 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000001D8 (472)
 *     Revision         0x02
 *     Checksum         0xFF
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "HdaDsp"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160527 (538314023)
 */
DefinitionBlock ("", "SSDT", 2, "LENOVO", "HdaDsp", 0x00000000)
{
    External (_SB_.GGIV, MethodObj)    // 1 Arguments
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.BADR, UnknownObj)
    External (_SB_.PCI0.BARD, UnknownObj)
    External (_SB_.PCI0.CMDS, UnknownObj)
    External (_SB_.PCI0.CMR1, UnknownObj)
    External (_SB_.PCI0.D8XH, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.HDAS, DeviceObj)
    External (_SB_.PCI0.HDID, UnknownObj)
    External (_SB_.PCI0.HGOF, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.HGON, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.HVID, UnknownObj)
    External (_SB_.PCI0.LPCB.EC__.GATY, UnknownObj)
    External (_SB_.PCI0.PCMR, UnknownObj)
    External (_SB_.PCI0.PWRS, UnknownObj)
    External (_SB_.PCI0.RP01, DeviceObj)
    External (_SB_.PCI0.RP01._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.RP01.PEGP, DeviceObj)
    External (_SB_.PCI0.SDI1, UnknownObj)
    External (_SB_.PCI0.SVI1, UnknownObj)
    External (_SB_.SGOV, MethodObj)    // 2 Arguments
    External (ADBG, MethodObj)    // 1 Arguments
    External (ADPM, IntObj)
    External (AG1H, IntObj)
    External (AG1L, IntObj)
    External (AG2H, IntObj)
    External (AG2L, IntObj)
    External (AG3H, IntObj)
    External (AG3L, IntObj)
    External (EECP, UnknownObj)
    External (GPRW, MethodObj)    // 2 Arguments
    External (OSYS, UnknownObj)
    External (RPA1, UnknownObj)
    External (XBAS, UnknownObj)

    Scope (\_SB.PCI0.HDAS)
    {
        Method (PPMS, 1, Serialized)
        {
            If (LEqual (Arg0, ToUUID ("7111001f-d35f-44d9-81d2-7ac685bed3d7")))
            {
                Store (And (ADPM, 0x2000), Local0)
                ADBG ("RkSA:")
                ADBG (Local0)
                Return (Local0)
            }

            If (LEqual (Arg0, ToUUID ("7c708106-3aff-40fe-88be-8c999b3f7445")))
            {
                Store (And (ADPM, 0x04), Local0)
                ADBG ("iSSP:")
                ADBG (Local0)
                Return (Local0)
            }

            If (LEqual (Arg0, ToUUID ("ec774fa9-28d3-424a-90e4-69f984f1eeb7")))
            {
                Store (And (ADPM, 0x0100), Local0)
                ADBG ("WoV:")
                ADBG (Local0)
                Return (Local0)
            }

            If (LEqual (Arg0, ToUUID ("849f0d73-1678-4d57-8c78-61c548253993")))
            {
                Store (And (ADPM, 0x08), Local0)
                ADBG ("Dolby:")
                ADBG (Local0)
                Return (Local0)
            }

            If (LEqual (Arg0, ACCG (AG1L, AG1H)))
            {
                Return (And (ADPM, 0x20000000))
            }

            If (LEqual (Arg0, ACCG (AG2L, AG2H)))
            {
                Return (And (ADPM, 0x40000000))
            }

            If (LEqual (Arg0, ACCG (AG3L, AG3H)))
            {
                Return (And (ADPM, 0x80000000))
            }

            Return (Zero)
        }

        Method (ACCG, 2, NotSerialized)
        {
            Name (GBUF, Buffer (0x10){})
            Concatenate (Arg0, Arg1, GBUF) /* \_SB_.PCI0.HDAS.ACCG.GBUF */
            Return (GBUF) /* \_SB_.PCI0.HDAS.ACCG.GBUF */
        }
    }
}

