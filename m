Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795548172;
	b=LFy4SPCfSG8DR6AFgLvwR6Yfh1jth4FAFFc3qDQ6NZFt4hlXPHxfjRPhpUGuds40b7F4
	 SeaWn92ENgNj0Jtpi++8KN0VK8i4rV1YVm3yg5t93u8RpIZAr/di9aJvmcHdgcpo0a9Lr
	 DvSzR/5ejH+oyUVFErTESXW3YVZVaqV30qdJZQ/BZyrJlzpFgioKV6QY9AGSR4G/wK9K2
	 ICmF9kSpfV+/FWXjtgVcP7TOuwFOgbVRB83yjI8d0GW6Lo4u8sBouVFTu+SDA6+BzA3QC
	 yzbs9egLCodSVEs1AsCctDIlfNJaDJ/1qyeOvBi1zfMnZ5E2+Xf8gMkeY/NS2nBQQeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548172;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=RXFMJH7MzIHJE1l5uYa8fnKK6yzkCFtwgQGTZDi+HNo=;
	b=pJZOX8kBiK7x/L4owv4ABmn5yqqvBvkGitfnlhx+sEEv+vvDBoTfJO5cbZYSGnk/8h8h
	 WM5yn4B4VAN0Q/IQPbj8WVdT0osWbpRZyFH6a19IR7VOhNl/YNu/oNzyUY4M8/aAnOKeu
	 Y0C1Dzq/GrFATDzT32Iw2/5vJXso2AkWSVTALCZtEYxRqUDYoRyX+1tjszaCPLlfXRZsn
	 Ie5y4wgbp98oXTo/DhmeojYqy+oYSsSKTpDqTMwuxKbo6QzS+gEkCHyiWzI4Llk1uEoLP
	 UyYgRR4QVwgqwNyp2bMfXV2ned5399lV4/L9/e50kjXiEaurkmYH+u5IP/3/MhuEUaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lySgUK8Z;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=kVqELqhL;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41890606A321;
	Tue, 24 Nov 2026 19:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41890606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lySgUK8Z;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=kVqELqhL
Date: Tue, 24 Nov 2026 19:22:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795548170;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXFMJH7MzIHJE1l5uYa8fnKK6yzkCFtwgQGTZDi+HNo=;
	b=lySgUK8ZAgtiGG/+fvUncQHeqRI1+p5gg0/aaoXgeb+YQxerjsr6rd7O1D2j63OT3F3Xyy
	4527Bqo5513VKqb98BjeMgP8X1/Q7dwbmgpWaaC5opXRZCFuDaCPM1qNXxNFLYL2Py61mh
	CU2RWiSPvE4iSGYnq0JNvXxflUHXX341yGOV7fdoykDH08ZdhPmGmrZKQYQtDYa75dwshH
	eFB2KbbmSEQWrAjocFZ6ZZzHawM+6kFhW44l4MEVvrHIfxFglGmaKeoch1YkQzzHR+Sx6s
	nHPO04gJFbTADQNyxZdu6WwNjNp8BCQ0BULoQlMf1zzHfMhe8fDdW57H3ww0qg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795548170;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXFMJH7MzIHJE1l5uYa8fnKK6yzkCFtwgQGTZDi+HNo=;
	b=kVqELqhLPRWoIw1h8t30PBP1e4Nm5De/yOQisuvp+uC9qyXw5pZjlqVC631wyEtEwbl4Fb
	EqdijetGg5GJ+kCw==
From: "tip-bot2 for Babu Moger" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cache] x86,fs/resctrl: Rename AMD resctrl MSR defines to
 use MSR_AMD64_ prefix
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, Babu Moger <babu.moger@amd.com>,
 Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To:
 <9b55776701b2692772968a681a518ecd8326643e.1794946513.git.babu.moger@amd.com>
References:
 <9b55776701b2692772968a681a518ecd8326643e.1794946513.git.babu.moger@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179554816912.92412.11552409786559489637.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cache branch of tip:

Commit-ID:     3d414bf38740b3586ea25706dcec66584b78f895
Gitweb:        https://git.kernel.org/tip/3d414bf38740b3586ea25706dcec66584b7=
8f895
Author:        Babu Moger <babu.moger@amd.com>
AuthorDate:    Tue, 17 Nov 2026 14:15:12 -06:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Tue, 24 Nov 2026 11:04:24 -08:00

x86,fs/resctrl: Rename AMD resctrl MSR defines to use MSR_AMD64_ prefix

resctrl MSRs in the AMD address range (0xc0000xxx) are defined with an
MSR_IA32_ prefix even though they are AMD-specific and unrelated to Intel's
IA32 resctrl MSRs. The MSR_IA32_ prefix is misleading when reading or
grepping the codebase alongside the Intel MSR_IA32_* resctrl definitions
in msr-index.h.

