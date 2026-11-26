Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687010;
	b=A5HsrfUZISbtBqKHH0bdHM/DMrISNVPQLinfeiZUYO8PTsVQrRkSn/sCNO8KMHzPMTHU
	 ZYkhgHDx/OXZw5sLGWH6iOhrG3CUakVDbUygc+RWEqGS2/PsZS6Ub91q+n8PHOgQOwShV
	 p/tVeyqQ6wcwZk272cADNveT/UVUju2iEb2c74csSIuNeIA7oNPEAGPrMZ2z1a4IMfY3g
	 ukpjf3JzhD2kjtqG9eVf8nIAO/CpLykzlR2ou8QEVXIyE2fY4NvRNNdM2r58niUR2ZAKE
	 w20E5GyP9MhH0rXw1qji9DuuGmZPsA+t9a7ZnndjntI2YYNMmhu39ehYjMIB8UB1YzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687010;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HgBx16XBHaJoctyQ5sr1y8uJL3DO8PouYXzM4cXEFkI=;
	b=OKH6o+JZLRE9XQyK3DzjEc6hwLFhS7ilugMxdSF0rgSQbhCyTMbwPKpO8dJ0zgYCEEMW
	 +bXCYoNwDuwtBGc2Wr/hoBfkW5PahQlV8NrjAC3EJstG5+/OMMXtKkPl3n5ew/WBqC+Zt
	 VGRLvT38g5PxEMC3NbDdZIsOOK4chMCSmemif2DYbs3m5WeGqtKvHVe4nlpZJnuHFyq+y
	 ak5WGpbMXPJFgnyFdH1opftMkOTHpdFU7EX42m2jzVU0z6Uy7APK2v97G8/kD5M183Y1u
	 aJ4O8pipY8r88i8SrKCdtKmDNxHZMnrHf17bAcmBfEccIyJop+UnI5hy27pkEb8AHlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aGkC60DF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XRwzfflF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F54C606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F54C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aGkC60DF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XRwzfflF
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BDkO3548533
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HgBx16XBHaJ
	octyQ5sr1y8uJL3DO8PouYXzM4cXEFkI=; b=aGkC60DFYejd+1ly9Fe9fb6rayy
	8cDAo6Kmn0UYX8EkQmMRgGOfhLcP1e1Y4nCORTSwSg83B7Ivlz++kgD98ndYP67j
	8lPSm++000gUxt+hOPrcLILeFioLWWPsSqDADT//Wm9zUEhReYMTVq0FqwOsi5Y8
	KVJ0zea8zIt7TB5GpZl4ZkkZfiJeFYccTnoWnXNptrZN/3KRl47vho9nSNGF7I47
	lPbrJbgqQw+E+xEteLzmFYZJULRE2GfvktMkKi0V5R3MCeM8FPvZV/1Y6fv76bZX
	E9sYaxyel8tYtnp5ADPUzZdU6o3K+pb/tBes7/rO8KM61f54m9WBMOTwb9Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vaud84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:56:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b41aa2b9a8so4721278a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687008; x=1796291808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgBx16XBHaJoctyQ5sr1y8uJL3DO8PouYXzM4cXEFkI=;
        b=XRwzfflFX9b/fZV9EDhbFe4xpCzo4xerj/r24YJgUfaBFr0C2ZeIN6NE8SfcowUOGo
         /loIFHTV6zxWKYjrP0INAKrzWO0r7lUL8zHt5ZBfdPyvh99Z+nJR8uaZOPoFZgES1hbe
         h+MxIupPM+5Hlp9JSMYaSjhNJk8s+ZS15YY1N5IIc1BO+5ST73jniawxYPra+n0ih4au
         mJAFRmu6nZszyEfv8M3KtFxVJJTUDNnY9ZuiK+cIcZgYHm7ajErmeUMKtSu/qapyLEfS
         s+e57SyFifO9I30O10SA/GTKTnmL1pUMe5mH6hH8LSsDGrP7AJJtptoyBsNEGC+GAlzf
         nSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687008; x=1796291808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HgBx16XBHaJoctyQ5sr1y8uJL3DO8PouYXzM4cXEFkI=;
        b=zbSOLoFRkbsSmHrqaVL/r0LJbOfgCKOLm6UtA3HMc2YN+Wu09syyCTq98VFCF8Wa31
         hHXLyH/IjyNN+Z9YN2KCaFJWpLOav7gICkg2oHMMyJHEdVTf62ept61pEWUAB+gWGzAn
         Mk0xPjwbEaLMT8/4q1rIPQWwjGn5okhII7m+UxpbaZZlFABSbWhtQ2MjAZ3gB1315Yf/
         LbNr7Qyh/x0fl4wV6yRTqwdQXJAItzqy9NxttEyf2ILDNv/N3Iifr5O2D17TIJbsbmF9
         67FzhsSUBaNzGrN2jfa/i1RybqmzRzO5niVe8nBauPU3DNr2w5m5Y4M8fS5VcYD94d/A
         wmuQ==
