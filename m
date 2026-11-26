Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684044;
	b=vaMIvn/7B10mJzbe87oDxn16WUwrpeAJOrtYEzhHrdoJLPhXee/rurtlhBKRJhkUoD68
	 kz9uwzKo9YRaCEKbYUts7hEiFrhbzCeOoUiZTdu3QgutxHuvvyvYjiHuy/CRJEmtqL2rE
	 UagDPMQS0xDme6xSFF3NaVpqmwmXPZpqdFZuDu75NrazgqiuOinR3vFIzBUcikhNZQ+Xh
	 PaQVT3IXtAiPJQ3S4z4l/eTs8gcan36vOuZRktsv9Dt7wytAQsvIrZ0xLnLQ8Hp8d+jwq
	 36ZZtMns34hKCd3jBWlNEVcnXwzKFvHEL5zO3CnuVGHk2BFoJbBYr+e8nmzpC2+aGNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jN1kVMysduhM1CTMvsxUGOmjxBfuDSc8t5gMB3kEQI0=;
	b=LojbxVlHQcqfNgqjAx443A4z0zQAI4wl6mTK/7eeLHeNnY2kHXD68Se3i/JujSSAm7fk
	 +4M8tD8C/3ORjwpQ+rydP/tP+P4/cubXTdVNGwg3x3dgiBv2sTGu5Xmm43fwy8EtvziIW
	 MyV44o2No/5yG8rFQnBNIOwIRyIOByIxOSY4wvY1Lx6BvziiAwoPc+CfPk3WLZ72t6ldO
	 E3JwtvKnVU5alzbZLWCwLKBXXzyyh8pbsh1qOqp6DiAQSTnTRe3p4OyTSBYQGPomO7MBY
	 MdAewMmBnPuwm7QD9lOckb7RxKHrU5cM2P9RjanL5u0lxXovr20G6e7sB9tWtewEcVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Z2CHxPzQ;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA68C606A331
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA68C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Z2CHxPzQ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso14417621eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684043; x=1796288843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jN1kVMysduhM1CTMvsxUGOmjxBfuDSc8t5gMB3kEQI0=;
        b=Z2CHxPzQR7nllzOczs7mQ293OqPNTtoaD6ACfI+137kHwNuG1SOQOE4PAZlffeb0IY
         7+D98n6saKwfxLvV+YEWCQ1ALh/Eit2Cm6TkGEqBHCfQ2Rh9FIWctXgTVo+rsWVscDGn
         inzh4RRk1W3/mi8kbLFmhyhmZMxj9W40x/0z8w6wAA4v3L2C2UN2hklHy0W8uJl+dSNY
         gSgK67Fdc0mmnusf5TZMGPo4jnMJuZR2D3gUPwSprflsyV9KYI/zf76Vzl7Wdv71HMs0
         I81JiayW8ejNOoQ75Pbpg6w4WM9v8gzLRV6ceC2GcTE/g+x4Me9SLKRYML57vbhhDtbo
         jJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684043; x=1796288843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jN1kVMysduhM1CTMvsxUGOmjxBfuDSc8t5gMB3kEQI0=;
        b=u7BfQEKBdnhOCptTOCgx20K9lVnwDDb+a7N2mO/7EktruBMDeCjJ966J0LgxmPu0nv
         0KwG7Zb24BGEvdX+MguvayDNSozcfICiXwcyhaV5lc78EqoTJuNX5WItgfYc/ZgiQqYp
         qUF455vot2Y2/bSkEH3tXEvYb+uCfKGO9A3rZmN6BRqo6qb8n08LGnWp67NV1ebxFLzV
         JVzfSsVT7/Ja0Jbe2+aJqKKjK18v2CtugGJvqer4bg+6q5iwtTycJQ1wqFslBjN8RBrC
         r989t5EKVPYIkE6DOLBmjBzbJrHr3BTDiQzLq/Fi/2jXF/lztTJxnF/L1Sd5Fm3v9U9O
         Op3Q==
X-Forwarded-Encrypted: i=1; AL+hErHOMobGatgRaDW0W7QbkyvAe7JRYGo2xCpriBWmCgrRJqYE9AuXmceWE9mN6m1yFDyILpFmDbBsNYY0/10=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TVU1xBITrsI153C1HYvhsxLPeVo1OJCcvUYry+6bAKj9lk308
	LDwDh0xUBp0+GTQawDz1QAKt+G1bBj4dZoLsZbDyDCCc6B1SMhjAutqWupguH+H37Vs=
X-Gm-Gg: AZFdTZchDEWG3kiRDXbmGKKTrDakVQhotbBr41w5Sp0zRVpZofILsBG5ZMMQEUn6x/R
	xy0+V8ZalAEOWfW6k6ZJCDT5jE4z4F+2FGCDRhfl1K/7LRUDYiK4Ro1QcuQfNYD7UrpfJ6gGcvT
	EKxNhdxsHrF5itVkuylykdoe9uY/L8YEhXMmGt2sCXMGzJ6fmYRR8XwpWgHYyThqHtIy0efzWUf
	HhBnrGnjrevf2HeCqpNe+RM3DvL4lK3awJE6RTmRL/rPdxfg3rln8Q/xiffQDMKm1urev7AiNkv
	s1ZT8gON8bN7lZCCedGq1madeqxQNsdLuqHMRrAR4JhtNNXN7PqXuUUYBEqBDYCp8qq26Pw+95H
	0+N8Xzhzjqf9+BH7F7Iq/xk2slqVRN5fQcTzZJ2kKNtpsklqvfoeITLvQLH8Miv1lDPist1MmNC
	QNsY2ZOliCRv21a/GvUH3XJWZQKHPsI005/y1H10nCQj3UtgqvlwMaR9XWMHAt2TudWF2TjswJ9
	kwQl0fvuuJ7L6yi/Cewexnmvv87ZVk6eMwgMe96JUBb3iZ9ODTNvcA33dq/qKDLXlhwfZ9vQI3I
	dO09m2IuXS/XJ53a/68LvL/aWNEZXTmbz5W/xPEwM1Vj
