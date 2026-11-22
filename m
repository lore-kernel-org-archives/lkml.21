Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373109;
	b=fVfNiTLlU/MHJYT8IEQGrXZTULtcqlTd/peIeDvkygewFHYAwVTQ4RIqB7+edo3AGQCl
	 Ri/qYvgR0KQdKKJCvymasj5zFXBZmAjyMHE4is5837LA/aCNvGJiZyMWBDGJNBu+R31Xg
	 U9YzuHJa4Kix72QJ87TyI7vnHPQ20BH2/csNYa8quJsr0Zg4YT1tZLkrD8K7HgrovD4S8
	 Verk4xy/vFLevMqxaVu7yHMz4j1scMy5ONwWQw8Z8w/wJcMk+fyu/k+IzgVwFE7DTBB+W
	 LzsaFJYrHiY4Oqb6EK/6+9v0/PkBFYkgt2GGfIy3ou1LJSJ2D3IXVusncTStBWN4Z0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=4UO6lsBJ7c54oQdvfF5gDh+eGlBppWPfqiUT6SIqJiU=;
	b=pzE4/08m+SUTqVLPVGwx0JFtbrv5UCyz3LdNcgy8Efr+XvOwlpVwIRKDdmXbKStyFDEK
	 mCbyEzsUj4UUIVA0/agnf7obSW7dQAHoCR5/2FjFTOJXPlhdRMGHQotUOmDrbRclAG07M
	 wStefgx9SNIUo8HFybih9G40daZ6J9bKW4V2aAXKFxEYCVTMPSf+5GqIygSRZufTIQOMp
	 rhd+S2Zne1ZU+8kFWTrewMgI8SK42Q/jsSPPMqHQ6BwhZpFXoAdLamL47yYWgMUtiuWrY
	 L6T1QyYg2WtkWBOP+1jmG0/qfYA9CrNpzOhKC/pCTg887+VK8P19YpluQvj3meqU+eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aEk98LLY;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ADD606A333
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59ADD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aEk98LLY
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b45655b428so1441050a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373109; x=1795977909; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UO6lsBJ7c54oQdvfF5gDh+eGlBppWPfqiUT6SIqJiU=;
        b=aEk98LLYmDBmZkiQh1c0+RMy2xlUHv6Pk76BLHgVY8PcMXVgZXtvjLFpe2t4vVhYcX
         fBNO/yMrJTQ4t58vfh5Pe4+7KAFwbxMadt2gZeDGLZLjm/mbKE38Hf0ATfjyYSXCnFbJ
         RXZGqMBb9ToTgfhvpM1ap7uTAsLgCXxJhrkxtjj037a6ZYxBq7CaqBeoaqa0gGoBH/pO
         1/j8ZByC/gD05QWfqyLWiOxmUEFK1pKz+ilg6SqaqJQzKwRAwsogQCuYuoT0thpMK8NE
         VPmwDsVzYf8aehohp893yB9cO3tRB813v28iSbYehncNwJrhc9k2VGpSqn57gMbgpz6f
         NvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373109; x=1795977909;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4UO6lsBJ7c54oQdvfF5gDh+eGlBppWPfqiUT6SIqJiU=;
        b=r/grwuUESDuKLV3J2P8N8knm8bxooLds7FhEO71ltgPujXC4KyO5UpLGkDI53tFWZ8
         fLJ0LqLgJSc9upYlLLlfSrx7zejnLvxqA0dFAmdbJnnOe7Da2uhjDFgPjts7UoVJn0dG
         NCMnonjhN7yXSMpEhwXhVFRYjLUtUh3l+kpnAh84/nsCWnBpP6KbMHuLsX/SLbm7Z4nG
         sIYQOyME/hU/HkkU31qJuhmKcVZwzsIB9WTtu0W+XsyrKB9xKfK6lGCK0PQTvZ+bv/Yh
         rTcdaJOn1g+FO8HoRuVkNf3Uf51SBeuAyuwZCTD6q6qcWwWqSkFKwMCf6gFM3k1huNfx
         ph5w==
X-Forwarded-Encrypted: i=1; AL+hErEkbbL0qpC4kRL+MJvuDaLOWjatyebUMllFf/LbAcRz7h1LPL0G1zEJY8Ew+0w3FindRQ2HrAGeY2LRgvw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IYCHdBvwKXaVhpUMX0mMLr+q9Y9SLn3bPx4Vb0NASea8yBoEq
	JdjpKP4Za+hqadQNpyC8SiTINxQi+Fa8AUxUV8+ynQ7pwR/5VpeP1WyY43P7uBSDcDN1yUWC0Vv
	43d/7Ovp+YjSs1JJeDGlKyA==
