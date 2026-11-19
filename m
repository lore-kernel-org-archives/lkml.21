Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093974;
	b=TRHoZRJn7IKvwK0CwIoPgE8D4LunC7IPW0bmEtpi7d0njhk2P1t7ITTZftlGAY3bEsw5
	 fHQFg5LTaNfeFkezCv2Xx8/nq0cCjdWyqAmM/CPUG3LQlgEmLURcUpBAoS3FeNjGz+qfA
	 NG2fpawAy+E526CIDlMqcH1YdgiAMlR40qA5fzbzBGR7tM8J9zVh3YmB1vIpOoz1CrrbU
	 EwvSP6EHawvN9wb+TKSXOVFgSvg2q4aciyCloi3gjJ0eJTjdoLKi9uyo37/imyjJYqU/1
	 uUbSU+2imDSfF+gjtm244HMLfsmu+v8OU071aKBz2Qg43P/bC5IhMa3kyb3Sjg+PLOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=594xmkQi1EzZuFVwgIAsPQJhrxzAupoR0I5ZsOI+SEY=;
	b=QgxHgLKP/Vjx0/f5zVEHkC9oagOutO6EItgzP4ZOG2rCuwTW7Nr4tv7l5VDpMfUHXFhe
	 WWx18752BajWsJtA7Wah6ORWOIt2Qexbt0O+JTL3cCtEFixJRLkvx6+owINBtKzSKHGFx
	 K1SxM7+Vs3TYnzHzo8WLzpJYGWR50+QGjxjGd6y12mSk8mbQVaqW7UWfI2tUcaubKYDYs
	 NxBtx7nmTVrLYrIkP35MAIIWORMZYRev0uLhhu6AS1kdzd8V4bE80QxLAsQbgBq/qH3Av
	 eSIOvywb4cO6uCqlec9ZdauOGdl01CQWLRknqkPBHup2XtvxjHnWlFLnSDiulNc9MgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hq/fsKHg";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8A760A2612
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA8A760A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hq/fsKHg
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so22758805e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795093972; x=1795698772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=594xmkQi1EzZuFVwgIAsPQJhrxzAupoR0I5ZsOI+SEY=;
        b=hq/fsKHgUKVEgzfA3lbngaIiVkw5fuZENcLOZMopbth1nqI4pv0olS1rBZa/heveLD
         qI1ygezeQMTQ+DPNO800x9zD66hi59EffUoK8+uxjtm0N/V4/EC3re3Hg/H23+KqSvQh
         cAKvTsLbKZuBdu5P4n6oY3FoQZqV2jeGLLcZA/dFhwbAzthSOiGsnLK2QPHMYkUVXFqQ
         4ArU+gsCeWRAEO4lH2qUTscE0ZXqleR6msZ1lKqbeKsK486YVJy+3a7QqqsGHGe1gdna
         akQfIpXQLNRSB6DVTjMXcllHo2LXIu6pp+GKDfvp9rKT4k84CQMn1mD7guMINSEYix07
         1xAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093972; x=1795698772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=594xmkQi1EzZuFVwgIAsPQJhrxzAupoR0I5ZsOI+SEY=;
        b=wc9kLlo9mbglQM4JdCIc0YPeWNECgJNQB0CE7KhVMkm+pxY212l7LsACqo8OMCq123
         mroH1gnwBrgSc8ZrrE8O7j5SUp56b6mBv/og5bv9mytc/XosdtZjvRlfi7oEMuW7oiMO
         RrFfc6bqZ60JaHS187ruYhF1BVdq78kjNJwKqVRO/bsyGZez5xGyjdpuOGgzMEkOu+3n
         RMfE1iHPjYbQC1tCm4Aw1iI9FxMCKE5BUrv4EeE/RhsNUVXM8ackJ6qmL6x4YdQm4hZL
         73sNFWI5O51bI99ZxbpccHTNjYuG2H6n6FuiDVIxq3ZBvZPyRMafpGxYdGcxdHjRu1xa
         aNRw==
