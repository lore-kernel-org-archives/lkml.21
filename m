Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581453;
	b=wJAHJ/PCCCaw6hH0sXZyXwOX+89zKpSfurSJcSnTffreClUvIaxaLJ8PyEpC40ypmTsF
	 tsuZ/sH6CDrAtG/bA0UtKNbXpfQTudQIjrbg0e+OUYeVCps4vDuBknJVucjiC4jZkl8E4
	 t8vgDfrcgwL9zC4dmkdgonjr6J3TqQ7oOO3qKvWTqisXJaeiPoryka1596HuggQlL5RMw
	 2ZROYMrisL09R6U3hFBFvpbUV0tKH7StdhMEl0w0/kcZYF2H/RFG3UVG21YkjZWneDrRv
	 OZmJ7AwzcJPTBDyRJxNL8ish8FfXlk7QmbA3me8ewcabDdwsf70ZM/garNWVRGBn3rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rkE7p4aQLSp2kYV7vRBIkJ3P+8n0i8bdfYVP4ePHIkQ=;
	b=t+HA+p234vDJ1ara+3ykTwiOt2BmEHFdrMVVUJk1GPK4ydDyz3m/rM75L3O+mwrzp4zp
	 JEwXs5NsdcxX588dHv7RiBm1fyw9mIzFgTzlmGmKq/gL4yB3MQomYENdb/oZ9GoA0GvUe
	 oKch2unP5FPHd9v3JV71wGC6ibEX6nII2d00EUXvlUA5RlguOxbWklpUgibZFm9VGcutG
	 3NuOzBSGCnEtOIE7YpvC7QwftySHuR3QHvHWoLOyfcshWFjelGKkncF3Cipr1QGIMZ1B+
	 anNIM+NfbHDulMTTPUVhts8CdhoxHx45C560j8XTq2KEVAKvBwo5f89ymbImF09ITiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xTXrqdTe;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF0F606A680
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BF0F606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xTXrqdTe
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so3183972b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581452; x=1796186252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rkE7p4aQLSp2kYV7vRBIkJ3P+8n0i8bdfYVP4ePHIkQ=;
        b=xTXrqdTe+k1Bcn1+GxFlxR2ebQqsRT1M6j+6aYNb9r7mHlRo1fwWLDw4IySXue6Dcl
         KBC1LPnqdZpfI/A+9xmUzotNvieDwV3SMZ4p8tIm9TdJ8zO6mwFBwH3pm3xWXrevrabk
         K2w07uepa6D84x7VWDXgxWsceiGrwKmT0aobivANPe75XkwyR4R4xCcK1XmFWgM9LT2m
         x73zYmJNUkyLBfdibwDMgg04dO2Cn7IXlVfBYXZu8tF152ii0uqWAh3Mhxg0ey3JmFg4
         1fIS8fEaOY7anibxyTO+n5sgar3Ls0+2rGe3zJpPeCBNZofGyNj3rnccEVzZB4wgIeUh
         iCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581452; x=1796186252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rkE7p4aQLSp2kYV7vRBIkJ3P+8n0i8bdfYVP4ePHIkQ=;
        b=LRIQC7Ia0iQCBrWCn4ttY/IiV5f3P7AroAzCJeKCrvYUjnnduPoayrjCtNT0J+8XKa
         5aR7RxUMXuZrYu3uAVN3wEtw/g9WvOAnV4Bp0kjyYhuOy8s7jbWJFWIzTAXpCKlqjaMH
         c6G2gavIdV3mJ8HYwFKbfKO/vjshdk573Mvj5/Lo2yTs8pW1kxNXfwwGkhFhfE/F5ej5
         E8Vnj+xNJiUcVB+dkgE25rbzEVcKJ5AuOMS2Y1xExhWHGsq+5ZFsLia11hv/lRGGPZFL
         OofeBmizagDROml/7gwGqPCYIDyxvBl5oYw425apvETO6FWP4JH1U+qAFDBZHNTCG4BL
         vc3w==
X-Forwarded-Encrypted: i=1; AL+hErHNFpNCQMwmrpw8uyHd+XmVbhCQRupWpsYc2RhBdNIQ05rND4DwP2SRIft0I3b3VV8urwTUGYFUDKqLrjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DckOvc7mZrBnWLiY6dxUwx/5FD7UB1J+DAnW4V5k1XRO7a7PV
	pb7hY0bTz0orOJrW53H9Z64BdCcAdAkYc4zni6YTmvCcn0NzewbcJ3hB
