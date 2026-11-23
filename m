Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432744;
	b=Q+GqUPbe3AHTIQY3nelRkxx1Ap7+0xpSkPyeIGzXj+y39nD03H2LtI9BiwJsXNaNqGxt
	 cDwdZS90uDHakLnhCR8y2NSTffNYxLVFFnpSi5DTio/Cl2ygctjIjqXT1APwbXqaKzf5T
	 u+ncm5kaC8r8GyC2PDs75fwFPTTl+MzFqlhb6PpQdfSNeZPomBM1kTwB+bCMIdFh3MVRJ
	 U9fPe/7ZFZK0he+bpGiSIrcVMKNf4/IZz78Urb1m/gtKg0vaIHoh+3s2VT28X2KhtLvqM
	 fI25T5vo+Xo4DPk9p7WmOmiMr1ZbIZTfzO9f6hSsc5E6EcLTxxvUmIJXKltXvC034JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=5Za9etaWzrlUrj531Qe77tzP9ZYrvCitBUMHIjM0+zU=;
	b=f87uAxxBu22OKJoYRFgEqjyIJYSLCO28j2W+Lxnw1TV+PqtIPZ3uLdWiAyqoQHXj4hR3
	 GXjj+DwK/UTq71S4EN615KkXNdIL1mRR3nP9tFYSBxMG+B5/ty7MxsCFFMwcaPhVBbgGn
	 050KB8uBCTUFELquOQtTubhW2TJqCKIxgrlG8s4pWabf2vMSljyytJHuCEE3x3WoQzbeo
	 lUH2W18mT+cMJtC5cofzGrjAZx69/bDwoOBKLy19BLqG8N1vkVMtbrrMAt5wg9kODT0bK
	 agoRLyBvqtkQshLVpdeLwbbZYvSXWjDMKpwBbIMtL1BKHzonrh4BTwb1aujlRdSUx7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FE4yskQ+;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEE2606A6A7
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AEE2606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FE4yskQ+
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso197737f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432742; x=1796037542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Za9etaWzrlUrj531Qe77tzP9ZYrvCitBUMHIjM0+zU=;
        b=FE4yskQ+Zki3HJbB3PlMe/yeiXSwyEliRXXBrH1nfZtDLyUkQypkPOSK9QSOJUlZY2
         L5XI9b684tFq8KaW8erPaYxvlInXQ85k4Mr/r+vI8Ak+cIJ7pjVnj7/PEbl4aKN7Mhyj
         f860u5umXs3USeaY0sX5644EZaindDsmUQlkXz1tXPUAR9TD9lwF+xs1bmSUOvxOFhxe
         DQRszLFcCX7R03dkbXNQOcAohZAEihaGwjaV9bHfklEBQZV4Q3lTL34/Xq/IQX69Gysk
         XOYBvTYGLcChiw2UmoPes0g46x+b8AnnGQiLV8za2CmEb1wEovBjWzaksdWOq/CAt6sL
         Lv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432742; x=1796037542;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Za9etaWzrlUrj531Qe77tzP9ZYrvCitBUMHIjM0+zU=;
        b=EtB4cNuSpdHHxjBdq69K5tTCcp+hkS3BwstZNo40Um8NCRO3R6xmNKCNFqTDWpYKdo
         waKb2sMvVE+FbhrLWiix1HFoRKVs7RiQsM7EjK1fkFlIGzqGFVuaheUj3kv/SJXyrd22
         CkoOj44HJZh75kL6RLIzEUjYOOz1viBBOeW6KXdz4aVPKnUzclRXRf+xdTRroe1pCe3Z
         KTNiRPxezUZFLxWTjbVRhMK+3c9boOATtcMNZtrPaofEhgK4P6c/pjYHWQSbqI97462S
         GB2nzlTPWL2obuWLEZzz3tNo7+SIEELHjlTjwFN31XuLag0gsj+7Y/Uq+ST0K9x6eSyL
         NMqg==
