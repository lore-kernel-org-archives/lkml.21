Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180487;
	b=EhHbKiUJ45EiL1GgtlKKeK1CjRTsd6TGvS/3d0shSn7nuLvfdlopNRpNkueChXDmcDEr
	 emKynF9cylpczsl0/rSs8XOVim9lriqNN8UevxhDI3Kwd+ry509Gk87+r0RLnLkzYnjCw
	 GlX9lcPHdnXgmH072tlqCvmNx4O22DMUTDL1tJN0B+TImiBed/wonqCdMuLrdxrqfHACu
	 BLIB82G6F1p5CwvlJuXqeaFBgVcgiS6CkXLqcJwYYNQLfmq7j/aE05GPwKQ1YdSXbFSfc
	 NCzcSLak8TlMD14w6jzy9NHNk/Ks85pPwu/H9U3WPmPV5bOwb4auLjsD9vku01lipFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
	b=uFmlaYKVH8tDaVgzFyQPJe6TCWbLYuMgqx9Gij1rJ+meJdpxPNw/fJkmTOtGhCyPIvDJ
	 iMRsLPvIecxoUV/czfYWd0vpClMs3uHU4Qbl1C3ER0qKs82X1TJyWUThL7Ki+ZfW7YkEn
	 lCSMaqai3GXmYvlm1B3nPyMwQHlNVzPC2ZTp1BdG6o5FLlpcWcseW5kJwga4XWvV8vPRr
	 mJJI7Fs0sQHcNwmqguOtLM9Nhp6qH5bq6OFualF1Z3wMYQ9CWQ9scOsONv/TrRhPwmoCK
	 ye6jeguvp+Os0jRDne2Vx7KgeM411o84uOT8T03pJfxYKrKYsPT0QEric9toFSBRELA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=QQ6FNR7K;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E823606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E823606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=QQ6FNR7K
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-382c3c9671fso1200017eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1795180486; x=1795785286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=QQ6FNR7KDX2plbGuPnWqev3VN8S8pMCEsElxebt2M0UElMBOrvh9bkeG19vovWcPQW
         kSY0d7Ry41DaizxZkLHqLB5CaplCz441PRuFw51ZEb+UcD3wfnCa35IqaRO0zgaq1EGS
         Ql8BgdZIMHvUAph9x9MeiXOpYVTccURJTzzyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180486; x=1795785286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=lXecbEY+fujZinTRE+KgdBgMO9/TMYSgaR1zLTwOQGvMk6WQk2sMeUcfSEysP3FybU
         b1D+i3V3oEsmLABBNGxLQqE2hk36OxCpCZLHiz0MgwPaFC28YHl4U3ON+9erboHv1SB0
         7I7QK0cqf7yDm0qMONZnmYmkTBfq9c+7rfN3lmmaqyFe04bb1VucAm8DIEMEcl+6QrSu
         zWTb/XnGkjubMAzvzwGB6vVYQNIFXOXr4wI8hj3rihuzVD6Y6geywVwYPL2SgUhY3kY+
         6l5UcoWimxhYFCD8YMPfiL+2WoqbGt++UHQ9clDNawVkVsjFPXZUhtwtzfh336+iHzLp
         UbKw==
X-Forwarded-Encrypted: i=1; AL+hErHt2YconZDZOr1yqtV7Y6olmyJSVMNd7BIcPVO4kThqps2sEl7Lc5WmdXOFHdfApvA6Ioo7ZBqOpqcmdMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b/hnXF/TLC5bi5qDTb3X6XuN+jrnAOGut/Vgeok8xbI6+p8AS
	dZHLLidkhFNcmNjiGhJwE7ROtGsWNPn0QdKBUah77vktF05TaaoxZApss44rtGTgP6E=
