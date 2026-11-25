Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612704;
	b=cqORwE+GMMilAudiZvjGJ04JPCnSTBvXKz/eLNneldXHErHq88Y6zZQOkkO45OPveGID
	 +JHqPDM93pm1Gz5BejctMf+G+viOyn+0I1aK/a9f7KAQ6ZmXCJiGBNnfPuA8B/7LNHh1q
	 UFvRq1XhALzVV9lium6W2DnoMTSqi832gtrX02OqklPK39xZICJbQKpUhZnx/FR0ilKq0
	 78A6kZawnqv0eLy3/gqYnoHg2QD7z+X7gYBu1magZJiTUT5p7Jo+V+hQG6kBgF3wdh8w4
	 BJFK9Csks2aN0J9I8TQbUYk/ffLKXjuUecKvS9w9n/80ye1XbQOeWObDCSyXkUOiMwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612704;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D0rA4mbm0SnOvC13pf1fD8JRZYtCZj00L/zRbkMsbxU=;
	b=2VAWpx2/l0coWDFR4PcrWClCF4iJXLYqoH3169MdO3JajxYjWtnSDAZm8PQZz5aLYYR1
	 BGXdtTwwskD2eRppudVWIoAc3z+NYrimL5x9wv4TvPexgFR11YHvV4YC5bIP39ZBp4QfO
	 /OFoi8miqNt/b9cKyZ3LFjCz0t3WaCoD03+mD+ux1ccTxMaKKmv8M8x6gpuyOjD0V/par
	 UnCSl161cwQ9HtiDEccjfW3oXoHJ0nvV4PWZ1dAqK/qJB5IjhQwGswuK700aJk7XBjKvW
	 mtUcG9kbaWMy3PdceVDR8Zicwygh1WU3PwX+DG1jrR5m6Yr6nPZs/54h3Tp4eq40NVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YsH/mTW8";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c6dhz6dN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B79606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B79606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YsH/mTW8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c6dhz6dN
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mHGn4131158
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D0rA4mbm0Sn
	OvC13pf1fD8JRZYtCZj00L/zRbkMsbxU=; b=YsH/mTW8Yfze59pzM5U4jIYv2AR
	BxHVjutTBhlqU+LBEjrFMFvNOZLZndmn5wfLF0IEWgYaZnnRc2s+QXSaUX0xRHJC
	LUyNVan2XKBTxTj0+gSXoU7stPJ2/fSrRY8JTiZeDoIL7O6S06vR76kdu25obYEA
	HGTJ0Ki6JLP2aTfyU/FHA9oquSZR7MHlxHMchdhIdgU0g96vOwF2TByBon7oJgZr
	0P7YXTRzC5nLQLEM0FJkHQbXDVcUNVuY8/X+9EtlxatAUJmiHwc0UEKgbEGEZCnq
	8/2mRMF++2pns8NMIrdqc2u3wsUKIa4ZT1PKh/isxQgNjsxl2jS3/hcoFyw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhs0gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:21 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ed100ed770so509184e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612701; x=1796217501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0rA4mbm0SnOvC13pf1fD8JRZYtCZj00L/zRbkMsbxU=;
        b=c6dhz6dN3FwuJ6WDuZdvcEA7x5ATZMTXQDkK25+dCgcWYQE+KaM1NyxDYuSrrMULLV
         ZwwMhsYJ4xb7lfZ2/4SpbxAj57UXFEzbQ6/u1wkBpUspgIXZs3/GgOkyocFgdkb4sQW1
         xGhsBqzlJ6cQEOm3hKxnWHSweZKwCdmjjuFrZSkX05Zugjl0CbA1V+lyTHb/W/97LLUL
         dtqQ8MM0x1H4XWEs8WBiUhkiakKZlONMEII7CFnxLfkkfFpl1ayJm/ghHORc8lUPyjwy
         mzBX+kt9ArcdxSXvAbVGWOVG2ZUTpxgLD9yjXvoKUfrPblGaYoCW3n/JA4Kg+5C5WAcy
         pGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612701; x=1796217501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D0rA4mbm0SnOvC13pf1fD8JRZYtCZj00L/zRbkMsbxU=;
        b=vGcpkQbaGn0LyhYjLe3NizhQsPlw+j6WktOOjmP7cHSSdqe8IgCI57ScfndSXpxfPE
         fRYVm7v3WhAPfasg7eYNEVC1Ocx+XX5WjQnUk3Unru9F8qG36149PChULBYBMQ+vpApc
         O4mY6r7/0Lq7u0whhQSgmXC2HN/RCNsN+EuemeDbJLdoUCyBQLo7fQNrbXReDt6LBOHP
         bcuzujMwO2Vp3JcE02CJdnjjBQErJps9wn0Ex6Fbad+kOsXihcYfiMhqC4DtfLFs0fkh
         U2mz6py2DEred3tGS6Z7Y17FxbingP2fnRjNT6cvjHhEtonloC2IGWcuNvlUNCZYhf1C
         u0KQ==
X-Forwarded-Encrypted: i=1; AL+hErGq4KSBlEjLAGUGvBiqQZ9EIB+rHyvCDMsAq6QaqwjsklsT2i+2vstNodemQRwYxZhLKpNR84WXrLnmheg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ymy/a+WNNcGd87t5LVDQf5WiVyPbGD4zJ9eh3wngL2km1HThP
	QvXzdoPD8lzEW7N/9VgtXqxuOdus4DTXC99BEfPWlfNJll/JfGCNnTJp/mYWbeznNU7SJJWTYG2
	oun8f/MjUPoZVH3uH7nPPUZwvI/+Y01cuorKvrDnU9vg7cOqTOG2vHNe4ilMVsv1SvTI=
