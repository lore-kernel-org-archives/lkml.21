Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081661;
	b=ovRGfstvw+ZBLhwlx92h6ajn07hob998OwVs0ygcSInfccV3b9Ycjy0MdrFQ4gahBzyX
	 thmWuK6tB9/o+W/qNK9r/uyfnGtLIUtOK3e34FjkpKQV4faHZtW/p7koI2mmsJHzINKGt
	 ciq36y+kyjdZ00UOH1hz5MLxutGiWXo3ZAtPHQxtqiqacIrmodFitMsH1AaQudaIk/LzW
	 OUnOlDYAY1mkERjNSdn0AFpJ96MIAz6LyS/X9sPO6eYDaVOQuY2PsDPwpnJK/xpS4iSBC
	 kkqRIVOskkib+7RVJFpPCWkwmH8ZMp9J5LcunMdmQOGyvY29CEugRvCrN9allA6Ttig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081661;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kQ09RfFpt/7TSUf6vYtxBT4XsWexinP0sVkBp8S2BrM=;
	b=mt1Ghk94VgdtuIZlyUUdekDxe71Nf2STwJpS93B4oD+qTsdr0Obyqjmse9ex3sqQEvXf
	 cfW9q/BGONeZriJMRh6jPhJdVuYQ0NgL+dZ717X6Mb129taVVjjkBu06VjG5s2/Oc50Pe
	 WD03V6fcDN/QSXHx1VVZ/eBBr9IlEPCD39JrcBGXc2YCVZcL2iJAfgMakAm9uvsbcyBPr
	 Bmfmg2AIjnwFnQ9X5zMiDT8nzoIcWQZeuf/0ZgcgDyjQri300Khscch0clKtBTDJD3cnS
	 zu4mcyras/eNLz3LmFPoD9xd4b8j8uyJesbV8Dtqw0FX248uDG5WvxjYNRmObpvitCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MIYEVFEl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmwXWqVa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091D8606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 091D8606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MIYEVFEl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmwXWqVa
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ9IRZs2514235
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kQ09RfFpt/7
	TSUf6vYtxBT4XsWexinP0sVkBp8S2BrM=; b=MIYEVFEltmEqfyiITMokusBn6Ip
	UTovlinGpiD4kRfXbJQ21cj2s0bp4BYqHVtTOhrmxzw4UI1d6PPQ4Vke8oeAgrYz
	v4EawULtn8GLL3BWndy51LzRJFu8zt2GxdI6Ya8FzIQSiEQ4QcX/hOECUT1cacOQ
	TyHZYpiF0AJSYF78WBTcAt47ZbyPTc7WBJZcHK6k6qwCVvKQuR3x0XnpBoQeAFqr
	rdYoPvAKFw/pgjWZB1TsMzshGITQ394JgPYNbBUr823G21M1RxIN0y+M6ROZfGMH
	pye5HnDlc7XC103vOVPzC18NhLIur0bLq/9+UGvNuKeWyo/max5CgG8VhhA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xc6r4dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f559420f3so242624185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795081659; x=1795686459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kQ09RfFpt/7TSUf6vYtxBT4XsWexinP0sVkBp8S2BrM=;
        b=KmwXWqVaQK6+TR4ZqnQt06OCiL09E3Si6wL22boSUy/i5PamgPnqOxGEZdhdP8c4ui
         +rSGGWHQRGepm+eeZ0OnQbdQ44UMcborFEB1OeAbb8rbOstTV6hsrzNUz5Rkgoc5HGCB
         F+Pxf/A4mOHRtCuD0pxxpFjhAd1kzTzKnzsw8vrIQJ3ecirSdV1lHVJGsYpSID/wTcmR
         VfJTS85DmzhoEQKEaX4Iwvt90t9IczkKSdeahiL+qGZ2zTtCxuo86+6nondqvSBQZ73l
         SWwenF8Olg2tsdhlw7zXAL8YkarIaV6EoxQ6As/m8HU4aR+nGylPS1cezi3PzR9+QPcG
         FNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081659; x=1795686459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kQ09RfFpt/7TSUf6vYtxBT4XsWexinP0sVkBp8S2BrM=;
        b=v9o5mG/1c1v1kQu5rjoiHyGeYNTSQX3IOQDCU3yRqO5CafZ3oHono5tUUthaD8Zqgk
         e1nD0FDxoRc9xY6qJpLKJrXUJ6ZRAvMyV+sBW6+so6D7JmJAIRLijZ0/fP/4/ZDnk+FY
         poyjozQtnVZYhXDZ4K9GrwtpGYI6rqfHCqwrZnW5Y3GElBbTFKZm9AypGxK2AmEZVEhB
         exGIO8yZvYnSbDFkXnuBlGZfcTCOSepy9X8i+Uri7+oQNcJiih/c1bipDhbA3KY7x25J
         FKf+zgD7CDVWnnOjrRIZ2yK2CRbQKWJYCNI6ouArG3HOuO1eg2HEPs9tqdv5hnIluy3+
         oT+Q==
