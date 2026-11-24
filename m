Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795496485;
	b=IjgKjFoD2QFDDNTB64fQ+JxtwcLNTUb/460GF8pruesiHGV29UuRIYfAK6zFBBMSwvD/
	 lafqenTMCIvEnCm9krFjTTJi6+su5JVpk/1Ym0pE33EADMrmN9g1ZHInkzUh1q4yg1OPO
	 LetzyNMBv18ywoFlGo7acb+9vQPii0p4h7YZKEosRZwZvjNISsT/Zy7Oe308OeRCFJaKn
	 YtStOEI3Pdtd5Rdx/lDAotZiy/DsiD0/pdrTTUjVp6Rs6+GErTZ82pXh5aPzh8Btrx5rR
	 IIbCsSOQhXpooRP6xfx2+Ed+dVtwQ6C+h7J+5RGAL411/HL5dbdzAUDkc0T3lPOXrTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Vs2X3vFXBgQuWTNtNhfJh5Gfnrco9rGsYZYJIbU5LNg=;
	b=zEL+JEnSANuCDDCydkc9MrXfw5OATgNrIZHb8mGR74VUitUsqYcOs4/otbwzeUB6HZdx
	 5+1AssvPy+2wLSBw8ijT7qyFk4D5+1dtphz4JY+QoCTJe21+cdLhuZKdRdQQV5N/5wE7G
	 C0HnmasC0LQReiMfUWII9gSdfdWLV2FYnX5PYohGrv8SscqEd82+1EjjJChOKALEGyfs7
	 zI1QuOegExw0UQEJcRrTI4i/c9zPTy3u7MSf3PugAeNLrYUroo15sWYkNAVX4VKWK0w1D
	 zHt5PvQwh2GIcFeGec77wXDTgTbm7a3nA0ZElMoY3a7RVfuLSuRF26Zt3d51LDFguAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WuzjfOOG;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA267606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA267606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WuzjfOOG
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so42602735e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795496483; x=1796101283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vs2X3vFXBgQuWTNtNhfJh5Gfnrco9rGsYZYJIbU5LNg=;
        b=WuzjfOOGCFqsF4B3uCWv0lke2vzIM9DvBzCEPmRRrrzCd7ohSU3hsTghjaUrgjmfTp
         0E5gMNbVoB2y1lM+yCa+wksZXyC769hqiOYKNJeEAla122fcwpjLQABYCXczYetuPOOB
         889d5I8iH/ON/RgIWF+e8y8WrWb2SjuuHJBb+I0cWD5YohvpMCPQViGqcdS4RaWqzFcp
         sqofC67CEdG7UJwWLcZjZRSkXSsuabAyZ5KlaYbhFyx9gccSAp8zjz76Vp2+wzvVPOB0
         CBbhZbGNlyztzF+qswzGw/Sh6VzK/FcEXgcE3Liud7l0vScsp425Db3eXu5l3B5+gkdR
         tfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795496483; x=1796101283;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vs2X3vFXBgQuWTNtNhfJh5Gfnrco9rGsYZYJIbU5LNg=;
        b=07MXjS1v2hCThC4VqwbeuzjQHVHmc5nqLeCujbYtnKAsztus1zQzKLUx0Zs52Y2dl9
         Yn9Dxcpn7vB66HltzzOlLAyzYJWZBwAHJmp7yYsX7LwvfR2rsLeSwLzZh/eIKhLgemrT
         0WuZVo/DkE5xEkBij/nY4RmGBzRnNTJ3K5iuaHFo0D2IbtSh8z7qpAzT9JQun578szQJ
         SE7PSv7nXRdhmmwdfJU091EWic8+Fw5Mvs6ZGZqQ2Yh9BoMizBI5NiiHIoFfV3inkbWI
         74a3bFSzxSbUtd9SSrxjwsAEeXgNl7Tz8ZkNJ5kFpwfddsjaaL6euIHY50PbowbCnNW0
         MhoA==
X-Forwarded-Encrypted: i=1; AL+hErHJHgElC7Ub8ek3SrNAwFPS6+SqNB4YmAQs6woln24IEZZ3Cxz1ugbxRPNDzV9o2wzF42zyUy4IhnWrnPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mZRcn7TpAtAQC8XTahg2uS7RqTtiofQouH+5oLBecwhUwfDPH
	dnzNzIV+5VNLqLnafNg4baIB+TD37MaZE5nLfOj7hhlBpYVR4WIOoZri
X-Gm-Gg: AZFdTZe/TcyIGYg/R9Rq0PK5xxTS6G2vTgb1h+MYF5oVlO9YC9+1FP0BRS/OYxX+nEU
	8bkc2h7eZD+f5M0CbFgBw4AXvhgyNVGK/y/EKrFskxBL0hF2nHjl3NUiOuxrOoILN3pKVQYVW0K
	bL97e0+Go+Tky5cxpnqePXBlA5hPCD3Ro0SfwnoUqaIhbPXhOkUf1NOgu4YQluIAtb53dL6CGFu
	ZjPqI9kwlX0XCy5uWWoa/r7LL5s1F0qUK5pTkBLGSp2FjohcEShCPiFjAHiDg4xvFadLy89P18N
	kifnbBJ28/gjmcARyEIHV1wrOZ4QWlMURL3IR5k/sHd6+HW9YM1xQVToMrbaij8gMgvbOhNdSMN
	W78CCHzWhJciuac4dSuyrArmhiFFDcOC39lUKpOfMaLugpwAUJq3U1tL8gP5X1KaW4AdZXxwSeN
	106Qw9TmkQlW6s5UIzmEaGnMpmX0bFDegYKn9rd2OZSnL3t/8qm/I617MPRaQUl7T0jOhz4mLWg
	W+3yMIdaLaN7jxsd4nzYqYlM4XYt7YYZJcZhx0vrejpADNaeWqF3+rEhRQKtuapYdpf2qM8hs/X
	NV2mTUxhnOnQRzVL64Xvfd0MratlweYNJdelspo5fWvQ+Pbw/6+/ooPGoSzAuQix9ZsmwTn6RlU
	9TR/AM7dUL8StbPuxC4HLcL9ATJjeKaO/V6Ch+SqbMRFR8adDY3QTFPcgLvkxgrBRkOLZzu9lxa
	nKDndPw4cUzBywvxElxG4/apQoLFHHIx6c/r3zAi7e/sJOh2vbOwnZ
