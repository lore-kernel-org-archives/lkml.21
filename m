Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769407;
	b=cI49+7Rl9hBaRf5aBTwFrPNxQkqOKLXqoe1hcWutRpy14VotrQay1jRgQKU6DwrFdjdD
	 soSdi9utjbMVF/J6vykJVP4vE20LS5uZLuJDK6rvozVtb8uZi1kmAPOgmB77u290aWDZy
	 C5nW2GapMH8DVnevV6O9iMC55FXbs4vXemP2YNN3kSCKAkEgTgKgp5PvfShTnamcFcmq5
	 niMu9LNygVMFsVyJT3fvfqhyNktyQurJgAZQG5EDCQinNYr45QlGbOvD/NToPfEqL4beW
	 NgrqUJTjvZvWLG5AqgZahQyvDOuCAF5aIAiBT5/GDqAmj0X8tjLi447hFTFRVnmrzhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769407;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=w/C0LqnSjcFwHR9wZhUlOB6p3A2W1rdv7Pn2rc2Yz34=;
	b=xSXoBz0TON9KOwGFd9UO73PmL0sO8Hek5xSCYTmnxqEqqkYqs2IktiM0AkI4uOYrG3ZQ
	 sk4RLAmvpFly18JQWfEkNzYRxY7d4HCUDKbn+5BNGNNyMSfjuZzSHEQMTKEcHpxl5y+Om
	 ijS5aU4N3vjUG1TTP2RuCWm43VbMlZZvUfOAUY3rpbKJYttLtcg3JgCJfTp8HOzq976w5
	 o1TmDPGBGtMYMYfZYEnUKKtgV3BP8OKC+iJ+tJmhlwKjgOJKlmIkxsDZOcsrKAictTt0N
	 XvjGfS5un9SWGjsyFfOD9sJJrEfjLV9FibqDdGRNDQvvhqfWSOX8QRxkeQ7QmBxSBfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV3Y+o1n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eSh07ua6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83123606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83123606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV3Y+o1n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eSh07ua6
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gbl13983833
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w/C0LqnSjcFwHR9wZhUlOB6p3A2W1rdv7Pn2rc2Yz34=; b=PV3Y+o1n5z2Gf2Wt
	AiYgFCVzspVXaVobnxxnOC19ws5FF4dRYulmU14K2gImSh4LcalWw4NhAUDPUYz+
	L+Gq9fqTN71Yb0uxXun4OLQ3YzSZCnvRyU75J4wexECRMMKYwzOZyeeGUNrXeUGG
	fFpRWjDWb48OYm+qFaGAgZgOWkKJU1hX9ILbGxiOOFUtpJTJsJiUj8nWlStmgooW
	qVH+QKCNpSjQ1V1tvT6q86HfbK7yh6N+OOJteGt0USAjPVEK3kle4Qf6xRHCv2py
	u/0oE2FFuYlLy9EjcOGB1AxV5qm3KRkBcXY0U/yfYp68oTK1hPOB8l2jAIhs783T
	y4jdhg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49a4j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:50:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb572c65ceso242497a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769406; x=1796374206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/C0LqnSjcFwHR9wZhUlOB6p3A2W1rdv7Pn2rc2Yz34=;
        b=eSh07ua6xRWJmBFlPzyDILu5KXorkgDZWved3HtwxpDM7fur+jBPxx/ng0irm7NNeJ
         JkxYrOeN0FIdCa23XMVi14ejcillw/zeK+T/U8lCxJBghLOFrCSp8AUns9e+1+BKk+H+
         I5XKv9xUbtC4O+0qw8l398GMAuclIrOs6lt8riniTgEHRIx6BT3sySmbjl/P0Gz4bv98
         hc4WGOyrBcnWKU+IVYY3Rpe1YPaz0uO/eBeRMbQoUB/uCTrh5xO6dv9fL2fyUxDRfMDM
         3PHbZQGq7S5G2KCYsRSvtu/zJHYvi2o5svfUPTDlRzkdNoVjakmtLf+O5oCCFrhltHvj
         DkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769406; x=1796374206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/C0LqnSjcFwHR9wZhUlOB6p3A2W1rdv7Pn2rc2Yz34=;
        b=VLUzHC1H+NKG1YlqmdQUsX4cJzRqRtW847L4sIYpFoG4lBXUDjwpET1eAKAyAg3QRx
         FrwZOylvch52yy2d5/iLpSPkFYrBO7+Yc/55NaAQXrZR2MgSnrUAORJq0PmA/bKsc5r3
         gKA7KDk310as7LY1BWr+sG8UZuqUgrSkUubsdqtaK9j4eq9bIQgRuXddAo7gYuWcaJHz
         3900naUfcCQ6BX7zhFnpHNvbD2CYPz/8PKjI7N4h17Dl11KqjGlAPDnBxQiX3KlK+zL4
         Tp5YDPum+oRkBSGgFmJuosU1+NMykTybrlW5X85ZAogRK/odEeuSGqZKnCnXxh47UpGp
         Ia2Q==
