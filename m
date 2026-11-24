Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538665;
	b=iHO8Q4yycNBmGVeYvIWmSpnOtzkIPZSm6H0htgFKLGtPfPc8c9fHEDiNOwOYrFewUyua
	 Xr9WO35+yW8oRnVH2LZxaCh0mGHRLqWu2ex2GjX96TAkQqyXMpCzrS+/f2YBl8zpReSPu
	 8buCszbAC7bXtWU+LzgfwWC4VX4KOW47DUivU4GaT0oDq6dDyOc0vm3FREUU5PbXk5zgA
	 aB+/mz2rhXqwJMpPGdS/exaU31PW/S17x0qZhAatdtyF9nY+/QlJ+aZU/fA1ZcsIU/diz
	 rbrkMJ77YsQwUtFPcOXsGUv77NYqkqIrHES2rFZyK5rmPU0N4LD/BYEJOxw+jnI8g1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
	b=TS1k6vF8A8wN1hcFjLnAf317ijMOUKghfC8wcIB2JvLrxgplRv75s6a/dbRUBQ4IX3QX
	 g5DqbVHfSp2OFQ0SqvEv0Vu15dlhiNJqDCJKK4VISQuF1OYVY4tTGIpILfv8VH5d7v4mC
	 zJJXXbaHCdqTX1rsodg4xQZwS7g6cWDstuwtJ7n0g92T0Idco9ajhc86LfV38KzIh7Dna
	 irmET+IivFbL3AlAxWlb04krerEqoTkvtZ9K9tRRx8CQ6oPK2EUsLbTYz/9mqQJp0F3Pk
	 KLtWdLGA7b8H67A6oDf8HsJ+VFtrUXhf3CtBLe0OsMyRUAuXuPtJw9X7GsEfoT5PD6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iXwnYJ5f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jTBphieR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EF5606A329
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6EF5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iXwnYJ5f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jTBphieR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL3KF1873400
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=iXwnYJ5fW9xOmc+g
	7aXFmwPg/z5qHfsqTJt3QKfvtf5geKOF4Hjp4kZrPtqRdGHL1c/uw6pySXrhFq6L
	gFOPW98tSyYWj86I8kqjdfMMqNWRl1TGXCpTBUXzZ55hMPsCfDGEfAG8rNcSleAi
	Lfe+pnyy1kIeDk7ElD+WzxC1C4mE3Wk/GnKG9qJ69f981dT8lqfJxGkGfxVq62dK
	oIswBrUR6p7V63fKlQQMPkMyeiyIYQfRk+NO4BUVmNe+2aHM4WMAtJIHOlMCWTcW
	452W2WbZFRp4qNIPhgT9kbaFeTDWeHqtnhwnE8RdBKqUnDfgKAY7xDjN7uL8c9vl
	WZES7Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxk8emg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:44:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386c3309469so910251eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538663; x=1796143463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=jTBphieRKM9DWjQPcry07R7dklhxSZzKOu+UDJfU/Uhm9LoVPn2TdTCVM7FBMprRT5
         H7XXlfKr3mU7VQJFXFXXf3Qu61Qu9jzHTvlK5I/R65O9mPhf2V4mD9AO5BGN9RuodWQP
         qWp5EFj1Rx37hIV/O5nXsTxnF9Sbid7MTpz32feIQwlFDJXT25PLNGTBbpqHnsVrjELY
         mifVlFKbfeXVLYkRWv7zbvxwyRStU6FFO+jeNOG6ZKNmNDwoda1sGL0H/bd9pCAqlUFA
         1kiuye7/lblHtlu/RRBk3koxbFAlqIWqlGMe00MbGPS56lVzXYeQD3JBQ/ZLPa3zK9W6
         AtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538663; x=1796143463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=XR5WOBCSoEy+NmeKQs3f9EF1biHFcN0NE2vPkAoEQZg9YIVZtMUAq5xVnZHLUfAVpe
         ZoVLjQN6VN7ZyB0mvnCfn+Fxb7Ml5QPRLir75KDEei83vcV2JQXLG/RhPl/kqVu0WKoN
         w4AAx8yINzZvUrdVjjYOqlJjPqFKbVZq78LBKFeLGGjTg2wtaMfhPchL7JtYmR5PEse1
         mhLPXMhlT/Rupi42/RMP46umsbKHXMg2rfUtPpdcuxz7KICxRo2vGZfzQKh3iHN6u3Jb
         /yZLFGyKcAALqa27SxWmdP6KIgACwol3a6ku9gqMWC73pGWDSwhBABoDFzY66bGxWMif
         OLbA==
