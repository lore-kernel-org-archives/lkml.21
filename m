Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078907;
	b=1rsvPD1nGxbl6bDG65Z5z3wAgjLlQZ223mkSfCAJJmC8dJN7wgQglWV+6BdKbf/upDjt
	 Ey9BPEDX0vfrUElSA1vR1EcVqqDDdGsskk+8894R+J0xADzhHom4k1WqVWu280P9H3iCR
	 I7Z9dtse1eaqZhVJ5aD40TGU9Nm/DKqEMX7DtybsFGJ84OY3zMO1c90kOPNMhyeXToa1t
	 HuYhXMR5zP+zODG7HRYDSs2MDSrZXsekdp440ZGvNpkL1F76ZLd7dlOxlITxZ8yQwcaGx
	 b5ru02vhK1iHjc7PexuYWwWceRGeUaxmmuwi0gsoOtVclqcsayW1PCDWzrYyMxczhCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078907;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oxi+MQ8kXAC6ROWaTRv44mEbXLIae3bz9HNaUOQsmEg=;
	b=lx4VTDOQnlP7S4DyaVfIVe1/P2yDFYcTxskScGAGfDKqpslOqdd/F5CC3NRp53NLgxyf
	 VLjqRqAgf5/VR1mckbMjPuwu5Mp6CIaHmYVU4P0asribkTjZt519l0TsszsVd11O3aiwd
	 S5+8t5MoZcU1vo8Fk8/0TM80YKX6P9C6f07Pf5RHqu9V5hOqTi5VX/DFDIQEyeNql3evW
	 KtcpJgFaxtAWjhMWQJ26Bu81AppQUjxO4v1XBXtSfRnZorh/1z0yXzT+Aq9jHlNCOWKor
	 Y/1oCak3h2Jn9HIIA58ffxarNc0gil0HFt0tWivy3BSDxn3W2ROgDvFOv1J0eItt6FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hBKzV7eg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifC9Z0gZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93851606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93851606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hBKzV7eg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifC9Z0gZ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vGHr1681198
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oxi+MQ8kXAC6ROWaTRv44mEbXLIae3bz9HNaUOQsmEg=; b=hBKzV7egc7qpyYFR
	nAvLlpJdkyF3Idi/vrTGC3XgfocQKJdKyupiPJwEiUr9Rr2TVKxrDMVzKxCmhIFc
	UO+SJNXIkg4taRp/bs5iN1GWOMBlxoJz/PPEnC6jrpctMaOnBM5zTM5FqgZVLPGY
	Rx7gwvEmxIUP0yTyrJOZSD09S6Z5Ta1PVwpdN1mlpxZRgWod394uME37eu87xRXv
	7oOTW5KNTCXJ1UqepvNCIqSrYyluRprQWHKb+XsYlptAAUu6bZY6UqbAyq/oD4Tx
	HhXQhd5bowZwaWuJ+yHXageksRDkBEy2tTPT0JAQ13O1Of+QRN9esFD3n51knRcN
	F5SkVA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdcsxhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:01:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so2516301a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795078904; x=1795683704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxi+MQ8kXAC6ROWaTRv44mEbXLIae3bz9HNaUOQsmEg=;
        b=ifC9Z0gZEOJtPxV+AT2wWhAsvegW5TKMMX9uqwbnsLj7xy4A7oFD6e+DKY2q2GEuhd
         C6aDaG5UQqCo9T9QZom2dXZdm4HbW4SUNzzPUHa2CVFCtPtgBKYZPem6oK7M4ALW1KfI
         fo3MwsCgmJNZzqu25NFoMWi2MyUX5poLUiw5MHgkbwpsGNwyPr/9fIu09WB8yLom4+th
         gxjhdtmowMxMF3SuAQWvFczqWyD7VOCQYpnPOjYyX5oV3nt0zVwmGm4sinnHN5SH2C7W
         N/hLeNQ2utAgENUhEvhYAV8pQjGL1oxSDrVmgXMuaLiAJeFgesEa8JgCyjHhnIg956Tm
         ggbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078904; x=1795683704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxi+MQ8kXAC6ROWaTRv44mEbXLIae3bz9HNaUOQsmEg=;
        b=S4pSYPZxyYsWdpsbJUfxT9SE7vbGdQ4+xNXlCOF9i59rwG7JbpvBjQ4V5dAd4qmtoT
         4fInZpavmsuDFiA/CaTd5uouBKE+hkIxsFPUwMXcX4XN8UArybQOfAGjYYqBGib7VbpH
         3LNfEss8C+HBf6XOsCKK2fgU4WstN8hQxOduqfn6LxknCGDuoPMhOy3JzdYnsl38f+lK
         OfmSpOXIaKGuM9/NQFWOc6FVAyvVn2H/yhnxfGG4U8usu0TBySc6sCQtqb5b/vcxpVsX
         9IF8Vvcb+OUE4zcBK1BPxphaucrIzZFRU6PIHn0FhzN8xY4RI6404EXpH4yBjjjL2MTE
         mNxw==
