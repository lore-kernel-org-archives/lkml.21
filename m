Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580137;
	b=nJYFLooK9qcSxAqKz79CX70uAmoye90WpXJRWaiy0YuVBtzerROXGYIaejo+gOrcp7o2
	 gwEgT0/DvAVfCviTbaIWZW10t9ioVSrcrtOlNRVkN3V7f86wRJvTUnGl9hP/aCy8Fx2oC
	 nGCijgeCg9lF//hiUKAAi5tHifeTgvtHSxxHqG/tvUL7dP0MWFLLIToC0Gs86TWDTftJs
	 mOZkhi5JSriA9W0FBONrsNY8YBJwMUwFhQZt+lCLZzIyko/nKpfgQK7N0vfuuDVLlFMbX
	 lgbc1owgvm/vZbOLvVGhYnCotvLO7FqG4G8Ah24vXelI/NqdoL+gKfa1kxllWkWNBew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D/X9ZyEdnOXOVxwhtJ+XxsYI1vONhPEcHfkavK3jVzU=;
	b=v4Ml41POpcTfzBnzfpKpVDeMcBmR5+LGqwBCE99LrtwLWzCqZHLhJN7cMaIGNC9ZFZOj
	 wFgo0fIcdritMjRiLuwW1rDhI/jZoXKHDj66e/b8Y5TCKYiIdfA8IQbpdapNU0JV/+bP0
	 /CuUmc82edJi8nKqarDZ03pMl5svPh2uYAviGfgUJy5GEh1ZEjs7RXR5XQh7iybVa5et1
	 O08JVspPZGW5ONbS6p/GKtyRKbvJTDOjIHqwwYMhOuOTc49eWzuw+MFELK9RTwXvkGA+B
	 HbEct8UDxSU4s3qq5NwZYNF3GtZFZhjZz0G/5g07bWBRe+OiVpZ9A4OcydD0+vRLrLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MOehhLV5;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51F8606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A51F8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MOehhLV5
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f04b676219so29036405ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580136; x=1796184936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/X9ZyEdnOXOVxwhtJ+XxsYI1vONhPEcHfkavK3jVzU=;
        b=MOehhLV56Waaq2mRUpUZJGwEY9shCuv67QPGJ8YarlLXY0W4iNb5HkkEPmmMB9iKUl
         v0vXxQBxg2tRd4+wkkh6REu80iLhv8x4vkQ3PMFfCBQ5ba24hUx5b95rsqT/o9glAT+P
         ZsJ8EO0sUD5uJ/G7VsFp+gEPQUBcoRlo72hmj3N8J9yF0xeS3t93kkwlOtOupuJKpT1w
         sBlvylZ2xkJfMIfCSGlIxjCKhsjdV4cQvkVc6MxVYwkXJgwVv5mBcYLnB6jVpEBb0s2m
         75TU7qrBQMzniA6WXqmB0JaRxKipz2R5U12Ju3TNaAxRwzAAtAH8/OK8eRsjD0f3NWLw
         jYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580136; x=1796184936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/X9ZyEdnOXOVxwhtJ+XxsYI1vONhPEcHfkavK3jVzU=;
        b=0s7vwyNCbHkuBqUDMZ3LYdJK1Je4JQjUQ8XY6PQLerIFbB9jErVuJsPwAsNs8tVDuK
         xJSljQtmMVV2ewY0X9/4DaV6TuRoV5AYPTDGStLpmCdTJwc5GeumSoaTdeEmaVZYNXpD
         kiDxLF9wawFkKG0F83UlIuMeaUhI5UgYWJwjOIsx2zzE7nMJrGD52Ymvtw6VYSlDBaCo
         wDFYTmHhC1vewjCAQOfXFXuOlfrhWZdoDUbnjrkfiVBymKK9866/0FbgXGOQox9GGWC7
         cEq2Aj3FlgGcLzrCG37fD16C0NJ5J+deLyFBbbuEQPCZd6pDmbtsZ4KLt8XoN3f+Oa8p
         iTLw==
X-Forwarded-Encrypted: i=1; AL+hErH4bd1vgSIZRc7wtg8HqjH1GVn/Vh501dvfw5MTTep6rLiUQXme5Hjeo50CXGm6yQU/h+tU+tlmWdigTqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B1N4ezBjXgQN0r7WG2jly3qbn7RepQ23eU6G0UkuviwDbtjwL
	u4BNrqraSVGnqa1RkBgVFYF5XznrcIVNASOUhyNSrHn4QYKauAon+9mi
