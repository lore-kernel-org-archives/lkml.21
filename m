Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687075;
	b=bwAvJJcCWQUEv6xZhVe4WUOYEllJHFGPXg71RM+IjO0LcvVmhGMYctAWCUp7bBZaZSRU
	 Tv6B4lr+fD1N/Goj0fBjExbyo8dFO2Ny0w76Obfs2k5WCGB9ZOQEqfJQyVvtbXUNXHelt
	 CtRP+7aenWI1OWMUisX0wAELSfSF3toLT7cLNOKIwEvGC0gsJhTNFPKVFr/uxSCw5e1rw
	 0PTD9rfdGGMS1s0dXgVLMZI6dJkstPF/CoWbe4Yi599wxIf5D/0DDpfH/zOqcp3WUWJ9v
	 hydPlQYW2/bEOXRbj00N13ZaefiNlugw0/EHApFbdA2gdygFbXxboyxcamRsyCqIrJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687075;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V5bOdURA8FVOA/hZUhmlwnRgu1GR98lkW/FXUKup9B8=;
	b=WVisiqXnCOZ7YIwCQgrO8B4JkvZhJGF/n++o1wZ7swwhxmQRZeEG+r8i3AM6rkAYYvMk
	 1qnIJKxXS8xMLhjDNyZQU9xiXPJcaaO3bsWT6Nob6FPlkXChCWdJMQGswrT//1aijyEC0
	 V1V1QHBCWobgtIpiqv0phKIWKYdwkt7u1fuJTXA+XbXe0JhGgf5OgTPYytyU0O/7TOojH
	 esVEPD1S1b6H8hCH7meHFBmWJ63SejCSKQaXi8gPgt3iZ2YsAk5DLGvwvScvY6a6IElLC
	 kluZ1z6EKwjLgOI32nEKX6UjAMlcdJz5d0kPbd+WxdPueUeBrDL81Mwhlov/qZ8yxOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fYchbVi6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B69B63vZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF718606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF718606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fYchbVi6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B69B63vZ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BArj919580
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V5bOdURA8FV
	OA/hZUhmlwnRgu1GR98lkW/FXUKup9B8=; b=fYchbVi6CTlUVo/KWqt222aUOmj
	UIZL198acvWlJ6kMbJkrCvQDUtc405cnb/zRUtd1/VGM/Q4G8g3pdGeAFAdwzeLK
	E7y1drA7aOONrzRSAsDZrk3XLFJYg1YERgJp1Jrzy8H8dlbRBo/w0tve1ibl3EGk
	LdUmYu/rckMwlq3u7ID8P5E4d8HkuTowOggACQHmQ5nzBosJl9/tXlUyZGpG5yua
	jDyT083H+rjbxQ4t+DWTmuN2+huX4hYxM+/paL3sf3oi2B9epezozOFlZNyGbgW2
	NYYDDxV0DwHYbP4a1U1P4LmtDP77X1nMW0bJ9/7ukTHYAciTM8d1Yk+Q+KA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2hre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:57:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f03a137f6aso60308355ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687073; x=1796291873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V5bOdURA8FVOA/hZUhmlwnRgu1GR98lkW/FXUKup9B8=;
        b=B69B63vZushI4xB4yLPerkG13f2ZWmzRrfkjB8zk9HdBT5J2AE463HLeOk4wgssyRi
         57bUVby4Zrx4funZBm7M+JQI/do9oHnvO15G7vI170i0qHGBHbspfYjx0ueLbkvpDRI7
         M8FVrKIR6HAEFTfm1FrzCQVjRpad2lNLKeCxvGfEmdZRCkFvDF1Q/hMzZ204OewRq/Fm
         yMhxnc4/n5PkZeS2app4XqZ5l9khPjGnCOKLz6eKb4jr4ZFWZqSM4owUo/I8AGeLkDNa
         u38fxKV7DPfx2bBsVUHTx3jadCJpqowG6TeFIYeiTbFaj7hdbGDRHSmBrHDC4v4CgORw
         iYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687073; x=1796291873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V5bOdURA8FVOA/hZUhmlwnRgu1GR98lkW/FXUKup9B8=;
        b=HmaXe4DTsZQMc+zgUxvJeDfzT4aqL/c4gjUDcX5xsdBeKohnTyDJ3QWUI/qcSB2q9z
         +ZY2cy+zDS2NSiW95MsFH3yb6E97DeEp3gffX8d2ccTJujAwA7BPBe+dFS++IL4KLQMZ
         +nLXuqT6QpwnNbdAPf9FxXxpVZnE0OUiZBFGhFhfSEkC+wd5P04mEziU/sh/ISyxgry/
         tNPMWfU4Pp1yXijNufwpmiAM89bfVc6z7JK3MBiZmT4WiMN3EU7xVtG/1XtFFh9J7Cgf
         H4pZVhpZS7WMoGqcXoIw6jkKtFSspEXXMrfYwosarzXM/W5S1rF+AWRTK8uTu7OAhIrP
         7XRg==
