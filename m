Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982779;
	b=hHvoNRkKYf0E4jSw1c/CDkrXNBudHjJhZD1MmhLgwDtCDwPo5zgrOCLAK2uJIb4gmwty
	 rOtArTCxnNr5AP9w11O1TNCrT0Of2gI3LMb/C5Sel5jAPu8VsvLi/9AfEtzEIruny0/tV
	 iB0V0fA+q465Kv54FTnezK+Dw3hmltDJGfVZ5yehKJgKvLfeDLbqHln3p/XJcyqu2D9nl
	 CwBqsgstD6CPF8z6QuobXsKcL0ajMh7ObsJrNNPzQACITXuCPoLHYvE+xvES4SqObuI8m
	 tAicAzITnTpqWZmhuu9IOW2qutWzWqyGVhnNif7baOgPjjupTeIlSndO3howE/wQw2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
	b=AsXo7hSVEpEN+YEUjr4gaxRMYhjaUrx2f9dyheIQ5yyr8riQADsfYzIQlXHGeHlPZGmm
	 +797ZXeOf1mSnDNNfQXWuGrECv1+BlnUvJFP2TFL5HBIK2iOERFwGMJkMVPYdYsNQhvo+
	 emttZlORYn24H3hZXDiKvZLumOXQYD9HNIBGrSCVBNKkPZFqRdfyINUQpmrMzgQJWUd2h
	 DYIMFemtx5Tl7YgQ8SSZybIHIOWdYZf52NyWY/wcxnQ7D8lSk2udgFX2wifcyPIBddPfX
	 3uMVT8nZsDpArdtZYZeViZi7TtgCJ6MYPpDuKj0QT+frc5IPlBybzpR2u+H1dCJO3Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="UKdBPY8/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iz5nYy6B;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95151606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95151606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UKdBPY8/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iz5nYy6B
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3si764118
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=UKdBPY8/WEkzKPHd
	VZXuIJDlXiO6GvbW/ddla52LU4seCudxBkX1qAFPQfpC/Smh5yDMrIfZM65rwTlq
	AyDvfaxkSfWoZjChhOEFr6unurC1lbk8Xc1Wic58kJIhQthAIgVEGzOV9XUdDoHO
	ejOdNStfYWcZIqgQr4p8SWADrh2DYU7PNGA+8O8rBZfXEoQjtX4tVhmGYL0B62f1
	UNHwipGJ4Y4qXzkPvfDfSpatwR8EM0gPNutzlxaqZEjo5Wu+5PAUZeNHfQT2eMuZ
	0+p+3Im8s3+pr1cOeipPYVFw2E5c6ShkHfSsxzDe+GZRh2ZXoPLWs1RGJXUlpkkN
	fV7dWQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9h0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:19:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so581625a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982777; x=1795587577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=iz5nYy6BBLI0RoaBCpzn124BPXssa/JeAt+CJM6+X7Vd9xFzSNw3lkU8So845ZkRRd
         CegBZRYOjvbSbLbr5DyF+KixJrqOyHPKygLaZqFA82v/8fzgDBI5Y+kAtZTYLiSiSZYG
         b/BzjTG5uahwP+1KJjYRCZB9dMMJInSjs6ISGRm7wF69xy7NLA852taS+e1U+2AbRGvu
         DIGwWY2D37k5gWz6e/hsixCA+nGV5ITvDeP9iDsXEzHCloT8ZMKQKgshg7plPWR4cJ1c
         7Oxu0D2+fp3flGhx2b+UjouJVC1Hj9i96a9CkUINhExP7/ao/pXqNfzjnn3rPM3cmXhU
         nsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982777; x=1795587577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=d8Kee+GfrBo8CkSfkT1h3Vqdy2JXosFDysRB7enIGuy/MK/sS9EOWzF+JMS2bmrtmm
         6FVvdAYpBQf/mtqqQa/GUH7XDQTDYFJKyaB6bWpqvuZcGYwrfzU7yZqepxxAT7frT65e
         Vw44lc/SHZ3gWN+2H5z5MNZufKnA2KsIzvEriw9gx4gFDWywk1LmvLdYaqbbmnaa+vsv
         MKdersnlmmYaQ3mTo5BZdIW11tvV29BdUQZO9ogvmgip2db+AiBW5qNzq9zKsG6Kdi7W
         EwdWQIVvcan10X0S3tkFULNRpChdzGxh1DtNsNMtLxq05Lqcrejy4UDXNU8gdfCY2Q4l
         rnUw==
