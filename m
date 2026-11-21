Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223481;
	b=2q/5avl2rMkX7TPQiSQgLgRSRYlcK01/LNpes0x9iJX/yyMRgSTIs5obDnKPe/Nk7zTU
	 k+PoQ3mlM3oeRejw82DYbHYO53df5MVzxYwdswhG6nBy9Ip1G0iBvVXtVlHiF5ZunVjCH
	 H6VfXgm5T+IiQa2O3CbTXhadtyCAcxY0kMfgT/rXuEuOltsisbgBwRsLCVGz2BWpT/2zY
	 eNLCXgQdjYxAMdXMAb00SwHhdBKeqhjUY9iHGgnyqmsDPYiOycLtiqZafuNHkxvKviTyd
	 aI2hWQRVWkWqWzRmGaS9I6fxCxrma1G1sHhK3miI3l5rUtirNznTu18f2bKXrQlccMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=u89IqnoAKi5kjnWBIZSz6wZn1oqd6Ypo53SPsotyUk8=;
	b=BNozRoOBtv/3gqjRXpPDvoVSxWt9XVJN7YevlGUnCxnZ4xFunxrVNVbEaDrT4g6TrmX0
	 92dCVgkc1zOrmTwYa1C8Qz/iv95UGBZiXSgHXOWFDpMgI9DNBjryFyZmk/yfshbblCG7w
	 wjIg2mT9OdODOaVyFiTkK2ob4iSVKe41KDTayOTaB4gllxTlMkI78/jUNF+Umq3a0p6Zp
	 WHqWMDSP6i1mzx08epWGIs9t1RNw6se8jNed/E8bCvMza2o9mF/S+x41xUNDabbjmAd2R
	 XXwtI+gleFaVN7GDsqlmKZNNdKZp4ee7CRoTcEW7ewsX9BpBkrO3pH+4Wofrf4yQfDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lqhDf7C9;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372E260A3835
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 372E260A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lqhDf7C9
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-483a66818edso872851fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223471; x=1795828271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u89IqnoAKi5kjnWBIZSz6wZn1oqd6Ypo53SPsotyUk8=;
        b=lqhDf7C9hkmi61yRGPwOVZuyBci1NjYmFnJzMTUZWv1M9o/P6oHtODRYky3eaLiNkH
         iNo4KaQU90sIJF1K7dQIxkFH9eyVVctV7vF2i2FSzy38cInHMvjhV7b5prr4Js1rUQev
         GXUZL3KBEdNulOdic15NndBbLGqPjhoxbu5a5brHeNdzMaszYP5H5RaHSs3dUwJIrNvl
         OHRGmcwW/kxNJG02dgsCWMtAeARzWdvr4k5MvgRd+dyH8SshVZDNYbVpIn+WpIUtiXED
         3KIsM6i+ZCY+Feybdl1wi1QLr//SFQCCmifKiR5RZlYkLDKEwZXtTDvn8SXtOSJuAk/b
         ZEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223471; x=1795828271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u89IqnoAKi5kjnWBIZSz6wZn1oqd6Ypo53SPsotyUk8=;
        b=eWOB/VnpywHr/2mXUnx4iVT3q+hEE4sNVjdySdUQMvjd4twT5fjCK1W+8stCqNP4r8
         BURRA31iyFfzT5zGq9FfuG2Ocx5saPia86+paf2F/oUAfU8ENEJ2PBspkWRuwLqPMYbt
         7oeGeX0s7jpX1JlNUjWW2SpTtvsTmdXx5BpSZgWv8N32HGbD47hVgBQpfY1vDMJisStN
         I+8L3wxjzlxZxsyMXHsBiopkpv1xj6NbB0iviLR5JPC4U0s0fAOcNxLrL/pOIHTtaM/+
         4ILWFHjproxsGNOxPRN2PvuZKJmr2RD+iALRdWcAfHWFEZmEXA6cJOD2KmxrU9aEYJtB
         wy/g==
