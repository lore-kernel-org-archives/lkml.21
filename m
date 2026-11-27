Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769414;
	b=GcwT/ThpB2ubpc+opW5RhpaREPqNje+uUcKc/bFXOIlzcVqV49fC67wDOSXxbMpk37DR
	 EddNZjLbEAwgMpl+tY5vzYGDEJ2pvtRYZrpuDbHpWZIad7N4XPU5alOtkrVgK2oAuX+oE
	 UCDJd82vzW/jb70JBTy0Sy+Ea9GW2s9ja1pNPKjh6bZHvyW2CBhVeR5G1OIKD00+ANI07
	 +psSMp5lFaRwyFewJ0Q3pWWjaKvsk1t+oUcYZiPMYX1ql+6TfAC0WTN8Tde4gQ3wuyda9
	 Dx391ueBaKd4gEpB0dg30VMp9t5h3uGLto/dC9tNgFBymCKDDlFwl83VqbGIJTOXrtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769414;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ROlTQJTZQ9QnDDl9LWG3ZjMqcYuTf5tNI8Ms1jzAQAM=;
	b=5arwu5uS/RX+nh8pSjW4tA5pV0HnsqVQ1glPmi5yhxjDt40xr7lefAdQnIBZK26Y0Nk2
	 NVr6XHqozLneARk3oH+R9BKH5yVohX0ymJa+1HCYzwLwYxXWeIGLBn9p/1ttj0YQHCnS0
	 gGBIrsCu9tf/zM5GF6zrgfZnu6rXdOALBOYeLw52KTHl4uzk1XqNLAbmYfspBKIpicnw3
	 F06+SaXQDxCXVtLDfwQPwatjSGW6n6dRvLZ9OSLUQUBKaz3eAMDz7av/fIQaQhzFG/eyt
	 GdRhVJofUmul79eo+4kmBmsl4n4MY5MGXLhNJ7L/EuXSk1u5OB+joM86Yb2qWi01nqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbNxvnWh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RcO7gyJo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA5260A3824
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEA5260A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbNxvnWh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RcO7gyJo
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gfv21475202
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROlTQJTZQ9QnDDl9LWG3ZjMqcYuTf5tNI8Ms1jzAQAM=; b=XbNxvnWhk/MWVuzp
	RMhH+S6HgWWmPceiFqprC5hnUSrMXnUtQDzWw/QvliurzXrrQ9fu7Ov62v1I5PPN
	3BOlYDjrDqIXfnhXQTl6p/SFqk54PHdgilW9VQty29ZClP3OoN2+vrHgJMMWxWo6
	78t6DbvvCYBQLVWxxoZOeFSCQCPVfUFIesKBMXFIYNBn2bv3+DyiFujv1jPVHdp1
	b6C6oxyKebjH3NkuNd1Q04Fk7Z6H5hW5ylKAoou5PvWKHEq+gg6rCKeRx+4PhX0f
	yvWwwLB2q/LOsNfD6xIbpKF/7XAEmBWpkGDf7mgBM1YAH7rc30OiDqWKgpUHkfwC
	TxibyQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4ht5dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:50:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc50d537cd7so272559a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769412; x=1796374212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROlTQJTZQ9QnDDl9LWG3ZjMqcYuTf5tNI8Ms1jzAQAM=;
        b=RcO7gyJoSToQoLZAh3/3dnusglURZVvmPtWTVojzIWTAsG3irJu3HR2i0USWfzXMjF
         /U2WGv5b7nmQyFpj7z8VIk0jBgtZEHozH4BE5A/dskjkLqV0OVeW88oTWtwzGEH05AOZ
         i1anjzqHI6DeqwouJW6biTXc1vRuZgHYOTc4pOYwsOrRC2/0/OmYqvVAsucoCzni4woG
         ORHvKoQG4XlnVTPl60N9ykXmYdwqNyt9uHdAnzctDYmoq5ULk4PaBuoRfuFWJCsaYMw3
         foNSusuJEyxsmtIpFJi14YPmIqpJYdVwGl6DBBNOGMPIuLjX+COuY6kjqT6d8AwiAMAN
         zZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769412; x=1796374212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROlTQJTZQ9QnDDl9LWG3ZjMqcYuTf5tNI8Ms1jzAQAM=;
        b=jLpSUg6sbHufWyrB9oy0kl71pjYN6iXObmC/WR46lBHRqRGXatLDMip7giHDDwFUN6
         ZgVd0fjUPNNg+kiz78Z8e/eOiffLsrEfW3wzgEzJgM3kkgIL6Q5mAKYd7iUDit+j89GB
         FRz7gTz6GCH/DnQd7cbiwH0JlM2u/DKpqjJXiM/4XWMNJ2bH2adGh3Ju7ymx120CeY70
         OYiFojS3Yb3jvnUX56BoFF4ah1lpC62q+qAnwz/FIKRzpptEopa2qQ3IjRZke7UjlUR9
         xlNae7wavkHz56rI8QTH9QapoCYzUM3RCUCC4nY2sFgwwfdtkiPu/CGJICixahSwJ+/i
         wlUA==
