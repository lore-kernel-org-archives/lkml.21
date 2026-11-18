Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989760;
	b=t+H9QmVPFafnPNHK5J6oM4//CJOmWP2ZvjaoXSBOiCN8PAfiNCdgEnuT+xT4m1+aA4Wg
	 dqbe0iyR9hmhMUoiJ/Quo5KOn53dLN/bTuUyEkwMjyBC/CmlgVrYI4oXk3bA1r83aM7RY
	 J1TZiTygXBl0zFcr4TqAPJ10mNSh4zbQphQ7/f/8GnzXUgEifVLm7ITAHK24jaL7bSVP2
	 YmyAJY7ItD+AEFXRLFBi0n3e3soW4snRn4N87m5cNUD5LsErcRVNQpI30ef5Q9CMBp3mG
	 gkdgIWA6klw8a8MK7ioN3aKnGxtwCRZ/NKkk/BSVHhPtoIerWg61yTQ49ZL3yq+ANFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
	b=fxuqHBS6NM3b/XE8ek5ZzT3hL9sQfrLDZ3bnfEJMj+X3LBalR8DDPDjDAnmXQdblKOys
	 ZGqWhJtYz2Bcfy3au67puFU6wE248+LeYq6P6rwb3IMqM+NX8zDobTZiTaoCrdNMwdUda
	 cYHLg9QybHKLzshdCvOLckVCivnYeBQxAyUJrWCMmO8abTgqT8cQ7O5Zj/clgViP7AQ1I
	 EPgDRoahgNgz29Euk7/bGNm0q83uuwofe2+Uzbt+KkUqZJFbW1xNfOR6MkVy2I/Bvm7xh
	 +u3OYxY/Eog2+hNwFEiQyUsFkghRiFShPowkSqt6OhmUAQbpKikosqySUt5wcyjoUYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kdvNyEWi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="d7/buKu+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F1A606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F1A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kdvNyEWi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d7/buKu+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uvna1959712
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=kdvNyEWi/U/p+6+M
	V6KYr8FfRVflyAMRZndqMoFsRh9Jb8IFHGO59POUAAQ+AQwXw0v27Y6M/BPxQciv
	kHEFNWT6V0FJAS0w7vrHuwjU22dwrmR5A+08r+ajss/Uisw3zqqm1/DaqdoeXraX
	67fpFcYFyIHz4wu3H2SZ0rJgybsXhIHbDDBfEMrAy+Bc1mbWmr9gS9FhuEGY2kA/
	p1hjkNdRCVmxHXztf672tTfCt4c5Yf/1NeJzGtQIbqcrBAtyJ8upjxzn1vB4bUfk
	jOSvqAbWINAvTR3xXdw7EgS7VW4Wb5j27Ve+9pMAdgVt+1Ga5hm6mToY0gDn0kxy
	ihwaLg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hyn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:15:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so932134a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989758; x=1795594558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=d7/buKu+2TLWfIRFAah+Zm7YsSCh9xZ/HkrrTI49vqzofgLjXQ9TgbV2ocW0lRbWpn
         Ohz7lyYHxmqjTWQCPsNryiLLW7QnXjpxrMN4aodx0WHVfV6ctfGCB8pRTnxbQcs18nDL
         jItk2F7lNqYEfpF5RfZUDu3/IgU4M96sppWf3E0AxjqjZmiEoaUenNwIkKXS4Y4NWla6
         F2MUlSPINpOCxm9bZbnL6sGtaR50M2d+DHbedQ8Bls1ZdxTw/yqX9VGYYDNsWRvmFGUW
         SIHkTNP8FC7O5CnfR2ddaBQn06ASYEzfBc7ZvUekV9ev4GjEMhhInIQ6FSsBd5id+pVg
         4qoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989758; x=1795594558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=PD07hHdGMo+xC6WO+64Q5+pO4/jiM2k5E0/u/K1VPaOvdgmqmRNN1hQBGP1nfYS14U
         K/BcQxApk/tsXsdhpKKPnCmnf4cfdslRhygPPptuuubBJNiJxK87SPJpCPEXhx9pF05C
         uQoJjn4cCqLyoljhs9gbpapgBEOxCsEnDOvQdLd7+EetDPh8uZtjLnzVku411o4l2Nqr
         nTLRDikFE8VtPSRhRa4VwoeGEsYqbk2os5OgUZijE1Wt6jvDbpTNirOl1GNDJe8QvPoM
         KCNUCjulLg93162FycrfniQTcsq5PnP2XUqIng8Payv7RGdUH7CcPLRq6f+33uX1zsxp
         BX/Q==
