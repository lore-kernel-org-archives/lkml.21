Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203228;
	b=hEf3dpXrwROYFy4Vd5BzaXlMjj1cAf38Vo70DqZhk7RRVEL6HmE2/P9SLb/7dZxy94pR
	 /GYjp6xkF62z/NHTjB6aepMHD8ifoQ1aQnkW7MWVYL5CqvoAQhujYxrpufwhICZsZ17B5
	 /aYKq7U90C2BCFo5RgP3cn1pogfti3KdU+9V74igqvMHFEM4D3XUk6Buyy3VfsISdXH/2
	 xRyG3K9+8VMrY+mtoPcRfPbCPRlaNsoJZcn0w14QK9/X3XV/dSGVEz7WFoDjzWCJc9q77
	 Jsq1Vi9ztg5DzvxT+2Z/Ei3Xo4V+3O1AuUS63BDC7q5VMRBEk+JUN4IiuWDD44SLdjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XxvxWbpwQHlBg+G8WUa4sjmdMcyGvHRkoLrVvfuy+Jk=;
	b=eEn3Po6mj5Dte2+eLUY3xMohi/U4ovrbPlZ+wTzUXnaV0BXvrqEbr7uoxjfMnThe40W+
	 PztBQ5KnbtJlNzLgPee6Kooxtnrm0EetdzVz+UROrglB5k9GvfaRBhzFKEYEKbb04Ex/L
	 kcs3jxUoTvJrS1DgyaWEY66+4TEJ3arfpuODrorSppj9C+JuFBrDeu+TdFZXTrpMbHU9n
	 Zp0E7p8YhKJdd8omhX3SHU7ZpSv7AqA3Rkq5+h6y1KUyZXf2C8tpkJRTC7bepMH9wdfKM
	 H9dgfUvhGncOUOCvPVqL3teXwT6BEgbkaImcQZYgulM5ptjop0Iq2crm/g96DBJfgkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cyZRJTHC;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A035606A6F2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A035606A6F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cyZRJTHC
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4f4095a7aso11538667b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795203226; x=1795808026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XxvxWbpwQHlBg+G8WUa4sjmdMcyGvHRkoLrVvfuy+Jk=;
        b=cyZRJTHCsCccQqe+KqYqCw49GsVOOZ30sUf3q2M/7zzAAKeEqyrsNpVuscSh5xAhuY
         tTAH6BWQPrZFNIeLd0ZHXgU9u31UP/BEMZsS+Sp4XH/V+HcpLiaO0ExOBMDo7XD8G2Vy
         MM3DvjxF2S5wo+dPW3oKi+j7CByJqC+bpEVhbE/MxesEGgmM9SCocUHq3sNqCZm2AziG
         muPUqzUieycvjLqa3TDUJN8nOwoCzrZ2bwkfgMUGhHJjO9lgYF7FVIUqEQtrIEHGKI2Y
         JRUzoTJCCgPUF3povHq3yFsEQWNfsTrtufdsdAiVus1JTd/SNe605CYuBnMbSRKR+tIZ
         pSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203226; x=1795808026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxvxWbpwQHlBg+G8WUa4sjmdMcyGvHRkoLrVvfuy+Jk=;
        b=0AJODxVIBifix4HljT4KWhyzjcRlF/wYxXkZEjBxiZHIH7g9bmN9tr6VXkBiGrRF5l
         ERhph6ZJMgL1b6sOQzDZRBsjdEJVak7ZRHsFkA9qWnn2kdtXM9vanokGFwz2UpvEjTkY
         n8GBMjOMUnH19QOn63HCmilQCAOam66JATjZYAwwhtyNiKDQJ45nitchVUNMUCHTLYH/
         DiIzhXW3nWzx/C1yb5kfqmxG1d1Wt8JMF+fCgbhhiitdDGoWe2FTmXhSI4va0HczDwsH
         7a6oTMG+ETdNtccFgWKJl6fQp5k6sC7x+EGycgUb2zxAwoUughBkutcETCmmIJMr3tVn
         /61w==
