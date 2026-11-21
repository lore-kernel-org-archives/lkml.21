Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223491;
	b=lfp6HoZ3ochtaBU7AZoi8sTioxBeZVDujFpuac6s85fj7ZrVrIK4LVcHOfts7L1M6bj5
	 MftvqPoPlOop7PQj8TWDba5jLyJ72ClYQ1xVMiHnGQ/oKgIHgnVGcfVkVeXAt1cNbjcPd
	 1zyOnOLKVsi8nBR1bX1CatjRDiz3Mtt3LHwgwc9aQxge+bpRezSQ8h4cxhBlsSUIxwvOJ
	 PiOl+f7lliANhJj3ks+ToWEJDF4pJcfHatzjvKv2qE4DhWC6PS+yDoZp4H8FfzSzmKJ5n
	 jiKh/oKKE9hoctR5lx5rgCNY6rd9+HcwKkXqDZszS8uhKMxI8lia+JOV7DNhoH8W4Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Rd+OJrfYC05spJgrrPaaw8Or0kLWD6WKtcmuDL8E++0=;
	b=C9k1if45AT1LljG38YdqZ3DKCC9oZd6rTQeyMuVuVe8lGzHmhzczftaMgVmBpmSXSo7m
	 KYVoT2YJNfm7oqI1jU5BASuB4gEuu12KdHRiRaOBj6W66XGAfIE9uq64weKcLzXq/bt34
	 ovTo0pGuwgUz2J6pd43UDXkhKDH4pyS/WdpJymWpTQpAPOvUCEyHRlrp5Uzhlj2xbOdhM
	 FIWstrbleETItsf1nZZARi/VAmsYqakwJuhqzUaOuTg95ZfLgEXCx3IzyT2byNNC/8AAC
	 hf4BHMubWKOvVIg8+4VaS93IfkxafSRWyRjBeLT+09oX7wb7G/eJiAU/gDkxIs6/zyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ldYMPKEl;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D5F60A6F4E
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4D5F60A6F4E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ldYMPKEl
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4911df1e196so894451fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223480; x=1795828280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rd+OJrfYC05spJgrrPaaw8Or0kLWD6WKtcmuDL8E++0=;
        b=ldYMPKElWhbs0fukl2KiGDSnyLaUOTrgeMCcvfSieEcuAYO2ECMlj/vIwwAzrganVe
         LDzqs3dzhn58+XXKh8GMfij1+SGs0NtuNJU/6ml4ccbd8a1OsyPHVGIQI7oSYjy9f3zK
         hB8CfvU6HCqka3H5pYx2TtOYDfOh+ktqswQiAv+JOKz7f0p7bHZf6DihY460+bQ8aTkq
         E0GP1t/QQowKmfyDwLU6HQdk/rMtaAj0DgRKGgY3+aE8W1U9XdG1FIjwHKmblk4hELmT
         hqfrE4Hn7WwsEaqbgghbC+y92r2cNqAYLuKdgPjoB+ONm5y9c1nhbRjXvv/IVFcE+aZW
         EHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223480; x=1795828280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rd+OJrfYC05spJgrrPaaw8Or0kLWD6WKtcmuDL8E++0=;
        b=oxjDKhAKbO//QEAp9cfn2Xx7p2MoF0Kl1ktRws/xn5VP9SspfuDeknWhiqpcmFcote
         nPhwrDS6M1wf2WaBisEjbhNJBYqybEoXaZ8ia59K/8AsEzRZUBrb4+zCqa51d5Zkog1t
         74uFnWyO8etB3ccvF376UQQYeGGVqJti3WQiF5LY9qwKgR6uKjotzwGYS2fR0BHp4dRQ
         cc9F5CDiOTHV0JL9oH/5VNnrOF9FaENaIxy8hePqqi0zFxEHz4v2x68+Ctn/dNVW7IsK
         IZxCLYFkGr/hm9s615mWqLuo9JftVG2DFsXZEhdjdOF4dsyLlkKrH4dv/glD/NpCiEj2
         e8xw==
X-Forwarded-Encrypted: i=1; AL+hErGKWpnt1WE1ZCrtYqRJcjjXOgSyuR/6DfljXYXnAS9kxSBcV3hEGoPptNwsL6H6D2JTvCdzsU/ryNIZLeY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W0IV7Gqv156MZXaD3cQgC/ZpUUw2LRjQhX/tAVuRGp2hkgQWQ
	kU8hn0AUIKK/pEohkEnrJHJoVfmpQgLzJeNdPNIBBDK2WEUHvUx6r595GXilHG5W
