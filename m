Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106551;
	b=aXVZbNeG1Y0ktEUep58A7KxAdtEJtc/l706DuibePx6cX1Rnz/s9Fe4qA+O04oVpvgrI
	 LGzu+UsGUoSTfaIQvdON/nm3vKjfQZx/SGHHLBMakQN0YAtCDe282OQQae1Smqh3DOMfK
	 GaHLKjRIqaj+tLezS01o18r2RO/6Ydj3L2MABOKpzCKpy+ga7CAsEgEbkwkJwC3wntLgf
	 DA7hRWp3vgNoR+3PGsDlhqALFni5mx2DH8k/0U7vBcRIwC5utZi3d0UhOk7ls1warQ+9t
	 hY9pjrZqFpIlXGiPzNdpvEywyHkQ4UbEUKORWhjKourkjU3MfHMXzq3MNu7/hmgW3dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dviFuqAIBQmCwTlGi/sNefyK6Za+SYcw7iPLWjwy1Ww=;
	b=uKIB8ugvRgZZuVnO/YmIdMcggxkCjzUgg5Xnh8XIT9psQMrxm1zxsCPlXB964nLsLo2m
	 l1tw0lQxxU0Zi35xpxSgzR7OyUHndpO9QUxJqtUXRmKL/feiFV0A6cpQHMfbARx+TDRvR
	 2ysUtxNjVc8uL8cmaTHc3w3g/1Y1jDMudiqK8KfSY66XBar/3j4Y9ds8JxfnHKBT8CTnb
	 SNifI6SCIzwDB0RIR5FfW6swCCaXASd0OKOwK9vyUMKwm2jE/kqeF3TKWMYEQlvzTC4fn
	 997rsfTtpZGTuj103kAhr+tM/jswsGEqHFZ7Zu4QxrF7f6F6zUcbc5TjXTwyC5cVDvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PNj5hFs7;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6D660A2603
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E6D660A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PNj5hFs7
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6b19e291cc6so2079167eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106549; x=1795711349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dviFuqAIBQmCwTlGi/sNefyK6Za+SYcw7iPLWjwy1Ww=;
        b=PNj5hFs71+xODapIVlwilq/rf7eJlSbtgbkJxovWg2TPXUiZ9Ba3qYHFfCvnAdYmYP
         3/a0e20frmCoiguXMFwEDxMZ+TRiCeXrlHxpaoX9nmbHhB8wFrKCqrMnGl2E2YJ0SkMm
         agIaF9vjbsfYYk7FCXGSj309U8MoBmsGyNNJeHHUHfFlwgiEYhjcQ1Toi77b70FDJIUF
         LrUU6eADcYrxNrlz9HIIt2lqvXn52g2bO+Q+gVDuDCiSYIrDW+CpXLx+4yznmPXsIOKe
         6hwRoBwbPG1RZmxkZyk+tsDLxPvIPKOe0PC5wb23YRZZN2tWXjMSoSEVeIT+5gtPq79D
         Priw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106549; x=1795711349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dviFuqAIBQmCwTlGi/sNefyK6Za+SYcw7iPLWjwy1Ww=;
        b=13hYiTrx3emH1kaFW6DKx4Gz30FfwtGk1hCI7GUEhR/eAnII2Tj8+BhgY6226lrJEF
         lznUPVumacwYcGSF9VrKVV64EAdjv/H4KySLTeESOe6glDEvAf2LiGCOoOof8mPpzEl5
         5MwNuntBRUU2YfaS6aYrQ+tSJH0w54QDnfjFC7Ts2xCq7+sIL9alCnchaQ/wd0a4IK9O
         HIu/mJxR5LN+UK7n3kvvdEpCbpqvcZv7A2k6rXCMkiRFF1f1NRKqJsICMXkQaEBNtYSB
         SgJN3l0yx8ehylqxFbON5HjGFYbenD2wkI1TSKJ2HwfQ95YD7iKyMglOEkLOaL8hKRc6
         D4kA==
