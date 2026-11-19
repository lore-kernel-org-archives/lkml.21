Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071357;
	b=k4SYo6Raofk7JQuYjpLESY5Ac2xBIk5MxYZYJGPaD8LtylJW8B4a6bO0p5ZyHca6EBRn
	 /4hdIvrK+Ih1/dO7CwDqZey0vYdferpIGbj3qIO9a6/0fgTlJHcU2v5CVl0Re64TLT0QP
	 EyyqnJG5fOtdmLcc6z2oNlzsco3wlZKXm6iybJ9dNJVRB3Peoy8CIzOLsaX1L5N04MCbT
	 PDhlhK1kJ7huFCGqQb9mipts3wIWLBlUEq1yb3w95aRkoWov3x5Zakq6F+8Lnyk/Tacj6
	 WWjwhm6/U8TcKc6IkzZA0vIu3X1l0YxrP6oyHR4s/p3VyBxJytTwn1PoIAOiIp9yUzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nIhm6c5LlEzFS6EsTuNhvLH7k1N5BAu48dQqmpioTP4=;
	b=iOJDcYDGzDR0CRjMQ7FUBYp6Hfz8o80CzI+DNW8KxG6rb7HtMZWw+gyWQw2xTVnGjtg/
	 i1v+9VcRUJFKMMpEhAdkkLpjRG31m3dqYaUSTsnqX3IEvthJ+DWgq3xvRsibBXpHqqA42
	 ETepS3w+ggcUSsuVY58H2VJNdVfmzyIi7uPlr+Cw9xrc1dO4Xq7PT0HGk5+7qcMb14/91
	 Wg5qLw+hJRAsZgBKzX87Ncvlxkg1bxLCmiRrCJhpEgyHWxSaegOrLa+eb5FyLjAGb+bL+
	 VXDsyHYgYYZBFrwN1kIY4/ieC2nYGo20udM9MFa8kxcwLAGslDkp+8jdCLVNIa0g9Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XTvM2YjZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GlcemQlx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5726460A2603
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5726460A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XTvM2YjZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GlcemQlx
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1C6Fk2884639
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nIhm6c5LlEzFS6EsTuNhvLH7k1N5BAu48dQqmpioTP4=; b=XTvM2YjZXOSqRkPQ
	MyvPadYdG8wPzQwPiMockJfHVPpUvYue2kBXArIvDSLRICbk7Mog3EXyQOmmKEfy
	lN8kBgPyLSptoHYwBkfIkHsWuizBfduQdmWiflozfDVkXUV9Phx7UBz8CJDgijJ3
	L0aPyEH44NMo6Bax79NpshwS0KfQ11gR2sq4OqiENWipJ1fcSI8JVi1v2Q/8Pafr
	VlqhEUrOVSNE6m/BtVwikpfUSyp946o+P//gOPtD9mO8lEVixZijYPp3wFekZWsD
	fOM5OwrMplHFfuAcZBbQA204jcCOhzt9qUcDn/nCIUoUwmLTjWRv6z+Ew19nJhVI
	t+oyeQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dnruw2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:55:54 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-847e2926d94so3811329a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795071354; x=1795676154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nIhm6c5LlEzFS6EsTuNhvLH7k1N5BAu48dQqmpioTP4=;
        b=GlcemQlxvjDaevfeIpaZ/hdiBYGi7W/HYXJkhun2Ao6oRbmSMBYSFfyZ6Cglrb8goT
         Cm3gzc10hhXns21gdWPdQzItBuJvngZxSUdXZG+T5/wzIpNWUd1kVLiET3s+F4Fq7ppN
         xF62SPK/SYXOuqL8rhcSQvKY4us8r2e9lgCuwUGLY2LIstG5LQ6hxXfMhkz+3LFIUsf5
         aquPvhXiQVEOfciCTz6slC9eo459l+wJXNNY8YRM8v+WI3OXrLa7EXbLG9rHMKQiGiPz
         WqcQ0Jc4uJ75kr2W/z57IXCDkf1EndHkXSZViXauR/aNcTK06/fCuJXOPj/LUOd9RPJ9
         9ycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071354; x=1795676154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nIhm6c5LlEzFS6EsTuNhvLH7k1N5BAu48dQqmpioTP4=;
        b=rCTnXAKNAPsC3EcwtjSqoYZ4e1md2vtGMvbUmNGzEmy1N2OHjs6xMHzuvOKofJeKPZ
         4m/xi55tKFZycu6pDqrnAISkZk0xmDDZDypVRMYr0kF2WQIr9C+t+nlBLS6zSlOeEy+B
         d1ree1cWiJuWjvhw1FHiwFerT5L/cYdeWzOhu5A7haqHWwW04cY/iG92VGDQYjtCbdRM
         r/JCiav1qaXMwSKL7Us92s5bR+mN1mC1PX8ggTyS8fhfnUL05Z9FMZDYbvWFazZuEM3P
         sbi8+CeQtCjhDFjeuSTXB/oTeyj4b90BLhIxwChVB09bdqHedhE+uiFv7/vF8jQZmLPr
         e2Bw==
