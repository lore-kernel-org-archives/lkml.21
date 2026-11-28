Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.83
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886467;
	b=s/pzQcLPwpdMvrfETDV3g7Nkth4SM/9pJLoD+R7yzf3lf9I0Ea3Iwk8S4p0bv4RIbX9O
	 Tjpiw/CX95kaPDZlp2S6Kvsh3RTFCp+oDFbDBV1gtMWQoiwf/O7jw+V7PCi5vydMtEaQD
	 /qdSHqoQ1W2XcEaQBgXyU4WygmFYeUdW0a9vs3FXqYxlrMTHSL4//zeoocn/Fn55b+1zH
	 7yQV2hSuE18ZS/98SeiRPT4Sr+N1r1a21BLKOD+sFwC9x33eln4YGHo+7nVBFTApF3H+M
	 is73edOssV5wQ9GUCzHRe8MLfgLdMHvZcloLnecsFD8OTwm5AIdJkWvSrnV0yRns1wQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886467;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Pkj5S3/pxqUN4763hEBi/cIsfVfzlLGQpnlTDZeqW2E=;
	b=eF/89B4/eDy6AQjj4Zfj4amRh6Q3LctjTumU/3Ema0jT4XANIyfUdcWS1ilG5wyiSod/
	 uXMpKM8Nm7bcsVt6EnnXcJvFebhGBCfva0vxXqmQ4yCqfilbTbo89zJP/geVJ0erLkSS/
	 ytdNANvJirmIrLkp9IVteYNg9vy+3A2ydLXudnKQnVidSZdnbZlU4Svnb8gOFWNGRG4u2
	 HCuj8y1Sr0mUdqPJhWPIiBKz8v3Lcco6cgJbzWl1Zec95wgRmVoPNFwLnXTS9Q3+vKQBl
	 FG7DUEr9RX+70tDxj19s+qURo9NpMFhhfJtJGZ7Otj9/PANzOooXZ1WMmK+vnF63RIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WOv7HB4T;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=NbaXhLqo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.83
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7843B606A6B4;
	Sat, 28 Nov 2026 17:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7843B606A6B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WOv7HB4T;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=NbaXhLqo
ARC-Seal: i=1; a=rsa-sha256; t=1795886449; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=R10TXVvBRg//nWV3iMzwIwIhOxL5bH+q3SK6GZ4OrRRYuOGqyqO/6fvPITnPyNnEfD
    dQTE1Mk9FVk9dLQzvU5/j6/LKIGGe5YD3z/V1uyYQwI0e67xJ7MorGCiZjgv8d4vkqTU
    kKWsPpwWlr0ikW5K7MAo/yliHnYYoVjeyQ9C7IK+Ujfi8vjkZ+mHwasQTteIfKi36Pux
    oPOzarLvgaRv1VhyreBnlfsQ4/CtdXeIss64zQmIkji71H0pPYhbDLu8pTMl8isJCq2r
    AlE/cVh/ci0xRnlmadLMiAq0LR70ZPyHNjBuW8H00tVsytdBK+1I+uSCQrXiZOWUkvGa
    N9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886449;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Pkj5S3/pxqUN4763hEBi/cIsfVfzlLGQpnlTDZeqW2E=;
    b=YxHcE7uTxg6YxJa+XCy5gYS9Vu6L7EvMUHHWM6PEivSm/OTxhxB38Yk6/5As8Dg/Ge
    0vckgcX6Y1JQBT3bhNJj/I0e3JZUL5Kr9cqc5H/cod3ACjNbKnKeu6FafrAoEnKTdfXo
    zqpGR+Hf32xo5RtNmHR/QAPnKUQsmGRzksra8aEhgd6OgsXtZXIZYq7BGtURlauod4gl
    Wg6jBDcIBmwXAvNnGfe8lV9pdrXGHyxnXPo+rlimmy2Fv9oGwY+6i+QoG4dQ7v9PPgQo
    Ai+RsHq5FBoKskBJ4KBxNS/ofH3OT95Ii2r7ZuWSteI1WYdHIYEXW5dD78qC1qImZDHI
    L3ug==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886449;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Pkj5S3/pxqUN4763hEBi/cIsfVfzlLGQpnlTDZeqW2E=;
    b=WOv7HB4TtN1zUZwi8d3TnUk7cuSAONz2+Hz3eC6yCbQL0m8FhDK69aTPxcnYrG6li9
    J75Y052eaiXh2/XjlyRZkGUDRqvhYZ2h4mou/lRmsLs/73EKMneCi/lrF143uFb0bdjS
    BH7+5bBkXipyU+Bhe8rV0PnG1jOoquR9IkIU28n2IQnPTWZNwQ8e8ACc+UqAw0WOws1W
    z2f7j9RNcWMHrHWwiBjlMswkDWoO6jl+tWqzVJrGIIsXXVpf1Kf/WZj0+wgKVHHG9/1b
    vVrV4c7MdCL7IkgNnJif0yvCDqWK+2xQOxkfoYWwGgvMzF8VkG7nqgd//AlJ1e8vpA2m
    5nWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795886449;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Pkj5S3/pxqUN4763hEBi/cIsfVfzlLGQpnlTDZeqW2E=;
    b=NbaXhLqogsYAbHS2pZb/V2JJm5GHzyignpTRpEwW83srK85ajC+A+tWbbXn0ZpvGdi
    /vyjaY1fD7CAAfLQUADA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ZpZn8iNpUqkTkKmhC9364Jszk5ZnVOZOaxS"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ASHKnLux
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 28 Nov 2026 18:20:49 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Paul Burton <paulburton@kernel.org>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=2C=20Pengpeng=20Hou?= <pengpeng@iscas.ac.cn>, Takashi Iwai <tiwai@suse.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, David Heidelberg <david@ixit.cz>, Paul Boddie <paul@boddie.org.uk>, " Maciej W . Rozycki " <macro@orcam.me.uk>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org,
	Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH v3 5/8] MIPS: Ingenic: Update Ingenic XBurst implementation IDs
