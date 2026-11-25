Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616315;
	b=EjKoXyQHDOommPruG4VQhzP2bpRCk90C/UqsQoyLtBSKBsF5nzWx+3nLjWXxDvz9LCVp
	 r7T1b1NVN4uQxzbXI33Qqan4g3MGE/SC5iMLwtB50FMeKnKAN2AIEQ8MqYVkE7QdNDHca
	 U0GSGFCSB9W7yO8fO/uIwZDLIRMcLTFWxoiZxcHlR0SluT6zS2xBrHGBdmm7uXTTSUzY8
	 u63ccEKQNoRb/KL7F/xBbqzhlkuRyYrKQfbWGrbJv6eWDuGNUyvK//yYN2cHUq01LGjUF
	 ajZQTRjvH2X82i+EvOL2yh8MlJSbDE7EMEiH/pO+rXEwwPLatWkUvOW2M5LunJR0j+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B14YIwzQj4vDx9qqNqeB3s7xtGauzc15dvusC2lDAYc=;
	b=ydaYC09UDsm4dzYFHLYHvyGTBMPpDuJwyyjUEfsizw12XuXuXSlZ3quzOhPtfOQD4jZx
	 8x8//r2DbXMsUDWtVLqoM79Srg3PzXqDXY2X76T83zcRLWUghSQfyWF5HaMv640/f74Oc
	 dt50UMQRekNxDgahGyCWi4mUyF2Cla1VrWdeKzawCXp1O+du077FUbEnDFwpnRSzlORQc
	 FJINLIIowic0cYtE9inO8O3RSgw/qrYGTlZaxI3WVyyd6wFO/v4sxlV0aNS5w3wRlkM81
	 npid5W/zCwdc3waYEQoF5d35T1zXbXEkEbsV4lMdd0QidMtYvOX5EBypkgxr46prGwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MAkkS5pG;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F648606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F648606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MAkkS5pG
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so5146566f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795616313; x=1796221113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B14YIwzQj4vDx9qqNqeB3s7xtGauzc15dvusC2lDAYc=;
        b=MAkkS5pGJ5ZcA3OBtd0RPk9BwpbXkXU75vgh0m6Km4IbLeVq41uQDaqMdg/EovcFiL
         28xscedIPYM+3zPVs8hkZf8HXLT9RpVjP/S5eTrvmNPbr7yNkWlwy2+9YAaVHlgLFPLs
         6gRhNjeNklgqV10M30Dh9HrB/yMqeGncM36QBjD20oUNh56Tuo5LO0HAxzeuVA5eOP4e
         62Ce0j5M2Rc8jvGQVisLmlbghUFDjAAWa7VzoHjaCDW275ytUsJztu8pPjUBRnK3nT64
         1F5wlQL/3k/OQgLF4fRDsfI3rsPcio4syQewr7IDGF517k+wOQUDDl4GX1o5PrYJnYJL
         RIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616313; x=1796221113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B14YIwzQj4vDx9qqNqeB3s7xtGauzc15dvusC2lDAYc=;
        b=Acsearkof6b/cqPOIVfNqmRVMLLzIzlfUL/jiBNa8KT0OeRXfjsMXq2tv6t83D5nR1
         vu/1hkN7aEP+ILUsK5j20oRid9Z/E5Xr5pbXH/ZHWeEbEp6t0c9iEz8+TLJ/9G+Lsj2d
         k5id/Y2zlivTzCEKxukuiGV71ev9gg4f5W7bMEAm79kjQFDThoupKWvYsThqj0Yo2ZiD
         ordId2qiNl2BuZ5rt7r4oP0pXd80lOdT/bVO+VECs2Cey5VON/xm+jbHH/gOVEiJX1N7
         HHqzR/UX35dezRHMKqIDcM8SXl/mPt/MJrLecEvhtBdpjFDsSis/VngQAwDZVozAv6Rn
         1khg==
X-Forwarded-Encrypted: i=1; AL+hErG+V6cU2lcgQWO2lTtUGXlLXK9E3odzrnzfXFDsXB8Zum/ljwxE0hKuvMJh3co6q3Mazw2F4Y+8ontnIME=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uoy5gMk5EMyTwMTlot3snc5ShHYjnkP8zRrumsU1lKsUJrkTo
	t011eCIKQ+IK20yWQjEOssdpNwZJ577EeuMLEEHlMGBCsfMofRbV2TY6KY9ec6hi/YA=