X-Forwarded-Encrypted: i=1; AL+hErHl+yLRJAqyujooD/TwBZtm2CjAHurwLotB19VnmHxAf2B/AP/Woogc8ifwp4TH7xEmsm3qyvLEeCt/OE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZluOxIadY4EA2kGCZEl0TTbV+5gXya9yzkWX0FT07aSfgMadg
	kRPs0L2hP4LO7u2CCKU5C/ZVLmpB8luyzwqPRlYvCsuBhzDBarkLE+69
X-Gm-Gg: AYBFou05OeJK3IsJhs6joSwHGfoYtAbockoG1HPF2t1J4tOUXfpELTnO5ymnRdCBBz3
	PRIZj/mBBT6Afi3X5DFObZ+CL8WHBKQirBsreXJEZgmlw9T3lOPdkQyk0dVlRE/NFf+ow61W3WG
	vgvzUZMts6bXqSUuDhT1OCRv/4NEBt0M8te4nNgHolUJKr2wHpsTsbjL/5l/6AWTTfmsaPePg6z
	rrRmvliPGk++s/+tl0qhmHfHRYayKOPeByejLCHiLF9s1SpMYyJKQC6H7lrBDqAz9jhHlBhU1w/
	3TwlX+b0bMfSFXKithRDaZ/AB6UwSNaNBqO0i4V38OjznXlGIfu86p12ipsyXTrrnNgVs8GwiSZ
	SVWuVHvMJIGvScW+WER+6JCw/DSf3LaKSeaOizzfPJJXDZQ++NMXDVcTpPDkcyzqLaMA4AfTpmo
	0nqKddxWEIDArVTv9EHikYsKMStIRy11B/y5PmsxHar+hMyH5kymTfi8SBonnO8ZhgYIDQ5Gz7e
	orDw+WkxQIXnBZaHJh7x2pHB+aBLqr05EDqAuMpKSxMyBR7LOhwN2KxW/0kxqHV7VRzYxmPDicW
	7Zpfi52JRZ7FSQURcupKGGVX14LDaIzUmsJqniFOn7LkMUrltdubcn0xUAJguFh96rFsHjnr8Kz
	ys9joxLSxeq5LP69KGqYk6wah9EZs+YTG5AFLT6JVYJEkFTsa1x+hrZAZmfsZayV1ae7toIQzTf
	KIYUCmWpNAiQu6OHSo9dpa3aqeZLoVxV26PgOiOeTwprGi9n8WBI1dQyo8Oq90Yn214wPKOYbIt
	A==
X-Received: by 2002:a05:6808:244e:b0:574:6f37:671d with SMTP id 5614622812f47-57a056c81c5mr5959981b6e.5.1795223471048;
        Fri, 20 Nov 2026 17:11:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:34 -0700
Subject: [PATCH v11 11/26] mtd: rawnand: sunxi: preserve synthesized
 zero-pattern data and OOB
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-11-9721b1905ef4@gmail.com>
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
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev

With scrambling enabled, a PIO read can report success for a physical
all-zero chunk but return descrambled SRAM data instead of zeros.
Both PIO and DMA can also reload the requested OOB after filling it
with the zero pattern.

The ECC helper fills the buffers for either hardware-detected pattern,
but the caller skips normal buffer retrieval only for an all-ones
chunk, the pattern it treats as erased.

Skip normal buffer retrieval for either pattern when there is no ECC
error. Only an all-ones chunk selects a raw read for trailing OOB; a
later all-zero chunk must not undo that choice. Keep the physical
reread and erased-chunk check for ECC errors.

Fixes: cc6822fb756b ("mtd: nand: sunxi: move some ECC related operations to their own functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-172123@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 43c0796d953a..538ffcc79108 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1226,8 +1226,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 			continue;
 		}
 
-		if (erased) {
-			read->has_erased_chunk = true;
+		/* Both patterns are already filled; only all-ones is erased. */
+		if (pattern_found & BIT(i)) {
+			read->has_erased_chunk |= erased;
 			continue;
 		}
 

-- 
2.53.0

