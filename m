Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540257;
	b=GrzlC48TAbAwOFGOKXIvzcXHUVCPIiZfrqPayyBRvt8RnOkSsiD/BylUdvl2n/D3Rgvy
	 4pSGD72gMbdvIilFTMAAgSEvx4D7FAvQ1YphQkJ+bKRNUuSIPfIJXfJuWL95AkwSxcZed
	 hPTd0LNiKzIJ569+tv3Pxn/RcVopcQlMJh0CopJuObwQTue5C03Aba9mpfBhJqMCgTe/D
	 m3zb8lAGANkLtYFookJllx8VQSuWASm1//iZIe72eiz+1ZJdTcZ3FZ97uRoNHE9HVL7tA
	 DN3B5z5qNWvfIRiQKBZBHN92Ejgn+/W8LdASTWYeSwJyxq9ndd6nasWSglTkuK/ZqVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZpsnwIPSBX2ymIHUMpa9KT8hWPzkQMht9fFSCNLgavw=;
	b=pQibM4H6bZIenFqZKBK7NkTNp278j4ja7TOSD44bipBPe46t4WPEKirYLhJdFAlXVGmp
	 ugTpFTvfeDl036u9kqlG4yIqvFOYimb57ozDh9KDK1rJzsjwHFSc2MIMu8mMb76bm6tE7
	 gn3jVvgsqagqK+hmjOf4PmkK0g3i8+hDquhQCSLsrP18lWqKjdVkk6Yz6KaxIJHIFnD2f
	 KQMeCXAP2COupdaUW4gKpJ49F5vZiD9SieADV6ot4EVe46/Rp3SYvCIBw95xGWWpnSfxl
	 u3i5h2/RJhEEJxvZeyAO7tJixZZOCqtAFw9zDIUjz9I7ESoW3M9uNtxoKOwComhOBFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDwXID9M;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DAA60A2614
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91DAA60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDwXID9M
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-85ac281604dso2307871a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540256; x=1796145056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpsnwIPSBX2ymIHUMpa9KT8hWPzkQMht9fFSCNLgavw=;
        b=bDwXID9MvbScZxb5MnX9Q7E7XYzfn4T/NPl8YsROpcIH+sYfuNSIt2epE40Ayy12Xr
         hGY2wF03pnjpS/Sehhz9FJGz7tDKOT7lpEN7gmIgBzkwXWpQlvzjthnCwZjtXX8q/dti
         REB5bm7kIKWSXyi9fkgaZi/CWPWtsIyZI8mktJfd7OcFK4Sc6MTgpbdMMB+9eO+PtN8c
         M1omD50VaIrwHYeJoo4wiZFPxoud+kb98ACPUDUnSprFNr2b/tb1xRCfkq8xZEACq1HN
         sWjQHVfTKF5pqCbfn1Vh5Qsfpc/lhA9KatP7Mr1hVvA7zORRoB4kmbUhnShVjXslIeO1
         Q5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540256; x=1796145056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpsnwIPSBX2ymIHUMpa9KT8hWPzkQMht9fFSCNLgavw=;
        b=DIzb7A+KIwScWqTGbT1D5LxiTdm/5q4T8RgAsVqtqCg7RiTKoigPhZzwQwt8Jgkw4k
         RKjkr79XRsKnwfD9KVj2N3MiPeyzPbAemVx79DWjz3xMccHIwC664q7XjvSTjjHHVNTG
         jFcBfeNw4To5eLn+Q7irKr7NVL3BRn1EgWACRfIOIrUrtRidd+SAU2qLq47Zgrw3ifuq
         wJ6d+h62Jfv+ZkToEFyRStPpRUasZvT7teWVB/UpNyZpCvK7x02FAQC+e9eFB6UGwX3q
         T+9mlL6tT5jxQHXaTWYvzWFPc0l57q+Nkj8g86R4w069NVIYol456ls6uX+4zTMgaD3w
         PpLg==
X-Forwarded-Encrypted: i=1; AL+hErG1g3FzSQ5OR5cq6ll1JTf8HIF0qiPUC2WWjInAWz5hu2m/4In7hRfN9P5ufuAERC4KTQC46Q5jhbxZ8mE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vqbO6oz/dIZnxQueKoUvequKCe1nuO6mm1mbiRytfoIrdgooH
	EBHCtvXnB1Lekcj2JVQv0vQ1BONLHV4bUP8zBL/dhUazeh7v9oeX1dGN
