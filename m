Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982805;
	b=r/x8VVkfg/D8u+7Yt7ias3r8YvjZEaHZqEgEBLMnCtGzeJxzfrAdz9oF8fOtejd2vJpK
	 KZvNvZQvZpEcW/fuLPdFVGTwv8xeUaFOF1VlEQPUaPwrLo8PE0J6LAFb5ak7Lm7ovDoVP
	 /VwYIv8WTSRqq6xaZp5UAXQcawuIJu/0ew1G0WhZf5F1M0gW0bQ46t1HOUWfF04+I1nKX
	 BeyDz1B8eUqYmvorRiBQ2JjXXjCxAi0OrktLGd3Uy4Gkq3YP8iJQB1rsEPGdTMYsjfF19
	 kovuRih/jl05SzedW7Dx1rFg3JjBYpFh0IRYWZbsvMHFTAiJCvw7tzrNDv531hPC1/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
	b=krZOnlFlLyfT/Y+yHsoO4VwF3GEbkoYVPF4VzLL5YB7cA683zcKKxDGtNLMHHbIqr3wh
	 T3e7lS9Q5fOcJKQy+OpmRVS8fBp/eMGGxRxt1w5cD9BKJ2USz9H5/R801thPtjw9eDxui
	 iQq6IzJhEjEufEcvgvu2XHqATwHAfNpff9sMwpzLsak8j6CEHunO35D9ITwVhvcWuqVdX
	 XMaaRk5v2LcOywMLlUsZnRIyC2g9W5+r2tGMiPFUQQuecXz2hvLRWi/p3pYSilebPc1Ta
	 SfAvN4TyPIIVslfyGa/3GGoJKzydfNU4zbYRA4ncUGMC1rnAkC7w9m2XSwfUp6OzKYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bdDHqycK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cXneoRfr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108DB606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 108DB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bdDHqycK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cXneoRfr
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UoJ93371272
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=bdDHqycKeNp830rw
	4GqOPocZ7c1YohlPh9QZTQDWVtfTfNcZVlFLEDdZPfr5wAW9vIcLDjUJsA83SOut
	wBF9VRaPmnf3a0kpy+6S/N2sgjuy2IDb81BzOzhE05Nyz+nqAStVZZjGkv5u7O7x
	uBJFrVNnSkSk7vZlMOl7U7GThTaT3q9GD2YR5lOMMHW3MJ0XE/uQJNIL1FtlKRDv
	qLG6nn3j0JQ3q5uggqGsNMnQhMWNW/Ma2waVInwLlqIdA6JCNrgtm+wW65tC2oVM
	KteKAsQRU1+fAcrBvYVZVd3NM0NQ/vP5YaK6t5Zg9K71NKo8BQYexnBKB52eNRHT
	f33i7Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sh1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:20:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so492938a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982803; x=1795587603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=cXneoRfr7Y4UifxB0c/7BLtl3Ovlt6XHefETj1rQZWIRZG41hsKAIKNsaCYxg9vIE9
         2r7I4DDbsDTkrdzQzGACHKnDCmXp0SMFdmAe1v5WG5/g6UFcBrxzbwNqvrK8bxfqrND6
         DtUktjkm6NBuBD0WWVXR3sK6RLvqiKACQgyt+u0RDJxM1ZT1idgljr6MB28doZsZW1Qx
         d0dHynQgSueR3WKNkZayl7v7eCD43RzFjJFXD8jmqmvsfN0LMa8UOa8eSRw1mChb6kij
         rq1G+x7+WffknTiLb1P1A1ISoUIHpAe/wIKY9kwv52Asj9uV8zdXL0PHfhKKfzz2udae
         siXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982803; x=1795587603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=zGuCjLCh7pO7EX4HfA4FJAU9oWCtq4+6PiMtMGgDa2dYrMvR45E0EP2zyxMycThwOR
         3yQtBjpCSbdU5RXqjkKj0cueWi7JzYp1Qn5y6Vi3ByRv2+8cbo/s/53edV4ke7racMhW
         IYKKHbgm7wP9cYFGzUGXrBPpW9jzfJvnwXZ6TOiuZXhPYlDPJRgvRFPpxdTLgv0F9mzV
         9+cUh4LjpbsOJr8R9BWlePl/5zLAethFjykNWzQxBqvo+06D9nJvThcRBEFUAwGbwpCJ
         RfP5QSYErZqwoYs/Fur95xyNuGftQxmL33qq3MKOfgmad6YD9CIK58blYgheFIlY+oI3
         9aiA==
