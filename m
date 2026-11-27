Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774066;
	b=KDJ2xoLlyqqQykSGOrTIb8vekwuV69rEL/W/8dWh0GkVXuDGxkfdGHfzRqpVcw+XpRqH
	 H0w11Z5x4ZObunyjVJ4Dpg7MPbwGxJ/v8Zlm+ZZvQwfmYFpqrfDaAZWKXsBNiP6q20EHV
	 vOpY5RL2yK+2W8BKpqo145jAuddAjUnv9TpMYpbHJYantsRe2F4hDiuAgosPX3eN9yzUZ
	 8bZC9dodzfxCJVn485PFfkhpZwuTTqb2NRfhmwps/40dYRxRIiLxgWKZ+YLHeXO5azR3+
	 asyl7hP6rf/9k1+tqwItf9T6Rjn/yzdi8G/OUQExVGWQ7L7v/w39GwUPOwtf1NGCSUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r8jFUXiwbtLGEQsPs14IigckZt/ak7fASs6vSqAKnVg=;
	b=iY7u5IyGRns6kYXU+aKzL0kCx3TlNu75MqdSzkyW77j/nWSjQXejjSrtTjtoXZgZYN0S
	 sSd0rwaYU9WKGUkOv3pHg6hi4bKBklXrjuTTjm0uNJThE6CGOUDbnm0W1968L1yM2c4jY
	 nq6Jv7cTVWcXaMpcxf/JbKI3/NE6+NiWrJIREar0OcA0nTzuY1tDIx7LtsLa+MG81rgzp
	 ktLixUIIh8UpqcpDsGA+YBAnVSNmHNmlbwobxC781gAJdUgoEUp3HM9XpyF0Sx68FKTvt
	 t41mrbbcpntBl4ym507N7XKKDK+o+Me6YXdsydpr5IiTZWWkOHB099bR5geqfEkuFaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzYTgIJd;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8BD606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D8BD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzYTgIJd
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b563e32936so3789754c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774065; x=1796378865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8jFUXiwbtLGEQsPs14IigckZt/ak7fASs6vSqAKnVg=;
        b=dzYTgIJdpufM0y1GczMQ3KPADpnRlHvaT/vswD1OVNnYdLGaEmIZKTO82G5I8k/PE/
         d0e6Umjs1iJgBMlmvzmO0+5am/ZmHqMh4P5G81HrPCnCUjdQJKt9mkWe/OhHT0WRDYLl
         8RYug8Gwt557Ms6ECYpJcqiQ4yuFtVgKsztUozVe40bIcdqLjw8MxrDqExjpTtpYl2dY
         4VWmBJ4eA79pJZerC/VhLti/TB5JVuVrOsbVujUk7ZFzP/mAjzqQNJTa5OL8vigB62Iv
         RpfeA/jNPB8HbUdEKc1yOa9Pbe96EslnOFPa4lXeo/QM1Bs/YMcB+lCO+Obo98oYcSav
         cwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774065; x=1796378865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r8jFUXiwbtLGEQsPs14IigckZt/ak7fASs6vSqAKnVg=;
        b=iTng2bguskOvmKdpcOj3BkQ9WNkP/M5PKqb77tFz49MVwUmKICy21GajQ9EPiiMMiQ
         j+MDyeu0NQvlhrVuG3JRx7f7/dpT2eW0OSapSHQcdyReFs01inG5IWZ7ZRjfKuog//7R
         sbMcRo1WvIR9fyRA9pY2jyDUrZoU7yXEdLm/67xWUNrwDsOfPoTcamFqT0ETuKIWUaO7
         dYHkuumq/BCW7SPhSaeXXWQxl6Ad2wIEo3TOUUOgQPLEFs7VGQtpYiDIU7FpK7iCg9Mf
         T0Wt2MphYF//z1EhEboYm+dfzMm7PnM1JpjRD4o0hZ8g+aStV8efOMciduuGYticF6lX
         KYmQ==
X-Forwarded-Encrypted: i=1; AL+hErFmO3gtNO4dm27h84IMqwPoAvr5665WjQ01kgqMVe03d7Zccy5a4Vkp/XiZol3T6Pjeipk1MVreGsDjyFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iKg+LA0jtp2jJ4IE7d22zaMPwfgZmrxyJALhsqGs1mNlYqMeD
	JmJwBx83urQ+zQK+mhUIWBp4si0hz3uQAkeaHg1KpuWTDJgm3Mjimc9Y
