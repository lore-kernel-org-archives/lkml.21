Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717793;
	b=AhSFx0yB0G+TfEaQn8I/YdAx1k5Spc5CpSkKl1RD1Z/MEa5nsgD+a+1ZNDdy15TK1pN/
	 xxFUykmIyaTAR5lVL/39Zhi+F36/F2p8mttOiJ4MmyCDonLgv1ZC9sGWEZi/M+dcLKTMy
	 tRtNLHwKkl2Q8yY6IISQNNb1ny9igvb3oJpUtBaFU01z9C2/bM8k7Zcd8N3RUricrNqqh
	 SCqMRbZ98U2xa6cXUpoeKQ29vlbVY6y9xT1rGB8z7rDYzEDz220R36mGNiQpVJtiHbezn
	 79ovXldRrNCKuBMhQH/0opbS5zNT2EhL3scKyg/oayPxNeeRIYQmnylckX0CJaUTM9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZrWA6yqDQTNdq5FypmDdUcpaE1Yb8zNzb3Pr1N6ZV4Y=;
	b=iV7wtkzdGuGf59sJoSBlAU/J0MvYkrlLQJfKViMfYCNhUZBAlOwwizMpowvbcElX9/2L
	 N4UsPg7EhRoUb1GGsFQvUq1eBbtGZBgq+BI5/9Cp+pNBUtDWl5LI20R2MnJlP8Pc3Dx3w
	 Q2zbMjYTirPXA4t75FJMW44AvBfMfYz8e7qwPndY/225uJay4THQin5gVgl0I90utC2bc
	 L7v7jHDwV6G6SLFwnJRkle9W2e5F5LJ4++TzWHjZL1FnKJ+sAV5pQ1KL5amnZsxrvjPXU
	 xJqzydh4C/An0aQqD4WfUCgMpFf6zgwjlRrG8QCk+ErFMgRAd3W7xy9XjEFe5dMgJhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ontfBnBy;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE924606A331
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE924606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ontfBnBy
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso2736494f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717791; x=1796322591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrWA6yqDQTNdq5FypmDdUcpaE1Yb8zNzb3Pr1N6ZV4Y=;
        b=ontfBnByAk+/8ZaLPg9wpwjN+svornqICYdmQwbzNXfB/67uOXP4T+G0busp9AxQKh
         Ly3ntxMcigodkigSm554iOyqYw03mYu+rcSHoIMrTcttvipOMJiYQy2o1Km0o0jsch66
         Vu9wqS/YcAe39kHaqfBTiJs1DZSQGlA+qTo00Ct4N6jAGTaWmE5wVw77T7ZFThx5iLWW
         6Ia46RxXMRWpnFnqxzOu6C8X0xekSCEPzkxupl8IlJVfu4kc2Db2TNLTW/NyfppjsxO9
         FSFzjy93TsrV/D641bG6cqUiof9HVRrzSbDSBlW/Y2uZ5gG3aNFw+gPQvPlXyL/RJ7dl
         Bhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717791; x=1796322591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrWA6yqDQTNdq5FypmDdUcpaE1Yb8zNzb3Pr1N6ZV4Y=;
        b=WuV2l41ttHzZ8xb5DG6PkC5lznoE5J+BYbeSeSwcwIDWAllGzp5K/o/nEKZc04Xa1P
         5msCbtuSeZ8VcwoHcM8Oo9ZztaqW99KpfudItV5JJDQnUhCqrGoO7DxSR61e1RUgGVqm
         bbrVTQ4fKjl6EKVcGXtr4ByAsi+YPYHOyUGSlayYezMETdUdaIOnteuzdKHIBLJ9yFye
         epZk6mSnsDW7FMIIWutFGKYoodr293T8G/XpYoaE2xH+sakKzCPqFVxIxDt//YTGGIKM
         aV8WvfoGbx/UX2KONYFxm0MCDVFy7KM+/JHc/x+umY7WZ2Dv/q7emYS/Bg25yGX8iyyG
         Wrng==
X-Forwarded-Encrypted: i=1; AL+hErE2915bIAuHKFcJuVNTGGJmn8KZZi6h51KKQiDI+Zsij7EEdKrT3K+92adD0NgDCR8yk6W9hIlUa9ggtV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5yOIDNor9SCcbMuH1aKn6hotzVd9FJCez23ek9Tw8wvyTcF3i
	5ajZSM13jbRvQXVxivUUAz/YFA7tMQxxIQ6OTxz6GWqdqtxY9H1qUvqq
