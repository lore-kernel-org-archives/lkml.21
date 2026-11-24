Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538640;
	b=TvtR35O/1SetogrqtLnJpzjzq0vHL0qxpRQ4BKwBZIsoh8k3YFuYNpkbVyQSNzI5KZsN
	 pLNZNXJCWcUWJJ/GrQfPehrEmhdDn5BruzyGvbm1ThX+FgOWtFKKGJ6/zSfN3dKKQolZ3
	 A1AEydlB8tTEt2PEYOgjJGikfKhnWMSXoksuZQJ/sAkNpjR5vUOIYCGBdxhLYZ6c6/E4p
	 /PbHEhtBL0E7sc6evnIzWDkuyONv9G/iz2z4qvjo/mMcPB4hpxqEXd0N2aEerQbDgBX3B
	 jpNJpQW5ZFtSzfd3KsSw4sBI6LjmVb7Hxa7ifYiZY6KUys4LXRiaG/lSePdOcnWOscw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538640;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
	b=3EC0EIaPxCQiCGo7sZmx9KAqYxOpp8B1SGMVq69XRQs7dhgU2QKgX3Bad+v95oZDGSnz
	 1qmMX7OXk5fZzvKe0uy92/qrg146yQW/BwQAA/lqvCvZujRXNDXzov78ochUSAZaHPKgT
	 cNtElG5zCSq9JDMTkSOk4m1i5fQasPt6ZCnzyMpapX7/Y3iji05GBVlpc1ETKXJZ8Arvi
	 qPLbnrbw2MS/zGlbs2gPF4xe/USzLHqz2rExMYdZ00yCM6y59xt1P+VbjnDyCCJqD/buI
	 eBKQAMYQqZ+TzD5Z903hrL/h+Ryf0adHb3fIwhCjNcoHQuoQ1HPABzwHhvS3c0cTz5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWwCqqvm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cryb7+qr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D06606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2D06606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWwCqqvm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cryb7+qr
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL2Xq700032
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=WWwCqqvm0H/6V+XN
	+5OtzpUE6C6N2ABlGE8AQ+cyjy13MueChABpPBU5MDIhuSCEz5/sJewspvbVuj8R
	PHZzEXZgPaCMjYUqTaBJHAc+lYiyfQ20Ao06hSbgo+GjGrEZclVpmnx4WRDlP6hW
	CfRPpL7DM4IyhjQrfDb+ITeTbz0m93nrtjkYh9/u+mwdb1xPtyCNf6qnchBhM6fa
	vENDM04+KrjgwgzoWeQOkOrXPUIT5gU9LOTQsMdDj8dlfAA+S5W0SOCx8eKL5pPw
	+cN7I+06Umm83CDR427FeUQSCiyLHeOngUP9viWa7qQtme8SLfib+2Z6oXT+54fM
	Th4CPQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f46w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:43:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso8286086eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538638; x=1796143438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=cryb7+qreY4PSXa+C3icUF3rBXoMwrXgBTAx1z2bZ6tBisvXM4XOsTDEU4xPty29An
         fzeAfuOUcd928GRDM2XnL9LxxZ2n7yhzS5KnFg9wdR7zYHYo421AdbSD6F1COhMaFRKh
         bgNyACVznkTn0SJQo0IIHwosFdN6MkvOBywRFrC6JfrcYHP44e2TV0/5ZcMNzjEJNGi7
         p7MNegURZX7NRa7Sgt1oKbPlVxzf6I7UkIbuV4amVJp0a311x0jleACGQUB1Pa7KK6cx
         pRAvGM2B/Ihr5nr+Xj7i7OI8gADaNgZq8UllCCsoVRqxjmcWuliOKTdsu++3lRWEYit9
         lEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538638; x=1796143438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=lALICAMk3KE/rwKxd/oqq0buBGfKDAIcsVu3Luaj0My8ayPdUXOe5vTQXDdkTy2USK
         E0wqWaiIP2Y9LR0erCU2bd8i87J6IJA86ONESSLPR89JpksA6xGDerfq1BpMNGY5FJwb
         bBBXCYzU2bw0jCgvXfphLWNwSEqQPRgolZc4MVbcAuQq9hW3TwJ8KEzQQfPh53EKuj5/
         y6GHL3crT1myv7il1w/KZN0xR4tI+foMoB5cnQIa9ykVhaDXRG3BPrOpSDWs7/HRdbFt
         aWoiL8VxaEz+E4Fx4bJUkqeHDKU3E+nBrIGPCMf+7hSAW/wGXJY57FS6AN8Scy49RfD7
         xnYw==