X-Forwarded-Encrypted: i=1; AL+hErHgcNiWrOpUiOkYx3EecYRStmXgcmtZyNxxKvXbXF19H43ic5ytN+h/wkeY+XyqRjWhmig8o9tgP7/l81s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YQpA57iIDVur24NY+IV1kfbu5tmo3Ogf3BJDAxuOUt8MBZCvp
	oIHCXYd/KD9uFb9xNIqmWDsDpiJVANyvOSDrTWUN/K0mTnbueDlURmtw9ThNugCgxGAUG/Sa81Y
	LZlYXqKh36pGtPR1v2drRbk3MQSpWZNU6Stf2ywcYB7oT2rF+KAeQVFqtvs75DO119VQ=
X-Gm-Gg: AZFdTZcSr/bRDdeXenGkD7Wd8Vj+Q1+L273kckyKM2vFKBXHfZE/EFOPBVl0KasA0iZ
	EqwEx2dU44d1i7RiXgk4Jm19+Ta+8ZN/iRMO1vhkIqz4InSQYfh1f1bXMY3ntqjt+8BVg4a9KJy
	NCogvAzbUzbEOHCXws658y15zm09GX79lLEifjzV2AM3mImALjJRgQrjrIum/A3jP2b7H2c4fu7
	RFbezGbV7sehZSMjW/43s8NF0U6ilqsvBXLHWUoS2/CV5HZFU4C64LQBXt1hXlrMRZoR7csWGcz
	EtfL/A4uQKCtrBBRmzivL8utjs0+yyZPXj+GV6UKxBbhqpFux89JKKcJ0lUzcKxy7hXG5qsSMws
	Tc0GdDqRGkBmCPf8Hn6LPdM4RUyXvpVeCPZqKhFUaR1rt7vdGLwuEsfH+37IpNDEgUPWCziIQRD
	zRRKBT3DgFbb/C3/aD1sHU8TWqW7wd7lMu62ckJZJSz7ZYwlFJTwavv2oBddBO1Gpzt0GQf5bbm
	OY=
X-Received: by 2002:a05:693c:20c6:10b0:36a:15ee:c20e with SMTP id 5a478bee46e88-3869a150409mr12781553eec.33.1795538663043;
        Tue, 24 Nov 2026 08:44:23 -0800 (PST)
X-Received: by 2002:a05:693c:20c6:10b0:36a:15ee:c20e with SMTP id 5a478bee46e88-3869a150409mr12781515eec.33.1795538662394;
        Tue, 24 Nov 2026 08:44:22 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:35 +0530
Subject: [PATCH ath-next v4 09/14] wifi: ath12k: add Wi-Fi 8 MHI config for
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-9-1f5b87ece6a3@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXwQWgjSnrh7IS
 ERXS5IcHRAtda0TdJcL+QlpfXk4dfczDoFWwpqS63Pl6r96D4knPQQrdojoCSCaLBlBnIWNyEEO
 i7UKUnhk49+T3icbQmJimTTXiFQ9U5DI4/8uC91VOpAD3hzR33k2HPzKWwMFqcODMYrRUDG8Xpf
 mvlCAl116tdfbUAEAkgxS5Nc1ZVdt10aQg95ppKq5OKqXqZmujwm/ZN80P3voyoE7anqYIjCdMw
 NZbXJZRnMtYYGLC5Xp6tCK5H5UGex5glM4LIGu4F6UFIySQ5cVEabecwBVAPeLDL53bLUWarF+E
 VuYTohqtlY2WM8JDFn7ADTxW3a4UhcYLrnl3IyLd+e5itYqo9EID+lFU/iKKFmNOq3cRy5XhBkh
 YYV3FAwA4IAY9T0KkY15qXyT4LKBuOMRrQbqAVux5WHTCtXFROwtAwQydSvKyQVYB0oeVg2WFCh
 Ev+w9VX+j+V8ahCzuzg==
X-Proofpoint-GUID: OtUUQxWpxSHfG2B0Uc91MMsbogOzKinZ
X-Proofpoint-ORIG-GUID: OtUUQxWpxSHfG2B0Uc91MMsbogOzKinZ
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b05bee8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FOB8LY2opcXQ8BbJJMkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX15VgS435NsVK
 9ZulAoImNNlrJp9Ixz3Cod5NrRFnBlhfxcAOKAdgszleX/dwQ+IfmUaFnBHjAGXEgmfA/E94Gju
 u4ukMO1CeZ0VtvyplvWW1LBJYzqRfQU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

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

