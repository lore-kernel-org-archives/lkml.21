Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053300;
	b=yrFVnDYBP5/7Pge58JaW4Ob3yQIUtjZlNgPBVCPx/qJ9j8ywGQ789e5byk6fKsy1tztm
	 KK58FDT7oOVmmzF5z0lt64ffBvqaQqToUwHc1U1zB9sg28fMS3WwbTYqJC3L6rhTDwaco
	 YG1KWxwVptSkkCZ8rXCA1vyXDFzKQ26g3Oh+qN8pgZpLkOcSTEOVQiVLYlsxSRA9B6xYo
	 iYwQ3Rlrj42uOsvPuUGAOc/CjfpULXpX4/YaZDQnjMa72+AizMdLyU+IyxtzJ0qTjzMp3
	 7YrkG1P15mmk05e288X+IObZ8PiZCkgMG59ErFgkVlBoquZCIiy7QFwSdj6g6yf6Cpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tjBxBXExyy9WLefYOQ4nHcOgOQ5o+ZNc0xlxhA3bZ8E=;
	b=h/EdfjcLupO4C5Ud5/oilYzNGQMCmre/ZfCJu8AypZfTp4rLsYcf0vwsLn23X8raKaAg
	 zRBAPfa1qb2NvDz7VhhvwT7EjcqBhwWx5dfRNPmqdoElqZhaoky0WtBZVmHtJj32ZOuaU
	 3GKao5aKBcidjOsgy7c3U2IWqRX3ZCdwM9aijELWBTOZMF1mDl+MX8SzBeu0+QVScE10x
	 fTfOURLi9afsOFXYO5394C8HrkLJ4YxfN2oFdrsRksoSON28Yhzf0Zs1//+MCaqsH1Bql
	 bCInWOcqVMx6zYn0RDsUEROAJVMam+yxRDgCEKui5mPumgpHk8NTsA4Q/KKIAIYGtYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yiDpmAby;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6498060A2614
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6498060A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yiDpmAby
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1305091a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795053300; x=1795658100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjBxBXExyy9WLefYOQ4nHcOgOQ5o+ZNc0xlxhA3bZ8E=;
        b=yiDpmAbyEafa+Bp5TnuXax0bY7p1lXAGnYEyqXmuMV5ajdev7k2TECoemjX6fe/7v5
         zsDZNStqvnScyh0UBRWmwPPMYLYTkH9ZmmYesSJ60RChor5miC0PQMXYt8iEBxgYWCQ+
         RH1ZSrSSH2T8DEWV/aKxc3aR/yxQBE3obLRAcmMc0R33nW8Xdw2MFLtXj8KAct24cV5k
         caDScZtQPTVTY4Pg0cQnfOZyjLVOBGwZTWMcCExLfi+dTfyCnH/UxqB8M1h0kFItcgpA
         r/30T6Bu9zQcxrqzQ8K93WwLadVtLD3LQk/w0r+hOi78DK19M/4Acx/Fei8pmpkpDYfY
         Ry5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795053300; x=1795658100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjBxBXExyy9WLefYOQ4nHcOgOQ5o+ZNc0xlxhA3bZ8E=;
        b=fM/6BmgKW11bA/Wlaa9uyYAf3uE8OXVp8zobv9MDFudw5mhITmTsJIHnvwtfKMjfTb
         GhHe/jJZqbOYaLd4SFi2iJSZvUnhSe4PHXyf1zPNWtqRwLAMHNJoKZ9nlzCm1yUcr2NK
         n+ySVPkhIcLIJNwXeBwB1l0cbro3DooMKvif0Ea5et7EtapkI4CllusizsJuTWwk7uAo
         owiAwXbvmLo/x2F1RhyzQJ02NJsxpFjO5CRv3Ega5HxotWoAOvXQY8mT2DFIP3YzTXNR
         KRhDGN9YG0sMqnW6yYDeyNjLL0J4PhtIaVCa5shAnt8cmGPT43EF+AN2Z1nmvpvH6EKe
         Ineg==
