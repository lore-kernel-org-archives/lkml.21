Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016262;
	b=RgXXbOmB2VJROSts4gULZPNnNMxL9BgRRxV6lyrdKX9ng7S7qluh0msPD8Bck5B9eBDa
	 pkUFDxPypw/7+G7fnXY6UApeRCuGB5aOzdQlYpRsbKLYyAZDuYfp61teFCsY9dppmHXAd
	 jA6HsdwohdwqxJ75ORe3k/MIzte5er4FVNfD5PIQGpGoRKfqEppOipk8L5YSPK5HuFzWz
	 FyDy69cSO9r4P+H5cneke/CKD8qs/9v0L1PcCB2l84ko7Ez8SB7taaP14rGgaogQR/MGm
	 NH1dyBfH2K3V4S0YQvALeKcODim6dCD2OFlAI96MCmlCNGc3BDidK3fzbM2sf25lfNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=;
	b=DBCkpyijl0pKhmognn/ypAfL667eQSzoRBnbIO2Igs7irOHGxj7C4/bsYLW9hVgyxbVs
	 Jo6NZLPoDb4LDKdKyUH0Xa8O+I2uS3jTFFGaIzibJl8dU9pjGVGzvkL08Nps0zcEoiZli
	 rHbQ3UR6IhUuhjjXbh3OUzKsV1H211av5hZS7/q4jBBs9kaNezPFHzJhft0KdPZ2ZYWvA
	 mTincS7zqiMrz2FNpqJ7MmIWXgwpyOYelT1HdwP1rtfM/idufqynPvxF1LycfBtMluXup
	 bK0CSOcmUuof1m30LYcWa2tDsHSUAd5GTe1cBPN84TXEp2Wg8fFk249SdFXWwDsN/5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfRL8sS5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ae8C0iUJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511FB60A2601
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 511FB60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfRL8sS5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ae8C0iUJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQMrf3846693
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=; b=KfRL8sS5IZ+OjOs4
	TZHe0MV8TxPr68/KxQ9Fx8zNCRxxKK8GKf2DgLnpNWOK52KAYJAU6acCkOzxtA9E
	BrsKDIECMvChbaV4hAc8QTeqwrtOKIJMqEqLYoLfCOOfOTqe6uBQgTIkO8FjjPTC
	+/aheGUe5sOwpkdpCb4fgjI6yDQyeTwHhKSW4Z2g3iLTg1jH9pGjEQZJDYtEhxvc
	Tl4kKusuMc5hFOfn4g4M9Vcr/nNYBmsrIB6RHqDRKwri9HEK40cL8Evz6ihDhmpQ
	niFGfVIQsckzEjpUpgfIJwY3aQ5Nl1bxvLS+JmRLjxWw+VNdtnAcxkBpRwGTmOOA
	SrQ1vQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvaurpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:37:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92111028a03so21359356d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795016260; x=1795621060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=;
        b=ae8C0iUJQg9uv1NveirLJ8u1yBOkk8GAicXfocwVnAeeMTYKYFmXw29fsWobc/DUn6
         Sut3L9RInrsv6h5IgDTD+D1+XA0TUtPsRJ/xooLJuuUOmITEFhpOHeXDy63h+PRi0ai0
         LaLBwhYiKzSFQNTlSN7GfFZ+LyaeVE52Q0QTZTnUPzHNAZ75yN4qyIbrB6axQdiTPbc9
         lESJyDqwbelhjOwJ1kpKIXZea/8+Ci0wd6b08U7+OanY8lXhhJlbYtmL6B9MpkN8U6rX
         anTqqGuYOTbakhwBykEydJoQicyFHXf+b5sdRBmTF93SOR8zevGxyDhw+CNlTVpXorF3
         ZI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016260; x=1795621060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=;
        b=vdvgb4YGgqfgIXDygidIWh8d+/1xNkSQX74VWaE6aWfPJArrLwJsBvp5Uz1m3oPHvX
         3dTxy0EX2dJ9KceXS731cvPtYi3OYAcpy/OARNvHJrGxxbB6XVyUDsgukrpuTFRGmu1B
         XI07eF8BD0YhMtGe1ZYt8rLKjAvuuvqUgFcbF1LCCMiMhtGYnRUl0EIqZ2JqCWTvvLli
         SIf//arxyGImjah5vGBjT/0r3My9BT8u+xUkbv6ZuZfGEm9t/oPQgLo9xUGkcvUcG6rW
         a/cOoDQg4MTXr3Ve2boK1EJzSluVT0SC2QoSMjTvKtnUqDeH2DQ0AVNv3xkKAPeHJd+e
         cnaw==
