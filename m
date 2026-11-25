Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607474;
	b=SRN1nOeE8kY9KqwJ3+iQiCQ4zs/XNCjfKnr4mIyv5IezwOCRIziNhJIYrRAoGIjtNtoe
	 +tI+4NsJy3TiYDSnDZNB6zWX0IuQ+7gL7IrKZFc+kpT91r2e4Ss9YcpsFxXuCXdA1QuYj
	 zmp+3dcx4S86M7DmUaF3vmLXs20SV53P+HuykpOHXwgPUaENYhdaC28qYY02o6R9xj+81
	 vPHmQqPwU3J0Vj0AIFkwYjjlbsGw3Yg2W9OotER6R6sqYzbr/OYkslZzkLTyVSpDeT3k2
	 eZp6QtOyC4AeXsvCgWBH6Zm5VsbgzVXw4O8uw0eHP+nc1LkUlmSXLwpA3OweDMhaBIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/sH6WVZwCKWinPGsMJopSD99+J9jVwHYkDOAjL9AsNM=;
	b=mONv3WP5hVS+nECM5sFx6OMKTt/e1Me6vHMCKnPpJ8KT3UyIiLUjsTaVa8Xf0ZjGjqZH
	 2dzyMyJB/1c7RuAR3ySFp8Fs8g/0hTOj/JUg/N37YomYZO89oGaetETh9GXOJ7ocCuRCx
	 LY8pLlS2MsTann6VCucViuD/mSGOGoQjVkSEz9mqICOBs6d8YsB6vpi34exjdrTAP5KrN
	 HM0j5wAlno/MsUBx/CbUIs6lI82PZ0SdxqwHxGf26mjT0AreyQbjF4bUr+RdgsgzfhgLs
	 FejjeWCQiTLmJLFReFtZnWIf7ieovekm5vooF1wtsJOSkRgYdxCKG3+Ott5HPs9LGUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZuD9R1V;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3775606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3775606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZuD9R1V
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso2700586a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607473; x=1796212273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/sH6WVZwCKWinPGsMJopSD99+J9jVwHYkDOAjL9AsNM=;
        b=NZuD9R1VTGLwgtTxB4AzrrwwsBvDFNbn3qUuIoorxEbpcZ6LOVpFRhMfIRoSWwejJn
         5LPkuA6Pskrhojhg+RLnfaJBRsZYT7EmTsYjO0AmXhqtt90edFTSmcJ7dXmFptJgIbFY
         RAhJ+jN7z09Hsdt/Bg6CB3amnQqBw7THRvEI3Sq+fWV1SW7ZDwQym30Z7dp3oNYHbIXM
         qSmcQosSEQ8OEIJ+XCHcAL4Qk+4EA815vS/6xiaCcNz2dHZ2HTRPb2+RN7pMFDz/Cde1
         5n4l1iyMPCZlP7UcP/Oltn8+9csWvJMkPSYLwbwZuN6CpNH0yMQMyQFQriBf188dULX/
         N6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607473; x=1796212273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/sH6WVZwCKWinPGsMJopSD99+J9jVwHYkDOAjL9AsNM=;
        b=J4I0hWKwL0em0kSyc8WjNFm188I1SeNVmsNj5okcHw3LPaDk6FT/dhgqXIqdSvxbe+
         a1kQ+DO/FHYxOaNRUCvo4OElrnU+rd6dCjTt1E3457yxEWglVbHc02M75ovOm0uM8pLL
         GZ6mvmSuyuRJ/izBaRvnoQb8fcOBrBYvwJFqeTyUZSSo6KfppxJXxrg+i7zrV9lCLh44
         mxLZIs3qepYDxpItXkKH+X24FVZ6UTKUVEGb6d1Pzbl3QJzOQH1/khfuXZk8w1P1/GoX
         ltrb/ga5TbjL3gQ7yYS8S/8cJD+jrJSweAylVtk2PjcQQb/VCZnP4F9QuQNRKfvGSPTk
         vT1w==
X-Forwarded-Encrypted: i=1; AL+hErHUcraRbsuMl3IC/tf3jRrF03LvaMaXS6FyQoRLp4kp3fIj608N1RDrKo/kkd/dMSQv0cEP2XZ2CplLIWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+zaFca8FHcrQPXYcQ3Bj/qSvsNJypq9bo4eld4S2sMvW0+3zP
	piivAl9MJvgQZ0GL8CXZiIYr2bzYId63Mg8sch6RfKSIvsGy2tyZ/BlP
X-Gm-Gg: AZFdTZdUfTHoU5aMMQbUAyDPamz9UrUUYWMcCN08kXBfZs89oh7cQ1pCq/kRngz0fpE
	YPKPPCY7Ij7dQpqwjhSxKW8gXFW6Q11wqr5lK1iQgiSVZsxDVS6lmA7UYv+cmPBzODE/j5Srue0
	2Z9orQI2QXFyw9UkAhmlqGZNIGudMFLwcoJfZv700j2iggaM0R5mtBKd58qmT2JKI2Q021CDJZA
	M2PdzVUQzZl42J6S7tDKLBuwpDyCVJ+WxdNm35rgWfprSjDnahi1JNfK/pT6RkCJDQ2j/fkFBtT
	McgwG3pxu20Qsw4BNV/ZoFbjEyzkI0aV/qPekesfqYCvVmak1f7K5OEuRJJuErOBZFkRkbJRr9S
	EdBBsCWAbWMfGkmtOqD6IvFZ3hEk/JYbs5XN1TDq+RQOACtYsMc0G/DHuT1cIfpf5gNTbJxurGs
	eHlMWLcY5BJ6O6FAKI4VeLxDO4Pg3MJb6w/fUBj7qhdYwZ1LTVrSIbJd65YxNzx2PcPAe041IAm
	vBJT0zZtHZqK/CZOsREEiztxl8NNXsceDhvXUaAgXM9OtsBqn4I4lUdtgaKKh4u/LxPOhrC9Lgn
	oFRnsT1LIRmE9Q4mupth2kMCsMhbzUd+cEdFpJDSWEE6A4DC20eyGvU=
X-Received: by 2002:a17:90b:4ec5:b0:3ac:7e3a:1033 with SMTP id 98e67ed59e1d1-3b41c96182bmr16500507a91.59.1795607472751;
        Wed, 25 Nov 2026 03:51:12 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm30569662a91.15.2026.11.25.03.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:51:12 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v4 0/3] mtd: rawnand: protect DMA engines from vmalloc'd buffers
Date: Wed, 25 Nov 2026 19:51:05 +0800
Message-Id: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
References: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
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

Changes in v4 (following Miquel's review [2]):
- r852: advertise the 512-byte alignment requirement through
  chip->buf_align instead of keeping a local justification; drop
  the code comment.

Changes in v3 (following Miquel's review [3]):
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
[2] https://lore.kernel.org/all/87o6bdz1fm.fsf@bootlin.com/
[3] https://lore.kernel.org/all/875wxl1ea6.fsf@bootlin.com/

Ping Li (3):
  mtd: rawnand: intel: declare NAND_USES_DMA
  mtd: rawnand: intel: unmap the DMA buffer in ebu_dma_start()
  mtd: rawnand: r852: declare NAND_USES_DMA

 drivers/mtd/nand/raw/intel-nand-controller.c | 8 +++++---
 drivers/mtd/nand/raw/r852.c                  | 3 +++
 2 files changed, 8 insertions(+), 3 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1