X-Forwarded-Encrypted: i=1; AL+hErH9urRP9fqryOXTPDS+FMQcqULyGia7IcBzy78A7M36LyqPUEOAoFyTDBPnq5tGIXn2d/Cr8lvDSTNGgoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PeF2JwMA/PcjzCeTC+gV/u9vw2Q3kgkiqA5SsenVDkjH5/88S
	FiGHLVSyC7yPN/HnLBoZKMnKPm5shnM2oG0f/CIOxd1MOTvbPGuyIidvexR7Q6OQtAY9gwxyO3C
	5jGh4D4Iv5++xK7T5Mi0AKCNL9zBZTdeylblLLwd8x3xc9YrmBjj3e1KUgYbtPrmz8jA=
X-Gm-Gg: AZFdTZe1y5TmBxVEs6BuWcOEOTbZ2/yB/0T/LNX+U1mefNCsIItq8TKB/QJSe+OJP1i
	/wOG2kGRHPqeAq9+yU4GpPPKMopeE/Dz9ApHRUZPtowpdm+rP4hFBTWBE/gVjePaKs9xK1VEmaC
	qUgOihTpkDYdZ6ozsCor8eIG/HFL5FB7f9my3JbdYVdHRHoE9HbH8bV5j9ivxmNpOvErdnvFpkD
	e43UpHhEQT3K9pSTjXUkZ4Mo/MZu3uzcKKCxfI137pwspQ7QSuquQHieNOjSZH1wE/i1FA0M51G
	ZzpJqWSuoQtcbIg3tQeYgKox7oziMc/8HfyAWnIm9fvgFuqFvbtYJmQ7Fo6+5gSGjOIc92tLPhP
	CdT29woyqxqS/rw6mEunG7aQo15xfFJedGg4R9iayBqiTP6atmA73LC9/mnzmJix3X/dVGw8Rqj
	YhBDlej6YFloQ+APOUrgkDQoU1E3q8Uo8suAH7Rxl+OqehPqfUIsaTGP3IyBcnPODZPmmvMPou5
	DU=
X-Received: by 2002:a05:693c:4196:10b0:386:a97c:f80d with SMTP id 5a478bee46e88-386a97cf86cmr9886154eec.27.1795538638042;
        Tue, 24 Nov 2026 08:43:58 -0800 (PST)
X-Received: by 2002:a05:693c:4196:10b0:386:a97c:f80d with SMTP id 5a478bee46e88-386a97cf86cmr9886121eec.27.1795538637480;
        Tue, 24 Nov 2026 08:43:57 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:43:57 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:30 +0530
Subject: [PATCH ath-next v4 04/14] wifi: ath12k: add Wi-Fi 8 directory and
 base module scaffolding
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-4-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX6cc5es42aBhs
 rGaj7jMurzWYnm9ZTMpUCG7QK+4cP2oms848IjBsk27dn39X1tlWDDAPrRCuwc3K0KydDBnf2nw
 IAh5YFJxDx6gpilHhR7irAXUSF8+xtQ=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b05becf cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: iQ7u_8WKSSZUcUgJH6ECjZ_zPTVNDKw8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX6V0JUIubbH33
 FZGEI5TU8aYb5V22Ck5IxTuNWQusKpuyfmhLT27749X1I+hbNXUCxkbWc1WJWB7OXTtNBkyGTjI
 VKFD6+8nybaiovxhmApx+pr/K9VeDEeyYkt0tXojjJa6RhGBDO04buFyiUWntrfrP4r4hxmTCWK
 AKD1Od5Hj/KQiOU1udas08VycXPsmKUvPmiYC5OLN3Sv32a8CL7qqowQf5ijzKPde3eLJ6BYxPW
 nhHjimyYRok4KRyL4trGkiEyqV6rrNV3ULupaq2FpiLVlKYuvgAoJnSVUWeZpZhagmsrdZeO7Yo
 3G+OW2in4xdbU+svMvJLnNtlXOtUPl42RIstpFo6YAa/8AeDZ+Kl4ldBnqp74CM+BD52ez9RVC/
 4WPAaKqKA4clf0xxpidw/rtNfTpoKIkY2UMMbaHUv47eNkf8jR/tzWsOBVOYfNrPnCWsSnCIKXP
 cFLhp56wkkSb5Vuafhg==