X-Forwarded-Encrypted: i=1; AL+hErHf7feQTTdf57BetbZKkSLSmo4/chJUPmxa61e2kH4utkCp+dDVdRJNDomyVg/kqemvIljXSfz08fov9aQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wGEARwNE3E92NxFkZaGoh6S5ux60Edvh/H0gKR1511IhDsQM/
	t4811jJzidREHP17vJfp3z7jq/3cyVYBcdRW5cvjWRjv6LbYUVWCC8/dNgtQzJYtHeQfMPX+Pd0
	kySmmQs2EbDZ4LiMGysfvEo3yOLdU59xU8bhg3+imaCF00ZkqOqBZqAyHrXad7oKI2b8=
X-Gm-Gg: AZFdTZcKng38rl+VLk60juGZqDgAwr5DlFdsgu0q4R/TxphUa9l0AKcE7T91PIhd6RE
	cVmy5YqUwt06I1+3Q/DHzPEGYvoyqHaBhZT7qWcM9ygkllpnqstj/FYobsuwCmbaYkNPFjr0Qq6
	xAK9h5lYSfwYWw+wKB4qCfzXnS3ULF8o+Usuq15rfmCcOILw4ZjY/QLMmzdsQVNX0agpIZZn+jN
	GjriQwnzP1XK3GkEOf6e0A3A7QcaiJC68eT3FxbFa6MWtAF8L7EQlC5VqhCUou9KG9QUPWc+bfF
	BetE/GXq5c4ft3lMWLx+BfIX249LDNEnL5LlcvQ/7UFgiVoafIuWTJWo75xKURXT1knRTv0s1lD
	t7hu06UEjF28dzvwJqtm65aXjgnzbqv0f4dId7pwsDwRh3nrLrSlGRGKYp6cNeGiyMS8m74bUdu
	43qD74vHhhjr5JaroHL9vRiAiLJBayvmRgbcbOfu/Ae/09GvQiGEEuKTHACwsD1c+PWSITGtJNn
	bFEmuyKFCPq3kpACCyZ8QbNDG2BdQ==
X-Received: by 2002:a17:903:1c9:b0:2e9:5714:607b with SMTP id d9443c01a7336-2f03ee6aec7mr398245255ad.0.1795769405933;
        Fri, 27 Nov 2026 00:50:05 -0800 (PST)
X-Received: by 2002:a17:903:1c9:b0:2e9:5714:607b with SMTP id d9443c01a7336-2f03ee6aec7mr398244895ad.0.1795769405440;
        Fri, 27 Nov 2026 00:50:05 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:50:05 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:27 +0530
