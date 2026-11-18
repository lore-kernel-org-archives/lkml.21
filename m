Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989766;
	b=dj03br6Vq1KHjOm01njK+yQdmXCrrVqXVNl9yBz88kVvgtl8c0jNryTwVI1kuC7XuZmx
	 gH9JEUfntyWrMwUscDD02/6nPthMHudTvTXShtsXwbPRJl7tMIP9lHSr9sOCx2sPgGbvw
	 61qyZuUwxqpL9xoUqRcVy3kmpJs5kFgRSIYZiaxqZ4ffVpkWy4S5/XRXI8rknKnRyepo1
	 q+MvLaoChegdcU53y5dD3zEjzgSFJtlKbpDpPIwGOkX36XBOSqqbyIJvqXzfcHQ4dNm7o
	 uAvkdVcK/RWWbWCRdgpM5OqBJXcXz0FleAgksYm2C8vSwsS3eeYXkId5pAzwa4dvO2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989766;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
	b=TStztTPY+v+pNob0khan8Afe8pW7oH2HM6KDMZ4WAV0Q4gMvrR0EoTiADoLY8DH9NQo1
	 vnbo8atbGqOJ7AC0em4W23/074Wcv113w72eSy90ZcCmdciHQ9p5m5s4JRMVhHodNMeeD
	 GScASVtCk2YElQHOSkVlZPY0hA649kbjYwvrSmvQb0DTYMmY37ea7njbFEQ6/29FReB54
	 MNWWkdes8DE5t6b8p36PqrQKggeG7kq1qP+yHKRnEwDMOtoL5pjcOGFIEOmdL4A/OUPko
	 XOpA8/6Uq0Z5zzcDXl2FYHmXZXm8cT/QQ6T+3+YANtoXE6GOhCJ1BMuJnAYuP8cuT8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gd/+fv9J";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Teugbj7w;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A5F606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A5F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gd/+fv9J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Teugbj7w
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UtPl3371421
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=; b=gd/+fv9Je/WDy+wf
	mc6jOJedFBF/SPzhIsNWDj0hxEvzxOlojOXK26/p/uwQo/TfE2jkuUIJ/im07ezO
	rrFdFrMlLKPpVZrXzs3CXPbHz9K7+T5YMlaQpgJGivNyJCl0I3a3lfc/fn4eXy2l
	/NIqeudzIgpQ/+xE6UH2hAqMJwyGDNrwqHqlmNw8dbENwEUlLhKQFsnYsYrbZb/l
	37aMreWx3dhuK9lVdt/LY6sixcnKmwZ0n+ctonHL5Oge98K3NJaFawD3A5m1DG9l
	oro5GY9g+4Q57I+s2W5WmnnmkuotIWo83HgyIbz0lJnX1JacibKCDdl7UrCQmFo7
	tdrajg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8syh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3b74351a4so766728a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989763; x=1795594563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=Teugbj7w89dUbyQ8jEV+eg38hpyD0daCJoh57aqJDDW4domYPazviUImPBz4o4bsGX
         wt9d58NQljjDxJ4s/zsw+eRkSQVs4bHlos8fEdkb+jjk5nrFkIN6FKZQa0plnH0FklDp
         wnzLUN5bBSgOhVdarEH0b63wkb397Kw0XVO+gDLQIPqEPSpl4mN8yxW0HZ5JwkLsLBZ7
         kcyvvKkQK/ntfFwAyXcmnOs177WBGPyMdgYFVPyM37jX4XLMa1RHdBNNhduVhtZ+929q
         7DD+Pa4iMKt0c/4irNyJgBw2cabk5TV8xerEqP+VofEOgsUWcXQl0bvZU78sH1/al4sV
         tZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989763; x=1795594563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=SEohbWJy0dqxS5NAn2VNiECj1ziZKSAVfYt3LY5JEKre8EH5ro2yDxqqUxiPGbWfVy
         NLg/ncQX0XEhd9gYTVe1G67Dlp7I2xLgD6Ge5ZuO7kZ2Uw9FRLUahlcT3Jnhy09e6mPO
         OIGDDX2p8X57L1UoqscSewd6oHZBvAk6U5WvXbcJVULoUtPW4xx+dQD1S1lWGff02ifq
         Wr7gCjNCe/YSHJmiAWlcITF0TmBpwJB63X/X+D+aCCdAUEG3QzyOGlsLouWzjPOj/7xc
         BFcQZa8bTNKRCtio/DxXu5tqU7sO6NctMCqvAk2MPTyVHbI5TkcssfYTDJCcW4pQl2MP
         v8Fw==
