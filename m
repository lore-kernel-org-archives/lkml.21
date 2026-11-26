Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711275;
	b=lND3C8CQMz4Q7ZXqZzDqb/m4/7/GmM4588G8/Fg6ZYnanh3BVJt8mTgBLehwjbyClcoX
	 P7atBAfYgPdwpq0gS0w3By0sVAfie8Jh3qRx2iduuY7NiXDsTojvApW2autTvg7BvbfRh
	 u9Gt6LbSSBpQeSHxge/44tNqYzzMSHAEO/yv1QCVmCO7BRLaHRoMfMA1ZTHN8xCBg6T1B
	 gOumCq5c4PEKAs5Ys3FcV7e5SyjatsyXX9MG2UQdkGlUTKSAXokvUpC7RaBz8lqEiGkB+
	 wFjE0gB2pIeNUob5cgKXHD5cNMfrj8dB55v7OeuVcGbKFh3UsXYEg8FtU26NYH0Eg5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q+GtbyKG6IlUifjaNkVYhqRiK3cIEWpsM/x3VFQZRLc=;
	b=Ddi/UHdCvv8cELkVCHK+brwLt1cA4gg8A6nOIXRpt8tRgbcEysv+ahcP/Kj0NHCp0VqG
	 h7aXR/HseW5OidQdV/mEUyN6Criu73nY8/zlp5HRfCqmBI141pTQfvLgpZCJRm+E0PQ8B
	 N1I2hrlolsd7j9D8syJoUrqjt/92bDao3bFxXY0B+W/JHUlP1mJUcxPwQeF4X5+R/EKrh
	 wy4VtfQPnTDLCsWl3r7qLZw8vgJxCaeZG1RpSMIccXkveCEfu+E53rcZr01uKp/iwN4Wx
	 fFysItU+LyQDfmQLqkpO7NNYiXhdLF09bkzsprEuTygrel42Pe01Rdwdj8VgKQBURxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YINEbw7u;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AA9606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8AA9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YINEbw7u
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so5127308f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711273; x=1796316073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+GtbyKG6IlUifjaNkVYhqRiK3cIEWpsM/x3VFQZRLc=;
        b=YINEbw7uptYv9pUceKrooCL+B3+pFgVifA6FchHcryDBEhx7EJAHtrJX/9e6Ahg3sx
         f2hSgSwTPBD1YqeeR/UaM7talD9681jclHrKeM8t8ey4JJDtz/WZSainQp01MV+0y/p3
         +1f1dAo5s0vkQ39PbvghYZt8AaWhEhD0Vz2UIGe7l1dEqE/fE9HuTRnrM2znQ5XwWzsF
         AbQAv2hLDRal35K/IPe67JsOKuUS9FPrN09JluHGPFvhowdcJQZIQkn+XeXuK7YhPfob
         GdpsVrhdABeLCEymUpxGXeau8rtb/dM+dT8IfgGRZiApyK0z26RXQqAA+FG4kueHUuIf
         Gmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711273; x=1796316073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+GtbyKG6IlUifjaNkVYhqRiK3cIEWpsM/x3VFQZRLc=;
        b=v8dRFShXnO+KAM8ez8Zv1FuKKB5qz7MzfOdnGjl5RPaQQAU+fs1BdpjTax6WQOgYsz
         VDr/cN8DrX4Ayip1Jfbrlo0CY8do0y6MOl721veKRwg4N/6ccTKWvGzI0+BR/jWLsgpt
         hQSrT5yBu7tZogRkhaOF2Vt1fMnikY/hKrMz5mXlGXEZfphZAdnFr3QNE+DqB4FEcJYe
         pSUJGO0ljNQ9h24N1M7B8ou5dck8ywXenmwQRkuQbWZK3WY17jouTxvN8BSaE/eaiGcp
         MMaB3LU+JlL304YsUM8//3uE6DfIKd2Pd4oQehvlg1oo/jDQqJYmEhB3aM496HNa3L59
         tiAg==
X-Forwarded-Encrypted: i=1; AL+hErHi9nDmhwttn8kTyUaNbFP79Z1hrqhHMjYxig3UNjEMRAFnopRb3x0O4y6FZH+hKncDMtQ3kSxKKSXZQow=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t2/C2sr4LuLcTNhtUNRtMrwsto5KrQ1KaLxSjJ3YjGwonFIX5
	TDBUrs5elHlp7Gb4otmBgfOQ2d2LswOgIsynAz2v9/WbZ24G+ap9m4+a