X-Forwarded-Encrypted: i=1; AL+hErGNUqH3sMxDXWHvH97A+a+UDhdvWhL//R1GlLurSkAAW5dw1scMzc+n4uVwqvIe7nn0FgM+0+3WhW3PIeo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EqRlhaLqJkzbuhFchotZr6bsK7LJhkIQIPddPBmIlZDfV7cV5
	Ck0EHmO+m0lMWJSlxuEXKLSvVBrtPSAXW9/Bq4A9sxPKqrZVYzKL5+scF0owNVGpX1P5WWyJPNG
	WRW+TfPyaCqos9ihznqGSfnbsibmNoVYcZwQQ8lQTOxExLybBJS/TvXvu9U6AMAxN/M4=
X-Gm-Gg: AYBFou3ZWJ9/be6NwmzZNeHRUmtmKooy3F9JbFrn96w+lNB1vBQxGkVA4pUHH55vIlT
	5/lwO4iir0GpBPumcTtOD2LOxFQSTfJyMOWHZFQCYktBsTbMvI7J4G6Zd3pW7d15j/KjE0g4KK0
	XXbL06HY+xldJHB+73Kbqi/rRNhuMkoubnY47njGhJJKVIyd+NzO8zFQS/12mXLNf8P4mDYfZ+H
	2guQm3h6Ae1n6tG/Co5Ow4WUjBW9bpaYIsF1wbjC/y3D6WobC8wETGII++Nb3YCir3mi9N2RVMs
	t4ViTcRhZqdlnxQpWFqjtXJamdCSCUbQJwafXp+4vILOypQ0Q9RoCjc4H54lPZA029GkS/sOEUd
	mbadAnzbaITZN/V3nJzqWNnumHvSBkDt30xCPyOJQiJ6XGcAYXxP2aiAv2qjGR05iXKpLJ5kI1i
	nA
X-Received: by 2002:a05:620a:2b4d:b0:949:33a9:8eea with SMTP id af79cd13be357-94999357739mr868564085a.0.1795081658298;
        Thu, 19 Nov 2026 01:47:38 -0800 (PST)
X-Received: by 2002:a05:620a:2b4d:b0:949:33a9:8eea with SMTP id af79cd13be357-94999357739mr868561285a.0.1795081657561;
        Thu, 19 Nov 2026 01:47:37 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d162:32b4:dec2:8b31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c1145esm9652992f8f.52.2026.11.19.01.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:47:36 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com, rafael@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 03/12] thermal: core: Validate thermal zone aggregation descriptions
Date: Thu, 19 Nov 2026 10:46:45 +0100
Message-ID: <20261119094706.3439040-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119094706.3439040-1-daniel.lezcano@oss.qualcomm.com>
References: <20261119094706.3439040-1-daniel.lezcano@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6afec5bb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=X8vhqgn2fEPoIbAfx2EA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX8mkrY8grr2UN
 QYwthoCrmg9EGFpM5XtBb0o724eFqrGjPU4ncMqkzBfTxc59dhtmdoitMVsrZJvN35fObn3DUWu
 Z2gPUVQdbRjcEAL6OYDrDlx2JqJ+u1y43l0cgF5EEEg5iGctLjyIX7tStjDEtBp0U/hw96yiWz4
 YAzOMS7tv34gdwfglWzHSLDTJlj1Dx9bcxwcAjyCPSSyzTC3rKDHDXtUUHGmaBdH+EjsbnCd34R
 LUJTvo0okMC7ozSAuXM6qZ1v3HdPstv61gLw6qbA0TjXy4iR/8Cg0gXK8eUvh8gxAozUL2/i1m8
 l1DBhakjnhWsIm2dfNdlAoZV6WuM9nC/KaXfOdeN1dCE2k7YKpw2vem9V1T1iftOurD74Mg7l05
 YVo/MKAFuWImbRbVIj7FJeEPy6RqZWwUzGJQTfjKbMMN+KHIlZDvCwmpZwIagh0ZNMOFaiXkz7d
 rMiz165jV9ZeOU93I4w==
X-Proofpoint-ORIG-GUID: N62xkzaLNbG28X2PdwtBpx-dno3zk4Dk
X-Proofpoint-GUID: N62xkzaLNbG28X2PdwtBpx-dno3zk4Dk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX0yRrlJEfX7ue
 +7BJg/7/KUwcer9ZkKV3kSEublP3i4M7KRg1ZOA2awwSn+7b6xKJfASgMO4yXt2V29v+epeyVMt
 4CQlYraliXUVthevfRXdUmckcdlIAko=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190038

Add a private helper to validate aggregation descriptions before
coefficient initialization and publication. Introduce thermal_aggregation.c
and build it as part of thermal_sys when CONFIG_THERMAL_AGGREGATION
is enabled. Keep aggregation optional and independent of OF support. Check for nonempty entries, valid
source zones, and sources that have not started exiting. Registered
non-aggregated sources already have a temperature callback, so there
is no need to check it again.

Accept the destination operations and reject set_trips because an
aggregate temperature window cannot directly program hardware
thresholds on its individual sources.

