Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683554;
	b=GC37PDfh99wtUzA/rswtAhBFDRsTzWhyTMUIPtSWaX4CUFmifkGx5ljVwwEwkgnuMdPY
	 TKhq82Cgt/Nfk0H5esIS9js6DoABNvXIeRleeqh9ZKCpinSOxuRjUK0futQz4wnpgBmAO
	 yVy5sc5WCE9V1l0ZSdMGsN24nD1K2gNKi9UhbC6FCG8FY9vWFZCA+cMEevfLJTE847t55
	 IocoDNkDIwY5A8NVQMeYnERvgWf5pAQW63h+tOFXnelz99+8/3Xt8C1dcLEPfdjsGD7fv
	 m6RRxMDZXj/VlqSXTRqfXxuRzRO2dqtNQ/CoHJNELMq/xW24quJ+RLk5smQxjv6OCJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OZeaCKjXj7rhQtKUY6dpSt9k3JcLhM/MuU5+xZ27Sxw=;
	b=lIFTnInpZ2FJvrzJx8kvQfklcJBFR4hjYQDmGYVHwIfEOow1dGjnhRU0fcTi+0BrCFqR
	 WDP7/LyHcYKOzcBKBsqCxBN+4su4wMdKmsuCLuH/+nR1O+BHcU5nLv625Titd/6b6FHYg
	 QY4EkNFb/L8GqsXNYuSCU4qT5nt4PVdPAf3NdP8LVKTC8wjm15GQ1abhGo1OYVnTQg+jw
	 2FQCnS8atbuReCqbz9nBaVBImTAYH4/a3EOvgvawDd0eO+1aivl7p/T2mEF6A7RxTX/AN
	 FD2CHacLV/SJieY4KO3R9JcEUxpJoXactjEJl9S+EKT/w5wiDJXB8gBa4pLdzJ/LNPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ESQ/A94D";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D24606A335
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7D24606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESQ/A94D
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so5209810f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683552; x=1796288352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZeaCKjXj7rhQtKUY6dpSt9k3JcLhM/MuU5+xZ27Sxw=;
        b=ESQ/A94DmB3fiztDdkjl1M6gP/HpFUJntkthUI1KwO6oXvYXzWjkKV/Wp6RaClBmxF
         fXlcUh5dhHs+Z9z3XLQIwz4DT37O1EA+9a8nq7c4liAo4GQzlnSTu4cEbpgW0Qx+FVIF
         QQnOca8hez/hdUb04A/MEAeZ/xcF3A5/Y+l2jwx93ZBppfCZWVgMNBINJF43jcG5kuF7
         woLumOqK0V2itMzOWCCcsNQFWnO6qAHdGJHek8NzO9nNVNbMxJGgxyHovLprbBWe8+Gh
         ddBODu5c91vpVpB1Q4gR/EzB9/QPvgWx3YTYHznwy+r1CljfNiteC3HatNRYUV4MybuO
         GZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683552; x=1796288352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZeaCKjXj7rhQtKUY6dpSt9k3JcLhM/MuU5+xZ27Sxw=;
        b=yWplLJUH0+B/XceO36gn14rAHcBwqNNmGePDE23J3Yy8U9PpYzuLu2dCQSPAKLM5/l
         pEuwiQbwT5njQM21LCMlzxU5rWiCiOJq85+04tCGhQSe9KXbWd9l1VF5ywPNRkmso7tt
         r0/KvJNy/xeesePbwjzPzbrBZpB+UKWSRf9WwjFgnHZL1gp10st/XaPKiDJQOF0KPPeD
         HE3djqESmc1oYSyy3/7WZ9IYAU91jAGTAzEnjNgqMXaY4CJ/eILcgM+1obASzikOKvBk
         ZensUPqKSEVyMD7spIa3KoUTDdzOKBXStsMCXf8OMw6dyJPpB1yYgETGCi2eG9jlUSf3
         23MQ==
