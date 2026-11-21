Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795283200;
	b=LqfQGeZYAnYRurr4Ko59on5osO46c3PgG6glqAQ9iOi0G7ke7sWl5ojiN89IioDQctUL
	 q0BKCzgK2CAP+Sud6Cr/urKECjW7PqRkJ8N8OT1eQmZHu/kbexjj/8Fg1Q/5d0bwITvyF
	 hst/uJRN+ERm/4iUeCexluUSG0RaM59TJ3c/S3wx3i+Qbe3gPaN3vIYPDovU+mM8QZOzd
	 QxJ9RZF8l9kutX8EjqduPGbOO2wRX0BL6/adjTh9HiUUBZT2mOG8p/WVjk/5GMqsSKaI9
	 fbuVMjHHE5+5C8dD4Y8tU5/xY05XY2vbD8fwsBi7v2Qfam0oLP1owj6V4YOFndQZKeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fjNd46J+nIPFpsHDZsAhjGUwUD3QMtAsvElWh0BXGNs=;
	b=hZmCzsg5nvE/yRox1R/Ibkc79YM9qofmDik33W8EDuIH8GuiFEWXom0J9D/4O+F2nl28
	 I+WAOfioOptR8EhfEb655Gtz0hMicW7bpmOHaQt8M8dFihsqN/b9WtMI81o0YTVbK7w1q
	 kRg4h3wPcf1X0jh7gTP1hVo/o5svzNmPfONcj2WNsZuNWhGar19D0t5Zi0Zg5hQ0KMAZj
	 O7Skw2NMkaexGiuXSBWxTc54I5zDT9eZPKqKDyFp1s+CBuqV+xHTEnLeKIdI3PTABkYeW
	 nsMl4mc4nmd7wYXFX4GcmbhYD2qlV4Mv7b9BdLjW9UGeZ8eYOYi+U+u51vMbB6mhzOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gapp.nthu.edu.tw;
	spf=pass smtp.mailfrom=gapp.nthu.edu.tw;
	dkim=pass header.d=gapp-nthu-edu-tw.20260707.gappssmtp.com header.i=@gapp-nthu-edu-tw.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TAHo4MKx;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329DF606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 329DF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gapp.nthu.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gapp.nthu.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gapp-nthu-edu-tw.20260707.gappssmtp.com header.i=@gapp-nthu-edu-tw.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TAHo4MKx
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so1375799b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gapp-nthu-edu-tw.20260707.gappssmtp.com; s=20260707; t=1795283197; x=1795887997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjNd46J+nIPFpsHDZsAhjGUwUD3QMtAsvElWh0BXGNs=;
        b=TAHo4MKxJE1LRdehpT6CytPalzs4hBRiAfU/vdbn4k5SWGEp8gUGtYaX6OVbufo1Ot
         rvB5vXCgZ9KQ6SQ60J1iPY+lJLmhMQIlSgiQlyi8cjW1yuIw5N77tvzjilhFGUSvEKh4
         lOnodlA5UzDq/+4lQnRA7hyST8PQIja0HQb1f6zekfgdAdRGU0w6AXyJkrgL4uNOhPtt
         T15z7OP5s0Uu0M9kFUvkC1WQK26N6VquPP9zvh83vmLReI67TS7m6P5YlK+CS2leASo+
         bh0M2J0eAOd9/CDWYlBuGBDy8YJ3S9NZyPYUzxyhXCwV3V9OMheqGMP4kpkQaeoimicC
         jM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283197; x=1795887997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjNd46J+nIPFpsHDZsAhjGUwUD3QMtAsvElWh0BXGNs=;
        b=cdjRUdsZvduVvYJu+dUYIeNMZB3Vtfjj6fF4am/xssTpgiwWHFmk3synVc85fAc9PN
         THVXwu7mJnYMyrdbGd0vVCVCbhg4jxf+7ELGTZHNJR4ipiI4ddChRFG1qtTjs9JqbBr6
         HjKH4sz3asUaQdFKNBeep6IyTz6S4Iew8Kh02DX4j/lFt19phNVhTjqzCMVaDABkFNmS
         taMyBMywheXBuT9de2xEzdRIigxEhCIOjsI8p5C+JQX5vODUzGyW+CrCYYciIsoSpFNy
         04RpwSYoyK16ECxyvD+xyEfs3glSeKTURofnAAgcZIzo7LlH15MIHx6OYidPqepf80LQ
         2JbA==
