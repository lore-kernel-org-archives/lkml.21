Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989787;
	b=yVtLFsBDRGOyv9fAEICDJMTT+/0tynzmFs31wPot2Z+11OKenAB7Gmpx5Vu/xGOONHa4
	 tEz0mEfvA40scFVDO/sckL7HWaRewop+/qHyFluPmwcvEmegJXeDDxvDHbxm0rI2OYwQ7
	 gT53xvKcrrwyqiIIa2IuuTfHphlfQ/CFW8wckP0rsf2E822dATEHISmJxSphL1t+VYIdX
	 JhFbepDVnoXHDpurmxht5YzuiAh9/V7DnTaFe2muTlhK8UBhJ8zyDufF1PpX4JjLghgmp
	 o4K16U4TGeK+5e8z/NWhXYmWtAycrmSBhCOZLuVEsMpxtpmHb6SSnZxmwff+XBjICfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989787;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
	b=GuhbIluCc50zFh4WGKFdqqF2uV8B01tCp8ZCfaqDbr8eB5Nf8wdlSE6aFrHjIgDoiPga
	 8wNQGxCgXj/QdrorA3/rh5b+yZNpFqZbSvdKqjmPiRT7OiLonSWN4F5wqOzdpTP9Yo6TT
	 +0U9WbvxO/GW4bYscvKzQUW717w+MgUAcm0+ONiFpqoTEzc7VY4DMgMqKxOAaP8oq2e9N
	 JlYigngHMeq3mkU7GlvmNSw9JJyaS0HZzhpBEJZOzcOsunwn+eXpdP3BxN8823iSwIYwj
	 LdKlhGUwjMiCr0jT3qxw9e0njUnGgp8uSj9dptDfVcyqjUy3ZdApp7cs03xi2JsqxFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzCboT7D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZqhfalMR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E088606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E088606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzCboT7D;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZqhfalMR
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VvYp4059968
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=DzCboT7Dhn4gGb+i
	TKOVZRY4KjDy1mBZpGu3EEkyjoEsvlCkOvJksE4Rjgq5yUOJHiEDO7cUGcbMcdLU
	YDu7rJfTvsgwFBD+IipYzt4X3XhRNfgcjPC8e0JXIBpU3v3Bt/EaLN3/xHOAE4t2
	gAA0sk8RB8umQ+qZ3mJHt0gWfYHl8Ni8EfHuyj54kpTTcPvkwoa+TcrleTNl31Ai
	IQ0Z2Fs3XXOqRhEupUNC7Wd4mv7jdt7xfwIiEcp6rot7Xu5oP6jwJY7cc/k/H2I3
	MpkVyI8B1Zm/PnkPp3UXkoY0JUzHfS6zhWd+zMNsVy067//RjR2PTXXXd9SIXHo4
	TDcMVA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcj0y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso806811a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989784; x=1795594584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=ZqhfalMRIVW9zVTEZ5bAp2qwag2BL1ME8zRXHJ7pl3oShz5HizaCfg1/DVt77l6s0q
         9zm8fWVxQM4z+rpixI01305IxCoXSZPj1I60CQXLWuOJ7lJfmTO4FteXzWKSM1IdzRg3
         NJbZsePll4JGgDD0KMyZkc3m5PE8UL25dHXC/kZTm2RKZGWy4/+bouen9jpnpEsluvyt
         TbxRyrhHVFef6IwsiuVSMPsHh76ni5z3qctlKZvrXsybhHM332aVG4BjHHGDuLD+nFew
         vT7UR/JCVDHet/rOztERk/Y1r3bYDvGyOsP57RWSUsyxZqZAe2BF1rH2fciaBax8wf07
         FYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989784; x=1795594584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=UwB4tYnNsoJ4sidSNndiXaXElmcUCAgVcBqGmtzf2+Vss6i11Z7rEyzLavJhDGr1tt
         yMyL9COpeMKyeCywJH8OMsG+dLQ74OaZ1PXZ/YAggQhuqvApjGEGCGZs8YS9LcRfIfYd
         yI19vA0a0PCwCb9erbBldLuhT4vMz9FIJmnQE4W50UzQpdEiBVsV7ufE7LulO0WiGfcT
         GY9WsaxylJ3JVUD08tCQtWGTCHelrSUJFzGMSUPaQpyEIFr07PRY+17cleXe8/luagih
         iRZArDlTZMvSBI+PAmSvMUCq92rr/fy3aHzcH010GhlIVSPGdm/1KN8H1AcCMYYtJOv1
         5c7w==