X-Forwarded-Encrypted: i=1; AL+hErFfh756Z9teqOl1dWVv2RsWcX+J4+vHn1fKhX5o7fjVjD2Jo04YPOKKt4ZZ1ICs7BAV7N2aqQJ3m7/+scA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XXZyYmArtwySehUeN0s9mc2kI7WW6i/G062fKQTmKq6eV/6mr
	Na0O23Jxp/pvVuJ2NZ0mumPILK5yoExQyrFodb1mrywD8Ueuq1U7ZaSC9c261P7sJoex4fBZBWZ
	omVhZyR1c4jZdxnD3R3WVhpkInrBc6Yq+CxqNyGWj3laLMIKKSWkD5ChdogwUGxYYd8M=
X-Gm-Gg: AZFdTZcGie/iUK7QzDDRq8R0KfyeTbmITCvZbZ4SgXQVEaXeGacCV3A3M33JeJfqLua
	C7IeNSZPt6Q+tByXnNf/LOs7lrEN4yYyF8+mm1brDrr2HG1MmlOJRrnCjWiJx2F+EeZmle4/4sL
	VijLyAGVGXNb8Bg3ma8iCuxRPqRuEb+MIFnJWFpjID3zVnxwzgCN5FUKOiW8rQIrQjN8HyGyQXW
	Fw+XvKxrL0V+Bn2KyWXvrvG5cufPjZ/BmwP0W93cD6GUiKN31NqhU8pTpW0ISIkJrdt0r3ljI5f
	7Z403JkLnfr0k21QRSyvOjnouAoXiZwhFSrleVjdPU3awLwT1dUNEf/e25inN0n3l0bS1O9C2Zh
	aG8TQe38BF39QyIIRTulZFRMWZRFAuV978/8R6sFUWUZYlckzEB4vsq5vv9FA3M+zAf6Q5oQn6e
	0xAVO0VUfE7Rs8ZJQmXgrJU/AwA99UvzEhktTgjG0oahXtEkq8FXfVGAOw0WJsIZzmqbilg+1DU
	Q==
X-Received: by 2002:a17:90b:2b4c:b0:3b0:a7b5:c037 with SMTP id 98e67ed59e1d1-3b41c7b6145mr19812374a91.1.1795687073430;
        Thu, 26 Nov 2026 01:57:53 -0800 (PST)
X-Received: by 2002:a17:90b:2b4c:b0:3b0:a7b5:c037 with SMTP id 98e67ed59e1d1-3b41c7b6145mr19812358a91.1.1795687072994;
        Thu, 26 Nov 2026 01:57:52 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:57:52 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 14/14] MAINTAINERS: Add entry for RISC-V trace framework
Date: Thu, 26 Nov 2026 15:25:35 +0530
Message-ID: <d5087c1c7ce28317339739df2fbbfcaa5838243d.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXz6+4Ty3s1ED9
 8Xp7qaqhxdug6YhsN2s4FQUj1zXUMmYGX3qCTIdzkPBB31362Dz1+uamsqqQMC/eewy3p33oZgg
 Lhp3lYEj5shE7w0KNWiUJeztJNMeZbNepRfNz/AjzP2F29xYgh4R9jT479ZSeXrax45QinllxMg
 3FdN6TBCLqNggj2hVM4wEMxbOQCfE9iKI14K6cAOjZGptSxWyan1ZFdAG0MtQ+TsOpap1PznXiZ
 G0AW3tukNaXub7avfj76BD+p6P6f3kcdQ8W+g6+ROPLsajHaYaUiIjlhPP63h+Xf8Xc66lqt/rv
 VVg9oSu5r6pyheO0385tZyMAj+meuPk4BQJ7voUuFzJS4chNoGkuaaLy/NzC4l+FyY6Q8CWlNlK
 Zc9okNNhBA6YV3zOvnr7pTcTjxIjD+5joQz1tlSRqyUOxQh2++GFeKjyR9/qp2BUQGPpyKmABQU
 17s/I7EwaeL1Mu1RrqQ==
X-Proofpoint-GUID: tvVqC7OFKd_xYiveqSuuQjQGOV_MJoU1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX3xy9r6mDLh6J
 ieexkyoqZ8Mt+B63gSw5q+SKzim9lfTDPllDXFwxTTQRY9hjUocIk7hIJ86X/0rpnhzz/ZhlhOx
 E/DS+FZ7338qPEcDy1uz2pRL3dSu8So=
X-Proofpoint-ORIG-GUID: tvVqC7OFKd_xYiveqSuuQjQGOV_MJoU1
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b0802a2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=W-_n0kkjAAAA:8 a=JfrnYn6hAAAA:8 a=UgJECxHJAAAA:8
 a=hzgbeqSfhi83Ps7mpaYA:9 a=324X-CrmTo6CU4MGRt3R:22 a=qeNa2pbTr82C0GpJEZFS:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=-El7cUbtino8hM1DCn8D:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

From: Anup Patel <anup.patel@oss.qualcomm.com>

Add Mayuresh and myself as maintainers for the gtrace framework and
its RISC-V trace drivers.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 742c4e6b291f..e582686ab218 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24318,6 +24318,17 @@ F:	include/dt-bindings/power/thead,th1520-power.h
 F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
+GTRACE FRAMEWORK AND RISC-V TRACE DRIVERS
+M:	Mayuresh Chitale <mchitale@gmail.com>
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
+F:	drivers/hwtracing/gtrace/*
+F:	include/linux/gtrace*
+F:	tools/perf/arch/riscv/util/auxtrace.c
+F:	tools/perf/util/gtrace*
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
-- 
2.43.0