X-Forwarded-Encrypted: i=1; AL+hErEcFtf8WPqwOsH6MSBY14UquR8szksExObpDGQkbrObjlLGaQkvz+2V0+WvV0Ki1qJII0n9amMNiMAwSNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z91GEr74nU8fyat1oGu07eoAgVhIE4VUegFHmW4hqh789A38944
	kldU7J9j2URKqWh1POPF+frH87eu3HcZBqqbnz1DE5Z0VyTVjwyrG+WFIVdNDpPfa6uH/aedU2t
	8odGp
X-Gm-Gg: AZFdTZc2qsCDc7COTfEqD7VXHCTIoo/lIVdd5Kj6tWx5wykVIm6zaAp0kynaOfPdpBu
	nC3OYwVGiiy1lbq/bCG18HmeA0CoA24bcc2u16yRPNoJrjQes0vIz49+pXsadihoMaLbAPIyeqP
	FXw4uVDTH4vIiDjYckaFX2hPNHA4ze6njo8R4I+OCKNovG0knl/7BoJPIKbt99SGJ4HKf4Mfl1h
	wXUxks0IIMVviMhF5kY6fwrmRIWG6I/Ro426oHxaoFTBe2YrsyfxB18CHWXuZcpoIJz1HHq4geO
	s+Dc2802m/7XtEtWDGs5ZPnH+JdsJZUizPEt4Q7YhBbCiVO9XdX3T2wpobVWJC0YgB3Kekfqb9p
	VOvLyG2TH8Cyh2oRwRFN3tbchxdfgYX+5SxPjsWqTYQkGgHx5VOjdbfdm7+qmXhJuIKujoUQBuk
	sYz+okYWM+3YsPvX1q9l6319bXys9rL73ZfBc4R0FGnwHDsTbdUL2iRWIld178Z2GJ9VNwQ/oQJ
	AuSUzstOiXENHXBO/PUM34+PXp8ftO4WQiNnqpeYhqUrX78LGtel+iPBgbttZypzSsezZ5FHQXp
	4at6TDi3r75teSO26lRF1EklK6YG/VUDGB9omHkthEEIJxZmvnY4menKUUUPY80+eKvgqAv/26B
	tIw3ij+cQBAo5ot7e
X-Received: by 2002:a05:6000:1788:b0:4b5:7aed:6812 with SMTP id ffacd0b85a97d-4b57aed682emr1011422f8f.4.1795432742510;
        Mon, 23 Nov 2026 03:19:02 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6a67f1b2sm20093402f8f.25.2026.11.23.03.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:02 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 03/17] mfd: kempld: Simplify device abstraction
Date: Mon, 23 Nov 2026 12:18:01 +0100
Message-ID:  <ce2d4bb028b4c896bc3906cd9f7959af557ce6fb.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7779; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=z3bdjILbd0+/ElOXnFuRTbokuf1b+/kGcrxHGSae46Q=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCDup/fV/Oka+ciBkW6yUUB5S4/i9P/9XLCD+ nChmmAk06eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQg7gAKCRCPgPtYfRL+ ToBzB/9Q0o81OrykvKpA83T4JfKNiAR123raAgvA8XWqp/Ij5lZc8q2jNFx4igPTYMo5cXI2yF9 e+XoVVTCSgO8R37qTgSw99/D+k/t4/xPKKLdiwRqvisWpjxKKF5r7+DZyk9mZv6Vd291Igd3he3 a7qzRz5zj+voVB/HcXzDYTIecdM/O3X0023UM2Xq6UbmXp5GyTo6H5S+jeMd5m/UCz5O/gJnLiT 7DHGjDn7bTQ8NCCTHCWpyk9qUI4dIOvijoPN54u2nXXOyXYBlGKHsIKiuzSp8tBUv/NC+Mk1+74 SjYcbJ6LnEGcd7fOZSpgZlBhmob75zkKaRK1aXZspXcolXuk
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

The devices that are created by the driver from DMI data and also ACPI
devices all use the same platform data. Other devices don't exist. (A
provider of such a device would need to know about struct
kempld_platform_data, but none of the other consumers of
<linux/mfd/kempld.h> creates devices.)

