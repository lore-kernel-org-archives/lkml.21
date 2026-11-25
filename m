Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609302;
	b=R7LYJCylrh5CNV9FYkelzkHjHrbN0qzUw6ZSdmYXX5etR+d4jUDxgShTuUmf88EyXztd
	 ZRdCZPF0rO7LE+oPVgdZ38de4DO4OjID1mw83Xap9QMAZHwiT/TqmRm54CKwgkSaiRIvq
	 fCudcLFPPZODywsHdUcn/wqasIIvnAQhqtek/yXDYTwpZHe/EV6O84XyC2ozc+iND+v/v
	 RJwAVJGsM7HCcWfjE4n23XZ4uSnIG5PN/jAdJU7YbtUbRot4mb61q4G1n859AWEDXaHgs
	 xNf363I47qLPelM7ukM2hLu7rvakdQTDXMMvSVGKG2gaGd6Fj4iyow6DPSJfII8i2yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sAM2PmX/DJ4eJQYYdKNpygFCiHeH25kCFURdOxc9Vgk=;
	b=HtEKQ6xpXLtWmHLJ38EwezhJjWMAChxme+wkST5Iwe1c7gKbbCuxdvt8poS6+SNzJwzH
	 esTsQElu9qM6H3OS2QSEYYiTbMnl4PIo0xKxiWRE6CPNP9uY6sBprLhB3FXzAv1LXJdex
	 os9CU7SVoKShrEyR8gLVZZBjG35jsqJ+5PS8Ba/RlOeSHaTqQP2jrIkmAIARFf+fLNfV0
	 Lkt2AK5Z3BoBfGXxxgvFw7krCJWz60u8h2reja1FoMA+oT5FVd8OmRL4ZydtQUg6/kRpl
	 PsuRIodlifbI1iyFmE+gv1u7dqRns+MxRkN5D1uDVLrrArfxyHy4QaMnQ+xTh8AyjBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WmaEWdKH;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD50606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CD50606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WmaEWdKH
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8c5ebbc5150so3927939b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609302; x=1796214102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sAM2PmX/DJ4eJQYYdKNpygFCiHeH25kCFURdOxc9Vgk=;
        b=WmaEWdKHlFY1Zq4YHfyuTbVw30a6SVngCS7z2maduTPqob/e+PFqmDZZpjqZnyKQfd
         gdvoQ57jBgqjMadR/daEI05+qtLJWuGcjZtRjZMNlkA3ptEiccrbd9b9ugXp6W4wpig7
         ORDq2fP0fP750QOyrP0SVLtTUiEjJ68NO5tuBDQdpAXLvpsDYyUtIgVgnEi0rII7KmAe
         m13Vys+fXXKWpK7gg/kMSBoVTRdsK1LpfWJ60dtc/LcWk/vfHDwKGiwHQtxQuA8xGeXY
         SB9OtERbMKCW9tAiQqH7ADcR+dYrZZEZIqCD0KsRpqrrti3vzAZztoD2dm5bs+ul1wKr
         XLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609302; x=1796214102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sAM2PmX/DJ4eJQYYdKNpygFCiHeH25kCFURdOxc9Vgk=;
        b=CPQEPKYDW/nPCqkSLd6Ubs6NvuQHr+T++5PlzBoZ56K15RkNRiDD/JGIfMrzVwKgfX
         YQmWT+mbWAaCNSeoW3StrFfMDX020vVvlDZinlEE0CjcDX7FBoTy2IJ/97l6VxBu3giE
         adHxNrsLio2A/pd3stAISCtjEktgQglmaubY3QTBZXOGiHrmi7XweddI10V/jg6oZGbJ
         45LqVVT5EfIgl3n7RTai4kYmrwCqRU5/vZcXzbvoRz/a9MxCRHUcKheRCQ7iFneJSjcK
         /ax+TTbuVl/NtjuiL9vCuoSFmcFl1BUhiqS1b/Pv3RKQsGrmvITpEGIUMExf91JJkCkH
         UyhQ==
X-Forwarded-Encrypted: i=1; AL+hErE0wBvaTccogf0441qROLcOT/ma/FhuQfBwGNmIadZkKzRnj8AA1QLpgJc5ypv1g/Brq3Dvs40OZKrfoX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QrWIYRFbTQPMqPSOWKgIDF3P8IBcazibOAPOMKMn725jGJeR7
	HkcHkd9Bn2xeXGKt7LCZ4rIqsJLLyNz7gwjaqz9Kxhm+W3tOVzhRLtdm