X-Gm-Gg: AYBFou0cSKOWdfFRm/QZer6Xl6vGhRxS8qj3S4IrEuJ+sUNaDRCr6541mJfyt2m/D+D
	JpGzTvD579rbExF7hguIkuHD+5CgRtfuMo6fVan2sK59kmuuMRwvHv4MvHBjHop+BciCW7gl28I
	8brfmemiI/vVE1JukaHV+p2RIiGAC2F7LDuOuIuVRGdDn5Lv0CPJulIxuIJhrTIvy5Y65WO12I9
	KpPBXRqzZhdzqMB82dnUzt+5M44M25yTkvxuY0gDvW5vhtG423E1kpn40ejmLT57G1mpjzJH7PV
	SmlnbCqoTm48x6nX7PLOGMb8kDLjEEUQvzfwMSrLA5DeTTIZ1Mucsg+8b2CXaB594scALkRoX+1
	928IYIPJK7xTKyCtqIdbGwKuRbeT6qGKCG1yrEyHu2spg+ropSHppzroOumlyIN1bcIR49MurkD
	5f581isqU/5Cs1yYLLL85bKlSEWSf5k7DW/2vmcgC1/X7j82jhFZhhNrDZpZf2ln0OPQGAweSbQ
	H2Y/bvKCiignI38D46ocRrPR2UAcNDpMGEionPk6mT+xes+W+V72NtysFhcq8PU4W4WlJwDmmCk
	naOb9iYPPdKduli5agUs5xXl+pCTs843K4V0IuhRpTmfT4FLHdhPaT0ONXQ0G0nVdwEhN6ymuGS
	3iRkjXMlW0J5CvmJ43ZX/Zg5PmtUBe7+Vzm+2KT1pZGxSsPFTUZ97M0yw1GMrYleNYa2Y59NR7C
	Evhtf54QMkIbdrvX8FW0av/a5h3G5yU1BH1CqPQqoTjY3slsRL13Ha
X-Received: by 2002:a05:6808:4f0e:b0:54e:7cf0:c0b9 with SMTP id 5614622812f47-57a0d2f1a5emr5946703b6e.64.1795223479754;
        Fri, 20 Nov 2026 17:11:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:40 -0700
Subject: [PATCH v11 17/26] mtd: rawnand: sunxi: preserve bad-block markers
 on erased OOB reads
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-17-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev

A bad block can appear good if its marker is the only programmed byte
in an otherwise erased ECC step. If the controller reports that step as
uncorrectable, the erased-page check counts a 0x00 marker as eight
bitflips. With BCH16 it replaces the marker with 0xff in the OOB buffer
that the NAND core uses to check the block.

Leave the reserved marker bytes untouched when checking the physical
first step for erased data. If a hardware pattern supplied the OOB
contents instead, read those marker bytes from flash after the OOB tail.
This preserves the column for sequential reads and leaves the normal
corrected path and data-only read traffic unchanged.

Fixes: 146b503e1027 ("mtd: nand: sunxi: fix bitflips in erased pages")
Fixes: 4be4e03efc7f ("mtd: nand: sunxi: add randomizer support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5415ac6960b4..f8bc6e3c3ac9 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1111,6 +1111,7 @@ struct sunxi_nfc_ecc_read {
 	bool oob_required;
 	bool dma;
 	bool has_erased_chunk;
+	bool read_raw_bbm;
 };
 
 static unsigned int sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand, int slot)
@@ -1167,6 +1168,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
+	/* A factory bad-block marker is not an erased-page bitflip. */
+	if (!step) {
+		oob += SUNXI_NFC_BBM_SIZE;
+		oob_len -= SUNXI_NFC_BBM_SIZE;
+	}
+
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
 
@@ -1251,8 +1258,11 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 
 			if (!read->dma || randomized)
 				memset(data, pattern, ecc->size);
-			if (read->oob_required)
+			if (read->oob_required) {
 				memset(oob, pattern, ecc->bytes + user_data_sz);
+				if (!step)
+					read->read_raw_bbm = true;
+			}
 			if (pattern == 0xff)
 				read->has_erased_chunk = true;
 			continue;
@@ -1321,6 +1331,14 @@ static int sunxi_nfc_oob_finish_read(struct nand_chip *nand,
 			return ret;
 	}
 
+	/* The pattern supplied no marker bytes. Read them after the OOB tail. */
+	if (read->read_raw_bbm) {
+		ret = sunxi_nfc_read_column(nand, read->page, nand_to_mtd(nand)->writesize,
+					    nand->oob_poi, SUNXI_NFC_BBM_SIZE);
+		if (ret)
+			return ret;
+	}
+
 	return read->max_bitflips;
 }
 

-- 
2.53.0

