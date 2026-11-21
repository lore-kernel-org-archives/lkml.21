Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223478;
	b=pfGJ3wgsZYnrWpcczNrQWqpmV8bXdZ4lnj/T6PTrQ0RO+vd8UOt4796z6+C1OWmYUCpR
	 EsPCjx6PYWTM0BMoSPyU5J+wXNQSUIMyOMyzkDbKtH8VnDEB7JabKauC7U7JkOOD0BCXX
	 EA/LhgTExpUjiraOTAj7ExEYQO4epRI9NXqzFDfd6+6XS4WzxucrvP8xr3qo4Ga+DWqvf
	 +HeB3wnOD7/p84CwiUP8k5fgHBkSX3y70QUCwRmQJvWn22VPtlJFlZVrH8wSd0wf/zfSC
	 pp7Pmsgqdm0+JOQ8Adm0YXHAFwRqS5xKAiyN6IoGn1mElQmtubI9l58HzO1oAqL29Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=q43OtFOdNFKAPwH+oRkUo2vplhtOIciQt2V0N0tE52g=;
	b=2ONL8jr8tdonnT1InqJ8ix87u3aUV9NY3db61C3wrOmZtzhXXQP0WkD7bwrEPlN69Ced
	 RrxGLZ694507pnAqIw5vHWl2TPAd3/VByOv1ZG0tSiqEXpdgqUTb1ex+oCjZsEugY2gLB
	 NtNfslIe4nL6ijXI8JKdOFCJZa0rhlDeSqP6CRcDMhV6Z0Vj1FhQ/Us5RDeiryQ8Gk8CA
	 tY3cHkT8ol/gQXue7HVgybvqpPFSs5FoTHUEPoXY28tZhpze25YjDtkOJf3dHL52Aduo+
	 TB3URLAgZKCv9tYDgGdx2bFfga3vTIpkZuF4fbhP0I3AEeRpVbX7Tk4Q2b5N2ImW/Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BGgaD8Wg;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8094E60A380B
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8094E60A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BGgaD8Wg
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-483d290f398so909443fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223468; x=1795828268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q43OtFOdNFKAPwH+oRkUo2vplhtOIciQt2V0N0tE52g=;
        b=BGgaD8WgiBeyw57h1wjj+17CzfgitgeZ1ndw7lTEr+MChWZ5KvVH4kJ4SuaP6seaED
         VjID66TCK9/4DClQfuFcMKg+KrvHWPNrzpkDpotP/QEF/JoqEtgU4ZsMc3z+028fQLNv
         nYNK0Rn7Y5q0u7PGvc/RX1RpEooEZPUX6QqU2ISFee7c0WpqPQfkGTxQ5w4oLFn7V3MY
         6TPu7/jmlEmi4/tWNB+lslT1bIV0ic2d5tluhKwYC15wMQeOKlP4RlOoWE6bkw8fk5Pa
         VoqcBy+lp7MEZNpDNd7LegEWpev+YxLs/Jl8GRJ6PbDLKdT7Fk9VBazbficn7q10g8aG
         PyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223468; x=1795828268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q43OtFOdNFKAPwH+oRkUo2vplhtOIciQt2V0N0tE52g=;
        b=GaIswETh1/8dGTh2aSof644f0yF8h3O27y1hSXHlAUq7xxCDM8YSAKRAvxDd9PtcS+
         MRPQEgWXUF4619hPOecdZyTNIM3Z7rA9G/orQpe+bzjIS0H7lhD/nh1YvJaWg/nQIQhb
         s8DcSOApE7yWXJpLF0Mri1VDovJRdnGtXdqhnGpU1jjmMyDY90H9wBWOYtFJaUM4tntX
         EndkiOYKuorNpqHvmkZ0t3HzVqsN+hjpQjRw0KgOlzWYp24K8eLTQ822Orfr3uzseK3b
         zo1SHTHRZWKdFNdU/5MdHF0coJXShwu2hMcT5opfD3Cb27xKWTpWBL6on3kPONTlkxyZ
         xuNg==