Rename the AMD resctrl MSR definitions, update all call sites, and keep
the tools copy of msr-index.h in sync:

  MSR_IA32_MBA_BW_BASE      -> MSR_AMD64_MBA_BW_BASE
  MSR_IA32_SMBA_BW_BASE     -> MSR_AMD64_SMBA_BW_BASE
  MSR_IA32_L3_QOS_ABMC_CFG  -> MSR_AMD64_L3_QOS_ABMC_CFG
  MSR_IA32_L3_QOS_EXT_CFG   -> MSR_AMD64_L3_QOS_EXT_CFG
  MSR_IA32_EVT_CFG_BASE     -> MSR_AMD64_EVT_CFG_BASE

No functional changes.

  [ bp: Use the MSR_AMD64_ prefix because all those are architectural, see
    "Table A-1. MSRs of the AMD64 Architecture" in the APM v2.]

Suggested-by: Borislav Petkov (AMD) <bp@alien8.de>
Signed-off-by: Babu Moger <babu.moger@amd.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Link: https://patch.msgid.link/9b55776701b2692772968a681a518ecd8326643e.17949=
46513.git.babu.moger@amd.com
---
 arch/x86/include/asm/msr-index.h          | 10 +++++-----
 arch/x86/kernel/cpu/resctrl/core.c        |  4 ++--
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 +++---
 arch/x86/kernel/cpu/resctrl/internal.h    |  6 +++---
 arch/x86/kernel/cpu/resctrl/monitor.c     |  8 ++++----
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    |  4 ++--
 fs/resctrl/rdtgroup.c                     |  4 ++--
 tools/arch/x86/include/asm/msr-index.h    | 10 +++++-----
 8 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-inde=
x.h
index c091482..1c7b5d2 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1304,11 +1304,11 @@
 #define MSR_IA32_MBA_THRTL_BASE		0xd50
=20
 /* - AMD: */
-#define MSR_IA32_MBA_BW_BASE		0xc0000200
-#define MSR_IA32_SMBA_BW_BASE		0xc0000280
-#define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
-#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
-#define MSR_IA32_EVT_CFG_BASE		0xc0000400
+#define MSR_AMD64_MBA_BW_BASE		0xc0000200
+#define MSR_AMD64_SMBA_BW_BASE		0xc0000280
+#define MSR_AMD64_L3_QOS_ABMC_CFG	0xc00003fd
+#define MSR_AMD64_L3_QOS_EXT_CFG	0xc00003ff
+#define MSR_AMD64_EVT_CFG_BASE		0xc0000400
=20
 /* AMD-V MSRs */
 #define MSR_VM_CR                       0xc0010114
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl=
/core.c
index e647c3a..8019348 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -1025,10 +1025,10 @@ static __init void rdt_init_res_defs_amd(void)
 			r->cache.arch_has_sparse_bitmasks =3D true;
 			r->cache.min_cbm_bits =3D 0;
 		} else if (r->rid =3D=3D RDT_RESOURCE_MBA) {
-			hw_res->msr_base =3D MSR_IA32_MBA_BW_BASE;
+			hw_res->msr_base =3D MSR_AMD64_MBA_BW_BASE;
 			hw_res->msr_update =3D mba_wrmsr_amd;
 		} else if (r->rid =3D=3D RDT_RESOURCE_SMBA) {
-			hw_res->msr_base =3D MSR_IA32_SMBA_BW_BASE;
+			hw_res->msr_base =3D MSR_AMD64_SMBA_BW_BASE;
 			hw_res->msr_update =3D mba_wrmsr_amd;
 		}
 	}
diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/=
resctrl/ctrlmondata.c
index 6204448..e2afeed 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -108,9 +108,9 @@ static void resctrl_sdciae_set_one_amd(void *arg)
 	bool *enable =3D arg;
=20
 	if (*enable)
-		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
+		msr_set_bit(MSR_AMD64_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
 	else
-		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
+		msr_clear_bit(MSR_AMD64_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
 }
=20
 static void _resctrl_sdciae_enable(struct rdt_resource *r, bool enable)
@@ -120,7 +120,7 @@ static void _resctrl_sdciae_enable(struct rdt_resource *r=
, bool enable)
 	/* Walking r->ctrl_domains, ensure it can't race with cpuhp */
 	lockdep_assert_cpus_held();
=20
-	/* Update MSR_IA32_L3_QOS_EXT_CFG MSR on all the CPUs in all domains */
+	/* Update MSR_AMD64_L3_QOS_EXT_CFG on all the CPUs in all domains */
 	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held=
())
 		on_each_cpu_mask(&d->hdr.cpu_mask, resctrl_sdciae_set_one_amd, &enable, 1);
 }
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/res=
ctrl/internal.h
index 670ce92..5ddf217 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -40,7 +40,7 @@ struct arch_mbm_state {
 	u64	prev_msr;
 };
=20
-/* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
+/* Setting bit 0 in MSR_AMD64_L3_QOS_EXT_CFG enables the ABMC feature. */
 #define ABMC_ENABLE_BIT			0
