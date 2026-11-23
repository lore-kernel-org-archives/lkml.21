Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417503;
	b=j1tiGv5uaflriZGTHj8iUKfTJV2LQHwnA939L7k9n02RTaYw5q2stoMxBpVtLa6uoqVg
	 v0P9muuvHziVm6352wXcvC4dDbN1pucOuytreP+h2+mFD/18s0weFKIPV2SDdEJolJiyL
	 RSmklRGZdupZRBlqeVHhBQddFTlobVE8JA3dAcdWv4XDxS7/wI6HBoQl1h+iWl/yN3oPX
	 SorFAo9twLml/Zajs6Hqe1ITtnnMbLy2xBVT6jl1hgXEdmQ/dmPODUj9alccGk8hKnvyk
	 3U1VY1Fx/EyeMPmIp00VPR9JbQtrXaEi0l1Yn7JrKl7Cg15tE+MYdG6VJAUtjCtKC4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eT8QnuufkN4rAqAjynMD8IPwDRm8B3Z1LQZ8ZX2eiyE=;
	b=EuqZSWzaDP+dTK2UtvuK0+NBhaqRlsfsnoYbvO9EUk1kBvthTR9HLrep1xxZASvRo7ab
	 eku3WESwYvpxwHbI9kYHCgjzAAjyudRvDr+JenFdpKsHA4STeUmGF3RlNp00jHuk1eBGd
	 eEGEXmLFMQt/IQ0R3UI3fo5lbmtiJwOPgoptuKI7pbC+wV8mYQG/NMI3kOVvWzWT2zMIF
	 iCad8pwHss2UN/vHFeX1e85er6J10sBW8nKs+tFCeazZJu1H4hGOzpoRUoglaWkEicoWp
	 xB+Lj0JPoH3snqm2tcqbOMqjUyuNm3HdKK/UdM7l5U1cNpbuU5LvcXWs1hcfM7AFA4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HcBSyWAd;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575C7606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 575C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HcBSyWAd
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso1641429a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417502; x=1796022302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eT8QnuufkN4rAqAjynMD8IPwDRm8B3Z1LQZ8ZX2eiyE=;
        b=HcBSyWAdszflgG9bIJGgkRKL8xy1RExGh1/vb9xvnX9Zv7Jh8ABLd2JI6GcfXbay6d
         ttzZnUYAiP0WS5PHkSDNqjYy1QVcDT5W2TWXO2TvYgXQi5zEdv7FgRox3ZOBVxK8hZaD
         XJSnT5SwB6ElD5Rxjg5Qek3T7s6XD0hMX4u3H+yFZi86hWlNRe2oJWyLRgW+wtnmYufu
         sqdjl4nD0AmcAaVK4L9xtcyqGLRB49Ud3EFBBKwKrAQUvfQCTX0iK5+0PtTURezPhvOn
         TmLRSFMlOfrvg7K5//dNYuh0nLdCImwpwTIseAPngYmc7ztj/f7RCZx1QMbV1a1OvZTJ
         q7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417502; x=1796022302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eT8QnuufkN4rAqAjynMD8IPwDRm8B3Z1LQZ8ZX2eiyE=;
        b=ouqemqkDBArPJm4q02Q0Vy0qch40d9PzaVxrL2yDr5y7Bt3X9wMAXvEGc7Lb1EGzq/
         y0lulHIdAHSpLp9p95/PMe4pYg/mPretAO2XSVro3hyi0cxprq2Pbcx6ZJk7OEwONeGp
         ftm5kPDVz6v72Q01QtDShK8sTbNmpI4w8RSWqTRYOMcM46ahc4xGjcaNMaPfxMNlGB19
         doXFHA2enNk1/41VrBRIGVodhZJYtbDk+BfZB8PEdM66QwIa9SkBR60ZJGZBSkbpRwWz
         HUaSX212+pccuJST8DsRb6Dw2RfImLxvli651yDnjgxlRR5bpdJx3VdHG9Fd/Y3YbPve
         9wOQ==