X-Forwarded-Encrypted: i=1; AL+hErGfi+XVngjAPF1Sw8obsKE96JCXcxOtV8jwCQ7bybz0LbyaFTRhgft+B4mmH3oQyFMiaTargLHYZdxVFhI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hLhNybijO5hRfMNOXiYdaRxBf12iUdyXRkgBKf0aVIjHk3J7C
	iM5zJjL7XHOZ7O04IgSW/gFFOEeuAwYiDXMeFUQmvfXrqBGWJmHdMBgo
X-Gm-Gg: AYBFou2t9Wbs9Tcke0WNQb9DrLKbfCVJUVdBH2fg17MgNNneIIO6Qus/tDYAqHZCUmb
	rPqviwDd2kbJR9lq3mJ92a5uNVgc+iVxJH1BgGAMgvTvStEz664z+2t4cL+cvE//6pMsD6jEve5
	xqHENSo+q/n3W4OZnVGy2DhaWAm42F9HJAm1nhPUZ9EtH6n0TKtJKyTQVOP6lmjhhG27zAVR6xK
	4cIme6seRJrE8LBuRY6RXQRr26o5TrOaqD+W/Vgu9lTOV+iw/EpcF4G5I+JxEOis/4ncComPnZQ
	mE7RdqRDpBiv1F0Ge8T3Xeb3cyWWZIgRl2rtjhCAmnWFg/WMVl2lgGqTUv9xIRfXvweFbEcfzH2
	EeaqTDM5Tvnzbzu51nNaQG5xXNWRcL/8aTXlm7CjUoPaW/1f+R7AeR6ZyDhDGkrZdmEZR6DBH/H
	c0+YyGb3b3XwdI8YC7wr97HMAxaAmtLKYOTWD1sgVCQPnwLC6Ubhry1WyEodxcuEabJXHAgpaXn
	soOJBkQIdbIwRQTfuuBPIiBkXCtt5NPnYkAUFC1in8VBA49IMw3SfsGASBaBITGbJLoNk7w0UT6
	6VIyuW8YP0PEptmVQLztG14j/UYmi0mPH56wX/GKXx+5zITtQfIfo7N5HWOJsePTWM9futRZsXx
	FKc6GWBkx1awCkwCIJgVHKiVSEMlwWdzrPBcIrkNpEpQvD7GD0fvQnSRkcrLr6SxvIb09g4WU0X
	4P89Li4aYKfbbTLFlA0Ek/LGXG1x/UQUYbU8uL1znEeqDQgcF0AX15lA==
X-Received: by 2002:a05:6808:4f6a:b0:572:75e6:1d0e with SMTP id 5614622812f47-57a06d1a870mr5691634b6e.5.1795223468341;
        Fri, 20 Nov 2026 17:11:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:32 -0700
Subject: [PATCH v11 09/26] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-9-9721b1905ef4@gmail.com>
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

A page or subpage write can issue PAGEPROG and report success even
though sending the setup command or address timed out. The PIO and DMA
writers ignore errors from nand_prog_page_begin_op(), transfer the data
and send the program confirm as if setup had succeeded.

Check setup before enabling ECC or transferring data. DMA preparation
occurs before setup and may already have queued a descriptor and mapped
the buffer, so use its existing abort and cleanup helpers before
returning that error.

The PIO writers also return directly when a chunk reports failure,
leaving ECC enabled for the next controller operation. Route those exits
through ECC disable, preserve the reported error and skip program-end.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 6d7384aac917..76f60fde7a86 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1578,7 +1578,9 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1593,14 +1595,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
 						 &cur_off, page);
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1616,7 +1621,9 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1632,10 +1639,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1676,7 +1686,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		reg_index += user_data_sz / 4;
 	}
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret) {
+		sunxi_nfc_dma_op_abort(nfc);
+		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+		return ret;
+	}
 
 	sunxi_nfc_hw_ecc_enable(nand);
 	sunxi_nfc_randomizer_config(nand, page, false);

-- 
2.53.0