X-Forwarded-Encrypted: i=1; AL+hErFmvJzysumRlt5AZ9dLuWjFSHPDcuKpdLmzV0u+FctzBENUA/iQRrUIKMCWe25OjZRPLD5uFYSXAfyHhVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OQ39sR1sUr8oy+EdUTzgVj2iJgAYgi+YHbi/8j25h1k9ZsSK2
	isHHbAcOUvbJIGBLm7rZjJ7GYrCYTlUxiCZ08BUpGCnIguabtfLnFj9iZN81W2aU7P7VzlWK3n0
	GTszY/rEZsH4BK5JSjYDmj+T6IZ2PaxMA1iQfnmjuw+V9rEBFXaOko8Gqjtmzkx0xiww=
X-Gm-Gg: AZFdTZdiCiBYevRtNtVs33GCF01l22o/zuoESfU2u2jR+v5rVkKDJ/igfNw9a1aE70H
	SJBoxCN/i8etmDUXI4hEXPnXKwKnairmwGaPueH6cI4q+qOuNPO0LAvUDF+897cwm+LHiMG/3ul
	ugos4lfnmFi8PGT6FXNnQj2jJk5fs5rkyG5LTu802wV4JnLkKjBwMZc33f69J/hh9CoDcJMuRCe
	Z78MoiJ1b/nBw3BQhAoGku/4kP8wKwU4R2pGcV58R8vCqCo948H9FUp2oSJU+xlgkiBSbNrBC/N
	JDA/5VEq98Nk7iReV2JkLO6ahSFgM9N4NRSW1YmJH3ZlV+hvEpW8qq5JfBHeaQg+up07dInGEft
	wMvA7jHaj3T6gtWLWIW2JmzGd2NIzjhE99/RWV4StbaNLdLKM333TSv7bTugakCkgZUcRiWFNQU
	chD7ZVmzBTIsJy6q1gMkB1ZYvDOicebYJMBHFEMlRWxSC2m/ZczJuF+t1cEeS2y2mGtoRr07oOR
	4k=
X-Received: by 2002:a17:90b:3c89:b0:3b1:8396:ebf8 with SMTP id 98e67ed59e1d1-3b3d076895fmr1493780a91.36.1794982776915;
        Tue, 17 Nov 2026 22:19:36 -0800 (PST)
X-Received: by 2002:a17:90b:3c89:b0:3b1:8396:ebf8 with SMTP id 98e67ed59e1d1-3b3d076895fmr1493753a91.36.1794982776388;
        Tue, 17 Nov 2026 22:19:36 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:36 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:08 +0530
Subject: [PATCH ath-next v2 05/15] wifi: ath12k: add Wi-Fi 8 directory and
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-5-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-GUID: mIgJmhHqhSUlBFexhUSEuq2tv5B0zcbb
X-Proofpoint-ORIG-GUID: mIgJmhHqhSUlBFexhUSEuq2tv5B0zcbb
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd4379 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXxekqX77XW3qz
 0TQHAjkbTcGvm9QFjT7YD4LZL4Q4mjmZU9uA25poGu84Hp5ZyPAvl5UMP5PZKePIBK1B+QK3Tds
 NHQqmDlC+Uh/vSaFvga4f7md1WsVZVk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX+0ArvL27Lg0a
 C5czIQXwjzy+ZAYhCm09guN7RSRgOdk3iW7LMyISafEzzg28W5y//pk6LF7UgF7LEH9yuKz7ELA
 DnOw2J9miqHttA46aeixqTNB9lScC80+e5dWhd2HiJ8QWFyiBDnrUCyo6UNEWAjKNm2qftUaVkT
 Wi5dufghUV4irTOHSsFwrD0Ytfe9v1zcX1++S6qEU8PW0iKM0kn8V23tof07CwlIs5rJHSlsrBw
 tJoK1o6noMKoG3l4zwfxjlY70xC6JxyR5rFtjqKWofNvkLdhe9pZGA7Tl8TDN+SKXb775l7/EyB
 H1MPpBqmgtDRkW6cC3SAVcz0G7esBk8GYPGZuGpGMGYWVoGHzvyM129D/vPmO2HNtBqUBh2TQy7
 UPLcQitxuDyz6anC1N1AvvUqmRmxAQ5MHKQCIHjtqkGfvA0rEphTtjKRSNZglBOWfgT1k5ybPiZ
 W9qrC0MpUVaA09c9w+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

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