X-Gm-Gg: AZFdTZfytkfAkldGbX6ZeRmLWPs4dGp7id76kWx2c+iL01hFxiOfMoMI6jexSC78w2N
	jBAvMsMHfP5q8gPgKoSXn+FncdUBMbzqbyvdkvNV1m9aptc6BiHQQDqAGdA1Z8zPKvMN1QFjbo5
	QGRYCxd7IP7mirGxSoZb/MXchUePw43DyK12tzRZQ5isv9sScGOgvbVrXsbvSwVfkJXJfWpzwbJ
	KM+bySL7UGCwJIr0+WWve/cdGGDQa6decUEO3XCUJjpZInkDrEU8rBwmcPxa1DOP7mq45Oz1Tvb
	WrePSfeI8rBJRsJ0TEvVBK7ODIm8bcByUTVSEPcvZ68J06OYEiW7Rv2jA88naffg2YvZ1ByQiij
	8Zpe6gps2C90YR04u7oPwSPZwlgnRH+RDCxPOavbwcrbnEaBNiAFBauFivkdjFYb+gVaUpN1o1G
	EbQyiMjRxZsTiohs66kWu9yhwttmo9GTv9aMRLJQ3ds/eUo6WymMfXPGxw+uEl3ZTs68helXGOR
	2oTiHdmr/kf/7rjfMlor7ZYbkx3nebN7b99+Vve4Tz0n1BM+WRhQSD49/v/+08bgH+betWCWj14
	oaM0quSxhwbgKa3/rLIMVVCrqyrB
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr422155945e9.6.1795616313498;
        Wed, 25 Nov 2026 06:18:33 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm552250035e9.8.2026.11.25.06.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:18:33 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: rp1: Use ARRAY_SIZE() to compute group sizes
Date: Wed, 25 Nov 2026 15:22:30 +0100
Message-ID: <20261125142230.18076-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
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

Coccinelle reports:

  drivers/pinctrl/pinctrl-rp1.c:343:39-40: WARNING: Use ARRAY_SIZE
  drivers/pinctrl/pinctrl-rp1.c:444:33-34: WARNING: Use ARRAY_SIZE

PIN_ARRAY_SIZE() and GRP_ARRAY_SIZE() open-code the element count of a
compound literal as sizeof(array) / sizeof(element), duplicating the
element type from the corresponding PIN_ARRAY() and GRP_ARRAY() macros.

Use ARRAY_SIZE() on the PIN_ARRAY()/GRP_ARRAY() compound literals
instead, so the element type is no longer repeated and the array check
in ARRAY_SIZE() applies. Wrap the compound literals in parentheses so
they can be safely passed as macro arguments, and include
<linux/array_size.h> explicitly.

No functional change is expected.

Fixes: e3ce7b897388 ("pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/20261117140555.KfUW4BDK-lkp@intel.com/
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/pinctrl/pinctrl-rp1.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
index dd0e85c2ca33..da86bbc40f41 100644
--- a/drivers/pinctrl/pinctrl-rp1.c
+++ b/drivers/pinctrl/pinctrl-rp1.c
@@ -8,6 +8,7 @@
  * pinctrl-bcm2835.c, please see original file for copyright information
  */
 
+#include <linux/array_size.h>
 #include <linux/gpio/driver.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/pinconf.h>
@@ -338,9 +339,9 @@ static struct pinctrl_pin_desc rp1_gpio_pins[] = {
 };
 
 #define PIN_ARRAY(...) \
-	(const unsigned int []) {__VA_ARGS__}
+	((const unsigned int []) {__VA_ARGS__})
 #define PIN_ARRAY_SIZE(...) \
-	(sizeof((unsigned int[]) {__VA_ARGS__}) / sizeof(unsigned int))
+	ARRAY_SIZE(PIN_ARRAY(__VA_ARGS__))
 #define RP1_GROUP(name, ...) \
 	PINCTRL_PINGROUP(#name, PIN_ARRAY(__VA_ARGS__), \
 			 PIN_ARRAY_SIZE(__VA_ARGS__))
@@ -439,9 +440,9 @@ static const struct pingroup rp1_gpio_groups[] = {
 };
 
 #define GRP_ARRAY(...) \
-	(const char * []) {__VA_ARGS__}
+	((const char * []) {__VA_ARGS__})
 #define GRP_ARRAY_SIZE(...) \
-	(sizeof((char *[]) {__VA_ARGS__}) / sizeof(char *))
+	ARRAY_SIZE(GRP_ARRAY(__VA_ARGS__))
 #define RP1_FNC(f, ...) \
 	[func_##f] = PINCTRL_PINFUNCTION(#f, GRP_ARRAY(__VA_ARGS__), \
 					 GRP_ARRAY_SIZE(__VA_ARGS__))
-- 
2.51.0