X-Forwarded-Encrypted: i=1; AL+hErEYX+z0YtfwbtrlUORmI42vI3YlcB5TOb/K2M7UIAlqq48kRgUi1kTO1QO5vKmNhFvHtxs/5Jc7FqBCIlw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1ctiStOYlZwqr/3O0kIKwgk2MWxf9OltWaGn6sWpW2NI9pj7+
	dl7gRDmNbLmAOiq3SalykmKxHq9kolVVZeR92YUHfqOMgfC06WH4+0lZ
X-Gm-Gg: AZFdTZdmbwp5SDY94ahT+S6Q275nIphWfKc3PIC/2+1bCrb9aw7Y4YMt5bsW7DoJ3Fo
	2CFzx5ShM74SDgeFBAMDcmV73ugpaDBYXL4RNe7Tgztp4XkweTxI/+G4bxt99VsneZXCfB9xyCy
	fNDz6HkMg0mlZaKNtbauBNbvAXPZ5hnkh3DW+j6DCurRE4SCKl7XiMjK04Y0yc+ghaz5bBqGoJv
	Wv9DPZaJFo0dEjxEmld+cBRGWfw68toT75miZNpQmP+J7Trl8I175rHLi2CGXN+1GT3RrgZwXSs
	6J5EqRMK6wdf+W5m5qtiue/qjHFOMJn0pYrQ0DtMoPeTYrIfGKfgg4rTvwplAWK8dLa4huJfsVz
	2G9hL0r52xJB4JmdQY7Vm2G/rh3HEivwIzZu82eNxUfh+p8WyluNsMZdlQge+GWLHtFqBcjri1U
	MMBS7rPs9eNqMcs37w9DGvHzi22oFQkYb4QMZQgkRWc1/FqBdYx6s5znITfRlZ7ynCb+WgylQmx
	QmFkL3JGp4heFYAd0OnNA3Qo9GVJ/SaGJRepE89Os7+h1f+17g4c0fCFYBpq+bRzORddCQ5wDY9
	ra6HpIvP3jTDSo6DHGHF1krBGffCXx/TVA==
X-Received: by 2002:a17:90a:c10e:b0:3b3:b0f4:1bf6 with SMTP id 98e67ed59e1d1-3b41c8ff7b3mr10083555a91.22.1795417502578;
        Sun, 22 Nov 2026 23:05:02 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm19763094a91.2.2026.11.22.23.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:05:02 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v2 3/3] mtd: rawnand: r852: bounce non-linear-map buffers
Date: Mon, 23 Nov 2026 15:04:40 +0800
Message-Id: <20261123070440.3060882-4-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
References: <20261123055020.1995251-1-ping.li@horizon.auto>
 <20261123070440.3060882-1-leeonion.muyu@gmail.com>
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

r852_do_dma() only bounces buffers that are not R852_DMA_LEN
aligned.  An aligned vmalloc'd buffer passes this check and gets
fed to dma_map_single(), which is only valid for linear-map
addresses.  Such buffers are not hypothetical: mtdblock's write
cache is vmalloc'ed, and UBIFS passes vmalloc'ed LPT buffers.

Extend the bounce condition with a virt_addr_valid() check so
that non-linear-map buffers go through the existing internal
bounce buffer instead.

Fixes: 67e054e919248 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..4dbfc053fb21 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -188,8 +188,8 @@ static void r852_do_dma(struct r852_device *dev, uint8_t *buf, int do_read)
 	  from device, for writes first fill the buffer  from memory*/
 	dev->dma_state = do_read ? DMA_INTERNAL : DMA_MEMORY;
 
-	/* if incoming buffer is not page aligned, we should do bounce */
-	if ((unsigned long)buf & (R852_DMA_LEN-1))
+	/* if incoming buffer is not usable for DMA, we should do bounce */
+	if (!virt_addr_valid(buf) || (unsigned long)buf & (R852_DMA_LEN - 1))
 		bounce = 1;
 
 	if (!bounce) {
-- 
2.34.1

