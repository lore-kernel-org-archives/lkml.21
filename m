Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233360;
	b=VOcGK7HJagHkZaz+nKX8gu4QAuJUak73ZBAXRss4O4rUg8IIPw/reVGf9gqrmMAMancR
	 m5YCzUi7han9Hl7OdOZnpoCo6HIgKsCzj7bP7cvHzD2AWgLfe+g+lIDK1+v2wcJLmC2+v
	 0Ldto16+2F9lRx4uEhmZIsZ9hncWV/1Dwxyi8mouYQeuem1x8UFNJT3VByegjuhE1AGhr
	 DNma8RrLU9g+qWsTi+eeDBrXwAppsfWwADUTU9WXrcUjHvmNJmbQwdvNyHv3At5Re+f2Q
	 lB55LZ7h5jCc+KWzfagCJi1SQN2l/laYfDE6Fg//yQISnUPF3qaj06x61Y4ma5H+cow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jRUECku9MtNUtuZiZnRtB0skHYIdA8uwyD4cqahMADo=;
	b=i5oqG4fN9wfZrVg9NyPzm3Gp73ib7nO860iqAmCwtVpyiXYO6A+25hs44pxdczVRWrAR
	 ox5nf8vRacZZvgdo5CYVHfQ54ZAsC5PwMhfkhqCJm55zRQozlMK0AIpf6wRYRyXecHJVt
	 6I5PC0PNanT/oWtxc6gpXQ7RLOoTG9L9J7n1aqqTbDeAqTjoQ4BZOevTyGCSf7+j/Nemv
	 X5eGk84aygz+Wa/AEyuVO8YA34F0S6heupUz4mYPaKxDI239p/kWz7nquWC2mXKHdmggw
	 F4upWr63dSRv5rXAIDCStWuNjMEGq3Tv5DWOuBH+2BNShcg1EncTr07oYiwTWeO+udg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgL4PwRw;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B020860A3812
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B020860A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgL4PwRw
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-71b30ed75a1so973819eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233353; x=1795838153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRUECku9MtNUtuZiZnRtB0skHYIdA8uwyD4cqahMADo=;
        b=QgL4PwRwcRxr+9m7sI6/MUDwX3W+V/RKxXrAUvK25MfG/WP69Am1BH5KlMvxTbfYRD
         qHpVk0DCQnNEblxwl1KHEF9vE08qoZwOv7FgMiMgHXDAx7cqcmI/LrFQQ3higzRh8QoM
         Rxz3i3raL95e5FkcoMLE49APrjeOA7mCQ4u35yZGLvqmIV6Ung7H4weoPWLG60JQTRsK
         knYR065jJobM3+SQsKaUi6Wp+cbR6HG7jQgFTFo4J6teAeJ1okGeF0nn/fN2w9APDHer
         4uFE1ouf4IOH5NygopYQf5NEkEAM4JBNeOpJZwZUcap7pNKVlX1MfWM1Utks7EpNfU+y
         7lUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233353; x=1795838153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jRUECku9MtNUtuZiZnRtB0skHYIdA8uwyD4cqahMADo=;
        b=riu6uyOPDO18xCUhh+D2zSH5qfyxHBqJ8gmJ7Il12o5xpbuTg+Nz2EiCveucPUEb4w
         sdqUwL5bVDE4i1+DJUg1KT0PVT/rRctM+KorpgqMwavz59JhqmqyPGSz7eYM3avFZut2
         vK/35kKEV6AiyL+PVE/m/UxJu8DKl1RFFrd3R4/uHDknrYG5XQKJOf1KSewYbK21fMBF
         pwD4z6710T9rlJndOv4XaZlJi1qg4/jQyqGKDi40dF36ETxhl9yE5zaXJ20d7BNu76t/
         dhlFcDHA8UH84cbjWYOecad/npB8ndy0PzsfmLnMnt6mkeS4X2bvGQoXtg/59lNK670w
         z6yA==
