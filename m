Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711276;
	b=joKaaAMQv8ucUxYoVR528e3inDs8pnIHf3zqFWvSodV0Su5cwLF0oUhoMW7fS08qtwYB
	 m80FS2tofG94/jyCOHJl0WmHE5ftvgzxsHtIlAPIGgGU5jGab+A6spDKoiUNPLUDqAij3
	 y20692x3834UJzJxyelcvjAvi24T35wTQeRppEF9aZi7NGVM/uPpMpRomGlnFlUbXMFk1
	 MMWV41HNKptCyv27PG8U/9aGI8dlrvDcdEWaj3pQDY5tPz7YonrlRfyy7tSCWODWBWfGm
	 Y4uQhv2oGIm4/WtFskUIu4dzJLpuPIIrtlMCwrpoygigcQLlm/05Ys2Oi+SXsZ5G2PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jU16bWHumwV20jpiMrBRT2UNHlED4a7CUl264/set1s=;
	b=j2/VNDKNb5UaSPW7wiB1n137i0RofbMt/q6pBBQZcU1+xw9Rcux1n5V+3y7m/H6ZKJkr
	 opkHYWHCNwwwLEeSTwG0AWoX9AHzCq+VgQwtDUgG4QvwwW6uDKqo6nde4qbJJWvJ8qFF1
	 Zs+Cc55hNSTut9XYtsL9hnQwsaNxryQwSag/Jo6sH4+pLhHv2MTACsjC8hELgBfTuCw0i
	 jScEC9/zRsgGEhXGwK4ll3hn+G954SwzEju1TZB/GSmpYsQuC10/uuFI/Ovvnq41oBk0x
	 Lr7muf4XFrzcc6ul8MuIeQfgYUvZJO9/HXAHUmjqWBfmOAHsImlOXTapSmBfKJo/2LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lp1ALPeY;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950A2606A339
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 950A2606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lp1ALPeY
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a9be758734so4592190f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711275; x=1796316075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jU16bWHumwV20jpiMrBRT2UNHlED4a7CUl264/set1s=;
        b=Lp1ALPeYbN3Y4Q21lzfxRACgs9teSones3Qdq3Ep5tB5MOFjC1Lqgzk38Ymp9xH78z
         HUv39VyynAoh3n2mwZ9LOUBIrQvM0c3ILn0bc/kNW/w/NAoiNMegggP4rHfvsO17YfII
         Q7x6lKJbGU5wojgYh27VOfk20edTCgwfYLFTUF5C28NIjPWKnwCHUnVr5vK32lVBOh6U
         MAz9NmLiqQVyTsiHksXcFvF9UcgcIoi+zCqSQ1cVJYGqMVPpSQsdGIqVBjuwB8gH2iwW
         DHhBTSlHTOJXXFmN01OoDQlthI+w/Ld28JqJC94bVpGjZDFQ7ODPj4ZVXsnuBY7qq7Y0
         /EJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711275; x=1796316075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jU16bWHumwV20jpiMrBRT2UNHlED4a7CUl264/set1s=;
        b=wEwqHb5e38mqopG1UH4D90FlL59nWW+aPVcj74YzMoZFuNB4y+QHv7n61LuSXyRJ2u
         Fam0XlnAxJLjleHJ0m0ulYMfazvlme21lekEy3fcDOFIRr+ZTogffcxeXnlTc0qAsDyL
         s1DWGGK9eURh17LSJyh6LH1OY2QilUY7Z/Jj6JZvJ4v1fE3jDMC8q25yyE78s6lpRzP0
         ANiErwKvXuk+Gon7sFw44+VX/wbzYGQ8iWgbenwA8pcmnLYB1sylFTx+jMF2B+0hLkVd
         CmNjOfBJB5/AjMEHKh0rToMu0KNcE8bQZxn0mgTpFRpTTlIgGJw+RGiKXhUJUAt8+C0Y
         gYRg==
