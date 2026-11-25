Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580150;
	b=Kn60BtkEIyYw3NnDx87rKRwHuic7bk7YBxwc+ChOAlxhTDP1jYJx0ri6Z5EXqRK7jAdc
	 eYrUL2jUtpu/PEHV8mGmF8fg+ZkFnx9Hl/pDP0Gs0mf8kWB0CBuOjHgeaec8yfRIMmpAB
	 aUE6V7qJnbuTwKMNrSK9y/RQIsA81V6WGvHsn5m/vGxrRAJXHkUv8pDT4gTnOi8HHRVsL
	 O9AKBVWO5+nRigVVicz77qxziRAdOMLIv73dbe9rDNqYtidRD7sPXivOGdhhI4pnvqmOM
	 6hSdfUjzBupruV5AzMYbkVtuOrZ9VFjaXlOCW1D6StiPZqbxU7wmdE6TigbpqIrGF4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/RsxGu9Qo+d5h2F4SHHbDEzcGRL3TV6KceFfHx6kJUw=;
	b=v5gEmVJ2azBauwq1ZgzfpzxwxhzTz20VuHPpo1X1EQEO/AvqJx70styRnBMJo9CJ4CRb
	 +djw7kfQynDN+UiRXjTZ3dDhx7VgEpZefC02ggR8tCz39I+GUwlMZCU9Z8HBanHxfTIoL
	 ZpGrmc2/udzNmdsBbYCa3LPzclyDRz60SbKql87chYna2ZBTuU7yftamxrwYOjgmottUd
	 8+BvW9s8A18P1YdZbSI8kXS6uPvB9EOXbAy9ju5sXaez5SU79q6vfbSnXFLSc+lOlcBTd
	 c3OeVzgyZdaP+yXHJX3v6nw1qanwW9kiDvOEHOPqwqleyPx51QCcBWR1rUpFO0JaPYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cxkz6Iq8;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52AD606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C52AD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cxkz6Iq8
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a05b210703so2483836b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580149; x=1796184949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RsxGu9Qo+d5h2F4SHHbDEzcGRL3TV6KceFfHx6kJUw=;
        b=Cxkz6Iq8TOzSh/DEeWv/n+zLEBKaBJLzuILtoqeZxIPxfx1q0BDaVF9Opc43yNGB0P
         IF8fQKuHP6ujy17EFfwQr1r8s2FYmGmu44EYSYHRGxAKlLAfMpeG1YjDXKRfv/QbEjGk
         LvoObMpRzIpVpfHFBEPTw1klZwCLV88mnevVkKlbhLHjVw/rhF3haZla30WbPKUBOZQf
         KYlWJAbv07yQ9p3lqN3M9Lr5V3DpCC3NF4jyu6w3ZCbiwf/eNh6ptVZFpB90o9Vvtk3L
         S4/BDeJa1cdUVV7ZJnYKUoFxnD4n/mXcPiDjmMaQLc4rd4UABwqODlryoOZBNYB+tU+y
         IP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580149; x=1796184949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/RsxGu9Qo+d5h2F4SHHbDEzcGRL3TV6KceFfHx6kJUw=;
        b=IGqq81NysyNMkuWQQ03wvTY/pz6Fcg0J3NJJGTnv32Ge+xpYeUg//wCRpNHdQ168ce
         zMx41zuG0w9t5bcHhHCPP5EnKzoKlwZrxVrscFUrpowZJnNJN7RGbaulByfqil7R7hqJ
         iU+ad8UfpyGWuvZ7B75qDgG0R+IDTz6oX3YKnmIrzsro2mobttTQUeddJ6KPwmG9GhTX
         xWmRlffF55w/710RlFz3aw/6/cIAnXuZMnM0APv7/2gKxsCMOCMnJLbZJogpLXeH6uNk
         FYCLxfdZW+YyCJJuqD/GErRNz5T5qPuRxuNPQfNJFUTIsqoX5U2LfI6AWnoxqotFmcXw
         rDMQ==
X-Forwarded-Encrypted: i=1; AL+hErH0lEBOpb+nnWusoS/TJTM6xvZlpsAkLkQnDEwalhIsARa3SVFHSyWwxCKFrpi9rKOhiBnxP9cMMKme4Sw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XmAE1tPYCHAOx5a/ZzJukCT43hC41sUsVT9LIcKIVwqmEJm8/
	UW4fs2VEdCzjJ1tP05M7OwEucu9fBoNikpo7D3BjueuhJq2HB0TsFK6e
