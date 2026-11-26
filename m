Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683555;
	b=VXepLV/crANUCe6svrS/mmXpiqQ1cHkLj2ppkTqmBTmKBJMORMm9IQx9LoKku9zYCHb8
	 WxzeaRhFU6kiekUwM577IznaBT47qc2jVlo3cEzHi0aXbstOVthW9OezhTlfyvnSm54hg
	 YRF+7oZ72DZuEBfFAFxGguRnK+ECpTFtPYlDkRBTxjC3N420jeo8vAwz6zfaF7rUl+G68
	 FebiQKCIu467tGFE5NHHYv5jggdIGHaEa06eO+guCXmvNFfvs8h0fLiTSd+RqTngjlqqP
	 pHiVcXtdNRZ4b91LahbgEMzmDfmnJ8+vuh7FkMJy4pl52o32IZTYy3e2uZsEg+NEmBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gzyMYEceM4UybzdO3Fm0gEDCvlgTGJLtnNanAWRt594=;
	b=V4QoMi30R/xcqzELz3el1XwKiubC39of49jkpfyLDCq6Rs6TNjBlDX0xdQchrPTf+ZyD
	 4Xui58izF/PbkCWN76YrwkrZ0dSJQVgbn6d8dBYvIzB1uKyUqI1svGsAxsCfd9pUEOFxK
	 w7jO6fw+bYPy+NB6U5V7gYsFikz40TUZkF7DUdMv05xzht4GtNuNkKRcuxeoqTRh/UzXe
	 qZeWmtcPiEByk6FZ51ae1AU5qpuwfw1D2Oq7jQYM3IWGRXE8dhumODW7tRWXemHAbSBif
	 YzaYrZx7NRggyQXv8fuS3GCGt2U0D1LQNM12hW3gWKM5wUl9969ksA04X1eWfrt4hag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COw5EvXd;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BBB606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3BBB606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COw5EvXd
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so67209595e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683553; x=1796288353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzyMYEceM4UybzdO3Fm0gEDCvlgTGJLtnNanAWRt594=;
        b=COw5EvXdXCGtsUqe13IFUYRsjRWKtq904i7s8JTQiJ4Hdkzr6jyWG1YkMsXCB1pwqH
         jJ77B2eERUhok4x6ck04T4D9GOXQBDRfkbZhtETAK5MPcmIoF2phcupZ7SbgzfD3YdF1
         RC8tE+Z8SVsB5/vbks2o1+Ncv8TMJxmpmPMmSj8YVZveAkpaXx+BkGel1QjrO9Qq7Z5W
         DRvDVbI5hxpK09S5c57aOkdWXekpihDvySYpz1hHVeWt893OSvk0LkLCMr1tD/G18Y0Z
         siWpYh5VM8Tnaz9xaoZIGDSVGn2FVag8R/QySxD2LPJI3Qr6xTn9Alij7nfLF1aAt7jk
         2dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683553; x=1796288353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gzyMYEceM4UybzdO3Fm0gEDCvlgTGJLtnNanAWRt594=;
        b=ePG3Y7ySI8S96DypNEAA7pntTY5WSaw+h3Nb6Gm+pZWVnv6jZG7ptl8XQqTsK4p6Sj
         lY9T6po8cVh9Ju4v+Wml5iXnj5ft3Hv1qtgUOS3zjD3avLu851aR8GG3/2DhLZ0AFU3g
         ZOBNA6QQ/6KnaB+CtdIYJUCf9PlDh2F0b0yF8BHfGeuXhB6K0GF+tLhgZjByPxswn7Ht
         NBUHDvJXIF+rpEb0SB/65Zpg/OoB95pZD4jrpenUI64NXKWv+Ems7gxiSNN04ZOKRNCg
         FCT9sc+GH9CIwXBcM/KMOuWQrTq1fON2yIhQKhdOElpQ3bbeHjjeg40l3YrYnU17O3IH
         F3dA==
X-Forwarded-Encrypted: i=1; AL+hErEcyTeom458WmGFtoHq+6TjXraTc1agGQUKaqd5bC06tvn/xcxwwJgq2bYulbOGV1j8f4XaGis/eBFrfrk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ylBHp1zMuBJWMmnafoheqp1BzDQArsbJCNF5OwfYlvSMPOqHS
	0zotjZWnldITWGf56WO+N5UYD0ovhxrYYdgZH6mdlwbVUPL55TK7Egl2
X-Gm-Gg: AZFdTZeu7boNWrQ/3vUNXuMMEp4Guf3WHn9Mm64PMJ4xWFi5bDonw1fsIik2fG5Cowb
	kD/4E6b0X0YuBKFooGhSixe7qIAyvrLGEnRf4/HZQ9KCyXZKlifcK4+EGtBIBoTFUOctRaupEeV
	Foqqq+9G9dgIhhr/+wX4R8swnCeZ9To2trEgQck7Vey0I3gIsRk5gGVWFyDEYUQs8cE9A9lwEvD
	8z79m917MZ6RWy47GXimlvJ5e1ywMfe9CW2UT6p5ECJyjLCEPmxHgqiqUPUPuTFqKX3j7NiAPp4
	tY0wlV7sUZCStS2x7Pax4sVxvzpd9LgKGmeYH28s/AluvjkGC02h51nBATWVe1LhTxvwxZPHudB
	karR99ie+emc4CJ87ERySwr9rw230eqdVr6z8H2nTYgyY4Pek3ZdlqIg0g2a4BpffhxV5TOgbuZ
	ihhRlTzYlLxndz8o4L1/NSTndilolP+btkFksxTV5vEFDeVAUJmVGTOOk58VPVMbHyIb+6jwwET
	IhUdUATfzzlsODEM4WV0QLTukjOytYJTzuUAivLaAU2L+/Uv3Oqvm1HIobCtu0Bm36GckWCpEpl
	oOuVKwfwq9hj/prIvQehhEDpWnyMsQsnW6lG5tLYN9TcJVLip61EApgQk0L+MyW2YPHz8e1Xo0Q
	=