X-Forwarded-Encrypted: i=1; AL+hErEglmo4YRwTrRWtZUos2RiEaUu0dS6cRcgsV6FjCmbs7lfR+dlHAIJKpYxFbUQwdQmhZHTe8ekq/stSF2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qZw1Brpw5dQ68l38wlCiFKDXQPk7gLFubC4D0KDKWtSEun7wZ
	dyLtHZ84X7LYS1xbpeXvnq+AwtohNK8XDfbEIDIK5kTkuvIa7qRZA76n
X-Gm-Gg: AZFdTZdUCCHI1AKnzmyW+Da2l8sz6V5xyGsCvOoIWNbOzsnZA3FbREU4p/lx1nt/X22
	CcmPpn9GPluvYT6G/1D6jb5I3NsKDnGn7SCg3x5JtnTaE2MCt5oajxXiQlNaozNGhKj3bUfcKux
	BN3peSdh18EY/igkelIXneS1g5Y3eJ1Cgfh4Vjqt5JYS9kiD1IlTEgW6jQjNEHzYCiogn3EK3NG
	rWHaci4hR5OvcrDhA7hn25G5SW34VxRfyo40di88mYJUD3fJdwlfSga77XFWDf2TfA/VZhyH1uD
	umOETC7XDPfY3HazVQji+GXArLI80MX687L3NJCV6L8qlKsRgXhRqaGfufQO+p46wYgPFpKpqMD
	ffOBna8lE4ZalA/bujzmt90NjvWA/CQHkMPeWPuCMSp3DZ4ay5XUkDNK3rNg4Y59RhbUmWO6pko
	WWazOa4ge0oH67lu2ng/0fE/WbuwZM5Bjwu6zqXyR34DyuXASPAO6nNe6ZHr1v6I9B8uvc3WTre
	6CCGaOaVUA6/d5LxL0R8IxaCbjdni+eFHSeFCUdtT+5nxIeh9VI7DEdJEt2Ff3CiXvpvABE8Vou
	5RUhCdm55xlogbvNoMWrtOSLbUy3oNKyfF9SWRuViybuu0b5H3hKdbk=
X-Received: by 2002:a05:6000:4b1e:b0:48c:7143:610c with SMTP id ffacd0b85a97d-4abb2910b8fmr41814928f8f.36.1795711274674;
        Thu, 26 Nov 2026 08:41:14 -0800 (PST)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:6ce3:c28c:2097:7d09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm39333942f8f.34.2026.11.26.08.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:41:14 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lucas Stach <l.stach@pengutronix.de>,
	Advait Dhamorikar <advaitd@mechasystems.com>,
	Marek Vasut <marex@nabladev.com>,
	Peng Fan <peng.fan@nxp.com>,
	Adam Ford <aford173@gmail.com>,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 2/2] pmdomain: imx8mp-blk-ctrl: fix suspend/resume order
Date: Thu, 26 Nov 2026 16:40:59 +0000
Message-ID: <20261126164058.2373605-6-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126164058.2373605-4-ivitro@gmail.com>
References: <20261126164058.2373605-4-ivitro@gmail.com>
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

From: Vitor Soares <vitor.soares@toradex.com>

As in imx8m-blk-ctrl, the GPC domains behind the HSIO and HDMI blk-ctrl
are driven through the virtual devices from
dev_pm_domain_attach_by_name(), which have no parent and no device link
to the blk-ctrl or its consumers, so nothing orders them in dpm_list.

On Verdin iMX8MP, with the phy-fsl-imx8m-pcie module loaded after the
HSIO blk-ctrl has probed, the virtual devices are suspended before the
PCIe PHY, and the CPU hangs in genpd_suspend_noirq() of
32f00000.pcie-phy with the HSIO bus domain already off. The system
never completes suspend to mem.

Add a stateless device link from the blk-ctrl to each virtual device,
bus domain included, so they are suspended after and resumed before the
blk-ctrl and its consumers.

