Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086042;
	b=Ub1LC1mwmGWePCQAVe9VwQoDKvTG+BneN2k7AcLt0soSbOggs8jcRpbr/IQEsgvr2B8/
	 EuuarDzA3kZ/G1bdhgAxUZDXe/S8GoJONnv79o2nJ1LsUm4lfkFEuJXq1CLyaEYPgw3h/
	 PjBwjCCqirml607GjSYlONJQthP6h+Y54J5eI/JXakajsRsjtYobAdcfff3nBjURZUbY7
	 4wsWmV0IwiKd8x9zOIGQl0Y02m0nvqVDEQjqugpDvKFdbCfjyXNcnXdFSMBBlStzjF3Hy
	 rcyYE/Qg6VYlrsFLBakdhSFDeW+J28DO9IwDtoidg4Nclr+LDHx6b7HseHGMOXNZSfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086042;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=SnpBpONi2hKsnLkH7ie4ozWlmqX6tUPpRN0WLEqSj5E=;
	b=2D5P4bDq4r534uTJsT7c42mXR4XIOKsj/ea2F+L9K0Nx2tX/5gL7Fw8pEeDKhRf1faJL
	 GHshAdBJdxWAHwWRxqZNLdXqscEThSreqgz22Dua6QUCF7J67GLfmLhs+bY87ObIIwedp
	 P4hnaWRAx2VwPZrsTudeCVFg5Vre+HuqufErVM20RMqWcUxX1Yi9MJEduT3nKc8g1weqK
	 D2kn6cWhTWtWw9wVRiqINAezP9PHJNF649GtbIy0BgbHHAyWFMT+QREDuBqFZc+hkxbWn
	 lVDjLRDN8bxju2jKMo1OB0b/hpMROZdsjvZskG8c2bMLjXk0S0ees2HYoZeSNg2b3Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lv7fnnKl;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE26606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE26606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lv7fnnKl
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AB4631A15A6;
	Thu, 19 Nov 2026 11:00:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 795B360237;
	Thu, 19 Nov 2026 11:00:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B59911BC0F59;
	Thu, 19 Nov 2026 12:00:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795086038; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=SnpBpONi2hKsnLkH7ie4ozWlmqX6tUPpRN0WLEqSj5E=;
	b=lv7fnnKlNhRmPRNuZQwBsRGy8WrJpRjXUO7evkd9bCKQiPZpBCeSDSIZyQcQyHkgES/fJ+
	r4c30IM5fhM6GOEgn2kwqGa7rXwhovo7vatxxDxkuIH2wdpeRRwxutFDlV8PvVWHFKnD4D
	/tTR39B+cKXtWgK7ok6n+SZ8nYO/VNxcIMq5o1HoCCiKHNpCuK7Bm9KwAHEyZTWwvRezj2
	OKdo4Z3ekluank4NWvhfocTeCSxUXdCQNRDwdEhp3zgmXNMQtFHnUntxV8lpFEuAhPtd/C
	vtsWiT3uc8qjZHzPd2wErz3HxaXBVj1q2rt2kzCIBVnkVWKBK77yS+x8SCB+ow==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v10 2/5] bus: simple-pm-bus: Remove the remove() function
Date: Thu, 19 Nov 2026 12:00:08 +0100
Message-ID: <20261119110014.582363-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119110014.582363-1-herve.codina@bootlin.com>
References: <20261119110014.582363-1-herve.codina@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

Due to recent modification, the driver remove() function is almost
empty. It only performs a dev_dbg() call.

Having this remove() function is no more needed. Remove it.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/bus/simple-pm-bus.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index 4322a778e801..e45700156732 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -77,11 +77,6 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void simple_pm_bus_remove(struct platform_device *pdev)
-{
-	dev_dbg(&pdev->dev, "%s\n", __func__);
-}
-
 static int simple_pm_bus_runtime_suspend(struct device *dev)
 {
 	struct simple_pm_bus *bus = dev_get_drvdata(dev);
@@ -150,7 +145,6 @@ MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);
 
 static struct platform_driver simple_pm_bus_driver = {
 	.probe = simple_pm_bus_probe,
-	.remove = simple_pm_bus_remove,
 	.driver = {
 		.name = "simple-pm-bus",
 		.of_match_table = simple_pm_bus_of_match,
-- 
2.56.0

