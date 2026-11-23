Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445637;
	b=sizbtSu6YbkaC8O0hS6awqjbZakrMeyrvI9DU7QC/os0w4CNFmncXd9xmlNvd7TpYU8Y
	 hJ9hTyG9u99VlO9q63fPQu1p+AJupnyQExPrW+vVIRQ9+AZkCPQ1pwnVfj+haZouYjFik
	 C4N2o4bTqVV87z4oiS8r12zbrbYywlnvjJu8pCQj3etFmHysvL8TqBROnYh0/0jxeZqfv
	 fn7o/dtxWljbrk4OJwevQC/1S0k1KUxCjYXIVy0xAXByoauZRtzezcfvxZVSw2va1kRjq
	 KMvM8BIdh2M5IdfmxkLPB5Fe2BwJRR6tqbnC0cDfo20664mFIz31cxiE7vNucCNZSsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
	b=vsyRazsGO3SmDD7jm5PEgn7lWvwWwPCxP6+nRofO8ttuKjvfet4piJ4PH/bznTOcojQB
	 E6acPVkVIFFGnXeiaRkxxaeSQZ5wZa/AjniL9bNjNOiqxDrUrDXX8LuyFr0irJuW4dCuM
	 0A+l++wkpI9tQAYzDbshyaH6LZhIPXBZ+El2I7P/pLbFdTD86HR0vP1D92/UKbq/hB4P0
	 5tnRw2nYslCkBqUaXiscOdW9oDQ3BoXT2yP75cQCkM+kohprmejStx7XHf6Fb0ZG+UnZM
	 y+B4gjPmRNmQ6e5ZO/HcBwnHRCUuah71rsn0NEHb3ROuvf84iGH48DZz0HHkHHpqr7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CDqXCh9g;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2750F60A6F50
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2750F60A6F50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CDqXCh9g
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a210470b49so32706425e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445635; x=1796050435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
        b=CDqXCh9g3gBn7Gqu7xnGzzahRm9GSKxuyxZ6SM9HRNndQ1marzSteyv9gBCp+opb88
         HgZXD+ENDEWRoaevbhwd8sePn8YCn9cIpKL74Vn9lG0vWUde6lQq8dffrKtyuQoIY7h2
         Lgvj9aMfhJMriO4fyWX5nHqygFAr1qCiygqgwJzbw2NAx3lY6HBBXX0anWHxSrjnFt5J
         8NDRGwZ2cDjME4rPp+tPaUwZUdNf8qndp5tfZnI5HM77ZOenh3ZoNQ3iKJDNLcVOPSvZ
         DwuRkG9TIgX67/6L58XuzqkB8So/KHrLKEw/kHbp+CEpNZarHD/NfHKqrf/OK5dJ2D1M
         /i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445635; x=1796050435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
        b=KS504QNZhZqcVBc5mq4JAOSFAlnLyodCou4e5Xrj2P1Jno689kR5MlDc+kl2gBeVA9
         8ypEYV0evYaB9jCb/oaU6RARIXbEz50hGWP8n4KMOqqdt7h2eKLfwvP74Dll2YsbyUwv
         xSbJ4tH5E16tiXz7on2xwEjZLOcse3C9Xoo7PeQsOIKUYS353LWeN01E9GxmGQhLoxGN
         bAJdM+9TBb2oq9ib3QL4tK7G18HLRL2XE9Jx8kVItsOZWK90S923MRYFFulN0LdyLIER
         tCNnDmouh2uYr/pCRR5wm7ntSLJQXGAmyfKSd1Z6SsdDxdMr4jPkU1/iQJX51L+Nn0UC
         HcWw==
X-Forwarded-Encrypted: i=1; AL+hErHq9Vsh2sIgrOgEGgaRBuTRAIVPstoZWF3/M9NKSw2tG/jX9QlyjdWRcREwJkA9qbeZ7oLsdl5GrP+CPjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RoVTXHBVaHu3O9u8Ntug8TKXHD0tbgQBIHiCBI7LXYPaIoyHJ
	Vk2tTFx1NJGXCY8uS8B+bLVXSNYQU5AE0uHFcxfLq1ImPdbGGul+rmFdlfADZ5WKgek=
