Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866732;
	b=jbNIgM1M4WB7VY6I9wmKowDbbXzxlnqSGy6NXdHS55Lbp6dHoNmUAOWuXu+AnCqCkSnL
	 xAISj74FOewUDOwjvUREl4JelcrSY5xKHxY47+1cPYtrWhf3I7DClZ1sjgudTVkxwbL4Q
	 F81nPgoNwl0+NJPdjQul5gwRl5QjA+GFD9AwwdEolGQzMX/tJBAVfS/tBoEC/E4mZTEv8
	 FqVqb9cM+Aj5J5T6x6gFTyGiGjzvgAsoTV2wJnJGHtLfFX8bCmMDMJmZmvbsAaDO2uSXo
	 ekp3JtjkvDgrfAgXBO/eXk+xlQ/s0pMbLlIQkPxeH/M20IVbjPzQY/cYKJ7XrXqSDjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QoQfhlenszhER9LDDzRyM/3rOAB9Dp610fJaAHzSuAM=;
	b=O5rIS61mBsbTRa6Si6i040R0RN8CaAub0Rz4Ynbf2OnlocUKqC88QkoL5KS37JhlysOW
	 1EncHD2+uHuADhxjg2J50WIyBnAjzyIqUHr+Akqu1MiBF9soLiw7/1AbzaDRHGbPgZo+d
	 e2JmhPtPbZgifrPqAjj7cmJiQGR26t2qbDVjZ66/v4QseN3WxynWPZfQh2eQ0VIAP+dwP
	 8/h1qQfddLyw9fnDtYwLXJhVF1JS2IHevRSc146Wu5MzvOz4sFOjhRNUxkXhzNL1VFUxW
	 zmLEUv/NljTaLfIfPKnv9xKge2yDYaXlxlfUPHWceuZSCdIrjVqmQtfYHWpdeOYyhTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zt4b0swC;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0092A606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0092A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zt4b0swC
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-385d8a00598so14287486eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866731; x=1796471531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QoQfhlenszhER9LDDzRyM/3rOAB9Dp610fJaAHzSuAM=;
        b=zt4b0swC+JcWV0y4SFRum5aUQuIa0Ih7W2GFl5oSMhs3ERDO7irwACqGOjfqu+uDmV
         mmvDAmaIH5bjFqJrjQL8S6pBN6C1tva5T2LIwxUTi40NZ3RWu+68MloQ4JyAN6RLsrmb
         /Za0pJyLnO4umsOKWnlRikEXtBXFrPx0idbAwC0dExhibS3lfDGXPRYNXsb6608zsLlG
         +5xI0SvQZZlnQ9gnGDfTaJeGFxJxb8Z4m8QxqgHTHrPuifn/VgVyOZaB6WJfRmfOaKMb
         eALebPATsO8StKMOrByIMXn4m99BNY782fZzjeWrhXrTRmvE/DnnutWVnuXzeamzfVpb
         XhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866731; x=1796471531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QoQfhlenszhER9LDDzRyM/3rOAB9Dp610fJaAHzSuAM=;
        b=Xh/l1/kQJecKXgL2g3YE0Pad7y4u4/i6BBDkwgA8cDJzjXFMk/DvKJN8jU41thxizd
         eLg12VIsEvoz+Gpu/4/4EfplGmz3/xRofFON7DHeFV6FiLlfFhyBhVGVVVDDG79PA30e
         ZM9T78yrZ/f0qpPwnZHMK96TMj0I6SB0OWuzJfsBp+0+G1ZYpkrrSXsFbBov3RuYGYrZ
         +uqT/tUR7c4fMzKPyP4dacclsS+1gdOyRMZr5TNWVOYg51B7R2YppjogAk+6V8iCi3ib
         Ml7WkRY0DXoLj9HEvDcK26kRi/ZX7RsMXG1vQPMmjMDyKbcuC2CrgIJdpVj8Wuxj0p8t
         g0ow==
X-Forwarded-Encrypted: i=1; AL+hErEgHuDz5VSFU82dJ03Stqkvo624IkQ+o9ZF6bjEaBj0ObY50r5XOHkQAzthdG2Emmxv1Rl7kZl/paEeA6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BByccQ34by7+7kNXntlp4SVcqAcc9Lbfoe3VOL3UiXGGwrTdN
	Cn59TP9Wm7blshOl6BlVBIQvND9GF61zMHF0buPranpNHRQi+wWP+Y6n