X-Forwarded-Encrypted: i=1; AL+hErE9R8r1gTwIxt+F/zIZCIxkP0M2YI7xWNbNSjG1CIY5fnf2fl7gVpVeSTDm9zlD/Yq+19Tq5dnzuihg9gQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BoREuor6YF8wbOllONZKd3a7VJWq7iRc+CvnF0Q6sPhgIRU51
	e9fDVBexAQ2YacEjkelZcBZps3lfjjVgjC5kKd/gxGqLUsPZKMCNdFq/nnFONkESP9ffW3IZ63y
	d6o3cEm0Mpux56BjT3c3tc31es4YcPuk06eXflDNqxG/MZPZMSKErQeejtBX04Zq9PwU=
X-Gm-Gg: AZFdTZcbWJCbARK5NghAB0HYb+v5n7IJzXQzLRnqtHkcUHEQYigrsuh7B3Reqd0ygRD
	8BaszZz+BrNnJxWTe3NqFvZbrYY8VPOsaIlmSkhhJcajrlps1GgyAWqF5XLfMDv9Ptlr86urspz
	WcMy25fuaHnApqcK/UvNRD3/AYBZWmtibOWlx8v2m+3uhYE58b7ehkdc5DJsWnevYOXOKadhAt3
	nVWvkediYtcgXaxNWqtnOK5tpoCGNH2ypeYyIuUp5Q67cgxWkx+80lC3OdDzEJcPlMC+hETh2Jc
	3g7y/dp/fjRcQIgqyLVXyIxZYVuBcKItgQ5NrmcyXPYh1mAeCYeD+w1sSFZOdKqRtVWx2i40mX1
	O6ClIA5qwEj1ANgoRDkvMNgyPq1C3WWu+VTmvvZKZ72CmgFNNmZjeGmOQddpYSuRBqUEXEkEJz9
	MuoV9R1g2+hoYHqh0M6QQxw6lOzbBdLm3tM2KDpc7ocu88rkJT3BKDfCxdabHAv26eAm7pU2q/D
	w==
X-Received: by 2002:a17:90b:180b:b0:3b4:1336:4f53 with SMTP id 98e67ed59e1d1-3b41c7d5c11mr17904006a91.1.1795687007757;
        Thu, 26 Nov 2026 01:56:47 -0800 (PST)
X-Received: by 2002:a17:90b:180b:b0:3b4:1336:4f53 with SMTP id 98e67ed59e1d1-3b41c7d5c11mr17903983a91.1.1795687007212;
        Thu, 26 Nov 2026 01:56:47 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:46 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 06/14] gtrace: Add RISC-V Trace encoder driver
Date: Thu, 26 Nov 2026 15:25:27 +0530
Message-ID: <7c08bb0d199c3a8cf0ec0b875d5a42165ec164eb.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX0dSUCtixhO3d
 XqD7+ilQ5Ab7tObNzsQl1CHOfJHV5Odr5Y+fvv6/anzj9iSdCQtYiwpyT+YYhql22KTBPKX/uIM
 oN1JbV8/2alqlAhF0rOY6DbywgwDTp4=
X-Proofpoint-ORIG-GUID: WGWGJ3wcv8V7sUPIQDTeGPZyc1gIN5Av
X-Proofpoint-GUID: WGWGJ3wcv8V7sUPIQDTeGPZyc1gIN5Av
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b080260 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=lv0vYI88AAAA:8
 a=EUspDBNiAAAA:8 a=8cX3ZGdeUJnqEQj61ccA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXxxXMuVhQrjG9
 VYdTA+pg774zE/IKvt4tmUaCBFJtY9R2MGty4DUM4LD0s545es7oU63wfADzdV0ueUiHUbRk40Q
 B+/skJnFiCbe5XtmrZtKVLE/ZUpWIIQHq1qDO3RJ7eI/hBgisEyT8+iYgpX3WgzCidex3eofYOW
 QbqIZ0afCxRF7RMnjI/8mviL/kfrWZSSBgPcdSKz/5izC6BW+uKDpK1fziiKmR66SfoKVAavM0y
 IuhWMlhvDq1vOWZV0fAYQKmSxQbzsZ9LJl0pJqR9OUvYEI6n+TdV4PDr3psRLxdIK3u5H495ILF
 xfNXiQQnsk/pvMERqQIcjj1CCMQ3zYL3x231QajEQ3uNgUrSBu0INoF/fJp443z9Nw7a53NI/JL
 NsrqGl5XgGEcrPeSuiLclB1Sq9fO88H+F/qBlAtqozotZMEA5PiuHCq4uq2rDP44tG5HINZpS+O
 imR/pJax1aiApri8HYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

