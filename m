Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581440;
	b=KfBG5Fuc0hKKZB7sFHUIoAhLIiKqG88H4rwRFH5NG3ojYXNH6aUFqigQdWaMEq5CTAyI
	 dDO0crBDN3L319/xeVBdPGheAfd26y77doeWqYtYifELSPwlsdogs6rnF1LXTIqESlSmP
	 pUrV/EMMJZUCtC9zLWIa6VzTwxNQy2DaC6I8Iv67r7wALBTG77020kc7JJ/vOKi8c+09H
	 Y1Sb83sz954O7aIgxfuGhuLe7rDC6jlIj9RvjxowxOz3DcBvL2a3lfhcuBBJM1s1LOU+0
	 n9SIwDwwjLzE8EoqzXYPwCUaUcGK/HB9fnum7bv5cJWSDJCysG0Es/EgFYjC74YOJ6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v73lnBxXLvBxSu7XkVP0pFYU3Balrjs//m2fQ2pstrU=;
	b=AtQw+XfE4bZc8WPG9ryhkJbRxjU8cBUkrV7HWyMXWfERCQ+zVbzbz+QNgrii6azpwPu0
	 oSpP0IzSbgThAo/2zhvXFo6gXgfxvWRTIx3vNOsVXSRZqrcRkx23ufxQHoCCIikn2o/IO
	 t2h0MTnzZvmUWav2OOSorfb3fJd+RmrOzYBdH4j93QWaCN8qTw3OwDq7vHQ5UE6sodStM
	 FrUwM5nTY8gfRR4OX0zU8SCcmAThJ/ALqeo3Wfjuvr9JDt0ZXvams8E/0IBHTKqEcLmsl
	 wPEmyJkprJaJUaTlACDRB77nadkVveKdZFkvvKei76hrIi5Cj+1VLa0GXRYeAFHmHkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hoAvfN9g;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE89606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EE89606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hoAvfN9g
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f04bea9a93so46349345ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581439; x=1796186239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v73lnBxXLvBxSu7XkVP0pFYU3Balrjs//m2fQ2pstrU=;
        b=hoAvfN9gzx2LyLk/gEV2pCQQvL2eHN7Ybl9S9sseLNfnxe3TLOcWzkEHsO7H6i52Z8
         ITIu0vs7T0b8u7ysTdtMP3BWhjQlfdDNdds8EuQtokuuaolNc47LQgMP5JHrlNBrvvNY
         q9gGurHUD/mXM8g3m3m4nnxtcS3ZNNq1GBaQ7k8tfmyG0pdFAYOWPER24dpLCCp52kf3
         DDrkI4f/Kew96kmDkgo7bik5bil4SFvJCzb0Eipy3PVqHi4pPc4ymxRehHa7UcOcivEg
         4C0+klwghxMs7IUhkeI6brCl6T5Hh7pBcL0nbKwnipb1PZLIUD0kE2x12R/M4CRr3dYs
         M4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581439; x=1796186239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v73lnBxXLvBxSu7XkVP0pFYU3Balrjs//m2fQ2pstrU=;
        b=gNsSYKKW+ZPrIjuxd0gN74+/fTw2qzt6y2e7UevRqekpQ671AMVekqfIq+JW4qVqe3
         R4YLySQpvnsk/zfOiKRDFoWjwMTgBJuRC0U7z1kL6aTG6LpcExSt3E1P/pev+B1ulqJY
         qRfQVf3k3z8RN2Sfon77gpVehFcgnCM2M16G+ZxvTcsp/WjysbewfLvIDc7oMSr5BVvO
         EvOJuxbW5viW3tJkRACrNt6LphsRpDJLkif+z4bczgCo7exUU7O2hqEmlUnfWWeCvSXR
         4IMdg64n4WNi9qv9dHeDZLDs/WswD2YSqnskIITGJlkPVCjmc/W5r0vuz8ke3A5T7Ijr
         TgbA==
X-Forwarded-Encrypted: i=1; AL+hErEGaz6aYdr0PM0k4tUig+577466lKbwKX76bRpQj7lKRsKENhuVneXy7AxWCOjEfZbDXvGTrxjewq96r+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zgg72J+NxpIhl84zhlSfhYllhn0Tk1y4M3zKn/CgyPfJdbgeS
	FiHESxyP7Naf9Gk209nACXIESxToxFgrcrGM7KK9LOeyMEB2Hv758z01HybIOQ==