X-Gm-Gg: AZFdTZdFdt+w7zGEuykFcjZGvdSML9O5+2c0WuZDyLffxYFgDAY9A5+umPV0ikfzC15
	wXj83C3GcFBkEseKtOQGc3dY59m8JqZ3Ygn4dK9Z5onDDf+OLEXSRHgOxBXJQHSt2IOnMMn9jCQ
	PNRPRskKcAQti2MUlT+sJC/78S7zoQXH4O2sv+CKklARztB9KE3MRWcsj1X7E856kLJN/8l8gxs
	phkJY1l7jqie0sJMRUvrJJKUkQRsS+5sGgw9XrMpt71cXfHuzGvOgz7zy4EBMthkWTivkpSVnFF
	FWiOob+aPOoLbRJ4kJ0Bi6GRq5qFb7KaMxqMmfo1Asi+YGPFK5p+F/OJykdbG8P5DPtyUSH+rzU
	9fUMv3GB8O2DS+S1NuvZgfaIKXl+1C5LHgOckTnvcqrH/FBIbPHqELshzXEQQ1yFcFavRZTpo8s
	y7wWjvwpxkC7HuoQYM/7FItMDmZ2rCIZ66keswGXxpwox5gV1Zt6cP0qgxa+9DKhCf8Rho/rK9f
	scfQ5d4Yd4PfayBMtGEEAESfkn+366KCzFjsKMTm/KfRMxB4sQOp88mAL6r4YGUtMflYoI2sol4
	kSBMOSX60rqcluFfe87WQ+ItUeA7lmW5+MKHILHt7jMzZcjhoKZXSWRcsWDTY3HzyuhZDkGUXqT
	VERlee/fKwSPvnPTze5uGaAbrydkZC9nblnReIb5wb7RDRWdjWgZtRZbCUlc8TVQRZqfisaI9GR
	W80B0xAeVimVyd7CeXy8Gva1BMyK6KrFcsDLA7LjViThuO2T+R4s9ESQ/BOmBvmmoazm5ZGh4fS
	4bz/WS+pd98mGMR4iVZtsbXmWeiSVsKvIjlpWdISQ==
X-Received: by 2002:a7b:c4d2:0:b0:4a1:d291:d863 with SMTP id 5b1f17b1804b1-4bb861394f1mr376407895e9.4.1795717791236;
        Thu, 26 Nov 2026 10:29:51 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42382159f8f.41.2026.11.26.10.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:29:50 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 2/3] mmc: sunxi: Build IDMA descriptors from mapped SG list
Date: Thu, 26 Nov 2026 19:29:43 +0100
Message-ID: <20261126182944.3136900-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
References: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
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

dma_map_sg() may merge scatterlist entries and returns the number of
resulting DMA segments. The DMA API requires using only that many
segments, with sg_dma_address() and sg_dma_len() (see
Documentation/core-api/dma-api.rst).

The driver instead builds one descriptor per original entry and uses
its CPU side length. Build the descriptors from the mapped segments
instead, and split segments longer than one descriptor can handle.
This can't overflow the descriptor table, as each original entry fits
into a single descriptor.