X-Gm-Gg: AZFdTZcLkAZVMjfKYoK1X+s2kgx7G9bkDgSMyJWsIDU3Fa3GMVoJuMnYYGFDFIEiXv/
	IqJJjNDZDSV/jAHjACwe5ji8sZb4xgSDqMT//ul1yl+scoHUq6UO5B7U302S6fbNO58mZ7m2dsq
	guECPQNBzBBCzYiFOUMK/riCg8PJRnaCQD/r4IRUaMQF+0NyUCg+Vh2hfcy8MEwVMmZjGsCudVV
	UmFVq0MlMabksYbH4aB0tT7aXynMGRpJbTK+aEgBPdGdvpIjU9WaxloL8+wEQsJVRqBAJ6M6MaW
	OluGv90LSIJOI5DL3Xco+SaJWXye4nlthpjz9QrvqTT65+oYMdmbIxXztfT8cRKnJQ6lE+cQ8S0
	GeOHLi8Ql52632fYZbB7fs+gZlKfuJPRarldhS5KcoQu1QTViiMdezHpAEqMQ3LVJD5KV8W6I0Z
	bw8aKt4sKzZJ8ioLLn3aroZEMna9vMj9CcH8wFKZ24xAzwBxfIXkU/rNF2rteSKaJXtq1iIsmun
	I1ke++SHBPx+nTFDpexSJQqDgrb1oSHwJHnEruey9LZA+ZfsL1uOEDtGt4Db/loKDNtwhF8uGeg
	GvVyJw78LfiY5jw8lwEwNQoGEWfWYWCsrLprlbxGbCXsNo/LcJb1F/RtHILQLTeBBSDdDYfv/Bl
	OJ02Bc3yA3bUEVNIzsgET4YgKa6zJiU5gK+QvzIjM56Ipvk2jRN0zTVJQ9GDo+YPy6kQh
X-Received: by 2002:a05:693c:88ce:20b0:375:f17a:d691 with SMTP id 5a478bee46e88-38570f2b261mr2924838eec.38.1795180486175;
        Fri, 20 Nov 2026 05:14:46 -0800 (PST)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm8900527eec.22.2026.11.20.05.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:14:45 -0800 (PST)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: krzk@kernel.org,
	conor+dt@kernel.org,
	ruud.derwig@gf.com,
	rbannerm@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	nazim.khan@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: [PATCH v31 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Fri, 20 Nov 2026 18:44:01 +0530
Message-Id: <20261120131404.976959-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261120131404.976959-1-pavitrakumarm@vayavyalabs.com>
References: <20261120131404.976959-1-pavitrakumarm@vayavyalabs.com>
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

Add DT bindings related to the SPAcc driver for Documentation.
DWC Synopsys Security Protocol Accelerator(SPAcc) Hardware Crypto
Engine is a crypto IP designed by Synopsys.

Co-developed-by: Bhoomika Kadabi <bhoomikak@vayavyalabs.com>
Signed-off-by: Bhoomika Kadabi <bhoomikak@vayavyalabs.com>
Acked-by: Ross Bannerman <rbannerm@synopsys.com>
Signed-off-by: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/crypto/snps,dwc-spacc.yaml       | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml

diff --git a/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml b/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
new file mode 100644
index 0000000000000..a337f7b473cc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/snps,dwc-spacc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare Security Protocol Accelerator (SPAcc) Crypto Engine
+
+maintainers:
+  - Ross Bannerman <rbannerm@synopsys.com>
+
+description: |
+  The Synopsys DWC Security Protocol Accelerator (SPAcc) is a
+  semiconductor IP designed to accelerate cryptographic operations,
+  such as encryption, decryption, and hashing.
+
+  In this configuration, the SPAcc IP is instantiated within the Synopsys
+  NSIMOSCI virtual SoC platform, a SystemC simulation environment used for
+  software development and testing. The device is accessed as a memory-mapped
+  peripheral and generates interrupts to the ARC interrupt controller.
+
+properties:
+  compatible:
+    items:
+      - const: snps,nsimosci-hs-spacc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    crypto@40000000 {
+        compatible = "snps,nsimosci-hs-spacc";
+        reg = <0x40000000 0x40000>;
+        interrupts = <28>;
+        clocks = <&clock>;
+    };
--
2.25.1

