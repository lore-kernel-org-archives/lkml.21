Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601336;
	b=B71iVLvbgL7ZL/BRoFLwotJRpJcDLhNTihB8Itxf3kfFD4PGAj24wrnZHlE5tK4opmib
	 bqcfaGYl8XXlNSM/iKcN6NAdToEPe7CvU5BJUVaS9EeOn40BGPecLv1ZDzNA9V9G4IT27
	 8yypFk3sUcBFhca2T0Q/qZP50ZgUVG+QiHucb4ZGMTvDAbHO5+1S0rlGVxuTMODfwboRv
	 qULHUK/l5STZzjRbdgOK8Hf54m025UX9Qti4Q/Fm2CYqVVot0bcmzeiEbG5nH8lgDJnFt
	 ay0eoXTWACQvr0JbKbj1UVSuKl6yZ9YSXFH04B8Y0R+y0bYmDMFSnqrgb9NJRe2gZGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=uOIhdgYYl3Tswsoq8ZOrPa2VyaA03HUIcJpJs6oMo8g=;
	b=SG5acewyyYp/yDpepAmW3FWqwlZzWzVci7fRtVKvvSchzwac0f0aivTnnGRHIjMZ6Es6
	 gpgmlnL/z+XJa6hy1rQO5M+LEx64UUFikzOsNsMXXiYacmdiFhxkbNBXrU50hVi/67Sok
	 3yi8PudvFHfUr8ImmXqGHVJGSNYEZD88xreQygKqNASbumnU9Z7g+RajPw7T3fqKOdnpk
	 hPV2wCmFGRSspBp7RPHLZSmGnsPOBOap4lIN6KStmHUPw9hICIPZ4ZHJI6T3PyWftjxRy
	 rOASCV8d4LnAtxisnCN/2VpFYYNFfkmzBXk8hyCJ+SDqRIqxim4NOAnFuJcv6iMeyEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=F3bLAZRJ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC98606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEC98606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=F3bLAZRJ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so71436785e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795601334; x=1796206134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uOIhdgYYl3Tswsoq8ZOrPa2VyaA03HUIcJpJs6oMo8g=;
        b=F3bLAZRJ4L0TCUYJIneqzF0cPorSuQA+8Zgnfq/1mJ6/j7zp7odAcJ8aPinlS5rYwO
         7Yqm+bZe/d1g5fX1qy1i7UfUFJ/oH/3kUvXB1clrWDRB0chNDR+s/zeVARbOXlNHtNnI
         bgzU85QtJj2RINYNU7yiNFXwhwltPJat7S7DbsWvKjoS1xxTkm1e+zcc4pWwHzq8XrDc
         I9AtLQ6V80j8pd9COi2d42500vUtRNNq8BfCJRwsdSzQORh/AZx8RYwceVGAkTFpx0j4
         vSUDqQhyqgIY6TEKasWZK+x81u+F+OpNvs2WYcjUKe0mh1U9T5mLlheZeDBZOmIw4AQR
         vxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601334; x=1796206134;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOIhdgYYl3Tswsoq8ZOrPa2VyaA03HUIcJpJs6oMo8g=;
        b=oxUc9+oEhQisFXOiNVdLJr++JylggMBsxp+zKqUk93njD9LuMKONlYq4MqWIWZX76n
         6S7Cy8Ao/lIoqK5p2VrALLCkqGGrjn8DtrRNNfgaqM93knVhUg42JW3Ftyv2R/cEjSi4
         RWBaqm6L9j+Z3wZydZcrhLCz35qCTDFnfHqU/D8dXTk+t1CTk+aUyacalHlX8mg/V6f/
         09XsLJgYZj9Kz76gEQgen6QxUryTksvyjTB/VapJEGSR2O57iEBdMpoTlQxHZUuFTj9n
         Fk/dNf2hG9KTkeG2tmsxDgROgwiLEivpwn9P/PqX0bTCt35rmFyjCboJFoT8ar1OzIKa
         Al3g==
X-Forwarded-Encrypted: i=1; AL+hErFWCm+8DhegQ77uShWx2PUjwNMGCKP4bFUB9+zxXeP73qIv6ICtxyR//DKGiceyFz4GSBhPqwtKrW4tVyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0oj6WD1dGA53UdB5DwPsenQ3+kqmsIP7JkPqghgOEhwSj20nJ
	NcINmYEvWvVhMAVLMzMB8qZEc1lPCoxFU6WTaXHq7+oiQYyTzBjeDDJcQR+Ph79bW9HLZ2OXTBz
	11Q3z
