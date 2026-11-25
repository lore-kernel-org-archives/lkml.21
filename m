Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619392;
	b=CeBfD0CnepBwNWfnkF5mVWrFqAe5ylORGH5coNsT73hzUpE5uKlXd/GYvs/3e3azimiP
	 p1JKNSjOB0CHQL08pg3vKMdRbPgrX7yZh0SN+pRPAkL5N05K4qIyB9Kx9BoRKX+mNcoFF
	 okFOJGsYeL/x+aht0RuEFiYvqRMrs99lRdvdLDLCPHPfIoB5O+eu973Skejs5YLSS07Y2
	 rs7QqA5piuHJy9BmECk/XvW07b9S7Q5hSjml8tQy9A3tlqMG7GbAEQoiq/c+fVbadlRfd
	 9IwsoB2mzcgp+N9inO+NGdNTcSWM/FV3q1t/zDwuSeJbRHJtuI1R8owngXY9fQ84Gmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wU/3Wiw6HBpJUb9vOL67s+ORbpL0ttUSloHr/zoQa8U=;
	b=4umBYjSyboLkoAlKeztyeC8AJZdXptrkpMEaJRbxqO/CRWTs53Vuyjagsh/dOY+r2ZHn
	 m12oLTljndQyqtfumu5plaW0XkgcbmZwU7jqVOTcoR5t0nuI+YuY+kSGVrlEr2UwtdKC1
	 EGzpcE++t3LOkZ6Lt7pyLreG646umqXNnaogA79judlUao4yKZFwmzUYwj+WXDhrKAyGB
	 bJ6GHrD5PuMT7s50MUV1F1rEtu2sZCFKJcbPMxq+tUFp5oM0e/ZdNa0wzGLIv7gsNBJKW
	 0zwv+8eNZqs59gs8em8CBzD8xwpSM4y6Vz8yc5eNDudDqlxN8b2xFZeTafXMDCCG1qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hU/cJhaK";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1DF606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B1DF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hU/cJhaK
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b546061d58so13333940c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795619391; x=1796224191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wU/3Wiw6HBpJUb9vOL67s+ORbpL0ttUSloHr/zoQa8U=;
        b=hU/cJhaKNz93P0GMjl+URa/kTV1SPk5EUW78kR5rcIqbWBPJnNZnSKopxe3Z6sM5mO
         7gMi0+nQDW5f/J6fK3Vrto6r/lfCgiutnUnrBVcPYzyhwSORjvzyY1SVTRM+EGzBFw3u
         1HtNQI48JRidDGAvnuFMQj3k9n/XBUDjXVAddK9i1Y6xj5spbkuQED810lWK21cyS64H
         UoSpqCz+vD04AshM31wrNhQqErNNy98MGxr/fU8dhRApx9eihUH5mIyucLHjb8o3Q5PJ
         u9gtBSysro6RUsF0f+sE6jksOtpW/KlmydrS1rIvLKpgrgS6wgPzMx+ITjCVG8/eY64E
         XYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619391; x=1796224191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wU/3Wiw6HBpJUb9vOL67s+ORbpL0ttUSloHr/zoQa8U=;
        b=rJJsV1A9ezDhgJkXvMocet3gIjc1igD+FxbyqMN6z2denMtdXzekyAZ/rzpXsPHhp8
         E2DgaX/nnCouhOTQRQr17yxBOKuCnKSGOtOVzpGhgZo9sC1vUg8p6KViaE6/QtGAPmRg
         PjvfEPf+8SWhPNxlmc6clWv/2zQs08wlFfozohXUsd9INiYtr15YjWZs0f4M4dFXxIzI
         q9AXFNDXpdZ3TO4Q0+gZ5D3r/o9svTbKKtmUSPolfzEJje10Wl2o0KVxhOA7wh0a+4WQ
         k3F890boOqvhyUBK5qzKcjjqtsF2TJUdE1Fh0/mpFHgcfeywieHMQRe0+9wfm9uaikFU
         HBNA==
X-Forwarded-Encrypted: i=1; AL+hErGWZ/X6Z8mluWBFs5n3mim5bOIAqstqXs3fo6fVt61IGC4G+KFh3uTJyiCryC3aOU+XNQU6io0KIDrU+Hg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1FgYaa11IO8mTGEkOs79zQgO4PtJ5OEBPHPQqD5xrgJ1DUTDP
	y78FO+2nowTbCsgYTtM8S2NuxvxKMwKglCRacI5pWEwoU85HoKnysais
