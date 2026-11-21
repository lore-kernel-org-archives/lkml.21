Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233361;
	b=08vY4dXZG2PtMjnGO95ZQCcVWpNTslXwCD9wjb9w2ocgJ3vJ4+i7fvSMRIdVAN65673B
	 kykN+bqCo2QsGjuUx4KbmvzT0ijpKijZ8WX/hvHwAGk13Rhr30OIpohX82hxGAGkTpMKL
	 fx49fuoH7Y9r9jngAx17ix4qi28A2mkKojnKv7O3BFRusGyRnL8rVGRVobSijbOF44MVr
	 aC+iY3T3W5FDFBOmQP//Rz8/lOz9PQTxeQ3kTtTzV+p1YIkYCDQWoXEh2fWojEWWvpf8J
	 ev280KZXverJ8GQmv5h7anx+wALtlkEPt2+VSj47hmihvggf/7VSILpq8sS4mzihTtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZuGEAzWS3xcIcvSu/cuY37PG3g4bSwO/xoH2Fm6M/Eo=;
	b=04IOlDRihtfjsj26wPo6/O/uLs7YbwAaYJ9DVLS7rG100dzQdZSXvGmfnp6OIdMj9czr
	 UQOf73CJpkBZ0k9gkMZcW9fzjq4OkpGG0TIJ7ohnVdc7tpQ03h2JVgcQMtJrijYl5gVz1
	 ZU/1IKuim8JCzPQzkOUtOuTFzPMFrd4b2GLkurliSpGudForj/CaqNRsj7GPFqOGcyiRw
	 NSSoqqxEWPeEtkXVhe9FkRmXM3YH84xC1DA4Wm96j1esyoMv6Vqa0Tg7zXrUPKaQiqOvW
	 3oidgCObKd1Qz9P6FPpK4x/sil8LDX1Z5c35+WgjoUHcEJUzQkLKO3xtsFYaEXI9F8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="u4E/dKTK";
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519B860A2610
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 519B860A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u4E/dKTK
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8629ef48703so902303a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233356; x=1795838156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuGEAzWS3xcIcvSu/cuY37PG3g4bSwO/xoH2Fm6M/Eo=;
        b=u4E/dKTKtcwE3wAVyt2IeSMyuej0OsnaZnnOcwcl7gRRe6OseQ96iSIEbmoga3jc8y
         KpD5Y0GVkPD6LXLpGe0amAV1oNHKaZtNWMRMl4YgDfB3opcftNzDDDKtr7TCLY+RdtFv
         LEGM/bqSLaoULci5qbs4RJf9ipR6r1XGg01aJ5q18zmY0UyZxtUk6E++wXUM1vE4P4Uh
         Kkbri8opAFff5D17bJJgAWQs7VPdNA1YLb0T3yhdvAQyZOFlyRCkarP3RJFBF3rKumgT
         DZWsHmOSxITuATjA5J3AQyjxGR1aXnK0j7OWDmrDyt6Yf2TZBKtZyDEcZe4LxqlqJBIy
         jVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233356; x=1795838156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuGEAzWS3xcIcvSu/cuY37PG3g4bSwO/xoH2Fm6M/Eo=;
        b=h8u8Oo1SFIm2xqMNSKnl5E6lEZH9k9er9LaEk8QgDZ3wkhesnPnyRgYA8gecMFmYx/
         YQpMZNyZEn/t3EKiQIEl+yIGu7AVSZ6anPI7R1BH9485BSG2IT/qmfrO/R1w3oQvRqLs
         qyRSb4IGV88L+l/Q4Kochpfm+oMHQdSbJ3/noQufStt1efKNw9ghSmobe6fdXO65ChQU
         bqQXwER2fMtV6EqUGC4GGtToerJnO/uTtjI1opH7L5jMICRaORIW1/LPde+z/iyVJIxO
         TrUBEk/+e9qFzV3prCG27OjoCRIq46mQFRfag0i8+UYZwXFUIKvMG6PWe149R9CLlQsn
         zkLQ==
X-Gm-Message-State: APuU4Z/+/QYcmZqW+A3WNIGcGEv6XpDN4i2A4TrtA2MrGX9PW5hBdkVs
	qlBMgu+43ACtb8eof7RgBdvGNOo5rdIVhYacjxoA54O/pPncf5M8W+s=