Add initial implementation of RISC-V E-Trace encoder driver. The encoder
is defined in the RISC-V Trace Control Interface specification.

Suggested-by: Zane Leung <liangzhen@linux.spacemit.com>
Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig           |  13 +
 drivers/hwtracing/gtrace/Makefile          |   1 +
 drivers/hwtracing/gtrace/rvtrace-encoder.c | 274 +++++++++++++++++++++
 3 files changed, 288 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-encoder.c

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index 04986f216549..e3a621b59913 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -28,3 +28,16 @@ config RVTRACE
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace.
+
+config RVTRACE_ENCODER
+	tristate "RISC-V Trace Encoder driver"
+	depends on RVTRACE
+	default y
+	help
+	  This driver provides support for the RISC-V trace encoder component
+	  which is defined by the RISC-V Trace Control Interface specification.
+	  The encoder is bound to a CPU and generates the trace data for that
+	  CPU.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-encoder.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 20f67a78b8ab..2660fcaa332b 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -5,3 +5,4 @@ gtrace-y := gtrace-core.o
 gtrace-$(CONFIG_OF) += gtrace-of.o
 
 obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
+obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtracing/gtrace/rvtrace-encoder.c
new file mode 100644
index 000000000000..f528a6af42e1
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cpumask.h>
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/log2.h>
+#include <linux/minmax.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include "rvtrace.h"
+
+#define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_MASK	0x7
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT	0x6
+#define RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT	15
+#define RVTRACE_COMPONENT_CTRL_FORMAT_MASK	0x7
+#define RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT	24
+#define RVTRACE_COMPONENT_CTRL_FORMAT_ETRACE	0x0
+#define RVTRACE_COMPONENT_CTRL_FORMAT_NTRACE	0x1
+
+#define RVTRACE_ENCODER_INSTFEAT_OFFSET		0x8
+#define RVTRACE_ENCODER_INSTFEAT_SRCID_MASK	0xfff
+#define RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT	16
+#define RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK	GENMASK(31, 28)
+#define RVTRACE_ENCODER_INSTFEAT_SRCBITS_MAX	12
+
+struct rvtrace_encoder_priv {
+	u32 srcbits;
+};
+
+/*
+ * Set the srcid and clear trTeInhibitSrc bit so that the emitted trace messages carry
+ * the source id
+ */
+static void rvtrace_encoder_set_srcid(struct gtrace_platform_data *pdata, u32 srcbits)
+{
+	u32 val;
+
+	val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+	val &= ~(RVTRACE_ENCODER_INSTFEAT_SRCID_MASK << RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT);
+	val &= ~RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK;
+	val |= pdata->bound_cpu << RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT;
+	val |= FIELD_PREP(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, srcbits);
+	gtrace_write32(pdata, val, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+}
+
+static int rvtrace_encoder_get_trace_id(struct gtrace_component *comp,
+					enum gtrace_component_mode mode)
+{
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+	u32 val;
+
+	if (!priv->srcbits)
+		return -ENODATA;
+
+	val = gtrace_read32(comp->pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+	return (val >> RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT) &
+	       RVTRACE_ENCODER_INSTFEAT_SRCID_MASK;
+}
+
+/* Request the preferred trace format and store the accepted hardware format. */
+static int rvtrace_encoder_set_format(struct gtrace_platform_data *pdata)
+{
+	u32 val, fmt;
+
+	switch (pdata->format) {
+	case GTRACE_FORMAT_ETRACE:
+		fmt = RVTRACE_COMPONENT_CTRL_FORMAT_ETRACE;
+		break;
+	case GTRACE_FORMAT_NTRACE:
+		fmt = RVTRACE_COMPONENT_CTRL_FORMAT_NTRACE;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~(RVTRACE_COMPONENT_CTRL_FORMAT_MASK << RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT);
+	val |= fmt << RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT;
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val = (val >> RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT) & RVTRACE_COMPONENT_CTRL_FORMAT_MASK;
+	switch (val) {
+	case RVTRACE_COMPONENT_CTRL_FORMAT_ETRACE:
+		pdata->format = GTRACE_FORMAT_ETRACE;
+		break;
+	case RVTRACE_COMPONENT_CTRL_FORMAT_NTRACE:
+		pdata->format = GTRACE_FORMAT_NTRACE;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int rvtrace_encoder_probe(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_encoder_priv *priv;
+	u32 val, hw_srcbits, srcbits;
+	int ret;
+
+	if (pdata->bound_cpu < 0) {
+		dev_err(&comp->dev, "cpu property missing. Please fix firmware.\n");
+		return -EINVAL;
+	}
+
+	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ret = rvtrace_encoder_set_format(pdata);
+	if (ret) {
+		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
+		return ret;
+	}
+
+	/* Check if trTeInhibitSrc is hardwired to 1 */
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	if (!(val & BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT))) {
+		/* Probe how many bits can trTeSrcID span in the emitted Trace messages */
+		val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+		hw_srcbits = RVTRACE_ENCODER_INSTFEAT_SRCBITS_MAX;
+		do {
+			val &= ~RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK;
+			val |= FIELD_PREP(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, hw_srcbits);
+			gtrace_write32(pdata, val, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+			val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+			if (FIELD_GET(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, val) == hw_srcbits)
+				break;
+		} while (--hw_srcbits);
+		/* Determine if there are sufficient bits to hold max cpus */
+		srcbits = min_t(u32, hw_srcbits, order_base_2(nr_cpu_ids));
+		if (srcbits && pdata->bound_cpu < BIT(srcbits)) {
+			rvtrace_encoder_set_srcid(pdata, srcbits);
+			val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+			if (FIELD_GET(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, val) == srcbits)
+				priv->srcbits = srcbits;
+		}
+	}
+	if (!priv->srcbits) {
+		dev_warn(&comp->dev, "cpu %d trace will not carry source id\n",
+			 pdata->bound_cpu);
+		val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+		val |= BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	}
+	dev_set_drvdata(&comp->dev, priv);
+	dev_dbg(&comp->dev, "%pfwP: cpu %d, srcbits %u\n",
+		dev_fwnode(pdata->dev), pdata->bound_cpu, priv->srcbits);
+	return 0;
+}
+
+static int rvtrace_encoder_start(struct gtrace_component *comp)
+{
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+	struct gtrace_platform_data *pdata = comp->pdata;
+	int ret;
+	u32 val;
+
+	if (priv->srcbits) {
+		rvtrace_encoder_set_srcid(pdata, priv->srcbits);
+	} else {
+		val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+		val |= BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	}
+
+	ret = rvtrace_encoder_set_format(pdata);
+	if (ret) {
+		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
+		return ret;
+	}
+
+	ret = gtrace_enable_component(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to enable encoder.\n");
+		return ret;
+	}
+
+	/* set mode */
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~(RVTRACE_COMPONENT_CTRL_INSTMODE_MASK << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	val |= (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			      RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 1,
+			      pdata->control_poll_timeout_usecs);
+	if (ret) {
+		dev_err(&comp->dev, "failed to enable tracing.\n");
+		val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+		val &= ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+		gtrace_disable_component(comp);
+	}
+
+	return ret;
+}
+
+static int rvtrace_encoder_stop(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	int ret, err;
+	u32 val;
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			      RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 0,
+			      pdata->control_poll_timeout_usecs);
+	if (ret)
+		dev_err(&comp->dev, "failed to stop tracing.\n");
+
+	err = gtrace_disable_component(comp);
+	if (err)
+		dev_err(&comp->dev, "failed to disable encoder.\n");
+
+	return ret ?: err;
+}
+
+static const struct gtrace_component_id rvtrace_encoder_ids[] = {
+	{ .type = GTRACE_RVTRACE_ENCODER,
+	  .version = rvtrace_component_mkversion(1, 0), },
+	{},
+};
+
+static struct gtrace_driver rvtrace_encoder_driver = {
+	.id_table = rvtrace_encoder_ids,
+	.probe = rvtrace_encoder_probe,
+	.get_trace_id = rvtrace_encoder_get_trace_id,
+	.start = rvtrace_encoder_start,
+	.stop = rvtrace_encoder_stop,
+	.driver = {
+		.name = "rvtrace-encoder",
+	},
+};
+
+static int __init rvtrace_encoder_init(void)
+{
+	return gtrace_register_driver(&rvtrace_encoder_driver);
+}
+
+static void __exit rvtrace_encoder_exit(void)
+{
+	gtrace_unregister_driver(&rvtrace_encoder_driver);
+}
+
+module_init(rvtrace_encoder_init);
+module_exit(rvtrace_encoder_exit);
+
+/* Module information */
+MODULE_AUTHOR("Mayuresh Chitale");
+MODULE_DESCRIPTION("RISC-V Trace Encoder Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

