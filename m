Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982814;
	b=u3HONU/OVm0NyYwfUiQ1gdeIsNmBH3YL84xnMnns0icCijFOYcdz6/1JG5x/GWKZD03H
	 V2QymxbAqk5W27kwY0u4SYHFjBpoiPYHk5nsv8FSQpFc2TufaglIyAFBRXLK6lm0f1bGt
	 dp1l3IF9mFRYwbMAuyCSeNVLet+Q96ZUNop8VYRVnYjfySuWiQ96lEDBAg3XwTJNRslfy
	 lF58a0s66knNlOl0Hcz6h0MmC3DfiGREsRcxmxw9QcGAF0X3gGA+G+Cygn6xkyybrphlW
	 0Q6r4XMBUi+b2wmgvZx/Ez9YeoxXrDvQEkLWU4KraL9gF3Xb51crW+gI+xLJjXnPrEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
	b=qS4w/BncqlTTpO4uDFkT9vDrdamCmuayA6gBnFj6+RhK4R02zsaJcf3eGiOKYci0cDTM
	 LEZykPQQvtG0Vqz3wt6avPX97TQzaZ7p5EGVi8cYzlQOXHroMJ+atto0zT2qwiKi6FAQD
	 DkIqstGGNwysMaW54/O1IefRsc8x8/8zrqbddLnOhZ8RTO1jmOaOJXN4vh271GGbyp8aa
	 xniC0JAkmrXDXcFf1ak4piygyAK6vjcw7IY5+CRv+FhBXTDDfbetg9LZe7cMluicDZfd9
	 CAQXcmJaR6hNjAP7NOXdrFJuasyX9Tom3CZYasqFXJbM6KBy77lv3UdDMCyo+AOIWQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pPd5xn2l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JXOZczgy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814A4606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 814A4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pPd5xn2l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JXOZczgy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VAxV1430782
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=pPd5xn2lZWyPSzzF
	TikaJfsvltCor137uEgw10cH7SRjWWpJ/5g+4MYzNdqUC3XBNAfU8Tzl/5LBT0Z6
	/tmXoo8Dp3K5SoA+ce7dw4aoREQx//gJYf2Zl9xKKCRf/VWsueIUNBJCEgpCNYVm
	Ub9jpQgEf2K1ENymZ0AX8kCT7qYpVNXvuwOBPQ81+lkLGYNs44abcXZCGOfVZ7lp
	RoXKqrCUxDZ8keq6d8Z7Nf88YQh5e8vCDK9w0WPJJSRV9oz4jaU40NwXNKr0or4B
	mY9KdoDGMagmmja7BitAtRiC3RWW4XcAdVJWqwYonw37+L2oYxm0hQ+WBPH3RrZI
	ys7H2g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91hj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:20:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed05b3eaecso4894475ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982813; x=1795587613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=JXOZczgyrZ2IPVm+Z2Yaz67TcWWg7uWCxu/PB0whBl5mm74ogCdcCzBL9OmOIdPOzZ
         HQYNiyeqbo8yb3yJ8mHNA41VHktj11Bb5CYfiyaYVTmCEJBfnTKmmW3fMStX8CHze3t/
         2A6pv6wLR1DATs7xbH3ILVvspw+BEcUfu0R9/VfE+xVLQ0d1u9oOL9xPi8Xb/2D4Ocq2
         cM2lKHVt0eJRUF72wQZzF9NyMFlR7TY++VoHX83jO55uPLAhGAqCmxxQTVbNuPUG0XxE
         0nebqyl/8FR93CLtCtj7nxqWBxqv0+yo6fL/ehUocCnwkSoaxnYCINyKvMj8UqTfqxUh
         7KjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982813; x=1795587613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=V8xGzOZsaP+fI6rp1czuaaFL6ZWfVeVOyWzeP5yo23kw+xuw3iMMQUutfQpFPw8JqY
         GcecmW4e5Fn7CXcGKasd7w1eH+tpmn2kWxhLAPzgb7r/tEmx4xSZnZ8EEb+71sPAhOmq
         FlO2DuxCHvKL3YX6VuioeApCVvfYWXYtmk7r/RDTb4d4nr00r8gWZUqPv03EDUHjr2tj
         te4enrXPMTqzIfNg90yHLTauTn4ywV+0HVuVcD5uRZu8x4OhUHQfm7CqhVWw3tkAnxrJ
         yZldvrSIB9Cwl3wFhLL8ph5J4ssdz9rVrNELq0jtui+/k0JTyyUvBch864zWPtlSGUAq
         /vUQ==