X-Gm-Gg: AZFdTZe9ySBedWO9+BAqzbX5mwaS3Lm8+1dyU+EYIlvPhk/2V0SWNhqN/RNChBWfmar
	eRmU6/NkxGSeGvVAfNFqtPDgqUO+TKnxjR456Mj+RbjGQWkoepqGfgK1fKP7DnqndTP6wQnsLiL
	5TCp4EYBRCPQLECjjtg7zqLiAyVUu4wcUG+Eb9f/OsPeZQENPwjExxDumAqPVkf2XbI+JU2/Zim
	QAnt3j9Bd9gBqzkPE49Zna5JXEot5CGJR4xruAemiuf6bkMNumLr4QvLh3PzQb37MQwqf/WFyOS
	eRCFficmHRF3wBKyqh7ATd9IejB2BkSt97tIJQOMVoY2rc0L6M5c9WCQZilMednPiQb8Vh10DCi
	BSVAddNAB6bG4Kf3FkXwJ70+KiwTPaJLGQLTGAKFaBcQqxhcoCZDSvsJcGc7oaTZi6GuNM0EK6U
	fOHEYsF948K+CYPVljKGCFBTkjMdqAd+tJnlWypPx3tNXIR0bI4W5NvFsJqkyM5c+vZzqmlNUIV
	j9OPI8XMl/BoUqyrJM3YwFetQbkblXoosUhGXrr+JaPOeYAPRG9Y6au77viYYFVqfP3QVWS7qaK
	yD6kY7jbXPljcREUwcQJPky5jfogV/LlEbRvEw01Vi9UXnMz+BqMI6zokufR
X-Received: by 2002:a05:7022:ea8d:b0:1a7:216d:157c with SMTP id a92af1059eb24-1b556902db6mr18127873c88.34.1795619391089;
        Wed, 25 Nov 2026 07:09:51 -0800 (PST)
Received: from LAPTOP-LJ15R92N.localdomain ([152.58.24.17])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm41950101c88.2.2026.11.25.07.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:09:50 -0800 (PST)
From: Akshat Rawat <akshatrawat095@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Hugo Villeneuve <hugo@hugovil.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Elena Popa <elena.popa@nxp.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Akshat Rawat <akshatrawat095@gmail.com>
Subject: [PATCH v2] rtc: pcf2127: fix regmap_config corruption across probes
Date: Wed, 25 Nov 2026 15:11:08 +0000
Message-ID: <20261125151108.423-1-akshatrawat095@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Both pcf2127_i2c_probe() and pcf2127_spi_probe() declare config as a
static struct regmap_config and update it in place based on the chip
variant.

In pcf2127_spi_probe(), if a PCF2131 probes first, read_flag_mask and
write_flag_mask are overwritten to 0 and never restored. Any PCF2127 or
PCF2129 probed later reuses those zeroed masks instead of 0xa0/0x20,
breaking SPI register access. Modifying static max_register and flag
masks also races if multiple instances probe concurrently.

Remove the static qualifier from config in both probe functions so each
device gets its own initialized copy on the stack.

Fixes: fd28ceb4603f ("rtc: pcf2127: add variant-specific configuration structure")
Fixes: fa78e9b606a4 ("rtc: pcf2127: fix SPI command byte for PCF2131")
Cc: stable@vger.kernel.org
Signed-off-by: Akshat Rawat <akshatrawat095@gmail.com>
---
Changes in v2:
- Reword commit title to state the bug fixed rather than the implementation
- Simplify to dropping static from config in pcf2127_i2c_probe() and
  pcf2127_spi_probe(), as suggested by Hugo Villeneuve (note: checkpatch.pl
  warns that struct regmap_config should normally be const)

Compile-tested (x86_64 gcc 15.2.0, W=1, CONFIG_WERROR=y) with
I2C+SPI, I2C-only, and SPI-only configs; not tested on hardware.

 drivers/rtc/rtc-pcf2127.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 27c5fb9b2aaa..d9ac2dbb4023 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -1455,7 +1455,7 @@ MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
 static int pcf2127_i2c_probe(struct i2c_client *client)
 {
 	struct regmap *regmap;
-	static struct regmap_config config = {
+	struct regmap_config config = {
 		.reg_bits = 8,
 		.val_bits = 8,
 	};
@@ -1520,7 +1520,7 @@ static const struct spi_device_id pcf2127_spi_id[];
 
 static int pcf2127_spi_probe(struct spi_device *spi)
 {
-	static struct regmap_config config = {
+	struct regmap_config config = {
 		.reg_bits = 8,
 		.val_bits = 8,
 		.read_flag_mask = 0xa0,
-- 
2.56.1.windows.1

