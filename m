Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419456;
	b=dUbFsfkTuTaX5767kZIk/nsd+SAYQQtnO5QRWm/y66uKvq21emhJ7VMywDXsttmSw/J6
	 5lATQbNXr2ZnmZ0QnPzy2I8Pz3ub9vfvW81H5z5XO4FbLtIHai05QOjyT1fxvkBUBApBE
	 FZ69vRivCpSt/uwDs6yPq2MUu2kn3Lk4bSQyTONY5u9jd7ICMJ1hs6SYVcyMi3OwfbwjR
	 QSCzmvX0MMpEaEmENj+0UYTkN/fZ/3kHh9Ywcrbq18gnI7dNinArfoNfRrZhIPXSnGCve
	 kP4mtzWCNLo4BIPLJ+YOit/YQoz3FXQ99JeaG0B1/WfAsT2q6AdHLxQdCGin+y3r0QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rJQj8diT46gF85iLvVaD+FzVg+GKyURO+Mwx9Pr2V/8=;
	b=X9/j0ZoKycnY2RHN9nnFPybACezlqRGQK5gufCik5cW0ftldGgCBhw+wE/g23mbNLhP3
	 OMvQphj79ab8usEooTiDWZgTW4py2P/lPJytnU3lu/5NUZEfIOlL9WfxXeMlYEhD2Nm6v
	 yxVthgIItAQFFqkYUruqWmsahKAbXiNBCzRBTSsmLDnrPgPR0KcnETvKGV0K2/xqTEMIz
	 tYaHUU+TUIckdqUPTdM+P3pMLaI+Zg2WSRPq4H8+VJK9pP+ptZMCV/TxjzdgcPGrdNjQy
	 FGGl0gbp5Pk86tvMAjwV25IjMIb7U+fm3fxHQWQsiIITYufbw4lNAwdv/YYEIs5XfOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jh5YCpnU;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C5A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6C5A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jh5YCpnU
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso2147176a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795419455; x=1796024255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rJQj8diT46gF85iLvVaD+FzVg+GKyURO+Mwx9Pr2V/8=;
        b=Jh5YCpnUkEfXv6fYN5/4HZIoqbtFnyazkD8wJxqLU19xivxBvbhJAGtij27r+B4dQS
         kjom1vH8nwa2u09YiSy5huBoWvTfiO/I/j4XtUzt8xlD3BKHxfh30GlfxBEKUNsOkuq1
         FVKAlhb57u6MP/DXEn/HvvaCRFn8A2MpImlea+jBUiCmtvY5qbjCLIQn74G+1cDWYlDQ
         fpU3+wTLbxWMK7YSx7I3Ntwx60+O6xk3KyKbHOFWEN0kvSSFo5Z4l1gZUZ0KEh5H60aI
         8N1xwuslLvqbaYVFIyz0gstGHIvLccxJLmNCwGZfGc8uTe0t9E+FgNwKeLdgSibAi66y
         AD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795419455; x=1796024255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJQj8diT46gF85iLvVaD+FzVg+GKyURO+Mwx9Pr2V/8=;
        b=bFea6WDqmEQ9hPpWordOyHnpEypWsRezGfuL7J0n+V76vUalUoozAzHh+JkJ6hjk0z
         Wz6/AoFJ8A0VOXi1msi5DcW3L4NAvQC++wl3etorWT/AKze2k8jy08bPnPcM9M0IH2nm
         /+8zIDfhQ1FvS7iqAQhAzb30SC+WNWV6G6I5DZvEE4WnbyvJRqqbfJp2BRDmhuEyyhla
         HfIxNPOe5+bOqm/TC7sBYs6Btbs+iA1Pj1BoXwzRAT5YdvsdZr7/M9gVLvulvQ1QNxnF
         13IWDOISMG/BBIb1ddzH7RDvTElnEnJcTnw5EvaG/JAvGEjCWDkpAHd099ZNWS5XhyiZ
         haFA==