X-Forwarded-Encrypted: i=1; AL+hErHEYlpplcAmrRaAboRyNRo8RMiZI20+TZd/qkCvBP9fdQPbA1vc8ctELtNS5nrLELEEZJwUAcKBpMZq3Vg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lu9+OQ6++Nc7r4HqPdr+PabV86cUz9wo7ufT8RqZjwN/zfORU
	jhkqJDHBjY2Z6dbzQdmh/tYGFRNJtVxZtp60mGddVrC7AK5JMtiMEM1i4tEfxy991FE=
X-Gm-Gg: AZFdTZcb2xQLdkxyBx6+c1ckBTg5odY8QliNPoVq5IHXOdZx/W2Sp2WhtOXgv8gG1Vu
	A1FWX5TKaYsRUmmj2nd7fTmiIlCzv3OfctoBjHpRAYI/BklVAfCqV1zvoDe/1PXXIU7rkF7utNV
	7O3QQurxOcNwm8v/iW4F3PCC1urbJzA5P7Dc+ZjcMyHC6IBrliNOaLfUhs8KqJY/+aU5Y366trR
	janc62G4uQ3poJyhor+PZqN3uuOk5qiJxg219E4Nwm99jImTaIA9gWy0H27T/6KWIyiebpq1uQG
	zmt3k3EdYBQi7H5pcUZpv2k5N5SQHJie5Yi/bm57aqMRqS0wO9g0lrdGWL0Ak8okY9vKbUEjR9X
	D+e0yxaux3DREvBEt2gUzL9dmZKVcp7xuHJLMYxkPLaQHNevn5/aLeb7M1HviTUVGC+pzmFeMn8
	iAUn3Pppb391alEep1Xz3bSlT27jkF9A5IrxS/dQL/o4JQPAE1eYPA2ePodEhy7jadJCcWhd8MN
	4qKJI+LrAzCAMGCWFDTrGptIpwRbxjQhBtC2LkMilMZQt4Pt4+RmQL509k2dVCR7kYL+nYY1wrf
	Z7LZDhMlQsMFhErOwP8a2RL2EJ5BEauUYtB5fmiSR8l7eVQCsUrEavw2HiJQH3BVAQk8kDH1zXB
	04fMiF9X5Yxfggsob3ZUsBlSbEbnGITBA4ijz2kpgR876yX27DFnajXQPszL8oRbp
X-Received: by 2002:a05:6a21:7e83:b0:3fa:d7ac:effb with SMTP id adf61e73a8af0-4014c060f6cmr4572900637.40.1795283197197;
        Sat, 21 Nov 2026 09:46:37 -0800 (PST)
Received: from tomato-cultivator-HP-ZBook-15-G6.. (2001-b400-e3e5-27a4-7997-dbab-03e4-f5ee.emome-ip6.hinet.net. [2001:b400:e3e5:27a4:7997:dbab:3e4:f5ee])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d02ba46sm2651076a12.21.2026.11.21.09.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:46:36 -0800 (PST)
From: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
Subject: [PATCH] gpio: amdpt: Use __func__ instead of hardcoded function names
Date: Sun, 22 Nov 2026 01:45:27 +0800
Message-ID: <20261121174527.19690-1-ku.loong@gapp.nthu.edu.tw>
X-Mailer: git-send-email 2.43.0
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

Replace hardcoded function names with __func__ in the dev_dbg()
messages to fix checkpatch.pl warnings.

No functional changes.

Signed-off-by: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
---
 drivers/gpio/gpio-amdpt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index e886cf9e14ea..54281851a086 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -35,7 +35,7 @@ static int pt_gpio_request(struct gpio_chip *gc, unsigned offset)
 	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
 	u32 using_pins;
 
-	dev_dbg(gc->parent, "pt_gpio_request offset=%x\n", offset);
+	dev_dbg(gc->parent, "%s offset=%x\n", __func__, offset);
 
 	guard(gpio_generic_lock_irqsave)(gen_gc);
 
@@ -63,7 +63,7 @@ static void pt_gpio_free(struct gpio_chip *gc, unsigned offset)
 	using_pins &= ~BIT(offset);
 	writel(using_pins, pt_gpio->reg_base + PT_SYNC_REG);
 
-	dev_dbg(gc->parent, "pt_gpio_free offset=%x\n", offset);
+	dev_dbg(gc->parent, "%s offset=%x\n", __func__, offset);
 }
 
 static int pt_gpio_probe(struct platform_device *pdev)
-- 
2.43.0

