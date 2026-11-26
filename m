Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686968;
	b=lUOEpxuVWQ2c4WTbNBQA79JVqaRm329owzEe4GgFebdr91GyrKOYf8VlLwjStZ+F2l7q
	 NL/Z/oRJZDKr91fQU5nZkkRKlJu0sudFCOTX8EZMO0qtwZgaws0ZJp728xlQazTZAN9VN
	 eAg5OfRsHMOUt7pYwfbMFuM2zhGIC2WKyQnkdTWD19ISpWXvOVJ0dWkzTSo9gK4JAYOaR
	 ZnZdKZONya8gqyA9kb0q/0i2WiLWtkRQxwjY2O21mqLqMQrruJsOfkCmoBB8vP9vB4z6k
	 gBi2NjNEF1Qjn3LbpsmhL+urXpRDFybqadE1Id9XRIn82OgPsBXcG3lKDAXH3b4yzcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686968;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8XxsVc+GOQvzjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=;
	b=i1j/4BIW1ls1fxWHKJ8ig51Yjgds4Js7qPzA53fzqehslgRXhfsrfi2taZ1+AgWMqSs5
	 ww36EeHpj9KgTUGFTSbo6+FWhvVJHjjK4dzQHMSJULlMhznB/2q20CALRSxSlVmzlqm1c
	 QGrmOZrV/PzdEt3BiJgBg7R2nrcnEc9VbY1gyFi11AlfkesVwHCAz8BUiSeZqcrSo/KPk
	 lJ57KVu6nomvdvtfVavMkSMEMAIfdN0KFUCycPYMgqF/O6UgM2l4rEagZvH/87V9CF+3L
	 Q7NOCUK1tFFCzHChnFmTUTiTE4X7UzlZnAe69Qgjhesj7beHaj4RRNJh5rWgfo0kPTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+DarMAr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V7F0sF6g;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10408606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10408606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+DarMAr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V7F0sF6g
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B98u919560
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8XxsVc+GOQv
	zjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=; b=D+DarMArmQcyB+qAMpgH8R3/4OB
	WYlEqY8GxYoKc/cJKkV7jID8ziKTAW5ae7BEMNdV9VG2+BfUa9u5F4uOhVICUKaf
	G59rC76KQGG2foWZvnfoMZZwjXVtkVWkSj5RdEtH+UziIR/aKvcRTGzuX7ISzlWz
	etYGA1yECL5b76bLnoW4B+L2V1mpgKgIpGiqCZ+UWYJG6pKHPH3yK7lsox8pv2bg
	HEwAgBHUEdocsB1G3OMvSmy6e+jXNsZ/DGAsQGKnji+9ENZA3+KhCSmVpMb+bFpb
	lhKx8YeV3Jh1e0NZiWZT0MYzB0Did67QLcsZM40KULTIY1k38H+uBJ8zfsw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2hf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:56:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so6556744a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686966; x=1796291766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XxsVc+GOQvzjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=;
        b=V7F0sF6gKoyjz1LoP1gz/UZ9XM4+U56068Lj+s8b6gZ4rWvuvHAgCiQpb+tYEmAGol
         e4/jKJ8UBJzV9FJy4NqOh0c9ZP8fVR3xpTZjsFlgixU0RlmGuY5lrNu23jbDEUvfqOET
         0yNlpxUThFO9EuJ90FwfQnFgFGVIcjgmnoDysEsmRC5GtDIBMtN9REc3yuznNsgzPN4E
         jmukULUg3pA134WUqm9mbtaLzF5PTdSvYPkZWkkWjHF8v4Bd3anGFe396Py7VNkjzBjC
         ju6ClqvP+l+nIwu2k0N8gDYTJLasrLOyjNFDvBrjexmZ5JRP10giJuLWKoTP5496Yw5s
         tOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686966; x=1796291766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XxsVc+GOQvzjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=;
        b=HzvEL3RzUQ8GD4MtUSSZOpsGa3B0l/x+uw9zUb96QUsVCpNzlenN43pABmxL86SMVt
         eQqYbkWPKMc+J/DtWdE3qN1Iskl0Rcif0eZ56ebOj6ETKmeYmdQkvByHotK6q+oE7xvk
         MgzpsYUTnfUJynjI9yVBHpjW8rgcr1q2051LnXJ4NsN9H/Z56bPb8XdQzNFkr7Y1G1kC
         iGBPGdBi4rjbF3PfrU1WcLAdmXyjk81D1JpLLX7IkKWD/78heAGKyWBGxVoIn0TOEE6A
         MmitcrS7fzM4Awhz9rFMYF+T+YygxdzTVs55+SQL+WxLnG/aPyhQ/YMIhuH/dnTqCgLu
         0kEg==