X-Forwarded-Encrypted: i=1; AL+hErHQgJ0YNDluhNpUMObYbqzsqg9x0/F5Y6FHcSeX/DFFf0GS8TcASnIduoQgNf0i4/E4AUZdttfLRssz5Hg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hqQAJBPS8Ep08mOvKn0mXcrw/w0OyyWSwFAGJtMFO5iZI523B
	4df28QnoIJtJDTVWVIp6wV9o2q4PbzZXUBkdlkqu8PCbIFOX8giO4U2x
X-Gm-Gg: AZFdTZeEIoZfsHoNnymHCgYggyonLfbDgocVkvIJLlTLCoELTU/TR2I4cNmu42OMjdo
	EIj3ZdKKFjWTMy6GEouHUr/1M5gJ0ejEnsqOmln0+pymNrIcT09jP24/LN3Xf9Q2ahuWtMRvyuR
	PlHwAHSyp6ZTXr0pq/N3KWHU4D9i57dVfjaRp9/FWemVr3+V+fPbl9tOJD9PAstoyWHbcJnRrZT
	ER+PE0lTnOA9iO6TeNOZ32Ldr0yKMfxbpoKlcP55gLVb3aGLjAGAgxiGYQabL6H7rsR0e+JBQSg
	a2K4xtt3l5vFAE0zjFuAdYu9JjBq0QTanuqZAEuzGqOrdZhcV95spqq65akK/whgAmulyyMsL38
	7875ahEOgkq6HzsMZI/wHarO4581A03+fS8Vdf7ayY6BvGTNr5mRhx4gbYRCFxOxAAT6OEFPzxu
	W0vrFAaFEM16fP4BiA7vZMnluF1lL6OdGWnRqTrlc34kPF67lfmSxnsWtLLaSca+AeK4bw02c82
	fMxgwIjsPs9eWH8xdrN7mrk9P+uHgZH/+DBdGoliWCk3RrP+dE3fr3toJ5mnJQLRTDfu7TYG7DL
	XhGr8PWcbaWZGaS4l6DHwIn4uiHKA5ihvqlMuVt7EaTmyIKlFzWLUA==
X-Received: by 2002:a5d:64c8:0:b0:493:c0a:507d with SMTP id ffacd0b85a97d-4abaab633c7mr44200123f8f.1.1795683552059;
        Thu, 26 Nov 2026 00:59:12 -0800 (PST)
Received: from center.. ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm40313744f8f.58.2026.11.26.00.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:59:11 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH v5 3/4] MIPS: Octeon: flash: allocate the map per device
Date: Thu, 26 Nov 2026 08:59:05 +0000
Message-ID: <20261126085906.814373-4-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126085906.814373-1-orgads@gmail.com>
References: <20261126085906.814373-1-orgads@gmail.com>
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

octeon_flash_probe() fills in one static map_info for every "cfi-flash"
node it binds to, so a second chip select overwrites the phys, virt,
size and bank width of the first while that MTD device still uses the
map. A probe whose do_map_probe() finds no chip also keeps its
ioremap() mapping and still returns success.

Allocate the map with devm_kzalloc(), map it with devm_ioremap() and
fail the probe when no chip is found or the partitions cannot be
registered, so the mapping goes away with the device. mymtd was never
read; drop it.

The driver has no remove(), and the mapping is now device-managed: a
sysfs unbind would unmap the flash while its MTD device stays
registered. Set suppress_bind_attrs to rule that out.

Fixes: 7f481716bc90 ("MIPS: OCTEON: Use device tree to probe for flash chips.")
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v5: add the Fixes tag (sashiko); join the split pr_notice() string.
v4: new. sashiko flagged the shared static flash_map against v2 and
    v3 of the next patch; v3 left it as it is in mainline, this fixes
    it first.


 arch/mips/cavium-octeon/flash_setup.c | 51 ++++++++++++++++-----------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index 66d173b57..d69249acf 100644
--- a/arch/mips/cavium-octeon/flash_setup.c
+++ b/arch/mips/cavium-octeon/flash_setup.c
@@ -18,8 +18,6 @@
 
 #include <asm/octeon/octeon.h>
 