X-Forwarded-Encrypted: i=1; AL+hErEfrKc50J+c8c+k1xuVLMhkHn8h1U3eMhx126yGG3zsX8IImw9hWE1ta4P+giZ0Ks70DV/XZxE4ibWZAeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZLZCfc/em4XInussNRSvFMWv9cSLU8Xhcj5aj9ww0lX77A+am
	vXU/SJh6Meba9wzYAbgYk3tv1ukUMjV3h8qrcSOV+iGevuudi/zPg8lGAiDuOlhX
X-Gm-Gg: AZFdTZcqY9+t5Tp5U4GIg96hYNqOYvuf2fYiOGITcDR3LeIBzLAuf0g79B8sHH8Jplm
	rqPu4JGsSQUkuGb30Y5DxNrDHyD6DVe3eMp4sC1GlFTxhJ1IpqRX3Zkznd0iyW+UieF/UxMPHX1
	WslWbPjeFqO0LUaNOTS5SDqc+xdmNqvEPbQ3ySeA5MlaKpRjEdAVh8wFsZ8tDrdt3m5timPvK5k
	wjtWqHUxZvQv+UWSnjwmd8fsQl53j9LKKApXDnmko1BBs4HiFUJMtEGLkv8+SiAts1NTD/xeD1v
	yxOVpNStnXv8uIJUaLsCFJBoCapJOL1qJvMpHQlyzViAmCgnMvnpDCC1Jyz3LRe9puMb6hPbT0R
	Qo+gEkZf4JVRz7wD0gMB5eo9JQ22pbcvK1VheNT0qLCXIyGrz5++AmZiDBotNnB7F3CyuZr+8+p
	uGobKD13u5HD9KwQdCbAVPeYFi29XNrGHCZ+vD1O7U3dBkR4XJD97BnKJCxY6bDmv1Vch4QaZfI
	5ahKeswothi0ZFSXDj6rgpNFPvdzyIL6yN32z61COZ+G/J5wFQLpUE92WJgbrQA4SHG39c7vTNb
	pdk/X5SO+SyPemR+NjuTOcEWGjZFtuTDYXhH9fWyJsrLUSZT7KXL3YfIfATRe4si0H01EKniey9
	pWioLNLhPZENuxPayoWhggaeVMyFD/WU3YylCc0acSA==
X-Received: by 2002:a05:690c:e17:b0:8b4:dd2b:10da with SMTP id 00721157ae682-8b52049a10cmr22163777b3.20.1795203226054;
        Fri, 20 Nov 2026 11:33:46 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52033c2d4sm17125487b3.36.2026.11.20.11.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:33:45 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 20 Nov 2026 14:33:41 -0500
Subject: [PATCH 2/4] powerpc/32: Enable and decode MPC7448 L2 ECC machine
 checks
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
Message-Id: <20261120-ppc32-l2-ecc-v1-2-98fc8e6e0a32@gmail.com>
References: <20261120-ppc32-l2-ecc-v1-0-98fc8e6e0a32@gmail.com>
In-Reply-To: <20261120-ppc32-l2-ecc-v1-0-98fc8e6e0a32@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, 
 Tony Luck <tony.luck@intel.com>, Matt Turner <mattst88@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-edac@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14906; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=OJOl5TW9Rck6fNVflajy1RAKPXHzfh/i0dbgAbYnieQ=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIZFkw5vOZOcc/6v3K7J80JjWoQPVVaMGPXQaXDt48ob
 /BSkjtf2PGRhUGMi2GmmCJL3HpFllltO5b6nJb+BTOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 mro5uRoYGJpaOFmZOFo6mJs7OToZObo6Ozq5ORpbmJgbOlo4mrpbmDFycAjDXnJ7AyLB/xbFpk1
 T0tulHJS/NVEtrvvNfRjfK+U02Q/t6T7FldnsZGWZXa2y2dosTnDudRV60cd1bv2h+zStHimecW
 3Bwwd5d7zgA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The MPC7448 has ECC on its L2 data array and parity on its tag array,