X-Gm-Gg: AZFdTZfvt8R0pKCnvX234vvKEip/5axErWuDVwOLuAvsvyjUjcn71hTrjolnt7d7B4y
	kMUnah/H4dn8kVXMZS3/0NyGDwBtPSnHdJKvgJoJtF9sdGIfb56f8yBdf5eSs3B5QbPPbP/0R4D
	t7AoaPrUmAgvy7eNQ3m/JaIjHeYxrPyi0BeSbhGqSh9t5XBuJAfK5KL5dMJeldr7DyOlwtnyINK
	emrL96sTwkWuDmFbhcpKKyO1gPOMQDY+2iTN6lue6srcKaz9as3ycjUdDjuD+qM1x00CttAi78L
	G3NiIIV/1f7+V9g0b4sg0uAliDm+ErFhDLxccVHJsJ2aPUp1LUWhqNDIhZmVF60sSRqE3qzkbaL
	6ZXv13QeX4dmGRQ82kn7GjLcd9N1qxe22QNMxGHSZktPtnbCkt5rVPIHoZCQ2uHWu+IOzdXXGmg
	QFYHGqyFkVg3OPh3EbuYPBvNFvhOqJZK63IYzXbQMf+kw8JoucE5dW2iF0C00UY2TX5IdCv8AwR
	vDoSkFiAy4LffQx/WJCIT3J8b4vcsQU6/i6ZzDhzSOAurq/SsW8riLWSy6e5La8KIQFR+Ur4pYF
	Esj+bpKmgHPFSHh5vRshJvm6+gIrTGcHvA==
X-Received: by 2002:a05:6a00:2389:b0:89d:7f51:6492 with SMTP id d2e1a72fcca58-8c87c38b44bmr17379665b3a.32.1795609301756;
        Wed, 25 Nov 2026 04:21:41 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm8688656b3a.13.2026.11.25.04.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:21:40 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v5 0/3] mtd: rawnand: protect DMA engines from vmalloc'd buffers
Date: Wed, 25 Nov 2026 20:21:32 +0800
Message-Id: <20261125122135.44696-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
References: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
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

intel and r852 have no protection at all; declaring NAND_USES_DMA
lets nand_base bounce through chip->data_buf as the other
DMA-capable controllers (arasan, denali, meson, mtk, nuvoton...)
already do.  r852 also advertises its 512-byte alignment
requirement through chip->buf_align, so misaligned linear buffers
are bounced by the core as well.

While at it, a leak in intel's ebu_dma_start() (mapping never
unmapped on success, wrong device used on the error path) found
during the audit is fixed as well.

Changes in v5 (following the AI review [2]):
- r852: gate NAND_USES_DMA and chip->buf_align on dev->dma_usable,
  as the PIO fallback path does not care about buffer addresses
  being linear-map or 512-byte aligned.

Changes in v4 (following Miquel's review [3]):
- r852: advertise the 512-byte alignment requirement through
  chip->buf_align instead of keeping a local justification; drop
  the code comment.

Changes in v3 (following Miquel's review [4]):
- r852: use the core bounce through NAND_USES_DMA instead of
  extending the local condition.
- Add Cc: stable to the three patches.

Changes in v2 (following the AI review of v1):
- Drop the fsmc patch: nothing has set host->mode since
  a1b1e1d5bdfe ("mtd: nand: fsmc: finally remove
  fsmc_nand_platform_data"), so the DMA paths are dead code and
  fsmc_exec_op() always takes the PIO branch.
- Fix the Fixes: tags.
- Add a fix for the ebu_dma_start() unmap problems.

[1] https://lore.kernel.org/linux-mtd/20261119090055.1255028-1-ping.li@horizon.auto/
[2] https://lore.kernel.org/all/sashiko-outbox-233336@kernel.org/
[3] https://lore.kernel.org/all/87o6bdz1fm.fsf@bootlin.com/
[4] https://lore.kernel.org/all/875wxl1ea6.fsf@bootlin.com/

Ping Li (3):
  mtd: rawnand: intel: declare NAND_USES_DMA
  mtd: rawnand: intel: unmap the DMA buffer in ebu_dma_start()
  mtd: rawnand: r852: declare NAND_USES_DMA

 drivers/mtd/nand/raw/intel-nand-controller.c | 8 +++++---
 drivers/mtd/nand/raw/r852.c                  | 5 +++++
 2 files changed, 10 insertions(+), 3 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1

