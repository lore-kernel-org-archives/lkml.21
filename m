Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598749;
	b=ITF2MXWtsF1vCF095VZtRE2wa4Olw+2uqeCTz+JzMtyThrPa82NOw0rqhCFhrj5nIK3Q
	 8VTSF0lqOy8pzllHeSUUOfN98qxjhjPE88H53LtnAI0dRjuzX4RFUJc5QkoG1qGIiCQsy
	 I/4Ji6V4s1DHtE2HBkm3SW2S1YTtZj+16TOEH/SkYvAr1EIw+AuUAoYGjUfNsb14AtCTi
	 jSZ7kCl4jYdNFYIyJqbewguO1g8lGnvUT83F7Pyusq8DplG0jgmEdGT3INkKxsUgVrrbZ
	 kmzUBzTgCnFQVp0HkgWwdezOYYGR1iMRYU8IkbwF09YpPRE/WDhS3u3z4J4tX5vH2Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FeByhJ3BHvo/2jRdQJQGFglqWfC3P53F7bznOhuKwO4=;
	b=xGP7prk05nwF9xBHCRi9e8MyR75xIo4W8YT1lj+ir1FcAc1qGWN8EVTl1NpxHwGeUX9C
	 9PpTUXiFifMW1BUu7AmTGRhLTtxlexSJ3Kxmi/PSvbNo2FG+wCp71SAumAxsTzSVP99lx
	 a+2v0tbyXnd63F0q2fzggOH7djvJVNPVGanDoEeP0jQC0cZzBzvG8uHL1SJpnxZ1J0bhg
	 CDem9N1rWqsr/VtEY2ppB+XGTKSgea6Pj9IOitx/NcTxw3tXzgIfSfBzJuzfGpHa0PGeY
	 eelmoMY8E4CzmM4Ax2MCYlJ+1KiEfIwA+jbm8Y3uxQP4cMgcoBa7fxA8DX+QQ7K/Xhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K8BaRQHa;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C92606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3C92606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K8BaRQHa
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f04bea9a93so48371255ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795598748; x=1796203548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FeByhJ3BHvo/2jRdQJQGFglqWfC3P53F7bznOhuKwO4=;
        b=K8BaRQHaP+mwBjhBJwv8/7xEMnuYfDjMVxNnD7RSO+2NbJDxJY44NCK23E4cm1kzH5
         65NUrVkWBiyiib6ecfUEyhHGjwqfrbP5iLrzaAOEHKWhWWbgizA//XB0HT5BoBwE0m8O
         BZuLOGGzwoUr76Hq0G/CcUwVFPVlkDJeExjxuFHUckm1TVPaVyqMedP5JZi4dEPacBV3
         THMKAh0K9dVFuLdhfuIgmVvwye+1iyt2HvHr4cgV5OpDazlPvS6NSHC8wR0at2SuMIYA
         BofzKPfNX7Qs6LVDn46gQcO2Q8YajnUxI9jfnqg0us/JWzBNhLVCAjGwIbz6GDfnpiHR
         NAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598748; x=1796203548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FeByhJ3BHvo/2jRdQJQGFglqWfC3P53F7bznOhuKwO4=;
        b=WHQoL1Bm8OWZfMKeil3mak/1KwUMJNkQJ1yjhxpiHWwXyJlBDm7hc4e8ocf+1c7/1b
         M8AE60zXNBwciDKArZydEW4IgFWORtucyHZzCVFIzPHQXyTaicYkZZvnqZDzjeZ6RTNJ
         LgEuvFKfJvqC/zWKLjO4aQjoj9x2g/Q041eE1vAGyEpivdhFkf3cIlaeNhz6FTu/XgMw
         mnmw64z9OxpwClvj4Qm6ArrSMx6JohFOp6mbqwjwHrgzpceMMfbJaaGzYshyL9nBaYXQ
         d3bPyfF9EV+XDMhGRYznL/SBS0s0j2kzzAniUvAu3r3zhzowN42sTVdI/Flc+c/XAdVS
         Pokg==
