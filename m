Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174818;
	b=x0jwnOtToU3eYPaHtZtVfACXonHhhTyPAcIQh7WYv6SEqIwPASHRp5Wj/1dT+aFQqK59
	 6V065qL5u9UTiiDlU/kKaIX3F2z+5UzAmYrp0X1dy8hfICEwk0fiipGhB/Ed7oSxJmzRx
	 et/aInI1MDk+FZIsqR0vje2XllbPpRSx39yWcdvyY+4pAeOHZJ89mvrmaOd7zh1nofRud
	 5yd+jwJSEOEMl4/pHjzS76RqQ98VBggoPLCyLGfTfIVa+bkP2kneA1PAGbJL5ABkhKfss
	 dCB3dv5LAfIjbd8WwecLAEg9+E1JWtdcWGu5fZoXQ0335WJMubmAFsThO1DwBqQ5Phg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174818;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=LbjUUguIEJt9zZGRW+We6Fw4cBRjC8OMZrbWiRaIZT4=;
	b=lruMpKrjbP3/rTBY2zgmZ00bIEVPQAf26ZcWaTSY/a4uedQW9dIgnbRY/l3lFg4jOla3
	 BXeuYanFgqIS2Ygb8m94FO8XC4j6x23HAZ6Rz4RiR/5uAWtoNnX5i+TP5K+fjXecBxcX4
	 lHIsXiDX2jsM9Lh3WMI9x8erufWQKGhGVVWdzX7dFyaMSsbnszg9ssRp9yV45byqg/1a5
	 /6gRGLSMRU+tjLGKo1WHpdWvegTnEIfVRyCR6WM32pxKJSD8LLo11ccTbLAZFqbJrdROO
	 W/LpcLHNGGhWZxCHT2cLRUsv98ejczYkgBoBbBaI1hmnpA7LJXiyHENabM8rvY3dsdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YlIdxQlq;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1784360A260D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1784360A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YlIdxQlq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 524E64E41685;
	Fri, 20 Nov 2026 11:40:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F9A36017D;
	Fri, 20 Nov 2026 11:40:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98A1A11BC12B8;
	Fri, 20 Nov 2026 12:40:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795174809; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=LbjUUguIEJt9zZGRW+We6Fw4cBRjC8OMZrbWiRaIZT4=;
	b=YlIdxQlqf+MAo9S0zwssZObKQhRdQU3dAGdEwYwq06WupTswxna4/DNGr8h0KwiZ7SVMUF
	GqWMCnPhVUaVPMPqJkmoeuzfnPZzqCmEoi6QNgEnVgPXx/C3d2x/pHzQXDJY/QcEgjcNDc
	YaLcKqxku8nLq9bKSEGXUgCYg3eIMd11xGOgbh09oRTuPL8bM/TrmyWV+jDPi8Bq+65DzX
	2+LPSN2dO0iBdl88BeXLJ2dW951qBfzsl9LTLfEjXxM41vsAq1sMf+xt2rVY5G/j42+aOq
	yg8DYTGqrKP4rn3rPmjO1SrVN7JurMk4R4DRxCmc1zCSNFmseFprtPIpL6TNNw==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	George Cherian <gcherian@marvell.com>,
	Sujeet Baranwal <sbaranwal@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 1/2] dt-bindings: mailbox: add Marvell MHU
Date: Fri, 20 Nov 2026 12:39:51 +0100
Message-ID: <20261120113952.168265-2-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120113952.168265-1-paul.cercueil@bootlin.com>
References: <20261120113952.168265-1-paul.cercueil@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

From: George Cherian <gcherian@marvell.com>

Marvell Message Handling Unit is a mailbox controller present in
Marvell OcteonTx and OcteonTX2 SoC family.

Signed-off-by: George Cherian <gcherian@marvell.com>
Co-developed-by: Sujeet Baranwal <sbaranwal@marvell.com>
Signed-off-by: Sujeet Baranwal <sbaranwal@marvell.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

v2:
 - Fix binding path in MAINTAINERS file
 - Move MAINTAINERS entry so that it's in alphabetical order
 - Fix formatting of DT example
---
 .../bindings/mailbox/marvell,mhu.yaml         | 61 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml b/Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
new file mode 100644
index 000000000000..5cf20d5642ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/marvell,mhu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Message Handling Unit
+
+maintainers:
+  - Sujeet Baranwal <sbaranwal@marvell.com>
+  - George Cherian <gcherian@marvell.com>
+
+description:
+  The Control-Processors Cluster (CPC) provides Arm-platform specification
+  entities for managing the system. One of the CPC processors is the System
+  Control Processor (SCP). The SCP is responsible, among others, for booting
+  the chip, clock and power initialization, controlling power consumption
+  through DVFS, monitoring temperature sensors and controlling AVS. The SCP,
+  as each XCP, contains mailboxes for software-to-software communications.
+  Mailbox writes cause an interrupt to the local XCP core or to the AP.
+  This driver exposes AP-SCP Message Handling Unit to the system, providing
+  the mailbox communication mechanism to the system, with the intention
+  of plugging into the SCMI framework. It is designed to work with Marvell
+  OcteonTX and OcteonTX2-based platforms.
+  The mailbox has no other usage than SCMI communication. In case of
+  configurations running without SCMI support it should be disabled.
+
+properties:
+  compatible:
+    enum:
+      - marvell,octeontx-mhu
+      - marvell,octeontx2-mhu
+      - marvell,cn10-mhu
+
+  reg:
+    maxItems: 1
+
+  "#mbox-cells":
+    description: Index of the channel
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    ecam {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        mailbox@1c,0 {
+            compatible = "marvell,octeontx2-mhu";
+            reg = <0xe000 0x0 0x0 0 0>;
+            #mbox-cells = <1>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b..8f6f98acc8fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15825,6 +15825,12 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
 
+MARVELL MHU MAILBOX DRIVER
+M:	Sujeet Baranwal <sbaranwal@marvell.com>
+M:	George Cherian <gcherian@marvell.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
+
 MARVELL MV643XX ETHERNET DRIVER
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
 L:	netdev@vger.kernel.org
-- 
2.47.3