X-Forwarded-Encrypted: i=1; AL+hErFKkg6k5xRws/s44ZQvXmkhB0MkPADFWyfgkDv030nxNCmofn+au6Ppy8MxeXqjcqNaUKTrq31rwXn/Urc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x/a+fSIlq+hYmbd2hfYviZWcxXNUJAX/MN/5Tb3It66HZAF2Y
	p6azvUgOo8rSO3UcVP8xsYTMSMDQTrA+baA1Nqa/kdjuVS9/7PVX2TYoVtNuETQSjnCu07fyoOv
	We4WpZ8RxI7iL6A27I1Kic+3++U9LW2QRdUiS/7qM8y2AurxRvbkWlTNF7Mq/EQnJM0Q=
X-Gm-Gg: AZFdTZc1WPtTWCrdwJhfTC8rKBR8HuZ5syYIVX8l534w8QZIiLXKAYxveySW6TKODUW
	DlTTbvpyFXiiCjg9XyFsVaPYL2EpFjDUt7WLTvfM9ctGEJqg+2uTJCXYenSD/9r/dEekTU9GJah
	2/KGYbKqiaZzpq/W1ntamqhZzxIciarYCWEOOIyCBaKhQ5D4wW5/LLIxqPJgK2Ioxlnv9069Y5o
	3RdrmvIPCx5gOKHdOypKSSFAqsQrKJArQspQv1lnAokMHQL+K8XieCSsAIm1JxNfsGSQfv8bO4A
	FDyWb01703toolKdkOIIran9vM04NJblJwhl9bEA2f9hpDlKFLTQX//tjnpQxVdeveWMfjAsGQN
	poXBeDBcjEYg43aaAsu8Lnr7mruwTw/Nx8YcKGf9PXQ5IHw20+pIbwE4j7YME1GLxBHiXCPwmdg
	Os/TQmcnKV0JnsHA4vEDKy5ZkR1gwX+oPR5gN3jxtwL/2PtzGrDXQGYnf7uou42X+9xYYOHpFBU
	0M=
X-Received: by 2002:a17:90b:17ca:b0:3b0:91ce:6726 with SMTP id 98e67ed59e1d1-3b3d07649d1mr1743266a91.21.1794982813057;
        Tue, 17 Nov 2026 22:20:13 -0800 (PST)
X-Received: by 2002:a17:90b:17ca:b0:3b0:91ce:6726 with SMTP id 98e67ed59e1d1-3b3d07649d1mr1743240a91.21.1794982812539;
        Tue, 17 Nov 2026 22:20:12 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:12 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:15 +0530
Subject: [PATCH ath-next v2 12/15] wifi: ath12k: add Wi-Fi 8 WMI init for
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-12-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX4gLS19OlJLc4
 TPH0fI/4WmpwAQI3w4hiQKhGKXEKzjHVDIn3OlivbaYSUaCpfASP37e3khgB398BKC+c/8uu8TQ
 4xNe1OCMaesDU4JTzwqDsl2vENrvU0rzVF/hcGVPzMv+/9+bPNY+IjrQy93FiexjzwBySEN1EyG
 kUjP96UFG4VPhXTdSsam9qgsx9dNNxFJovrBGhofidRBgELLbodqdkIivh8FroIH/O94a0tp2Ia
 HUJ5te+qmWQy9B8zTUxbec0EaaRc4gDuFiUq5+RH6zLwUOk6dn5mN9enFwiivloEl4t1tiXABaG
 FNRgDPXKVyDxodmNpsBJr3zDS5nkIdVZ8NB1dXcepfah43D5YiOdovxRwTBIeZXKHLb1NQi8t4a
 rdZJ17yQ7Elmv7i/wLitclceOl5193EGDgAZO5LTGUtSqzKI1FEZ5RCZOtbO5QylCGj8/y1FeNJ
 C6/9SABVGIW/WPly29g==
X-Proofpoint-GUID: Y06E7_gG5bSCB4pzhFARJp3r-ej80r6y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX8sbr8kFBpEov
 3vb9PfpmoExqtz2w2NSrO58MYq3LKE7PvpcQE8ncW1agv3SuBlPsY6FS2rDOcGrJl1u9m/vRO1C
 2a28iYu6saZGpV4JhGh+b1ZAm1yv6ck=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd439d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Fa-mINMYIZ2DnWK0-L0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Y06E7_gG5bSCB4pzhFARJp3r-ej80r6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

Implement the WMI resource configuration for QCN9575.