-static struct map_info flash_map;
-static struct mtd_info *mymtd;
 static const char *part_probe_types[] = {
 	"cmdlinepart",
 #if IS_ENABLED(CONFIG_MTD_REDBOOT_PARTS)
@@ -71,6 +69,8 @@ static void octeon_flash_map_copy_to(struct map_info *map, unsigned long to,
 static int octeon_flash_probe(struct platform_device *pdev)
 {
 	union cvmx_mio_boot_reg_cfgx region_cfg;
+	struct map_info *map;
+	struct mtd_info *mtd;
 	u32 cs;
 	int r;
 	struct device_node *np = pdev->dev.of_node;
@@ -85,6 +85,9 @@ static int octeon_flash_probe(struct platform_device *pdev)
 	 */
 	region_cfg.u64 = cvmx_read_csr(CVMX_MIO_BOOT_REG_CFGX(cs));
 	if (region_cfg.s.en) {
+		map = devm_kzalloc(&pdev->dev, sizeof(*map), GFP_KERNEL);
+		if (!map)
+			return -ENOMEM;
 		/*
 		 * The bootloader always takes the flash and sets its
 		 * address so the entire flash fits below
@@ -94,26 +97,32 @@ static int octeon_flash_probe(struct platform_device *pdev)
 		 * access 4MB.
 		 */
 		/* Use this name so old part lines work */
-		flash_map.name = "phys_mapped_flash";
-		flash_map.phys = region_cfg.s.base << 16;
-		flash_map.size = 0x1fc00000 - flash_map.phys;
+		map->name = "phys_mapped_flash";
+		map->phys = region_cfg.s.base << 16;
+		map->size = 0x1fc00000 - map->phys;
 		/* 8-bit bus (0 + 1) or 16-bit bus (1 + 1) */
-		flash_map.bankwidth = region_cfg.s.width + 1;
-		flash_map.virt = ioremap(flash_map.phys, flash_map.size);
-		pr_notice("Bootbus flash: Setting flash for %luMB flash at "
-			  "0x%08llx\n", flash_map.size >> 20, flash_map.phys);
-		WARN_ON(!map_bankwidth_supported(flash_map.bankwidth));
-		flash_map.read = octeon_flash_map_read;
-		flash_map.write = octeon_flash_map_write;
-		flash_map.copy_from = octeon_flash_map_copy_from;
-		flash_map.copy_to = octeon_flash_map_copy_to;
-		mymtd = do_map_probe("cfi_probe", &flash_map);
-		if (mymtd) {
-			mymtd->owner = THIS_MODULE;
-			mtd_device_parse_register(mymtd, part_probe_types,
-						  NULL, NULL, 0);
-		} else {
+		map->bankwidth = region_cfg.s.width + 1;
+		map->virt = devm_ioremap(&pdev->dev, map->phys, map->size);
+		if (!map->virt)
+			return -ENOMEM;
+		pr_notice("Bootbus flash: Setting flash for %luMB flash at 0x%08llx\n",
+			  map->size >> 20, map->phys);
+		WARN_ON(!map_bankwidth_supported(map->bankwidth));
+		map->read = octeon_flash_map_read;
+		map->write = octeon_flash_map_write;
+		map->copy_from = octeon_flash_map_copy_from;
+		map->copy_to = octeon_flash_map_copy_to;
+		mtd = do_map_probe("cfi_probe", map);
+		if (!mtd) {
 			pr_err("Failed to register MTD device for flash\n");
+			return -ENXIO;
+		}
+		mtd->owner = THIS_MODULE;
+		r = mtd_device_parse_register(mtd, part_probe_types,
+					      NULL, NULL, 0);
+		if (r) {
+			map_destroy(mtd);
+			return r;
 		}
 	}
 	return 0;
@@ -131,6 +140,8 @@ static struct platform_driver of_flash_driver = {
 	.driver = {
 		.name = "octeon-of-flash",
 		.of_match_table = of_flash_match,
+		/* No remove(): the map and the MTD device stay registered */
+		.suppress_bind_attrs = true,
 	},
 	.probe		= octeon_flash_probe,
 };
-- 
2.53.0

