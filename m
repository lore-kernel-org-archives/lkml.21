Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296477;
	b=KoagoTu1RyfEy38YYzO2/MSCV8KocRvRLE0c//+NVDwTE4w5cJRyHMJE8AZeiBa/nNq+
	 dFWrc76xi+tDiuqE6jSp3Vl2m2lKraaCXzOr2vUWmLAPDvzxvZIv5pHdZDcpuP3rhYdUb
	 RLjKLOleH4h7e9KKtwkorByQiMyt2DKHjPhXN3SFK/ldkCpQ7sEPEHXW+I8jXNWPYItne
	 xf6ejbo25F0ORHILQX5c8vOBCM+312GLKGvv6PgVjo+voCtHUXJhQF6I6OHL4YIzSCehj
	 oKh4RhYbrCejaZyhPOI2Wg7cJo/cXwV5GzumfmkMLeXx8z5Fzr4wWUyZdyAAXunRkMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bPyMEKgEFHdHS3jAlTK9RnmnWtg9i78hA1hMJdT4cSA=;
	b=BEqdpJTIZ9es3yO+xikUOBFfQul6C/sKucUjeYFNvjKG9ScuWpq07uZa8XZoBI8seGxN
	 BSsDG0T5HNeDPvXPR1PLHRk5N5zmyEslhdx8YZm2vBD198cPJOgtAuiY0OCKxqRfQWq+9
	 VxxXYabdVW8o/4sugo71WuQP8FbN88xoV+q58a1fQrtqfAu3uUanrlHxI3asUAf08OGdM
	 Bb9TYkv6pDLqdD3Z0MyKaMgqW6OJcl4AN8KaUNogfaBsfV8aZoKNldsXvoMBnJyDSpfIg
	 yJna/c4zH5yCBz8fPmYgh6v1e5HIPxBXl0XYgGpbztR5PV1UZ1V9bmFFUyapsMOCjAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nO4QnoUR;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342A0606A33A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 342A0606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nO4QnoUR
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so21850625e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296475; x=1795901275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPyMEKgEFHdHS3jAlTK9RnmnWtg9i78hA1hMJdT4cSA=;
        b=nO4QnoURM0p05+PcDkufepKHoZT7l1C+SOuRKiUyo7uVLO5+m+zLlffBNefNr6fH4L
         9G4Zz91l4lA0e0N1k7RCRAYybFWnv1QztUO4JfhQWQ20c9Rk7/VKbVXgH24WupRLST96
         JmKF3wGnRezV/a53SRk3Ie5vnbo/Bx113DBY0yr53jQE5n9a66lnji5zl5e6kPrNVSFe
         Ion9R8cOQ03TJhMPoBeJkrmBRO31BjFCAUfANiS3E5E+Az5AJye4bmF9tND7N830skvY
         wZLa5tZdEgWo4P32GUoVNo9dnts9p7F5sC5LYtK5FCS77zBJ+RmH456eU9FtzZrbMwe9
         eTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296475; x=1795901275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bPyMEKgEFHdHS3jAlTK9RnmnWtg9i78hA1hMJdT4cSA=;
        b=VrMPxzf3N4ofiLgJugO/s9xM66WIECq4b0oxFVcpEJKCEQSRRta1by3Oc5gIIUzkcM
         TPjDxZ5k8U6lH+7jIPsjplME9GNq3YYNZb83VTLFmH5wJ3uoiqEISyZfXaR2yIGZvNy7
         dRdnYQWU1Hrph2eUw1bJ4l0fW2Jm5huj+3VMqv9B93CDoZuDk8pfhqwRTNkIWhCx4emB
         6/zY68de1q4652Dp4oXkffBYhbSCfiXoejYqCDX70RxZSfFHhl+YCXnh+0aI5fm67MS6
         szzC58glkZDds8QvONdSa0LdTswLjmuyhUpJGxnVCSXGJ4EaE8gHv+Ubm6hMBvWwZwHc
         XBiw==
X-Forwarded-Encrypted: i=1; AL+hErHUxgBSLYyKg4AVsQgIsvxTsFw+a67SBnWbrEH3cC9ztTeBOWoBvHVKpWRo+kpIkAiQnle6vS6JVPsfYhQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gpu0WANZ1H5DvcXHlqxKi5wvX8hR5XuRo15R45K3cGf/2wQER
	lidD2rc4f+3FKkeIQHA1l8dIyVdvYOox+5VA6jDcu0tSijs0xnoBw8Nz
