Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557106;
	b=QYNsCRUSgSQ01mM9CfbZyJyDMLyVVqQc8P/2OaEj+U+pdMCadJoRfE6LecuDpYKznyDG
	 vlwsxh4MMpGwdI67yeOJZAVtYtMZCEt48cKJ4o6Cczzz2hTDmKA7LPMe4ezGvo+/ofska
	 J/68t6vAjuPtB+3wKFuUBnDrUkJVlOYltquvI02RWTvV5AcHafJjOm6fVNEpkunK3OfHu
	 YJ007Od1CrTyLz8VK7CIo3L5YIJhbitbA3Is9qE9IAFiFf/sWCCGPpIIr2xeHbbyk4VW5
	 SivjYdlYo3CQsbYcEE1bc1QTsLzQjfyK3rWV2GYfss3SXlSP6IWZrpPIIpSwCllwogg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y9Q8/yXg7DQy7MuZky7I83q9VEq5cS/4AZd+tD6xMFo=;
	b=zHGlXc21LYxcn7DPmMTUglpRjz7DARDonWrvkK9IteGNbspoW5WHzSTN9BWUv4LGDdDM
	 qNt1yYu1rQmw+v74atkXVoR6aV8jkFGHIYSFbpTmKQwtWXS0v946W8dg3xR9lghsoE6BM
	 Cj9ZhiX1j4L2C3VyDGDlYXIiBbbHu0l8L6925Ctnrh6/P6/KLWWpMIKLStBLQ8JbEGoCo
	 zBV2QNvshFq8p8BUi5bzWbF9lAIQD/EI784ZhVGuJGZUCioJES5ifa3FGmd1LnpAcN+0a
	 X5Mi7h8vLxpqynXR12WT8Fnd+MdP2Bu2B8nafU1mxOeECKZq7YYrSo9fAjK8TLToU5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RyBkGFcZ;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAFD606A690
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFAFD606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RyBkGFcZ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so22337885e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557104; x=1796161904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9Q8/yXg7DQy7MuZky7I83q9VEq5cS/4AZd+tD6xMFo=;
        b=RyBkGFcZgIYHKcwtjpp6I+WRtugULCXa24w6olfSxQU+kNRVD+rCne1DdHEzZoiN17
         CRtq6VNn3Fw7gk+PnItFwKispgw+kdecmEAHoG4/14jZfa2eBZklUDP3PuBP8RCeKf2O
         OFOqA4OEX6wE6Dl1TtqKY1tlkppEqu8WFrWTxBQmhP64dTPUpJ5BD3OCS350oPu53EjU
         0bRjI7U7p3rlzeci1UMRRp9MebOeS/eOCW7OZfsik5h+eluTJEqOaoOvNEUsqOkzOB5S
         JFsCfm2hjpkmdNtRpRxUvKpwDbbayovf9BDNvoHQ/vJiT13vfutdrGIAv6ZrBWsee+aj
         H7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557104; x=1796161904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9Q8/yXg7DQy7MuZky7I83q9VEq5cS/4AZd+tD6xMFo=;
        b=ggCg68jNP0CLFombKmAcy2bUVS2+Yzx4k+1Kf5FtxpmnvgVfsrdN+xIBCHMo1kWt13
         AwaYCX705JGKg1ExSai7UIeJFuNlYfWBlYWP0JbYbrpRKJ4ZLQgtULi5nHNHBo/cEXFT
         G5AwhD9o8ra7rl004HueISIofMjpZaPjaIU2z14JR1o3pLvTVvdtRMPGgXLda7xhGL7L
         lGSkHC0u5/uKnQmftklqJAONGwJpZAZV1m/HHfHgdrqcoV1nWIk8A1D8wQklu+Sv+E9o
         w911lAyKLlWNwmtW+OSeT6i8tqTcdrED+6gCwgJtb3MhiA/eLNKE23MuNxxkeVh8jM8T
         SgzQ==
X-Forwarded-Encrypted: i=1; AL+hErHQlXXNGGaZfEedOLlsqiBo6qihd9sPk/UhDZmSAvFX335nXED9LYP72PJCb/IoJMpFORhCghscqYc0dFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9L0yhn+2azX4TekO3buP0PwYACwEn2C2SQzEUEcAe5eGCVxXJq
	kyMg76eSiZ50mfCYctSAt2IOm5cfP8oFFbRjmUmrvS/I/JytWFP5Y21t