X-Forwarded-Encrypted: i=1; AL+hErF23F1y/DPdc8ouAOqqIuh6+o1ikUmYtoz95bu9mQT0fWu0R2bt2AwBs078HEJG234zwu3p4gm4IvtEbB0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hscqtgxwhoE+ol96haN+jx7ok87NkNxatB7ETuqEgIDWBp5ca
	rrhpjTKyUUGR9KPRgImyixDCsVyjmOLGWvU7pCUG26wuirI4jSHi8gcG3ubHwLyJb29Ie/nOsfx
	nYzcyyAzEa4BcnobLAvfPAxFGLx5+NpBPhc8QzN8931W4UGrsVaqJdIPd1ePB+hELx64=
X-Gm-Gg: AZFdTZdh8haxk7mJRQiq5yT8XcHKvOXq5B9uoND+a0dqyPrtXLifAoQcu+2QMnpsiah
	RNc+4aCJYEjFPGppktdT0QXu4ElwZkJnejQZXQ5uEpVIjBCCWiz1IQz0ppw0n2Z/8CsS7YOFw6i
	tTdxUsfzDDALPDEQy2aaMWtD3wKtD6VWIL+gqJgsuPxg07IYIo4l6lW7FuzCeRcLhT9DHIismCC
	VtNXEMqE2sQNYjLX71+lSsg56ajGq+uQWqqnhqBCLydX0bD2pkJUTyq1x/Dz+nCWBVE+5NvIXPC
	Q0lRphRTBfT4Vuf8h9rReUo8uHPOiJZ69V9lBQNmYUZdeYSYf603Uc1+vWW6CBzJOHr2O/Ju5wQ
	mv+NjcmVxO4fkNppQ0yljg1ZD3QVxrO6Ft/j0ZZlAtupRhAZpqNoHiRo8km6to5+abqR9L5Nx5B
	AhYuxOtBGPOqFiXU32cRJmjEnAFGY4NlDl+WA4MvcWjHOXzCuXzYAxVcWvo7nW9WNueKZ0iZBym
	w==
X-Received: by 2002:a17:90b:518c:b0:3ac:adce:60be with SMTP id 98e67ed59e1d1-3b3d07a24f6mr2014440a91.21.1794989758262;
        Wed, 18 Nov 2026 00:15:58 -0800 (PST)
X-Received: by 2002:a17:90b:518c:b0:3ac:adce:60be with SMTP id 98e67ed59e1d1-3b3d07a24f6mr2014405a91.21.1794989757579;
        Wed, 18 Nov 2026 00:15:57 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:15:57 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:28 +0530
Subject: [PATCH ath-next v3 05/15] wifi: ath12k: add Wi-Fi 8 directory and
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-5-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd5ebe cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: il9qULXq4th7IqY6wc6vvmA9wCjfKyN7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX1ve3JJ4U6eBQ
 6iykrv+fBTgBDIVPJIR8No5MmRSvSsCKOk5xcvDaneLDVK4fQKeWLqE+qbreFvHOPXqaAkoR06B
 Y3vMXcRMDkIHQJqbuqCmXuV9Y76bqrUcXCHZmzFz6shJNedOpFAc9GfnIOpsTtIEDOdH7KsSXNk
 RYDVkYvaK/mcg59anfLhniIp+APyWARx8kytQ7S6ZlDAxr8QUlquW+PQU20+KAStUqNe7dvU+rW
 E8YXHBiUkFn0mYzeb6Ds76C1GyRliMFTmlPlt3G73hL8/fOvNlxtj1rC0UmzlHxl+l7w5z3GIRV
 CeoI+Y0uZLA0Ba/6D2uJ0bRsghrCn2Slo8Bu/ahfOacnnOeUc6MI6OI/+DhlLlOWRsS53F6ratD
 15mvtZxpwh+c/6jmB+x58G7MKoQ6WtOafKFqE8reDivzdZVjryN+IH5vzzskOmIaEhVLd16Iwz0
 ocOqNG58Ng8899vObdw==
X-Proofpoint-GUID: il9qULXq4th7IqY6wc6vvmA9wCjfKyN7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX4IoW8p/VyXA3
 iKs3o+cew9iENzW0OhobhzTyo2+Ae8mc4CKwDQ0QWuMwlrleGjEebjO9cWTwKX3LzjY9yXbcm9Q
 YmgLYTYDIL/I46wLPCBEs6AJOXJ532s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

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