X-Forwarded-Encrypted: i=1; AL+hErGEFDBzCO1rnTf06PCsgiFBuzlqifdrnlLXVX1N7Zu94lrESg2/NUUZoeqDN4HbbIsLuNlTNehzZClit70=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qW2lSsr6RwEEuH4AMRGbe8Irxtzp/ezO/ouvfN8H2ev62vyq3
	aCvjPXyqtRRJpzognP9UmD7lEUYy2IhDccFJoaUU6B84iCI0P/9dbSCY
X-Gm-Gg: AZFdTZcKgvqMrfdkAg2MFIMcce0M+23lRz4r79uOT9Qi8eW8S9xNjKDeonXOqqTcJVa
	6KTnYT5lcvNWl7aJMq1jKERvHMcBDKk2WnjIVmKasMIF2f5J9yi/qBTQciE5xRkwIlHdCF+aEq3
	nSb0x2QKK2bIPjx65h07jgF17GAq1mvA2rCYCf6SvZgYWM/NZzGYyaaOU7zSDFtCCTNt8us+pgF
	bI76ok7XTsz+4w1FfARks9JwhAnCeJYya482dvK6DdnR1lWIvHfDvDu9z5vymoo1Vw6x2jV20Q+
	neOUBelKd4nFySqF5+CJfUnrHVIGTZ1hW8k33qaoqTlATXsuYIfcyB5IhnGuse7GfVKsIOMx5BF
	l2xVQV/uF1mU0IPnw8qXA9Vng0JNdzd4WB5wD5ytbkDyRJSuoJyIAApzuySjfEzcZ0vaCsvo1NC
	xXidq+qj/PIZgmp9ZpnPvVnniVo7yAjKVqjkjyFw1/zPbTa+fuwHcdoffEeEO9K3B36mi7iK1LT
	TCZFFe9805N2oAdp3JBeFsRUuwnBjI9yAPx5KqlOm26I3dBkWCJ9bPj6rxqVp8zTNAVxXAdLmWq
	76LXB8mQBq95bc0UBL/Nokv3yd/Xb/6lfg==
X-Received: by 2002:a17:90b:4c4f:b0:3b1:ae88:5c31 with SMTP id 98e67ed59e1d1-3b41c959673mr10442468a91.43.1795419455243;
        Sun, 22 Nov 2026 23:37:35 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b3c71192sm227222a91.5.2026.11.22.23.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:37:34 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: will@kernel.org,
	mark.rutland@arm.com
Cc: robh@kernel.org,
	leo.yan@arm.com,
	james.clark@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] perf: arm_spe: Probe PMSNEVFR and PMSDSFR filter bits independently
Date: Mon, 23 Nov 2026 15:37:19 +0800
Message-Id: <20261123073719.3190149-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PMSEVFR_EL1, PMSNEVFR_EL1 and PMSDSFR_EL1 each have their own
implementation-defined RES0 bit sets, with the remaining bits being
RAZ/WI. The driver discovers the supported event filter bits by
probing PMSEVFR_EL1, but then reuses the resulting mask to validate
the inverse event filter (config3) and never validates the data
source filter (config4) at all beyond checking for the presence of
the FDS feature.

This has two consequences:

  * The inverse event filter is written verbatim to PMSNEVFR_EL1, so
    if PMSNEVFR_EL1 implements a different set of bits to PMSEVFR_EL1
    then a filter using bits that are RAZ/WI is accepted and silently
    has no effect, while a filter using bits that are writable in
    PMSNEVFR_EL1 but not PMSEVFR_EL1 is wrongly rejected with
    -EOPNOTSUPP.

  * PMSDSFR_EL1 holds an inclusion mask which the driver exposes
    inverted, so a set config4 bit requests that a data source is
    excluded and a cleared bit requests that it is included. Bits
    that are RAZ/WI are stuck at 0, so their data sources cannot be
    included while the data source filter is active: exclusion
    requests are always honoured, but inclusion requests for such
    sources are silently dropped.