Subject: [PATCH 5/7] arm64: dts: qcom: eliza-evk: Add AUO G133HAN01 LVDS
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
Message-Id: <20261127-eliza_disp_all-v1-5-a18be7f65fd4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=5655;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=eIY48vZ7AT+BiCP/Hi//wkMEMZbw2o96jA/Lj+/JdQs=;
 b=3Wx5o30bdmAjMhLK581iqYyYklmpBDQPPsWobX4h/zj9x0twIQ0DBQVdmRIXJ9nSZUQKbIA5m
 g6neDUhEPFlBgOD1GaNZnDRaNDZ2j29kSLRcZGNm5zkaO19aQXh5BHZ
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: jkVdUDEf80aS_o4ll5VnVLRLsK3YnFLZ
X-Proofpoint-ORIG-GUID: jkVdUDEf80aS_o4ll5VnVLRLsK3YnFLZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX5VQOYFR69+kQ
 pjAqL3HLJrtk1ipTNi/UD2g6qbuCz3FXFlPGsVDqqiv31gUXU9PEQckt3bUq88AbM9j3J+dhvxv
 sTVDD+tgfWY9ru5sHYpgwkWxBF6S9nk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX1TooAojgBK7i
 BOHuSnlJL55QVezRiZz0NpojD9dVjhE5ny5fAbbUX9uAT9ijdxvkScF4uO8G6Jwo+CdANaKKvv5
 B9i1L1ePXgZ58yvz0bE+eK34pdw3qznVAVH1L4xlYasqo5Z5Im6seHJLFsocvmF4V6Iqc9rcZfX
 nVcfRoqXH6VZlt/JBNbcU3aMmBYWUQi2tcwPcsL6uSXBDWUglXREejTcEV4ZkrrDPDx0bJP4l9i
 bSy51Cg4weoRbzARplpl3Qq8XS4AVEFqq/eQcyYW/+iz2zpwnrca1/gIGBWCr2V1JaszLWxETW1
 K5+c90CBAt8D10XWgWwsLKDmzSNgV8MYybFT75l8sv0WmFrt65bWFu0j4lnulQNUq5G5vrL5+eU
 g8MKqVthzQQe+wbX5hHraKoZ78GHxbEp1yoYcKmhOnMjDv4Lu+gZDoH9KFxZrDj7nsShbSmUHd3
 LpRb+iiO49ZKYjzVNYw==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b09443e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=X38TW9RF5Lljsf8P90YA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

Add a DT overlay for Qualcomm Eliza EVK to enable the AUO G133HAN01
LVDS panel on the DSI0 B2B connector.

The LVDS daughter card uses an SN65DSI84 DSI-to-LVDS bridge on I2C4 and
shares the display bias, reset and interrupt lines with the base HDMI
path, so the overlay disables HDMI and connects DSI0 to the bridge.

Add the PM7550 PWM node used for the LVDS backlight PWM output.

The LVDS DSI0 B2B connector path expects SW3.5 to be off.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 .../qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso    | 126 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            |   1 +
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi         |   7 ++
 4 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 64c61aa9cd8c..d8cac5322a19 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,9 +15,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 eliza-cqs-evk-emmc-dlc0697-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-dlc0697-dsi0.dtbo
+eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-lvds-auo,g133han01-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-dlc0697-dsi0.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-dlc0697-dsi0.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-lvds-auo,g133han01-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-nothing-froggerpro.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso b/arch/arm64/boot/dts/qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso
new file mode 100644
index 000000000000..3da0dc3c0de8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight_lvds: backlight-lvds {
+		compatible = "pwm-backlight";
+		pwms = <&pm7550_pwm 3 100000>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <153>;
+		enable-gpios = <&pm7550_gpios 2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lvds_bl_pwm>;
+	};
+
+	panel_lvds: panel-lvds {
+		compatible = "auo,g133han01";
+		backlight = <&backlight_lvds>;
+		power-supply = <&vreg_disp_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+				panel_lvds_in_odd: endpoint {
+					remote-endpoint = <&sn65dsi84_lvds_a>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+				panel_lvds_in_even: endpoint {
+					remote-endpoint = <&sn65dsi84_lvds_b>;
+				};
+			};
+		};
+	};
+
+	vreg_lvds_1p8: regulator-lvds-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_lvds_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vreg_disp_3p3>;
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
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&vreg_lvds_1p8>;
+		pinctrl-0 = <&bridge_irq_pin>, <&bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sn65dsi84_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				sn65dsi84_lvds_a: endpoint {
+					remote-endpoint = <&panel_lvds_in_odd>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				sn65dsi84_lvds_b: endpoint {
+					remote-endpoint = <&panel_lvds_in_even>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+};
+
+&pm7550_gpios {
+	lvds_bl_pwm: lvds-bl-pwm-state {
+		pins = "gpio9";
+		function = "func1";
+		bias-disable;
+		output-low;
+		power-source = <0>;
+	};
+};
+
+&pm7550_pwm {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 734bea47855c..e3f3e3aeb089 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -7,6 +7,7 @@
 
 / {
 	aliases {
+		i2c4 = &i2c4;
 		i2c8 = &i2c8;
 		serial0 = &uart13;
 	};
diff --git a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
index 9b907f69264b..3a7dc47ced5a 100644
--- a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
@@ -57,5 +57,12 @@ pm7550_gpios: gpio@8800 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pm7550_pwm: pwm {
+			compatible = "qcom,pm7550-pwm", "qcom,pm8350c-pwm";
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
 	};
 };

-- 
2.34.1

