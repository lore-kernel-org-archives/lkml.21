Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982785;
	b=xGeTCVAWI5WgxAUE8AJj55xpqNoblLl8XODV36L5kCfPCvvJvB5KXkcC2Thrtp8PFAHy
	 3FCcu91hfvB4qLAo8wSaHcq838jDrKkT366uYjMNTZE6R/PKdRZbu/ArO2+tMv83t2/Tp
	 OUhrLvNWvGjeY5d8KbjAD61fPLNRA7ldDiaisSpMDiVAS+HqJpRCXRxvjaIT161zSCiAx
	 0gDO7bWNqF7RfzrXAIXrpyz8cS2hK6QC9zuuojMCpQbLZtFzZBVvp6r5lovonv1Cpz8GH
	 WYKi342jfRYWl97NHDbpDh9cYXPGpxDHLf1yRR42owv1vVwe4zk6GpTtGm6m3cg5wuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
	b=yTKV7a8WmhePZ3svnAtm+TMl32vFunb1yFBW2XPmT+1OWqhesr03pQFq5GIlXU+1OxFQ
	 IauuMKuNotBlycylKpwH7aFeSJs5GvzDQlj1toFg+z1n+zo0OsELwgZ3svvKRDdrBI1lG
	 2NurOsqbpyfct/9iqCWjfaOpajmv0VMA4ioWhUauAyMOAk1gck34/AcPkPbeqyrWsPGYU
	 ZVVNbgT1gHeLTe3Lvk6Dx4QcZM5BXqnf4iXaP9d+CL6Us42ocLUPehqWrdpfhb4mB3ygJ
	 Z+++sWGI59ONa1cTKXwhEmY1G06kbLLD/r22kgtuykxi+X7295/fUUkyMdykxJleTmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Grcbm2Xq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3uKcgPV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F295606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F295606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Grcbm2Xq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3uKcgPV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UuX72383162
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=; b=Grcbm2XqdikCIFC6
	9bohMJTNmk66EgQmWKXYo7hkfBZiw9FLCRsPDAQV7RhojP/P/Rzd48UiMangWNcm
	MLAhQCnV5bEcu7s9Oph7fpO+RvTKsxVK6KisJg8/Ve0qQ8C1lHzor0ABfPhxKeup
	allGGuO8E/L+zW26h0DVfpe0YZd7+eAGM+chuJkePB5XF0NBGCNFRBXAaOz6ctfW
	XS5a4xjOGSIqHZFLfuom3HBb/pstpwB0aEwykyO/IXJ4fNft1t+xRcGKZ8r1F7wG
	/uIr0pFNVhb8OMBRhjuPqImtw58toemSiWvAjxNpRR5JuF+EmakBzxJc/2Gq/FFN
	lWMguA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvasjc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:19:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3c459a35eso712233a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982782; x=1795587582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=D3uKcgPVIpg2Jq2Pk/3J93PWIO4D//WmFrLcd3+Hm00X+CF4p6ZZFlSJkNQu8ny/Ro
         gSmpqHRTjF6m4o/PuiwBmNbECYSBwD8c+yJXvTqx8u34a+/o87+SM4OVdT4aq6jTUGTY
         nsh8EJ0C05dvyF7n2+ojwoUuOH1l1XmTBx8/G32d+cDz3wi47hkhYRPfsdjg5V1RR+97
         5rGv9A5cyzPuBxuK9Gy4V5lC7f1xALMc0B2GRovePsvaluML9CQ0Wln59yOm9Zx/sjmR
         t2c2GV2XAOTM9EWepTshNWIXsmOyrQOhg7cK+d7C36X7K7T7EOchGDtHXEWWeA2VB6+2
         Tg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982782; x=1795587582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=TvfSATBjSablTjjiFhwQMTRhwGrTf4Qvy5XdSpaFIYwzzOLHkHmvXsD3KBUrlE6/Dq
         67P7af+Q7PINWIRaqpG0KFgB+JhPcfLkIMpR7Gz3p+WPGOJ1nqMUXrRYHOT7rUBHPlzc
         da+ao8q4Ee/US/XAgFWH154V0w0cxEiBsz/+WRFuXG5VvMxFTABu0RJ+GzF/4DoyWhoB
         tyhya2cWWrMaQf92kzos3k8WSwuCIWuENbsZDpWE4+esmPp+It/6gaRzmOvXLTyB5s/t
         8xRLT6v9c5DEdbcqvrK4BnHTa2lRBWE/WmkFZooesFpGnJ4A581+M3qv3j4VH7//UJpG
         jyBg==
X-Forwarded-Encrypted: i=1; AL+hErE9XPDSRuxSSzAtR5SNdR/bYYhetbjFEFkLzT3tDGtuWHCpqfE7XC7JuEZMV4b3R3oU64GuHmeR+DvBmpk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8tyURnG/0bywnOEwIOJi4p2cigj29aTuaUvEtThn6szN7TSpV
	JVxj5EFggkvMrh5M7EsNWJTqZrwC0+Iw+ebDEJDrhgGN16KSMb4fzlLy5mPuQ9V1/pb4Xgs+L3t
	DlPqrsr12v6Fl0JDWvm3suqPoA/4QINdh+4x6L6h+axN8C5qNBM8fVFgiq0tdB3ZgGDw=
