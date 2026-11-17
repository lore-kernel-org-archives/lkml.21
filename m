Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944314;
	b=v4X/GvQXRyhQ8vRX6nH7L+lrenuipbeXRgm6VQv5hdmRF1sXqRaOkSv91XwlR1pb2vKh
	 x2GbvC11zMDNIS0l3etGVvv/u1bn+1KmbTo60xW9B62EXj6W96cmT0xr/uC1DDD4GVBay
	 C0IHmMgSPic45ljBkwMOXkkcU6Aq2bS4gYUTDxgleNSnCLaDt/C+PLuf4obLqvXlDGMa+
	 WQ/CqKUI1tzqpIsMVY5DjjqaPt4bAoLfpjr/lfe0jkh6RRofWWazWZ9absovSgOMPIh1S
	 4tZtWBncBw76yH5qfwLKJzVZYaBJGHuKAQu0tYlp9x/VK/P2JQvECapf1fyCfMbCFjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9DIN0rAQkEW8U5nsqT7XDQZL+K6j1354oAyZ/5xfRqw=;
	b=ZsnBLJXiyBnbiqmM2pmPq/Tno08AvuMlpF91Rx+4Pm6gZOf+GKjqwa9b7zwPSdbj9/dL
	 Tq3Zy4//s1VX3VUBxPyxtxMdItE39B1T5dxNChTwS5gVOBwZ6YZ68mQw7MB9WJUoQKtSv
	 S6Isn7MGZlMukomdc8K5c7XeBuqac1cW1qKQbuOXodVUwEk95d9VWKe3Zo86nRd7od/84
	 DMFojR7KAMy6TsfYaAEKTx4JERcb1X3fd5E08qBkmqMHmlCFLGRYdEUNBQpfYcURBtmSG
	 qd+n7TI/LUP/BhgfTTKL/BZhkPYI57xAQJWTlJOLJ4pEj8fOzwM2riTfcdncf+kAeYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tD06YJrl;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B335606A8A0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B335606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tD06YJrl
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-703be215729so110671eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944313; x=1795549113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9DIN0rAQkEW8U5nsqT7XDQZL+K6j1354oAyZ/5xfRqw=;
        b=tD06YJrlo26CAvDip36hLuj8PS1YdZyb3MsbRmzNyt60NsxpCSXGBd4JBeRg/EusBJ
         H35SasHYTjEmjP5XxZoPSvPPoRNRE7U4MXHF2GWHbUnTQ3ex1rdMxjK/jMfMLmljgFu7
         WR2tTsw/OTij91RWeNKxNVkz01ieeN143iU944sLLiARUyWiIQpggbtMW5rDdFUzSbne
         VuONs2wsKm1F9KZz//p3Pct5b0Nmer+IhHAwgR9AGfcD2WLfHM4Kwl8O9tHBQq8OYlLA
         mypZnDlP0oSrWMEmitbnJLCO7VJf3CPlFo1P5G6E9m5EE4pJ+KJDNco3qOkLNg5eP7wm
         unZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944313; x=1795549113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9DIN0rAQkEW8U5nsqT7XDQZL+K6j1354oAyZ/5xfRqw=;
        b=GTLdivBkzzHtFv4D61IFgL2XiCjdTJRCYERBedMIaafoYMLEBZjZ+eLLHyGxiDut/L
         ZctLnX9xOfoKnNHqjfXQOKNapZnoe4jd0A9FkK5tg/Al4pqCSGcOHyYXBmGEdNE0Uas1
         iWXF7IJ09YBS6osPpmxE4vHD0znzh/UOYlg6L86QYucTME3do/Y3DSnKxI3pOn+5Q8Qe
         8owFtXPYbGO9vTc2MlWE0n471Z4Yw1OOwhaFsocWcaYuhcgc4xJtBVozQ6gth4wR2mD+
         TPXUBi54NXqSrhsaRZOqjSExY1jWRYjduPcSzlqvAOLtfJKRtKDKIbAfLWjaeYqrrhv5
         ZVTg==
