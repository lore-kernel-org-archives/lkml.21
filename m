Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607480;
	b=ByEL2quP6zzlQxQKmZR4gwZaUwwIDOQ/3rA3VGYmjvzmpUXL/jRkUH9f4AjCdmufLl3A
	 xAl3muw7HGiDFomRzULEL8RmGlKWMrzo44I3z+ONWex3qFslbEpZKCYuQjU67m/mksh51
	 nyXwUvqOsYBdIMnJ4lD90jvqoY1iAq75SkzjStiqKHmFsft3Nsp0JJUR6N4PamCJMDpM6
	 IjUO0TFCy8NO5HaiXXycPePMM5q3GfKeNZBjT9xg5WPMd6x+4P35YDHRxtnmWoflKc9u8
	 rcgi2bhO2RTnJyuUAnfBpr9u9SyoP0rFbFN9aRhzQ59tD8GXLLPGJO4IUtQMByvHRuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FeByhJ3BHvo/2jRdQJQGFglqWfC3P53F7bznOhuKwO4=;
	b=3HD4ZLrJr6Q6b6tjosc1oUDAsAhXPjlNsH1ujdiurn/tpyfoP3QlVElnaeLpKQPWIf8l
	 iL+FFKGQXtHdf0mwzkDBIhKcLyINFLVrL9UsBcKkylgK3Cp7W0C+gaL45foTJ0aUWpwzE
	 ONLgCNVoqRd5IOq0JOP0TXKgyEf6MF/RzZorQT2fOUX0oXGMTvVl9dt+TH+hmKd7Z2OVE
	 51zvcwgJiZFzcfdL9o5vLm3ANy8AKe/AMTV7/hynNblgbJuMMxfkrWiERMCHcsOR4VjY8
	 dUJrQN2y9iqFbaW+7w2Okw37qo/guCChE+iuEOLZxobWyni9Vbp9z5PYPcYb5TozOWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKTIuiel;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8DE606A338
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC8DE606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKTIuiel
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f0621eec70so38154665ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607478; x=1796212278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FeByhJ3BHvo/2jRdQJQGFglqWfC3P53F7bznOhuKwO4=;
        b=fKTIuiell0F9fayFUXNdbXkc9/s8SXSCjyBMAIWiunc3I5o7xEcxZxjqRvcboFrsKZ
         fUapIZ4v9zwbrA3QGyX3s0PSuKLaYdEcYI2EdU87//eaDwIPhdED5Ue3ByrhbA2Dfu6/
         iv3aplKvgk8J/A61mssKeVGNLieueco/xeOkLwhswB2iDrQR8yFSVaifIAIWrOZP977N
         /LHLaI9wrfSXNu0BR477fffQJRoX6jSfPUHJN9D3sOIXNhPBcDLMa/xGaE4hogdU7X+J
         kaoCh6S44Y9pPgUk03iCfioS6NEM3YdiUSwUZzu7Mf1Hsn041sCVaVIvh2qktRuKxuir
         RpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607478; x=1796212278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FeByhJ3BHvo/2jRdQJQGFglqWfC3P53F7bznOhuKwO4=;
        b=eoVm2ZYA2N2lFpZF+QHXZGJx5kvaSvLReTWd2QtoCm0oFPd8SrDVbn8/QP0yAgmmHG
         ksmFj4Atv+sX4h6awnEH8o5YF70S843eJYmJouv3eM13yuonRFeN2OqSiWhAtkNhooGQ
         XIgY4rDHg5OfKW09ZUJ2aINV4G8golri30714uzfFKb2hS3SXDAYJwG3lpugJA8YgSKZ
         GgHr6uVjjSV2rUoGZ22vOUCwUBu0DSr1jLKhu3aONKqCbf+ynaJt481n0mPh0DryhSo3
         SJbTYqpavbKT98VRLgXrnfjPMBDFTPw/szCHDuthrTCrYKCM7jY1qCdr73lIaoKgme/Y
         RVGw==
X-Forwarded-Encrypted: i=1; AL+hErHoLBLjLYr/epqE7LfdScT/XE2EAjUmH7eI9sliXUp+9Pl6VGFMMd8kuQnq1qBlqksMRPikO+1E+QSMvrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cF8O5sS4CDpUYJjEQHqbVHNwebHU5IP3rx7qtglFdN8wOp4sN
	DmWjbXgw1nXp92iF7U/4MixchEFrWRZFWI3Qcw+RQDfkWr+yeEOjfkgE
X-Gm-Gg: AZFdTZfjYw/1SngVJUNY4UwNpxLkWk9WUBzXlo1K0R+Z/TTeWaV63+Eq7L2ySXHCdpJ
	Kha5ucobMoze0tXV3aRVjifYBKbt3FzhV0rj5L4uVVHqS1gnDQF7j7v5vJalIGnJh2dQKjFJx0G
	HhvyPih/zYr8gW7zxxsxigPh94iZVR24DtLeAvwM01XBuAiS2Zx+mkMnrJ+BXsjVhRlOuyRyB8v
	LpajPXYV4Ambb1NhmWzhf/MJYWg/ojaMxsrVhAOR0I/0sR/JEoK51o3lStdeTP/24jNrTpf5ekM
	UOFCjZxV7+OcAoRbhsKCwmw+TRPiM/OVIgH5/Lz0ASarLhGYSUH4nEe9+DO9MEnIRIhCSD3Ufhh
	ewnlTfne+IGHPFwoTnZ+ZmNYgnDTAfdj5MHa5MYzQsiC6Zds1vMju78TpMXC9ZpxsaI7JF1vNTC
	DRspEAhyfc6dGDH0uvuc23qluIhMa0Ai7khoMWuZzCec6Od4Dhp16kN9n2B4BX37S4vVa4Y0nXC
	RpkTOQAvpqPIV2Ae/xQvPw3JGPiRmTY857EDL4UCjc32BLfBzpk/smIzAnp2TE3gNDG/QNbe1ub
	El77jWMYRKZd32NM1tsmrkDwPzlSECv0nw==
X-Received: by 2002:a17:90b:3891:b0:3b4:127a:2bc2 with SMTP id 98e67ed59e1d1-3b41c8d9bfamr15951758a91.14.1795607478256;
        Wed, 25 Nov 2026 03:51:18 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm30569662a91.15.2026.11.25.03.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:51:17 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 2/3] mtd: rawnand: intel: unmap the DMA buffer in ebu_dma_start()
Date: Wed, 25 Nov 2026 19:51:07 +0800
Message-Id: <20261125115108.4147741-3-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
References: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
 <20261125115108.4147741-1-leeonion.muyu@gmail.com>
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