X-Gm-Gg: AZFdTZfst+yKXUlp9g1Dl6/IsR0QvD/rq5BAGehx6NucB9UfpYFynZaAig2wTGFPu/a
	3qoI30kKjkJCCyMIaEU3MwL5juXPUOC4iDMRJnlpywzl60Lkv/J59b6dYevKv+oQfrhrLnsBAkC
	W9WwCfYalL29p+nb4lRrmPZjjUe0OhiJqlxdT47wyGkypPWHUctRxVPjB62Gbd0AbhSo4Ohu48I
	5nJZkbvPH4djrR+iPvx1k7dW/O5FKT4P9yEC+qnTWYrcnuXm909mNi7BJ2s3S5mZLSygkFUxPTW
	B9cbmdmbmetyqEf5zsL88k8xt9BsJt5TA4fODcbQ6nZSEnrbJejsraNKSnlHGsVaB+o5yO2k1dL
	AdLjJpO2ALyuKo5QA9riV8ahB9LHb7IDemQAm5apbhLXPLa0TS1X52k2Csv34/Ycs/EVVw7/Maz
	zSfaWQf6q7RrSK0p0gQC9yu+Wn6Tz2qAtzdkkhbrUJ7tZlc26u1W2Hjf9N4+piA2JbXWDeoMqaM
	I6uVDg2oADnPvmPgkgEFbSCpf1EqM1vb5EC24BoU/1OBKz48qTtzYHjSgUoWmZflvt8L/4Ia4TO
	mvYRcRFDCvqkh0OxQU3cpgsiugQ=
X-Received: by 2002:a05:600c:1c1b:b0:4bb:87be:c138 with SMTP id 5b1f17b1804b1-4bb8893e021mr265842135e9.32.1795445635536;
        Mon, 23 Nov 2026 06:53:55 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm340088765e9.10.2026.11.23.06.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:55 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org
Subject: [PATCH v3 16/28] mmc: bcm2835: Pass the CPU physical address of SDDATA to the DMA engine
Date: Mon, 23 Nov 2026 15:56:54 +0100
Message-ID: <20261123145728.29082-17-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
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

The addresses in struct dma_slave_config are CPU physical addresses, and
the DMA controller driver is responsible for translating them into its
own view of the bus. The driver instead reads the untranslated address
out of its reg property, which only happens to be what the BCM2835 DMA
controller expects because the DMA engine driver used the address
verbatim.

Now that the DMA engine driver translates slave addresses itself, use the
CPU physical address of the register resource, which also gets rid of
the open coded parsing of the DT node.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/mmc/host/bcm2835.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
index efd1903c3ccd..cea7b2b6d2f0 100644
--- a/drivers/mmc/host/bcm2835.c
+++ b/drivers/mmc/host/bcm2835.c
@@ -38,7 +38,6 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/scatterlist.h>
@@ -147,7 +146,7 @@ struct bcm2835_host {
 	struct mutex		mutex;
 
 	void __iomem		*ioaddr;
-	u32			phys_addr;
+	phys_addr_t		phys_addr;
 
 	struct clk		*clk;
 	struct platform_device	*pdev;
@@ -1369,7 +1368,7 @@ static int bcm2835_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct bcm2835_host *host;
 	struct mmc_host *mmc;
-	const __be32 *regaddr_p;
+	struct resource *res;
 	int ret;
 
 	dev_dbg(dev, "%s\n", __func__);
@@ -1382,23 +1381,14 @@ static int bcm2835_probe(struct platform_device *pdev)
 	host->pdev = pdev;
 	spin_lock_init(&host->lock);
 
-	host->ioaddr = devm_platform_ioremap_resource(pdev, 0);
+	host->ioaddr = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(host->ioaddr)) {
 		ret = PTR_ERR(host->ioaddr);
 		goto err;
 	}
 
-	/* Parse OF address directly to get the physical address for
-	 * DMA to our registers.
-	 */
-	regaddr_p = of_get_address(pdev->dev.of_node, 0, NULL, NULL);
-	if (!regaddr_p) {
-		dev_err(dev, "Can't get phys address\n");
-		ret = -EINVAL;
-		goto err;
-	}
-
-	host->phys_addr = be32_to_cpup(regaddr_p);
+	/* the DMA engine translates the address into its own view of the bus */
+	host->phys_addr = res->start;
 
 	host->dma_chan = NULL;
 	host->dma_desc = NULL;
-- 
2.51.0