X-Gm-Gg: AZFdTZeBmJJOvYy0F+ARbuT3UwCJtECpkKBL3LoUHmXk6E068wqKyuVPHYz5zsDgz1g
	YpyF6YUa/fEhVw3fv3WP/HyxBZzI5S1IP3/2L/AjDBphI4yhwY0XuLgkePca+N06rgQ90vYJx3t
	/niVZoZ/H6edckXTYYWBKtm1/xmOSp85RXEdXuM38+PTVgQ9FAF/A5eweL1708l8QhxKmHBwIQg
	gHUpMo1bw/j0leOxCofXVIdEJhbKOsVFvXrA/Vp6X3ieD3l6PMNTDq7beizV6dYKVxsjrHmFKUG
	hiS5inzojYOs3WCXfeR6er63+OKd0PNmubal9d00o/aHe4AdvJRRvn+EdRoMI5ezqvXwfc0oKYp
	89GDjNJGbC7gWoHChnlRu1f9CWrAhtjssGN0WGndiTLHH4+AfdpOXfIN39RH/7SPGbJW0C9Scxq
	LHAwrEmqS+PD9blLTyvh4/AR3TG47PkK3sIaAFdb3LCNSg8cbQEi02xY0BqxBgV021QeDFFv8AK
	3s=
X-Received: by 2002:a17:90b:2fc5:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b3d07a8326mr1509067a91.21.1794982782088;
        Tue, 17 Nov 2026 22:19:42 -0800 (PST)
X-Received: by 2002:a17:90b:2fc5:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b3d07a8326mr1509048a91.21.1794982781577;
        Tue, 17 Nov 2026 22:19:41 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:41 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:09 +0530
Subject: [PATCH ath-next v2 06/15] wifi: ath12k: add initial Wi-Fi 8 hw
 params and init helper for QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-6-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd4380 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QEtot920D9eH50UxTSEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 07WwYv70A3KBTgPlP1D1E4tGItCkkL8r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX26N4NwxJBoKF
 siLt5yR28NcyqIhZQuMGRHvC/zIu0PyJA0mz6/vtWEpBzXWv3b2kw/bTOFnbkJZAlL5rGSq0tSW
 yNiMcgWjp07UwxXjsPNZsxMLUNXO6PD3TjPRfY5/txHh+U73qn5uevHSzE/Sl33owlQ5SIPoCS+
 B8rjb9FHFrV3upwReObS6AuOgsA3HypWfNjMuBpYRr8Z/3i4Fcqa6sm2z8541aZbfBpLlv1MG6y
 0oZNlNTzpeS/pQQKCKTg3uAgEEDjCKGoiFZK15Ci047TUyr2DKFazX0Mouvq8wTqFmv8rvDVTS+
 TJCJ1PSlApEzn0ByMeQVEuw922j+Dujc9xxTnQYdrdoi1tv8SWZnr0UQZSE9cqePaEPHZzwkt2F
 DccxkVnbAfxOCDwSYcIPCR/NY8POUF8cR+7EDe01zS1RVHYPnM8/UFJLREoxxemyeN5x5WnyAK7
 G8xlM10lnnmP0qQlOMQ==
X-Proofpoint-ORIG-GUID: 07WwYv70A3KBTgPlP1D1E4tGItCkkL8r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXw5TgUMoq5C0Y
 mcmqIEqGFiWqUh6o9ba03lHomjFrDrSJyvyGFEQP6A2MG+08K0/XzRbX/7SYG7EMFCLJZuSQuVw
 +qf5k0KnHETw9hED6AXngXTWuMm+ncc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

QCN9575 is a Wi-Fi 8 target that requires its own hardware-params entry
to be matched at probe time. Add ATH12K_HW_QCN9575_HW20 to ath12k_hw_rev
and populate the initial parameter set in wifi8/hw.c. Introduce
ath12k_wifi8_hw_init() to walk the Wi-Fi 8 hw_params table and select the
matching entry at runtime. Hardware-specific operation pointers (hw_ops,
wmi_init, mhi_config) and CE config tables are left as NULL placeholders
until the corresponding subsystem support is added. Explicitly initialize
every top-level member of the hw_params entry, including zero/NULL/false
defaults, rather than relying on implicit designated-initializer
zero-fill, so the full set of fields is visible and easy to audit as
later patches replace individual placeholders with real values. Add
wifi8/hw.h and wire wifi8/hw.c into the wifi8/Makefile.