X-Gm-Gg: AZFdTZfTwouPmBMM4okbT6x1wWeojI4ivGfibTYoWzW5FZ4SR9sH6wHowXr6y6xpduX
	+lC36TjcrrPEYIsof8UPleGj2Ug4vzUI4pe8nvkqIS6ZE6gkdRn40FXR7Q1nsBcRjXFk3xCg69i
	WoGy0XS0DgfElqt+1CCqC+X+3qfCnawSoR3QZLhZBbOLh8twvmnZfSW1ydB/Of0WtWDnrBErZoR
	uvA44pzSSEiFK02gknIUiZgUdrfHBbQd6j0OMabvaE4Uo9MqUDJ2eXfYDtA7H2wmEhy5bsTfY9e
	ZlQq/RpmFHoCQ9F7H4W/JRELAc26zOw9D/9dX7t7A1/P0g1l3kgDpgK1OB0JtvX6cN6/dq+DdbY
	30QyI/QRLzP9J/dk0iFMGXE5ufDW8mABno/yUtIoB+bmASk0lwV1DkNj0lG108MiUHp27ii8gm/
	fomdKoyOrtzVEIvBXB3x4XPncTNKR36/LInNtfD18FpA61hyUMCVKp5eEw9duEsg/kxqKanD81C
	7GKytYwM41ltftLeEFhTgbOGElxNw6WtjvIMlQtghGskFIwnkNvXDYmTkgvkvWD2oXce28RJWIl
	M7B7FDDMaHWtchBaGIN8U3wvb8k4Gb3B+XiGxg+mTJxBpvJUnHJ9u1xuzKPh0MkuhKlWQRiSsV1
	lvlbhfpp6QYUvjHicK3XFUXqXoqyIgHGtmijLqHgV3YLox1fH/g5DupNG2xjeDT3ClkWjZ5ubep
	LTuGKX4oOcErrpHva3QRuvvkLtRLsF5q+1jOfwtfc3kO4QIl3IBkdHPSwb3gdcsx8=
X-Received: by 2002:a05:7301:4704:b0:383:729:cabe with SMTP id 5a478bee46e88-3856f8519ecmr28650973eec.19.1795866731071;
        Sat, 28 Nov 2026 03:52:11 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm74256544eec.20.2026.11.28.03.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:52:10 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 3/4] iio: proximity: aw96103: wait for the configuration load before freeing
Date: Sat, 28 Nov 2026 17:21:40 +0530
Message-ID: <20261128115144.557411-4-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128115144.557411-1-kapoorarnav43@gmail.com>
References: <20261128115144.557411-1-kapoorarnav43@gmail.com>
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

aw96103_i2c_probe() loads the register configuration with
request_firmware_nowait(), and aw96103_cfg_update() runs later and
writes to the driver data and the chip. Nothing waits for it: if probe
fails after the request (e.g. aw96103_interrupt_init() fails because the
device has no interrupt), or the driver is unbound before the callback
has run, the devm-allocated iio_dev that holds that data is freed first,
and the callback then uses freed memory. The regmap and the vcc supply
it uses are devm-managed as well.

Signal a completion at the end of aw96103_cfg_update() and wait for it
in a devm action added right after the request, so it runs before any
of those resources are released.

Fixes: 07b241262dca ("iio: proximity: aw96103: Add support for aw96103/aw96105 proximity sensor")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/aw96103.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/aw96103.c b/drivers/iio/proximity/aw96103.c
index 4f205d6ea030..82353be284a7 100644
--- a/drivers/iio/proximity/aw96103.c
+++ b/drivers/iio/proximity/aw96103.c
@@ -8,6 +8,7 @@
  */
 #include <linux/bits.h>
 #include <linux/bitfield.h>
+#include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
@@ -118,6 +119,8 @@ struct aw96103 {
 	struct aw_channels_info channels_arr[6];
 	unsigned int max_channels;
 	unsigned int chan_en;
+	/* Signalled when the asynchronous configuration load has finished */
+	struct completion cfg_done;
 };
 
 static const unsigned int aw96103_reg_default[] = {
@@ -605,7 +608,7 @@ static void aw96103_cfg_update(const struct firmware *fw, void *data)
 		ret = aw96103_para_loaded(aw96103);
 		if (ret) {
 			dev_err(aw96103->dev, "load param error.\n");
-			return;
+			goto out;
 		}
 	}
 
@@ -615,6 +618,16 @@ static void aw96103_cfg_update(const struct firmware *fw, void *data)
 		else
 			aw96103->channels_arr[i].used = false;
 	}
+
+out:
+	complete(&aw96103->cfg_done);
+}
+
+static void aw96103_wait_cfg_update(void *data)
+{
+	struct aw96103 *aw96103 = data;
+
+	wait_for_completion(&aw96103->cfg_done);
 }
 
 static int aw96103_sw_reset(struct aw96103 *aw96103)
@@ -811,12 +824,19 @@ static int aw96103_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return ret;
 
+	init_completion(&aw96103->cfg_done);
 	ret = request_firmware_nowait(THIS_MODULE, true, "aw96103_0.bin",
 				      aw96103->dev, GFP_KERNEL, aw96103,
 				      aw96103_cfg_update);
 	if (ret)
 		return ret;
 
+	/* The callback uses aw96103, so it must finish before that is freed */
+	ret = devm_add_action_or_reset(aw96103->dev, aw96103_wait_cfg_update,
+				       aw96103);
+	if (ret)
+		return ret;
+
 	ret = aw96103_interrupt_init(indio_dev, i2c);
 	if (ret)
 		return ret;
-- 
2.53.0

