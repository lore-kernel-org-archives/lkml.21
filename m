Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684043;
	b=yRwTbxWZNzGDFNB3chraaBwBr2wMEhopsQ4zXHeJMUHPyHw9vVyfz2BmdaylNwy6zZe5
	 T3KhE77qRHW2+15t5KxH6TPyJTDLTlELBnuyMITU1iDZ/TNSstEK5Gw9DAqudt/nKDNMd
	 EU2/I4yLXg+QGEPRy0Wd4/XNg6Lo8dY/doEuqcg5GOpGEYcax19NJaa8b+/8zQv3Y7brD
	 pZOnU4TCkqiFTvn5tO7Lpb8Glun0dmx/Uu+5WSltUlcpetKeDtnZIteLxLIrdpr1R2HAR
	 GIkbOMpTC2cDfwL/7hXt4+Bg7pIyF1ogh9qnP9K1ez3nqyKWmOsT8eaIvyeop9R6eMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=9Hd89c8JD9mWPM1aZ0uRbMq7kDfWlM+9M5g/GqO5V3A=;
	b=XG0YMy4LItcAIFIQgT+nqtxwcJol8+Ybb2cDYsmQ2RXKbhC5tpczRQOiauCt/js4nBRJ
	 lZEmF/5zmpsA1ccqQyfWRxANT/0CR2uu2pQ+jAz8aqupyluil0vBkiy5XVlDxWqHFkZFp
	 VIDo1/WavGg3P0lfw+RcqfQEDwufl/xfmyNQQyZ4m3halciIbD3Gaw5phfGZEtLhbYBrI
	 NA4HBCp8BQ2JD1qGctci9LRG/kIL5YNYXVP4hXhSwNdfC+f06f2v93md2TYOCInl9jj92
	 1unPAf8dcb1w/csQ51EArqO6SbyjkMUgnH0H17TH4Zjg0sU3z5Ym0vG52ifYbaBFcvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=K3oqkF1C;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32B8606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32B8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=K3oqkF1C
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-385d8a00598so9996036eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684042; x=1796288842; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9Hd89c8JD9mWPM1aZ0uRbMq7kDfWlM+9M5g/GqO5V3A=;
        b=K3oqkF1CAvBWE70QwSoKsMsz4Y5Y4x4YdY1SjJUkgsmb+k3iFqgsZMfCRxPv5sQMU5
         UbcAqpYTG0QW+ZqHW//WAqJz2wCUfD4OU39gb7R5imUNhZCji1ZiQgtqjvV9hfEqko9I
         25trK9xFTf7SXYa/C/GAQyFGLKWCtkt+QjTKzGLrgXszCmNeSrOQFzzCZl1ntYKgBZ7a
         2Y6a9Xfv5XwGMVvqNscbq8UaEDQqhMsJUUEHiMhcqfDh5SQWpo5uJceeUdZSRhCcCFj4
         MdDYzcEhTYqQfhLXu/nlI8Hwrs0h65Xw19vL7wCqqNYs81ACzrYPGyg91PRGfl+5+GQD
         w1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684042; x=1796288842;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Hd89c8JD9mWPM1aZ0uRbMq7kDfWlM+9M5g/GqO5V3A=;
        b=bnlFuCwak5LZ/aKcHZuxFARo+xfw6mXuDC49Q1a0LQeUL9dgQwZ+BXWS2sDv9eUSMq
         2MJn9/YbJlbfvT1oCXRu24+UcUfThBhUpPNvA+7CJtDWAG8GF9jXn3oRPcKb5fPFR6hz
         xiNbsbKBqwbedCkj3tllbcQlasOzg2HuTrDIeeLYwn9KIvVWZPjLmRtUCrZC/XBAFvZe
         RXY+Q4ZZqRNb/lQ59IHqO1OlbmQpjKPBPKO+oIiNgb94RE77Ukz4fYaoFpxw7IhScMDd
         E8GeMv4FuE15W9biGUiTBysFHXk4RHntnCSe056HJPW6/9Jafw+I3gDKLa6VfLHmSm1L
         Vxcg==
X-Forwarded-Encrypted: i=1; AL+hErFPBcJH65jm2j3x0E0aYnVxlc6b8YIcxr3Nlyii03D88ubNaZAuroy6XKeclBBPMvNztiY0l/nmHWTXez8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TEb0x2pmhonejei0Wku+/0OMvj8in3NO3gvxE3l0ulyyljhva
	EelX/jlXycAyDgNpmtscV1S3CFKx5dq5Vwn+jM0tQDNCi+pI0Y+tKLiLmT7GaXSv3zA=