X-Received: by 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr417095995e9.18.1795683553331;
        Thu, 26 Nov 2026 00:59:13 -0800 (PST)
Received: from center.. ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm40313744f8f.58.2026.11.26.00.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:59:12 -0800 (PST)
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
Subject: [PATCH v5 4/4] MIPS: Octeon: flash: use the simple map accessors without a shared eMMC
Date: Thu, 26 Nov 2026 08:59:06 +0000
Message-ID: <20261126085906.814373-5-orgads@gmail.com>
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

CAVIUM_OCTEON_SOC selects MTD_COMPLEX_MAPPINGS, and since
commit 8c1e6b14e27d ("MIPS: OCTEON: Protect accesses to bootbus flash
with octeon_bootbus_sem.") the flash map accessors take the semaphore
around every access; that commit gives no reason beyond "Without this,
we get bus errors." The semaphore's only other user is the eMMC host
of the older parts ("cavium,octeon-6130-mmc" in
drivers/mmc/host/cavium-octeon.c), which shares the boot bus; the CIU3
parts serialize their eMMC with a lock of their own.

On boards without that host the semaphore guards nothing, but the
custom accessors make the map non-simple, so MTD will not let jffs2
point at it and its mount copies every used eraseblock. Use
simple_map_init() there. The test is for the node, not the driver, so
a disabled mmc node keeps the semaphore.

simple_map_init() BUG()s on an unsupported bank width; the old code
warned and then hit the BUG() in the inline map accessors on the first
probe command. Check the width before mapping anything and fail the
probe instead.

On an Octeon CN6635 board (no eMMC) with a 100 MB jffs2 partition on
an 8-bit NOR the mount drops from 15-30 s to under 1 s together with
point() support in cfi_cmdset_0002.

A little-endian kernel keeps the semaphore accessors: the boot bus
there needs the address swizzle of the I/O accessors, and a pointed
address would be read with plain loads.

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v5: keep the old accessors on little-endian kernels (sashiko);
    quote the reason 8c1e6b14e27d gives, and drop a duplicated
    bank width comment.
v4: rebased onto v7.4-rc1; the Assisted-by tag is dropped (an LLM
    helped write this series).
    On top of the new 3/4: simple_map_init() gets the per-device
    map, and the bank width check runs before the allocation.
v3: Assisted-by in the documented form.
v2: check the bank width before ioremap() and drop the added
    iounmap() calls: flash_map was one static instance, so they could
    unmap a mapping that an earlier probe registered (sashiko).


 arch/mips/cavium-octeon/flash_setup.c | 39 +++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index d69249acf..896baf52d 100644
--- a/arch/mips/cavium-octeon/flash_setup.c
+++ b/arch/mips/cavium-octeon/flash_setup.c
@@ -61,6 +61,17 @@ static void octeon_flash_map_copy_to(struct map_info *map, unsigned long to,
 	up(&octeon_bootbus_sem);
 }
 
+static bool octeon_flash_bus_shared(void)
+{
+	struct device_node *np;
+	bool shared;
+
+	np = of_find_compatible_node(NULL, NULL, "cavium,octeon-6130-mmc");
+	shared = !!np;
+	of_node_put(np);
+	return shared;
+}
+
 /*
  * Module/ driver initialization.
  *
@@ -85,6 +96,11 @@ static int octeon_flash_probe(struct platform_device *pdev)
 	 */
 	region_cfg.u64 = cvmx_read_csr(CVMX_MIO_BOOT_REG_CFGX(cs));
 	if (region_cfg.s.en) {
+		if (!map_bankwidth_supported(region_cfg.s.width + 1)) {
+			pr_err("Unsupported flash bank width %d\n",
+			       region_cfg.s.width + 1);
+			return -EINVAL;
+		}
 		map = devm_kzalloc(&pdev->dev, sizeof(*map), GFP_KERNEL);
 		if (!map)
 			return -ENOMEM;
@@ -107,11 +123,24 @@ static int octeon_flash_probe(struct platform_device *pdev)
 			return -ENOMEM;
 		pr_notice("Bootbus flash: Setting flash for %luMB flash at 0x%08llx\n",
 			  map->size >> 20, map->phys);
-		WARN_ON(!map_bankwidth_supported(map->bankwidth));
-		map->read = octeon_flash_map_read;
-		map->write = octeon_flash_map_write;
-		map->copy_from = octeon_flash_map_copy_from;
-		map->copy_to = octeon_flash_map_copy_to;
+		/*
+		 * The boot bus semaphore only serializes the flash against
+		 * an eMMC host that shares the bus (the CIU3 parts have
+		 * their own). Without one, use the simple accessors: they
+		 * let MTD point at the flash, so jffs2 scans it in place.
+		 * Not on little-endian: the boot bus needs the address
+		 * swizzle of the I/O accessors, which a plain load through
+		 * a pointed address does not get.
+		 */
+		if (octeon_flash_bus_shared() ||
+		    IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN)) {
+			map->read = octeon_flash_map_read;
+			map->write = octeon_flash_map_write;
+			map->copy_from = octeon_flash_map_copy_from;
+			map->copy_to = octeon_flash_map_copy_to;
+		} else {
+			simple_map_init(map);
+		}
 		mtd = do_map_probe("cfi_probe", map);
 		if (!mtd) {
 			pr_err("Failed to register MTD device for flash\n");
-- 
2.53.0