X-Forwarded-Encrypted: i=1; AL+hErG/yxi7VMQ3nCYp0DSvlxKG1+foY27qqM3hkGGvVlKRUD3Z1xjah960cCcmirfF9OhvYfjg5s41lJ/6QAI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZQK17uXObT/476feCpe7Z3aub/J9oIDfTQI/wqfWG89RLuolK
	j2RaY+S+q8BGxJ8XuSlpzq1J2Vy7e9BBv184DfWj9hYfnmBgNChx86xJJ0/+7V/j9tI8p5mcKjT
	qSoeR0BThVSNm8ltHJtP9wvA72fNQtRhxyAjmxDcUbFsxNVaEIxYDd4WGSixYNvsEI6w=
X-Gm-Gg: AZFdTZe1H3mMBGftw8hzmBjGuc7/5dhhPYrfkidhirxaWRwfpxNkuO/4C01Uo/TNMk5
	d7PKHp6Wyf+Vi34tOy/W4ji0ZuAAZzUyE43/SZ6m+JO4O9C4X+3mJ9r35fAVROlZt8SmlBv5BB1
	HukdCL3iM5yFQ730FObcDHq8eyWp29jH34JOYz/GajH4tK947R9Um9o59MgzsHUSz4bB4RQ5JgQ
	ZM+QA8+JqGvzGiGWSGez0BaD82WY+/BHP3BNgw/EihQozZcCLKuuKss0rMffj5OoIl/g5Jl4C+L
	kSybKfdby2BGg87zBAmB37wuti/KJfAOglfXSZ3WCwRCm6p0jnFa7HwDktdncREUrchqsh6dS54
	+lS5uNwyYwCpwIgr/pNKbBNGkjejnkNPVSz5BPMWNzXbLdHHecv93Syam+BqsgtaHDaaAczO8Em
	M76FTCytfeXOkvFCyqBDIYHNbrsM7bUu7YI8MgWbdWMNXz2vuflmWRtlP9bXPjXq8tOkHgC3ng+
	A==
X-Received: by 2002:a17:90b:4490:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b41c7bbef0mr12900399a91.1.1795686965473;
        Thu, 26 Nov 2026 01:56:05 -0800 (PST)
X-Received: by 2002:a17:90b:4490:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b41c7bbef0mr12900364a91.1.1795686964966;
        Thu, 26 Nov 2026 01:56:04 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:04 -0800 (PST)
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
Subject: [PATCH v7 01/14] dt-bindings: Add RISC-V trace component bindings
Date: Thu, 26 Nov 2026 15:25:22 +0530
Message-ID: <5454076167a828931e198bd167dea1e2a64cdd0b.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX7F3UBZ1H9N3e
 W2lk5iFHd5/qGtmtdUheXxv+dRrELZgzyF/oIy7mGAyMsmxdOEKkZW23qzN9BvIrJggIwcMc0+T
 w1exLsk32k7EOzwzXcEFcWsO6Qnc+9vknzW3KJDEnSuoEV56/l/Iztb3sa7z3esde0SYg2Y1BQH
 oQSniTX3Xym6nmKqW9LJkPe7axiOpK0hIoWpMbRKzV+2mWmYAlXDnLUHeWI3LWxndF9y263RFDP
 FyWztNyJiXvAsIvI22B24Mxjje78H4mARMOSKT5bNcTCC2gDMpoki8jsEzJtDlaOCSpijt8o6xh
 MsEkfX63HlxjUc2NLLLjJNW2IGO0yVNFbfK/Yyd8xrfDm28wtGCCCOugvwbHklhUy6NHs9StZQK
 +/Xgn+X6iGZwpVarusY0LVCjl9wspMGMGNarcznymd0vq8k0refvCEvjZzD666h/W3mj25amcL0
 znLCgU7fyAKe+A4SU6w==