X-Forwarded-Encrypted: i=1; AL+hErHd/EXkeaaKB0DbgW5sTOYmQEJBcFLnQWQPlQCVkBlvfuk4HgnXAtSwDetmtee6RtU5R013i/sS94HUCzY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OfLU+2QFU7F5zED52oCFfukA5yZJMTASoUWxVhqIqhL3ijzTg
	5Mh0+7e7YBzaJBbrXc6vwze1IBUtEo+M9mhm8qt8L/kSWsbOHFEtGitUd6+d994kMWVAexQNNsJ
	ODfK+No7+8NE22IW/7BaeOLEAc7fgbSUFORHCg2CF45pHWUPfvXpgmJ8h7EXzlg4JDTg=
X-Gm-Gg: AYBFou02oqMpCPAyqfwbPX+hLqpTm+sKmeJkxdJ4VDNFi+QvjHFHKLIY1SaV/D4E8nL
	RD5T5SvRDwJKl21Q+pn//5wD2Hk7ure6w5FtdKedNxgmYitq7D+95ob4WPlOPY692krzkGNFbc0
	oU6h6fZVHdfK+erCT8L2RghXr5jsqDdReLrw9nxrc25ozRsMMXih5f2VBdgoTLxR6Yp4c2JZRFl
	Z2R6j6rDOfYZysR8ofPAfyWShQ4n75rIEfhACbs7G0Mvi3CPI93L60w7BotW9kA2XxMhyCmRF+2
	QHjaeo6XMUTg6pLADgI0xbpQ9KPiwABO5abhyW3FmNHrW9y8YKnv6euYF/dj1RxjXNh5Q+WH0tb
	2/F/Qg9CrdT5TEBv+bF7D0Uls9+6VruW1cfr8c7L7x19XK9+suBkUPorLZe/evziWlkAW9KRGoC
	E6sk4/wbUI8w/biDZTJIPFeTCyiQ==
X-Received: by 2002:a05:6830:4390:b0:81a:9522:f00f with SMTP id 46e09a7af769-862f08ed4ecmr5285976a34.6.1795071353986;
        Wed, 18 Nov 2026 22:55:53 -0800 (PST)
X-Received: by 2002:a05:6830:4390:b0:81a:9522:f00f with SMTP id 46e09a7af769-862f08ed4ecmr5285964a34.6.1795071353443;
        Wed, 18 Nov 2026 22:55:53 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f00891e6sm3753070a34.0.2026.11.18.22.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 22:55:52 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 22:55:46 -0800