Fixes: 556f5cf9568a ("soc: imx: add i.MX8MP HSIO blk-ctrl")
Cc: stable@vger.kernel.org
Co-developed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 29 ++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
index 212d491c75e4..e967ae7eda30 100644
--- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
@@ -657,6 +657,17 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(bc->bus_power_dev),
 				     "failed to attach bus power domain\n");
 
+	/*
+	 * Make the genpd virtual devices suppliers of the blk-ctrl so that
+	 * they are suspended after and resumed before the blk-ctrl and all
+	 * its consumers.
+	 */
+	if (!device_link_add(dev, bc->bus_power_dev, DL_FLAG_STATELESS)) {
+		ret = dev_err_probe(dev, -EINVAL, "failed to link to bus\n");
+		dev_pm_domain_detach(bc->bus_power_dev, true);
+		return ret;
+	}
+
 	bc->power_off = bc_data->power_off;
 	bc->power_on = bc_data->power_on;
 
@@ -716,6 +727,15 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
 			goto cleanup_pds;
 		}
 
+		if (!device_link_add(dev, domain->power_dev, DL_FLAG_STATELESS)) {
+			ret = -EINVAL;
+			dev_err_probe(dev, ret, "failed to link to %s\n",
+				      data->gpc_name);
+			dev_pm_genpd_remove_notifier(domain->power_dev);
+			dev_pm_domain_detach(domain->power_dev, true);
+			goto cleanup_pds;
+		}
+
 		domain->genpd.name = data->name;
 		domain->genpd.power_on = imx8mp_blk_ctrl_power_on;
 		domain->genpd.power_off = imx8mp_blk_ctrl_power_off;
@@ -726,6 +746,7 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
 		ret = pm_genpd_init(&domain->genpd, NULL, true);
 		if (ret) {
 			dev_err_probe(dev, ret, "failed to init power domain\n");
+			device_link_remove(dev, domain->power_dev);
 			dev_pm_genpd_remove_notifier(domain->power_dev);
 			dev_pm_domain_detach(domain->power_dev, true);
 			goto cleanup_pds;
@@ -775,10 +796,12 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
 cleanup_pds:
 	for (i--; i >= 0; i--) {
 		pm_genpd_remove(&bc->domains[i].genpd);
+		device_link_remove(dev, bc->domains[i].power_dev);
 		dev_pm_genpd_remove_notifier(bc->domains[i].power_dev);
 		dev_pm_domain_detach(bc->domains[i].power_dev, true);
 	}
 
+	device_link_remove(dev, bc->bus_power_dev);
 	dev_pm_domain_detach(bc->bus_power_dev, true);
 
 	return ret;
@@ -795,12 +818,14 @@ static void imx8mp_blk_ctrl_remove(struct platform_device *pdev)
 		struct imx8mp_blk_ctrl_domain *domain = &bc->domains[i];
 
 		pm_genpd_remove(&domain->genpd);
+		device_link_remove(&pdev->dev, domain->power_dev);
 		dev_pm_genpd_remove_notifier(domain->power_dev);
 		dev_pm_domain_detach(domain->power_dev, true);
 	}
 
 	dev_pm_genpd_remove_notifier(bc->bus_power_dev);
 
+	device_link_remove(&pdev->dev, bc->bus_power_dev);
 	dev_pm_domain_detach(bc->bus_power_dev, true);
 }
 
@@ -815,8 +840,8 @@ static int imx8mp_blk_ctrl_suspend(struct device *dev)
 	 * can power down our domains and more importantly power them up again
 	 * after resume, without tripping over our usage of runtime PM to
 	 * control the upstream GPC domains. Things happen in the right order
-	 * in the system suspend/resume paths due to the device parent/child
-	 * hierarchy.
+	 * in the system suspend/resume paths due to the device links to the
+	 * genpd virtual devices added in probe.
 	 */
 	ret = pm_runtime_get_sync(bc->bus_power_dev);
 	if (ret < 0) {
-- 
2.53.0

