Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432743;
	b=tIZ4pSA3OltrRYyUhMWi3QoWfMUc8eioM20MYi0Kb0I8CAOt9lLhmoyHmoYsTl8VwmPi
	 242c6c41Jyoa9f4uLZZn+HYFeq1XduYiG2eTJ9vwzK/OnG/vXPY6TW2vaF6z+z3JXncc0
	 8exiHteX4k9xK96Td99stQFeZnMK9jDhDeBdtbu5CuTjRfOFYOvkLi/Yj2J820zeVrhuC
	 TgnEWXIgE7IZv6dby1EhvLG4ACcqH+7aSPY+Kv8V+AFnIzyDQaplSjJNWZv/sR8eh9FTG
	 fojlsD8E3zsR6PU9IhABoZe9QFQc3njaKnAJHrrcYVU5qtszaNjzPxv1wRenNueu3vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=wfoqPgqjOoBEdt77NL+di01ivSMv9tm+04A93YFGYZ0=;
	b=pB0yMWQ9+giiljKpRRW1Nvyia7/AJx0+XRz+iE+lfpmtVwwOo+Gb+W1fEvNPePsPbW4Z
	 zX1naq1uGBHFqn6PosloqBIEFZIxthcb7O40tuzJ4RKeEznJZLqytdPoDgfS3LQ+PbAs/
	 B2mHucHgZBH3DkqhSgosbWTm7bFCuiuJiH/GMwWy1bMdnvCjZMqNrhAuRz56a+P2qPoCb
	 AIBqjPfisaWuNDAM31rJ8HTHlu9GsVfXivCd3qZCFbMNa7VHOo4SMUqNhXnk0arUvtm9U
	 +g301qjuAl6HNLSbUX1j8wc+e4qUMDsT0p+RKm5qLep0WHJjhyccaog/83kWqamjSyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OFIe4O1a;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DA5606A680
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73DA5606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OFIe4O1a
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492690dd5daso2377293f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432741; x=1796037541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wfoqPgqjOoBEdt77NL+di01ivSMv9tm+04A93YFGYZ0=;
        b=OFIe4O1aA9DbyzRnUSGucPScKQ2/ZwWCon/qhk9auS0UXGixfi1OjPfKtynj9zI/Z1
         Yqwzhu8Lfwe3hFuEbQZY117lLoA0SlPbimMswnC6444nDPAH+jglg4kxexrRYg75gmF7
         RDla4LE66yFYVXsISd4gqtfviX3JDnO03FJm3DtOBVgbt8iONPpsRIj5Jl0poIM9fjef
         Aa5fYegji1A97pQKtjsi8i8LdjNxWJPqxBCbPKKvzVagAvnLyQx7R98BciMIhmaX8Adz
         dOOUpCqbecy1GuNUg1mS852LxtvnzUDiUPDOtXIvtBjGMn70Ab2oYgXd9T2ZUmPoEhyd
         YiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432741; x=1796037541;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wfoqPgqjOoBEdt77NL+di01ivSMv9tm+04A93YFGYZ0=;
        b=iwcNzFdyGqOBNLuXNjdd7xsTAFQYgXrLtvvF8Lu30LFQHrntTwZy+TrenS9bZRyM8e
         pfnHgVJCjtXnbn8sBlPChYUH1Dn2jf7/4kmu3Jyzs0rf488GcJ7ML94U5rWvIEj504HV
         DovF7XlcrkAP+BJ6psvxPv8NJpFVJHvdbwFmi5uCor0PDxwCicCRJKK7e3EcTgI/9k1g
         cvRqls6voUIO6yuEK7wIymetTpw021PVNJH1zRHGVD1KppxEPa6p68iiherKxFl7hz/X
         6K+BvkDjN+e0PQ0Wic0PzU7jnwS6WZJcluUbkDJjuMYPkNef5jlFpmL2kole9tz5h2H9
         DYIw==
X-Forwarded-Encrypted: i=1; AL+hErEboEDEz0BppAV3DGPgKG+p1xopi5olFRm0N6QTFI8mbb8J60Uv0U2e+lOi7wr7zTvjHon0Yc4OqJ2KStE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X1bh1U5KhSost/Asn8OP3/zle8NS1wyP+Hv0kEz+KxFW/GPOl
	0PHpb+L+ddjE8X9M2QHEnC4FEbUG8V6vd98VmlcdgYzpcR52dZiMWesLyS16+1a+vo8=
