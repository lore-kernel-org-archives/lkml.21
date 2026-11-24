Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559107;
	b=rdFlrjbWbd7eRziL8ANOxByBe7D2nANWMKZvcecA9Dq8v0XR57kEdzeUaqzl9UEHa4z7
	 7L9Ee3ZQI269h8KekTjKKbRGImym9LHtBDWufI1b9dw32uVYF2RfuA/o9OOs8XR72A8hk
	 8BIqfyHePMktq1wzyb9cZY0fZ+q1xNFm5Er5nJqVwHqqIyJEOO6qWDiCw4d8iHf0WfjQx
	 Fou+r4mrYlUXaf6uRlpgBzmlSelI9fgRWcd6IG71vAQvULe74/hISieAdIsgy3Z+tnfRN
	 FNWRiDPZCSTBvYU6IAS+EUNxZP3/UYwmXt4OvbizwODs/HZRtrTP8CFK1CmPZrsM1Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JSzQSnco7VI2G/k8ySDHQjYOEaRc/td443pgDxBiMtM=;
	b=2PPrTA2/PEEMrj3a3NHDhF5PGUW3jA/mYXAuLuRm5T50+dbPUVD2MBm8KmmI1RaZbcFr
	 qZFwDGjKAcIHbGvWu17H7zUqK1rh7m3+YOdduObOz9pVIZV8w3orWT4UyJ7heb7LEGqAJ
	 xEeTLHU/tezwhE2QE674WlGoZS06/YaI9+BOhXG26LMckrGahN7mUUHpqhVEirYXsCNp2
	 xr+QqmLNdqTvBKcn8sekPiZ9ElefVlSXWe8VRwJKoE9XVhIdaRa49+0z5k9IXWH7SV7qM
	 g/yqPKWo/yjtlTRxWWu+nhMB+o3Rj38VPfpPv9jdKD3reAYGvb53QaW9DF6qVDxE2qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdZofUX3;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A530606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A530606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdZofUX3
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so3896722f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795559105; x=1796163905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JSzQSnco7VI2G/k8ySDHQjYOEaRc/td443pgDxBiMtM=;
        b=ZdZofUX3OTnIUfEPNnoNaFx+xNCBxP6kCyP7mv0ptg9ibEYBxvVowJYOtWui4c+x1c
         FKo3EECAUbxHWSvN+QEbL3lVteaMpHI2YKcS2LcwHllPfiDYIHLMrNhIDOu5e4taPZr/
         A6SAXB1iafKsfxBwZ+O26KZ6isfyU5NtEur1IEBdRZSaDmCOxPHbuOWEHVUJc9nzRUAE
         NkPl4N6Z6tXFnL8G6lIw1lZHVnb1qjlSRcTCraoLxxRlQ1XENc6+nRDUgL+2xfkpDrSz
         ZnAStcPxgD8NKnXNTBMwsl9a3ciRLmx1R3wZX616CdBxE/G720QHKSfCz06h3BbM4hJd
         bSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559105; x=1796163905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JSzQSnco7VI2G/k8ySDHQjYOEaRc/td443pgDxBiMtM=;
        b=bjutNigsSHvcMEnKvYnKBKuLiOyX+W1K03xKMb1OWfsaUnWTfzA7aAZQvftBCnia+5
         CprCzAn6JbsUKyrkcHfAgZ7TC/+K72UCkAl1gSCdO5+CIb4wYr2sAfT6w3UoKCv+kxjq
         hGr2FS9HHV9ESAmkdsW0ratVrHH3tjR1vRtCjHQwcO/FoN9MDFNQdpT73ACeERXewi3z
         sgtrqhoBeHhVw9RYljhjWH+UdQsvJbP3Mxx5edw6DvxhLG9g3HbyhYGYOHClJikFkQlt
         Lcvh754dW2hzGfL2tULfyUf/BojvTgWoHahL2pSd+xgicckkwp9UryVOfb7Nap4WiyOJ
         0UEA==