X-Gm-Gg: AZFdTZc8cvJbOQ+FJC7BGmr53+E7o35f6AEptPpiHOKdXsAiSuh3jW9AsOp9xRB/k9t
	SEliU9LLEKqzEcKVUj+zvYaCkrP9dBawPMQ4g/0+CJLemVC5FxHVoVWu0x6nssfOyeXXEBzNnAy
	L0BIO+bNDaCtAp21KPO5R8byMZawhPj7vdbQ4gzji2NFfUQ+eA4WRE2wCsSlqU+hSMoJ32y80d+
	JKQtYu/FfisUUWmm6OqmpqzzURC0XvDh14jRtWPF6OcgivuV1Vmd03PJKRhgqkQdKSaMpxlEvaC
	UR5FcZJGopIai/7oJt/NtcxU+crhTn2Al7hVYby7pjNXY7dVCjmh3Y+drWhEXm0o8qhO7hV5T0s
	aHNuXgH+G5Wyy69gZtBoilzkrQwWY7B394lt3JnyF+Gt/Fv3a5M2KeCTPjrVdsUPSA5cUl7ABLy
	9gXkTBjfUhpYCmRyS5fdNx9AvDhrAMhaa8GN34hayCRjrRwAn6BfCDaCFkLEeFHxhw0uu5q/Jep
	PjJqtymJo6RMmWOAlscyEAl5rXiKQZuvTwU+7qUNwf6RFaQ1/vQ+9M++8/rB6YKSQQlLzE/ox+1
	E3chp9lPFNxF32K4JIu575SrpINB0oA0Hwn2RKjKBRc2
X-Received: by 2002:a05:693c:88d4:20b0:386:a8de:2bfc with SMTP id 5a478bee46e88-386a8de2f67mr13392563eec.6.1795684041729;
        Thu, 26 Nov 2026 01:07:21 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:21 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Subject: [PATCH 00/10] gtrace: Add support for SiFive pre-ratified RISC-V
 trace components
Date: Thu, 26 Nov 2026 01:07:06 -0800
Message-Id: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALv2B2sC/y2Ny26DMBBFfwV5XSO/IIRV/6PKYjweF1cBEo+pW
 kX59xrSzUh3dO65D8GUE7EYm4fI9J04rUsN+q0ROMHySTKFmoVRptfaOMm0BHnLlKGkmCjIkgF
 JkjUBjbcOFIharkRMP4f44/LKvPkvwrLb/olM960ulhcmZmKGY3Fsjj2ltOqMcba1ypnenKSWM
 /xu1TW1OKUCV3pfmdv7Bldc57mtZ3d7YJL7I5Wx8T2cI1iH5PRwQt+fg8VuGMB5HyNajdQFP0R
 xeT7/AMBCH8cQAQAA
X-Change-ID: 20261124-send-preratified-trace-e32dc2b34a0a
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yu-Chi Liang <leo.liang@sifive.com>, 
 linmin@eswincomputing.com, vincent.chen@sifive.com, 
 luyulin@eswincomputing.com, pritesh.patel@einfochips.com, 
 ganboing@gmail.com, dongxuyang@eswincomputing.com, 
 pinkesh.vaghela@einfochips.com, nick.hu@sifive.com, eric.lin@sifive.com, 
 huangyifeng@eswincomputing.com, darshan.prajapati@einfochips.com
X-Mailer: b4 0.16.0

This series adds support for pre-ratified (version 0.x) RISC-V trace
hardware, such as the SiFive trace encoder and trace funnel as integrated
in the ESWIN EIC7700 (HiFive Premier P550), on top of the gtrace framework
posted by Mayuresh Chitale and Anup Patel [1].

The gtrace framework and the rvtrace drivers in [1] target the ratified
RISC-V Trace Control Interface. Hardware that predates the ratified
specification is functionally the same (encoder -> funnel -> sink), but
differs in how it is discovered, routed and where the sink lives. The
specification of the pre-ratified trace hardware, is described in the
EIC7700X SoC Technical Reference Manual [3].
This series makes the existing framework drivers handle both flavours
instead of adding a second, parallel driver stack.