X-Forwarded-Encrypted: i=1; AL+hErH9c7e+ILRKJXXQTnD2wYBA2gGpqqkU1tgK+rbzg5Ykkt8yeTHiLOZhpv7P0CKWUkXNHyxnQcu+ZfXga2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WnLh6V85GhrVqB3iv2+3t6hH5QRgiYwyP6Wrk8HypCqCEOjlG
	mO1p+D9WSzZLbObyChx+veo9GakCNT9ojR5DihCl4FNyTnNPFiUeWXJeCS0AMZi0bLYJpjKV8eo
	fgX/laFbxX0LDg8OI1BJ6CXzMwPj2U4ijfzfXsaq8Grg3vrih026+Nk7KyR6j0BnOi9g=
X-Gm-Gg: AZFdTZcBfxtw1Qed8U6agpToZh25eDYmMHbv6VjIi2tnh8KDdaYEI9BGezlR8mlWYQy
	FAcffQtJUyR6oOPRfc/IuZSxNbbSCXthdoB4pmZJa+dzOtYMaDcW0QQbLx7cuWe/Ki9hwsfWm/H
	cGsKF6JxyFDo+OCt080b0ygtvIYqnA9IDRWT/nUBOS7WuVfVfXKtbz09eE58cdZA2j1+7qn+3ae
	xs59C2AiHqUaM8C3jGopq3stYmS+9fROSH1LBEhEtOw6re84YHPuz1iawRkRexR26/1HfIRCNUJ
	LSQloaGaokoKi83iRzAMP6TdL8AmQpTChHmLe52b8fgEPPjL0z0mhWvhSagJdGDMjNSv9Rrnho7
	xekkHwqCp3WXUj/eOHLlmVPhHJnzTPp9sV3iMMQkyR4Z/elEqPN+a8dAaXVKmURcsw34hffjD0P
	58ccCjjltOxNXahBN4920/IXQ+M06w0I/dsNWAKL4snb42hoARlCgSNLMmAiqeNVTT5CgWracjB
	Q==
X-Received: by 2002:a17:90b:4cc8:b0:3ac:7f4c:a68c with SMTP id 98e67ed59e1d1-3b3d07b0690mr2233233a91.49.1794989763296;
        Wed, 18 Nov 2026 00:16:03 -0800 (PST)
X-Received: by 2002:a17:90b:4cc8:b0:3ac:7f4c:a68c with SMTP id 98e67ed59e1d1-3b3d07b0690mr2233211a91.49.1794989762661;
        Wed, 18 Nov 2026 00:16:02 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:02 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:29 +0530
Subject: [PATCH ath-next v3 06/15] wifi: ath12k: add initial Wi-Fi 8 hw
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-6-9875d2a3953f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd5ec4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QEtot920D9eH50UxTSEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: w20NgCCS2x4Q-BU9UdlWG-V7o9fjk64K
X-Proofpoint-ORIG-GUID: w20NgCCS2x4Q-BU9UdlWG-V7o9fjk64K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX1d6yPP89ZP3L
 F+/2ZSnKKJr7x/VbH9CWwQx6/p80kIKkkpZFQR5WdvxtOvrzu29d427rNAA+AJrwfdR3g8joEPW
 rhLKzj5j8sqYoYqcSjvwzCgT0HVx65gAPXj5D/SRrpdHuAoAtGgN3sbXFYooALCim5vkVWVEt6l
 bjqt7NZZqbamQbpOoxpuV0mm0awJ8fYa1z50VAuvnaabvMZ6AlY6e1XxAmur2eQKCgpC4gOqPV7
 OtydhXI0klueR+0FHOSXqOkRB0JNYPgPlXmQTOdaDNOf/HIITXLLwbS747+khHs8aP0PhzjD4J3
 DmOSFVs9N20h1w1J874D1kOViXxkcMCulgtuB+C32utMpio/dOYTekMhZGybXZ2O4NT+kRbeqbb
 ZLU00NrG4GgOId7x75PheXcY06JZwDaokZmJ2Zn4t8H+EHhDzcggoP9HnzmSTM3HJGK1WtLTCne
 avOqKaNT8rRR7MjMecw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX5VDZLyaC4XvX
 jqNxwIbAk+A1mgFs1wA10yq7vwavEYKs5IBmW2SwcdxnSkeMWPwG9cEck3f6U9km0CNukvzvGly
 RnyhTSIEMo7z0+x6taXpkfZR5d8MD0g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180032

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