X-Forwarded-Encrypted: i=1; AL+hErFLCJLFz43jRoBWymEPjBVqNJy/WzEgJGLSmIG0etSnB4TXakIuwL2VqSZpJRwzYMaPjZ1iZbpH9ohxnUQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F4RgiVipd64cA0y+02OJb4h0CyI2TJAqiCnioE97PTdB5XdAY
	02uUEFKBzzQBOn7cgHPQLCBVlCmk4BmF5umaIa5GMby9hcdeOoDeyNOB
X-Gm-Gg: AYBFou0kiIEZFNPXhtDz0+jYgOMBADSv4kLcK86csTGTvE4gaSCQQ+w6i57th970B5u
	vIqlDUK1IQooOEEKvBD5VvOriA4f/sYlctvC9fb4yfU3JU6P2uaevl5Q01zmNzp1EINRqKHCgpq
	Uo2zSQyAShKR/OASJX7TP8PIOtN3r6eE9HRTvCm3sBk43Pb2rDLZQOJxyvLSmlAvz+yUEeHI1rT
	xHAbzp60XfktlA7JtOikZL39WgdThjePmohlLC0dUmT8pfwwyMMVTGtLeORFbj3AERWf//H3zk1
	G6I5TShxuQXrLjHEtHwHr2yoxNfxnkUjn+sPOme0hf5WvepH2wTBbNYwK6GWZo1EdsctL0joQBy
	aK8O1sLVhIGJEnAtbfauz+WpVvMRJOz7uLvPKQ6O00Np+/rvs9QCerSV8NFyJAxwKyQSItnrwa/
	JnwDioxQKSk+cq/ZVuY2ajEDY6jhEKdc0ZVLeLdusfKECAdNH1NKUE30QJNEu/MbMTkO3cRHI8a
	/0f37SmYODoZpTPvhRqxaUBHFXspoHwEfu6cyNuNGWJVTl7kEjGl79jTr2vV/ICzPathHtjITDg
	jJSmFBxUqIdp93kojqiLXfSj7QAEIj8na5gz8WUwkOm8ybDg3EBE5P+zExHeZopKUBRDHkb6U2J
	kK7g3OSZY/DUY649Ry/boyS/A6lFez8KvW/xIFzuTDrUo2L/u1m29XjHLBqFzUVd6s6vCE4TF17
	gGGScTsIsdN8fdfqRgDsWEx919lmexaT23LvEnM+NIpD9N6Vou5JU=
X-Received: by 2002:a05:6820:1c99:b0:713:ddf9:4502 with SMTP id 006d021491bc7-71b1846d7camr283052eaf.20.1794944313266;
        Tue, 17 Nov 2026 11:38:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:11 -0700
Subject: [PATCH 04/11] nvmem: release write protection when the provider
 disconnects
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
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-4-3cfbd48812b5@gmail.com>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Retained NVMEM consumers keep the device allocation alive after unregister.
Keeping the write-protect GPIO until final device release prevents a
replacement provider from requesting the same GPIO.

Release it after draining provider callbacks, when no write can still
use it. Do this for registration failures as well as unregister.

Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index c41266241f3f..65d89498edeb 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -584,7 +584,6 @@ static void nvmem_release(struct device *dev)
 {
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
 
-	gpiod_put(nvmem->wp_gpio);
 	nvmem_device_remove_all_cells(nvmem);
 	ida_free(&nvmem_ida, nvmem->id);
 	of_node_put(nvmem->dev.of_node);
@@ -922,6 +921,8 @@ static void nvmem_disconnect(struct nvmem_device *nvmem)
 		ops = rcu_replace_pointer(nvmem->ops, NULL,
 					 lockdep_is_held(&nvmem_mutex));
 	synchronize_srcu(&nvmem->srcu);
+	gpiod_put(nvmem->wp_gpio);
+	nvmem->wp_gpio = NULL;
 	kfree(ops);
 }
 

-- 
2.53.0