X-Gm-Gg: AZFdTZfC77Lji8+Ate00JiAodICS2xwnuL+GyjkQJ4tU6wzOcF6wB1bM0inoxgIXE7P
	ejo2KlSI6cFdAHGiGcWcMkDOo744F/rAXry0Cle/+4FfKiosrCbUutcgTcdXeFaYYjzTFovtfCT
	pLFT+rUQEPopLl0L51VWC9l2O+OkNaFNma1mno36K7m0gZM36nUBXo7e6B0IuMTWe8jQrZ4Re9H
	RDSWfQGBIkuoU7mQxCS2Uv6J91VQfKpC7PP1aV6JYG39DRYbBXsxBJHu5MU77DPlaUL5UPvJMzc
	eP5Og9KehdAShfwaXMEot63E0ZpSu0SHgUR97vOlQmOPnk9Yp+BFGVHx2M85BOk9LZCogPTZ0+1
	ai81LvR0JFQic/FGwCclggbSyhsXyq9IJnZ2Z1sNxa2pImLCgaeNtaP6wvL3eJMr7Z8V2vALjQO
	5TCk2sJVobKLXD7KpY/w1YiYclG3fWcM4yraztlJ1/fpScv9hdtIakolywCOHIElHgDvQ4UkYQ7
	ZBF0IlcQAh5uutvsxosMKUr/4W0eIK3ZaLfSkZoaMOvQ+bnwBlqvHKKm20PFGlMEow+FidHNx8C
	1OFsssQgYuGSv1k3DG2K8xVlibe/phXTRtgOC2CTSuhxxyoL/Lcv5olg1Ff7m0jx2asM4G5sO77
	jDdVBAjrSS+FionWTCg==
X-Received: by 2002:a05:600c:828e:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb88785898mr361254695e9.0.1795601334234;
        Wed, 25 Nov 2026 02:08:54 -0800 (PST)
Received: from localhost (p200300f65f19a9043ef7230869dfba63.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3ef7:2308:69df:ba63])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb90660cb4sm449510685e9.2.2026.11.25.02.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:08:53 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Paul Mbewe <paultyson.mbewe@ziehl-abegg.de>,
	Joachim Knorr <joachim.knorr@ziehl-abegg.de>,
	Martin Fuzzey <martin.fuzzey@flowbird.group>,
	Luca Fresi <luca.fresi@bithiatec.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v1 2/2] serial: sc16is7xx: Drop unneeded __maybe_unused
Date: Wed, 25 Nov 2026 11:08:39 +0100
Message-ID:  <e9ebc84efca3b347bde38e6134669259edddfbbe.1795601260.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795601260.git.u.kleine-koenig@baylibre.com>
References: <cover.1795601260.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=lKakDurq/8xHM9QheyahU7Oa2ewwMH3MggWzJCs00ig=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBrOqd7mwghVMjsKsQSlaYCOO35snT/l77P/18 KlGb1DM6R2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawazqgAKCRCPgPtYfRL+ TnK9B/wMCJ+ZYxIrKe5UOXeYw1oQKPOzLASMOQVqngrK68Jw6qxLkLnPay+52pjQdIWHL6TfW8X BSIrO1yI2aITE1exUclSzpwMlx+H4SYOZJMLX5CrG9F15SNtSW6RrG5wUIGmOUbaEsecYUAbBMa UNr6zrsNWBNMvWOmBG9blHKZf00cHRScRoDReHO8BnWxZXTLm0Z76ZMr1X8qT6/1hkQtHELvSjL gXPNpHnhOeebzU5OMw6g1EqPDAgPjSB+tHpesq8HPoyilY/eu3e2oB1xrGhYRE0R5CenGooj5yv BHKqoYlKNKOHYPJejYS2m+yB8OXh7fG5dEZTc8lUFNir3E1l
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

With `MODULE_DEVICE_TABLE(of, sc16is7xx_dt_ids);` the array is used
unconditionally since commit commit 5ab23c7923a1 ("modpost: Create
modalias for builtin modules"). So the __maybe_unused marker has no
relevant effect here and can be dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/tty/serial/sc16is7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sc16is7xx.c b/drivers/tty/serial/sc16is7xx.c
index dbf38825a78c..afedb89018af 100644
--- a/drivers/tty/serial/sc16is7xx.c
+++ b/drivers/tty/serial/sc16is7xx.c
@@ -1745,7 +1745,7 @@ void sc16is7xx_remove(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(sc16is7xx_remove);
 
-const struct of_device_id __maybe_unused sc16is7xx_dt_ids[] = {
+const struct of_device_id sc16is7xx_dt_ids[] = {
 	{ .compatible = "nxp,sc16is740",	.data = &sc16is74x_devtype, },
 	{ .compatible = "nxp,sc16is741",	.data = &sc16is74x_devtype, },
 	{ .compatible = "nxp,sc16is750",	.data = &sc16is750_devtype, },
-- 
2.47.3