X-Forwarded-Encrypted: i=1; AL+hErEnlqtoLn1aO8QNrwDubJ4giQiGrDLl+xeNHQraq+cut/wxrs5bgVF4UXO96yI2nJkRTJgi7v8hj1izF+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ShJUy027DA+uabOFsD2kzfdKkMV8JoI6CXXxFmzmDzoHQfYZ+
	CgV00UB+by88o8sBxOsy25wCEGppAyLwnkdRmQ9SH4HzxKaVsL93UVUX
X-Gm-Gg: AZFdTZdulvQQneBLjF/YX17dbK4hTz3QM3ju3LOLYGj2/CAOz/fiLIIhiAxZxKv9rsU
	04r4hLYIGESuEF7u/9AJL+HLtGdalTkfsmW3Cl4wau1zv4eEHyPQHC0i9ztMeWb3T1YGhWJ5IdX
	P3WETBirrYpKs/DXHencSTALfivUwQc13JLbchApddumc7vYE2J4CeDfLVDKkjUxGo0O3s4y7Kv
	3W/LVuhWsGdSKusIPbdutjPNrMeFXm6TTXbLUOQaIiyC6t0DQxs7wYbZdw2X+COZYbJYynU+UQK
	87FUbnFV7bsk1zC7grPQEZelQy6porGKCGGEdiam05qWp64Zj7VgjKHnlNQN7Lr1W/nkiyGLFhc
	i2h45pCFkSR+QzjjLQrM9r28UeIOpOwOIfFe6+Yui//rpONvTaQ7746tzJYm9eYLEps8MDfd1NJ
	bC9XbmE9fkoZWrEcSsEjutl715hsmkmk0LfX7u3OgLR5yC0Y1BxBPvawH1x+PJ8OGnLkxd+bsC8
	3yUy7aiRminkPhyOjf7Yzs167r8XslO39+64Dcqv+caXDp3rFPC4ovNt/u7FNXY4HPuYBzHoEDj
	az9B/nUaJ+/BNJzfPgWKHUNlqEUhRmrc4Gw96fI7p2/4RALRir4O7l4HqQ0+h9HMpAxZ50oj7Jv
	BAcQ=
X-Received: by 2002:a05:6000:4704:b0:4a8:5a5b:3b7d with SMTP id ffacd0b85a97d-4abb5eacf4fmr32036412f8f.56.1795559105485;
        Tue, 24 Nov 2026 14:25:05 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm31125711f8f.16.2026.11.24.14.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:25:05 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Crispin <john@phrozen.org>
Subject: [PATCH v5 2/3] dt-bindings: phy: airoha: Document support for AN7583 Gen2 PCIe PHY
Date: Tue, 24 Nov 2026 23:24:32 +0100
Message-ID: <20261124222452.219832-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124222452.219832-1-ansuelsmth@gmail.com>
References: <20261124222452.219832-1-ansuelsmth@gmail.com>
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

Document support for AN7583 Gen2 PCIe PHY used to make the Gen2 PCIe port
work. Add the required register to configure the PCIe PHY and provide an
example for it.

Similar to the USB 3.0 PHY, a dedicated phys property is required to
configure the serdes for PCIe or Ethernet usage.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../phy/airoha,an7583-pcie-gen2-phy.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml
new file mode 100644
index 000000000000..424da3c5ad01
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-gen2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7583 SoC PCIe Gen2 PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7583 SoC PCIe Gen2 PHY describes the PCIe PHY for the
+  Gen2 PCIe controller.
+
+  This PCIe PHY makes use of a dedicated USB PHY for PCIe usage and
+  can also be used for Ethernet usage for SGMII or HSGMII mode.
+
+properties:
+  compatible:
+    const: airoha,an7583-pcie-gen2-phy
+
+  reg:
+    items:
+      - description: ana register
+      - description: pma register
+      - description: dig register
+
+  reg-names:
+    items:
+      - const: ana
+      - const: pma
+      - const: dig
+
+  phys:
+    items:
+      - description: phandle to Serdes PHY
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - phys
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@1fa5f000 {
+        compatible = "airoha,an7583-pcie-gen2-phy";
+        reg = <0x1fa5f000 0x100>,
+              <0x1fa5e000 0x400>,
+              <0x1fa5a000 0x900>;
+        reg-names = "ana", "pma", "dig";
+
+        phys = <&serdes_phy>;
+
+        #phy-cells = <0>;
+    };
-- 
2.55.0