Discover the supported filter bits of PMSNEVFR_EL1 and PMSDSFR_EL1
separately, probing each register only when the corresponding feature
(FnE / FDS) is implemented. Validate the inverse event filter against
the PMSNEVFR_EL1 mask, and reject data source filter configs which
ask to include a data source whose PMSDSFR_EL1 bit is not implemented.
For missing features, keep a full mask so that filter requests are
still rejected alongside the pre-existing feature checks.

Runtime-tested on Cortex-A78AE (SPEv1.0, which implements neither
FnE nor FDS) and on an SPEv1.2 CPU implementing FnE (but not FDS):
the PMU probes cleanly with the per-register discovery in place,
event filter configs are validated per-bit against the probed masks
with unimplemented bits rejected using -EOPNOTSUPP, and sampling is
unaffected. The PMSNEVFR_EL1 probe path itself is exercised on the
SPEv1.2 CPU, where the register happens to implement the same bits
as PMSEVFR_EL1. Only the FDS path lacks coverage on hardware
implementing the feature.

Fixes: 8d9190f00a975 ("perf: arm_spe: Add support for SPEv1.2 inverted event filtering")
Fixes: e6a27290d800 ("perf: arm_spe: Add support for filtering on data source")
Tested-by: Ping Li <leeonion.muyu@gmail.com>
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/perf/arm_spe_pmu.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 707778c67dab..00d54202c59b 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -92,6 +92,8 @@ struct arm_spe_pmu {
 	u64					features;
 
 	u64					pmsevfr_res0;
+	u64					pmsnevfr_res0;
+	u64					pmsdsfr_res0;
 	u16					max_record_sz;
 	u16					align;
 	struct perf_output_handle __percpu	*handle;
@@ -818,13 +820,22 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
 	if (arm_spe_event_to_pmsevfr(event) & spe_pmu->pmsevfr_res0)
 		return -EOPNOTSUPP;
 
-	if (arm_spe_event_to_pmsnevfr(event) & spe_pmu->pmsevfr_res0)
+	if (arm_spe_event_to_pmsnevfr(event) & spe_pmu->pmsnevfr_res0)
 		return -EOPNOTSUPP;
 
 	if (arm_spe_event_to_pmsdsfr(event) != U64_MAX &&
 	    !(spe_pmu->features & SPE_PMU_FEAT_FDS))
 		return -EOPNOTSUPP;
 
+	/*
+	 * The data source filter is exposed inverted, so validate the
+	 * value written to PMSDSFR_EL1 (~config4) rather than config4
+	 * itself.
+	 */
+	if (ATTR_CFG_GET_FLD(attr, inv_data_src_filter) &&
+	    (arm_spe_event_to_pmsdsfr(event) & spe_pmu->pmsdsfr_res0))
+		return -EOPNOTSUPP;
+
 	if (attr->exclude_idle)
 		return -EOPNOTSUPP;
 
@@ -1228,6 +1239,20 @@ static void __arm_spe_pmu_dev_probe(void *info)
 	write_sysreg_s(U64_MAX, SYS_PMSEVFR_EL1);
 	spe_pmu->pmsevfr_res0 = ~read_sysreg_s(SYS_PMSEVFR_EL1);
 
+	if (spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT) {
+		write_sysreg_s(U64_MAX, SYS_PMSNEVFR_EL1);
+		spe_pmu->pmsnevfr_res0 = ~read_sysreg_s(SYS_PMSNEVFR_EL1);
+	} else {
+		spe_pmu->pmsnevfr_res0 = U64_MAX;
+	}
+
+	if (spe_pmu->features & SPE_PMU_FEAT_FDS) {
+		write_sysreg_s(U64_MAX, SYS_PMSDSFR_EL1);
+		spe_pmu->pmsdsfr_res0 = ~read_sysreg_s(SYS_PMSDSFR_EL1);
+	} else {
+		spe_pmu->pmsdsfr_res0 = U64_MAX;
+	}
+
 	dev_info(dev,
 		 "probed SPEv1.%d for CPUs %*pbl [max_record_sz %u, align %u, features 0x%llx]\n",
 		 spe_pmu->pmsver - 1, cpumask_pr_args(&spe_pmu->supported_cpus),

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1