Also check the alignment of the mapped segments, and unmap the
scatterlist when it is misaligned instead of leaking the mapping.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 91 +++++++++++++++++++++---------------
 1 file changed, 54 insertions(+), 37 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index c53d47576864..b862df26e192 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -356,36 +356,49 @@ static int sunxi_mmc_init_host(struct sunxi_mmc_host *host)
 }
 
 static void sunxi_mmc_init_idma_des(struct sunxi_mmc_host *host,
-				    struct mmc_data *data)
+				     struct mmc_data *data, int nents)
 {
 	struct sunxi_idma_des *pdes = (struct sunxi_idma_des *)host->sg_cpu;
 	dma_addr_t next_desc = host->sg_dma;
-	int i, max_len = (1 << host->cfg->idma_des_size_bits);
-
-	for (i = 0; i < data->sg_len; i++) {
-		pdes[i].config = cpu_to_le32(SDXC_IDMAC_DES0_CH |
-					     SDXC_IDMAC_DES0_OWN |
-					     SDXC_IDMAC_DES0_DIC);
-
-		if (data->sg[i].length == max_len)
-			pdes[i].buf_size = 0; /* 0 == max_len */
-		else
-			pdes[i].buf_size = cpu_to_le32(data->sg[i].length);
-
-		next_desc += sizeof(struct sunxi_idma_des);
-		pdes[i].buf_addr_ptr1 =
-			cpu_to_le32(sg_dma_address(&data->sg[i]) >>
-				    host->cfg->idma_des_shift);
-		pdes[i].buf_addr_ptr2 =
-			cpu_to_le32(next_desc >>
-				    host->cfg->idma_des_shift);
+	unsigned int max_len = 1 << host->cfg->idma_des_size_bits;
+	unsigned int i, d = 0;
+	struct scatterlist *sg;
+
+	/* dma_map_sg() may merge entries beyond the descriptor size. */
+	for_each_sg(data->sg, sg, nents, i) {
+		dma_addr_t addr = sg_dma_address(sg);
+		unsigned int len = sg_dma_len(sg);
+
+		while (len) {
+			unsigned int chunk = min(len, max_len);
+
+			pdes[d].config = cpu_to_le32(SDXC_IDMAC_DES0_CH |
+						     SDXC_IDMAC_DES0_OWN |
+						     SDXC_IDMAC_DES0_DIC);
+
+			if (chunk == max_len)
+				pdes[d].buf_size = 0; /* 0 == max_len */
+			else
+				pdes[d].buf_size = cpu_to_le32(chunk);
+
+			next_desc += sizeof(struct sunxi_idma_des);
+			pdes[d].buf_addr_ptr1 =
+				cpu_to_le32(addr >> host->cfg->idma_des_shift);
+			pdes[d].buf_addr_ptr2 =
+				cpu_to_le32(next_desc >>
+					    host->cfg->idma_des_shift);
+
+			addr += chunk;
+			len -= chunk;
+			d++;
+		}
 	}
 
 	pdes[0].config |= cpu_to_le32(SDXC_IDMAC_DES0_FD);
-	pdes[i - 1].config |= cpu_to_le32(SDXC_IDMAC_DES0_LD |
+	pdes[d - 1].config |= cpu_to_le32(SDXC_IDMAC_DES0_LD |
 					  SDXC_IDMAC_DES0_ER);
-	pdes[i - 1].config &= cpu_to_le32(~SDXC_IDMAC_DES0_DIC);
-	pdes[i - 1].buf_addr_ptr2 = 0;
+	pdes[d - 1].config &= cpu_to_le32(~SDXC_IDMAC_DES0_DIC);
+	pdes[d - 1].buf_addr_ptr2 = 0;
 
 	/*
 	 * Avoid the io-store starting the idmac hitting io-mem before the
@@ -397,7 +410,7 @@ static void sunxi_mmc_init_idma_des(struct sunxi_mmc_host *host,
 static int sunxi_mmc_map_dma(struct sunxi_mmc_host *host,
 			     struct mmc_data *data)
 {
-	u32 i, dma_len;
+	int i, dma_len;
 	struct scatterlist *sg;
 
 	dma_len = dma_map_sg(mmc_dev(host->mmc), data->sg, data->sg_len,
@@ -407,24 +420,28 @@ static int sunxi_mmc_map_dma(struct sunxi_mmc_host *host,
 		return -ENOMEM;
 	}
 
-	for_each_sg(data->sg, sg, data->sg_len, i) {
-		if (sg->offset & 3 || sg->length & 3) {
+	for_each_sg(data->sg, sg, dma_len, i) {
+		dma_addr_t addr = sg_dma_address(sg);
+
+		if (addr & 3 || sg_dma_len(sg) & 3) {
 			dev_err(mmc_dev(host->mmc),
-				"unaligned scatterlist: os %x length %d\n",
-				sg->offset, sg->length);
+				"unaligned DMA segment: address %pad length %u\n",
+				&addr, sg_dma_len(sg));
+			dma_unmap_sg(mmc_dev(host->mmc), data->sg,
+				     data->sg_len, mmc_get_dma_dir(data));
 			return -EINVAL;
 		}
 	}
 
-	return 0;
+	return dma_len;
 }
 
 static void sunxi_mmc_start_dma(struct sunxi_mmc_host *host,
-				struct mmc_data *data)
+				struct mmc_data *data, int nents)
 {
 	u32 rval;
 
-	sunxi_mmc_init_idma_des(host, data);
+	sunxi_mmc_init_idma_des(host, data, nents);
 
 	rval = mmc_readl(host, REG_GCTRL);
 	rval |= SDXC_DMA_ENABLE_BIT;
@@ -1016,7 +1033,7 @@ static void sunxi_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	u32 imask = SDXC_INTERRUPT_ERROR_BIT;
 	u32 cmd_val = SDXC_START | (cmd->opcode & 0x3f);
 	bool wait_dma = host->wait_dma;
-	int ret;
+	int nents = 0;
 
 	/* Check for set_ios errors (should never happen) */
 	if (host->ferror) {
@@ -1026,11 +1043,11 @@ static void sunxi_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	}
 
 	if (data) {
-		ret = sunxi_mmc_map_dma(host, data);
-		if (ret < 0) {
+		nents = sunxi_mmc_map_dma(host, data);
+		if (nents < 0) {
 			dev_err(mmc_dev(mmc), "map DMA failed\n");
-			cmd->error = ret;
-			data->error = ret;
+			cmd->error = nents;
+			data->error = nents;
 			mmc_request_done(mmc, mrq);
 			return;
 		}
@@ -1091,7 +1108,7 @@ static void sunxi_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	if (data) {
 		mmc_writel(host, REG_BLKSZ, data->blksz);
 		mmc_writel(host, REG_BCNTR, data->blksz * data->blocks);
-		sunxi_mmc_start_dma(host, data);
+		sunxi_mmc_start_dma(host, data, nents);
 	}
 
 	host->mrq = mrq;
-- 
2.43.0