X-Gm-Gg: AZFdTZeo8CQVwG/p3NcFs7Ejg6U6TpALXg4LxWicchAeMKOE/h1qO7KIBVkvh43Qq2N
	2hVdDgw7K9rBqlUkFQtcpAJzy57zryQcj99/85O/MxeIjpLTIcQQs2cf4/pR2LcFKBPC2Npi/GD
	7IKwMTHRTUVB+I32/U9TAdrwjRqkCINdLCgMk7Rm7FPaNh51uB7T9r0lcz8rjL2UBFuQ8j4d3sw
	ZzS3EtEzC37t296iwTrgvRcQvfSLYiAevQoxte6ehFmyQ1lBCdrT9Rfs2XM6iC/2QjBJynGSvrM
	pLUd+1qekF3cGUI51iPTbAvWEWdfRuVQjk+aeuB2UpnX6OgS0VxnVXOEL4OYNN0mcgk+Er40BBS
	wtsOrTYf22EV1qVqJh9ZBBXaUQLBqL2gYsgz28D0on5ezYmDOTqzkPXBN0kxni+u5S88JBpBiin
	Ni27Hk+aMYyJWEydjOF6vc71crAcOUoHROx7s8dop2w785L0z44z/P7fOcSNxtilKOl3QR17miP
	Hck7vulNry0bNhzLgaDpedr4pGXbRgLF5tDmAOqBGgk6ORvyDc9StjgQv/FDdX7SoR6SpmS3N+A
	sSBygknwclmgOd7s832ar3g2g9LTDSEZsA==
X-Received: by 2002:a05:6000:4616:b0:491:8286:5f0e with SMTP id ffacd0b85a97d-4abb514609amr37651209f8f.55.1795711273012;
        Thu, 26 Nov 2026 08:41:13 -0800 (PST)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:6ce3:c28c:2097:7d09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm39333942f8f.34.2026.11.26.08.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:41:12 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marex@nabladev.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lucas Stach <l.stach@pengutronix.de>,
	Advait Dhamorikar <advaitd@mechasystems.com>,
	Peng Fan <peng.fan@nxp.com>,
	Adam Ford <aford173@gmail.com>,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 1/2] pmdomain: imx8m-blk-ctrl: fix suspend/resume order
Date: Thu, 26 Nov 2026 16:40:58 +0000
Message-ID: <20261126164058.2373605-5-ivitro@gmail.com>
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

The GPC domains behind a blk-ctrl are driven with runtime PM on the
virtual devices from dev_pm_domain_attach_by_name(). Runtime PM is
disabled in the noirq phase, this is why the ->suspend callback exists:
it keeps the virtual devices runtime active, so the runtime PM calls in
imx8m_blk_ctrl_power_on() and imx8m_blk_ctrl_power_off() do not fail in
the noirq phase, while the genpd core powers the GPC domains off and on
through the virtual devices. This requires the virtual devices to resume
before the consumers of the blk-ctrl domains: genpd_resume_noirq() of a
consumer calls imx8m_blk_ctrl_power_on(), which accesses the blk-ctrl
registers expecting the bus domain to be on.

Nothing orders the virtual devices in dpm_list: they have no parent and
no device link to the blk-ctrl or its consumers. On i.MX8MM the VPU
codecs resume before the virtual devices and the CPU hangs in
genpd_resume_noirq() of 38310000.video-codec. The system never resumes
from suspend to mem; with a watchdog running, the board is eventually
reset. The same happens on i.MX8MP with the media blk-ctrl, where the
CPU hangs in genpd_resume_noirq() of the MIPI CSI-2 receiver, and with
the VPU blk-ctrl when the hantro-vpu module is loaded after the blk-ctrl
has probed.

Add a stateless device link from the blk-ctrl to each virtual device,
bus domain included, so they are suspended after and resumed before the
blk-ctrl and its consumers.

Fixes: 2684ac05a8c4 ("soc: imx: add i.MX8M blk-ctrl driver")
Cc: stable@vger.kernel.org
Reported-by: Advait Dhamorikar <advaitd@mechasystems.com>
Closes: https://lore.kernel.org/all/CAAPs2HTo=4+AEw1+vcU6c9vt_O2BfF+gv3FFvx9G3KLLzCOsHw@mail.gmail.com/
Closes: https://lore.kernel.org/all/fccbb040330a706a4f7b34875db1d896a0bf81c8.camel@gmail.com/
Suggested-by: Lucas Stach <l.stach@pengutronix.de>
Co-developed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Changes in v2:
- Link the bus domain virtual device too (Francesco)
- Add the per-domain links right after attaching, before pm_genpd_init(),
  so the error paths stay symmetric (Francesco)