X-Gm-Message-State: APuU4Z+G/xptA0ap+NTxhYVzqtp2zFw2kPKps53bfm0vaXsFXsUdjM5A
	KXsVQgYlEr8mYVZt/mjAyqf3f9Lt2uTlptYtBFOuVHtxvwRRkzzNnG0=
X-Gm-Gg: AYBFou27LnVPU2M8XojEccc0qVGC9oCtSKgBReQmOJm6tC/HwsRjoHoFeoOpgckbIjL
	6bWp+TSjMWET7/mD/M1RKnUsvIC7AMflzMZQ3IHDH3b2TOu8cxqyTngXfMkoWelahcWI02LHU8L
	AWoz15FfSTdjPd6gzFdXnGsLnLa4ma1XoGP02fvRiBsPKh3ehbrmpu1gAbRMP/lP/F2ZWFs+G52
	6JGIBunKNny4mjnIYuydsvlJmBcgqjgzKFFpnIcS8TCsDK+cjzS27KoKbMI9L1AjSgzFSPBqtYM
	8unMafD7oFLdiiz1+/3uZ/7iau7LPhCzTHvs/3VA2XIpOeaQuZz5I0Jm66o1BZ9VkoitIUV9xqR
	x88kXyNU8P8Ui/5kba/DoJ+r/a2wzm2OxWMslurKJ1+jly0l7KVVZT2YEe0QPTvI4eAwaBfUH5S
	ADVZhfSbjuBn6WXq1V86ICLmUjgEDNvRtWiCynkvUJ+KD0yPVKdpqFEFFCMegJB0oHv4DogmaQ/
	ZvMd4i9H9scBJtRoPJ3f5bNrARbRCTS8G3TaizOVrZsNtn2dmTuzv4GCfvkiPdfJHiRz9UIYnjz
	H8SgC7YGOX95lyopIdIIwjyuqbYJdOyNk2aBMpu2o3vh7yLl92KgO/fK
X-Received: by 2002:a05:6820:1ca7:b0:71a:d76b:fb39 with SMTP id 006d021491bc7-71b391e622fmr4923396eaf.2.1795233353562;
        Fri, 20 Nov 2026 19:55:53 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:55:52 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 06/12] media: tw9900: power off the device on remove if still active
Date: Fri, 20 Nov 2026 21:55:17 -0600
Message-ID: <20261121035523.26764-7-matthew.laux@gmail.com>
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

tw9900_remove() and the probe error path only call pm_runtime_disable(),
which does not invoke the runtime suspend callback. If the device is
active at that point, e.g. when a USB bridge is unplugged while streaming,
the vdd regulator is left enabled and devres then puts it, which triggers:

  WARNING: drivers/regulator/core.c:2657 at regulator_put+0x61/0x70
  ...
   release_nodes+0x46/0xd0
   devres_release_group+0x11f/0x150
   i2c_device_remove+0x41/0xb0

Suspend the device manually when it is not already suspended, then mark
it suspended, following the usual pattern for sensor drivers.

Fixes: 918b14a26b12 ("media: i2c: Introduce a driver for the Techwell TW9900 decoder")
Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 6309d9eda243..585509c1b41d 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -699,6 +699,14 @@ static int tw9900_runtime_suspend(struct device *dev)
 	return 0;
 }
 
+static void tw9900_pm_cleanup(struct device *dev)
+{
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		tw9900_runtime_suspend(dev);
+	pm_runtime_set_suspended(dev);
+}
+
 static int tw9900_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -778,7 +786,7 @@ static int tw9900_probe(struct i2c_client *client)
 	return 0;
 
 err_disable_pm:
-	pm_runtime_disable(dev);
+	tw9900_pm_cleanup(dev);
 	media_entity_cleanup(&tw9900->subdev.entity);
 err_free_handler:
 	v4l2_ctrl_handler_free(hdl);
@@ -797,7 +805,7 @@ static void tw9900_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
-	pm_runtime_disable(&client->dev);
+	tw9900_pm_cleanup(&client->dev);
 
 	mutex_destroy(&tw9900->mutex);
 }
-- 
2.47.3