X-Proofpoint-ORIG-GUID: iQ7u_8WKSSZUcUgJH6ECjZ_zPTVNDKw8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

QCN9575 is a Wi-Fi 8 target with a distinct hardware family that cannot
share the Wi-Fi 7 module. Add a dedicated wifi8/ subdirectory to host
QCN9575-specific code. Introduce Wi-Fi 8 build rules, base module source
files (wifi8/core.c, wifi8/pci.c, wifi8/pci.h), and add
ATH12K_DEVICE_FAMILY_WIFI8 to ath12k_device_family. Keep Wi-Fi 8 PCI
init/exit as stubs so the module builds cleanly and remains bisect-safe;
actual PCI driver registration and hardware support come in follow-up
patches.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/Makefile       |  1 +
 drivers/net/wireless/ath/ath12k/core.h         |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  4 ++++
 drivers/net/wireless/ath/ath12k/wifi8/core.c   | 31 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.c    | 18 +++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.h    | 11 +++++++++
 6 files changed, 66 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
index 861ec85eebed..332110d72a1d 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -25,6 +25,7 @@ ath12k-y += core.o \
 ath12k-$(CONFIG_ATH12K_AHB) += ahb.o pcic.o
 
 obj-$(CONFIG_ATH12K) += wifi7/
+obj-$(CONFIG_ATH12K) += wifi8/
 
 ath12k-$(CONFIG_ATH12K_DEBUGFS) += debugfs.o debugfs_htt_stats.o debugfs_sta.o
 ath12k-$(CONFIG_ACPI) += acpi.o
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index a8e8a55aa718..2a4b5e5e1af3 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -956,6 +956,7 @@ struct ath12k_mem_profile_based_param {
 enum ath12k_device_family {
 	ATH12K_DEVICE_FAMILY_START,
 	ATH12K_DEVICE_FAMILY_WIFI7 = ATH12K_DEVICE_FAMILY_START,
+	ATH12K_DEVICE_FAMILY_WIFI8,
 	ATH12K_DEVICE_FAMILY_MAX,
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
new file mode 100644
index 000000000000..b8c5b6d3a7bd
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
+ath12k_wifi8-y += core.o \
+		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/core.c b/drivers/net/wireless/ath/ath12k/wifi8/core.c
new file mode 100644
index 000000000000..9253ef9d9cf5
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/core.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/module.h>
+#include "../pci.h"
+#include "pci.h"
+
+static int ath12k_wifi8_init(void)
+{
+	int ret;
+
+	ret = ath12k_wifi8_pci_init();
+	if (ret)
+		pr_warn("Failed to register ath12k Wi-Fi 8 PCI driver: %d\n",
+			ret);
+
+	return ret;
+}
+
+static void ath12k_wifi8_exit(void)
+{
+	ath12k_wifi8_pci_exit();
+}
+
+module_init(ath12k_wifi8_init);
+module_exit(ath12k_wifi8_exit);
+
+MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11bn WLAN devices");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
new file mode 100644
index 000000000000..3975081d167b
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/pci.h>
+
+#include "pci.h"
+
+int ath12k_wifi8_pci_init(void)
+{
+	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */
+	return 0;
+}
+
+void ath12k_wifi8_pci_exit(void)
+{
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.h b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
new file mode 100644
index 000000000000..efe02721e470
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef ATH12K_WIFI8_PCI_H
+#define ATH12K_WIFI8_PCI_H
+
+int ath12k_wifi8_pci_init(void);
+void ath12k_wifi8_pci_exit(void);
+
+#endif /* ATH12K_WIFI8_PCI_H */

-- 
2.34.1