X-Forwarded-Encrypted: i=1; AL+hErFEjwEabzjry7p6aYiVcS1WbnMH0iYYvM1iObElhpUWAPmTYKI2xuXVfxQCHpT9CJWvAZdYXE4m8fvY0dU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G7li6d1zteEcRNOwX10719hSngpZRoYa5F/RDNRpqT/A4U+4A
	blRYYaNgMORKZuaYUf96elPM/Gb60NhHUo6mpm1JM7B9gJ9YJ8CHUukf5eRXywvQm1M+LpUJH1U
	7u9SQrnmogmAMnGcAO7FzdU8XMDjvq4Pbb9qJzrUINUudun1+kzzntW5YF9bT7uT/2s/bhCelxv
	TQzQ==
X-Gm-Gg: AZFdTZdT+fSmFYXwPd34BgVgAqfb2Hb8pj2HS5rufjxfDiNw6Ds65QXoMHWqq4xcRni
	5LT1SCabJdVYTneG1at1VenA7w9nO1Yz9/nOu3KTVacUNmpiEAAE/+fCQhaBr4rglaVHvPYqd/O
	ka4lCPYmhSKkFVptMIusQYbSLGLXg0kMB98KBwnIf9FXtRPu5paYHnGY1xrg3ROqhPVroeEdzh3
	RQS3hGAwQW5YU6WWeKphnpWqkHiYiLJ/Q7mJ1TzeNAYmjL0q8gpgYQg3wPmMShz5+ieJuSY0Jj8
	qt+c/gTYzUUpthbMwpYc4DkJiBYUMrnsuExb5I6JcGaUzSrbcV8EMNRnd5qmUwjI8mK533bcqMM
	SgDrcikfqt2ivcarJnPTv4OG+KRM5QEzj3hbWrAUTy7xQFV5wxkaKna1Ygb0ibDwVLKJbRzcgRx
	7H2rQCzEmLgaCURSYXTcw0ncrQWN0gvMYooEAo
X-Received: by 2002:a17:90b:1fcd:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3d0764684mr5300479a91.35.1795078904026;
        Thu, 19 Nov 2026 01:01:44 -0800 (PST)
X-Received: by 2002:a17:90b:1fcd:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3d0764684mr5300427a91.35.1795078903441;
        Thu, 19 Nov 2026 01:01:43 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm1689539a91.13.2026.11.19.01.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:01:42 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:01:14 +0800
Subject: [PATCH RFC 1/6] dt-bindings: soc: qcom: add QDCP provider
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
Message-Id: <20261119-introduce-qcom-qecp-feature-v1-1-b1a730d2c57a@oss.qualcomm.com>
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
In-Reply-To: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795078890; l=3826;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=C45KpIlwNH/YljdNNGWJBV58QJEhk0JLA42ndKrZbLg=;
 b=ev1M+t20iPdOBT1JF+M9fv5cK7IESCNZW+J0Xb25OlcWBUp6HxrkiZUYuwxXSwPT6MG2W6Env
 pau1hGehI26AVrUz+cJSIZHv1oGt+KIKTxSRtZ/hkqz8oZ9sr0m8471
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: TbVso5KUke-nc4I3sGrBzJDZ4s8aqb88
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX/jdpj0NiFbLW
 8yAuv3t5fpMArGE/q9iiYyH52iA2xw6MdebaPRowD5sahWMAZ3ntFasRZkiFgKea0YDFM24rKz4
 qoAjsihQdxkmZFV66on3yXHcWT9jIkE=