X-Forwarded-Encrypted: i=1; AL+hErEmdFtzhzKaBTD1o8Zar2mW9xCxJuFHyXfhkJ1RfcFTysqkTksJXMn04Mfy9iRU3HXYD+81symm/RYwkBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f37I9GgR8/IEeSKQiQ9xs7p2yNm9OsNXn58QJRgq10bBPrA2i
	EA4dUmFkf5yNy7GKRv9mmtydH9tv5gtDJeM3LIhUxvOcSdN/5h6qYtlfMMMCPYDMvL9kbxQZp8f
	G7tlIoxkS4T1v37ZV+LDCV/hPRHXKSSzQ/WjsnnOpTty8LhIuJFHikgx9uvX7xwU3UgM=
X-Gm-Gg: AZFdTZdpujTOosEPBeQEAuXgnbI9YWwb4lXoj6drU7TAjz5CXRfejf6S+uXAtTnM49l
	Q3luRjkZp88ox3fntOBqrnfVq3BAc6URtEqD+hWod2Hzwvxvb/vAtiucEZIgb1uXCdNR39pUsO8
	LUCpWugo4KngaBagsrFUDNWh3bg1kKl+tkzjh1r/KMX9ARQ+VXhLw3ck6j3XnBCq1ISQZWbW3D0
	udPDikVPmtaNb4z9+q9+VsUollDenIMmzCRdq1r8GLppOsj1u+W9W+Ol3MBgESvWGXonZxMD7fa
	JPJtsi1LzDZb3HCe/5TackUsdEkovcJbr9Am8ebbE9h7jdrBt5GLlArCYCfbOI1N4a4ir5BBivC
	Wpv+EJbLpNRlVyaf1HWJ//qHpYF74/BfNIY+0ZzFVJf47HtBePR9l0S/kEK/b4amEvjz/F+bW1I
	A3tC8q85uoyQM+Z3eOte2htfuRy5/uf+cso+WR0XSG5uJVgpB6zDi9XMbXxJDe+Xebkp/bNyPmO
	LQ=
X-Received: by 2002:a17:90b:4d82:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b3d07c9e1bmr1762550a91.52.1794982802659;
        Tue, 17 Nov 2026 22:20:02 -0800 (PST)
X-Received: by 2002:a17:90b:4d82:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b3d07c9e1bmr1762502a91.52.1794982802139;
        Tue, 17 Nov 2026 22:20:02 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:01 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:13 +0530
Subject: [PATCH ath-next v2 10/15] wifi: ath12k: add Wi-Fi 8 MHI config for
 QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-10-d81a3046290e@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd4393 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FOB8LY2opcXQ8BbJJMkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 0kNw7NQQqf0RnoRilaTm1-Qo-_F7kULL