Date: Sat, 28 Nov 2026 18:20:42 +0100
Message-ID: <24806b4b177c3e8a7b6cdc1368ab110a6dda897d.1795886445.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795886445.git.hns@goldelico.com>
References: <cover.1795886445.git.hns@goldelico.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit

Add PRID implementation constants for Ingenic XBurst and XBurst II
processors and handle the corresponding implementation IDs in
cpu_probe_ingenic().

The PRID table is updated based on Programming Manuals and hardware tests:
- jz4780: 0x3ee1024f (confirmed on CI20 board)
- x1000:  0x2ed1024f (unconfirmed)
- x1600:  0x00d00000 (confirmed on LX16 board)
- X1830:  0x00d00100 (unconfirmed)
- X2000:  0x00132000 (read out from LX20 board)
- X2600:  0x001320xx (confirmed 0x00132000 on LX26 board)

Additionally, clean up extra spaces in the comments for
PRID_IMP_XBURST_REV2 and PRID_IMP_XBURST2.

Distinguish XBurst1 implementations with different SIMD ISA revisions
and identify XBurst II processors using PRID_IMP_XBURST2.
The XBurst II classification follows the Ingenic vendor kernel.
Set CPU_XBURST2 for XBurst II instead of the generic CPU_XBURST.

Preserve the existing idle, non-coherent DMA and TLB handling when
changing the CPU type of XBurst II from CPU_XBURST to CPU_XBURST2.
The secondary cache geometry workarounds in sc-mips.c remain restricted
to CPU_XBURST as they only apply to specific XBurst I SoCs.

Use _CACHE_UNCACHED_ACCELERATED for the newly recognized XBurst1
implementation. Leave the writecombine handling of existing PRID
cases unchanged; the alternative X1600 cache attribute remains an
open question.

Public references:
- Ingenic Community, public SoC datasheets and programming manuals:
  https://github.com/Ingenic-community/datasheets/tree/main/X
  Includes the X1600 programming manual (X1600_PM_20220117.pdf)
  and documentation for other X-series SoCs, including X1000,
  X1830 and X2000.
- Ingenic, XBurst1 CPU Core Programming Manual:
  https://cdn.hackaday.io/files/1855627939084608/XBurst1_Core_PM.pdf
  Documents the XBurst1 core architecture and CP0 configuration.
- Ingenic, XBurst Instruction Set Architecture Programming Manual:
  https://www.setphaserstostun.org/ci20/X1000_M200_XBurst_ISA_MXU_PM.pdf
  Documents the original XBurst SIMD instruction set.
- Ingenic, XBurst2 CPU Core Programming Manual:
  https://www.manualslib.com/manual/2646351/Ingenic-Xburst-2-Cpu-Core.html
  Documents the XBurst2 core architecture.
- Ingenic, MIPS-LINUX toolchain R6.0.0 release notes:
  https://www.ingenic.com.cn/news-detail/nid-343.html
  Distinguishes MSA, MXA and MXU/MXU2 support in the toolchain.
- Ingenic, MIPS-LINUX toolchain R6.2.1 release notes:
  https://www.ingenic.com.cn/news-detail/nid-348.html
  Documents MXU3 support and identifies X2000 as an MSA target.

The public references document the available CPU, SoC and ISA
information. The PRID implementation handling follows the Ingenic
vendor kernel.

AI assistance: ChatGPT was used to help review the PRID definitions,
compare the Ingenic vendor implementation with the upstream code,
and draft the commit message with public references. The code changes,
hardware observations, and final patch were reviewed by the authors.