X-Gm-Gg: AZFdTZfb1lZBl+LDx86jDRdo7SCtvkY8yBb019Ap/jl9Q3NlyNv0rSjxQeJmXujHaw0
	YSjFPsUAhlP9a6tsxUHWakXDjOWTS0m2QHFU6DvbggTUA5ikscT55cGsxiWswdJtAz5cDGSv/qi
	600Yq5NbeZSk48tG/ybxQnxRxABVywInvSXsv8tLdOlFQ8mOCpzX+jnGLPpYKorWsPJnMXlU0xE
	+9A4SNhsvIdxVECvXFqE2GQY38duKuvIPLSDQlfACE12BPyQia6e69F71bIWgGVKVBPVtUwRXMD
	R+ggvK8T6m7wvavCAVDXtQBd2jJkBY3u9Xj6ZULCgxt75j9wOndeuK7KQ00QIm76EXcYK8faBH7
	GddiVJXt+Q4FhApYAvUIgC+FR6lPaDNPRk/fuKPp/dTc58/Yx4MIFCXma1Jhg4IQ7q4Ce+s0E9I
	p+rwChwI94osH8Fjkf0thT2JmuKUYVl2u65XSxyQNxTnIiM5W/lwxFJ9IBG6MIf1SyZ1JgHVvHc
	VXWiDxu6bLpxaC6uMUqzGsDHINlVupwnq5rtFJajYr48x040xlNGhOcRnYwegCQBJGBEZzhh0xl
	sCG70vEPdBW9vfsOKxhKFf5kN/pjeKAZTLbiOR4AeDcUF4LYl3dY
X-Received: by 2002:a05:701b:42d4:20b0:1b5:43d8:b82a with SMTP id a92af1059eb24-1b55689e7b7mr23163707c88.9.1795774064568;
        Fri, 27 Nov 2026 02:07:44 -0800 (PST)
Received: from localhost.localdomain ([103.177.252.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm62858991c88.13.2026.11.27.02.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:07:44 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	perex@perex.cz,
	tiwai@suse.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: atmel: ac97c: fix reset GPIO error handling
Date: Fri, 27 Nov 2026 10:06:45 +0000
Message-ID: <20261127100645.3564-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261127095029.3280-1-sreekuttan2156239@gmail.com>
References: <20261127095029.3280-1-sreekuttan2156239@gmail.com>
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

The driver currently ignores errors returned by
devm_gpiod_get_index() and continues probing. This can cause problems
when the GPIO provider is not ready and the function returns
-EPROBE_DEFER.

Use devm_gpiod_get_index_optional() to handle the reset GPIO as
optional. If the GPIO is not available, the driver can continue using
the internal reset mechanism. If GPIO acquisition fails for another
reason, return the error using dev_err_probe().

Also, check the GPIO descriptor for NULL in atmel_ac97c_reset(),
because the optional GPIO API returns NULL when no GPIO is assigned.

Fixes: 5f10e84934e4 ("ALSA: atmel: convert AC97c driver to GPIO descriptor API")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add Fixes trailer.

 sound/atmel/ac97c.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index 234549e17351..3ab6ddb3259f 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -670,7 +670,7 @@ static void atmel_ac97c_reset(struct atmel_ac97c *chip)
 	ac97c_writel(chip, CAMR, 0);
 	ac97c_writel(chip, COMR, 0);
 
-	if (!IS_ERR(chip->reset_pin)) {
+	if (chip->reset_pin) {
 		gpiod_set_value(chip->reset_pin, 0);
 		/* AC97 v2.2 specifications says minimum 1 us. */
 		udelay(2);
@@ -743,9 +743,13 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	chip->pdev = pdev;
 	chip->regs = regs;
 
-	chip->reset_pin = devm_gpiod_get_index(dev, "ac97", 2, GPIOD_OUT_HIGH);
+	chip->reset_pin = devm_gpiod_get_index_optional(dev,
+							"ac97", 2,
+							GPIOD_OUT_HIGH);
 	if (IS_ERR(chip->reset_pin))
-		dev_dbg(dev, "reset pin not available\n");
+		return dev_err_probe(dev,
+				     PTR_ERR(chip->reset_pin),
+				     "failed to get reset GPIO\n");
 
 	atmel_ac97c_reset(chip);
 
-- 
2.55.0

