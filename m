Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339559;
	b=nEBTGrYleSNxDHGSft5pSyMJ0KRp3Fzt6t1zDhzXpyovYbExDbJepdajnLUyIvJdbR9c
	 Ap+RzgW5HYogAtxphLLLSeSKfRm3nvOthPL7tSKE6FclQfZXayL/ltlkURfBy0px/UIcO
	 Ej4sP4MwW4PxTAAd+HBD+Dge83rrEYw+3GXtMzhK/H5GEwil3noDGtOeB7PAYmxLX6L+t
	 eEzVS+K72g3xggSFoQZ52wV01FgduNIteco5zkOYX8mVqs7sPZCKcXP3YWLGcF5vKRbZX
	 ha4Iw+iEN7WyNAQCZUi6/uw69bWM6UBU5W+27Cw9JZQEzB0cld+RKtnn6LWcQvCwVlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nG3yzDOrObg/oDwHdoEhmw7sw76zpjbwPxW4S93B/2w=;
	b=IPhFLA4VZk6pDPlP6TMUVGcQvth9afC/n4h5bvsVfGS7Spr7gJlVi7YmIQoSQbREIlkQ
	 QJRYR0Nm0w/JRDr418GwgY29nn8Bqe3Lvl7K40LQAWMCmNp2ClQNgMXBZL1WLTiYaG9Rz
	 y8JcOCSg7dlEegwISe7L3nZmuWlvLXtSYTuu71V9Q1boE3Od3Ikwbds6ZFwpGsWFC9r76
	 6BWNSHlsyc5w4orB6CkBA+2ySP+HgHu40z1L6oSuBStYkKLrsCiV+PTjE4QCxQgbaBJvA
	 286jjK9duxa5rHplA/v5tAtXLaygqnZogqZL/zSbS/ShQtbUz403qynfVVgJ+UJGfvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6B2U0pZ;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A0C606A33B
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A0C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6B2U0pZ
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4a76f63b243so2650536fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339558; x=1795944358; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nG3yzDOrObg/oDwHdoEhmw7sw76zpjbwPxW4S93B/2w=;
        b=P6B2U0pZnvaBpj7XDjR+kO8khb7+ylTdd7kpNjRjJevrIPRj/lFk+8PWwta4Ug1IMK
         nCzymaXVEHBN1MJ9Te1gbiuvg6v1XxS8R4HaKBoHns8H/nopAwvHWsSXua362qiTpgHx
         MDezoOmEE3sXmn/xctZu1SK3w0V5oO/+YDjDNAjQrpzOE6aSkADSE8PmvyK4eNpu7wT2
         O4knZ9obH5eoVKgxvSHjYSlA7DXvyLkDbxqx7RrEzECbZzNv6uX0WMvz1Jowo6IZrKyN
         FB0FxsiOSEZ3FScD1RdHWmezfkNKdhJa8CCStN5Emcg78QBwDeBl2SPlbfLcXIzFDY15
         kAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339558; x=1795944358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nG3yzDOrObg/oDwHdoEhmw7sw76zpjbwPxW4S93B/2w=;
        b=s/fdpptOwC7QDtXBTCN47CABbRZHutEr0l17Qoo17Avx9WWcpNTyTiish127sQkKfT
         QXsWN0U10JLfWpZQBbGIFSszmzdRyJ8OjpFVWIElm1obFvdFnPoFHEQMbQlc5e9kb9v2
         ZESNKrgOXoYREqRWWOg6YeJ5EBmBv3UTwf2A0UK1FJjZY8EzMTcnnsBBYj+0VELfuvZ0
         BqVGNUF/MnJlwoDXJyn4FZRWpMuieKyp/jUsISynNOb+ccWO04B3RyQl8ZpEpA953GKc
         fyw9/Pit7wLy2uv9PDOp/e47/W9+wvkcoJcmcRXo5xFSoxUkCSywCjFwJRYS+mLR+uEB
         vieQ==
X-Forwarded-Encrypted: i=1; AL+hErFylMahFAS4whC0RmDkoV88irlhxcWuBUbpsc+5ZckrgVk6sGXWkWj5ZVBkp4dSRH5NiQgQANKcC6QGjUM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6dvuBrNWs6nn7cBs7Gaz7DraEu4oejMGIqUWGfrdWE2ceyI5J
	bZg+iT0OY/R3Ihn2myYdoyl7QvGfjMXWBqixImC2UkvSQfvB9+wo3OYI
