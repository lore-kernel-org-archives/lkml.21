Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677353;
	b=FkZAT0WxHj6jCn5Q6Sg9iP/Vtl0DU38xWuzJSMzVAJboCI2g5MCy+ZyZ8YcV5rOwG35k
	 1Ykn+Dt4V0A35XAZXhWkQN5KqxJT/iv/8ey6B0LhLGa5+x1p4H+a/w47qoEDaBk2wMmiY
	 ln2PmIJEi2DJPGjL2UKjx98QSdr5X7fPWE9F6zVw1Yf6AKevuJYIHpy2ZfQG2bCdF7XsL
	 0vRUB9qDLpblZ74S00Nvc4KeTFUADacgUVSc+229IhHmw5jmdAG+3Ad7avd4fmZyS6Gii
	 pyTjB+3RFnYjPR81sRuGXasQSBLHPOrsQJQzYjZwQD6aH+gy0XafBlzJlq9ddClo33w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677353;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=;
	b=1JPTYHU7iHVLLWxLQRFp15UKIUbHwbkfbBkmJeqb26gKrSGVNKW8rsu3Sc29oe/Nk5sp
	 +200guXXNvMOEXhgoF8LqksXnxonPKu8+vb9J19RRMaf/PD7wrVDU8YNYBe7qF5wGU00Q
	 wCsgKut5EzBV5DUWXfDcwi+FHPxUlkq2NENDI8+w1mMQywCf1MLNi8jyXpxU0zqJFs/iv
	 MEig6H2lcPdbG69oiElZJUVUjOKkOh14KjyutXUTLyjfZ1JUW/8AfzmUM8pF4B4Rwbuy/
	 aEip1oyx6wuw0wkjiY9HyKEVkJ3TMy8PCCIUGiJ4Br3y44xn+Tpn4Ib8T4MRM282gmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ivvIZncQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H1Tbcf5M;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522EC606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 522EC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ivvIZncQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H1Tbcf5M
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B3oO1682473
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=; b=ivvIZncQAlOB+srW
	hMLOdQEH9/lHXBDNFiuLpk8LVcuLfSzdzw9/F9lgg8UhkwIjFDr9BInC5bayXIdS
	WkcMHW+PbgbITLdUZQa09yazQs/rtnX0VpMJo2aK/j5T3lxdQRbofRR/LSaqcsB9
	LVCK5db5s05W0og1yRHjo6u/oxWTY6efOCk8xx3AKLBlzQM29GrwJ+w3A8ZSB40j
	lxzMSlz8COj/g2fWXUIr56iTl5Wx6fZmmKBrQLInhrCKQhAS8EOgPOWkI1aMoXYb
	LTe3/yt0StW2meLhN+rssI08I1LfYUwABxfFguXs8hEP0/YK6V7oJ7xM2IJSegR/
	0VWW4Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aejx38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:15:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b6463f95a4so5478924b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795677352; x=1796282152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=;
        b=H1Tbcf5MmHjLtCdxJryekI0CMEcxWtiPQ2oUKE3+aKaR3rdDiOpTfpuaZjxk3o9LdO
         idL4G0HmHAjzV9Mz26RRiboh6DBDC/v2hIud1GzWQZztO9GYyrJD6zmP64tCWyVpbeLI
         07gNXUhXP4teY3vXnNYX0wFmJptcJ8yrB6Uqtb12hwVPSd1+uwZmyzk+Z21OmmtvgZrG
         NG8YslM7sUa10RG50t7/MXhos/8CV9i8g5dzF7EjJ4Kjdi7m4oFLgIGd52nUAIJWzwfY
         G9bKUAMk5+Jh4FBF7YptVmOyqbjjJ0r3Y0gUXz4SUh4+43ETtW2RLuQo81B5I+MCWI1l
         DyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677352; x=1796282152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=;
        b=IKad4W6IS1LBTtTRcflirwSQoaV7VKMoadmxGIZXJxpS7cBn9XpUWPWP7a0AzuT4zB
         9mC5lY59PncP4kh8pexFCUQGfBoir6gFwwfbmsXI1KoyuqDWfP1uDfo92v08O4gZcV1y
         eg35YHMerOgi9bbieJCeeyv/BEGDHUuZtOC8uQVnOEQNVN0HVtPkWKA1ociMcf/wWMZP
         s5xfecuJW/oyF7lq4ZZx98PArNLCe0aSqCu3NlfRD9TVb360yNG+7Ikemzk2qLmFqd3M
         0DctzdfClx2NYO+ArnEVJSv3/J737YNuoTuWj7v8CzPDZBL6Fl3++2tHhJmokOHxEdBG
         acPA==
