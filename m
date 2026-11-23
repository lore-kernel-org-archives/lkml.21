Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417487;
	b=vhto/jSJfXXhcPuc3ojqdBl8kZuGs43iVd85AhrV/sUU+SbFYJ1+GLnx95tSOkFf5Y3I
	 zn6Cwbsg1nGfiSgCC0g+r+4a0h2XioKBSn8F6akNOvZnmI/6HTtT+2hQaszdgYU5Xwzdq
	 zHoxFanD1p5G4zyv//3LaOskhUTfzyXO0GJ20rG8B5LiKBNR8o6VX7Ka+QNd0HHSzDv20
	 PmwKFVHSMOCdpr97wpbymnLkdkYxxboQqmKhe9W7cyGa6bg2go2KtpVzQXOTQI3tBvjQD
	 vQKDUoqebVGY/rwyf1tXgeCk8AHmGEpniu+S9QkjfUfGeVFXMWfVI6BL1QJh5wTi5dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cEX0mxA7VnoyxX9zCpamt/vhWNwnvsYGWit7MA7nHRs=;
	b=SFyNf/Y7xmg9wGHAJS0OF2QQVHnvn+Arf/cGYYokjnU9ErCrj2GGOF2swids0jxxhfnP
	 WCwhnv1bkx0qNMQfBpSfB1e8jXnT4NLCoRw1Fdvb7afMs4zA3TwK8mgbLraTa3sOnOjk/
	 GK+nQZY7xFFPMGj7kAJmVHhRhn+cc6ANDySwC0gBozP8kCZB5Wc5JgztH54RPSmjmQWV4
	 /52Qe3kzKHvahCYsvVEXp2uzKG87Mj1GX52O2+kkFC8ty8b70lblH7irK5tomft6drxko
	 fXiP2h/0tN+E4wkZ1yFtRlW5q7BruThobYXIVz9fCFfOK7NAq1KNW3hC1lTNdA38f0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DeSAvrh7;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503AC606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 503AC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DeSAvrh7
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdab938dc83so1178285a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417487; x=1796022287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEX0mxA7VnoyxX9zCpamt/vhWNwnvsYGWit7MA7nHRs=;
        b=DeSAvrh7wdcJEwwBJTxwur1Orb4UDGEU2MwySSuKRZ7hm5/xH+Az6S6VlxuOoIqa7X
         cOALMSRT1PTfXaUj6xpXCkvDLs1zFlsKkP+BR8vMai7kFBkI8kz5qFZk850Plxo834Jb
         wGmDfXN2RVDICisv1pzwC2c0IFT4t+CnHYrev4B2PDdBv6UQ0SO8gQwlMi2MxcvKgTM0
         0QgUoKoC9x6b9+z4/oCeBmfF9K3g6g5PqRjilB8G5GojBoiyhKwZW2mo0l1tB/CMs7h/
         4N1JzoEupr3jPFFba8HygMH7cNTJUGYhbAkCvCmBHbOFGIkfxQXNUlf8Dnp+l1HOnLPf
         LfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417487; x=1796022287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cEX0mxA7VnoyxX9zCpamt/vhWNwnvsYGWit7MA7nHRs=;
        b=F7XIKDoQmbtSzdmxshmZdAZe1NWuwOZh+1vegzI34Ac3ZqmRoCfmnVpBVq+3eaTJv0
         A7o33/HJzCqewwwFSd3EiDnBGwUxxZX7bucS2wmgQxcYPkIfS8jhYJI7TtHOnj71H0te
         3Wd/C9NSTApYJFHClknmruc3zFWo297wtYiuYOPDxuPlC61h7b58rKAz7DlSqxIHBdwA
         b78hf5b59qCZQCLtktDouX/njKEyaLnHoS6d/H1zlvMw94RCcBzjIlBFO8+ellNhU6P9
         T1KHc4o+jjIGi8KsYNZeDkET+q6lhftI7OprlUHe254sfhNw39TOUiZlayNcb8nL/5qC
         foPQ==