X-Gm-Gg: AZFdTZddFqDUKeRU91v3fgUijbCvqkFF6tpLFGqKMbWzEFV6ETS9BlYotoygwD+pQUQ
	YOrypjRUyAt31bOkDNUPPKO4jC70ioo3GYrGFZjwEE4z2rGYVTbPwkd1ZI+4I4fdgL+qhe4reMp
	0B6YTW0Mb58EZYREjcpdQ48WDmGXyfsm/ZoIdYWjQKEu1zs5hbmvQWcUKOTdb3HNz7oNjeqvsXl
	xDl3ZIkmYBj7hHGHKkQI2AEf1aWKsPj1kCyIH7fUEJy/a7qxUMEA3US1zzGZG8BkKAvFx7yj127
	MVbzTBr9FU8n0rOOg/ivJYCzXP8nZzvLfIc7xj3BgJ1MkekCUwtbyRkwgqvXanRdXuh9aHJvFIg
	mE21wJBpYz9wFMHFjncQZvL6knNPWw6BxHxU++PXS+HBWollXkO1Y3LIVPdVpKu5PNpbrC5GObn
	CwW0aRbTGSTWYHUhgqmj0YrzLBJnyQfVt2HD/JDpugwK9jcQT0iKbC1WmQ2vGhhzBEQa1zLmVwc
	3jp07F6ep1pB3EX+csdgekEoxWXdm1JVkjZ0VqupzLWL+h3luC/EzaagUa2G/FBiCqPetFX4cBy
	Hz2ZAiKH45rTXxW6tSMflhyGYDpgT/KrTvSpXxlklIqPqyVJyqXUYD+JQNOjZVS/Lkz0Jp6580J
	XHzrloZvmk6PYCLbM
X-Received: by 2002:a05:600c:6749:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4bb8881a294mr230949095e9.25.1795432740837;
        Mon, 23 Nov 2026 03:19:00 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8526cbd0sm451761005e9.0.2026.11.23.03.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:00 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 02/17] mfd: bcm2835-pm: Drop unused header
Date: Mon, 23 Nov 2026 12:18:00 +0100
Message-ID:  <a9189a77d973c1de0919e677b3aa2356987cd189.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=861; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=NEe9YBbMZXMEbXYJMX3Yb/1ndoZ/Dmuud2fnIKbLu4s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCDsN9DaGbH4sRvm1kmMVMoZQoYD+THO7sMJq c5fvKlpPEWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQg7AAKCRCPgPtYfRL+ TohNCACV8HRlC7pWjZBnU0TL84vAdSWAfOva9050R6uNV8ih8XuaoI0NfZEX0PGyUeuRt8bs4dM v2XA5PW6cc1tr1+JGiM70igioPAzQU7KobIh0gdtSGT2PiITyNZY7ZlAwcDS69V/EIqrOPvUJ8G iXXu2csZXsOmU//uNaOz/GnDIqoJjl4hQkzXnvBiIwRbv453hOVxYR1Gv3GQCRSZ0160OxLIjPr JsbSXt4Vu2XINOJwlB4uDWvQRb7Hb1Q5aTPXdXUYm6IGCcKVhFBLGLPzGyBKCC7KbQofxcwzj0W 0zirKNJvCxvPazYCUkPlfQT0E7koHud2EKIx+tnvDU4Fke5i
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

<linux/mfd/bcm2835-pm.h> doesn't use any symbols provided by
<linux/regmap.h>, and neither does any of its users (i.e.
drivers/mfd/bcm2835-pm.c, drivers/pmdomain/bcm/bcm2835-power.c,
drivers/watchdog/bcm2835_wdt.c).

So the header is unused and can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/mfd/bcm2835-pm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/bcm2835-pm.h b/include/linux/mfd/bcm2835-pm.h
index f70a810c55f7..12bb6bc2c07f 100644
--- a/include/linux/mfd/bcm2835-pm.h
+++ b/include/linux/mfd/bcm2835-pm.h
@@ -3,8 +3,6 @@
 #ifndef BCM2835_MFD_PM_H
 #define BCM2835_MFD_PM_H
 
-#include <linux/regmap.h>
-
 struct bcm2835_pm {
 	struct device *dev;
 	void __iomem *base;
-- 
2.47.3