X-Forwarded-Encrypted: i=1; AL+hErFsFHwtU39UZSZ5G9sG6fAgmxjMfOHK5d1waPBHfvoewCa3p28FMi9HXO1J752/tFJP6szyxwfuwnEIBiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lDyTA4L9CiJB4/+x2guLrrnpx5xuiti+OKJwUXFY0mFqDUyQp
	70r3Ec4Sq2bLxGTMmpfaeJ00ILUiYKt2DQqf8ZH8fBHUFpwfEk7hATbM/pSbdFMwz6SHdhWDHL0
	pD1o/YfwdzXxjpYpkDIdZEvWuGz4nfLEYi5QJ8KXyOYhPVlZPaqjy9PjmnIZxnhDAq2Iu9tU30w
	8=
X-Gm-Gg: AZFdTZdMuix3LiilpgYdv43a8BJNyx0vY2OZrdg0NVvzntAviStXQAtB1mr+kgrUdIO
	414LWiTkHg979WOgmlhpMoFMoXBW0tSUvSpOCdr5AEPlpK6kxmiC3LWhFDccOhfU7QsXCIoy86c
	bzGGoPELpQZvdEPC4BBHsJ0SQSO6vVx+3er9P2BP6cQ9ZDhueL538dzokPgaovWxbRStUSl477w
	LmzZtvbvyDIWJL60L/ypvk9fWOEKN3gebtqrLdzgwrAVMpswIZ2O9JeYvXo+gFoF5veV1TelsYs
	1dbW6sWvNP1XD7p3Vok7fUByZGcPzhc1hBtUSObDxIwBL7ycjS4ElEqF8W6GdXvufLfPY+ZX0u+
	UtElEkgBeSZnVSr0/aZrvK7L3lKs/jC6hFofbrtOrneHkBcHJwJko9X0mG7BqVfVQq/bmtzJUTw
	bzRawpNKyAMn8OajyFQg4JGwnme042GGO8fMeiANlX74UzgcAkOfU/GskT1u9X
X-Received: by 2002:a05:6a00:14d6:b0:89e:71df:d6d5 with SMTP id d2e1a72fcca58-8c87bcbdc8emr18282109b3a.10.1795677351780;
        Wed, 25 Nov 2026 23:15:51 -0800 (PST)
X-Received: by 2002:a05:6a00:14d6:b0:89e:71df:d6d5 with SMTP id d2e1a72fcca58-8c87bcbdc8emr18282081b3a.10.1795677351165;
        Wed, 25 Nov 2026 23:15:51 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4c43bsm10050690b3a.26.2026.11.25.23.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:15:50 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:43:54 +0530
Subject: [PATCH v4 1/4] dt-bindings: remoteproc: qcom: Add Glymur OOBMSS
 PAS
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
Message-Id: <20261126-oob-support-glymur-v4-1-ad4ec5dd4b0a@oss.qualcomm.com>
References: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
In-Reply-To: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795677341; l=5948;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=cZMcIPHFZ84uL85xAk/uCt5uCJGvCEH/OmSxr9GzoNU=;
 b=RQaWH2w3JDHLJr6yBS4ByItJybczJdMhRhV6/dt41gC7hJ6L7ozxOXMyMvuM5nuMoEopFMvuM
 /cqhJyQZkX6DMqytYnU8oKapxRZClvS+Fdage7PGgX+W5JDqvv2ZISh
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfX3iQ/MNFglmPr
 831vjfZFY5Li3CTX/48FJALn9xuSfJLvNsGObCEG9EuQeLGe7nBfQKQSn3S16D5EgDDMcYG1QZD
 Z7Nd93yz+FcwBkFH5+7MNjtlezTlgzJQGUUPTe55jNxxUGqqIUWXVfycYnBg4FH13TGaFLX2rj0
 13fa3M/ZmcamCCQfUPTFnLr3QHNOFA9z5uZObfLDsueIIBhnJs5dOLltHCpYidWj0hzyRymYj1r
 aNpFOygTr1s3OQ7q8Cp9KyvB7gO1iAAfsFov8UbxLC7LZ67E7xthyk4IgTxBZ6Gmrcq1oMr9rje
 bzMqivnNNiyovibyDYV/Cuub98d7PZjD5vKh1CWJPSwB32CFtgA6HLAl16gwUVD+kAYKRd+l43J
 BH6H19UcyW8xbmiW1BvY6Ui4QrfCE0e3FYOxtuB6CP6rEWB2tF7limGobvqVrpQpiAzCZooiV+s
 tLsXC9WdpvnL3/F1Btw==