X-Gm-Gg: AZFdTZc20bqVJFRClrhmSOAUKWz8MiH+1m1LKVje4a4bbqNmozKwwWaqtTmOQhHHAKy
	V4yZmq5CxZvS4KzZ4+Ln1suWghxAbBAUYV2WP3FWuw4aSr3FT59TvqzIYJ5lm4ur5JBCasFHzEn
	v8LhLuvJDVGP3ZqIHVbIJW+q9tLjcP7qc3dJpom6FA//GCeFcvT9FJlTzpCUhz/1jmCU+14/gG6
	V2LrWuxSZAi4rYcDqeDq5DdtFHR7FF0SzfJXU6AF/UpzgRRJ5OJdw7qKbn18tbBPKUmr4NNMcDZ
	84IKMUIlwDfVtVI4dJNjukQYftihcfmbrrX/AUD3DOasBS4emnBwKo4KNQlLaZZRWjSa2mItpAh
	tb50e18CidwGBMLWDB1vN/V5e7RxJ1EpMcSTwZ4ypSJTTRKty5iV5mfwdhwwB0TXFTtvvm160lJ
	poduprdcFNjIjvjHRk3+S+0prwMzr9p6Uw/bkq7k+kzts3ERb0KMA7rp3uCp3OmcIbiWTSzqa5h
	wdrFXbpJDY8SXMxMNbcZ3fUlVetW61ufUFhKB10o76UlGNzDp/dGId8jg/bCFeivknbeFT0qRAd
	360otdfXDxpsMWzEyghEDsZSo/8=
X-Received: by 2002:a17:902:dacc:b0:2ed:472:b9d6 with SMTP id d9443c01a7336-2f03efb1397mr182475285ad.2.1795581439561;
        Tue, 24 Nov 2026 20:37:19 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c72sm78614345ad.54.2026.11.24.20.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:19 -0800 (PST)
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
Subject: [PATCH v5 1/8] phy: core: Add common helper to add phy phandle device link
Date: Wed, 25 Nov 2026 12:36:32 +0800
Message-ID: <20261125043639.249525-2-inochiama@gmail.com>
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

It is very common for adding a device link for phy phandle
for device managed phy helper functions. So add a common
helper for future reuse.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/phy/phy-core.c | 46 ++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 597e6b234f5e..b7550ca37e66 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -606,6 +606,27 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
 }
 EXPORT_SYMBOL_GPL(phy_validate);
 
+/**
+ * phy_add_device_link() - Associate the phy with the device
+ * @dev: the device consuming the PHY
+ * @phy: the PHY supplied to @dev
+ *
+ * Add a device link with @dev as the consumer and @phy as the
+ * PHY supplier.
+ */
+static void phy_add_device_link(struct device *dev, struct phy *phy)
+{
+	struct device_link *link;
+
+	if (!phy)
+		return;
+
+	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
+	if (!link)
+		dev_dbg(dev, "failed to create device link to %s\n",
+			dev_name(phy->dev.parent));
+}
+
 /**
  * _of_phy_get_with_args() - lookup and obtain a reference to a phy by of_phandle_args
  * @args: of_phandle_args to the phy
@@ -805,7 +826,6 @@ struct phy *phy_get(struct device *dev, const char *string)
 {
 	int index = 0;
 	struct phy *phy;
-	struct device_link *link;
 
 	mutex_lock(&phy_provider_mutex);
 	if (dev->of_node) {
@@ -833,10 +853,7 @@ struct phy *phy_get(struct device *dev, const char *string)
 
 	get_device(&phy->dev);
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 out_unlock:
 	mutex_unlock(&phy_provider_mutex);
@@ -912,7 +929,6 @@ struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
 			    const char *con_id)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -927,10 +943,7 @@ struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
 		return phy;
 	}
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 	return phy;
 }
@@ -982,7 +995,6 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -1006,10 +1018,7 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 	*ptr = phy;
 	devres_add(dev, ptr);
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 out_unlock:
 	mutex_unlock(&phy_provider_mutex);
@@ -1059,7 +1068,6 @@ EXPORT_SYMBOL_GPL(phy_get_by_of_node);
 struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -1073,10 +1081,8 @@ struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
 
 	*ptr = phy;
 	devres_add(dev, ptr);
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+
+	phy_add_device_link(dev, phy);
 
 	return phy;
 }
-- 
2.56.1