X-Forwarded-Encrypted: i=1; AL+hErECVPaGwtuIxED46rYPtYZ8GlIvRNbGNzcAV0yHDHTwrHic+/CUx4T1Y4M8WmHxOhWBAMMLqFMLfBI0MY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uCxKd0MoWvlGM2TeXInJJluWinzuqu7f+lcirXljuLfNSsTI6
	0LYdWvBHs9vC1U3cILxxSYX265pvQoo+o66qrUvDXQqwyngUytT2RFB7kqT/uk4iz2j0EOwnkaX
	GvMnm8WQ0aF3ehQHCCxQPo+gMOGJFnIR+NSi0+8+h5b8HEFCdHNPFkkcViveWyWxcrdM=
X-Gm-Gg: AZFdTZesodHSvLy+DcwzVPhfUkjEcc59afWl0aJ5ixfUeV5vchf0yv6zDAwwfDrSvSQ
	xRUwbAvXsrzkb5lRHQzuWoeU9iXmfZgDU/BXHBQeMRGpU4ykd6VAGHszTWKNu8/uO/3+QxRvqnv
	HXGEIl1WpjtS8kj3W6fehM2bx8xO/GSXTjszkcA/w81RJ24M7+TPee+XrcFeReeHhtT8EwSAQVi
	U4+31q9CTnI7nkOLTCvY27X/e0vcw0pBmIjauzqt9GkyoLbq5DrJaDwK/sJGwGRiheLRH0SB8Uy
	GDQ4l7XlsT7kAR7cLz7HRfwLUdEiLVwnfJO04YTNFvUqaxI45BddRmOerwkLHNwqnLqbaZ47gHo
	MvrYwDIkhsfq3Toqd6k17osOWyQ63I0STwhZpIrCXh7iE8VKmyoj+Fe8uNXdJx0d1VyuLlgY6jz
	tOeoP7nyC6hcoit+UHs+/llLjRkQutcyK9DSQSyyZUHa0AqciMcK7FtxEfsSCdbUchMdlZQop/P
	KpBDHX3cbb0nzBlEm6D1mEUWnm4LA==
X-Received: by 2002:a17:902:e847:b0:2e9:6468:2005 with SMTP id d9443c01a7336-2f03f117acfmr379202415ad.2.1795769412244;
        Fri, 27 Nov 2026 00:50:12 -0800 (PST)
X-Received: by 2002:a17:902:e847:b0:2e9:6468:2005 with SMTP id d9443c01a7336-2f03f117acfmr379201855ad.2.1795769411765;
        Fri, 27 Nov 2026 00:50:11 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:50:11 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:28 +0530
Subject: [PATCH 6/7] arm64: dts: qcom: eliza-evk: Add RPi 7-inch DSI0
 overlay
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
Message-Id: <20261127-eliza_disp_all-v1-6-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=4093;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=ozVFPvwCToClH6aGgrZS4PFCY5hY/HUAi50iI0h5UIU=;
 b=bcCqAp1av8GYBVUZt3ZQMJaV/hca+QKvXb7Ri69R/DLBEYBMQewIoYf3EAnc1BRkZkfgKj1sO
 RQoycvFYi60BdhzoBEqIzQlx9FqEX1KYH2t9RE1uUJ/+ov0lylpTqSg
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX5zvmgkGDSRCS
 ZnHjs3dx504ubnEOyaOquW9z2bOlUV75B8bvhTx5T2KzVJvYA13GUJJ7NgqBAu93npc2PPNKVvf
 H2s+Pbyk90RnpN+jOdBnxruS1pjNMkc=