X-Gm-Gg: AZFdTZeVqIX5bFMkF21UYtglvSJdBAIEePtQovTRo7lFXMM22REIh0QlMA3jXB0uyT2
	9+AWyHQ3d8MTikuJ0NUAa0VgnLtfnZKHuaIfw05I55jO3ORs4EqffW/h9lPLVlvi4WjXNvcN5hQ
	BcYS0EhUe70cRuBy90R+8irNREVYt4ZBcJ8oJaqM0tbYwd8pvcmUdv80SjWf3T/H3yGlyAnYIV+
	qxFxBUAad1p/vLxU0zfYLY5shs0uHs6PJ8Lx/Tc+Ua51GK74YgV08L3Z098wXGHnPkQGV0zbZ8w
	0OSJEpLiW4+nkrITCvsYcsxulJ2SXAILH1c7nQDbSxYR4cCqAd4fIjLRlXzvyNN+39FlmsUkQyn
	rUzTew6Yablvjmw5sBJ5bKPfDqvfGRGDEgDf/84rnjdlWGL/AuPmrcaPVos7+3JmDhSLLDGXVbc
	PEDqwXJquE5+gyqXGhWga1jOTLQIBaBj8n/g8bWNsvtEWHEim4YpcciK/en2PZYD9JWCmsZVeuB
	JfPI3H33bun4cL5Vrb6rO0lO73wk6FsqYq5otmhCU3sFbB39YEkM9UFsvFYkmp49rSKaeY5Vain
	o9EcsENQBtXbqSMe7cUXkKO++uA=
X-Received: by 2002:a05:6a00:1f14:b0:89e:9c7e:fd49 with SMTP id d2e1a72fcca58-8c87b9cf695mr14659779b3a.20.1795580149082;
        Tue, 24 Nov 2026 20:15:49 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b25bfasm8204660b3a.46.2026.11.24.20.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:48 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v8 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Wed, 25 Nov 2026 12:15:19 +0800
Message-ID: <20261125041523.242588-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125041523.242588-1-inochiama@gmail.com>
References: <20261125041523.242588-1-inochiama@gmail.com>
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

Add binding support for the PCIe controller on the SpacemiT K3 SoC.
This controller is almost a standard Synopsys DesignWare PCIe IP,
with some extra link and reset state control.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 55 ++++++++++++++++---
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
index c4c00b5fcdc0..af32e427c0c5 100644
--- a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: SpacemiT K1 PCI Express Host Controller
+title: SpacemiT K1/K3 PCI Express Host Controller
 
 maintainers:
   - Alex Elder <elder@riscstar.com>
@@ -12,28 +12,32 @@ maintainers:
 description: >
   The SpacemiT K1 SoC PCIe host controller is based on the Synopsys DesignWare
   PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
-  controller, and supports 256 MSIs.
-
-allOf:
-  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+  controller, and supports 256 MSIs. The K3 controller uses an
+  external MSI interrupt controller and may use multiple PHYs.
 
 properties:
   compatible:
-    const: spacemit,k1-pcie
+    enum:
+      - spacemit,k1-pcie
+      - spacemit,k3-pcie
 
   reg:
+    minItems: 4
     items:
       - description: DesignWare PCIe registers
       - description: ATU address space
       - description: PCIe configuration space
       - description: Link control registers
+      - description: Data Bus Interface (DBI) shadow registers.
 
   reg-names:
+    minItems: 4
     items:
       - const: dbi
       - const: atu
       - const: config
       - const: link
+      - const: dbi2
 
   clocks:
     items:
@@ -66,6 +70,8 @@ properties:
   interrupt-names:
     const: msi
 
+  msi-parent: true
+
   spacemit,apmu:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description:
@@ -84,7 +90,8 @@ patternProperties:
 
     properties:
       phys:
-        maxItems: 1
+        minItems: 1
+        maxItems: 6
 
       vpcie3v3-supply:
         description:
@@ -96,13 +103,43 @@ patternProperties:
 
     unevaluatedProperties: false
 
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-pcie
+    then:
+      properties:
+        reg:
+          maxItems: 4
+
+        reg-names:
+          maxItems: 4
+
+      patternProperties:
+        '^pcie@':
+          properties:
+            phys:
+              maxItems: 1
+
+      required:
+        - interrupts
+        - interrupt-names
+    else:
+      properties:
+        reg:
+          minItems: 5
+
+        reg-names:
+          minItems: 5
+
 required:
   - clocks
   - clock-names
   - resets
   - reset-names
-  - interrupts
-  - interrupt-names
   - spacemit,apmu
 
 unevaluatedProperties: false
-- 
2.56.1