X-Forwarded-Encrypted: i=1; AL+hErHpfpu5lD7h2gxK3nEk2vBOm/t17TbW67OHOXElgPxih1g041pYaVVbM4FZSVOthYe9pd7CNPN4HO41j1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rWk2jkWBRaKio629HdymkGw+002WV5J2vTbn8vwfQ1zKDRduC
	R4J+ox/0VT3x2mjU3iBuhF8GQN1mc0+a4lC2RiI1dXaQaq3M2IPWVUKU
X-Gm-Gg: AZFdTZfROlXJPYs8rGY94j78bo1uXQCSB2PqZ1tn8dcmAQQgPTorE75vRVIqqIeHaUE
	Sl6kvkR7zUD+VonDVbqv6S1kXgpvxs0Hx6p93A1HQ0CnBcY79XyOom96mynTOnGVtqes2RWw+38
	qFwOgpTobmX+lsQjVvTzi2dsZ/WlutASVfK1vF74XamEZBcnNmG2/pW7zQy1jOxRwNA/t21yFjt
	pNJDwGfReDEmAm0dSmK9HGuEZIVFW1S+7riiUiczRGM7BuBTJ/+nWBK2KJvvchMN5FWGO/+UeFU
	iHC+BOG0LUszdUf5RSh2+F1fWsE3MWaxbR3Wff3+w3eGISSFtYbI27fm185NvdPSzSqzCCQ0Q45
	sYXBDBBaq0GBkHAexLtDJx/g6upPowHDyCbcIVcm8JlQjRzHjQWJqZWjseP9BYYMQHfpMwm8hgY
	G1pn2h7zljlgn9n43Xtlju6zgMyE5q9Zrhot+RXp8n9gC01Re61fdJvhCKgfpkUD1PN66/rrXTP
	1AsAZXe07+ehE1ddEhm8mK7F0gaDulKhaIfgnUDl6qonvN46eIcXQYLMzsNmC2cAZoCZCwfC2TF
	GReVnIB7/mDMBiybLb2C/kllq37L38duHHYuwafAcp7o3o20m869mV2Eufa7ujDQQoCwHy7Rrrd
	erQhsxpzLDROdjIA=
X-Received: by 2002:a17:90b:3d8f:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b3d07cd7c6mr4085733a91.61.1795053299722;
        Wed, 18 Nov 2026 17:54:59 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe03c3d4sm773081a91.14.2026.11.18.17.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:54:59 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
Date: Thu, 19 Nov 2026 09:54:46 +0800
Message-Id: <20261119015447.160470-2-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261119015447.160470-1-shanchun1218@gmail.com>
References: <20261119015447.160470-1-shanchun1218@gmail.com>
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

Add binding for Nuvoton MA35D1 PDMA controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
---
 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
new file mode 100644
index 000000000000..d05971662a5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/nuvoton,ma35d1-pdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 PDMA controller
+
+description:
+  The MA35D1 SoC has four Peripheral DMA (PDMA) controllers. Each controller
+  has 10 channels and performs memory-to-memory, memory-to-peripheral and
+  peripheral-to-memory transfers.
+
+maintainers:
+  - Shan-Chun Hung <shanchun1218@gmail.com>
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-pdma
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  "#dma-cells":
+    const: 2
+    description:
+      The first cell is the PDMA channel number. The second cell is the
+      peripheral request source number, as listed in the reference manual.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - "#dma-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@40080000 {
+            compatible = "nuvoton,ma35d1-pdma";
+            reg = <0x0 0x40080000 0x0 0x2000>;
+            interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk PDMA0_GATE>;
+            resets = <&sys MA35D1_RESET_PDMA0>;
+            #dma-cells = <2>;
+        };
+    };
+
+...
-- 
2.25.1