X-Received: from pjbie6.prod.google.com ([2002:a17:90b:4006:b0:3b3:c164:f1d8])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:17cb:b0:3b1:3598:f881 with SMTP id 98e67ed59e1d1-3b41cb20b9amr8960448a91.53.1795373108395;
 Sun, 22 Nov 2026 10:45:08 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:43 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-10-jthoughton@google.com>
Subject: [PATCH v3 09/19] arm64: Add bbm_through_af capability
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

HVO requires BBM Level 3 for the block -> table transitions when
optimizing the vmemmap, and it requires hardware AF management to avoid
taking page faults on the !AF translation that is installed as part of
the RW table -> RO + new OA table transitions.

Call this requirement "BBM through AF"; i.e., all CPUs support BBM-less,
in-place TTD updates. Model this as a system feature, as all CPUs must
support it for the kernel to use it.

It may seem odd to check for HVO support directly in bbm_through_af().
If this weren't done, any system with mismatched HW AF will no longer be
able to start late CPUs that are missing HW AF if all early CPUs have HW
AF (and BBML3).

This depends on HVO enablement not changing after boot, so select
ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/Kconfig                  |  1 +
 arch/arm64/include/asm/cpufeature.h |  5 +++++
 arch/arm64/kernel/cpufeature.c      | 33 +++++++++++++++++++++++++++++
 arch/arm64/tools/cpucaps            |  1 +
 4 files changed, 40 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 9b08b2457a55..4cce60c2de66 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -61,6 +61,7 @@ config ARM64
 	select ARCH_HAVE_ELF_PROT
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_HAVE_TRACE_MMIO_ACCESS
+	select ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
 	select ARCH_USE_CMPXCHG_LOCKREF
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index e3c8a1493dc8..b9106b5a8dcc 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -909,6 +909,11 @@ static inline bool system_supports_bbml3(void)
 	return alternative_has_cap_unlikely(ARM64_HAS_BBML3);
 }
 
+static inline bool system_supports_bbm_through_af(void)
+{
+	return alternative_has_cap_unlikely(ARM64_HAS_BBM_THROUGH_AF);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c9c9a6889455..d241638b5143 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -76,6 +76,7 @@
 #include <linux/kasan.h>
 #include <linux/percpu.h>
 #include <linux/sched/isolation.h>
+#include <linux/hugetlb.h>
 
 #include <asm/arm_pmuv3.h>
 #include <asm/cpu.h>
@@ -2044,6 +2045,31 @@ static bool has_bbml3(const struct arm64_cpu_capabilities *caps, int scope)
 	return cpu_supports_bbml3();
 }
 
+static bool has_bbm_through_af(const struct arm64_cpu_capabilities *caps, int scope)
+{
+	/* The kernel only enables HW AF updates with CONFIG_ARM64_HW_AFDBM. */
+	if (!IS_ENABLED(CONFIG_ARM64_HW_AFDBM))
+		return false;
+
+	/*
+	 * BBM-through-AF is only needed for HVO. If HVO is not in use, don't
+	 * penalize systems with mismatched support.
+	 */
+	if (!hugetlb_vmemmap_optimize_enabled()) {
+		/* Only valid if HVO cannot be enabled later via the sysctl. */
+		BUILD_BUG_ON(!IS_ENABLED(CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO));
+		return false;
+	}
+
+	/*
+	 * We need BBML3 to support Block -> Table transitions without taking
+	 * faults, and we need HW AF support to support changing the OA without
+	 * taking faults. has_cpuid_feature() checks HAFDBS >= AF, reading the
+	 * local CPU's register when verifying a late CPU.
+	 */
+	return cpu_supports_bbml3() && has_cpuid_feature(caps, scope);
+}
+
 static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
 {
 	/*
@@ -2953,6 +2979,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.type = ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,
 		.matches = has_bbml3,
 	},
+	{
+		.desc = "BBM-less TTD updates via Access Flag",
+		.capability = ARM64_HAS_BBM_THROUGH_AF,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_bbm_through_af,
+		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, AF)
+	},
 	{
 		.desc = "52-bit Virtual-Physical Addressing for S1 and S2 (LPA2)",
 		.capability = ARM64_HAS_LPA2,
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 3125695122a0..25292233ecd4 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -15,6 +15,7 @@ HAS_ADDRESS_AUTH_IMP_DEF
 HAS_AMU_EXTN
 HAS_ARMv8_4_TTL
 HAS_BBML3
+HAS_BBM_THROUGH_AF
 HAS_CACHE_DIC
 HAS_CACHE_IDC
 HAS_CNP
-- 
2.56.1.809.ga0b61035b5-goog