X-Gm-Gg: AZFdTZf1DXAWLUKKDtsNc5novWmIl+7tAfoC2bf77LUbGxpRseTRjtUTsG/TmYgB9Lc
	wcoa4r1x32oshlovIdw19CK0nIL6rrIUlkrq0Dv0n0MSDPhUzt9xXR6zLcOG3fefq7aLWi+UxpS
	Qpx6zMpj29TQdk1Mp8xtmVnJBenSIqb0aPug9/sBrrdZqp9d93bsEV/3fQ7vGkTPoEdbOP7Bx7p
	qSgpk+XUvVg/o2xn+ORpFZHZrtE8LkrK0ddB5GupdzHqz3gg8pmW7Lo3XUKfjHF2ZS93wghmPEO
	xmSwXb/y+DDvcMxF44kcBTUCLx+AnZKRldEXvWalSWiVMKiaFVR+xKKH81qALLkk23uL5n+Xj3B
	LZ8V6JvwV0r2z58MwdRMQQN9HBuzJ/fE/sIwjJ8DGwNSU8XJpSq/TvtcXuDdQgSvA+WmSISBxL2
	ZNe1LpTHMoZVPxox7vTJkvB5GKJttpUKJg4Aa0YsaL1uooY4yA6j8kwbVTvwBp02Prf0qQAF8aV
	9U6HpaCs20gktyDTQBIHfGdATULAh9YNmG2nx9ASVjWbbMJralE6TGt0dSOyRMKzJJ0kkeb4Wj6
	UcrC2OLvP837o9rhf55MaB5TMdTtKWk2FHj0t08VqQ==
X-Received: by 2002:a05:600c:5303:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4bb88785d2fmr318267825e9.0.1795557103878;
        Tue, 24 Nov 2026 13:51:43 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:43 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH RESEND v3 1/3] pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
Date: Tue, 24 Nov 2026 21:50:46 +0000
Message-ID: <20261124215048.42074-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-1-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com>
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

prepare_function_table() numbers the IRQ banks from PA, even when PA
has none. The static drivers number only the banks that have IRQs, and
use irq_bank_map when the IRQ registers do not start at bank 0.

Do the same here, and give the A523 and A733, whose IRQ registers
start at PB, the map they need. Apply the map to the A733 register
layout too, which so far ignored it. This also fixes PK on both, which
was numbered 10 and written past the end of irq_array.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c    | 8 +++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h       | 7 ++++---
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index 001bd42afa3e..f71a229926f5 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -17,7 +17,7 @@ static const u8 a523_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 15, 17, 24, 16,  7, 15, 20, 17, 28, 24 };
 
-static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
+static const unsigned int a523_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
 
 static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..3ebe926a1bc6 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
 
+static const unsigned int a733_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
+
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
-	.irq_banks = 10,
+	.irq_banks = ARRAY_SIZE(a733_irq_bank_map),
+	.irq_bank_map = a733_irq_bank_map,
 	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 8bcd566593ae..1577897a0299 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -209,7 +209,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 * The extra functions will be filled in later.
 	 */
 	irq_bank = 0;
-	last_bank = 0;
+	last_bank = -1;
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
 		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
@@ -222,16 +222,14 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 		func[1].muxval = 1;
 
 		if (irq_mux) {
-			if (bank > last_bank)
+			if (last_bank >= 0 && bank > last_bank)
 				irq_bank++;
 			func[lastfunc].muxval = irq_mux;
 			func[lastfunc].irqbank = irq_bank;
 			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
 			func[lastfunc].name = "irq";
-		}
-
-		if (bank > last_bank)
 			last_bank = bank;
+		}
 
 		pin->functions = func;
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 7c2f29e75519..09ebf67767c0 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -257,12 +257,13 @@ static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc,
 
 static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u16 bank)
 {
+	u32 hw_bank = sunxi_irq_hw_bank_num(pctl->desc, bank);
+
 	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
-		return pctl->bank_offset + bank * pctl->bank_mem_size +
+		return pctl->bank_offset + hw_bank * pctl->bank_mem_size +
 		       A733_IRQ_REGS_OFFSET;
 
-	return IRQ_REGS_OFFSET +
-	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
+	return IRQ_REGS_OFFSET + hw_bank * IRQ_MEM_SIZE;
 }
 
 static inline u32 sunxi_irq_cfg_reg(const struct sunxi_pinctrl *pctl,
-- 
2.52.1