- Rewrite the commit message: v1 described the ordering as a
  parent/child effect, but the virtual devices have no parent; their
  dpm_list position relative to the consumers depends on probe order
- Explain why the ->suspend callback is needed, as asked by Ulf on v1
- Add the i.MX8MP media blk-ctrl report from Advait
- Drop Lucas' Reviewed-by, the diff changed
- Update the ->suspend comment, the order now comes from the device
  links
- Rebase on ulfh/linux-pm fixes

v1: https://lore.kernel.org/all/20240418155151.355133-1-ivitro@gmail.com/
---
 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 29 +++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 9df933a7a238..ba44cad02351 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -250,6 +250,17 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 					     "failed to attach power domain \"bus\"\n");
 	}
 
+	/*
+	 * Make the genpd virtual devices suppliers of the blk-ctrl so that
+	 * they are suspended after and resumed before the blk-ctrl and all
+	 * its consumers.
+	 */
+	if (!device_link_add(dev, bc->bus_power_dev, DL_FLAG_STATELESS)) {
+		ret = dev_err_probe(dev, -EINVAL, "failed to link to \"bus\"\n");
+		dev_pm_domain_detach(bc->bus_power_dev, true);
+		return ret;
+	}
+
 	for (i = 0; i < bc_data->num_domains; i++) {
 		const struct imx8m_blk_ctrl_domain_data *data = &bc_data->domains[i];
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
@@ -298,6 +309,15 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 			goto cleanup_pds;
 		}
 
+		if (!device_link_add(dev, domain->power_dev, DL_FLAG_STATELESS)) {
+			ret = -EINVAL;
+			dev_err_probe(dev, ret,
+				      "failed to link to \"%s\"\n",
+				      data->gpc_name);
+			dev_pm_domain_detach(domain->power_dev, true);
+			goto cleanup_pds;
+		}
+
 		domain->genpd.name = data->name;
 		domain->genpd.power_on = imx8m_blk_ctrl_power_on;
 		domain->genpd.power_off = imx8m_blk_ctrl_power_off;
@@ -308,6 +328,7 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 			dev_err_probe(dev, ret,
 				      "failed to init power domain \"%s\"\n",
 				      data->gpc_name);
+			device_link_remove(dev, domain->power_dev);
 			dev_pm_domain_detach(domain->power_dev, true);
 			goto cleanup_pds;
 		}
@@ -354,9 +375,11 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 cleanup_pds:
 	for (i--; i >= 0; i--) {
 		pm_genpd_remove(&bc->domains[i].genpd);
+		device_link_remove(dev, bc->domains[i].power_dev);
 		dev_pm_domain_detach(bc->domains[i].power_dev, true);
 	}
 
+	device_link_remove(dev, bc->bus_power_dev);
 	dev_pm_domain_detach(bc->bus_power_dev, true);
 
 	return ret;
@@ -373,11 +396,13 @@ static void imx8m_blk_ctrl_remove(struct platform_device *pdev)
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
 
 		pm_genpd_remove(&domain->genpd);
+		device_link_remove(&pdev->dev, domain->power_dev);
 		dev_pm_domain_detach(domain->power_dev, true);
 	}
 
 	dev_pm_genpd_remove_notifier(bc->bus_power_dev);
 
+	device_link_remove(&pdev->dev, bc->bus_power_dev);
 	dev_pm_domain_detach(bc->bus_power_dev, true);
 }
 
@@ -392,8 +417,8 @@ static int imx8m_blk_ctrl_suspend(struct device *dev)
 	 * can power down our domains and more importantly power them up again
 	 * after resume, without tripping over our usage of runtime PM to
 	 * control the upstream GPC domains. Things happen in the right order
-	 * in the system suspend/resume paths due to the device parent/child
-	 * hierarchy.
+	 * in the system suspend/resume paths due to the device links to the
+	 * genpd virtual devices added in probe.
 	 */
 	ret = pm_runtime_resume_and_get(bc->bus_power_dev);
 	if (ret < 0)
-- 
2.53.0