X-Proofpoint-GUID: xWQPHlU2ZUNmsyrCsTatyW7a37HIAtF3
X-Proofpoint-ORIG-GUID: xWQPHlU2ZUNmsyrCsTatyW7a37HIAtF3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfX6fcPIQQAL+hG
 IFNKopoqrL/T57Lr2OAbvX/0B7xmqztLKPZ+fUttfHalf4KPdAWFHSlDQNewi2sXpenNb9yp2Ff
 yIdiF0/GKCjEeziv9nF8rzohn1erVfo=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b07dca8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PECRw3tLk34I9mwI6-AA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260027

Document the Glymur OOBMSS PAS node with its secure GLink edge,
shared-memory signaling, firmware carveouts, and power resources.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../remoteproc/qcom,glymur-oobmss-pas.yaml         | 154 +++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
new file mode 100644
index 000000000000..3aa96d2262f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,glymur-oobmss-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) PAS
+
+maintainers:
+  - Anvesh Jain P <anvesh.p@oss.qualcomm.com>
+
+description: |
+  Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) contains two
+  processors running Zephyr, managed together as one remoteproc instance.
+  The Out-of-Band Trusted Execution Environment (OOB-TEE) is the primary
+  processor. The OOB-Non-Secure processor is an auxiliary processor that
+  depends on the primary processor and cannot function independently.
+
+  The primary processor runs the primary image, while the auxiliary
+  processor runs the secondary image. Each processor has its own DTB.
+  The two images and their DTBs have separate PAS identifiers for
+  authentication and dedicated reserved-memory carveouts.
+
+  OOBMSS is booted by earlier-stage firmware and uses an XO clock and the
+  CX and MX power domains. Shared Memory Point-to-Point (SMP2P) provides
+  boot, shutdown, handover and ping/pong signaling, as well as fatal error
+  notifications. The subsystem exposes a secure GLink edge to the host,
+  with doorbell interrupts provided by the Inter-Processor Communication
+  Controller (IPCC).
+
+properties:
+  compatible:
+    enum:
+      - qcom,glymur-oobmss-pas
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Pong interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: pong
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: mx
+
+  memory-region:
+    items:
+      - description: Secure firmware carveout
+      - description: Secure device tree carveout
+      - description: Non-secure firmware carveout
+      - description: Non-secure device tree carveout
+
+  firmware-name:
+    items:
+      - description: Secure firmware
+      - description: Secure device tree firmware
+      - description: Non-secure firmware
+      - description: Non-secure device tree firmware
+
+  qcom,smem-states:
+    minItems: 2
+    description: States used by the AP to signal OOBMSS
+
+  qcom,smem-state-names:
+    minItems: 2
+    description: The names of the state bits used for SMP2P output
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - power-domain-names
+  - memory-region
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    remoteproc@1f000000 {
+        compatible = "qcom,glymur-oobmss-pas";
+        reg = <0x1f000000 0x30000>;
+
+        interrupts-extended = <&intc GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 9 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack", "pong";
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "cx", "mx";
+
+        memory-region = <&oob_secure_mem>, <&oobdtbqc_mem>,
+                        <&oob_nonsecure_mem>, <&oobdtboem_mem>;
+        firmware-name = "qcom/glymur/oobmss_tee.mbn",
+                        "qcom/glymur/oobmss_qc_dtb.mbn",
+                        "qcom/glymur/oobmss_ns.mbn",
+                        "qcom/glymur/oobmss_oem_dtb.mbn";
+        qcom,smem-states = <&smp2p_oobmss_out 1>,
+                           <&smp2p_oobmss_out 8>;
+        qcom,smem-state-names = "stop", "ping";
+
+        glink-edge {
+            interrupts-extended = <&ipcc 56
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc 56 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+            label = "oobmss";
+            qcom,remote-pid = <20>;
+        };
+
+    };

-- 
2.34.1