X-Forwarded-Encrypted: i=1; AL+hErHl3dFaMK3cIBJFj3RGXEnhIZylOhSM7+IPP5dnRC0mk7S4bZnSmCXyuGqXf/LDSH7y6/+qO0DYIqeJiRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FLyLxwJm5LPXaobku6jcGlO1Yc5wmaGOjkVBeWhaNHWfZXfMV
	kz7kUzVwaK9/u/nWFEcfWn7igg/+ZbJXSzkblUqQ2aJ+gG4Qi8iBffzI
X-Gm-Gg: AYBFou3/bKUIlCgmc+KTk5kAJr9cWJFQjZyzIwiog7xs9WZRePGDTpx1i3pkIKPuGQB
	N1jwMWAHmTxbW4Lo8Vn21gnfd7b/SvrPxRPrWbYUxkgLwGf3V8sG4UUyhT/gUSpySq0ODN1n41u
	qhrOAm9WkzyamANmagfNe6KjXxAwgSJqFkgYH42qMk2nfjX9o+l3M4ObvMHLzMtbuDm6xn7Dbjh
	WAbeD+qLTLQuoWBuycpKmcxUZ+SBNfZkJvrlgsa6gCuPtOxJb0YzzIefXNZiUVXnw6RgoOsefar
	SYyOfHAZdJOhngXrmy74ge2XgIf62trGzpPVwuw8KpJ1NjazyC8Ipyczaa5ww/1zVNKjTT2tkpM
	j0cDiKJ+b1dU4yuJUmHq6efeM/0J6DOaRagtnLQgTZyD8fOnb0U2cHuJ7E2Eet5apBOCo7SuwcG
	AOi9pwRE08eD7OWVJqWwftw7KCquEoFWK7DBayrNk4+fP3XE2HDsBfxF3qa7FbueS8rMppHz3jF
	AhYLneweyV/cPQ2fSlmqE7pGwP4Rhkvn4HbAnlDR6205BhhQHlu7WHNcjATclxvlQLKefOdHNSy
	70rLblcV1UZYtl+AX6pN0DipAkEn06PFMMA=
X-Received: by 2002:a05:600c:354b:b0:4b6:5dac:b61e with SMTP id 5b1f17b1804b1-4bb7da47513mr113467925e9.32.1795093972307;
        Thu, 19 Nov 2026 05:12:52 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85343645sm38588485e9.5.2026.11.19.05.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:12:51 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v3 3/3] mtd: rawnand: vf610_nfc: return an error when a command times out
Date: Thu, 19 Nov 2026 14:12:46 +0100
Message-ID: <20261119131246.187406-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119131246.187406-1-mehmet.fide@gmail.com>
References: <20261119131246.187406-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A command that times out only prints a warning. The callers carry on,
copy whatever the SRAM buffer holds and report success.

Return -ETIMEDOUT from vf610_nfc_done() and pass it up through
->exec_op() and the page read and write hooks. The page read counts
only -EBADMSG of the raw re-read as an ECC failure, so that a timeout
there is returned as well.

Fixes: 456930d80a2d ("mtd: nand: vf610_nfc: Freescale NFC for VF610, MPC5125 and others")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 547eb1513893..488e63b301b7 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -288,9 +288,10 @@ static inline void vf610_nfc_clear_status(struct vf610_nfc *nfc)
 	vf610_nfc_write(nfc, NFC_IRQ_STATUS, tmp);
 }
 
-static void vf610_nfc_done(struct vf610_nfc *nfc)
+static int vf610_nfc_done(struct vf610_nfc *nfc)
 {
 	unsigned long timeout = msecs_to_jiffies(100);
+	int ret = 0;
 
 	vf610_nfc_clear_status(nfc);
 	reinit_completion(&nfc->cmd_done);
@@ -309,9 +310,12 @@ static void vf610_nfc_done(struct vf610_nfc *nfc)
 		dev_warn(nfc->dev, "Timeout while waiting for BUSY.\n");
 		vf610_nfc_clear(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
 		synchronize_irq(nfc->irq);
+		ret = -ETIMEDOUT;
 	}
 
 	vf610_nfc_clear_status(nfc);
+
+	return ret;
 }
 
 static irqreturn_t vf610_nfc_irq(int irq, void *data)