=20
 /*
@@ -49,7 +49,7 @@ struct arch_mbm_state {
 #define ABMC_EXTENDED_EVT_ID		BIT(31)
 #define ABMC_EVT_ID			BIT(0)
=20
-/* Setting bit 1 in MSR_IA32_L3_QOS_EXT_CFG enables the SDCIAE feature. */
+/* Setting bit 1 in MSR_AMD64_L3_QOS_EXT_CFG enables the SDCIAE feature. */
 #define SDCIAE_ENABLE_BIT		1
=20
 /**
@@ -191,7 +191,7 @@ union cpuid_0x10_x_edx {
 };
=20
 /*
- * ABMC counters are configured by writing to MSR_IA32_L3_QOS_ABMC_CFG.
+ * ABMC counters are configured by writing to MSR_AMD64_L3_QOS_ABMC_CFG.
  *
  * @bw_type		: Event configuration that represents the memory
  *			  transactions being tracked by the @cntr_id.
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resc=
trl/monitor.c
index 3838e0a..cd09bdf 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -498,13 +498,13 @@ static void resctrl_abmc_set_one_amd(void *arg)
 	bool *enable =3D arg;
=20
 	if (*enable)
-		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
+		msr_set_bit(MSR_AMD64_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
 	else
-		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
+		msr_clear_bit(MSR_AMD64_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
 }
=20
 /*
- * ABMC enable/disable requires update of L3_QOS_EXT_CFG MSR on all the CPUs
+ * ABMC enable/disable requires update of MSR_AMD64_L3_QOS_EXT_CFG on all th=
e CPUs
  * associated with all monitor domains.
  */
 static void _resctrl_abmc_enable(struct rdt_resource *r, bool enable)
@@ -542,7 +542,7 @@ static void resctrl_abmc_config_one_amd(void *info)
 {
 	union l3_qos_abmc_cfg *abmc_cfg =3D info;
=20
-	wrmsrq(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg->full);
+	wrmsrq(MSR_AMD64_L3_QOS_ABMC_CFG, abmc_cfg->full);
 }
=20
 /*
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/res=
ctrl/rdtgroup.c
index 6e4eecc..70d020c 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -96,7 +96,7 @@ void resctrl_arch_mon_event_config_read(void *_config_info)
 		pr_warn_once("Invalid event id %d\n", config_info->evtid);
 		return;
 	}
-	rdmsrq(MSR_IA32_EVT_CFG_BASE + index, msrval);
+	rdmsrq(MSR_AMD64_EVT_CFG_BASE + index, msrval);
=20
 	/* Report only the valid event configuration bits */
 	config_info->mon_config =3D msrval & MAX_EVT_CONFIG_BITS;
@@ -112,7 +112,7 @@ void resctrl_arch_mon_event_config_write(void *_config_in=
fo)
 		pr_warn_once("Invalid event id %d\n", config_info->evtid);
 		return;
 	}
-	wrmsrq(MSR_IA32_EVT_CFG_BASE + index, config_info->mon_config);
+	wrmsrq(MSR_AMD64_EVT_CFG_BASE + index, config_info->mon_config);
 }
=20
 static void l3_qos_cfg_update(void *arg)
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 443b41a..559bccb 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1794,8 +1794,8 @@ static void mbm_config_write_domain(struct rdt_resource=
 *r,
 	mon_info.mon_config =3D val;
=20
 	/*
-	 * Update MSR_IA32_EVT_CFG_BASE MSR on one of the CPUs in the
-	 * domain. The MSRs offset from MSR MSR_IA32_EVT_CFG_BASE
+	 * Update MSR_AMD64_EVT_CFG_BASE on one of the CPUs in the
+	 * domain. The MSRs offset from MSR_AMD64_EVT_CFG_BASE
 	 * are scoped at the domain level. Writing any of these MSRs
 	 * on one CPU is observed by all the CPUs in the domain.
 	 */
diff --git a/tools/arch/x86/include/asm/msr-index.h b/tools/arch/x86/include/=
asm/msr-index.h
index 9c26d40..197f787 100644
--- a/tools/arch/x86/include/asm/msr-index.h
+++ b/tools/arch/x86/include/asm/msr-index.h
@@ -1297,11 +1297,11 @@
 #define MSR_IA32_MBA_THRTL_BASE		0xd50
=20
 /* - AMD: */
-#define MSR_IA32_MBA_BW_BASE		0xc0000200
-#define MSR_IA32_SMBA_BW_BASE		0xc0000280
-#define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
-#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
-#define MSR_IA32_EVT_CFG_BASE		0xc0000400
+#define MSR_AMD64_MBA_BW_BASE		0xc0000200
+#define MSR_AMD64_SMBA_BW_BASE		0xc0000280
+#define MSR_AMD64_L3_QOS_ABMC_CFG	0xc00003fd
+#define MSR_AMD64_L3_QOS_EXT_CFG	0xc00003ff
+#define MSR_AMD64_EVT_CFG_BASE		0xc0000400
=20
 /* AMD-V MSRs */
 #define MSR_VM_CR                       0xc0010114