X-Gm-Gg: AZFdTZf3nfymFaELBbKAhQxeaqab2L679dXMXoblCJL/FtGg+cqrHANMmsBFjwqOsvV
	YalHlknTlDMTnnuF98nNkAoKemUuA5tkwLb8qxZ4JpFbwPRGBvOv82dX22OldSCmjjzlervHegM
	IFuIyhdpq4k1P0nJTXr3uyGN/FnUZNrVi60wC1Nkg3NDDOgSLOq8DMHVY4+Vfu1MhhlrCSUzvP/
	vji/NomsRkI03tLGT5jD7dOXG3oHmGDPcAWYFKCCzVRFTxv/sKEWPjQ5EZYQtQiEW8E59qNzWvm
	4r4opV7pYKGZDRarl6kz/LLfJAbLlfRo3r7+myyOh28j0j0/30Eyvhyu2RjRcn4mtJiYaepEdMD
	YrR2v6MCmgFf1bIqR7goNAD1WdWlQnwEY9dpEc9cWJdNiMQkNgnKaFfu4skE/sETx969bkYvUF6
	xEmubI0/da85qiYmgR6+kmGzYA44XahSN1YvCA5kwtq5N5MLhIao1zTL7r3P8wwPCZmqUY+yHTR
	NUSN9KGMbvyJsxMOT4orcmFuevoAxvdD37gfzyS0inYXYJ1h0yRN/sG5us6CoPTetb9v+1QvsGa
	+fyWEs2nrKZQSiA=
X-Received: by 2002:a05:6830:2649:b0:862:b76e:3a73 with SMTP id 46e09a7af769-86315a6d398mr16010581a34.29.1795540256523;
        Tue, 24 Nov 2026 09:10:56 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6besm11131021a34.11.2026.11.24.09.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:10:56 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Wed, 25 Nov 2026 01:10:35 +0800
Subject: [PATCH v2 1/5] pinctrl: tigerlake: add ish_uart groups and
 functions for INTC1055
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
Message-Id: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-1-c8079f8f569f@gmail.com>
References: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
In-Reply-To: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>
X-Mailer: b4 0.13.0

Add ish_uart pin groups & functions in tgllp_soc_data for device id
INTC1055.
The pinctrl-upboard driver set the correct pin function corresponding
to these data.

Signed-off-by: Gary Wang <is0124@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-tigerlake.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
index 93234f4a9bd0..80c847875faf 100644
--- a/drivers/pinctrl/intel/pinctrl-tigerlake.c
+++ b/drivers/pinctrl/intel/pinctrl-tigerlake.c
@@ -333,6 +333,7 @@ static const unsigned int tgllp_i2c0_pins[] = { 5, 6 };
 static const unsigned int tgllp_i2c1_pins[] = { 7, 8 };
 static const unsigned int tgllp_pwm0_pins[] = { 99 };
 static const unsigned int tgllp_uart1_pins[] = { 85, 86, 87, 88 };
+static const unsigned int tgllp_ish_uart_pins[] = { 112, 113, 114, 115 };
 static const unsigned int tgllp_ssp2_pins[] = { 108, 109, 110, 111 };
 
 static const struct intel_pingroup tgllp_groups[] = {
@@ -340,6 +341,7 @@ static const struct intel_pingroup tgllp_groups[] = {
 	PIN_GROUP("i2c1_grp", tgllp_i2c1_pins, 2),
 	PIN_GROUP("pwm0_grp", tgllp_pwm0_pins, 2),
 	PIN_GROUP("uart1_grp", tgllp_uart1_pins, 2),
+	PIN_GROUP("ish_uart_grp", tgllp_ish_uart_pins, 2),
 	PIN_GROUP("ssp2_grp", tgllp_ssp2_pins, 7),
 };
 
@@ -347,6 +349,7 @@ static const char * const tgllp_i2c0_groups[] = { "i2c0_grp" };
 static const char * const tgllp_i2c1_groups[] = { "i2c1_grp" };
 static const char * const tgllp_pwm0_groups[] = { "pwm0_grp" };
 static const char * const tgllp_uart1_groups[] = { "uart1_grp" };
+static const char * const tgllp_ish_uart_groups[] = { "ish_uart_grp" };
 static const char * const tgllp_ssp2_groups[] = { "ssp2_grp" };
 
 static const struct intel_function tgllp_functions[] = {
@@ -354,6 +357,7 @@ static const struct intel_function tgllp_functions[] = {
 	FUNCTION("i2c1", tgllp_i2c1_groups),
 	FUNCTION("pwm0", tgllp_pwm0_groups),
 	FUNCTION("uart1", tgllp_uart1_groups),
+	FUNCTION("ish_uart", tgllp_ish_uart_groups),
 	FUNCTION("ssp2", tgllp_ssp2_groups),
 };
 

-- 
2.43.0

