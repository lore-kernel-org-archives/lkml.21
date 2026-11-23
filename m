Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417493;
	b=HljwPH4YDeuz4EzJzCiczJJziXdmdoAr0005c4FV9O7CzcP1oAeovPwZfH3/lJV4gv+J
	 ApZqxojtntht8/SMNT2lm2V9gtJNjqaymRiwowKgDGJTOPfQ0Ey35uHn8R6iVlhyGuW8B
	 +ggHSRpoOnDIgjfTbDmGEit6+kLMIcvvMM4JA1Lo5COC+dG6g/03u3r9IDWwEe58F2/AJ
	 9ryqjjjZPM6KWf8m6XVvFJ6VToBdHLteAigaWLXwYclc88idxbTRqRjTHtQlnQG1veiuO
	 W82m8s97uPQ+wiFz6UDZw0nHsxuxuMogR3WthcPj0oGcu0WHZNdTsw1SptuHk6yOCRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sRG8jEi/eAqiUU37mzrLl9nb9M97yHGqajx0LyJX7Po=;
	b=BoCgMFjygxKarLYjiCK1HRwSDmZ+xDPuWzBJz0+PC1+ClvX6EgYWhO6xogf1TTesjISv
	 F+4+LZt7Dd0woNjuZ6RVlNUYqeNRzZZWUnZtejs0LwQS34p3tDYQD5NVBkrdU4dKfmNjH
	 DX2zbrSGW/NwSOmXP0ICZeK6bF7BkV5okxD59k+pC0gDAkw5HQGj9zH2tJEs0bYp/wHv6
	 61jt7YKC0wnLbDdgyGN3pQhKGticX7jyLayVyaEXBkBN1d7d4rnBHV8BUigEyHPjFGO5v
	 JFUI5I2/VvPAybNVkehaq0xTGl6jqbMiYYwbQRC1eZca2X9aJQz1dPjcpv7eOjhtqrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2ejsZfu;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F8B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01F8B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2ejsZfu
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f0414c1062so15292325ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417492; x=1796022292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRG8jEi/eAqiUU37mzrLl9nb9M97yHGqajx0LyJX7Po=;
        b=S2ejsZfuay4D8KZ0q2moRn/M4BSlM1kYpzAqeLUpDLh2ZvL76+ArgsFQR9b4o02BKh
         uapMzH7h2Q++9eOhRl/9IX08GDll+2l0sav3peL69rsCmC+QWyMvib3zU1aQhZdg/mNG
         tvimVNdvmWu77K0dtR32J/SCP3JEEZ9LdiH7NiNvXHdmt2PYq+Hi75gmRdpu8sdaS76Z
         CGKPjV7Fub47ndS3w2AjeK9cl6VRW9WMIzktTMzPpKnq8m0pyRTOtrcth+ogAirsCQuC
         QUWORzx3r//kgWtJFjxmE8/3kcwsFnHTRMRgtCjmZa562BvZFS19vvNF8yiIrzJaRDOs
         fgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417492; x=1796022292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sRG8jEi/eAqiUU37mzrLl9nb9M97yHGqajx0LyJX7Po=;
        b=MpCXHYuwugYtZxyC/+NAUuqpsgyCy7kAstov0utcGOF8nnxzmLvMz+LsUAxHAPecbN
         h5Ob6uxjlGwYeRmZEdJZ5zkaawVfuYWlgfqr5h9BCMuNjRL3gNGDKxCkyPzpEHNYwNKs
         mS8cVI2I4WL+ohw1O0FEJmwKhhp080DdW5zQqex6sbANd34Otzs4G3Jwm6zXQpu1lX07
         5thW5AGdy6KjcL9BY2OdtJibEn5qE1W8i5xXSeHqSFAdcvpUWCCVrLyyzPgBZwWqvUMk
         qZmLPxpLsCPd6Ba7NK+ceRu2eWqNKFEhpddzqYRrDpEeC/+CjScJbu4gIUaDPN+hmTlc
         l48g==