X-Gm-Gg: AZFdTZfEp6e45Vvw5TQG5yHrh5pX+bF5OPVBfZei5q0WsTywCRRRtXZjipwqbfY1kdO
	E8TpZ0B11z8w8WF4hAkjxzhEBLuzJEUvA04suq9CIIn6UmRrZmbGIiw1ZaKJR75dWODRTrKowfp
	pel/Jhk7bs5Rj97xg5LNt6ks5poAxMaH65F6POu3XKNJHKnaV3XGCcYZo62aAyo3GdDugNAAhWN
	RRVpb9btdqMWD23nUc0lA7/EkUOW6VrK3gc5KfRPvx1Og9kr0PC+Zj/VlO34/ge6TuhCOXuvOxL
	vBV4hnA29q5sTqwz8MUO5Ge0BpDQydqlQ1lB4HSqnFgU3MZ7dGYWy0XIuPRwPfyGtwLt9Pvd6Mm
	dco9ypw9V4Qf7uElJh2C/0ukCdTRYDnV57LvGUOdby9XOD3EqJw/Aq+eCzt71bZh4
X-Received: by 2002:a05:6122:d03:b0:5e4:f6c8:b0a5 with SMTP id 71dfb90a1353d-5ee8ad0eb56mr9557104e0c.0.1795612701248;
        Wed, 25 Nov 2026 05:18:21 -0800 (PST)
X-Received: by 2002:a05:6122:d03:b0:5e4:f6c8:b0a5 with SMTP id 71dfb90a1353d-5ee8ad0eb56mr9557053e0c.0.1795612700624;
        Wed, 25 Nov 2026 05:18:20 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:18 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: clock: qcom: Add LPASS AUDIOCC reset controller for Glymur
Date: Wed, 25 Nov 2026 13:17:54 +0000
Message-ID: <20261125131757.1163466-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06e01d cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=peyyOT9P35Ab0jvJzsIA:9
 a=hhpmQAJR8DioWGSBphRh:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _o3wGOmX2X57FU7EktFWiip1_wDXitua
X-Proofpoint-ORIG-GUID: _o3wGOmX2X57FU7EktFWiip1_wDXitua
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX8xZK0Gp19lte
 2pPO2uBphAU9ZB+FmxKMQntisj2VXW/kwK1HxEFyHELGdMZGcoXRvhqopNR88nD5y94XB+YYcS8
 5gmExgNyb7nR2gAPuohmGTbDDVbsCgI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX5x4jYe55xTUW
 s8ISqhZ555vRU0F25n/qoRod3Vu2FS80LBLMCPMPycFumDkHL9n5NP3RT1MWc1xfto6oEtoooAw
 nOXyUB9S8UkucFHXuiqMzqnZ1si54SU96gvwR2FDHTlKOCpOyBUjB2jJIrvlFsPQK6vH7yEnzOh
 YoEWWPtzjjHEuBUuhWrtCgNkTYEm47VzIqOLq22Z/Xo9B38EsddWRaQr3fYv3Xe+FHTsiuDDhzF
 EBiDTC+bz1no4TWW1MbfwWeEryZ+P4SOSbBrogG99qBTVwOSPbMt3fWr1h+05EqPzUk/HvVYV/F
 AZcTSWrP25afiFfW/JrDX1PqITVRTnhsFZaxhRTCV+Kq+BBgz/SsKMYcQgQySJU0+6BjpDnxT9C
 nrsDUKCeBqOCLjUGmaEOTp/3UUBD65pnGKH8jl5KsijUW/m6TAbO44EggzskwIblSY70w6mALW8
 iol9m7Mk0xWrOVZgoaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052

The LPASS (Low Power Audio Subsystem) Audio clock controller on Glymur
provides reset support for the SoundWire RX and WSA1..4 masters when
LPASS is under the control of Q6DSP.

The programming model is a near-exact match for the existing SC8280XP
LPASS AUDIOCC, so add the qcom,glymur-lpassaudiocc compatible to the
existing qcom,sc8280xp-lpasscc.yaml rather than creating a new file,
and add a Glymur reset-ID header for the clients.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml    |  6 ++++--
 include/dt-bindings/clock/qcom,glymur-lpasscc.h  | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index f235b4e24cc7..a25e043ab894 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -4,22 +4,24 @@
 $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm LPASS Core & Audio Clock Controller on SC8280XP
+title: Qualcomm LPASS Core & Audio Clock Controller on SC8280XP and Glymur
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 description: |
   Qualcomm LPASS core and audio clock control module provides the clocks,
-  and reset on SC8280XP.
+  and reset on SC8280XP and Glymur.
 
   See also:
     include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h
+    include/dt-bindings/clock/qcom,glymur-lpasscc.h
 
 properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-lpassaudiocc
           - qcom,sc8280xp-lpassaudiocc
           - qcom,sc8280xp-lpasscc
       - items:
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
new file mode 100644
index 000000000000..3006b12e385e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+
+/* LPASS AUDIO CC CSR */
+#define LPASS_AUDIO_SWR_RX_CGCR				0
+#define LPASS_AUDIO_SWR_WSA1_CGCR			1
+#define LPASS_AUDIO_SWR_WSA2_CGCR			2
+#define LPASS_AUDIO_SWR_WSA3_CGCR			3
+#define LPASS_AUDIO_SWR_WSA4_CGCR			4
+
+#endif
-- 
2.53.0

