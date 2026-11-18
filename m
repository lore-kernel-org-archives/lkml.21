Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983734;
	b=zTxhiC5T7E2xQDihJHJKSJxF9w8lK+9+robVoMYmpokZRzMFo/wtllOpH5HdFE8ZRRff
	 0eJWBd7UTx74NPB/CyGarzh6HLtSIqS/PBZ6gCf9iFePuhMNkY8CAL0LKfg0SJhtKxXcS
	 G7gwjJYtVqD239Dg3vfmOTi7eY6lOZE00J+9BJxKcY/Lkgds1mwCwvDpykdBhrKuUhrgR
	 4oZz9+uSgab31DXnnzVmA042n3T2V9K+D5oVy1qnCNBwZ3qKUz8pMW8ZD5sg1AKoQyyGD
	 38gwPOwVACz2FpsZJTM3NINgEImqAHqvPLbiR7G5tR3MgtSI3h2zv7OxDLuUCXwMUIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
	b=XUp+S1k/x10jvctsLic1XcS349q7nWhGt20O6R2nEI9OTK3xLHCe0XtkM/jf8hkwc7aI
	 8+rM71/ij6Js4jxxlfKBgDirlaHFPiI1N9b2ldjE4V+Js7cW3U6vSV3Wj+/ClnCaje2z4
	 B/eSUpFnLjm6ejyWkx+AKS9NC14JziKyuDRXgfPZzRLIeE8m08xBeqFaf6xdEJrj3hqli
	 5Taur6A9R45X95RwuOsatllL75GqTJrB12yCypsto7pkxwAjDF3QwffVWrPscRfO37Otx
	 q3wm3IfLCOb1tWL+ZFH7/0om+qNeHkD3RUaDi0+2VZKy1fprqkyuzqMsMzC4770+Cow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=cbVxVLK8;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A55606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63A55606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=cbVxVLK8
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-382ecd5cf2cso257648eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1794983733; x=1795588533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=cbVxVLK80ofnnYEOxZ8RmtFCY4qt4CXvWAOGAaSEpjuOsiyOyTnx8kv+BIgRavweLd
         cactbbmutvrZIFMvov9jraLIR4+oTSOQf3hOznKDaE0DjqXVY8Y/7sOSMTtdMRgoSY+n
         9QckQ9IexFYvPhNuCdk8W8csBzH1KPr2hrU6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983733; x=1795588533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=TKsgrtRpHrTwbLN07/GsGmdSK16QzGGApVJKa2MGYK5Vng3lyPCpvlGM8TOdofXdYF
         y2JCWN3vl3Y6ZelrlS2logp6MV5MQ0gAw1jK7n1bPYfEwEWoF75uZ8eKKAHlAfp4z6TW
         WqMuPemhIzSBhaXqonV38GVYtXgKjRblL4DrfundAoe7lEPB2WCbXfme1LNMFovL8jh2
         uGL5u/yZ5qnoH6zTQOXdfyzy2MfI7cRuYk/dX3K2BaTZ6X8dnb5kzCoDuIVi55auG3j7
         kIHy7UxAAF1/tYo9QLVxmRSFEQyk8SI5qbxvSWJnv2ZHiGAmbjcaiZrSrZG/PPL72+FA
         lemw==
X-Forwarded-Encrypted: i=1; AL+hErGt3J/yMX3jyUJXVi+9HUY7T+Ba7difcctCYrGrGE+1bH0jJXQAsqzGUQoaqfjq/qfwV9qovdUwx04pfNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q3vH+P17VmplrlC9VpnZZnl3LP6MLufnGVHAz5k/jUnPrq0hG
	UIT5wbAOGTl6FYDCLwtOHr6D76cE29We3atQEAtPtpMHqmTxvC5QzqoA/bGs9sulsXk=
X-Gm-Gg: AZFdTZescmQKDX9cXPZU6mDsREEAUvYiHrJrouf/7bLNb/n3HSisiNeIpOIUnn/5Xou
	9OvwX4FOPiWsZI9gtf2mFBreENZUypoX8BXNx5eiiDEEaAPVbdPMeRGZ8EFjUWLn+3HwRxpOtqp
	LsK6Jzymp/rZZV2JkuPIilrBHFZvCfwTjjTOLh2kTZIIzOMEKE7v5MTAbaLnuSmmIqr3WLrgIhe
	HTOqy7+c4GqCheL4CDbPLIqNTcKLIsJbSCA6cZpT3b5F2yNK9Bl9w/sXmFJj9/Xnib0jlaQF+EU
	HJlQy7Mz225EEMA3+rjZNSbFeXbinow7+wRFNsOLpnxKkOqlJ1QS+NXKQWqTHHJMilg86SIuXMa
	DrvKH9DjLNhf65Kb6PPX8IaH97niqUPTIzAhZPfnnwehudiaAqct+ccwbmEF3OmsW+4c27J18K5
	OrQEKdb5tWUDbDvnxpWQv2H4LQCx0kAcIlBzyPIKvGmfhSSWbz8TCD1cgcepfafX2w52JJ3epxR
	sEysyYqp+Y4uI7xf1BtzKw+vaj1M/L3IStZi/gQHAyGOXxwtGcOUH3t8W7PDbncqQorimBBcRyC
	jIN7dksB0qQ8VHPNtLN0Rsdg6A683IYnHljAu5jNMz16JCL3FIPmUDGiS0Naja7M9VF/ZmPixtT
	kpJQpRzhDdVDy7V/hhKJGx7nnlnEAX5cUQ7uDSxT4aeH6519NVHGFEgGP4kviCfMeJ3e/
X-Received: by 2002:a05:7300:2146:b0:375:6fed:8e71 with SMTP id 5a478bee46e88-3810e419ea7mr6808685eec.7.1794983733360;
        Tue, 17 Nov 2026 22:35:33 -0800 (PST)
Received: from localhost.localdomain ([103.219.60.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm5002338eec.18.2026.11.17.22.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:35:33 -0800 (PST)
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
Subject: [PATCH v30 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Wed, 18 Nov 2026 12:05:01 +0530
Message-Id: <20261118063504.835259-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118063504.835259-1-pavitrakumarm@vayavyalabs.com>
References: <20261118063504.835259-1-pavitrakumarm@vayavyalabs.com>
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