Before initialization, use zero to identify unspecified coefficients.
Accept either a complete nonzero coefficient set or an all-zero set
requesting averaging defaults, and reject partial specification. Keep
this check in the validator. Do not apply the presence check after
initialization, where zero is valid for temperature calculation.

Reject aggregated sources because aggregations of aggregated zones are
not supported yet. Inspect each source under its zone lock and document
that callers must hold valid source references and preserve the validated
configuration. Validation does not acquire references or prevent removal.

Leave invocation to the subsequent aggregation initialization changes.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/Kconfig               |  8 +++
 drivers/thermal/Makefile              |  1 +
 drivers/thermal/thermal_aggregation.c | 76 +++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 drivers/thermal/thermal_aggregation.c

diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index 810eeccedfba..b5185084eac1 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -17,6 +17,14 @@ menuconfig THERMAL
 
 if THERMAL
 
+config THERMAL_AGGREGATION
+	bool "Thermal zone aggregation"
+	help
+	  Allow thermal zones to calculate their temperature from multiple
+	  existing thermal zones using signed coefficients and an offset.
+	  This also enables discovery of multi-source zones in Device Tree.
+	  If unsure, say N.
+
 config THERMAL_NETLINK
 	bool "Thermal netlink management"
 	depends on NET
diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
index 3b249195c088..d059ca528908 100644
--- a/drivers/thermal/Makefile
+++ b/drivers/thermal/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_THERMAL)		+= thermal_sys.o
 thermal_sys-y			+= thermal_core.o thermal_sysfs.o
 thermal_sys-y			+= thermal_trip.o thermal_helpers.o
 thermal_sys-y			+= thermal_thresholds.o
+thermal_sys-$(CONFIG_THERMAL_AGGREGATION) += thermal_aggregation.o
 
 # netlink interface to manage the thermal framework
 thermal_sys-$(CONFIG_THERMAL_NETLINK)		+= thermal_netlink.o
diff --git a/drivers/thermal/thermal_aggregation.c b/drivers/thermal/thermal_aggregation.c
new file mode 100644
index 000000000000..f85f5a487d60
--- /dev/null
+++ b/drivers/thermal/thermal_aggregation.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/errno.h>
+
+#include "thermal_core.h"
+
+/**
+ * thermal_zone_aggregate_validate() - check an aggregation before initialization
+ * @aggregate: aggregation description to validate before coefficient initialization
+ * @ops: operations of the destination thermal zone
+ *
+ * The caller must hold valid references to the source zones and keep the entries
+ * stable. Take each source lock separately to inspect its parameters and state;
+ * the caller must not hold a thermal zone lock.
+ *
+ * Aggregations of aggregated zones are not supported yet: every source must be
+ * a registered, non-aggregated thermal zone. This also rejects
+ * a source whose parameters already reference this aggregation description.
+ * Source membership and non-aggregation must remain unchanged after validation.
+ * Validation does not acquire references or prevent subsequent source removal.
+ *
+ * Before initialization, zero denotes an unspecified coefficient. Either all
+ * coefficients must be supplied or all must be zero to request averaging
+ * defaults. This presence check must not be applied after initialization:
+ * zero is valid in the temperature calculation.
+ *
+ * Return: 0 on success, -EINVAL for an invalid description, partial coefficient
+ * specification, aggregated sources or destination set_trips,
+ * or -ENODEV for missing or exiting sources.
+ */
+static int __maybe_unused
+thermal_zone_aggregate_validate(struct thermal_zone_aggregate *aggregate,
+				const struct thermal_zone_device_ops *ops)
+{
+	unsigned int initialized = 0;
+	unsigned int i;
+
+	/* An aggregation needs a description and at least one source entry. */
+	if (!aggregate || !aggregate->entries || !aggregate->num_entries)
+		return -EINVAL;
+
+	/*
+	 * Destination operations must exist, but cannot program hardware windows:
+	 * aggregate temperature boundaries do not directly map to source thresholds.
+	 */
+	if (!ops || ops->set_trips)
+		return -EINVAL;
+
+	for (i = 0; i < aggregate->num_entries; i++) {
+		const struct thermal_zone_aggregate_entry *entry = &aggregate->entries[i];
+		struct thermal_zone_device *source = entry->tz;
+
+		/* Reject unresolved sources before inspecting their zone state. */
+		if (IS_ERR_OR_NULL(source))
+			return -ENODEV;
+		/* Before initialization, zero requests a default contribution. */
+		initialized += entry->coefficient != 0;
+
+		guard(thermal_zone)(source);
+		/* A reference protects lifetime, but does not prevent source exit. */
+		if (source->state & TZ_STATE_FLAG_EXIT)
+			return -ENODEV;
+		/* Nested aggregation, including a direct self-dependency, is unsupported. */
+		if (source->tzp && source->tzp->aggregate)
+			return -EINVAL;
+	}
+
+	/*
+	 * Require either a complete explicit combination or all-zero coefficients
+	 * for averaging defaults; there is no defined default for a partial set.
+	 */
+	if (initialized && initialized != aggregate->num_entries)
+		return -EINVAL;
+
+	return 0;
+}
-- 
2.43.0