X-Gm-Gg: AZFdTZdOVw32e31L7LUmm87P0vV6RXcRi4CvMgYIvxENuVNQ+J69/CF+cXe/7akZVV3
	xyE3j+IbsgK1ClHQ+79QBcF372kcv5eWOotiy2Nt9RSDib00sN89AAKkUcTZsFxQiFmbiXECe8g
	m6w1j914UQys9wIdONBmlge9DgiEYSno0HaaOQgCuGhbA4h+DE0hdiMqFc6DTq+j4hMgLX0qNam
	IDmT7BsVgzcMRqGnc7+db+D2+i1Y0ZaZcUvZ8kziILooFkl/wIBqywq91U0t1N9hByYf6C+ZtJz
	QQZFQ/0alFtFoBEw6H8VeuO+9enrweZDBPltb74pMfLKS+FRG9uIgLcL4+IQxptw87xv0e9EjfM
	NtgmJ0mrvUrF5kR9y0pE3hP7dkxYAhZqtt34lPs7wtWy9zuOQKRJr3Lxk4398PJcvlShxW4qTMZ
	dOK+WnvNAExbte3yAnt/h7S8oHabPfHQIem70U41VTiHJu4ABsKlSjlC/OaCBaqno4iAQIvwZ3r
	VrZSak6rNjNBwDTmqjkRi3a5aOMtMlrmtDUI0uwqiv9AbaY7LWBK8TlNPyrOrn8hB/kmMbrE8nU
	e4brOXoTlhCT87rurGgv4cuESCJZ+gL84P6fCdFkn3KPMaEHakpIdgyWO55iXEGuQOe8oPmsKvw
	s9/wDfsteSOAGO1W/Kmp5klQKYdymh+Mj6VCwvBw04vE6+8m905k=
X-Received: by 2002:a05:600c:c173:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4bb8881d00cmr154697005e9.9.1795296475433;
        Sat, 21 Nov 2026 13:27:55 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-87-17-253-173.retail.telecomitalia.it. [87.17.253.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm255668955e9.3.2026.11.21.13.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:27:55 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v15 3/5] clk: en7523: protect concurrent access to reset and PCI register
Date: Sat, 21 Nov 2026 22:27:33 +0100
Message-ID: <20261121212738.170775-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121212738.170775-1-ansuelsmth@gmail.com>
References: <20261121212738.170775-1-ansuelsmth@gmail.com>
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

Use spinlock for concurrent access to reset and PCI register to catch case
when clock is enabled/disabled while a reset is also operated at the same
time. This is needed as register are shared for both clock and reset
operation and rmw operation require protection against writing inconsistent
data.

Some minor rework was needed for PCI unprepare case to permit calling it
before clk_hw_register and reference the global spinlock.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 104 ++++++++++++++++++++++++++++++---------
 1 file changed, 82 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 9e92586f207c..12a43562929b 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -150,6 +150,7 @@ struct en_clk_soc_data {
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
+	void (*pci_unprepare)(struct device *dev, struct en_clk_gate *cg);
 };
 
 static const u32 gsw_base[] = { 400000000, 500000000 };
@@ -584,53 +585,95 @@ static int en7523_pci_is_enabled(struct clk_hw *hw)
 static int en7523_pci_prepare(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
+
 	/* Need to pull device low before reset */
-	val = readl(np_base + REG_PCI_CONTROL);
-	val &= ~(REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT);
-	writel(val, np_base + REG_PCI_CONTROL);
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_PCI_CONTROL);
+		val &= ~(REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT);
+		writel(val, np_base + REG_PCI_CONTROL);
+	}
+
 	usleep_range(1000, 2000);
 
 	/* Enable PCIe port 1 */
-	val |= REG_PCI_CONTROL_REFCLK_EN1;
-	writel(val, np_base + REG_PCI_CONTROL);
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_PCI_CONTROL);
+		val |= REG_PCI_CONTROL_REFCLK_EN1;
+		writel(val, np_base + REG_PCI_CONTROL);
+	}
+
 	usleep_range(1000, 2000);
 
 	/* Reset to default */
-	val = readl(np_base + REG_RESET_CONTROL1);
-	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
-	       REG_RESET_CONTROL_PCIEHB;
-	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_RESET_CONTROL1);
+		mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
+		REG_RESET_CONTROL_PCIEHB;
+		writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	}
+
 	usleep_range(1000, 2000);
-	writel(val | mask, np_base + REG_RESET_CONTROL1);
+
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_RESET_CONTROL1);
+		writel(val | mask, np_base + REG_RESET_CONTROL1);
+	}
+
 	msleep(100);