X-Forwarded-Encrypted: i=1; AL+hErFuzhDzABIvM3H2Rs7XLuhofug01Re6EX15y3BSekUjO4OWsTg5yQlDzEUdBFC1XiMMLglkqwXtJHir2Qk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xO9XdVFd7MVqBQbf2ybg/4sWomc3nqlDNT8/wPFnnKF0q9Cgc
	YlJ+HQnIggfsAWtAnlKnZZnwtsPwGL0O0nAOmQbsxJd6rTUsqe/q0BjL
X-Gm-Gg: AYBFou2x/uDQds9dRmY/P066OtCJ83xK7xsezYEfVFyaQeMqYIcwy8vlv0rjsi84z1v
	OUMdxJ7QwVuXYOmyS7HQcjzrriOgIHuobj5VYFWgY4hIAc3KoIuTVF4XpsAH/ckN6JEKMPczg4R
	Bcmv9hdrsFVji/IBSBbuTnc9vmOQwBd42W/6n5xYM+BPbaBZ96afikjFvAiMP2ImKKyd9DFDWiX
	dh7uxiJjS3o3+GK2lAOvHiqhq0fYGoV+Ecb5w6WfyUlhUWaXqTb5wJYQu4azkYZNeYnXTWW1haI
	OTo/5nWUWMsmGVQknnuQYwLgpmY46FNmhu8LIlqfJtcYfLuYbr2HipdHwFlcMmfFASFo1WeJ8vY
	iZ/FDW3RSE0AnipNKPtQZFzBW9qggkTLBsbr0Ajrujx1L+Nfn0Q9QazsobBNBnBgm0gOCGQh5O3
	JkLEo/MIGlphnHXQo3HyQeD5Ou7Dblo7yj8Sb8cRTvPBZ/hxhcIItcnaKLFuYJ1Q2FjkVDctOAO
	fxngpHkpJdHA0ERFNtVY8ZFcoHC9AH57O1btER/4iC/7+WJfKkRa56I+pt6i5JJM9c0iXngVj1d
	ad+VAl73OzhJCe3SGPHMcU0Pfq49mv3OZqIXKbbuWPSmPep82Prw5xwxCDczuJMWbbTp3hNG9Me
	K7xU0lsNhTXGvp98gM2oToSGlbOaXSk3/sFAj38mspzt/6Yuj/i0tVvoNt1KJoYOCPe7LzgBAWw
	4NDfnV+1gx8AXGRl8OVvvopWEe2WTSM2srFo6ctLDKVXbcTjSh8/o=
X-Received: by 2002:a05:6820:8584:20b0:71b:123b:9ab1 with SMTP id 006d021491bc7-71b395e7441mr53911eaf.78.1795106549466;
        Thu, 19 Nov 2026 08:42:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:41:59 -0700
Subject: [PATCH v2 01/11] nvmem: retain the provider node until device
 release
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
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-1-8fca3ec5f18c@gmail.com>
References: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
In-Reply-To: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

An NVMEM device can outlive its provider after unregister. Take a
reference to the configured OF node, or reuse the provider device's node
when none is specified. Drop the reference in the device release path
so the node remains valid for the lifetime of the NVMEM device.

Fixes: 1333a6779501 ("nvmem: core: allow specifying of_node")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d4cce8e2742..03ea878874e4 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -570,6 +570,7 @@ static void nvmem_release(struct device *dev)
 	gpiod_put(nvmem->wp_gpio);
 	nvmem_device_remove_all_cells(nvmem);
 	ida_free(&nvmem_ida, nvmem->id);
+	of_node_put(nvmem->dev.of_node);
 	cleanup_srcu_struct(&nvmem->srcu);
 	kfree(nvmem);
 }
@@ -973,9 +974,9 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->keepout = config->keepout;
 	nvmem->nkeepout = config->nkeepout;
 	if (config->of_node)
-		nvmem->dev.of_node = config->of_node;
+		nvmem->dev.of_node = of_node_get(config->of_node);
 	else
-		nvmem->dev.of_node = config->dev->of_node;
+		device_set_of_node_from_dev(&nvmem->dev, config->dev);
 
 	switch (config->id) {
 	case NVMEM_DEVID_NONE:

-- 
2.53.0

