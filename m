Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527424;
	b=bexUrch+wS6Sbz5RlHMrQPKQSUSkVfO0ESN9MHkL8wHmNxx4mOzX5Pf4dG8t6uLXf+5E
	 aVaX4ht+cWwwSDLD0NCvupFB6BQHYksTJ2yfkHwPsMFNtR8MkjSdu32EvdTzqW9tA6Uu1
	 js8Ad+f1TPoaRUFYajNuMJ9FWmgNP440f+pikB6AOFrhvTDCSPlbH1ouOLhwncCoheesc
	 UE8AwF0JqTM5Z+1iKoEH74ZmH59ZByWr7HX7OhwYe/3pjKwv880sD5y7QOOKpcwuFTBzf
	 5FMIYvLJ4s9j1pr4lxk3eA9Cs8H/rOkNryV9TxPboOLveiDqa/Z5EhGIrrtuZ/MvCLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3MEgTk7j9nX99QBZKWtEZb/AYxV2KoXFIEW317dyB6Q=;
	b=Ykhkq5zN2gPpjA1d5Oi0m67cAQI1aNEDcAHhC/ha96CVe+BE07X0pRt6jGszrimt/4GN
	 hn27FeRSw9OuGxh2XhVY3fMt3fUDXktv/+1Nqw6n2O1Rg2IH3kH3HVa07+alK7VZSp9yw
	 dj0jHfm5oWdnkUrHIqn+BGZ2Vzy9I2vELEYhNROnXicRjVNnYMnZTnWB96HerbikUxvG9
	 3FNJk/a3HvG57uPfyYzshfCSpW3g6uSrmxB0eMUnwxyUEYq4mvHxWSfgcafFe+IYLVTcD
	 Xq7R65nIc05q53HMwt6vqp/iShgHaz3c3ebYOSsuAUIJ8lJoFkFPAXkTBOtJPPkgcrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TL6LTV1/";
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E175B606A337
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E175B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TL6LTV1/
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9215934a14cso20576156d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795527423; x=1796132223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MEgTk7j9nX99QBZKWtEZb/AYxV2KoXFIEW317dyB6Q=;
        b=TL6LTV1/L22QmJ7upT+HDhDi3vgzK0PwLMhx1CAqua2uY3Tcq4fNgH9boDBYKrOf0I
         yst/a+bUnIhuVCl3j2kgoDwFCUtYnnBB72jjcgXuE367gJgMOUp5ngYCIv8MrvSA7gtr
         7QiBBRHRPsUe8v3hh+Qy1A2Op/ENYF5aZzbFhECkf2gP7sjA+H+P0/Taa+wpzQ46eeV6
         6EttxW7eG/bATwBFGM8wd9gj8yo/ALRNW0J32YznHA+pNB/Pca62ZwbeXc66aMJi+VfK
         Qy5PS5Y6p2h4OxqWulqoh/lNcX8mRp7VS6OOO8qFTssKOlTGzeBSwhiqmEve9D8/MgTr
         PKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527423; x=1796132223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3MEgTk7j9nX99QBZKWtEZb/AYxV2KoXFIEW317dyB6Q=;
        b=CSSoi9Xf3/mg5EwLqMY3fzwNecbwjnFrvVNQnBKPQuBb3vE9XpY03h1iiAu2JtkYX6
         u6fTwfhxUrOqzCKqx6pS+lhmkta4gDnUnvLF4jVtpykZ6/gsOr96zhb7gyiXnNzkURKb
         vyF7X+V6xW7VLzBMWoX4jGyj7cuFkOyR1QHAv+kBkoOuF3PVfiSwg9bn0mBgLDqnNUrb
         vF7BZtIRGk23c4imZBvovApdnrlB+uuODVRS56ZgpjMA7nr7nTyowx1VIlpaZliVrghF
         7dH6R0mpY63nOqYaY10z3/dBd/mDwdjoyi5wB2Dl5vhNxwSJlpWDeKagdmFrPHOUrdYf
         9kvw==
X-Forwarded-Encrypted: i=1; AL+hErHh0Ikxj6iep8rFkzHqQZm2h1LBMKkvNjQ5emy0swWCVDuuyJqFvxeIBoAOyPVHAGXTjl52m5KJNt+W+M0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a4zTqkC9pM8CZsDAXch3anZixZmVPvCWJWRmLtve86JxAQ16Z
	HcbRONXmNLCzlS/9NyTeeYyzA/tc+KU2OJTKaUt/qUnpq2UgbUidN3vn