X-Forwarded-Encrypted: i=1; AL+hErEM1nDvCuvsWiark6w0f6zBmv/bANLwJgAjRQWobnlVnU5BJ71EvmUEVA+V1o6cMvTSV8ScZ42Vof/mr6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZF0Vm5Q9NS3EtPc7jjkabfZri0URjKe9hHK/tmEDia8kP+6WP
	rzWF7V9DKbEvypM7zUwfgqueJoi76rCMakX18nuT7O0TRoBBAhz6ABwDmbBpzxBDSI71+SisEQu
	YlzN3grYwbuaLahmOn4n0hnsOQc4dLqaZBAHnht3Z0hi+K85bcYAQ21Rn0u6plme5C3Q=
X-Gm-Gg: AZFdTZfpZNeOnnUlQm/0hCJPp7wDD/aCajop/nlaj//cM14g4AOXFBp5ZoaWS6X/O6N
	j+74cGxnh9PIn3GrTmULKDeD8a7YaiqjMpmYBXplkC3/Ef+42EXHlp8McuAu33IFW95Zxhv7QVc
	4UK2cgRaZkMRPCTHVrYUqkWkri5EfYxzFNdk66m/UPNQBKoP30LaZt+SgcyT0GKfdZYYCkZ8zM7
	ZvExDfZMu4MPb8SBn+CL8P/uN+Vk9CRMGHoLG3GcXW1Ia6NhWm9wHJaqjrUJJVb/OlIfLvHWJMU
	G5yDYWTkRlWRBe8lqOZZxZD+zr0Fqwq7pKCCn3qMVwYmNzOJE0ylSr6hYWvzAiwEnwrO/g++v7x
	S/slX4MB1WmvTlxKT4AfHsni850zqoOQ4WPstUgPrEw0jnkcioQhF9lolrwk4M0q2HJvdqyE3xh
	rCzEZVaAZOzhSLQY+Wr/FHMPSQmfxNsp4f9xMuTsciazzdKnTzsKJ11OQ/RmRQHOM67Me9SxcAT
	Q==
X-Received: by 2002:a17:90b:3908:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b3d07cb4bamr1897043a91.60.1794989783755;
        Wed, 18 Nov 2026 00:16:23 -0800 (PST)
X-Received: by 2002:a17:90b:3908:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b3d07cb4bamr1897016a91.60.1794989783284;
        Wed, 18 Nov 2026 00:16:23 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:33 +0530
Subject: [PATCH ath-next v3 10/15] wifi: ath12k: add Wi-Fi 8 MHI config for
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-10-9875d2a3953f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd5ed9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FOB8LY2opcXQ8BbJJMkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: jpS3LlX4ZTgcm06nMClM2aamoIQ8cpLH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX0LOYUJ3N7bCI
 +OtlbPXWghu8Y/eXsNGNR/f/Ut1ydu/QpHgOz4mhpDwPqk8bMwOapv3Hb4d0l964YhxUku4J1Qa
 R4HRy8IYwPEaiqL41kG4iKi293yR2MQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX3Lbe5qt4uIkV
 Q15oazSfmzp35eFDZ9NGUC6cyl51/4jh8DPE/P2mD/53zc0DWEFpKDkgjuzKUcWNGz84Dx52w5q
 eT29DFSDBSVnAkc7Cnqq1O2pgCJGFrI8rpRYrvJxqz0dWI8MC+Smmk+t+zgUj5sbrq4t/DedE1R
 mIlBYYsagm9wkSm3Bds60jtJyTMWAJURUBWMxZijJ7Z2Vvy0wPbq/tqSzal9NNAhaO1neDfdKec
 tfnRTn0mZrWrgXpymLD3wBADimVtI87e+NgmAOGaAMtj0anuFtbck6xEyT48QM4QSPLLJzQtJ/G
 tngsody/ntTP8RwHuhmjD829MNmKanK0n1Nl+pWU5kGw8HP7g75qbxh+WJ+mfD/G9e6vSHf0GrD
 a6TGTlZLCfJpb4R6twhKOlOgpL2Yc4fkrxtqU9RI6CnvGmGerSXYYmdfxtFyMo7q7qwKrHUa0KU
 BrDn1eadbS3r3LoOCFA==
X-Proofpoint-ORIG-GUID: jpS3LlX4ZTgcm06nMClM2aamoIQ8cpLH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

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

