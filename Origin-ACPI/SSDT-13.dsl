/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200214 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-13.aml, Sun Jun 21 18:40:05 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000170D (5901)
 *     Revision         0x02
 *     Checksum         0xEC
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "SgPch"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160527 (538314023)
 */
DefinitionBlock ("", "SSDT", 2, "LENOVO", "SgPch", 0x00001000)
{
    External (_PR_.PR00._PSS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.LPCB.DGON, UnknownObj)
    External (_SB_.PCI0.LPCB.DGRT, UnknownObj)
    External (_SB_.PCI0.LPCB.EC__.BVPC, UnknownObj)
    External (_SB_.PCI0.LPCB.EC__.CHGP, UnknownObj)
    External (_SB_.PCI0.LPCB.EC__.GPUT, UnknownObj)
    External (_SB_.PCI0.LPCB.EC__.HKEY.ANDN, UnknownObj)
    External (_SB_.PCI0.LPCB.EC__.HKEY.ANGN, UnknownObj)
    External (_SB_.PCI0.LPCB.EC__.HKEY.DNCG, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.TMP0, UnknownObj)
    External (_SB_.PCI0.LPCB.FBEN, UnknownObj)
    External (_SB_.PCI0.LPCB.GEVT, UnknownObj)
    External (_SB_.PCI0.LPCB.TXDS, UnknownObj)
    External (_SB_.PCI0.RP01, DeviceObj)
    External (_SB_.PCI0.RP01.PEGP, DeviceObj)
    External (DLHR, UnknownObj)
    External (DLPW, UnknownObj)
    External (EECP, UnknownObj)
    External (GBAS, UnknownObj)
    External (HRA0, UnknownObj)
    External (HRE0, UnknownObj)
    External (HRG0, UnknownObj)
    External (NVHA, UnknownObj)
    External (OSYS, UnknownObj)
    External (P8XH, MethodObj)    // 2 Arguments
    External (PNTF, MethodObj)    // 1 Arguments
    External (PWA0, UnknownObj)
    External (PWE0, UnknownObj)
    External (PWG0, UnknownObj)
    External (RPA1, UnknownObj)
    External (RPA9, UnknownObj)
    External (SGGP, UnknownObj)
    External (SGMD, UnknownObj)
    External (SWTT, MethodObj)    // 1 Arguments
    External (XBAS, UnknownObj)

    Scope (\_SB.PCI0)
    {
        Name (IVID, 0xFFFF)
        Name (ELCT, Zero)
        Name (HVID, Zero)
        Name (HDID, Zero)
        Name (TCNT, Zero)
        Name (LDLY, 0x64)
        Name (RPIX, Zero)
        Name (ONOF, One)
        OperationRegion (RPC1, SystemMemory, Add (\XBAS, 0x000E0000), 0x1000)
        Field (RPC1, DWordAcc, NoLock, Preserve)
        {
            PVI1,   16, 
            PDI1,   16, 
            PCMR,   8, 
            Offset (0x18), 
            PRB1,   8, 
            SCB1,   8, 
            Offset (0x4A), 
            CEDR,   1, 
            Offset (0x50), 
            ASP1,   2, 
                ,   2, 
            LKD1,   1, 
            Offset (0x69), 
                ,   2, 
            LREN,   1, 
            Offset (0xA4), 
            PWRS,   8, 
            Offset (0x328), 
                ,   19, 
            LKS1,   4
        }

        OperationRegion (RTP1, SystemMemory, Add (\XBAS, ShiftLeft (SCB1, 0x14)), 0xF0)
        Field (RTP1, AnyAcc, Lock, Preserve)
        {
            DVI1,   16, 
            Offset (0x0B), 
            CBC1,   8, 
            Offset (0x2C), 
            SVI1,   16, 
            SDI1,   16
        }

        OperationRegion (PCA1, SystemMemory, Add (Add (\XBAS, ShiftLeft (SCB1, 0x14)), \EECP), 0x14)
        Field (PCA1, DWordAcc, NoLock, Preserve)
        {
            Offset (0x10), 
            LCT1,   16
        }

        OperationRegion (PCB1, SystemMemory, Add (Add (Add (\XBAS, ShiftLeft (SCB1, 0x14)), 0x1000), 
            \EECP), 0x14)
        Field (PCB1, DWordAcc, NoLock, Preserve)
        {
            Offset (0x10), 
            LCTY,   16
        }

        Method (HGON, 0, Serialized)
        {
            If (LEqual (CCHK (One), Zero))
            {
                Return (Zero)
            }

            Store (One, ONOF) /* \_SB_.PCI0.ONOF */
            Store (One, \_SB.PCI0.LPCB.DGON) /* External reference */
            If (LGreater (OSYS, 0x07D9))
            {
                Sleep (0x08)
            }
            Else
            {
                Sleep (0x10)
            }

            Store (One, \_SB.PCI0.LPCB.DGRT) /* External reference */
            Sleep (0x10)
            Store (Zero, LKD1) /* \_SB_.PCI0.LKD1 */
            Store (Zero, TCNT) /* \_SB_.PCI0.TCNT */
            While (LLess (TCNT, LDLY))
            {
                If (LGreaterEqual (LKS1, 0x07))
                {
                    Break
                }

                Sleep (0x10)
                Add (TCNT, 0x10, TCNT) /* \_SB_.PCI0.TCNT */
            }

            Store (Or (ShiftLeft (HDID, 0x10), HVID), \_SB.PCI0.RP01.PEGP.SVIW)
            Store (\_SB.PCI0.RP01.LTRE, LREN) /* \_SB_.PCI0.LREN */
            Store (One, CEDR) /* \_SB_.PCI0.CEDR */
            Store (\_SB.PCI0.RP01.PEGP.CMDS, \_SB.PCI0.RP01.PEGP.CMDR)
            Store (Zero, \_SB.PCI0.RP01.PEGP.MLTR)
            Or (And (ELCT, 0x43), And (LCT1, 0xFFBC), LCT1) /* \_SB_.PCI0.LCT1 */
            Or (And (ELCT, 0x43), And (\_SB.PCI0.RP01.PEGA.LCT1, 0xFFBC), \_SB.PCI0.RP01.PEGA.LCT1)
            \SWTT (One)
            Return (Zero)
        }

        Method (HGOF, 0, Serialized)
        {
            P8XH (Zero, 0x14)
            If (LEqual (CCHK (Zero), Zero))
            {
                Return (Zero)
            }

            Store (Zero, ONOF) /* \_SB_.PCI0.ONOF */
            Store (LCT1, ELCT) /* \_SB_.PCI0.ELCT */
            Store (LREN, \_SB.PCI0.RP01.LTRE)
            Store (\_SB.PCI0.RP01.PEGP.CMDR, \_SB.PCI0.RP01.PEGP.CMDS)
            Store (One, LKD1) /* \_SB_.PCI0.LKD1 */
            Store (Zero, TCNT) /* \_SB_.PCI0.TCNT */
            While (LLess (TCNT, LDLY))
            {
                If (LEqual (LKS1, Zero))
                {
                    Break
                }

                Sleep (0x10)
                Add (TCNT, 0x10, TCNT) /* \_SB_.PCI0.TCNT */
            }

            Store (Zero, \_SB.PCI0.LPCB.DGRT) /* External reference */
            Store (Zero, \_SB.PCI0.LPCB.DGON) /* External reference */
            Sleep (0x64)
            \SWTT (Zero)
            P8XH (Zero, 0x24)
            Return (Zero)
        }

        Method (CCHK, 1, NotSerialized)
        {
            If (LEqual (PVI1, IVID))
            {
                Return (Zero)
            }

            If (LEqual (Arg0, Zero))
            {
                If (LEqual (ONOF, Zero))
                {
                    Return (Zero)
                }
            }
            ElseIf (LEqual (Arg0, One))
            {
                If (LEqual (ONOF, One))
                {
                    Return (Zero)
                }
            }

            Return (One)
        }
    }

    Scope (\_SB.PCI0.RP01)
    {
        Name (DGIZ, One)
        Name (TDGC, Zero)
        Name (DGCX, Zero)
        Name (TGPC, Buffer (0x04)
        {
             0x00                                             // .
        })
        PowerResource (PC01, 0x00, 0x0000)
        {
            Name (_STA, One)  // _STA: Status
            Method (_ON, 0, Serialized)  // _ON_: Power On
            {
                P8XH (Zero, 0x11)
                Store (Zero, DGIZ) /* \_SB_.PCI0.RP01.DGIZ */
                If (LEqual (TDGC, One))
                {
                    If (LEqual (DGCX, 0x03))
                    {
                        Store (One, _STA) /* \_SB_.PCI0.RP01.PC01._STA */
                        \_SB.PCI0.RP01.PEGP.GC6O ()
                    }
                    ElseIf (LEqual (DGCX, 0x04))
                    {
                        Store (One, _STA) /* \_SB_.PCI0.RP01.PC01._STA */
                        \_SB.PCI0.RP01.PEGP.GC6O ()
                    }

                    Store (Zero, TDGC) /* \_SB_.PCI0.RP01.TDGC */
                    Store (Zero, DGCX) /* \_SB_.PCI0.RP01.DGCX */
                    Store (One, DGIZ) /* \_SB_.PCI0.RP01.DGIZ */
                }
                ElseIf (LNotEqual (OSYS, 0x07D9))
                {
                    Store (0x07, PCMR) /* \_SB_.PCI0.PCMR */
                    Store (Zero, PWRS) /* \_SB_.PCI0.PWRS */
                    Sleep (0x10)
                    \_SB.PCI0.HGON ()
                    Store (One, _STA) /* \_SB_.PCI0.RP01.PC01._STA */
                    Store (One, DGIZ) /* \_SB_.PCI0.RP01.DGIZ */
                }

                P8XH (Zero, 0x12)
            }

            Method (_OFF, 0, Serialized)  // _OFF: Power Off
            {
                P8XH (Zero, 0x21)
                If (LEqual (TDGC, One))
                {
                    CreateField (TGPC, Zero, 0x03, GUPC)
                    If (LEqual (ToInteger (GUPC), One))
                    {
                        \_SB.PCI0.RP01.PEGP.GC6I ()
                        Store (Zero, _STA) /* \_SB_.PCI0.RP01.PC01._STA */
                    }
                    ElseIf (LEqual (ToInteger (GUPC), 0x02))
                    {
                        \_SB.PCI0.RP01.PEGP.GC6I ()
                        Store (Zero, _STA) /* \_SB_.PCI0.RP01.PC01._STA */
                    }
                }
                ElseIf (LNotEqual (OSYS, 0x07D9))
                {
                    \_SB.PCI0.HGOF ()
                    Store (Zero, _STA) /* \_SB_.PCI0.RP01.PC01._STA */
                }

                P8XH (Zero, 0x22)
            }
        }

        Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
        {
            PC01
        })
        Name (_PR2, Package (0x01)  // _PR2: Power Resources for D2
        {
            PC01
        })
        Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
        {
            PC01
        })
        Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
        {
            Return (0x04)
        }

        Name (WKEN, Zero)
        Name (LTRE, Zero)
        Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
        {
            If (Arg1)
            {
                Store (Zero, WKEN) /* \_SB_.PCI0.RP01.WKEN */
            }
            ElseIf (LAnd (Arg0, Arg2))
            {
                Store (One, WKEN) /* \_SB_.PCI0.RP01.WKEN */
            }
            Else
            {
                Store (Zero, WKEN) /* \_SB_.PCI0.RP01.WKEN */
            }
        }

        Device (PEGP)
        {
            Name (_ADR, Zero)  // _ADR: Address
        }

        Device (PEGA)
        {
            Name (_ADR, One)  // _ADR: Address
            OperationRegion (ACAP, PCI_Config, \EECP, 0x14)
            Field (ACAP, DWordAcc, NoLock, Preserve)
            {
                Offset (0x10), 
                LCT1,   16
            }
        }
    }

    Scope (\_SB.PCI0.RP01.PEGP)
    {
        Name (CMDS, Zero)
        OperationRegion (PCIS, SystemMemory, Add (\XBAS, ShiftLeft (SCB1, 0x14)), 0x0500)
        Field (PCIS, AnyAcc, Lock, Preserve)
        {
            DVID,   16, 
            Offset (0x04), 
            CMDR,   8, 
            Offset (0x0B), 
            CBCC,   8, 
            Offset (0x2C), 
            SVID,   16, 
            SDID,   16, 
            Offset (0x488), 
                ,   25, 
            MLTR,   1
        }

        Field (PCIS, DWordAcc, Lock, Preserve)
        {
            Offset (0x40), 
            SVIW,   32
        }

        OperationRegion (PCAP, SystemMemory, Add (Add (\XBAS, ShiftLeft (SCB1, 0x14)), \EECP), 0x14)
        Field (PCAP, DWordAcc, NoLock, Preserve)
        {
            Offset (0x10), 
            LCTL,   16
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store (Zero, \_SB.PCI0.RP01.PEGP._ADR)
            Store (0x06, CMDR) /* \_SB_.PCI0.RP01.PEGP.CMDR */
            Store (0x06, CMDS) /* \_SB_.PCI0.RP01.PEGP.CMDS */
            Store (SVID, HVID) /* \_SB_.PCI0.HVID */
            Store (SDID, HDID) /* \_SB_.PCI0.HDID */
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Method (_ON, 0, Serialized)  // _ON_: Power On
        {
            \_SB.PCI0.HGON ()
            Return (Zero)
        }

        Method (_OFF, 0, Serialized)  // _OFF: Power Off
        {
            \_SB.PCI0.HGOF ()
            Return (Zero)
        }

        Method (GC6I, 0, Serialized)
        {
            Store (One, \_SB.PCI0.LPCB.EC.GPUT) /* External reference */
            Sleep (0x0A)
            Store (LREN, LTRE) /* \_SB_.PCI0.RP01.LTRE */
            Store (One, LKD1) /* \_SB_.PCI0.LKD1 */
            While (LNotEqual (\_SB.PCI0.LPCB.FBEN, One))
            {
                Sleep (One)
            }

            Sleep (0x64)
        }

        Method (GC6O, 0, Serialized)
        {
            Store (Zero, LKD1) /* \_SB_.PCI0.LKD1 */
            Store (Zero, \_SB.PCI0.LPCB.GEVT) /* External reference */
            Store (Zero, \_SB.PCI0.LPCB.TXDS) /* External reference */
            While (LNotEqual (\_SB.PCI0.LPCB.FBEN, Zero))
            {
                Sleep (One)
            }

            Store (One, \_SB.PCI0.LPCB.GEVT) /* External reference */
            While (LLess (LKS1, 0x07))
            {
                Sleep (One)
            }

            Store (LTRE, LREN) /* \_SB_.PCI0.LREN */
            Store (One, CEDR) /* \_SB_.PCI0.CEDR */
            Store (Zero, \_SB.PCI0.LPCB.EC.GPUT) /* External reference */
            Sleep (0x64)
        }

        Method (GETS, 0, Serialized)
        {
            If (LEqual (\_SB.PCI0.LPCB.FBEN, Zero))
            {
                Return (One)
            }
            Else
            {
                Return (0x03)
            }
        }

        Method (NGC6, 4, Serialized)
        {
            If (LLess (Arg1, 0x0100))
            {
                Return (0x80000001)
            }

            Switch (ToInteger (Arg2))
            {
                Case (Zero)
                {
                    Return (Buffer (0x04)
                    {
                         0x1B, 0x00, 0x00, 0x00                           // ....
                    })
                }
                Case (One)
                {
                    Name (JTB1, Buffer (0x04)
                    {
                         0x00                                             // .
                    })
                    CreateField (JTB1, Zero, One, JTEN)
                    CreateField (JTB1, One, 0x02, SREN)
                    CreateField (JTB1, 0x03, 0x03, PLPR)
                    CreateField (JTB1, 0x06, 0x02, FBPR)
                    CreateField (JTB1, 0x08, 0x02, GUPR)
                    CreateField (JTB1, 0x0A, One, GC6R)
                    CreateField (JTB1, 0x0B, One, PTRH)
                    CreateField (JTB1, 0x0D, One, MHYB)
                    CreateField (JTB1, 0x0E, One, RPCL)
                    CreateField (JTB1, 0x0F, 0x02, GC6M)
                    CreateField (JTB1, 0x14, 0x0C, JTRV)
                    Store (One, JTEN) /* \_SB_.PCI0.RP01.PEGP.NGC6.JTEN */
                    Store (One, GC6R) /* \_SB_.PCI0.RP01.PEGP.NGC6.GC6R */
                    Store (One, PTRH) /* \_SB_.PCI0.RP01.PEGP.NGC6.PTRH */
                    Store (One, GC6M) /* \_SB_.PCI0.RP01.PEGP.NGC6.GC6M */
                    Store (One, SREN) /* \_SB_.PCI0.RP01.PEGP.NGC6.SREN */
                    If (LGreater (OSYS, 0x07D9))
                    {
                        Store (One, MHYB) /* \_SB_.PCI0.RP01.PEGP.NGC6.MHYB */
                    }

                    Store (0x0103, JTRV) /* \_SB_.PCI0.RP01.PEGP.NGC6.JTRV */
                    Return (JTB1) /* \_SB_.PCI0.RP01.PEGP.NGC6.JTB1 */
                }
                Case (0x02)
                {
                    Return (Arg3)
                }
                Case (0x03)
                {
                    CreateField (Arg3, Zero, 0x03, GUPC)
                    CreateField (Arg3, 0x04, One, PLPC)
                    CreateField (Arg3, 0x0E, 0x02, DFGC)
                    CreateField (Arg3, 0x10, 0x03, GPCX)
                    Store (Arg3, TGPC) /* \_SB_.PCI0.RP01.TGPC */
                    If (LOr (LNotEqual (ToInteger (GUPC), Zero), LNotEqual (ToInteger (DFGC
                        ), Zero)))
                    {
                        Store (ToInteger (DFGC), \_SB.PCI0.RP01.TDGC)
                        Store (ToInteger (GPCX), \_SB.PCI0.RP01.DGCX)
                    }

                    Name (JTB3, Buffer (0x04)
                    {
                         0x00                                             // .
                    })
                    CreateField (JTB3, Zero, 0x03, GUPS)
                    CreateField (JTB3, 0x03, One, GPGS)
                    CreateField (JTB3, 0x07, One, PLST)
                    If (LNotEqual (ToInteger (DFGC), Zero))
                    {
                        Store (One, GPGS) /* \_SB_.PCI0.RP01.PEGP.NGC6.GPGS */
                        Store (One, GUPS) /* \_SB_.PCI0.RP01.PEGP.NGC6.GUPS */
                        Return (JTB3) /* \_SB_.PCI0.RP01.PEGP.NGC6.JTB3 */
                    }

                    If (LEqual (ToInteger (GUPC), One))
                    {
                        GC6I ()
                        Store (One, PLST) /* \_SB_.PCI0.RP01.PEGP.NGC6.PLST */
                    }
                    ElseIf (LEqual (ToInteger (GUPC), 0x02))
                    {
                        GC6I ()
                        If (LEqual (ToInteger (PLPC), Zero))
                        {
                            Store (Zero, PLST) /* \_SB_.PCI0.RP01.PEGP.NGC6.PLST */
                        }
                    }
                    ElseIf (LEqual (ToInteger (GUPC), 0x03))
                    {
                        GC6O ()
                        If (LNotEqual (ToInteger (PLPC), Zero))
                        {
                            Store (Zero, PLST) /* \_SB_.PCI0.RP01.PEGP.NGC6.PLST */
                        }
                    }
                    ElseIf (LEqual (ToInteger (GUPC), 0x04))
                    {
                        GC6O ()
                        If (LNotEqual (ToInteger (PLPC), Zero))
                        {
                            Store (Zero, PLST) /* \_SB_.PCI0.RP01.PEGP.NGC6.PLST */
                        }
                    }
                    ElseIf (LEqual (ToInteger (GUPC), Zero))
                    {
                        Store (GETS (), GUPS) /* \_SB_.PCI0.RP01.PEGP.NGC6.GUPS */
                        If (LEqual (ToInteger (GUPS), One))
                        {
                            Store (One, GPGS) /* \_SB_.PCI0.RP01.PEGP.NGC6.GPGS */
                        }
                        Else
                        {
                            Store (Zero, GPGS) /* \_SB_.PCI0.RP01.PEGP.NGC6.GPGS */
                        }
                    }
                    ElseIf (LEqual (ToInteger (GUPC), 0x06)){}
                    Return (JTB3) /* \_SB_.PCI0.RP01.PEGP.NGC6.JTB3 */
                }
                Case (0x04)
                {
                    Return (0x80000002)
                }

            }

            Return (0x80000002)
        }
    }

    Scope (\_SB.PCI0.RP01)
    {
        Method (MSOF, 0, NotSerialized)
        {
        }

        Method (MSON, 0, NotSerialized)
        {
        }

        Method (DGOF, 0, NotSerialized)
        {
        }

        Method (DGON, 0, NotSerialized)
        {
        }
    }

    Scope (\)
    {
    }

    Scope (\_SB.PCI0.RP01.PEGP)
    {
        OperationRegion (NVHM, SystemMemory, NVHA, 0x00030400)
        Field (NVHM, AnyAcc, NoLock, Preserve)
        {
            NVSG,   128, 
            NVSZ,   32, 
            NVVR,   32, 
            NVHO,   32, 
            RVBS,   32, 
            RBF1,   786432, 
            RBF2,   786432
        }
    }

    Scope (\_SB.PCI0.RP01.PEGP)
    {
        Method (_ROM, 2, Serialized)  // _ROM: Read-Only Memory
        {
            If (LGreaterEqual (Arg0, 0x00018000))
            {
                Return (GETB (Subtract (Arg0, 0x00018000), Arg1, RBF2))
            }

            If (LGreater (Add (Arg0, Arg1), 0x00018000))
            {
                Subtract (0x00018000, Arg0, Local0)
                Subtract (Arg1, Local0, Local1)
                Store (GETB (Arg0, Local0, RBF1), Local3)
                Store (GETB (Zero, Local1, RBF2), Local4)
                Concatenate (Local3, Local4, Local5)
                Return (Local5)
            }

            Return (GETB (Arg0, Arg1, RBF1))
        }

        Method (GETB, 3, Serialized)
        {
            Multiply (Arg0, 0x08, Local0)
            Multiply (Arg1, 0x08, Local1)
            CreateField (Arg2, Local0, Local1, TBF3)
            Return (TBF3) /* \_SB_.PCI0.RP01.PEGP.GETB.TBF3 */
        }
    }

    Scope (\_SB.PCI0.RP01.PEGP)
    {
        Method (GOBT, 1, NotSerialized)
        {
            Name (OPVK, Buffer (0xE2)
            {
                /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0030 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0038 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0040 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0058 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0068 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0070 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0078 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0080 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0088 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0090 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0098 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00B8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00C8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00D8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00E0 */  0x00, 0x00                                       // ..
            })
            CreateWordField (Arg0, 0x02, USRG)
            If (LEqual (USRG, 0x564B))
            {
                Return (OPVK) /* \_SB_.PCI0.RP01.PEGP.GOBT.OPVK */
            }

            Return (Zero)
        }
    }

    Scope (\_SB.PCI0.RP01.PEGP)
    {
        Name (OMPR, 0x02)
        Name (OPTF, Zero)
        Method (NVOP, 4, Serialized)
        {
            If (LNotEqual (Arg1, 0x0100))
            {
                Return (0x80000001)
            }

            Switch (ToInteger (Arg2))
            {
                Case (Zero)
                {
                    Return (Buffer (0x04)
                    {
                         0x01, 0x00, 0x03, 0x04                           // ....
                    })
                }
                Case (0x1A)
                {
                    CreateField (Arg3, 0x18, 0x02, OPCE)
                    CreateField (Arg3, Zero, One, FLCH)
                    If (ToInteger (FLCH))
                    {
                        Store (OPCE, OMPR) /* \_SB_.PCI0.RP01.PEGP.OMPR */
                    }

                    Store (Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           // ....
                        }, Local0)
                    CreateField (Local0, Zero, One, OPEN)
                    CreateField (Local0, 0x03, 0x02, CGCS)
                    CreateField (Local0, 0x06, One, SHPC)
                    CreateField (Local0, 0x18, 0x03, DGPC)
                    CreateField (Local0, 0x1B, 0x02, HDAC)
                    Store (One, OPEN) /* \_SB_.PCI0.RP01.PEGP.NVOP.OPEN */
                    Store (One, SHPC) /* \_SB_.PCI0.RP01.PEGP.NVOP.SHPC */
                    Store (0x02, HDAC) /* \_SB_.PCI0.RP01.PEGP.NVOP.HDAC */
                    Store (One, DGPC) /* \_SB_.PCI0.RP01.PEGP.NVOP.DGPC */
                    If (\_SB.PCI0.RP01.PEGP._STA ())
                    {
                        Store (0x03, CGCS) /* \_SB_.PCI0.RP01.PEGP.NVOP.CGCS */
                    }

                    Return (Local0)
                }
                Case (0x1B)
                {
                    Store (Arg3, Local0)
                    CreateField (Local0, Zero, One, OPFL)
                    CreateField (Local0, One, One, OPVL)
                    If (ToInteger (OPVL))
                    {
                        Store (Zero, OPTF) /* \_SB_.PCI0.RP01.PEGP.OPTF */
                        If (ToInteger (OPFL))
                        {
                            Store (One, OPTF) /* \_SB_.PCI0.RP01.PEGP.OPTF */
                        }
                    }

                    Store (OPTF, Local0)
                    Return (Local0)
                }
                Case (0x10)
                {
                    Return (\_SB.PCI0.RP01.PEGP.GOBT (Arg3))
                }

            }

            Return (0x80000002)
        }
    }

    Scope (\_SB.PCI0.RP01.PEGP)
    {
        Name (DGOS, Zero)
        OperationRegion (PCNV, PCI_Config, 0x0488, 0x04)
        Field (PCNV, AnyAcc, NoLock, Preserve)
        {
                ,   25, 
            MLTF,   1
        }

        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
        {
            If (DGOS)
            {
                \_SB.PCI0.RP01.PEGP._ON ()
                Store (Zero, DGOS) /* \_SB_.PCI0.RP01.PEGP.DGOS */
                Store (Zero, MLTF) /* \_SB_.PCI0.RP01.PEGP.MLTF */
            }
        }

        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
        {
            If (LEqual (\_SB.PCI0.RP01.PEGP.OMPR, 0x03))
            {
                \_SB.PCI0.RP01.PEGP._OFF ()
                Store (One, DGOS) /* \_SB_.PCI0.RP01.PEGP.DGOS */
                Store (0x02, \_SB.PCI0.RP01.PEGP.OMPR)
            }

            Store (Zero, \_SB.PCI0.LPCB.EC.HKEY.ANGN) /* External reference */
            Store (Zero, \_SB.PCI0.LPCB.EC.HKEY.ANDN) /* External reference */
        }
    }

    Scope (\_SB.PCI0.RP01.PEGP)
    {
        Name (CPPC, Zero)
        Name (RQTC, Zero)
        Method (NVPS, 4, Serialized)
        {
            Switch (ToInteger (Arg2))
            {
                Case (Zero)
                {
                    Store (Buffer (0x08)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                        }, Local0)
                    Store (Buffer (0x08)
                        {
                             0x00, 0x20, 0x21, 0x22, 0x23, 0x2A, 0x13, 0xFF   // . !"#*..
                        }, Local3)
                    Store (Zero, Local4)
                    Store (DerefOf (Index (Local3, Local4)), Local5)
                    While (LNotEqual (Local5, 0xFF))
                    {
                        Divide (Local5, 0x08, Local2, Local1)
                        ShiftLeft (One, Local2, Local2)
                        Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1))
                        Increment (Local4)
                        Store (DerefOf (Index (Local3, Local4)), Local5)
                    }

                    Return (Local0)
                }
                Case (0x13)
                {
                    Store (Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           // ....
                        }, Local0)
                    CreateField (Arg3, 0x02, One, PPST)
                    CreateBitField (Local0, 0x02, CPST)
                    If (LEqual (\_SB.PCI0.LPCB.EC.HKEY.ANGN, Zero))
                    {
                        Store (One, \_SB.PCI0.LPCB.EC.HKEY.ANGN) /* External reference */
                        Store (One, RQTC) /* \_SB_.PCI0.RP01.PEGP.RQTC */
                        Notify (\_SB.PCI0.RP01.PEGP, 0xC0) // Hardware-Specific
                    }

                    If (LEqual (\_SB.PCI0.LPCB.EC.HKEY.ANDN, Zero))
                    {
                        Store (One, \_SB.PCI0.LPCB.EC.HKEY.ANDN) /* External reference */
                        \_SB.PCI0.LPCB.EC.HKEY.DNCG ()
                    }

                    If (LAnd (ToInteger (PPST), One))
                    {
                        If (LEqual (\_SB.PCI0.LPCB.EC.BVPC, One))
                        {
                            Store (Zero, \_SB.PCI0.LPCB.EC.BVPC) /* External reference */
                        }
                    }

                    Store (One, CPST) /* \_SB_.PCI0.RP01.PEGP.NVPS.CPST */
                    Return (Local0)
                }
                Case (0x20)
                {
                    Store (Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           // ....
                        }, Local0)
                    CreateField (Local0, 0x17, One, CPC2)
                    CreateField (Local0, 0x18, One, CUIT)
                    CreateField (Local0, 0x1E, One, PSER)
                    Store (One, CUIT) /* \_SB_.PCI0.RP01.PEGP.NVPS.CUIT */
                    Store (One, PSER) /* \_SB_.PCI0.RP01.PEGP.NVPS.PSER */
                    Store (One, CPC2) /* \_SB_.PCI0.RP01.PEGP.NVPS.CPC2 */
                    Return (Local0)
                }
                Case (0x21)
                {
                    Return (\_PR.PR00._PSS ())
                }
                Case (0x22)
                {
                    CreateField (Arg3, Zero, 0x08, PPCV)
                    Store (PPCV, CPPC) /* \_SB_.PCI0.RP01.PEGP.CPPC */
                    \PNTF (0x80)
                    Return (Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                           // ....
                    })
                }
                Case (0x23)
                {
                    Store (Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           // ....
                        }, Local0)
                    Store (CPPC, Index (Local0, Zero))
                    Return (Local0)
                }
                Case (0x2A)
                {
                    Store (Buffer (0x24)
                        {
                            /* 0000 */  0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                            /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0020 */  0x00, 0x00, 0x00, 0x00                           // ....
                        }, Local0)
                    Store (DerefOf (Index (Arg3, Zero)), Index (Local0, Zero))
                    CreateField (Arg3, Zero, 0x04, QTYP)
                    Switch (ToInteger (QTYP))
                    {
                        Case (Zero)
                        {
                            Store (\_SB.PCI0.LPCB.EC.TMP0, Local1)
                            Store (And (Local1, 0xFF), Index (Local0, 0x0C))
                            Return (Local0)
                        }
                        Case (One)
                        {
                            Store (0x08, Index (Local0, 0x0D))
                            Store (0x03, Index (Local0, One))
                            Return (Local0)
                        }
                        Case (0x02)
                        {
                            Store (0x03, Index (Local0, One))
                            Store (0x46, Index (Local0, 0x08))
                            Return (Local0)
                        }

                    }
                }

            }

            Return (Buffer (0x04)
            {
                 0x02, 0x00, 0x00, 0x80                           // ....
            })
        }

        Method (NVST, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.RP01.PEGP, 0x2A) // Reserved
        }
    }

    Scope (\)
    {
        Method (CMPB, 2, NotSerialized)
        {
            Store (SizeOf (Arg0), Local1)
            If (LNotEqual (Local1, SizeOf (Arg1)))
            {
                Return (Zero)
            }

            Store (Zero, Local0)
            While (LLess (Local0, Local1))
            {
                If (LNotEqual (DerefOf (Index (Arg0, Local0)), DerefOf (Index (Arg1, Local0
                    ))))
                {
                    Return (Zero)
                }

                Increment (Local0)
            }

            Return (One)
        }
    }

    Scope (\_SB.PCI0.RP01.PEGP)
    {
        Name (MXM3, Buffer (0x66)
        {
            /* 0000 */  0x4D, 0x58, 0x4D, 0x5F, 0x03, 0x00, 0x5D, 0x00,  // MXM_..].
            /* 0008 */  0x30, 0x11, 0xB8, 0xFF, 0xF9, 0x3E, 0x00, 0x00,  // 0....>..
            /* 0010 */  0x00, 0x00, 0x0A, 0xF0, 0xF9, 0x3E, 0x00, 0x00,  // .....>..
            /* 0018 */  0x60, 0xE9, 0xD0, 0xFE, 0xF9, 0x3E, 0x00, 0x00,  // `....>..
            /* 0020 */  0x60, 0x6A, 0xDA, 0xFE, 0xF9, 0x3E, 0x00, 0x00,  // `j...>..
            /* 0028 */  0x20, 0x2B, 0xE2, 0xFE, 0xF9, 0x3E, 0x00, 0x00,  //  +...>..
            /* 0030 */  0x60, 0x6C, 0xEA, 0xFE, 0xF9, 0x3E, 0x00, 0x00,  // `l...>..
            /* 0038 */  0x20, 0x6A, 0xDA, 0xFE, 0xF9, 0x3E, 0x00, 0x00,  //  j...>..
            /* 0040 */  0x20, 0x6C, 0xEA, 0xFE, 0xF9, 0x3E, 0x00, 0x00,  //  l...>..
            /* 0048 */  0x01, 0x90, 0x01, 0x00, 0x03, 0x00, 0x90, 0x01,  // ........
            /* 0050 */  0x13, 0x00, 0x90, 0x01, 0xE5, 0x0D, 0x01, 0x01,  // ........
            /* 0058 */  0x01, 0x00, 0x00, 0x00, 0xE5, 0x0D, 0x01, 0x03,  // ........
            /* 0060 */  0x00, 0x90, 0xD8, 0x09, 0x11, 0x0A               // ......
        })
        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            If (LEqual (Arg0, ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0")))
            {
                Return (\_SB.PCI0.RP01.PEGP.NVOP (Arg0, Arg1, Arg2, Arg3))
            }

            If (LEqual (Arg0, ToUUID ("a3132d01-8cda-49ba-a52e-bc9d46df6b81")))
            {
                Return (\_SB.PCI0.RP01.PEGP.NVPS (Arg0, Arg1, Arg2, Arg3))
            }

            If (LEqual (Arg0, ToUUID ("cbeca351-067b-4924-9cbd-b46b00b86f34")))
            {
                Return (\_SB.PCI0.RP01.PEGP.NGC6 (Arg0, Arg1, Arg2, Arg3))
            }

            If (LEqual (Arg0, ToUUID ("4004a400-917d-4cf2-b89c-79b62fd55665")))
            {
                Store (ToInteger (Arg2), Local0)
                If (LEqual (Local0, Zero))
                {
                    Return (Buffer (0x04)
                    {
                         0x01, 0x00, 0x01, 0x01                           // ....
                    })
                }

                If (LEqual (Local0, 0x18))
                {
                    Return (Unicode ("0"))
                }

                If (LEqual (Local0, 0x10))
                {
                    If (LEqual (Arg1, 0x0300))
                    {
                        Return (MXM3) /* \_SB_.PCI0.RP01.PEGP.MXM3 */
                    }
                }

                Return (0x80000002)
            }

            Return (0x80000001)
        }
    }
}