Subject: [PATCH v3 3/3] rtc: Add Qualcomm GIO RTC driver
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
Message-Id: <20261118-gio-framework-rtc-driver-2026-10-12-v3-3-52d78a8f43ee@oss.qualcomm.com>
References: <20261118-gio-framework-rtc-driver-2026-10-12-v3-0-52d78a8f43ee@oss.qualcomm.com>
In-Reply-To: <20261118-gio-framework-rtc-driver-2026-10-12-v3-0-52d78a8f43ee@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795071348; l=8209;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=/Xn8z7Wn9hnGXfczv1+n0XGcQmRX2Er3VAu7dVTnDNA=;
 b=L+L0Z7cbzu4IOzUGtYrEkw8dDjY4tHp3MM/4j7UJRy04s7Wxe4JotGwk7HSPAgMXnto0kngiH
 X5KkNJcn+bIAOL7Ss7ASVZBCvvwSQGbr78KP0z7pW657WxTY7Op0trQ
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyNyBTYWx0ZWRfX3ya8GiuGUE1W
 CDNg6Nol1tBP36BS0JOU9gJ+e53xcDQZWG+N/bLwSaIIs9jfjDGPy2fdcYMO+RgsqSn7tg1C+QN
 Rhd+VeFWoWJa1AXWw07K0UELsuMdxi6WJHnlL+B2P/2XDE+Cf4R9BxaYw16g45/T0oQrc73ueFP
 OrxXJ0qotgYq17kpFsH+9InBhFOChTVlH2aFf3Knp+gKHthGoZ6fuuDRZgcTO/So/uyLTfKN8SX
 FqryrOhU2LvRMqDZuFp+Hi8lKFre83S0DAceXyfXrkG7i/I3Yc30BmBwPNyqGg7FFMe8roUzMGT
 p27g0pmdlTefrwWBBQoOef5O4LT7qpIxkXSDxGYwgK8V8xiZnK9pNFh9dYrKK4E6/RzBWbEmPnr
 6svtmaYJqfEk0mvxU2WmoZisl5iwoZttG29gzm7USzyssyuz2a4C3GgZ1UEyzN8fTLyn2l7wygs
 ra6tKR0n0brCdwMQLnw==
X-Proofpoint-GUID: 9hmKfoB2tq8sX799ddGE2TohUGh2qOJ_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyNyBTYWx0ZWRfX5u0PFGFaEQAD
 li5Z0cTEUqjfMNIy7Cr+1LQvdJeI0ukdwN+dFO7/cfu90bAiqwk7yvx3qMffZzO6uSrKJiS/+e1
 v3N9A+og406snZ43yH+3YJMsmcDdhc8=
X-Proofpoint-ORIG-GUID: 9hmKfoB2tq8sX799ddGE2TohUGh2qOJ_
X-Authority-Analysis: v=2.4 cv=bfH+w+PB c=1 sm=1 tr=0 ts=6afe9d7a cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=PQbxmwGiin7G8qBTPywA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190027

On the Glymur platform, the GIO (General I/O) interface communicates
with the SoCCP battery-management firmware and provides a set of TAD
(Time-Alarm-Device) registers for reading and writing RTC time. The
platform also includes registers for configuring an alarm timer and
initiating device boot-up into different power stages, such as:
charging only or fully powered-on system, based on the applied power
source (AC/DC). However, repurposing this alarm timer has very limited
value for an RTC driver because it does not expose an interrupt when
the timer expires.