Add ath12k_wifi8_wmi_init_qcn9575() in wifi8/wmi.c to populate the WMI
resource configuration struct used during firmware initialization, setting
vdev and peer counts, RF TX/RX chain masks, scan and power-save limits, EMA
and TWT parameters, and peer metadata version. Set the QCN9575 hw params
wmi_init pointer to ath12k_wifi8_wmi_init_qcn9575 and build wifi8/wmi.c
from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h           |  2 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/wmi.c    | 57 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/wmi.h    | 13 ++++++
 5 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 96776c6e2050..b8045b33ca0d 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -77,6 +77,8 @@
 #define TARGET_DMA_BURST_SIZE		1
 #define TARGET_RX_BATCHMODE		1
 #define TARGET_EMA_MAX_PROFILE_PERIOD	8
+/* host supports peer map v3 and unmap v2 */
+#define TARGET_PEER_MAP_UNMAP_VERSION	0x32
 
 #define ATH12K_HW_DEFAULT_QUEUE		0
 #define ATH12K_HW_MAX_QUEUES		4
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index 3717b00741fd..989e640c7b41 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -6,4 +6,5 @@ ath12k_wifi8-y += ce.o \
 		  hal_qcn9575.o \
 		  hw.o \
 		  mhi.o \
-		  pci.o
+		  pci.o \
+		  wmi.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index fa64b865b931..74873fc5f3f3 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -16,6 +16,7 @@
 #include "hal.h"
 #include "hw.h"
 #include "mhi.h"
+#include "wmi.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
@@ -70,7 +71,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 
 		.mhi_config = &ath12k_wifi8_mhi_config_qcn9575,
 
-		.wmi_init = NULL,
+		.wmi_init = ath12k_wifi8_wmi_init_qcn9575,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.c b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
new file mode 100644
index 000000000000..c575cae2582d
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../core.h"
+#include "wmi.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config)
+{
+	config->num_vdevs = ab->num_radios * TARGET_NUM_VDEVS(ab);
+	config->num_peers = ab->num_radios *
+		ath12k_core_get_max_peers_per_radio(ab);
+	config->num_offload_peers = TARGET_NUM_OFFLD_PEERS;
+	config->num_offload_reorder_buffs = TARGET_NUM_OFFLD_REORDER_BUFFS;
+	config->num_peer_keys = TARGET_NUM_PEER_KEYS;
+	config->ast_skid_limit = TARGET_AST_SKID_LIMIT;
+	config->tx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_timeout_pri[0] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[1] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[2] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[3] = TARGET_RX_TIMEOUT_HI_PRI;
+
+	if (test_bit(ATH12K_FLAG_RAW_MODE, &ab->dev_flags))
+		config->rx_decap_mode = TARGET_DECAP_MODE_RAW;
+	else
+		config->rx_decap_mode = TARGET_DECAP_MODE_NATIVE_WIFI;
+
+	config->scan_max_pending_req = TARGET_SCAN_MAX_PENDING_REQS;
+	config->bmiss_offload_max_vdev = TARGET_BMISS_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_vdev = TARGET_ROAM_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_ap_profiles = TARGET_ROAM_OFFLOAD_MAX_AP_PROFILES;
+	config->num_mcast_groups = TARGET_NUM_MCAST_GROUPS;
+	config->num_mcast_table_elems = TARGET_NUM_MCAST_TABLE_ELEMS;
+	config->mcast2ucast_mode = TARGET_MCAST2UCAST_MODE;
+	config->tx_dbg_log_size = TARGET_TX_DBG_LOG_SIZE;
+	config->num_wds_entries = TARGET_NUM_WDS_ENTRIES;
+	config->dma_burst_size = TARGET_DMA_BURST_SIZE;
+	config->rx_skip_defrag_timeout_dup_detection_check =
+		TARGET_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK;
+	config->vow_config = TARGET_VOW_CONFIG;
+	config->gtk_offload_max_vdev = TARGET_GTK_OFFLOAD_MAX_VDEV;
+	config->num_msdu_desc = TARGET_NUM_MSDU_DESC;
+	config->beacon_tx_offload_max_vdev = ab->num_radios * TARGET_MAX_BCN_OFFLD;
+	config->rx_batchmode = TARGET_RX_BATCHMODE;
+	config->peer_map_unmap_version = TARGET_PEER_MAP_UNMAP_VERSION;
+	config->twt_ap_pdev_count = ab->num_radios;
+	config->twt_ap_sta_count = 1000;
+	config->ema_max_vap_cnt = ab->num_radios;
+	config->ema_max_profile_period = TARGET_EMA_MAX_PROFILE_PERIOD;
+	config->beacon_tx_offload_max_vdev += config->ema_max_vap_cnt;
+
+	if (test_bit(WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT, ab->wmi_ab.svc_map))
+		config->peer_metadata_ver = ATH12K_PEER_METADATA_V1B;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.h b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
new file mode 100644
index 000000000000..a66ede369ba3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_WMI_H
+#define ATH12K_WIFI8_WMI_H
+
+#include "../core.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config);
+#endif

-- 
2.34.1