X-Forwarded-Encrypted: i=1; AL+hErEUESCdDZ6qhWq+fpeoj/AIUsU3xCvju3A71ksomTlWlitqzwJfo9Am74QHnIzYPC4lg6aMpSF7gjw7x7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z++gRL163d9/+SBZJ2VnAUhebXvfl4kwevD+qB3dlMJ1HsuJPZY
	KVqbnDjNUvP6+f/AV5q8S+ZmTo4e5NIRnl6XRtvUsg+buxFu245QUeUYDj292XI1ipsG/L/8Muc
	NV8AoBwR0ZoS4WMNHlmF5At+fTIpWdDTXAiv/JhCSVZnfOpbtTBX/9yQvkC5I08rS/+k=
X-Gm-Gg: AZFdTZd8yZ4SL+LRv05a24jH5o3ycnyviIUptQB0SHMaYNV8S+Fsv1YNU5uSIv4c+fh
	NJ7aPWZobnA10r7V8UraAnpbunpw3HXIjovsndBgQ4KCOmNbPhFx7X/qvDxJl3rREk1wEn4AYWt
	+kB4nb+bni+q0dEADdpQk+Lzn7UsNVhdsMGChzYs5ICLhrfvVCiX7r7QFx5ye/V+qSADZr/HsXh
	U6t8k+3mHeU0DXGPCg3XvcOg3G/UM4kELk79OixPdOdPJCV7NPD73cJJya7N4R1ab38IkmXhcto
	mFuYxqrgZ7J6Z3jPF+ADBurZOOPfTG8SsMCX4ze6kUlf58add/Ru+Xga2AJt8tSSI9uTcHBnxGR
	e55k8Wr/KBKszAXe/P/XTc5pS++qgK5ueYMJBBnu9GqdFONgcmQokp/CZZ8fY7Aya56OOHkBrUY
	6BXdtYIwLWQil66ZhWr1rsj5mdOqcdbw1rHHyX1ZyaZsSmkJCuCHR5X+AO17Av
X-Received: by 2002:a05:6214:29cb:b0:91e:cb6c:a50f with SMTP id 6a1803df08f44-92114f234cemr46836136d6.33.1795016260397;
        Wed, 18 Nov 2026 07:37:40 -0800 (PST)
X-Received: by 2002:a05:6214:29cb:b0:91e:cb6c:a50f with SMTP id 6a1803df08f44-92114f234cemr46835356d6.33.1795016259652;
        Wed, 18 Nov 2026 07:37:39 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d0d879sm24569676d6.12.2026.11.18.07.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:37:39 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:06:42 +0530
Subject: [PATCH v3 1/4] dt-bindings: remoteproc: qcom: Add Glymur OOBMSS
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
Message-Id: <20261118-oob-support-glymur-v3-1-2cbdfe208d56@oss.qualcomm.com>
References: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
In-Reply-To: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795016249; l=5948;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=cZMcIPHFZ84uL85xAk/uCt5uCJGvCEH/OmSxr9GzoNU=;
 b=rpUnAsQDGdDWgUfoQhaEw7chvjRaMPTlVNVQZe/K3/j1O7XhBeN3ijwnKIwc34Vkq76uoL9uc
 ru7JEgomn4qCTX/OT8Rb8eauV4/HF/Sb2cD7KTH2P03viI1STVApc9Z
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afdc645 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PECRw3tLk34I9mwI6-AA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: Ct0Tl2RMCBsUlzsxSkjwzfpBXGsVgFYf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX4naP2lrjL+KT
 T3gEpE0lA6b1srnCcqMJywsDPj0/CyIMX831RUdjHPE3O3YVbbwNo9kA4kQnQcmRyTBVUx7PiSd
 7XyT6FlzmHKSzdLa9eNLFDuYj6Rlgqlv3BppgH+CYa2lQ6oPtGwMOCvlbMxc4n42nI9ziPk81zh
 B6t0VTIpo9WLQOUOXD/JxcGjmWPmN24hLJOlfTdorJMIOuRRvtko6r4frM6YzdI7NlCZBLhXGUo
 6R2Wlc181koRJzkf7R7kVA3I336cun+2S1C2RNZFgX6ZFdYqmBQJQkuQEhFDN2EgH77hEKSEsgn
 mzsZ4FfGa8MPrNnOqK8BIGDJDxSuZJWtnetUuDaW5goDytn2nOQshdmeP12+QTbxXXonbPpphGj
 gvt3oVCvBD1gRsmolimkObDSmQo0fVj3WX0JNB75rfqImD6gaE4UD8fAF01RVyCybcVAv78AD7a
 IRlWO/S9rSBPDiQGfZg==
X-Proofpoint-ORIG-GUID: Ct0Tl2RMCBsUlzsxSkjwzfpBXGsVgFYf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX/NW+/stHGCT4
 Fe+Gg9Af9tI2TU9EqvXhDAyxgy4FMa4X6co1T8yMJZjxeLNok5oV3EL8K2pD3Oe6MQoaPJAm/9k
 Av5d0ncqy5WFBuWemY64DcnVh0n4zww=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180062

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

