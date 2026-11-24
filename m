Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560212;
	b=wQzbtQj/g8FHy+yW7GnIPgCv5OSUHwgjs39CGBL2DXYfs3ji9dIIpbzLRHFu5k2pG93U
	 fOrHGh0aDZQlMxwBfqHD87vKTVVFukglmV9a950CnGkGbvDXho5/YDWwXwuM+O5EU7eCq
	 isnQ3UCLDradoljht3TOOtryQmD2nprslKlVVNtFbMxoWSn/rbbWdEvSi4Tat4wt8oLlq
	 kfEsLa2MsOCm/fdmmc1J6Qf/MYXeV8Sf5Y+Ku839uqZaEA3mtWVPpdpTbOy1eLN+japps
	 UvjAf0m0ok3KObcCiGRDmmvDDsllMeaKsa+HZWFyhn6vJMl8xy9o37zVMpPyL9qOGsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7rPLYS7So0Y9QvCfhAuguLYZiylbNJV9FhluYZDmJM0=;
	b=ZTjFKcm3Hhm5D12YAsmu8tTgG102vrLqoJ4me8SA6wxFGKZ2lplYjRzHoL9Zb4W4LW9Q
	 b/ofvVYddDZof6++OKbgl92RJ1+ko3XwnT7GhY4BEjHoTGT7jKBL/DX7sjYGSbfyM/xLF
	 8BUPlQRkk7r48Bcf4mXPgfYftBt3Oj2QjQl8got1k0alcAhV1sNHn00EHcqnPEtsj+R5M
	 PrkJLfhkudNYPL/N0T57q6Tidbeatuq3MLNWvajBUakxJ0nlRVN4jux9EUXy56nOr4pNu
	 NIXGNTGl/FpSewHXsFPRF1RzggnfHURCidy+mytz+rRsoEDftsXQwaz+7gJsB3LWUrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KCfjE4bn;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73E4606A334
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A73E4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KCfjE4bn
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dee593f18so4790514f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560210; x=1796165010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7rPLYS7So0Y9QvCfhAuguLYZiylbNJV9FhluYZDmJM0=;
        b=KCfjE4bnQD82RwHGGKdiXNtgGErpAWjW/IhH1YzF7I+uS0VAzT+8JZzvMyY+b3qL+h
         aLThNdzzpsJwCx+uuPrMm0f91cwGed2ID8LnvguRWyzFqg8T4xHyy+5xQ2tfwgR7iH0G
         cjk7D4yI+B9bcKJvIQAmpBTamLeuNXZEja9OitneRfP9NUIaKN/UpMO+AWzd/2Zh8tpC
         H7amjugChvm3adsR5E/UYnha6fFSTXgJ4P33y6ft/jwU9eb6QCdgUlZZoPlHyvN6eMDP
         RxtfPcmE5vOmtEcgPdMcpi0D1Q41eSMmQFinBtpAGMgEZ8Hn25fHOldr5yQOwXuYqZAF
         40aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560210; x=1796165010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7rPLYS7So0Y9QvCfhAuguLYZiylbNJV9FhluYZDmJM0=;
        b=fOaD74r6IhmN7qr/SlPFMw5FtxZseEzCbCdq+Ysa4BXsMK/76fV94FD+Dt7Uf3+74T
         rRWhrbHc9k49GNK2BNCOUgNPlBiIcNiCQwpJZPiXzM3SskjxV8z+aIckgOb1jqu/lr+l
         59Lh9lwY5c23UcPm4k0o7XKurouj4oWF4+zkk9LnJq81/0B1ljHGVp/vznbD0Q/GZtTU
         QbmwrpY8v026p4uk0deph+ePu/r5G3HddtO5dx+02f12um8NgL5NKl/K56i1XvjZ8sUf
         Am2VgpYfL5Crkq36jvS0iK/2ACfDQx7cjRmVn5sTTzi3iyDkUgdNqryrCwGqP6TtFGGk
         kCzw==
X-Forwarded-Encrypted: i=1; AL+hErFPqf9Q0OQGfMaaJkPjnfAh3BAzJn0HwV6WdXXIX9niOVyIzTWGUpFGR9iT3iLKObvZmoYon1ERDzgTCOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z91FkFQ6QwJf8JjWXS3CZmyQsg38d6zmyxBXtcO2tS+Zbt9SI5N
	R3R+gfjqyMRMaqKyQcV+Vbx9dRwfSR4oSHft2QNrBd6ORrkwgWbuloFb