X-Proofpoint-GUID: SRBHD45XVdD1IeB783OA6IgeVjZ-WGJN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXyINeGOpnXTwo
 E3Y/kr/SR0Y8i0xe/vdWhiSOhmtDRwRQg7fvRusRtQwHY2mWBSVWWvLzXQ59VpbNDeg38f4r3UG
 nTEWoHTHrG2C7yLFh9cyq7eJqL0+jKo=
X-Proofpoint-ORIG-GUID: SRBHD45XVdD1IeB783OA6IgeVjZ-WGJN
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b080236 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=W-_n0kkjAAAA:8 a=f9mqD-BOXdQ1R_-L-AkA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

From: Anup Patel <anup.patel@oss.qualcomm.com>

Add device tree bindings for the memory mapped RISC-V trace components
which support both the RISC-V efficient trace (E-trace) protocol and
the RISC-V Nexus-based trace (N-trace) protocol.

The RISC-V trace components are defined by the RISC-V trace control
interface specification.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 .../bindings/riscv/riscv,trace-component.yaml | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml

diff --git a/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
new file mode 100644
index 000000000000..bb519bc4a163
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/riscv,trace-component.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Trace Component
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description:
+  The RISC-V trace control interface specification standard memory mapped
+  components (or devices) which support both the RISC-V efficient trace
+  (E-trace) protocol and the RISC-V Nexus-based trace (N-trace) protocol.
+  The RISC-V trace components have implementation specific directed acyclic
+  graph style interdependency where output of one component serves as input
+  to another component and certain components (such as funnel) can take inputs
+  from multiple components. The type and version of a RISC-V trace component
+  can be discovered from it's IMPL memory mapped register hence component
+  specific compatible strings are not needed.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qemu,trace-component
+      - const: riscv,trace-component
+
+  reg:
+    maxItems: 1
+
+  cpus:
+    maxItems: 1
+    description:
+      phandle to the cpu to which the RISC-V trace component is bound.
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    patternProperties:
+      '^port(@[0-7])?$':
+        description: Input connections from RISC-V trace component
+        $ref: /schemas/graph.yaml#/properties/port
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    patternProperties:
+      '^port(@[0-7])?$':
+        description: Output connections from RISC-V trace component
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+
+anyOf:
+  - required: [ in-ports ]
+  - required: [ out-ports ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    // Example 1 (Per-hart encoder and ramsink components):
+
+    trace@c000000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc000000 0x1000>;
+      cpus = <&CPU0>;
+
+      out-ports {
+        port {
+          CPU0_ENCODER_OUTPUT: endpoint {
+            remote-endpoint = <&CPU0_RAMSINK_INPUT>;
+          };
+        };
+      };
+    };
+
+    trace@c001000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc001000 0x1000>;
+      cpus = <&CPU0>;
+
+      in-ports {
+        port {
+          CPU0_RAMSINK_INPUT: endpoint {
+          };
+        };
+      };
+    };
+
+    trace@c002000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc002000 0x1000>;
+      cpus = <&CPU1>;
+
+      out-ports {
+        port {
+          CPU1_ENCODER_OUTPUT: endpoint {
+            remote-endpoint = <&CPU1_RAMSINK_INPUT>;
+          };
+        };
+      };
+    };
+
+    trace@c003000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc003000 0x1000>;
+      cpus = <&CPU1>;
+
+      in-ports {
+        port {
+          CPU1_RAMSINK_INPUT: endpoint {
+          };
+        };
+      };
+    };
+
+...
-- 
2.43.0