Add an auxiliary RTC driver that corresponds to the auxiliary device
created by the GIO driver, "pmic_gio.rtc", which manages the RTC timer
by accessing to the TAD real-time register block through the regmap
interface exposed by the GIO device.

Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Zenbook A16
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/rtc/Kconfig               |  11 +++
 drivers/rtc/Makefile              |   1 +
 drivers/rtc/rtc-qcom-gio.c        | 153 ++++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/pmic_glink_gio.c |  14 ++++
 4 files changed, 179 insertions(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 73ec9230edfd..a298f7ae68f9 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1863,6 +1863,17 @@ config RTC_DRV_PM8XXX
 	  To compile this driver as a module, choose M here: the
 	  module will be called rtc-pm8xxx.
 
+config RTC_DRV_QCOM_GIO
+	tristate "Qualcomm GIO RTC driver"
+	depends on QCOM_PMIC_GLINK_GIO
+	help
+	  Say y here to support the real-time clock exposed in Qualcomm
+	  SoCCP battery management firmware through the GIO (General I/O)
+	  interface.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called rtc-qcom-gio.
+
 config RTC_DRV_TEGRA
 	tristate "NVIDIA Tegra Internal RTC driver"
 	depends on ARCH_TEGRA || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 46f1a0fc2416..9cb76aac7897 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -142,6 +142,7 @@ obj-$(CONFIG_RTC_DRV_PM8XXX)	+= rtc-pm8xxx.o
 obj-$(CONFIG_RTC_DRV_POLARFIRE_SOC)	+= rtc-mpfs.o
 obj-$(CONFIG_RTC_DRV_PS3)	+= rtc-ps3.o
 obj-$(CONFIG_RTC_DRV_PXA)	+= rtc-pxa.o
+obj-$(CONFIG_RTC_DRV_QCOM_GIO)	+= rtc-qcom-gio.o
 obj-$(CONFIG_RTC_DRV_R7301)	+= rtc-r7301.o
 obj-$(CONFIG_RTC_DRV_R9701)	+= rtc-r9701.o
 obj-$(CONFIG_RTC_DRV_RPI)	+= rtc-raspberrypi.o
diff --git a/drivers/rtc/rtc-qcom-gio.c b/drivers/rtc/rtc-qcom-gio.c
new file mode 100644
index 000000000000..679b24f2a190
--- /dev/null
+++ b/drivers/rtc/rtc-qcom-gio.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/rtc.h>
+#include <linux/soc/qcom/pmic_gio.h>
+#include <linux/soc/qcom/pmic_gio_regs.h>
+
+struct tad_rt {
+	u32 ymd;
+#define RT_YMD_DAY		GENMASK(31, 24)
+#define RT_YMD_MONTH		GENMASK(23, 16)
+#define RT_YMD_YEAR		GENMASK(15, 0)
+
+	u32 hms;
+#define RT_HMS_VALID		GENMASK(31, 24)
+#define RT_HMS_SEC		GENMASK(23, 16)
+#define RT_HMS_MINUTE		GENMASK(15, 8)
+#define RT_HMS_HOUR		GENMASK(7, 0)
+
+	u32 ms_tz;
+	u32 daylight;
+} __packed;
+
+static_assert(sizeof(struct tad_rt) == GIO_SVC_TAD_RT_SIZE);
+
+struct rtc_qcom_gio {
+	struct regmap *regmap;
+	struct rtc_device *rtc;
+};
+
+static int rtc_qcom_gio_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct rtc_qcom_gio *rtc = dev_get_drvdata(dev);
+	struct tad_rt rt;
+	int ret;
+
+	ret = regmap_bulk_read(rtc->regmap, GIO_SVC_TAD_RT_ADDR, &rt,
+			       sizeof(rt) / PMIC_GIO_REG_GRANULARITY);
+	if (ret)
+		return ret;
+
+	/*
+	 * The firmware may return valid RTC values even when VALID is not set.
+	 * Only print out register values for potential debug if it's needed.
+	 */
+	if (!FIELD_GET(RT_HMS_VALID, rt.hms))
+		dev_dbg(dev, "RTC registers: ymd=%#010x hms=%#010x\n", rt.ymd, rt.hms);
+
+	tm->tm_year = FIELD_GET(RT_YMD_YEAR, rt.ymd) - 1900;
+	tm->tm_mon = FIELD_GET(RT_YMD_MONTH, rt.ymd) - 1;
+	tm->tm_mday = FIELD_GET(RT_YMD_DAY, rt.ymd);
+	tm->tm_hour = FIELD_GET(RT_HMS_HOUR, rt.hms);
+	tm->tm_min = FIELD_GET(RT_HMS_MINUTE, rt.hms);
+	tm->tm_sec = FIELD_GET(RT_HMS_SEC, rt.hms);
+
+	return 0;
+}
+
+static int rtc_qcom_gio_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct rtc_qcom_gio *rtc = dev_get_drvdata(dev);
+	struct tad_rt rt;
+	int ret;
+
+	/*
+	 * The firmware requires the whole TAD_RT block to be written in a
+	 * single transaction, so ms_tz/daylight (which this driver never
+	 * changes) have to be read back and carried through unmodified
+	 * rather than writing just the ymd/hms words we care about. This
+	 * leaves a small window where a concurrent firmware-side update to
+	 * ms_tz/daylight between the read and the write below is clobbered
+	 * with a stale value; accepted given the firmware doesn't support
+	 * partial-block writes.
+	 */
+	ret = regmap_bulk_read(rtc->regmap, GIO_SVC_TAD_RT_ADDR, &rt,
+			       sizeof(rt) / PMIC_GIO_REG_GRANULARITY);
+	if (ret)
+		return ret;
+
+	rt.ymd = FIELD_PREP(RT_YMD_DAY, tm->tm_mday) |
+		 FIELD_PREP(RT_YMD_MONTH, tm->tm_mon + 1) |
+		 FIELD_PREP(RT_YMD_YEAR, tm->tm_year + 1900);
+
+	rt.hms = FIELD_PREP(RT_HMS_VALID, 1) |
+		 FIELD_PREP(RT_HMS_SEC, tm->tm_sec) |
+		 FIELD_PREP(RT_HMS_MINUTE, tm->tm_min) |
+		 FIELD_PREP(RT_HMS_HOUR, tm->tm_hour);
+
+	return regmap_bulk_write(rtc->regmap, GIO_SVC_TAD_RT_ADDR, &rt,
+				 sizeof(rt) / PMIC_GIO_REG_GRANULARITY);
+}
+
+static const struct rtc_class_ops rtc_qcom_gio_ops = {
+	.read_time = rtc_qcom_gio_read_time,
+	.set_time = rtc_qcom_gio_set_time,
+};
+
+static int rtc_qcom_gio_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct rtc_qcom_gio *rtc;
+	int ret;
+
+	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	rtc->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!rtc->regmap)
+		return -ENODEV;
+
+	dev_set_drvdata(dev, rtc);
+
+	rtc->rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc->rtc))
+		return PTR_ERR(rtc->rtc);
+
+	rtc->rtc->ops = &rtc_qcom_gio_ops;
+	rtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->rtc->range_max = RTC_TIMESTAMP_END_2099;
+
+	ret = devm_rtc_register_device(rtc->rtc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct auxiliary_device_id rtc_qcom_gio_id_table[] = {
+	{ .name = "pmic_gio.rtc", },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, rtc_qcom_gio_id_table);
+
+static struct auxiliary_driver rtc_qcom_gio_driver = {
+	.name = "rtc_qcom_gio",
+	.probe = rtc_qcom_gio_probe,
+	.id_table = rtc_qcom_gio_id_table,
+};
+
+module_auxiliary_driver(rtc_qcom_gio_driver);
+
+MODULE_DESCRIPTION("Qualcomm GIO RTC driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/qcom/pmic_glink_gio.c b/drivers/soc/qcom/pmic_glink_gio.c
index 0ea338518873..d00588a943d9 100644
--- a/drivers/soc/qcom/pmic_glink_gio.c
+++ b/drivers/soc/qcom/pmic_glink_gio.c
@@ -113,6 +113,8 @@ struct pmic_glink_gio {
 	bool service_up;
 
 	struct gio_write_req write_req;
+
+	struct auxiliary_device *rtc_aux;
 };
 
 /* Must be called with pgio->lock held. */
@@ -338,6 +340,18 @@ static void pmic_glink_gio_init_work(struct work_struct *work)
 
 		pmic_gio_set_state(pgio->gio, PMIC_GIO_STATE_UP);
 	}
+
+	/*
+	 * Create GIO consumers after PDR to ensure the transport
+	 * is up before consumers use the GIO regmap device.
+	 */
+	if (!pgio->rtc_aux) {
+		pgio->rtc_aux = devm_pmic_gio_add_consumer(pgio->gio, "rtc");
+		if (!pgio->rtc_aux) {
+			dev_err(pgio->dev, "failed to add RTC consumer\n");
+			return;
+		}
+	}
 }
 
 static void pmic_glink_gio_alert_work(struct work_struct *work)

-- 
2.43.0