Define QCN9575_QFPROM_RAW_RFA_PDET_ROW13_LSB with the correct OTP
register address 0x1F90070 and set it as the otp_board_id_register in the
QCN9575 hw_params.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h         |   1 +
 drivers/net/wireless/ath/ath12k/qmi.h          |   1 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |   1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     | 135 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.h     |  14 +++
 5 files changed, 152 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 2a4b5e5e1af3..56b509841126 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -159,6 +159,7 @@ enum ath12k_hw_rev {
 	ATH12K_HW_QCC2072_HW10,
 	ATH12K_HW_IPQ5424_HW10,
 	ATH12K_HW_QCN6432_HW10,
+	ATH12K_HW_QCN9575_HW20,
 };
 
 #define ATH12K_IRQ_NUM_MAX 57
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index fc68ff649352..438ab92802bf 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -19,6 +19,7 @@
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850 0x1
 
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9274	0x07
+#define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9575	0x07
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332	0x2
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6432	0x60
 #define ATH12K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01	32
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index b8c5b6d3a7bd..277b5f13754d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
 ath12k_wifi8-y += core.o \
+		  hw.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
new file mode 100644
index 000000000000..6e89a42111b6
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/types.h>
+
+#include "../core.h"
+#include "../debug.h"
+#include "../hw.h"
+#include "../mhi.h"
+#include "hw.h"
+
+static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
+	{
+		.name = "qcn9575 hw2.0",
+		.hw_rev = ATH12K_HW_QCN9575_HW20,
+		.fw = {
+			.dir = "QCN9575/hw2.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+			.m3_loader = ath12k_m3_fw_loader_driver,
+			.download_aux_ucode = false,
+		},
+		.max_radios = 2,
+		.single_pdev_only = false,
+		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9575,
+		.qmi_max_chunk_size = SZ_2M,
+		.internal_sleep_clock = false,
+
+		.hw_ops = NULL,
+		.ring_mask = NULL,
+
+		.host_ce_config = NULL,
+		.ce_count = 16,
+		.target_ce_config = NULL,
+		.target_ce_count = 0,
+		.svc_to_ce_map = NULL,
+		.svc_to_ce_map_len = 0,
+
+		.rxdma1_enable = false,
+		.num_rxdma_per_pdev = 0,
+		.num_rxdma_dst_ring = 0,
+		.rx_mac_buf_ring = false,
+		.vdev_start_delay = false,
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+					BIT(NL80211_IFTYPE_AP) |
+					BIT(NL80211_IFTYPE_MESH_POINT),
+		.supports_monitor = false,
+		.supports_cong_ctrl_max_msdus = false,
+
+		.idle_ps = false,
+		.download_calib = true,
+		.supports_suspend = false,
+		.tcl_ring_retry = false,
+		.reoq_lut_support = false,
+		.supports_shadow_regs = false,
+
+		.num_tcl_banks = 0,
+		.max_tx_ring = 0,
+
+		.mhi_config = NULL,
+
+		.wmi_init = NULL,
+
+		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
+
+		.rfkill_pin = 0,
+		.rfkill_cfg = 0,
+		.rfkill_on_level = 0,
+
+		.rddm_size = 0x600000,
+
+		.def_num_link = 0,
+		.max_mlo_peer = 256,
+
+		.otp_board_id_register = QCN9575_QFPROM_RAW_RFA_PDET_ROW13_LSB,
+
+		.supports_sta_ps = false,
+
+		.acpi_guid = NULL,
+		.supports_dynamic_smps_6ghz = true,
+
+		.iova_mask = 0,
+
+		.supports_aspm = true,
+
+		.ce_ie_addr = NULL,
+		.ce_remap = NULL,
+		.bdf_addr_offset = 0,
+
+		.current_cc_support = false,
+
+		.dp_primary_link_only = false,
+		.client = {
+			.max_client_single = 0,
+			.max_client_dbs = 0,
+			.max_client_dbs_sbs = 0,
+		},
+
+		.host_alloc_ml_id = false,
+		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
+
+		.support_hw_link_id = true,
+	},
+};
+
+int ath12k_wifi8_hw_init(struct ath12k_base *ab)
+{
+	const struct ath12k_hw_params *hw_params = NULL;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ath12k_wifi8_hw_params); i++) {
+		hw_params = &ath12k_wifi8_hw_params[i];
+
+		if (hw_params->hw_rev == ab->hw_rev)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(ath12k_wifi8_hw_params)) {
+		ath12k_err(ab, "Unsupported Wi-Fi 8 hardware version: 0x%x\n",
+			   ab->hw_rev);
+		return -EINVAL;
+	}
+
+	ab->hw_params = hw_params;
+
+	ath12k_info(ab, "Wi-Fi 8 Hardware name: %s\n", ab->hw_params->name);
+
+	return 0;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.h b/drivers/net/wireless/ath/ath12k/wifi8/hw.h
new file mode 100644
index 000000000000..ad11370f9752
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HW_H
+#define ATH12K_WIFI8_HW_H
+
+#define QCN9575_QFPROM_RAW_RFA_PDET_ROW13_LSB	0x1F90070
+
+struct ath12k_base;
+int ath12k_wifi8_hw_init(struct ath12k_base *ab);
+
+#endif /* ATH12K_WIFI8_HW_H */

-- 
2.34.1