X-Received: by 2002:a05:7301:416:b0:356:7ddb:2e54 with SMTP id 5a478bee46e88-38570f27b33mr21020696eec.29.1795684042660;
        Thu, 26 Nov 2026 01:07:22 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:22 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:07 -0800
Subject: [PATCH 01/10] dt-bindings: riscv: Add SiFive pre-ratified trace
 components
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
Message-Id: <20261126-send-preratified-trace-v1-1-1e686fd75be7@sifive.com>
References: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
In-Reply-To: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yu-Chi Liang <leo.liang@sifive.com>, 
 linmin@eswincomputing.com, vincent.chen@sifive.com, 
 luyulin@eswincomputing.com, pritesh.patel@einfochips.com, 
 ganboing@gmail.com, dongxuyang@eswincomputing.com, 
 pinkesh.vaghela@einfochips.com, nick.hu@sifive.com, eric.lin@sifive.com, 
 huangyifeng@eswincomputing.com, darshan.prajapati@einfochips.com
X-Mailer: b4 0.16.0

From: Eric Lin <eric.lin@sifive.com>

Add compatible strings for the SiFive pre-ratified encoder and funnel
trace components. These implement version 0.x of the RISC-V trace
specification and do not support the generic riscv,trace-component
fallback.

A pre-ratified component with an embedded RAM sink can use a reserved
memory region for its trace buffer, as the sink registers restrict the
buffer to a single 4GB window. Add an optional memory-region property
for this.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 .../bindings/riscv/riscv,trace-component.yaml      | 96 ++++++++++++++++++++--
 1 file changed, 89 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
index bb519bc4a163..10660b8ce071 100644
--- a/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
+++ b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
@@ -16,16 +16,23 @@ description:
   The RISC-V trace components have implementation specific directed acyclic
   graph style interdependency where output of one component serves as input
   to another component and certain components (such as funnel) can take inputs
-  from multiple components. The type and version of a RISC-V trace component
-  can be discovered from it's IMPL memory mapped register hence component
-  specific compatible strings are not needed.
+  from multiple components. While the type and version of a RISC-V trace component
+  can be discovered from it's IMPL memory mapped register, specific compatible strings
+  are used for pre-ratified trace components.
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qemu,trace-component
-      - const: riscv,trace-component
+    oneOf:
+      - items:
+          - enum:
+              - qemu,trace-component
+          - const: riscv,trace-component
+      - items:
+          - const: sifive,trace-encoder0
+        description: SiFive Pre-ratified Encoder Trace Component
+      - items:
+          - const: sifive,trace-funnel0
+        description: SiFive Pre-ratified Funnel Trace Component
 
   reg:
     maxItems: 1
@@ -35,6 +42,16 @@ properties:
     description:
       phandle to the cpu to which the RISC-V trace component is bound.
 
+  memory-region:
+    maxItems: 1
+    description:
+      phandle to a reserved memory region (shared-dma-pool) used for the
+      trace buffer of a pre-ratified trace component which has an embedded
+      RAM sink. The sink limit and write pointer registers of such a
+      component share their upper 32 bits with the sink base address
+      register, so the trace buffer must not cross a 4GB boundary. The
+      region must be aligned and sized accordingly.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     patternProperties:
@@ -117,4 +134,69 @@ examples:
       };
     };
 
+  - |
+    // Example 2: SiFive trace encoder and funnel connection
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        trace_buf: trace@80000000 {
+            compatible = "shared-dma-pool";
+            reg = <0x80000000 0x1000000>;
+            reusable;
+        };
+    };
+
+    encoder-0@2000000 {
+        compatible = "sifive,trace-encoder0";
+        reg = <0x2000000 0x1000>;
+        cpus = <&CPU0>;
+
+        out-ports {
+            port {
+                encoder0_out: endpoint {
+                  remote-endpoint = <&funnel_in0>;
+                };
+            };
+        };
+    };
+
+    encoder-1@2001000 {
+        compatible = "sifive,trace-encoder0";
+        reg = <0x2001000 0x1000>;
+        cpus = <&CPU1>;
+
+        out-ports {
+            port {
+                encoder1_out: endpoint {
+                  remote-endpoint = <&funnel_in1>;
+                };
+            };
+        };
+    };
+
+    funnel-0@2002000 {
+        compatible = "sifive,trace-funnel0";
+        reg = <0x2002000 0x1000>;
+        memory-region = <&trace_buf>;
+
+        in-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0x0>;
+                funnel_in0: endpoint {
+                    remote-endpoint = <&encoder0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <0x1>;
+                funnel_in1: endpoint {
+                    remote-endpoint = <&encoder1_out>;
+                };
+            };
+        };
+    };
 ...

-- 
2.43.7