Background: how pre-ratified hardware differs
---------------------------------------------

 1. Discovery. The IMPL register layout differs and does not encode the
    component type. The sink availability is also reported there. Specific
    compatible strings are therefore needed: "sifive,trace-encoder0" and
    "sifive,trace-funnel0".

 2. Source ID. The number of SRC bits is preset by hardware (teImpl.nSrcBits)
    and offset 0x8 is the read-only teImplExtra register, not
    trTeInstFeatures. The trTeInstMode encoding also differs.

 3. Routing. Ratified hardware routes at the receiving end (e.g. a funnel
    masks inputs with trFunnelDisInput). Pre-ratified hardware routes at the
    sending end: the destination sink is chosen by a bitfield in the sending
    component's own control register.

 4. Sink. A ratified RAM sink is an independent component with its own MMIO
    block. A pre-ratified RAM sink is embedded in the encoder or funnel
    register block, with a different register map.

 5. Buffer placement. The sink limit and write-pointer registers share their
    upper 32 bits with the sink base register, so the trace buffer must not
    cross a 4 GiB boundary.

These touch the gtrace framework from [1], so I would like feedback on them
in particular. Do you think supporting pre-ratified spec by the following
modification is the way to go?

Architectural changes
---------------------

 * Per-compatible match data (struct rvtrace_match_data) carries two optional
   callbacks. get_impl() translates the pre-ratified IMPL register into the
   standard IMPL layout, so the common probe code needs no special case.
   get_data() returns component private data (the available sinks), stored in
   gtrace_component_id.data.

 * Version 0 is handled inside the existing drivers. Components are
   identified by major version 0 (rvtrace_comp_is_v0()), and the
   pre-ratified specifics are isolated in a new rvtrace-v0.{c,h}, selected
   by CONFIG_RVTRACE_V0. Ratified-only configurations are not affected.

 * Routing is configured at start() time from the path topology
   (rvtrace_v0_sink_config()). This needs the next hop of the path, which the
   old start() callback could not see; see the API changes below.

 * The embedded RAM sink reuses the ratified RAM sink setup and copy
   functions. The register offsets are abstracted into struct
   rvtrace_ramsink_regs, and the standard and v0 layouts each provide one.
   An encoder or funnel only sets up its sink when it supports the SBA sink
   and has no output connection, i.e. when it is the end of a path.

 * Because an encoder or funnel can now be in the middle of a path and also
   implement copyto_auxbuf(), gtrace_path_copyto_auxbuf() now only calls the
   callback of the path's sink. Previously it called the first component in
   the path that implemented it.

Function signature and API changes
----------------------------------

 * struct gtrace_driver::start()
     int (*start)(struct gtrace_component *comp);
   becomes
     int (*start)(struct gtrace_path_node *node);
   Pre-ratified hardware needs the information of the next component to pick
   the sink at the sending end. The node gives access to both the component
   (node->comp) and the connection (node->conn).

 * gtrace_match_id()
   Now ends id_table iteration on GTRACE_COMPONENT_TYPE_NONE instead of a
   zero version. A non-zero version as the end-of-table marker cannot work
   with version 0 entries such as rvtrace_component_mkversion(0, 0).

 * rvtrace_ramsink_read_pair() / rvtrace_ramsink_write_pair()
     (pdata, low_off)           ->  (pdata, low_off, high_off)
     (pdata, val, low_off)      ->  (pdata, val, low_off, high_off)
   Zane also suggested this and Mayuresh said to fix this in v7.

 * rvtrace_ramsink copyto_auxbuf()
   Split into __rvtrace_ramsink_copyto_auxbuf(comp, priv, buf, format), which
   takes the private data explicitly, and a thin wrapper that keeps the
   existing callback signature. The v0 encoder and funnel call the helper
   through the new rvtrace_v0_ramsink_copyto_auxbuf().