X-Gm-Gg: AZFdTZf8apw3ASIiWVf1mBU3ms43c3CTFdr72mXOgqaxRCO9NAXLWIWPctT+8ftswzr
	UmUqOGyzZ85Omh7PLiPsSjMDLj4uA/C4rM1lw0G61B+gezFwvi3a+foo936qLVV7uj9zYJ670S5
	ZJuMBTGcteOCgZnRWOBuvM68hI//Y55bZLollwQ6ZjAjEZmbxJGW+zlmMnUGxg+oMrMaATtz1Rz
	pa99d6B2NzBXOYNdWp1DtD6cxpFednt6hvCwUDtNzfkSxVMptcqYkWobwMxusLb46X5Y5nOg7xL
	DhvFU+hlVD8car+W5rbWt2d+Txdi1xbdVI/arRTX+Yppc7Wtm0+b22YmTEwnuaRFkzNIRGxoRa7
	OX9cc1UmZhZCK3EbDE3MK0+jhX0RdGUsSWj6EmCV6LGrmOowyLY1+cVaPJLmE1es6XjT85dZDNN
	4rsjeH9yy8Z+PGvybi0sM8OzwRYDB41hiH3rSC+AWDzGYCXaBNfzPHQ5h0m7dsRRxMf+V8XD/N1
	xcj7YSQFiN20HcV5oAfXjPbDU6oWLot8EvqlFPS5xmw28zR1UQNyTppDDoxpzxtcSwTLTNj6HWs
	P8eAdL4BOIemvGsfx9yKZqJ4eI8Gk288RZQZ6LJ5bEcuh0milsMEJR/xw0n6/zWHB2iPg/AfQU9
	QU6w=
X-Received: by 2002:a05:6000:4705:b0:48f:cb37:3ec3 with SMTP id ffacd0b85a97d-4abb400c591mr31382607f8f.41.1795560209956;
        Tue, 24 Nov 2026 14:43:29 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm30900915f8f.58.2026.11.24.14.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:43:28 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
Date: Tue, 24 Nov 2026 23:43:15 +0100
Message-ID: <20261124224318.227478-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124224318.227478-1-ansuelsmth@gmail.com>
References: <20261124224318.227478-1-ansuelsmth@gmail.com>
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

Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
work. Add the required register to configure the PCIe PHY and provide an
example for it.

The PHY link to another PHY (the QPHY as described in the YAML) to
correctly handle Gen2 speed and mode. It's mandatory to have this PHY
configured for correct functionality of PCIe. The QPHY is a unified PHY
that both handle USB and PCIe PHY.

It's also mondatory that the QPHY setup is done in the PCIe PHY setup and
calibration phase or calibration might fail.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../phy/airoha,an7583-pcie-gen3-phy.yaml      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
new file mode 100644
index 000000000000..a8ec5ac781cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-gen3-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7583 PCI-Express PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  The PCIe PHY supports physical layer functionality for PCIe Gen2/Gen3 port.
+
+properties:
+  compatible:
+    const: airoha,an7583-pcie-gen3-phy
+
+  reg:
+    items:
+      - description: PCIE G3 analog base address
+      - description: PCIE G3 PMA base address
+      - description: PCIE detection time base address
+      - description: PCIE Rx AEQ base address
+
+  reg-names:
+    items:
+      - const: g3-ana
+      - const: g3-pma
+      - const: xr-dtime
+      - const: rx-aeq
+
+  phys:
+    items:
+      - description: phandle to QPHY phy for Gen2 support
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - phys
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+
+    phy@1fc7f000 {
+        compatible = "airoha,an7583-pcie-gen3-phy";
+        reg = <0x1fc7f000 0x1000>,
+              <0x1fc7e000 0x1000>,
+              <0x1fc30044 0x4>,
+              <0x1fc35030 0x4>;
+        reg-names = "g3-ana", "g3-pma",
+                    "xr-dtime", "rx-aeq";
+
+        phys = <&pcie1_phy PHY_TYPE_PCIE>;
+
+        #phy-cells = <0>;
+    };
-- 
2.55.0