@@ -331,8 +335,8 @@ static inline void vf610_nfc_ecc_mode(struct vf610_nfc *nfc, int ecc_mode)
 			    CONFIG_ECC_MODE_SHIFT, ecc_mode);
 }
 
-static inline void vf610_nfc_run(struct vf610_nfc *nfc, u32 col, u32 row,
-				 u32 cmd1, u32 cmd2, u32 trfr_sz)
+static inline int vf610_nfc_run(struct vf610_nfc *nfc, u32 col, u32 row,
+				u32 cmd1, u32 cmd2, u32 trfr_sz)
 {
 	vf610_nfc_set_field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,
 			    COL_ADDR_SHIFT, col);
@@ -348,7 +352,7 @@ static inline void vf610_nfc_run(struct vf610_nfc *nfc, u32 col, u32 row,
 		"col 0x%04x, row 0x%08x, cmd1 0x%08x, cmd2 0x%08x, len %d\n",
 		col, row, cmd1, cmd2, trfr_sz);
 
-	vf610_nfc_done(nfc);
+	return vf610_nfc_done(nfc);
 }
 
 static inline const struct nand_op_instr *
@@ -370,6 +374,7 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 	int op_id = -1, trfr_sz = 0, offset = 0;
 	u32 col = 0, row = 0, cmd1 = 0, cmd2 = 0, code = 0;
 	bool force8bit = false;
+	int ret;
 
 	/*
 	 * Some ops are optional, but the hardware requires the operations
@@ -448,9 +453,9 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 
 	cmd2 |= code << CMD_CODE_SHIFT;
 
-	vf610_nfc_run(nfc, col, row, cmd1, cmd2, trfr_sz);
+	ret = vf610_nfc_run(nfc, col, row, cmd1, cmd2, trfr_sz);
 
-	if (instr && instr->type == NAND_OP_DATA_IN_INSTR) {
+	if (!ret && instr && instr->type == NAND_OP_DATA_IN_INSTR) {
 		/*
 		 * Don't fix endianness on page access for historical reasons.
 		 * See comment in vf610_nfc_rd_from_sram
@@ -463,7 +468,7 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 	if (force8bit && (chip->options & NAND_BUSWIDTH_16))
 		vf610_nfc_set(nfc, NFC_FLASH_CONFIG, CONFIG_16BIT);
 
-	return 0;
+	return ret;
 }
 
 static const struct nand_op_parser vf610_nfc_op_parser = NAND_OP_PARSER(
@@ -572,7 +577,7 @@ static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int trfr_sz = mtd->writesize + vf610_nfc_spare_size(mtd);
 	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
-	int stat;
+	int stat, ret;
 
 	vf610_nfc_select_target(chip, chip->cur_cs);
 
@@ -587,8 +592,10 @@ static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
 	cmd2 |= code << CMD_CODE_SHIFT;
 
 	vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
-	vf610_nfc_run(nfc, 0, row, cmd1, cmd2, trfr_sz);
+	ret = vf610_nfc_run(nfc, 0, row, cmd1, cmd2, trfr_sz);
 	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
+	if (ret)
+		return ret;
 
 	/*
 	 * Don't fix endianness on page access for historical reasons.
@@ -610,6 +617,8 @@ static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
 	stat = vf610_nfc_correct_data(chip, buf, chip->oob_poi, page);
 
 	if (stat < 0) {
+		if (stat != -EBADMSG)
+			return stat;
 		mtd->ecc_stats.failed++;
 		return 0;
 	} else {
@@ -651,8 +660,10 @@ static int vf610_nfc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	cmd2 |= code << CMD_CODE_SHIFT;
 
 	vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
-	vf610_nfc_run(nfc, 0, row, cmd1, cmd2, trfr_sz);
+	ret = vf610_nfc_run(nfc, 0, row, cmd1, cmd2, trfr_sz);
 	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
+	if (ret)
+		return ret;
 
 	ret = nand_status_op(chip, &status);
 	if (ret)
-- 
2.56.0