Testing
-------

 * Boot tested on a HiFive Premier P550 (ESWIN EIC7700, four P550 cores).
   Tracing was verified to work on this board:

     perf record -e gtrace/event=0x1/ ls

   and the decoded trace content was checked.

 * Firmware: U-Boot from [2] (branch eic7x-dt-fix-hfp) and OpenSBI v1.9.

 * For this testing I reverted commit a7b9ce39fbe4 ("serial: 8250_dw: Ensure
   BUSY is deasserted") locally, because without it the P550 hits an init
   hang. This also happens on v7.4-rc4. See the note at the end.
   The revert is not part of this series.

Dependencies
------------

This series applies on top of [1] (v6, 14 patches), rebased onto v7.4-rc4.
Zane has a patchset implementing RISC-V Linux trace support [4], which add
RISC-V trace funnel support. I will try to review and merge the pre-ratified
funnel accordingly.

[1] https://lore.kernel.org/all/20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com/
[2] https://github.com/ganboing/u-boot-eic7x/tree/eic7x-dt-fix-hfp
[3] https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases
[4] https://lore.kernel.org/all/20261023031505.2020925-1-liangzhen@linux.spacemit.com/

Side note: UART init hang on EIC7700 (question for the ESWIN folks)
--------------------------------------------------------------------

I added the people working on upstreaming EIC7700 / P550 support to Cc for
this one, as it is unrelated to the trace series.

On the HiFive Premier P550, booting v7.0 or later to a built-in initramfs
(busybox) hangs at init. I bisected it between v6.19 and v7.0 to

  a7b9ce39fbe4 serial: 8250_dw: Ensure BUSY is deasserted

and the hang is still there on v7.4-rc4. Reverting that commit makes the
board boot, and so does adding "snps,uart-16550-compatible" to the DW UART
nodes (the latter I only tried on v7.0).
The commit adds a BUSY workaround. I have not found the root cause.

Do you see the same hang with an initramfs on your boards?

Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
Eric Lin (9):
      dt-bindings: riscv: Add SiFive pre-ratified trace components
      gtrace: rvtrace: Add pre-ratified implementation callback
      gtrace: rvtrace: Add pre-ratified private data callback
      gtrace: rvtrace: Add pre-ratified encoder support
      gtrace: rvtrace: Add pre-ratified trace sink config
      gtrace: rvtrace: Add pre-ratified trace funnel driver
      gtrace: rvtrace: Introduce struct rvtrace_ramsink_regs to abstract register offsets
      gtrace: rvtrace: Add pre-ratified ramsink setup
      gtrace: rvtrace: Add copyto_auxbuf callback for pre-ratified encoder and funnel

Leo Yu-Chi Liang (1):
      gtrace: Terminate id_table iteration on GTRACE_COMPONENT_TYPE_NONE

 .../bindings/riscv/riscv,trace-component.yaml      |  96 +++++++++-
 drivers/hwtracing/gtrace/Kconfig                   |  25 +++
 drivers/hwtracing/gtrace/Makefile                  |   5 +-
 drivers/hwtracing/gtrace/gtrace-core.c             |  34 ++--
 drivers/hwtracing/gtrace/rvtrace-encoder.c         |  79 +++++++-
 drivers/hwtracing/gtrace/rvtrace-funnel.c          | 132 +++++++++++++
 drivers/hwtracing/gtrace/rvtrace-platform.c        |  46 ++++-
 drivers/hwtracing/gtrace/rvtrace-ramsink.c         | 211 +++++++++++++++++++--
 drivers/hwtracing/gtrace/rvtrace-ramsink.h         |  43 +++++
 drivers/hwtracing/gtrace/rvtrace-v0.c              |  99 ++++++++++
 drivers/hwtracing/gtrace/rvtrace-v0.h              |  80 ++++++++
 drivers/hwtracing/gtrace/rvtrace.h                 |  22 +++
 include/linux/gtrace.h                             |  20 +-
 13 files changed, 833 insertions(+), 59 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261124-send-preratified-trace-e32dc2b34a0a
prerequisite-message-id: 20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com
prerequisite-patch-id: 1d7b783884bfe7e1d91063e0f8a232b86cdf4c31
prerequisite-patch-id: 8f59df8d7a27f0b3d3f34a0abb35e6c893c0858b
prerequisite-patch-id: ef326ac6eba908afdd7a49a264094367ed03a1c0
prerequisite-patch-id: dae8df7640ac89ff801741dba7e6d8e66432d54b
prerequisite-patch-id: 56b583656f75c0bf3eec5dac4113782110bbcf0a
prerequisite-patch-id: eacbdac5b4875ee7c84d9878f5a3cccfb79f7476
prerequisite-patch-id: 81535ef70fc7c3823810f14dcd1a069a05e6e2ac
prerequisite-patch-id: 65f827c9235a732612499b9ef95355872dc12a9f
prerequisite-patch-id: 53d04850a79d6b6fa1d88b6b0d2cebc4348a41d7
prerequisite-patch-id: 7a9c5eaccb41e1e63169edc3605f2dde7c373da4
prerequisite-patch-id: 6e0bd370e542f4cd0db70ff88b6634be6a446aec
prerequisite-patch-id: 509f41312fbcaa6a2bd0d9255cfd2116dc241adb
prerequisite-patch-id: 0ede4337d462b0cec2b67c10533768c7de762408
prerequisite-patch-id: 6b8939aa81ca09a16895a9ecf4de71e377a04ea6

Best regards,
--  
Leo Yu-Chi Liang <leo.liang@sifive.com>