-	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_RESET_CONTROL1);
+		writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	}
+
 	usleep_range(5000, 10000);
 
 	/* Release device */
-	mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
-	val = readl(np_base + REG_PCI_CONTROL);
-	writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_PCI_CONTROL);
+		mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
+		writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	}
+
 	usleep_range(1000, 2000);
-	writel(val | mask, np_base + REG_PCI_CONTROL);
+
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_PCI_CONTROL);
+		writel(val | mask, np_base + REG_PCI_CONTROL);
+	}
+
 	msleep(250);
 
 	return 0;
 }
 
-static void en7523_pci_unprepare(struct clk_hw *hw)
+static void __en7523_pci_unprepare(struct device *dev, struct en_clk_gate *cg)
 {
-	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct en_clk_priv *priv = dev_get_drvdata(dev);
 	void __iomem *np_base = cg->base;
 	u32 val;
 
+	guard(spinlock_irqsave)(&priv->lock);
+
 	val = readl(np_base + REG_PCI_CONTROL);
 	val &= ~REG_PCI_CONTROL_REFCLK_EN1;
 	writel(val, np_base + REG_PCI_CONTROL);
 }
 
+static void en7523_pci_unprepare(struct clk_hw *hw)
+{
+	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
+
+	__en7523_pci_unprepare(dev, cg);
+}
+
 static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 					       void __iomem *np_base)
 {
@@ -648,8 +691,8 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	cg->base = np_base;
 	cg->hw.init = &init;
 
-	if (init.ops->unprepare)
-		init.ops->unprepare(&cg->hw);
+	if (soc_data->pci_unprepare)
+		soc_data->pci_unprepare(dev, cg);
 
 	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
@@ -670,10 +713,16 @@ static int en7581_pci_is_enabled(struct clk_hw *hw)
 static int en7581_pci_enable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	guard(spinlock_irqsave)(&priv->lock);
+
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
 
@@ -683,10 +732,16 @@ static int en7581_pci_enable(struct clk_hw *hw)
 static void en7581_pci_disable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	guard(spinlock_irqsave)(&priv->lock);
+
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
 }
@@ -787,11 +842,14 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
+	struct en_clk_priv *priv = dev_get_drvdata(rcdev->dev);
 	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
 	void __iomem *addr = rst_data->base + offset;
 	bool inverted = false;
 	u32 val;
 
+	guard(spinlock_irqsave)(&priv->lock);
+
 	/* For PCIC reset logic is inverted, 0:assert 1:deassert */
 	if (offset == REG_NP_SCU_PCIC)
 		inverted = true;
@@ -832,6 +890,7 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
 		inverted = true;
 
 	val = readl(addr) & BIT(id % RST_NR_PER_BANK);
+
 	return inverted ? !val : !!val;
 }
 
@@ -883,7 +942,6 @@ static int en7581_serdes_phy_set_mode(struct phy *phy, enum phy_mode mode,
 	struct en_serdes_phy_instance *instance = phy_get_drvdata(phy);
 	struct en_clk_priv *priv = dev_get_drvdata(phy->dev.parent);
 	u32 reg, mask, sel, val;
-	unsigned long flags;
 
 	switch (instance->serdes_port) {
 	case AIROHA_SCU_SERDES_PCIE1:
@@ -970,12 +1028,12 @@ static int en7581_serdes_phy_set_mode(struct phy *phy, enum phy_mode mode,
 		return -EINVAL;
 	}
 
-	spin_lock_irqsave(&priv->lock, flags);
+	guard(spinlock_irqsave)(&priv->lock);
+
 	val = readl(priv->base + reg);
 	val &= ~mask;
 	val |= sel;
 	writel(val, priv->base + reg);
-	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
 }
@@ -1220,6 +1278,7 @@ static const struct en_clk_soc_data en7523_data = {
 		.unprepare = en7523_pci_unprepare,
 	},
 	.hw_init = en7523_clk_hw_init,
+	.pci_unprepare = __en7523_pci_unprepare,
 };
 
 static const struct en_clk_soc_data en7581_data = {
@@ -1241,6 +1300,7 @@ static const struct en_clk_soc_data en751221_data = {
 		.unprepare = en7523_pci_unprepare,
 	},
 	.hw_init = en751221_clk_hw_init,
+	.pci_unprepare = __en7523_pci_unprepare,
 };
 
 static const struct of_device_id of_match_clk_en7523[] = {
-- 
2.55.0