X-Gm-Gg: AYBFou27a7ApyQHFtkePNPLT0BkM9Twz725EL7glY9NG/S5l726V8Wm6LP9/LIS4cYN
	Escb649lvoSUJGSL7MtmDr4zW6GQSAUlL5Ej1YpFw0Mkq4T31vqFLqByBf/AuF/XbhDm3D4tK9K
	vfploMMhFdaEjwEBX9QBA1n1K7PlQRSmcYvr9BB0MtRKxn24apw0CFo1J2xweHoDLPxrmwsSkoV
	b3WZxsaX5H5TqSlHi5SKwL88vKZF3gLpfKn+4k9j2ZewOrI/IiB4nLYld86kjSFvCqKtvvgL7hL
	ZKivdXn3sDTGplwc/77RLGfCwoAB1xRrFTHUywBnHD8Oa6++ox2SCfBNV7bveGQ2RKyBhlpBRFE
	o10JfZkOZI+dZqRuLbkScUDYn6EmMMpiMqbNw8lTFWmakzPsZ5VyvrWeoDq027y20tEUxhCrezc
	TI2v2byE0PG/STqCJ6K/EnLeHdBN0BTkCjSVuN8vTqVxUFvjfEJDe42wJzbehmsHTtCAxGZTf2d
	ECE5Z9zXEGB88lo5yBz83LwdlxgHtfom0FquIjaW5P0lKTB+sTPxL/M2OxxZwODgnJTK2BluhWY
	nmgInBB+CYa2VqOl77DHDo4JvT1x1IFt3qrSqXjmB/nm8fgUb/tDnO82
X-Received: by 2002:a05:6820:80e:b0:71a:e1a9:4b74 with SMTP id 006d021491bc7-71b39616d74mr4329743eaf.72.1795233356164;
        Fri, 20 Nov 2026 19:55:56 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:55:54 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 07/12] media: tw9900: power down analog blocks in runtime suspend
Date: Fri, 20 Nov 2026 21:55:18 -0600
Message-ID: <20261121035523.26764-8-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121035523.26764-1-matthew.laux@gmail.com>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
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

On boards without a controllable supply or reset GPIO, runtime suspend
leaves the decoder fully powered. Set the CLK/Y/C power-down bits in
ANALOG_CTL and the PLL power-down bit in ANAL_CTL_II before cutting
power. Runtime resume rewrites both registers from the init table.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 585509c1b41d..b2b754e898c2 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -34,6 +34,9 @@
 #define TW9900_REG_CKHY_HSDLY			0x04
 #define TW9900_REG_OUT_CTRL_I			0x05
 #define TW9900_REG_ANALOG_CTL			0x06
+#define TW9900_REG_ANALOG_CTL_CLK_PDN		BIT(3)
+#define TW9900_REG_ANALOG_CTL_Y_PDN		BIT(2)
+#define TW9900_REG_ANALOG_CTL_C_PDN		BIT(1)
 #define TW9900_REG_CROP_HI			0x07
 #define TW9900_REG_VDELAY_LO			0x08
 #define TW9900_REG_VACTIVE_LO			0x09
@@ -48,6 +51,7 @@
 #define TW9900_REG_HUE				0x15
 #define TW9900_REG_VBI_CNTL			0x19
 #define TW9900_REG_ANAL_CTL_II			0x1A
+#define TW9900_REG_ANAL_CTL_II_PLL_PDN		BIT(6)
 #define TW9900_REG_OUT_CTRL_II			0x1B
 #define TW9900_REG_STD				0x1C
 #define TW9900_REG_STD_AUTO_PROGRESS		BIT(7)
@@ -689,6 +693,13 @@ static int tw9900_runtime_suspend(struct device *dev)
 
 	mutex_lock(&tw9900->mutex);
 
+	tw9900_write_reg(tw9900->client, TW9900_REG_ANALOG_CTL,
+			 TW9900_REG_ANALOG_CTL_CLK_PDN |
+			 TW9900_REG_ANALOG_CTL_Y_PDN |
+			 TW9900_REG_ANALOG_CTL_C_PDN);
+	tw9900_write_reg(tw9900->client, TW9900_REG_ANAL_CTL_II,
+			 TW9900_REG_ANAL_CTL_II_PLL_PDN);
+
 	if (tw9900->reset_gpio)
 		gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
 
-- 
2.47.3