but L2ERRINTEN resets to 0, so uncorrectable L2 errors are never
reported and the bad data is used.

Enable machine checks for multi-bit ECC and tag parity errors at boot,
and save and restore L2ERRINTEN across sleep.  These errors now oops
instead of silently corrupting data.  Single-bit errors stay disabled:
there is no threshold to set, since L2ERRCTL[L2CTHRESH] is read-only and
0, and they are counted in L2ERRCTL[L2CCOUNT] anyway.

Add machine_check_7448(), which adds the L2 error registers to what
machine_check_745x() prints, and counts these machine checks per CPU for
the EDAC driver added in the next patch.  The CPU clears SRR1[RI] for
them, so they are never recoverable.

A multi-bit error injected with reporting enabled is decoded as

  Machine check in kernel mode.
  Caused by (from SRR1=101030, MSSSR0=20000): [L2 data parity/ECC]
  MPC7448 L2 error: L2ERRDET=80000008 [multi-bit ECC] [multiple errors]
    address 0x0054e1100 (dw 0): data read, 32 bytes burst
    data 00000000_00000003 syndrome 81 ECC 00
  Oops: Machine check, sig: 7 [#1]

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 MAINTAINERS                               |   8 ++
 arch/powerpc/include/asm/cpu_setup.h      |   1 +
 arch/powerpc/include/asm/cputable.h       |   1 +
 arch/powerpc/include/asm/mpc7448_l2.h     |  31 ++++++++
 arch/powerpc/include/asm/reg.h            |  32 ++++++++
 arch/powerpc/kernel/Makefile              |   3 +-
 arch/powerpc/kernel/cpu_setup_6xx.S       |  38 ++++++++-
 arch/powerpc/kernel/cpu_specs_book3s_32.h |   4 +-
 arch/powerpc/kernel/mpc7448_l2.c          | 124 ++++++++++++++++++++++++++++++
 9 files changed, 238 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fde7147bfa1e..4ea66ea2be2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9747,6 +9747,14 @@ L:	linux-edac@vger.kernel.org
 S:	Maintained
 F:	drivers/edac/intel-bff.c
 
+EDAC-MPC7448-L2
+M:	Matt Turner <mattst88@gmail.com>
+L:	linux-edac@vger.kernel.org
+L:	linuxppc-dev@lists.ozlabs.org
+S:	Maintained
+F:	arch/powerpc/include/asm/mpc7448_l2.h
+F:	arch/powerpc/kernel/mpc7448_l2.c
+
 EDAC-MPC85XX
 L:	linux-edac@vger.kernel.org
 S:	Orphan
diff --git a/arch/powerpc/include/asm/cpu_setup.h b/arch/powerpc/include/asm/cpu_setup.h
index 26d2c0e2c99c..c4d7f49027df 100644
--- a/arch/powerpc/include/asm/cpu_setup.h
+++ b/arch/powerpc/include/asm/cpu_setup.h
@@ -37,6 +37,7 @@ void __setup_cpu_750fx(unsigned long offset, struct cpu_spec *spec);
 void __setup_cpu_7400(unsigned long offset, struct cpu_spec *spec);
 void __setup_cpu_7410(unsigned long offset, struct cpu_spec *spec);
 void __setup_cpu_745x(unsigned long offset, struct cpu_spec *spec);
+void __setup_cpu_7448(unsigned long offset, struct cpu_spec *spec);
 
 void __setup_cpu_ppc970(unsigned long offset, struct cpu_spec *spec);
 void __setup_cpu_ppc970MP(unsigned long offset, struct cpu_spec *spec);
diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 8445533c946b..648e72fe7e6c 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -35,6 +35,7 @@ extern int machine_check_47x(struct pt_regs *regs);
 int machine_check_8xx(struct pt_regs *regs);
 int machine_check_83xx(struct pt_regs *regs);
 int machine_check_745x(struct pt_regs *regs);
+int machine_check_7448(struct pt_regs *regs);
 
 extern void cpu_down_flush_e500v2(void);
 extern void cpu_down_flush_e500mc(void);
diff --git a/arch/powerpc/include/asm/mpc7448_l2.h b/arch/powerpc/include/asm/mpc7448_l2.h
new file mode 100644
index 000000000000..a10c694b8583
--- /dev/null
+++ b/arch/powerpc/include/asm/mpc7448_l2.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * MPC7448 L2 cache error capture and reporting.
+ */
+#ifndef _ASM_POWERPC_MPC7448_L2_H
+#define _ASM_POWERPC_MPC7448_L2_H
+
+#include <linux/types.h>
+
+/* Snapshot of the L2 error detect and capture registers */
+struct mpc7448_l2_err {
+	u32 det;	/* L2ERRDET */
+	u32 attr;	/* L2ERRATTR */
+	u32 eaddr;	/* L2ERREADDR */
+	u32 addr;	/* L2ERRADDR */
+	u32 capt_hi;	/* L2CAPTDATAHI */
+	u32 capt_lo;	/* L2CAPTDATALO */
+	u32 capt_ecc;	/* L2CAPTECC */
+};
+
+/* 36-bit physical address of the double word that took the error */
+static inline u64 mpc7448_l2_err_paddr(const struct mpc7448_l2_err *e)
+{
+	return ((u64)(e->eaddr & 0xf) << 32) | e->addr;
+}
+
+void mpc7448_l2_err_capture(struct mpc7448_l2_err *e);
+void mpc7448_l2_err_print(const struct mpc7448_l2_err *e);
+unsigned int mpc7448_l2_mce_take(void);
+
+#endif /* _ASM_POWERPC_MPC7448_L2_H */
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 82a85d44776e..2f4adf5a606e 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -706,6 +706,38 @@
 #define L2CR_L2DO_745x		0x00010000	/* L2 data only (745x) */
 #define L2CR_L2REP_745x		0x00001000	/* L2 repl. algorithm (745x) */
 #define L2CR_L2HWF_745x		0x00000800	/* L2 hardware flush (745x) */
+
+/* MPC7448 L2 error injection, capture and reporting registers */
+#define SPRN_L2ERRINJHI		0x3D9	/* L2 error injection mask, data high */
+#define SPRN_L2ERRINJLO		0x3DA	/* L2 error injection mask, data low */
+#define SPRN_L2ERRINJCTL	0x3DB	/* L2 error injection control */
+#define   L2ERRINJCTL_ECCMB	0x00000200	/* Mirror data MSB onto ECC */
+#define   L2ERRINJCTL_DERRIEN	0x00000100	/* Data/ECC error injection */
+#define   L2ERRINJCTL_ECCERRIM	0x000000ff	/* ECC bit injection mask */
+#define SPRN_L2CAPTDATAHI	0x3DC	/* L2 error capture data, high word */
+#define SPRN_L2CAPTDATALO	0x3DD	/* L2 error capture data, low word */
+#define SPRN_L2CAPTECC		0x3DE	/* L2 error syndrome */
+#define   L2CAPTECC_ECCSYND	0xff000000	/* Calculated syndrome */
+#define   L2CAPTECC_ECCCHKSUM	0x000000ff	/* Datapath ECC */
+#define SPRN_L2ERRDET		0x3DF	/* L2 error detect (write 1 to clear) */
+#define SPRN_L2ERRINTEN		0x3E1	/* L2 error interrupt enable */
+/* Error bits shared by L2ERRDET and L2ERRINTEN */
+#define   L2ERR_MULL2ERR	0x80000000	/* Multiple errors (DET only) */
+#define   L2ERR_TPARERR		0x00000010	/* Tag parity error */
+#define   L2ERR_MBECCERR	0x00000008	/* Multiple-bit ECC error */
+#define   L2ERR_SBECCERR	0x00000004	/* Single-bit ECC error */
+#define SPRN_L2ERRATTR		0x3E2	/* L2 error attributes capture */
+#define   L2ERRATTR_DWNUM	0x30000000	/* Double word number */
+#define   L2ERRATTR_TRANSSIZ	0x07000000	/* Transaction size */
+#define   L2ERRATTR_BURST	0x00800000	/* Burst transaction */
+#define   L2ERRATTR_TRANSSRC	0x001f0000	/* Transaction source */
+#define   L2ERRATTR_TRANSTYPE	0x00003000	/* Transaction type */
+#define   L2ERRATTR_VALINFO	0x00000001	/* Capture registers valid */
+#define SPRN_L2ERRADDR		0x3E3	/* L2 error address, bits 4-35 */
+#define SPRN_L2ERREADDR		0x3E4	/* L2 error address, bits 0-3 */
+#define SPRN_L2ERRCTL		0x3E5	/* L2 error control */
+#define   L2ERRCTL_L2CCOUNT	0x000000ff	/* SBE count */
+
 #define SPRN_L3CR		0x3FA	/* Level 3 Cache Control Register */
 #define L3CR_L3E		0x80000000	/* L3 enable */
 #define L3CR_L3PE		0x40000000	/* L3 data parity enable */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 7bf6b16b2d93..3681dd45a056 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -106,7 +106,8 @@ obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 obj-$(CONFIG_FA_DUMP)		+= fadump.o
 obj-$(CONFIG_PRESERVE_FA_DUMP)	+= fadump.o
 obj-$(CONFIG_PPC_85xx)		+= idle_85xx.o
-obj-$(CONFIG_PPC_BOOK3S_32)	+= idle_6xx.o l2cr_6xx.o cpu_setup_6xx.o
+obj-$(CONFIG_PPC_BOOK3S_32)	+= idle_6xx.o l2cr_6xx.o cpu_setup_6xx.o \
+				   mpc7448_l2.o
 obj-$(CONFIG_TAU)		+= tau_6xx.o
 obj-$(CONFIG_HIBERNATION)	+= swsusp.o suspend.o
 ifdef CONFIG_PPC_85xx
diff --git a/arch/powerpc/kernel/cpu_setup_6xx.S b/arch/powerpc/kernel/cpu_setup_6xx.S
index ab3ca74e6730..dc17d5a8bd79 100644
--- a/arch/powerpc/kernel/cpu_setup_6xx.S
+++ b/arch/powerpc/kernel/cpu_setup_6xx.S
@@ -90,6 +90,13 @@ _GLOBAL(__setup_cpu_745x)
 	bl	setup_745x_specifics
 	mtlr	r5
 	blr
+_GLOBAL(__setup_cpu_7448)
+	mflr	r5
+	bl	setup_common_caches
+	bl	setup_745x_specifics
+	bl	setup_7448_l2_errors
+	mtlr	r5
+	blr
 
 /* Enable caches for 603's, 604, 750 & 7400 */
 SYM_FUNC_START_LOCAL(setup_common_caches)
@@ -300,6 +307,23 @@ END_FTR_SECTION_IFSET(CPU_FTR_NO_DPM)
 	blr
 SYM_FUNC_END(setup_745x_specifics)
 
+/*
+ * Clear L2 errors left by firmware and raise a machine check for
+ * uncorrectable ones.
+ */
+SYM_FUNC_START_LOCAL(setup_7448_l2_errors)
+	li	r3,-1
+	mtspr	SPRN_L2ERRDET,r3	/* write 1 to clear */
+	li	r3,0
+	mtspr	SPRN_L2ERRATTR,r3	/* clear VALINFO: re-arm capture */
+	li	r3,L2ERR_TPARERR | L2ERR_MBECCERR
+	sync
+	mtspr	SPRN_L2ERRINTEN,r3
+	sync
+	isync
+	blr
+SYM_FUNC_END(setup_7448_l2_errors)
+
 /*
  * Initialize the FPU registers. This is needed to work around an errata
  * in some 750 cpus where using a not yet initialized FPU register after
@@ -329,7 +353,8 @@ _ASM_NOKPROBE_SYMBOL(__init_fpu_registers)
 #define CS_ICTRL	20
 #define CS_LDSTCR	24
 #define CS_LDSTDB	28
-#define CS_SIZE		32
+#define CS_L2ERRINTEN	32
+#define CS_SIZE		36
 
 	.data
 	.balign	L1_CACHE_BYTES
@@ -391,6 +416,10 @@ _GLOBAL(__save_cpu_setup)
 	stw	r4,CS_LDSTCR(r5)
 	mfspr	r4,SPRN_LDSTDB
 	stw	r4,CS_LDSTDB(r5)
+	bne	cr7,1f
+	/* Backup 7448 specific registers */
+	mfspr	r4,SPRN_L2ERRINTEN
+	stw	r4,CS_L2ERRINTEN(r5)
 1:
 	bne	cr6,1f
 	/* Backup 750FX specific registers */
@@ -484,6 +513,13 @@ _GLOBAL(__restore_cpu_setup)
 	mtspr	SPRN_LDSTDB,r4
 	isync
 	sync
+	bne	cr7,2f
+	/* Restore 7448 specific registers */
+	lwz	r4,CS_L2ERRINTEN(r5)
+	sync
+	mtspr	SPRN_L2ERRINTEN,r4
+	isync
+	sync
 2:	bne	cr6,1f
 	/* Restore 750FX specific registers
 	 * that is restore HID2 on rev 2.x and PLL config & switch
diff --git a/arch/powerpc/kernel/cpu_specs_book3s_32.h b/arch/powerpc/kernel/cpu_specs_book3s_32.h
index 90ca26405c1d..039094c1c245 100644
--- a/arch/powerpc/kernel/cpu_specs_book3s_32.h
+++ b/arch/powerpc/kernel/cpu_specs_book3s_32.h
@@ -585,8 +585,8 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.dcache_bsize		= 32,
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
-		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_745x,
+		.cpu_setup		= __setup_cpu_7448,
+		.machine_check		= machine_check_7448,
 		.platform		= "ppc7450",
 	},
 	{	/* default match, we assume split I/D cache & TB (non-601)... */
diff --git a/arch/powerpc/kernel/mpc7448_l2.c b/arch/powerpc/kernel/mpc7448_l2.c
new file mode 100644
index 000000000000..4ec3c6a0558e
--- /dev/null
+++ b/arch/powerpc/kernel/mpc7448_l2.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * MPC7448 L2 cache error capture and machine check decode.
+ *
+ * The MPC7448 protects its L2 data array with SEC-DED ECC and its tag
+ * array with parity.  Detected errors are latched in L2ERRDET and, for
+ * the error types enabled in L2ERRINTEN, raise a machine check with
+ * SRR1[MSS] and MSSSR0[L2DAT] or MSSSR0[L2TAG] set.  See the MPC7450 RISC
+ * Microprocessor Family Reference Manual, rev. 5, sections 2.2.5.5 and
+ * 3.6.3.4.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/percpu.h>
+#include <linux/printk.h>
+
+#include <asm/cputable.h>
+#include <asm/local.h>
+#include <asm/mpc7448_l2.h>
+#include <asm/ptrace.h>
+#include <asm/reg.h>
+
+/* L2 machine checks not yet collected by mpc7448_l2_mce_take() */
+static DEFINE_PER_CPU(local_t, mpc7448_l2_mce_count);
+
+/*
+ * Read the error detect and capture registers, then clear the detected
+ * errors and re-arm capture.  Must run on the CPU whose L2 is of interest.
+ */
+void mpc7448_l2_err_capture(struct mpc7448_l2_err *e)
+{
+	e->det = mfspr(SPRN_L2ERRDET);
+	e->attr = mfspr(SPRN_L2ERRATTR);
+	e->eaddr = mfspr(SPRN_L2ERREADDR);
+	e->addr = mfspr(SPRN_L2ERRADDR);
+	e->capt_hi = mfspr(SPRN_L2CAPTDATAHI);
+	e->capt_lo = mfspr(SPRN_L2CAPTDATALO);
+	e->capt_ecc = mfspr(SPRN_L2CAPTECC);
+
+	if (e->det)
+		mtspr(SPRN_L2ERRDET, e->det);	/* write 1 to clear */
+	if (e->attr & L2ERRATTR_VALINFO)
+		mtspr(SPRN_L2ERRATTR, 0);	/* unfreeze capture */
+}
+EXPORT_SYMBOL_GPL(mpc7448_l2_err_capture);
+
+static const char *transsrc_str(u32 attr)
+{
+	switch (FIELD_GET(L2ERRATTR_TRANSSRC, attr)) {
+	case 0x00:
+		return "external";
+	case 0x10:
+		return "instruction";
+	case 0x11:
+		return "data";
+	default:
+		return "unknown source";
+	}
+}
+
+static const char *transtype_str(u32 attr)
+{
+	static const char * const types[] = {
+		"snoop", "write", "read", "reserved"
+	};
+
+	return types[FIELD_GET(L2ERRATTR_TRANSTYPE, attr)];
+}
+
+static unsigned int transsize(u32 attr)
+{
+	unsigned int siz = FIELD_GET(L2ERRATTR_TRANSSIZ, attr);
+
+	if (attr & L2ERRATTR_BURST)
+		return siz * 16;
+	return siz ?: 8;
+}
+
+void mpc7448_l2_err_print(const struct mpc7448_l2_err *e)
+{
+	pr_err("MPC7448 L2 error: L2ERRDET=%08x%s%s%s%s\n", e->det,
+	       e->det & L2ERR_TPARERR ? " [tag parity]" : "",
+	       e->det & L2ERR_MBECCERR ? " [multi-bit ECC]" : "",
+	       e->det & L2ERR_SBECCERR ? " [single-bit ECC]" : "",
+	       e->det & L2ERR_MULL2ERR ? " [multiple errors]" : "");
+	pr_err("  address 0x%09llx (dw %u): %s %s, %u bytes%s%s\n",
+	       mpc7448_l2_err_paddr(e),
+	       (unsigned int)FIELD_GET(L2ERRATTR_DWNUM, e->attr),
+	       transsrc_str(e->attr), transtype_str(e->attr), transsize(e->attr),
+	       e->attr & L2ERRATTR_BURST ? " burst" : "",
+	       e->attr & L2ERRATTR_VALINFO ? "" : " (not latched)");
+	pr_err("  data %08x_%08x syndrome %02x ECC %02x\n",
+	       e->capt_hi, e->capt_lo,
+	       (unsigned int)FIELD_GET(L2CAPTECC_ECCSYND, e->capt_ecc),
+	       (unsigned int)FIELD_GET(L2CAPTECC_ECCCHKSUM, e->capt_ecc));
+}
+EXPORT_SYMBOL_GPL(mpc7448_l2_err_print);
+
+/* Return the number of L2 machine checks on this CPU since the last call */
+unsigned int mpc7448_l2_mce_take(void)
+{
+	return local_xchg(this_cpu_ptr(&mpc7448_l2_mce_count), 0);
+}
+EXPORT_SYMBOL_GPL(mpc7448_l2_mce_take);
+
+int machine_check_7448(struct pt_regs *regs)
+{
+	struct mpc7448_l2_err e;
+	bool l2 = (regs->msr & SRR1_MCE_MSS) &&
+		  (mfspr(SPRN_MSSSR0) & (MSSSR0_L2TAG | MSSSR0_L2DAT));
+
+	machine_check_745x(regs);
+
+	if (l2) {
+		mpc7448_l2_err_capture(&e);
+		mpc7448_l2_err_print(&e);
+		local_inc(this_cpu_ptr(&mpc7448_l2_mce_count));
+	}
+
+	/* Never recoverable: the CPU clears SRR1[RI] for L2 errors. */
+	return 0;
+}

-- 
2.56.1