X-Forwarded-Encrypted: i=1; AL+hErG01y1tfnaaw7ry0GtN83H76Ss2TVQBR5CCaW6yr2ub8S+wjkU+87d+aV3yOPyZYv81qpSjbeaLZ/6KILU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Rga9KHgNkW+YIxYfF3BrL1hjib+S+a4RrmtxOIVLBWC/jKJDa
	fDv9lYO1vgz7hiTl6GHGOPlpjzKICAMX6qwQWISnRpux2p4p0tLMEYNK
X-Gm-Gg: AZFdTZfa78v9cOoWTFeABnjEGYR8ukipDnlGHhDtT6YPAV7D9pFOHWymEM+Z3XjQVZH
	CA219j3WmH2NXx9bvjb5pnUjf8u1hDVsjcnl3UWLCU+oI2Y+MECwHd9/6kwniUg0XzVEBnTmRw7
	uKUSSdkYp/6vcrJyLAB4ZZZ4hlNF/g7UuBxrRWntTQDnoKuIHRsUFUMldOkE0oNLrYZDBIGraYK
	3BO6xfFNqt2sEyiYnhysY/PBaKk6k3r02cpQy3v3dEUebQEAF1ZLdlW1WBqgyt4ZhO6WDOOmVo/
	J22D8TE+l3f5kUlMclGaVPjh6/voQ74RE3rGZmEgyLuGLATLlfbrGdRyG532Ta2D3rndXD3hgpj
	9bCzrcsS+kSAb+0dqzkTEM+n9JFnpqlDjjq1G2GiEEpDd+lU9SdXzNLRTGV7svoT0yh998N2PP/
	cChCI/djL3+HuYl/qu4kvf8m3usOxMcFU6VLDLuJF9AmxBAFF9abstW+8fhMnjyAJU/7gvHfWf8
	PeVsEQw+/Bhz2Lckphm5uioJMxInYRsuYOM3bR7dbJ/U7rH92sTlSSbQ3mci+skZEOOPZdCS2TK
	VZXF4hZMW0uaBa9e0PyNdlRgRPB28+y/RQ==
X-Received: by 2002:a17:903:2308:b0:2e9:cb4:b345 with SMTP id d9443c01a7336-2f03f264db3mr164655465ad.55.1795598748107;
        Wed, 25 Nov 2026 01:25:48 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f142b8bsm80883155ad.70.2026.11.25.01.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:25:47 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/3] mtd: rawnand: intel: unmap the DMA buffer in ebu_dma_start()
Date: Wed, 25 Nov 2026 17:25:37 +0800
Message-Id: <20261125092538.1938516-3-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
References: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
 <20261125092538.1938516-1-leeonion.muyu@gmail.com>
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

ebu_dma_start() maps the data buffer for every page transfer but
only unmaps it on the error path.  Successful transfers thus leak
the mapping, which accumulates IOVA space on IOMMU systems and
skips any cache maintenance the unmap would perform on
non-coherent platforms.  The error path has two more problems:
when the mapping itself fails it jumps to the unmap with an
invalid dma address, and the unmap is performed with
ebu_host->dev instead of the dma_dev device the buffer was
mapped with.

Return directly when the mapping fails, and unmap with dma_dev on
both the success and the error paths.

Fixes: 0b1039f016e8a ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 1f493fb426d6..5eff8d7522d4 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -312,8 +312,7 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 	buf_dma = dma_map_single(dma_dev, (void *)buf, len, dir);
 	if (dma_mapping_error(dma_dev, buf_dma)) {
 		dev_err(ebu_host->dev, "Failed to map DMA buffer\n");
-		ret = -EIO;
-		goto err_unmap;
+		return -EIO;
 	}
 
 	tx = dmaengine_prep_slave_single(chan, buf_dma, len, dir, flags);
@@ -346,10 +345,12 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 		goto err_unmap;
 	}
 
+	dma_unmap_single(dma_dev, buf_dma, len, dir);
+
 	return 0;
 
 err_unmap:
-	dma_unmap_single(ebu_host->dev, buf_dma, len, dir);
+	dma_unmap_single(dma_dev, buf_dma, len, dir);
 
 	return ret;
 }
-- 
2.34.1