X-Gm-Gg: AZFdTZem32Gvj/mIDSGTLgHDpBYmZLruPinVpbl3f9eIpMdXFXCps0ze+xSE/AN1ZiP
	C2tcSSNgX5hOu5y3Y6QaydREwuFNz7kOO5OgPS2T6WZ66QlOwJo8CfRuNcOYRj46FV4XcbVbqYg
	KPAswRqvy953vdqR0W7dO+CqwjCahKG+QEKViOpMvrrGuHZD58iSHputaHcbRl3/77nkPbvJlva
	tu1b4+0SsXiybtv5/4H5caGi7jme2Knv/o3DH2hyb96Btf60vo5gspnzpHs+qsKR1dtShywn9Zc
	YxHkZMXVgNxUSd0w5WpQ9/CUy8UeJqzBScELtHxY0x9+yOkwNezwZ1zfq0ofI9W/zlgRF7qn5Hn
	xSwTkRmLkYrl3ogGxkr+fpoyMTLJX8YiRN42KAGb3fu+RATvuwHF2nw2TF6ZXQA50j+olg2DrMI
	Ky3BPsGscg10RpDd2ObiBX2naNtj1cnAaCUkHu2csZH60avlLTdgLt5r3ca77TBoB7FRc3wvPiN
	s4ImTG0at+x/tf7usOigoUwYw8IShbNomi5bKSQcy5r7Y6ooLFyyoVUQepxhYDg2uaFuDBH284L
	FhCv8rFdX2D0q1cBfXKCYWQQZ1lZM2wxO+u7C2e5gIyzjBq5XOvmR2y1xa+UMT0Vu00fQainpgc
	qAuVGnsXgOUHf7HhQ5rKqh/4M6Ni3laxPOz65uQsNwBs/q6M2zFKVi8HC//pXCmMQTk/zRM3Amu
	Y1cV3UhOj9Pr6ScZbOEzkx5E3WMx0fHkQNHSmNjJukd3yyML6NMx/V
X-Received: by 2002:a05:6870:31ab:b0:4ad:60e2:474b with SMTP id 586e51a60fabf-4bc77f2d42amr5237085fac.0.1795339558408;
        Sun, 22 Nov 2026 01:25:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5ebdc0acsm8698476fac.3.2026.11.22.01.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:25:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2026 02:25:21 -0700
Subject: [PATCH v2 2/2] mtd: rawnand: serialize bad-block marker writes
 during BBT recovery
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-submit-rawnand-operation-locking-v1-v2-2-030bc867f0c7@gmail.com>
References: <20261122-submit-rawnand-operation-locking-v1-v2-0-030bc867f0c7@gmail.com>
In-Reply-To: <20261122-submit-rawnand-operation-locking-v1-v2-0-030bc867f0c7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Kyle Roeschley <kyle.roeschley@ni.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev

When erasing or writing a flash-based BBT fails, write_bbt() marks the
failed block bad before trying another reserved block. The erase and
write helpers release the NAND locks before returning, but
mark_bbt_block_bad() calls nand_markbad_bbm() without acquiring them.

A BBT update triggered by a bad-block marking request can therefore
issue the recovery marker commands concurrently with other NAND I/O or
while the chip is suspended. The chip selection and shared page/OOB
buffers are not protected on this path.

Take the chip and controller locks around the recovery marker write,
as nand_block_markbad_lowlevel() already does for normal marker writes.

Fixes: 10ffd570f117 ("mtd: nand_bbt: scan for next free bbt block if writing bbt fails")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nand_bbt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index a18e10284b9f..a56597dfcea0 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -721,10 +721,12 @@ static void mark_bbt_block_bad(struct nand_chip *this,
 	loff_t to;
 	int res;
 
+	nand_get_device(this);
 	bbt_mark_entry(this, block, BBT_BLOCK_WORN);
 
 	to = (loff_t)block << this->bbt_erase_shift;
 	res = nand_markbad_bbm(this, to);
+	nand_release_device(this);
 	if (res)
 		pr_warn("error %d while marking block %d bad\n",
 			res, block);

-- 
2.53.0