X-Forwarded-Encrypted: i=1; AL+hErEmcq+NnaSW3u5QWSq/dwzCQO9y/j8bx2FHgnoIhIVxtIl5mv/07QyhBMfqcfcAfgZ/xA9CuSLtVU/ascA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m09w3UaGa+QUP3P4KyxN875GXpJMUN791s/Caq/a28/4X9b9S
	bp7ozYJcFb7wNgvqBsideh4R0ZYcDDWXR8YSt3Di81K28HHxbAXJkwUc
X-Gm-Gg: AZFdTZe50nlkSMm1PlWuflgdJkbvKXYrPTTSjk8bR/q/7LPN15UagL1SxamTQOROMRG
	A0VzvXyLGkF1Z5bbsNNf4ueIF7ZtgBKOIaeVTsx7tLTnM2yB8cBEpZJtMETC8+EXoURoROZB2ia
	qk0y45Hth1DqWlfrCFAEMbpTn6W2t4PbdEsi2hF6cWSdQjRskeTVXAHtcrC4goGgBonJ+hgFbWy
	5qpSk9kCO4V89F98N9mXTde3StCLjJecwuxaOsev/zY7SNxnIfgfejczkZrR2LX7gZp1tAyWN0q
	QHUe8v3cmW9I/hc44qdc41rPVPIcHrc4M5mn2AEa8dc23+XBqJplYDGwqUqVDxwLSZoHE7IFl+z
	T0gFmgm+qVRyNGWgiU3kTd5nb7gR6FsoOOk4i8SBG4A7aR2mSbRF4wZx+twLAXtJ7s0BP2iF4pf
	RyYNg2RanoXWu71B3i2N/175rjIs8aYoD8QPFFGtNbb68VNdiE8E6hIuCCkfbZ1eOxau4W4o7it
	wYMNojS+D9KvYAj90LDnPhtKy8TxXv1Kwr5TLUdnGtHCrC9HDKl5u0mgNLwoPmCtcG0bZbl4M2H
	/K6kNhnVNMKnPHjaEKzXu2zDb+RW2iUla7UqknS17voXQ1v067dbP9o=
X-Received: by 2002:a17:90b:134e:b0:3b0:a7e7:68f5 with SMTP id 98e67ed59e1d1-3b41c7b638bmr8045337a91.7.1795417492356;
        Sun, 22 Nov 2026 23:04:52 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm19763094a91.2.2026.11.22.23.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:04:51 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v2 1/3] mtd: rawnand: intel: declare NAND_USES_DMA
Date: Mon, 23 Nov 2026 15:04:38 +0800
Message-Id: <20261123070440.3060882-2-leeonion.muyu@gmail.com>
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

ebu_nand_read_page_hwecc()/ebu_nand_write_page_hwecc() feed the
page buffers provided by the NAND core straight to the DMA
engine, but the driver never declares NAND_USES_DMA.  Because of
this, nand_base cannot know the controller DMAs these buffers and
never bounces non-linear-map ones (see the use_bounce_buf logic
in nand_do_read_ops()/nand_do_write_ops()).

Non-linear-map buffers are not hypothetical here: mtdblock's
write cache is vmalloc'ed and UBIFS passes vmalloc'ed LPT buffers,
so such buffers can reach the controller's DMA engine, for which
they are not a valid dma_map_single() input.

Declare NAND_USES_DMA so that nand_base bounces non-linear-map
buffers through chip->data_buf, as the other DMA-capable
controllers (arasan, denali, meson, mtk, nuvoton...) already do.

Fixes: 0b1039f016e8a ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index cfb4b231e067..1f493fb426d6 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -688,6 +688,7 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	nand = &ebu_host->chip;
 	nand->controller = &ebu_host->controller;
 	nand->controller->ops = &ebu_nand_controller_ops;
+	nand->options |= NAND_USES_DMA;
 
 	/* Scan to find existence of the device */
 	ret = nand_scan(&ebu_host->chip, 1);
-- 
2.34.1