X-Proofpoint-ORIG-GUID: 0kNw7NQQqf0RnoRilaTm1-Qo-_F7kULL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX6WYcaheioi7u
 LPcnx1Ku+dKt/eY5UKuzodMLaDwquzZ84p+SHHXuME1Nus/yYVrrVN6ExAM6RtyeID6ockQwTVN
 ZAP1DIEJ19eQIoKBJo6M8XJexy749ub7qdKCV8llyL+0yEhlsXZ4Djwz8z1Lb74g4ntLsiEr3/S
 mSTxM6Dpfg8F+M6cfCSq4yWKudNR9itUrWoS5PDVa6qnnbysgGexGSNb1owmaOp8XQxQD/nRI+Q
 7daS0OUe8VXRkSXenh08wuObf9k65y0KpAQKb91nBPcwJcRD9fh1S4ptEMQ2F2DzaFII5w+GdQM
 etLEUJfQfoHxkJxQkoQ+UClI/GLoxL+CgQ5Psmyla2KeHy+RysKY4xr6Q46r4mN8N20flV9gSEB
 +Ox6aC5GrfVMpgaFUAOqwNEZpEpsSBbm20F5o4KghJesM++fod98jm6NcztGq0WwG42gUkoa6rG
 1TmhRT0CB6/H+e1uUbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX1armG2d5nko6
 /7370Agjs9vNbpYY2lCe/5BGT3i0zpDtLwoPT3eFca082EJuFS96medgxUTvMi7Z+JrAdyNlmvy
 F8CTRyh/F27ajOaLdHw6mtkBA8rm/LE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180024

Implement the MHI controller configuration for QCN9575.

Add ath12k_wifi8_mhi_config_qcn9575 with IPCR channels 20 and 21 and
control and data event rings in wifi8/mhi.c, and export it through
wifi8/mhi.h. Update the QCN9575 hw params entry to use
ath12k_wifi8_mhi_config_qcn9575. Build wifi8/mhi.c from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/mhi.c    | 70 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/mhi.h    | 10 ++++
 4 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index b1b90c109c76..051c6447d35c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -4,4 +4,5 @@ ath12k_wifi8-y += core.o \
 		  hal.o \
 		  hal_qcn9575.o \
 		  hw.o \
+		  mhi.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index bffd1081fd2f..428d6b2b4418 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -13,6 +13,7 @@
 #include "../mhi.h"
 #include "hal.h"
 #include "hw.h"
+#include "mhi.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
@@ -64,7 +65,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.num_tcl_banks = 0,
 		.max_tx_ring = 0,
 
-		.mhi_config = NULL,
+		.mhi_config = &ath12k_wifi8_mhi_config_qcn9575,
 
 		.wmi_init = NULL,
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/mhi.c b/drivers/net/wireless/ath/ath12k/wifi8/mhi.c
new file mode 100644
index 000000000000..04eb1f1650c3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/mhi.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../mhi.h"
+#include "mhi.h"
+
+static const struct mhi_channel_config ath12k_wifi8_mhi_channels_qcn9575[] = {
+	{
+		.num = 20,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+	},
+	{
+		.num = 21,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+	},
+};
+
+static struct mhi_event_config ath12k_wifi8_mhi_events_qcn9575[] = {
+	{
+		.num_elements = 32,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.data_type = MHI_ER_CTRL,
+		.mode = MHI_DB_BRST_DISABLE,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+	{
+		.num_elements = 256,
+		.irq_moderation_ms = 1,
+		.irq = 2,
+		.mode = MHI_DB_BRST_DISABLE,
+		.priority = 1,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+};
+
+const struct mhi_controller_config ath12k_wifi8_mhi_config_qcn9575 = {
+	.max_channels = 30,
+	.timeout_ms = 10000,
+	.use_bounce_buf = false,
+	.buf_len = 0,
+	.num_channels = ARRAY_SIZE(ath12k_wifi8_mhi_channels_qcn9575),
+	.ch_cfg = ath12k_wifi8_mhi_channels_qcn9575,
+	.num_events = ARRAY_SIZE(ath12k_wifi8_mhi_events_qcn9575),
+	.event_cfg = ath12k_wifi8_mhi_events_qcn9575,
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/mhi.h b/drivers/net/wireless/ath/ath12k/wifi8/mhi.h
new file mode 100644
index 000000000000..7a229ea378d2
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/mhi.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _ATH12K_WIFI8_MHI_H
+#define _ATH12K_WIFI8_MHI_H
+
+extern const struct mhi_controller_config ath12k_wifi8_mhi_config_qcn9575;
+#endif /* _ATH12K_WIFI8_MHI_H */

-- 
2.34.1

