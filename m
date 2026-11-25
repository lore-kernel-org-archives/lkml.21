Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607482;
	b=I3U0/zZhBrldVrbMqALd2DQEozFJT6nQ5Sh1THxkoS115gGmaE+9MjPv7mKTT/o40COO
	 Y8p7TsrnlVspD6zKfp49G4NdDqIGqjbp0sKN/KOhlus8pc9HnJY+MaKdVD5GImS2yaFgs
	 NyISZALmEGh87REaQ4qYo2DlC3IcHkmLiw/SO4wx7nqt7Xm7qvhJvXsLjfnipZd/x/xnu
	 2fInl9luriY964fI43Z9TnOZzKyp5xniv9BW+nwWgp4vyeeSJumW/RyFvFgYqRhM8nqSe
	 4TTPluHFE4wfKhUhuk6l+Q/5mnBi713Zhn1N98G0BgRb4U41ZNu0vZU6smdqy21JbyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RkancunSX1kzbBE3OARY16RCkvG9MfPLza4pw9wRR9A=;
	b=WFkn1DoRIC7strkBX6j0JaeySaiZv0XuljOIOLbwXEqh4pdrBf57pQlwz+uRMTi65dO6
	 LEKPytcGXHupVnNmg5hzuR/dZR1xDKb2rqwTukwGRaFKWBhCsU/bXGKvgskiVzSkoGJbX
	 gU+NQWbWXCegRaxkz/od112foRbvo5vH6bmkFe85F0E0Ki+6O6f+0Pvfl0SbZPt9IAhhx
	 CEM83cJDbUdfjwQU3x8U62CGRCZD9vEYqRf8eLpMXhPjI1FYxyG7qWNJ2hSZ52dnmF7uT
	 J9tHxMITIAuC6vWzY9PZNjTfWUOXSZCixgk6kJ6EJ4ORbsoDQgGb3WR6lqQAMCH5i4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MkUk41h;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE97606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE97606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MkUk41h
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so2612500a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607481; x=1796212281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RkancunSX1kzbBE3OARY16RCkvG9MfPLza4pw9wRR9A=;
        b=0MkUk41hFDV51LDY+sTYDDivcAgvstp05PtjWwqhg7MO2Jy4HD9aeZwGMDYQWU8NQN
         w0XuqdIUJ+gOX7c1z8wUd/iApgeDp/CT/7aXE7a4QwCa1bbabNGs1YHIPlu/hX4HhTg4
         oSpmnUY0rZjOFUUVFf2/L4ZKbaWQjrtZkiv4OhwU2sty7B0OKNpz6u070oCOGsg5sBG0
         Yew0Aeju7E2X2GHx0yRFtPQtcZS60DnKJTRA5DRn5W72AFcYAz98YCCHYuZTYqwfmpCI
         iSWb+4UkTHGpqZIK5262ErC0A2c2m2hhCV0EoTQ39h98lFVIumrtwQqHT9EmvLxCC/ry
         qgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607481; x=1796212281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RkancunSX1kzbBE3OARY16RCkvG9MfPLza4pw9wRR9A=;
        b=MKRfJlUnBBizx1F8nGZGZZqYKgftBv/1DT/RnsP2XLG6El03Ku7gbW3SFGSnQ1Q89V
         A0m/48qCt/SKVkGba8nEUN0eLGHqmO6t3l0p5BVAMcP80L809Hka39zMpO2IxcyO5jIN
         jLfVFizcsNT3uQAIMWP3M6MVx8T5DhdrahakbF0HsK9E8kgLzkHoaPNBB0hFgpSOkDm8
         eeMJ9C3OpF87sFZJPJnoHPpgNKujt6B/nZKEH2bcVTj/Fi/mzzU8V4wdeX32sffIrExQ
         SDJGSCAhDagjitvoApseaQdeKvBa0QAeuU/ARvf9ZTJRxtTQvK4jBzN/oXdP9FYESCE7
         l86Q==
X-Forwarded-Encrypted: i=1; AL+hErHxRlM8DaoIxhrl5VOP4VRNMiweIO6rr1AxW/1doaFkdb8ULD7iEn+L1ficXYz9IXotUZVwaK9EoOzSC7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rpEjSQBhiRsMdl8VS6CZv5DcHsTBluxVnrgtx8n/Z1zWj9svi
	SAcqxI2Af7APvHShiGEVTaEp+MLh2BYALo3FBRk8toQ8i4krzeS3QRmWLpR+v2IS
X-Gm-Gg: AZFdTZcFGPfhhdtgmUsUtzAUbKmzRZL8tZt0XVXNvdBB5wwHdlGdzFYLtwR9us03dGs
	vIGKCX2f2+tPnGNxKtk4yjWQoHJIWWhLfEsEX3WkH03/44W5yJY2xZsRJwnnzNoKK1oeGLLFre6
	w1wac67V3B7jrOzLCIko89k+ZczkmJBdWXnOAoJwkFTwmgGliWB0QBqXZS74+GZnPST/raMwYJT
	CCzBm9U0xLCW/+T4q2joRDnBrZszo2ChA7JvB9ESQo/D/W37wx+7wKEx3ZrW8Bax4cQGsph4zWk
	+dE3QezF85g9wTk14c/kiLEk/C8s3QiUhQd2i91lzsKgu+vDxL+BuBqeLmMsfMZKxuRGwKf+24m
	66+YKm/XOhRpOIvMVzl9BUVCF7jxe/wNnOibriZBe7l4AtK8UD74qKRJNSF9mqxM9r+cTKnn1My
	ZTFJdpKBC6ygyhPn4EfOXK1g2NJQcuNGHXXWneSaWKnawE2/s57pRzz5k7nsNPik5xoCOmAgWh/
	dlrH0m0hL14RHh+3kdCveGv/Y4ImCWli7fYplFqBSOgc3HkjuleCgZw485ecMZ9DU5uGK3AWj3d
	sQE2CxR/S7+r2ksZ7bMpGDPyUJvXYGKi0A==
X-Received: by 2002:a17:90b:554e:b0:3ad:6090:a189 with SMTP id 98e67ed59e1d1-3b41c95be86mr16142813a91.45.1795607480949;
        Wed, 25 Nov 2026 03:51:20 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm30569662a91.15.2026.11.25.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:51:20 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
Date: Wed, 25 Nov 2026 19:51:08 +0800
Message-Id: <20261125115108.4147741-4-leeonion.muyu@gmail.com>
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

r852_do_dma() feeds the buffers provided by the NAND core straight
to dma_map_single(), which is only valid for linear-map addresses,
but the driver never declares NAND_USES_DMA.  Because of this,
nand_base cannot know the controller DMAs these buffers and never
bounces non-linear-map ones.  Such buffers are not hypothetical:
mtdblock's write cache is vmalloc'ed and UBIFS passes vmalloc'ed
LPT buffers.

Declare NAND_USES_DMA so that nand_base bounces non-linear-map
buffers through chip->data_buf, and advertise the hardware's
512-byte alignment requirement through chip->buf_align so that
misaligned linear buffers are bounced as well, like the other
DMA-capable controllers do.

Fixes: 67e054e919248 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..a68f58c81d6c 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -640,6 +640,9 @@ static int r852_register_nand_device(struct r852_device *dev)
 	if (dev->readonly)
 		dev->chip->options |= NAND_ROM;
 
+	dev->chip->options |= NAND_USES_DMA;
+	dev->chip->buf_align = R852_DMA_LEN;
+
 	r852_engine_enable(dev);
 
 	if (sm_register_device(mtd, dev->sm))
-- 
2.34.1