Simplify the driver by hardcoding this instead of using the ACPI
abstraction for multi-variant support without real variants.

Then apart from .gpio_base all members of `struct kempld_platform_data`
are only used in drivers/mfd/kempld-core.c, so they can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/kempld-core.c  | 64 ++++++++++----------------------------
 include/linux/mfd/kempld.h | 12 -------
 2 files changed, 16 insertions(+), 60 deletions(-)

diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index 39edaed70694..93e35f6be9d5 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -118,25 +118,19 @@ static struct resource kempld_ioresource = {
 };
 
 static const struct kempld_platform_data kempld_platform_data_generic = {
-	.pld_clock		= KEMPLD_CLK,
-	.ioresource		= &kempld_ioresource,
-	.get_hardware_mutex	= kempld_get_hardware_mutex,
-	.release_hardware_mutex	= kempld_release_hardware_mutex,
-	.get_info		= kempld_get_info_generic,
-	.register_cells		= kempld_register_cells_generic,
 };
 
 static struct platform_device *kempld_pdev;
 
-static int kempld_create_platform_device(const struct kempld_platform_data *pdata)
+static int kempld_create_platform_device(void)
 {
 	const struct platform_device_info pdevinfo = {
 		.name = "kempld",
 		.id = PLATFORM_DEVID_NONE,
-		.res = pdata->ioresource,
+		.res = &kempld_ioresource,
 		.num_res = 1,
-		.data = pdata,
-		.size_data = sizeof(*pdata),
+		.data = &kempld_platform_data_generic,
+		.size_data = sizeof(kempld_platform_data_generic),
 	};
 
 	kempld_pdev = platform_device_register_full(&pdevinfo);
@@ -235,10 +229,8 @@ EXPORT_SYMBOL_GPL(kempld_write32);
  */
 void kempld_get_mutex(struct kempld_device_data *pld)
 {
-	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
-
 	mutex_lock(&pld->lock);
-	pdata->get_hardware_mutex(pld);
+	kempld_get_hardware_mutex(pld);
 }
 EXPORT_SYMBOL_GPL(kempld_get_mutex);
 
@@ -248,9 +240,7 @@ EXPORT_SYMBOL_GPL(kempld_get_mutex);
  */
 void kempld_release_mutex(struct kempld_device_data *pld)
 {
-	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
-
-	pdata->release_hardware_mutex(pld);
+	kempld_release_hardware_mutex(pld);
 	mutex_unlock(&pld->lock);
 }
 EXPORT_SYMBOL_GPL(kempld_release_mutex);
@@ -266,10 +256,9 @@ EXPORT_SYMBOL_GPL(kempld_release_mutex);
 static int kempld_get_info(struct kempld_device_data *pld)
 {
 	int ret;
-	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
 	char major, minor;
 
-	ret = pdata->get_info(pld);
+	ret = kempld_get_info_generic(pld);
 	if (ret)
 		return ret;
 
@@ -296,20 +285,6 @@ static int kempld_get_info(struct kempld_device_data *pld)
 	return 0;
 }
 
-/*
- * kempld_register_cells - register cell drivers
- *
- * This function registers cell drivers for the detected hardware by calling
- * the configured kempld_register_cells_XXXX function which is responsible
- * to detect and register the needed cell drivers.
- */
-static int kempld_register_cells(struct kempld_device_data *pld)
-{
-	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
-
-	return pdata->register_cells(pld);
-}
-
 static const char *kempld_get_type_string(struct kempld_device_data *pld)
 {
 	const char *version_type;
@@ -399,12 +374,12 @@ static int kempld_detect_device(struct kempld_device_data *pld)
 		 pld->info.version, kempld_get_type_string(pld),
 		 pld->info.spec_major, pld->info.spec_minor);
 
-	return kempld_register_cells(pld);
+	return kempld_register_cells_generic(pld);
 }
 
 static int kempld_probe(struct platform_device *pdev)
 {
-	const struct kempld_platform_data *pdata;
+	const struct kempld_platform_data *pdata = &kempld_platform_data_generic;
 	struct device *dev = &pdev->dev;
 	struct kempld_device_data *pld;
 	struct resource *ioport;
@@ -415,16 +390,10 @@ static int kempld_probe(struct platform_device *pdev)
 		 * No kempld_pdev device has been registered in kempld_init,
 		 * so we seem to be probing an ACPI platform device.
 		 */
-		pdata = device_get_match_data(dev);
-		if (!pdata)
-			return -ENODEV;
-
 		ret = platform_device_add_data(pdev, pdata, sizeof(*pdata));
 		if (ret)
 			return ret;
-	} else if (kempld_pdev == pdev) {
-		pdata = dev_get_platdata(dev);
-	} else {
+	} else if (kempld_pdev != pdev) {
 		/*
 		 * The platform device we are probing is not the one we
 		 * registered in kempld_init using the DMI table, so this one
@@ -451,7 +420,7 @@ static int kempld_probe(struct platform_device *pdev)
 
 	pld->io_index = pld->io_base;
 	pld->io_data = pld->io_base + 1;
-	pld->pld_clock = pdata->pld_clock;
+	pld->pld_clock = KEMPLD_CLK;
 	pld->dev = dev;
 
 	mutex_init(&pld->lock);
@@ -463,15 +432,14 @@ static int kempld_probe(struct platform_device *pdev)
 static void kempld_remove(struct platform_device *pdev)
 {
 	struct kempld_device_data *pld = platform_get_drvdata(pdev);
-	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
 
 	mfd_remove_devices(&pdev->dev);
-	pdata->release_hardware_mutex(pld);
+	kempld_release_hardware_mutex(pld);
 }
 
 static const struct acpi_device_id kempld_acpi_table[] = {
-	{ .id = "KEM0000", .driver_data = (kernel_ulong_t)&kempld_platform_data_generic },
-	{ .id = "KEM0001", .driver_data = (kernel_ulong_t)&kempld_platform_data_generic },
+	{ .id = "KEM0000" },
+	{ .id = "KEM0001" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, kempld_acpi_table);
@@ -787,13 +755,13 @@ static int __init kempld_init(void)
 	if (force_device_id[0]) {
 		for (id = kempld_dmi_table; id->matches[0].slot != DMI_NONE; id++)
 			if (strstr(id->ident, force_device_id))
-				if (!kempld_create_platform_device(&kempld_platform_data_generic))
+				if (!kempld_create_platform_device())
 					break;
 		if (id->matches[0].slot == DMI_NONE)
 			return -ENODEV;
 	} else {
 		for (id = dmi_first_match(kempld_dmi_table); id; id = dmi_first_match(id+1))
-			if (kempld_create_platform_device(&kempld_platform_data_generic))
+			if (kempld_create_platform_device())
 				break;
 	}
 	return platform_driver_register(&kempld_driver);
diff --git a/include/linux/mfd/kempld.h b/include/linux/mfd/kempld.h
index 5d75071eaaea..d7a823ba1a7a 100644
--- a/include/linux/mfd/kempld.h
+++ b/include/linux/mfd/kempld.h
@@ -97,22 +97,10 @@ struct kempld_device_data {
 
 /**
  * struct kempld_platform_data - PLD hardware configuration structure
- * @pld_clock:			PLD clock frequency
  * @gpio_base:			GPIO base pin number
- * @ioresource:			IO addresses of the PLD
- * @get_hardware_mutex:		PLD specific get_mutex callback
- * @release_hardware_mutex:	PLD specific release_mutex callback
- * @get_info:			PLD specific get_info callback
- * @register_cells:		PLD specific register_cells callback
  */
 struct kempld_platform_data {
-	u32				pld_clock;
 	int				gpio_base;
-	struct resource			*ioresource;
-	void (*get_hardware_mutex)	(struct kempld_device_data *);
-	void (*release_hardware_mutex)	(struct kempld_device_data *);
-	int (*get_info)			(struct kempld_device_data *);
-	int (*register_cells)		(struct kempld_device_data *);
 };
 
 extern void kempld_get_mutex(struct kempld_device_data *pld);
-- 
2.47.3