X-Proofpoint-GUID: TbVso5KUke-nc4I3sGrBzJDZ4s8aqb88
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6afebaf9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=IqNXJOJUzIoeS_XrjnMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfXxaOBrGwkUaL6
 ofisE2UhG/2D1o1cgwVzD2VxbHJX+9sRV3Te8m4kgIjmoT9nVfVUuYBRX+R6uSsXTfJBfhPnp6q
 ex12+rOs+tWwDOvcV5ksOczSy0DtYcTWdAfOion5CSb1JWb1nTp+VTnitTaDt2yhFHcxaSzCXYz
 dJXi3xg0afSie9l9zR5nTI1cXMF43jcqqwP1lXrb1agbp3ssFFt0e9gwfexK81GFQHG+Ucjpytk
 mR//guyKAjYPIpP5XsDAqo0IbOZl5iQo6RXmly3s0o3Z1FbAxcos2/rgstfDmIaSmTqIhBABgYx
 PS13EXBnlDiEG7wpVZKQz6PxGcDOyiQdCEO8HD5khoUoBWTccKFp8En/bpW4Xua6DPI/fiXNz96
 tJObsbihsjYOsRktzr/89M3O3Xd67f3yM3HSCqe3pXpoDVEhg7XFhEzoTbt8Gnojf/hHGW2Vg/K
 EO0xaQXZjDMhujW6dMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190035

Document the Qualcomm Debug Control Protocol (QDCP) firmware provider
node used by CoreSight debug and trace blocks that are owned by the
Qualcomm Embedded Co-Processor (QECP), a separate on-die processor that
runs its own firmware. QDCP is the QMI (Qualcomm MSM Interface) service,
carried over QRTR (Qualcomm IPC Router), that Linux uses to ask QECP
firmware to control those blocks.

The provider is a Qualcomm platform/QMI service node, not a CoreSight
graph device. It exposes the qcom,qdcp compatible along with
per-connection QMI service/instance identifiers; the QMI service
version is the only optional identifier, defaulting to 1.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,qdcp.yaml    | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
new file mode 100644
index 000000000000..ee0a66b12dde
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,qdcp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Debug Control Protocol (QDCP) provider
+
+maintainers:
+  - Jie Gan <jie.gan@oss.qualcomm.com>
+
+description: |
+  QDCP is a QMI-based firmware provider used to control CoreSight trace
+  blocks that are owned by the Qualcomm Embedded Co-Processor (QECP) rather
+  than the application processor (AP). CoreSight-facing consumers look up
+  the provider through a "qcom,qdcp" phandle, naming a specific
+  "connection-N" child node rather than the top-level provider node, and
+  issue typed firmware requests instead of programming registers directly.
+
+  This node does not represent a CoreSight graph device. It is a platform
+  driver that establishes the QMI connections used by consumer drivers such
+  as the Qualcomm QDCP STM source and QDCP-backed TMC/ETR sink.
+
+  QECP exposes more than one independent QMI service (for example, a
+  separate service used by remote ETM/diag sources). Each QMI connection is
+  described as a child node of the "qcom,qdcp" node rather than as a
+  property of the node itself, so a single provider device can establish
+  more than one connection. A node without any "connection-N" child is valid
+  but provides nothing for consumers to reference.
+
+properties:
+  compatible:
+    const: qcom,qdcp
+
+patternProperties:
+  "^connection-[0-9]+$":
+    type: object
+    description:
+      A single QMI connection established by the QDCP provider. Consumers
+      reference this child node directly via their "qcom,qdcp" phandle, not
+      the top-level provider node.
+
+    properties:
+      qcom,service-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          QMI service identifier for this connection.
+
+      qcom,version:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        default: 1
+        description:
+          QMI service version for this connection.
+
+      qcom,instance-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          QMI instance identifier for this connection.
+
+    required:
+      - qcom,service-id
+      - qcom,instance-id
+
+    additionalProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    qdcp: qdcp {
+        compatible = "qcom,qdcp";
+
+        qdcp_coresight: connection-0 {
+            qcom,service-id = <0x453>;
+            qcom,instance-id = <32>;
+        };
+    };
+...

-- 
2.34.1