X-Forwarded-Encrypted: i=1; AL+hErHOQ6w7c/UvbbqzZ61ow/RHWxJguhdW1mwqVtU9ONcdESxtrf/JxnSpqeU8uo9sNiI592OAb+KansGve0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q0sg5eHfLba94s/p6oFbX4Aymd7EJRmDMRbD4CpvaPPDe1YbY
	qpmXeJSlZU+O5m+pBluJBfUQnfB25rcqpYw4Vsr5IOrGhtxJklcp8zzBXbEKARcG
X-Gm-Gg: AZFdTZfdGUe7n7Z0LxI0LUgmTGiySHv0KlZPP3+/O+LVJ6L5ETIhf6UtD0AuOlNhIyD
	dKGoGOoF9pc6inNErTX/LGVSIqhPmt8+ZkyAk95kjjNUm/a+Eb26CgTczgdElzrMGzrQrz8GMg7
	6qOfhMoGj+Pt9bnEQ1/SCEQPn+peeX0AF/tS86VKOG2EqZFAzCZJpgYFHon6biWhXDSQwd7bFgr
	uHcQri6y0Hnm91xv10RzidpozAwsXR06RTVZ2c6TtM2q1nqKJkFpTaIb21VojIZ2tpOVDB2vkTg
	7knkNykSX+tqBxyf5wDUCuk4OSdIVQh2Isbb/FZh+XJiwwvbte4fVi5CbKCjAo+DxptvxCVYAId
	fupioE7qR1W14nzve9aI8+zppuN4p+qorX4yvfMEbv0XgQaPh1CbC/X9yieyWpfc4saiRIhLGjo
	wcQP+23qk5DVVKJvDBE8KYX8cyPDFykrbdZ6YEg4Is9HdnAB3wnniWOhB1USd0+FNk3+xT0yy8o
	YIPcTCtjPHHSf8MOne75NVGtxovAN/InvdStQyXUGqMg5eRg8s7Mb5K1HaI1dmaZgn+uoBIqJvS
	TXJphqeExu1VfMy/TWp9Yfsxn6aoSOFbMA==
X-Received: by 2002:a17:90b:3d4d:b0:3b3:b636:763c with SMTP id 98e67ed59e1d1-3b41c8fe33bmr10175028a91.22.1795417486682;
        Sun, 22 Nov 2026 23:04:46 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm19763094a91.2.2026.11.22.23.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:04:46 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v2 0/3] mtd: rawnand: protect DMA engines from vmalloc'd buffers
Date: Mon, 23 Nov 2026 15:04:37 +0800
Message-Id: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123055020.1995251-1-ping.li@horizon.auto>
References: <20261123055020.1995251-1-ping.li@horizon.auto>
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

While discussing a proposal to also allocate the mtdchar read/write
bounce buffers with kvmalloc() [1], an audit showed that raw NAND
controllers may DMA the buffers handed by the NAND core without
declaring NAND_USES_DMA, so nand_base never bounces non-linear-map
buffers for them (see the use_bounce_buf logic in
nand_do_read_ops()/nand_do_write_ops()).

Non-linear-map buffers are not hypothetical: mtdblock's write cache
is vmalloc'ed and UBIFS passes vmalloc'ed LPT buffers to
mtd_write().

The first revision of this series covered three controllers; the
v2 changes (following the AI review [2]) are:

- Drop the fsmc patch: nothing has set host->mode since
  a1b1e1d5bdfe ("mtd: nand: fsmc: finally remove
  fsmc_nand_platform_data"), so the DMA paths are dead code and
  fsmc_exec_op() always takes the PIO branch; declaring
  NAND_USES_DMA would only add an unnecessary bounce.
- Fix the Fixes: tags: the exposure goes back to each driver's
  introduction, not to the 2022 mtdchar kvmalloc conversion.
- Add a fix for the ebu_dma_start() unmap problems found by the
  same review.

[1] https://lore.kernel.org/linux-mtd/20261119090055.1255028-1-ping.li@horizon.auto/
[2] https://lore.kernel.org/all/sashiko-outbox-228750@kernel.org/

Ping Li (3):
  mtd: rawnand: intel: declare NAND_USES_DMA
  mtd: rawnand: intel: unmap the DMA buffer in ebu_dma_start()
  mtd: rawnand: r852: bounce non-linear-map buffers

 drivers/mtd/nand/raw/intel-nand-controller.c | 8 ++++----
 drivers/mtd/nand/raw/r852.c                  | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1