X-Gm-Gg: AZFdTZcw23e5e5O/zXiBOZhixLYs4o32I6JHSTIsoytUS0uJrG71MqcEPZigN2Sm4zS
	YU12oAEH6DgCtlYf9G74D0C0tNPHg+WEwgXqpAeHRvyT4hP9Bj+hmNfGkyei5fuHKnoSF1qxaK3
	o9aMT7JsdwJMcrT+Nrxdf49Fbl5NNXwIlbqVUET1+Cr/4Lk5ye0GvmGS+hTaIAtVEcggDq164OG
	JQg04kDIeJ1noCF0ynCJDwDo4EOj4YTJsyvutnXKsluPbMq1f+eupou8rHJUu3mS+8tHfmphL5C
	nQfnbQ6dc/Qq/HXtvRcTml9e+ECbVnqADey10FFVoJZuArmh5DawqY0mfAsIkMOP2zWMS67jYaZ
	5hotUwN24ZOvF2Cg8T3c/COr9cF8ArFvcgvmLpftxUhXdDKUXGmnkOtQnikf4/gSZahtKoV/VsX
	mK0JgIVN7AH+JQdMqSsuTgwwJ4bqFxKMqRt4lFKNXSsRuOwFPJK0HHf/50mQAP+DunisIVWZBZ9
	jB6bgMmm5fXTeqg3k7N725PkmibQc6BE5pLR08JeKkw3gMI0Q2WLYIk5AawX3zMy+ZbKohP31n7
	6Vyc0KbqXdvs9UMTAVUuV4LR7Q8TE6tZ0gN2M/kGHt6fSJU0i90SXnRACa/HPirC
X-Received: by 2002:a05:6214:8504:20b0:920:fd27:87df with SMTP id 6a1803df08f44-92134abf65bmr195937166d6.48.1795527422777;
        Tue, 24 Nov 2026 05:37:02 -0800 (PST)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d383asm133834536d6.22.2026.11.24.05.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:37:02 -0800 (PST)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	j-keerthy@ti.com,
	nsekhar@ti.com,
	prabhakar.csengg@gmail.com,
	avinashphilip@ti.com,
	sujithkv@ti.com
Subject: [PATCH v2 1/2] gpio: davinci: use controller-specific MMIO for BINTEN
Date: Tue, 24 Nov 2026 19:06:53 +0530
Message-ID: <20261124121500.2cd5cbf30f89-2-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124121500.2cd5cbf30f89-1-sahaj123.sc@gmail.com>
References: <20261124121500.2cd5cbf30f89-1-sahaj123.sc@gmail.com>
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

The file-global gpio_base can be overwritten when probes for multiple
DaVinci GPIO controllers overlap. The later IRQ setup can then write the
BINTEN register of a different controller.

Derive the BINTEN address from the current controller's mapped bank
instead of shared global state.

Fixes: 118150f22d6b ("gpio: davinci: move to platform device")
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
Changes in v2:
- Rebase onto GPIO gpio/for-next after the devm_kzalloc_obj() conversion.
  The fix itself is unchanged.
- Add Linus Walleij's Reviewed-by.

Previous version:
https://lore.kernel.org/all/20261109194910.2282454-2-sahaj123.sc@gmail.com/

Testing:
- ARM64 W=1 driver build and mocked nested-probe regression passed.
- Instrumented AM642 baseline selected two wrong BINTEN targets during
  forced probe interleaving; the fixed series selected all three correctly.
  See the cover letter for test scope and limitations.

 drivers/gpio/gpio-davinci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index b80c1a27d591..7961ddee9f40 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -43,7 +43,6 @@ typedef struct irq_chip *(*gpio_get_irq_chip_cb_t)(unsigned int irq);
 
 #define BINTEN	0x8 /* GPIO Interrupt Per-Bank Enable Register */
 
-static void __iomem *gpio_base;
 static unsigned int offset_array[5] = {0x10, 0x38, 0x60, 0x88, 0xb0};
 
 struct davinci_gpio_irq_data {
@@ -168,6 +167,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	unsigned int ngpio, nbank, nirq, gpio_unbanked;
 	struct davinci_gpio_controller *chips;
 	struct device *dev = &pdev->dev;
+	void __iomem *gpio_base;
 
 	/*
 	 * The gpio banks conceptually expose a segmented bitmap,
@@ -586,7 +586,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	 * BINTEN -- per-bank interrupt enable. genirq would also let these
 	 * bits be set/cleared dynamically.
 	 */
-	writel_relaxed(binten, gpio_base + BINTEN);
+	writel_relaxed(binten, chips->regs[0] - offset_array[0] + BINTEN);
 
 	return 0;
 }
-- 
2.43.0