X-Received: by 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr278328245e9.12.1795496483167;
        Mon, 23 Nov 2026 21:01:23 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-f512-85ee-fdbe-0621.ipv6.o2.cz. [2a00:1028:8388:a84e:f512:85ee:fdbe:621])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm353489155e9.1.2026.11.23.21.01.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 21:01:22 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] watchdog: max63xx_wdt: Add support for specifying WDI logic via GPIO
Date: Tue, 24 Nov 2026 06:01:17 +0100
Message-ID: <20261124050118.87944-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124050118.87944-1-pepe.schlehofer@gmail.com>
References: <20261124050118.87944-1-pepe.schlehofer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pali Rohár <pali@kernel.org>

On some boards the WDI (watchdog input) pin of the chip is connected to
a GPIO, and only the SET pins are mapped to the register.

Take the GPIO from the optional wdi-gpios property. When it is present,
ping the watchdog through it instead of the register.

Signed-off-by: Pali Rohár <pali@kernel.org>
[pepe.schlehofer@gmail.com: use wdi-gpios, request the GPIO as an output
 with devm_gpiod_get_optional(), ping without the lock, include
 linux/delay.h, update the header comment]
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---

Notes:
    Changes in v4:
    - take the GPIO from wdi-gpios
    - request it with devm_gpiod_get_optional() (Tzung-Bi) and
      GPIOD_OUT_LOW. v3 passed GPIOD_FLAGS_BIT_DIR_OUT alone, which sets
      no direction
    - ping without the lock, with gpiod_set_value_cansleep() (Tzung-Bi,
      Guenter)
    - include linux/delay.h (Tzung-Bi)
    - print the error once (Tzung-Bi)
    - say in the commit message that the GPIO replaces the register for
      the ping (Tzung-Bi)
    - update the comment at the top of the file
    
    Changes in v3:
    * Use gpiod_set_value()
    Changes in v2:
    * Usage of dev_err_probe()
    * Fixing assignment of wdt->ping
    * Remove clearing of wdt->gpio_wdi
    * Move YAML change to separate patch

 drivers/watchdog/max63xx_wdt.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/max63xx_wdt.c b/drivers/watchdog/max63xx_wdt.c
index 9e46b86b9b20..482cf9f6bd6e 100644
--- a/drivers/watchdog/max63xx_wdt.c
+++ b/drivers/watchdog/max63xx_wdt.c
@@ -7,8 +7,9 @@
  * Copyright (C) 2009 Marc Zyngier <maz@misterjones.org>
  *
  * This driver assumes the watchdog pins are memory mapped (as it is
- * the case for the Arcom Zeus). Should it be connected over GPIOs or
- * another interface, some abstraction will have to be introduced.
+ * the case for the Arcom Zeus). The WDI pin can be connected to a GPIO
+ * instead. Should the other pins be connected over GPIOs or another
+ * interface, some abstraction will have to be introduced.
  */
 
 #include <linux/err.h>
@@ -18,6 +19,8 @@
 #include <linux/kernel.h>
 #include <linux/watchdog.h>
 #include <linux/bitops.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/io.h>
@@ -50,6 +53,9 @@ struct max63xx_wdt {
 	void __iomem *base;
 	spinlock_t lock;
 
+	/* optional GPIO connected to the WDI pin */
+	struct gpio_desc *gpio_wdi;
+
 	/* WDI and WSET bits write access routines */
 	void (*ping)(struct max63xx_wdt *wdt);
 	void (*set)(struct max63xx_wdt *wdt, u8 set);
@@ -155,6 +161,13 @@ static const struct watchdog_info max63xx_wdt_info = {
 	.identity = "max63xx Watchdog",
 };
 
+static void max63xx_gpio_ping(struct max63xx_wdt *wdt)
+{
+	gpiod_set_value_cansleep(wdt->gpio_wdi, 1);
+	udelay(1);
+	gpiod_set_value_cansleep(wdt->gpio_wdi, 0);
+}
+
 static void max63xx_mmap_ping(struct max63xx_wdt *wdt)
 {
 	u8 val;
@@ -226,6 +239,13 @@ static int max63xx_wdt_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	wdt->gpio_wdi = devm_gpiod_get_optional(dev, "wdi", GPIOD_OUT_LOW);
+	if (IS_ERR(wdt->gpio_wdi))
+		return dev_err_probe(dev, PTR_ERR(wdt->gpio_wdi),
+				     "failed to get the WDI GPIO\n");
+	if (wdt->gpio_wdi)
+		wdt->ping = max63xx_gpio_ping;
+
 	platform_set_drvdata(pdev, &wdt->wdd);
 	watchdog_set_drvdata(&wdt->wdd, wdt);
 
-- 
2.54.0 (Apple Git-157)