X-Gm-Gg: AZFdTZeJwAHb7NnICITeHx1V+/JjFufN2E3PN4QOr18ljAEY4RQ/c5qCR8scQ8Ks3M+
	hjJT8f8y39IFahlW0sODv40Dun9TXiUFF0GRmYwZiJrtB9ufY6p8iwm78e/FmFaK4sbIluMRn07
	hn06RfL7eAUyMU2QUpw40+hp+JDjqlQC49HDDWpDY/cnDL6iWKJJp7kGBB3WqjmADm+TclsA204
	1l39LQi4sGyxb6CT2p84HcGolPPcVqNNXqgmYytkboJiYOCKkIgNwX8+5PNzq9xfbWlEPaBBDPy
	FVy3LNNUCJXqwojS+M9t3KwLZVK/IwESeTdXmN7qgnbejLtVtdUgXuNxlpx/Gu3jzyskemXWIsD
	z51n+co3DHcetb24SLpzRPc4u4YPFP4rArQkAjTy9DGCcd9A+s2JV0aCLr9mXKEUJR1Ij3Rb9EJ
	HkTXyrpJ3NN+Alx7USNSrWSWRd3Qpy2BHqPaqFxEHUNUTvkKXj+c3K9dpqIqxXGU+MdZbbnuItz
	zKiajRSyM7/nTZ0TPCYohKpZ0/ax9g7fgycC3MiK67Nz7vwoh3xAeHmvzlGLqpasaYXMGz0YuX1
	UZ42k0/xsBgyTbfbF2MtsDq6nH4o
X-Received: by 2002:a17:902:e80b:b0:2eb:1dd7:3aa4 with SMTP id d9443c01a7336-2f03f181759mr177341625ad.34.1795580136016;
        Tue, 24 Nov 2026 20:15:36 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f8aca00sm68640555ad.38.2026.11.24.20.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:35 -0800 (PST)
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
	Longbin Li <looong.bin@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v8 1/6] PCI: spacemit-k1: Add device data support
Date: Wed, 25 Nov 2026 12:15:15 +0800
Message-ID: <20261125041523.242588-2-inochiama@gmail.com>
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

To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
data to handle the K1 specific logic and make room for the incoming
logic for K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 92a71ea90ac3..658ad2fa87b2 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -48,8 +48,17 @@
 #define PCIE_CONTROL_LOGIC			0x0004
 #define PCIE_SOFT_RESET			BIT(0)
 
+struct k1_pcie;
+
+struct k1_pcie_device_data {
+	const struct dw_pcie_host_ops *host_ops;
+	const struct dw_pcie_ops *ops;
+	int (*parse_port)(struct k1_pcie *k1);
+};
+
 struct k1_pcie {
 	struct dw_pcie pci;
+	const struct k1_pcie_device_data *data;
 	struct phy *phy;
 	void __iomem *link;
 	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
@@ -277,14 +286,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 
 static int k1_pcie_probe(struct platform_device *pdev)
 {
+	const struct k1_pcie_device_data *data;
 	struct device *dev = &pdev->dev;
 	struct k1_pcie *k1;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data)
+		return -ENODATA;
+
 	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
 	if (!k1)
 		return -ENOMEM;
 
+	k1->data = data;
+
 	k1->pmu = syscon_regmap_lookup_by_phandle_args(dev_of_node(dev),
 						       SYSCON_APMU, 1,
 						       &k1->pmu_off);
@@ -298,11 +314,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
 				     "failed to map \"link\" registers\n");
 
 	k1->pci.dev = dev;
-	k1->pci.ops = &k1_pcie_ops;
+	k1->pci.ops = data->ops;
 	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
 	dw_pcie_cap_set(&k1->pci, REQ_RES);
 
-	k1->pci.pp.ops = &k1_pcie_host_ops;
+	k1->pci.pp.ops = data->host_ops;
 
 	/* Hold the PHY in reset until we start the link */
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
@@ -319,7 +335,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, k1);
 
-	ret = k1_pcie_parse_port(k1);
+	ret = data->parse_port(k1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse root port\n");
 
@@ -337,8 +353,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
 	dw_pcie_host_deinit(&k1->pci.pp);
 }
 
+static const struct k1_pcie_device_data k1_pcie_device_data = {
+	.host_ops	= &k1_pcie_host_ops,
+	.ops		= &k1_pcie_ops,
+	.parse_port	= k1_pcie_parse_port,
+};
+
 static const struct of_device_id k1_pcie_of_match_table[] = {
-	{ .compatible = "spacemit,k1-pcie", },
+	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, k1_pcie_of_match_table);
-- 
2.56.1