Co-developed-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes in v3:
    - Assign CPU_XBURST2 to the existing XBurst II CPU probe case.
    - Hardware readings of Config1.C2 on JZ4780, X1600, X2000 and X2600
      all returned zero. Without reliable documentation connecting this bit
      to MXU variants, no new MXU capability assumptions are introduced.
    
    Changes in v2:
    - removed the PRID_IMP_XBURST2_R2 definition and hints for an x2100 as
      there is no public reference
    - merged into single commit changing the PRID definitions and code
    - reviewed details and rewrote commit message
    
    Open Issue:
    Olivier Louvignes <olivier@mgcrea.io> pointed out that he has
    simply reused the definition of the X1830 for the X1600. This
    sets c->writecombine differently (_CACHE_CACHABLE_WA) from
    _CACHE_UNCACHED_ACCELERATED as we do here.
    Both settings appear to work but it needs expert comment which
    is the right/better one.
    
    Review: Olivier Louvignes discussed the PRID microarchitecture
    interpretation and the alternative X1600 writecombine setting.
    Paul Cercueil requested checking the X1600 MXU capabilities and
    noted the missing CPU DT binding. Hunter Laux suggested reading
    CP0 Config1.C2; the hardware measurements and their limitations
    are documented above.
    
    Additional v3 review against v7.4-rc4:
    - Preserve idle, non-coherent DMA and TLB handling for CPU_XBURST2.
    - Keep the XBurst I secondary cache geometry workarounds unchanged.

 arch/mips/include/asm/cpu.h    | 9 +++++----
 arch/mips/kernel/cpu-probe.c   | 9 ++++++++-
 arch/mips/kernel/idle.c        | 1 +
 arch/mips/mm/dma-noncoherent.c | 1 +
 arch/mips/mm/tlbex.c           | 1 +
 5 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index add26f08e8029..79fd9a0747cf2 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -47,7 +47,7 @@
 #define PRID_COMP_CAVIUM	0x0d0000
 #define PRID_COMP_LOONGSON	0x140000
 #define PRID_COMP_INGENIC_13	0x130000	/* X2000, X2100 */
-#define PRID_COMP_INGENIC_D0	0xd00000	/* JZ4730, JZ4740, JZ4750, JZ4755, JZ4760, X1830 */
+#define PRID_COMP_INGENIC_D0	0xd00000	/* JZ4730, JZ4740, JZ4750, JZ4755, JZ4760, X1830, X1600 */
 #define PRID_COMP_INGENIC_D1	0xd10000	/* JZ4770, JZ4775, X1000 */
 #define PRID_COMP_INGENIC_E1	0xe10000	/* JZ4780 */
 
@@ -186,9 +186,10 @@
  * These are the PRID's for when 23:16 == PRID_COMP_INGENIC_*
  */
 
-#define PRID_IMP_XBURST_REV1	0x0200	/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA	*/
-#define PRID_IMP_XBURST_REV2	0x0100	/* XBurst®1 with MXU2.0 SIMD ISA		*/
-#define PRID_IMP_XBURST2		0x2000	/* XBurst®2 with MXU2.1 SIMD ISA		*/
+#define PRID_IMP_XBURST		0x0000	/* XBurst1 */
+#define PRID_IMP_XBURST_REV1	0x0200	/* XBurst1 with MXU1.0/MXU1.1 SIMD ISA */
+#define PRID_IMP_XBURST_REV2	0x0100	/* XBurst1 with MXU2.0 SIMD ISA */
+#define PRID_IMP_XBURST2	0x2000	/* XBurst2 with MXU2.1 SIMD ISA */
 
 /*
  * These are the PRID's for when 23:16 == PRID_COMP_NETLOGIC
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 489612ed9d498..e84025d4c1a6a 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1768,6 +1768,13 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 
 	switch (c->processor_id & PRID_IMP_MASK) {
 
+	/* XBurst®1 */
+	case PRID_IMP_XBURST:
+		c->cputype = CPU_XBURST;
+		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
+		__cpu_name[cpu] = "Ingenic XBurst";
+		break;
+
 	/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA */
 	case PRID_IMP_XBURST_REV1:
 
@@ -1824,7 +1831,7 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 
 	/* XBurst®2 with MXU2.1 SIMD ISA */
 	case PRID_IMP_XBURST2:
-		c->cputype = CPU_XBURST;
+		c->cputype = CPU_XBURST2;
 		__cpu_name[cpu] = "Ingenic XBurst II";
 		break;
 
diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index 80e8a04a642e0..2c3683c3763cd 100644
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -157,6 +157,7 @@ void __init check_wait(void)
 	case CPU_CAVIUM_OCTEON2:
 	case CPU_CAVIUM_OCTEON3:
 	case CPU_XBURST:
+	case CPU_XBURST2:
 	case CPU_LOONGSON32:
 		cpu_wait = r4k_wait;
 		break;
diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index 30ef3e247eb7a..0f9aa7aee9977 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -33,6 +33,7 @@ static inline bool cpu_needs_post_dma_flush(void)
 	case CPU_BMIPS5000:
 	case CPU_LOONGSON2EF:
 	case CPU_XBURST:
+	case CPU_XBURST2:
 		return true;
 	default:
 		/*
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 69ea54bdc0c36..d9b90fc6186da 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -568,6 +568,7 @@ void build_tlb_write_entry(u32 **p, struct uasm_label **l,
 		break;
 
 	case CPU_XBURST:
+	case CPU_XBURST2:
 		tlbw(p);
 		uasm_i_nop(p);
 		break;
-- 
2.56.0

