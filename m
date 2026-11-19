Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093971;
	b=V8+2zfGhkhEHpWCuBftChbvydV0Mo1JMZfD0vABDqQ5iz28aB58MwnweMgZI6WtT4080
	 g5fXgDxexSlKdVq6YKEesmpMMte9D0DVTPi4pf8r/cQS4KblQxC/ZRFZoWVqNDXJTmFlm
	 5Uj5A7/YuSajIqAYc+DsBmZOpZqCByYO/bRonfa4DyHAcnbJbchwcjQYmHN4kneVoT3Jr
	 oERe7RywTUq750Fk5oykbWhxekVVc7HhiHrabL4arxdo6eEOvG9uU5wFWd/AfEkdhEN7l
	 +GDZZqOiTU5mCixYfS33tiHwTic+Bzd4KsWVcU3iDobCl43VBf6+lQTZMscBUpJFwhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MQjf08pQarr4TMcmCq6Pk+sjEXtu6RANKHLEtOhYUik=;
	b=H8HGZbimloCHuPhIK1PZBzGskkBJ+B+V7Dy57g2iiN0bXcFtDklBFaEW//bww39NKkLU
	 mHJC9hlulFUixamSydjLo1vC5BTozmM9jHfZsZBlBafLvJMCVREiTSacoNoBvqO+ILz6g
	 o+r/JsaWVnTFmsNnEeFnPTEvlOwz0+f1r3Q07p5iI+JMhFULg8Dawi7f/kniIbXMhpX6/
	 QqOaipiOVIUg/3CAHATKHOKkKfj0Cgk50BTd727Yew7IuBLPBMQRBGGpBDeXRzkkdOmrl
	 FfHX0ndgPNFRcfFGgb5tmjnDWtMcUnotuAcvDVQuvYgIdpuiQ3y4/pG3Di87oA8Q8cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l2hH8mhS;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56060606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56060606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l2hH8mhS
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so31771675e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795093970; x=1795698770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MQjf08pQarr4TMcmCq6Pk+sjEXtu6RANKHLEtOhYUik=;
        b=l2hH8mhSl4D6KyjE/Sz0bwhc8ya6xgXnV3qFeQ62XeTX3PUlpqyub6HbdQbVWLeIez
         D2E9beoAt1r99E6ozK0Zb7Ttkf4xC86X1s7rfJISKd0PXFBOeWl5g4BYSbGDPp7gRELf
         nfiiMB1dgbatf9lU9sc6XtbRQwiZffN7W7QQD1hDQbM/2Wc1YOmjNbG//aMeDbOXBL3C
         xMMww9M/hCOkGPTuapJ/R5zhSZWtUDBs1DnT8clrl8YPRwlExy+DbWNutBT8XA4YM1Y2
         vF9D54GA5xzWgSrHZSsa84tHdXyqYol2KhCCS+RzwQDRIUrls1thLGmdnZVOHC0Tnsz0
         lrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093970; x=1795698770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MQjf08pQarr4TMcmCq6Pk+sjEXtu6RANKHLEtOhYUik=;
        b=toKURCA8PTYYf3Z0CGTT7dXjO98tEEN6X+8lCJpfDRqXLKffBp6AMgHNlcedSeyBye
         RevSzaeZaqvUooXUVW7le/kLwFS3OisakdtTz9io6fyvUoUo1z7L8/jK8vRs4KkSiVJn
         vdSdX45VogYX31qu/iqq6E/Rjuehwn7NpCB4Aa/mv1YDg7V+SG0zvR79GxsTWHqYU6f5
         KiBRmwxDIxnC0NrclwjAcIT92jpIcg+vH9Ois19lBpwZQMdqMKirHFMpygQD9obDG9XY
         lMpoNrSbd7UWAR6293ahOvKDwGzFINT+WFA9gocaEyIE2txVpr+pp8vMN61FPqH9exI8
         yk1Q==
X-Forwarded-Encrypted: i=1; AL+hErEU5rQsaSJQ8PC/Jmg+azNF54UFu2wXfreW7NfEUI4N/WyQ92Thys+AgKm473/oJidND76HgfybLsaU1GA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PY2iPWxfWvgSV2ZNr3AbhunsiEpmuebS6sF4W8QwjFwv/mqyd
	hvRSysuKsspiRaYRITDWolY02uCFmPCfnYvDkZhjKgFL9IgKTmWoUC51JRDTeg7c
X-Gm-Gg: AYBFou2FZU6c1QLKW2EGml20qfHX3YJPXG822yaLIxH4W/VkHLYXDWGCdwYgHYi4uHD
	p2dhIAHCkp5uXcOX3lWStupUPZFSsGXm35TXktCCGu1pnj0TKNtJAS2DEu3nf/U159hTMeLG6BF
	kB4j1VsNmV7n6XWiMAMLOT4urfatXCy0326xHTkwVcXPLRexacbENsM7p+MDVEJsRAWsVFG4mhu
	L+8hZ7v+RXrCEbHSjgO9bmYh1t9GeNIF1X87SQztztytUrsKj5jfpw+oL+xCksteljM8o3/LZfP
	vIOaV9VovzWensNNtxCDewuB4Pkp+pNpqZOaK1eIA84uvUV6d+0GhbPZ1EKi/GEUdGh/X6I7w9l
	Jfnu78Drou4yjeIRqB9IKxQPO5+QVvIT/9XDOakIRpfCMlcYv1nTloloSP1V8dfsMyo0sznchyB
	0VqipdH33aww7t6YVYktM2qCzu9OFIGGJudK9tV6lfQQHIRoZLR9DdEEkFHjBGTGIvtVMo2V6+p
	lEx9OmtR/dnJDMIMpzpJP7h732PXFrGWLVc8RV8vSnLktvpmbUsXBPxfeJVYXVKTzqgtZj7nQaO
	QD+cvyPCCF6ykMeYtQMNgpwGSAJGV0UXm+OIiFAK/lGr3YL16UWjAW9R
X-Received: by 2002:a05:600c:1c1f:b0:4bb:6847:7943 with SMTP id 5b1f17b1804b1-4bb7da28927mr133157225e9.26.1795093969644;
        Thu, 19 Nov 2026 05:12:49 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85343645sm38588485e9.5.2026.11.19.05.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:12:49 -0800 (PST)
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
Subject: [PATCH v3 1/3] mtd: rawnand: vf610_nfc: write the OOB bytes on page writes
Date: Thu, 19 Nov 2026 14:12:44 +0100
Message-ID: <20261119131246.187406-2-mehmet.fide@gmail.com>
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

The ECC page write transfers the page and the spare area from the
controller SRAM, but only the page data is copied there: the conversion
to ->exec_op() dropped the vf610_nfc_write_buf() call that copied
chip->oob_poi. Every written page gets the leftovers of the previous
transfer as its OOB, and OOB data given by the caller is lost.

Copy chip->oob_poi into the SRAM buffer as well. The NAND core fills it
with 0xff when the caller writes no OOB, and the ECC engine overwrites
the parity region on its way to the flash.

Fixes: 1cbe30b0ddc7 ("mtd: rawnand: vf610_nfc: make use of ->exec_op()")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 6ab3c440eac7..acc9ff282083 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -637,6 +637,8 @@ static int vf610_nfc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	 */
 	vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0), buf,
 			     mtd->writesize, false);
+	vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0) + mtd->writesize,
+			     chip->oob_poi, vf610_nfc_spare_size(mtd), false);
 
 	code |= COMMAND_RB_HANDSHAKE;
 	cmd2 |= code << CMD_CODE_SHIFT;

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0