X-Gm-Gg: AZFdTZfH0885mgIv50DlmV2pJDcAI9KtWogS2zjzH4bzzihtW38fn/1abHEnknMGKxu
	VO55PPn4UlNJ5tbx2SabCWe6juGMfl6aXij4+qHAhxWBDAmPqI0sKOUzUdbV7XIV5nFfCHOxlx9
	TGVRDHcO8PSYEYHXvWsNarv++bqoF7sI1Nay7zr0ILz55WAkMtUOlDugqXbNm1xBnpLe9TOuqJY
	V2brsUTZk2oYpzx8tmUCd3rCvN+O7z59jPQXpBDusJo7nmMAz6kiOhEzTCQn+AFlGXkpSphuf/F
	SA8zMv6ib4G+MbtPHRNClI/JPdjh3dkDVOLQDblinwgCpztaupaeP3fbeeNdE3WLbh+/KPIBw6D
	V+EiWy70jfpQ2jcO6eIqGFsKFhcAb+5q1R177wC1m9BeJHdgb0IqWSSHkPZiqEnmbx3+/iODkM/
	rcxPlD7KsWboNyicUSzSesSRue7MD5LKwE86kYj8f3Ifdlq8ZCPJznerNI8eD+SFbQidkjd65ci
	k9vAawzzBY8dxvMjV1+4ADQh6TcoL3aH30DF0KaRC8l1j16sxOQKYkMlEx8cyCzftfZzai7Ah2s
	F9NkMXFZaSmFHTA8JGOKS1pW2SiMJD5EqUyxeULOs1CzwVU5
X-Received: by 2002:a05:6a00:4107:b0:89f:ed19:f0ba with SMTP id d2e1a72fcca58-8c7dd9d67bbmr11654419b3a.23.1795581452525;
        Tue, 24 Nov 2026 20:37:32 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1e2f3sm7882825b3a.54.2026.11.24.20.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:32 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aksh Garg <a-garg7@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Manikandan K Pillai <mpillai@cadence.com>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Hans Zhang <18255117159@163.com>,
	Yao Zi <me@ziyao.cc>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 5/8] phy: core: Add managed phy bulk data helper functions
Date: Wed, 25 Nov 2026 12:36:36 +0800
Message-ID: <20261125043639.249525-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125043639.249525-1-inochiama@gmail.com>
References: <20261125043639.249525-1-inochiama@gmail.com>
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

Add device managed variants of the phy bulk helper functions. So
the driver can benefit from automatically managed phy handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/phy-core.c  | 139 ++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h |  31 +++++++++
 2 files changed, 170 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 87a317a144b4..eeba1b899c20 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1281,6 +1281,145 @@ static void phy_bulk_put_all(struct device *dev, int num_phys,
 	kfree(phys);
 }
 