X-Proofpoint-GUID: ae0KW4XpNDeleePSbM7H8tb0xRMLVnYA
X-Proofpoint-ORIG-GUID: ae0KW4XpNDeleePSbM7H8tb0xRMLVnYA
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b094445 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fr-BqTdB3QoRZjYE0SAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX8EOW+B7MJhUj
 4/v9JZoelyx6KU8YKgMiknPt//TKmqoa3prdEWkGLADgRmHoWMv3DlFrdgfgb21cmw3B2D9FOQ3
 QTXAvuvoVQFRQ3o6ly993PGRmUS/YxJ42nZPedjtmW27Tmcx0Zx/5WXu9tDr9OdIXlxj179mzTE
 vM2rlQVZZsrc5XY89KCJAHtHVN07Ry8W6IiuoJgWq4zf03lPW0giaTr9el7VuHgSJo3pNLCfCwf
 ZR11jwH0kcSl9fuxHwQZysyn72+i+Qx1obUZ/DeCcZaVwI5urzc8cseN057n7VZxgdThow4z68w
 /WxDVC0U20zdlTkhDt3Fk9X4q3jEK/ndlzOKSWfd6mlEKJeAfbni9ip1dlY4VKZFBmL855pJseE
 eptY4YVNRK/hb1rOuxA4YicjLsUV5kqguwTQZkxTSc8RV1Yx8f+vwvKPaYcRCf4Gn2Lnm9ebMET
 8f1WdFKpUlf0Hesluvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

Add a DT overlay for Qualcomm Eliza EVK to enable the Raspberry Pi
7-inch DSI panel on the DSI0 22-pin connector.

The overlay disables the default HDMI bridge path, routes DSI0 to the
panel and describes the panel regulator/backlight controller and Goodix
touch controller on I2C8.

The Raspberry Pi DSI0 22-pin connector path expects SW3.5 to be on.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../dts/qcom/eliza-evk-raspberrypi-dsi0-7inch.dtso | 87 ++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d8cac5322a19..9183f7c608c2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -16,11 +16,14 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 eliza-cqs-evk-emmc-dlc0697-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-dlc0697-dsi0.dtbo
 eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-lvds-auo,g133han01-dsi0.dtbo
+eliza-cqs-evk-emmc-raspberrypi-dsi0-7inch-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-raspberrypi-dsi0-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-dlc0697-dsi0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-raspberrypi-dsi0-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-dlc0697-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-lvds-auo,g133han01-dsi0.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-raspberrypi-dsi0-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-nothing-froggerpro.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-raspberrypi-dsi0-7inch.dtso b/arch/arm64/boot/dts/qcom/eliza-evk-raspberrypi-dsi0-7inch.dtso
new file mode 100644
index 000000000000..33cb9947f463
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk-raspberrypi-dsi0-7inch.dtso
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	display_bl_dsi0: backlight-dsi0 {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_display_dsi0>;
+		pwms = <&rpi_mcu_dsi0 0 255 0>;
+	};
+
+	reg_display_dsi0: regulator-display-dsi0 {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-display-dsi0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_touch_dsi0: regulator-touch-dsi0 {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-touch-dsi0";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&rpi_mcu_dsi0 1 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <50000>;
+		enable-active-high;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_0_connector {
+	status = "disabled";
+};
+
+&i2c8 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	rpi_mcu_dsi0: gpio@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+
+	touchscreen0@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&reg_touch_dsi0>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+		reset-gpios = <&rpi_mcu_dsi0 0 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_display_dsi0>;
+		backlight = <&display_bl_dsi0>;
+
+		port {
+			panel_in_dsi0: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in_dsi0>;
+	data-lanes = <0 1>;
+};

-- 
2.34.1