+struct phy_bulk_devres {
+	struct phy_bulk_data *phys;
+	int num_phys;
+};
+
+static void devm_phy_bulk_release(struct device *dev, void *res)
+{
+	struct phy_bulk_devres *devres = res;
+
+	phy_bulk_put(dev, devres->num_phys, devres->phys);
+}
+
+/**
+ * devm_phy_bulk_get() - managed lookup of multiple PHYs
+ * @dev: device that requests the PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data with PHY names set
+ *
+ * Gets the PHYs using phy_bulk_get() and associates the references with
+ * @dev. The references are automatically released on driver detach.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int devm_phy_bulk_get(struct device *dev, int num_phys,
+		      struct phy_bulk_data *phys)
+{
+	struct phy_bulk_devres *devres;
+	int ret;
+
+	devres = devres_alloc(devm_phy_bulk_release, sizeof(*devres),
+			      GFP_KERNEL);
+	if (!devres)
+		return -ENOMEM;
+
+	ret = phy_bulk_get(dev, num_phys, phys);
+	if (ret) {
+		devres_free(devres);
+		return ret;
+	}
+
+	devres->phys = phys;
+	devres->num_phys = num_phys;
+	devres_add(dev, devres);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_phy_bulk_get);
+
+static int devm_phy_bulk_match(struct device *dev, void *res, void *match_data)
+{
+	struct phy_bulk_devres *devres = res;
+
+	return devres->phys == match_data;
+}
+
+static void devm_phy_bulk_release_all(struct device *dev, void *res)
+{
+	struct phy_bulk_devres *devres = res;
+
+	phy_bulk_put_all(dev, devres->num_phys, devres->phys);
+}
+
+/**
+ * devm_phy_bulk_get_all() - managed lookup of all PHYs requested by a device
+ * @dev: device that requests the PHYs
+ * @phys: pointer to store the allocated array of struct phy_bulk_data
+ *
+ * The function calls devm_of_phy_bulk_get_all() directly, but sets the
+ * @np parameter to dev_of_node(dev).
+ *
+ * Return: the number of PHYs on success, %0 if no PHYs are found, or a
+ * negative error code otherwise
+ */
+int devm_phy_bulk_get_all(struct device *dev, struct phy_bulk_data **phys)
+{
+	return devm_of_phy_bulk_get_all(dev, dev_of_node(dev), phys);
+}
+EXPORT_SYMBOL_GPL(devm_phy_bulk_get_all);
+
+/**
+ * devm_of_phy_bulk_get_all() - managed lookup of all PHYs from a device node
+ * @dev: device that requests the PHYs
+ * @np: device node containing the PHY references
+ * @phys: pointer to store the allocated array of struct phy_bulk_data
+ *
+ * Gets all PHYs from the specified device node, associates the allocated array
+ * and PHY references with @dev, and creates a device link for each PHY. They
+ * are automatically released on driver detach.
+ *
+ * Return: the number of PHYs on success, %0 if no PHYs are found, or a
+ * negative error code otherwise
+ */
+int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+			     struct phy_bulk_data **phys)
+{
+	struct phy_bulk_devres *devres;
+	int ret;
+
+	devres = devres_alloc(devm_phy_bulk_release_all, sizeof(*devres),
+			      GFP_KERNEL);
+	if (!devres)
+		return -ENOMEM;
+
+	ret = of_phy_bulk_get_all(np, &devres->phys);
+	if (ret > 0) {
+		for (int i = 0; i < ret; i++)
+			phy_add_device_link(dev, devres->phys[i].phy);
+		*phys = devres->phys;
+		devres->num_phys = ret;
+		devres_add(dev, devres);
+	} else {
+		devres_free(devres);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_of_phy_bulk_get_all);
+
+/**
+ * devm_phy_bulk_put_all() - release the multiple PHY
+ * @dev: device that wants to release this phy
+ * @phy: the phy bulk data returned by devm_phy_bulk_get_all()
+ *
+ * destroys the devres associated with this phy bulk data and invokes
+ * phy_bulk_put to release the phy.
+ */
+void devm_phy_bulk_put_all(struct device *dev, struct phy_bulk_data *phy)
+{
+	int r;
+
+	if (!phy)
+		return;
+
+	r = devres_release(dev, devm_phy_bulk_release_all,
+			   devm_phy_bulk_match, phy);
+	dev_WARN_ONCE(dev, r, "couldn't find PHY resource\n");
+}
+EXPORT_SYMBOL_GPL(devm_phy_bulk_put_all);
+
 /**
  * phy_bulk_init() - initialize multiple PHYs
  * @num_phys: number of entries in the phys array
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index c170d9aeeeb4..a51b3c283efd 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -326,6 +326,13 @@ void devm_of_phy_provider_unregister(struct device *dev,
 int phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id);
 void phy_remove_lookup(struct phy *phy, const char *con_id, const char *dev_id);
 
+int devm_phy_bulk_get(struct device *dev, int num_phys,
+		      struct phy_bulk_data *phys);
+int devm_phy_bulk_get_all(struct device *dev, struct phy_bulk_data **phys);
+int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+			     struct phy_bulk_data **phys);
+void devm_phy_bulk_put_all(struct device *dev, struct phy_bulk_data *phy);
+
 int phy_bulk_init(int num_phys, struct phy_bulk_data *phys);
 int phy_bulk_exit(int num_phys, struct phy_bulk_data *phys);
 int phy_bulk_power_on(int num_phys, struct phy_bulk_data *phys);
@@ -603,6 +610,30 @@ phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id)
 static inline void phy_remove_lookup(struct phy *phy, const char *con_id,
 				     const char *dev_id) { }
 
+static inline int devm_phy_bulk_get(struct device *dev, int num_phys,
+				    struct phy_bulk_data *phys)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int devm_of_phy_bulk_get_all(struct device *dev,
+					   struct device_node *np,
+					   struct phy_bulk_data **phys)
+{
+	return 0;
+}
+
+static inline int devm_phy_bulk_get_all(struct device *dev,
+					struct phy_bulk_data **phys)
+{
+	return 0;
+}
+
+static inline void devm_phy_bulk_put_all(struct device *dev,
+					 struct phy_bulk_data *phy)
+{
+}
+
 static inline int phy_bulk_init(int num_phys, struct phy_bulk_data *phys)
 {
 	return 0;
-- 
2.56.1

