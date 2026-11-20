Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164263;
	b=ZIt+1bFbreX0grRaurdJx8TDdTiRI2Ecb2msOe3map2gozoZI2WkyX/yNJlB1B0Jtd6x
	 ISugaAqZUNEBHebq3Xa0Mm5E/I7pPRMJ5oH7rbtQQwk8eZdXskNq7HQbx4hdm4m8ZRAlt
	 RaASt9OM+mZGS7lWCN160PLsi5BpoEZ9toFAR4Ty4gJNWtWOaVzZsq93i5MxCBwNm0gRl
	 m/t+/Dh3SVrcr5oDnNDm6fKOYk4azJN16Jo4XA6VHVeLfpj720ZeKpbFhGnsxoayiZwd8
	 9SspQueyguR7+HGieUhRzQfQ39gs7/k5FTA/3245NHr+mI1g2QNkIVkfB/PN6k+5O8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jvvpk791u/vpTcrn3n7Xlt/zzPlu7k3JrUe4UjhCYk8=;
	b=zb4BOyOiKKNjW3iUejK4J12K+MbSXDWUcuWd+2zoYWbv4OzIIuFw433i05arjpaugUUK
	 LoMrGTg7xb9z/H1LSAQn+ASUsg6D2D44rcGEflYy9x/4VLOulgMchmwiczcnq/fx3CbQF
	 vJRdABizPFEG2feCvvomJas0Lu3m+2Ps7WWQCnotsboObbWXa5GTKgINkHZc2chMm1BxA
	 lCooXb0vNPevOhss+hBKcsyndhO8b9nhNsTolXbeJ/TR1u9ZOXM2RwzH5qV5X7g/KN9L/
	 1HRBn6YNPj9NsbXA8B98jz8RM6mY3GVbpo4LjdrZpH1BM5LKx50yCxTjOprYmHKXLfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="uPU8/ioT";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9781060A3831
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9781060A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uPU8/ioT
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3b4944a0eso565534c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164263; x=1795769063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvvpk791u/vpTcrn3n7Xlt/zzPlu7k3JrUe4UjhCYk8=;
        b=uPU8/ioTyqpgFt2e1/OXnN4Tl98TsaFshYg0+ljxk51NcYhqtCV3w+EJ9uJEJH1qpQ
         4oAt6yc2Ynr27ZHEiyb7518CkNeT5D8zbYGeMqGys/9Jujaoo5Cmu1hydz7SETDYLPa5
         F+VOGJVXDk+UFcrm8O5/j3h5bq7zMCe46lIgexujF4556EyJ3FdOkNGe+mVSKGEqfjyq
         wRMx1hawj1jJNzTaGAfZwXHV/yj6LuUT2czcI9xQexNACAArRiOyEdX+dfBe8uzzVwca
         gdehaZKHKyZZOUNgcdUHoD/pV4XbUzsugMVoSUEzlqcqbUuGraZ8BZrGvOicoIZn3nKR
         ICCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164263; x=1795769063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jvvpk791u/vpTcrn3n7Xlt/zzPlu7k3JrUe4UjhCYk8=;
        b=s+Js8X+0ShQbYEgyL45mbo6WF9+SM0BlTNS3OdJ7ISPFKjlRj5eMnusfaEgTA4z4IE
         Ti+IbinhaqwGgJnenb8SMAY2CdnGloj0B4Cvr3GiBzkyPHEXHM0dFEGfTQr0NiyH4Nw8
         t+xRJb+2fKMxgsYoP7hHbhjgYb6crGnc3NtHKTztpW6bQqDF9QnONjaM/uG7qZd82vuw
         qnful7zHsKnCIvq5xvwrsFyXqvXx7v5C6cd8fh8S2XuKrxSvTvmFAwtuynCzosFK7MUd
         XkXiAmzQO/ZUm/GeuJ1zEvtvNtR3C4lPjAfi/GY7ujwjFdi1vJaC4+yXKRYFFa7bWd0P
         FFWQ==
X-Forwarded-Encrypted: i=1; AL+hErFPU7Vj9iOyFrhKWz1BBgGG7CGk8mIiCBI+56Z6waqkUeMs1oQikVIy3NjisSbU6n/O2BwKCCqqFWf/SQ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V6WvL0DzsIsO8ZupbOuMnoUlW8MVlmm3SdUxouYfvGeuo9wxj
	7GXVNE9RN8W7SNuWqmL88kLZSfbpmdEDlxSGvSOchYU4kfCaD/d0QH3d
X-Gm-Gg: AYBFou0BoRsvnu8pf6Th+TRTEhYPun+Oi/FJeQ3wj9AE2lwvn+58R+XfIrGbRCV23G+
	icAZX0mH5wi44HJ6ZYPfCDvkgmzt6zvdBVQj1SotNTFkQcC5Zx1O+YgyClzyu0/83x6Ug+niZJ6
	S0E5XOA9azmxWwZ7AK4UXh5bLvVH6iOX76tzs+WgtrwFwl74XNVj78gCNnnjuE3vk0mI/uztr7o
	ybuEr7wKeEske2EF4hb7mFDAlEFgJfqjqmOsQrsBrcnQDdutv7NWFQdCS8TKdbGKl1x2XMM7UR+
	31IPh6pgV1832zDCu7BaA9Ig715QDAbKTfSv3Ob7oMmBhFZYK4Xs+AqVUjIILNKPfoFxddAy+9O
	4aMtin7tr4ouwSwJVeQWbvlrFUdEaU8FaZUOH8x1aVaEBG0T8VtHhOxlk/SSxFM8ZIQFKwQNo5B
	1ZpuIAM4DSObELj0TDAozQRO//ntiMTyeHMpG5vjba2StDe6SqKW44kqW1crfBOEvax46MYBNzR
	7RH+c4bL8+Y2XrAfk0FMZDgLDTGduVTga/cG3maJrX500vD/Pt3WYuYdaEB1b5mBNBspcsypq0B
	1r2c/lM1NvYUhV8RR/8gwOwoscsa5UCGNlESJpCgvGVCdlpfDi7DVDlWyZpLFMZbkJZ9yMHM9aX
	vXNhQmQPn5jtVKX0aTQ==
X-Received: by 2002:a05:7022:45a7:b0:1a8:4997:65f6 with SMTP id a92af1059eb24-1b5568c7032mr3336508c88.20.1795164262686;
        Fri, 20 Nov 2026 00:44:22 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4808244c88.0.2026.11.20.00.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:44:22 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:43:59 -0800
Subject: [PATCH v3 08/18] HID: logitech-hidpp: index G920 force-feedback
 slots by effect ID
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
Message-Id: <20261120-hid-logitech-hidpp-next-v3-8-ba39242d4336@gmail.com>
References: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
In-Reply-To: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

The G920 driver previously maintained an effect_ids array indexed by
hardware slot minus 1 to store the associated input effect ID. Locating
the hardware slot assigned to an effect ID required iterating through
the array in hidpp_ff_find_effect() on every playback, destroy, or
update request.

Reverse the mapping by storing an array of hardware slot numbers indexed
directly by the 0-based input effect ID. Because input effect IDs are
allocated in the range 0 to num_effects - 1, looking up a slot becomes
an O(1) array access and hidpp_ff_find_effect() can be removed. Sizing
the array as u8 slots[] also allows zero to represent an unassigned slot
because hardware slot numbers returned by the device are non-zero,
eliminating the need to initialize entries to -1.

In g920_get_config(), deduct the reserved autocenter slot count when
storing num_effects so that data.num_effects reflects the number of
user-assignable effect slots and can be passed directly to
input_ff_create().

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index c65a32572292..4444c74053ff 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2349,7 +2349,7 @@ struct hidpp_ff_private_data {
 	struct workqueue_struct *wq;
 	atomic_t workqueue_size;
 	u8 num_effects;
-	int effect_ids[] __counted_by(num_effects);
+	u8 slots[] __counted_by(num_effects);
 };
 
 struct g920_data {
@@ -2406,17 +2406,6 @@ static const char *HIDPP_FF_CONDITION_NAMES[] = {
 };
 
 
-static u8 hidpp_ff_find_effect(struct hidpp_ff_private_data *data, int effect_id)
-{
-	int i;
-
-	for (i = 0; i < data->num_effects; i++)
-		if (data->effect_ids[i] == effect_id)
-			return i+1;
-
-	return 0;
-}
-
 static void hidpp_ff_work_handler(struct work_struct *w)
 {
 	struct hidpp_ff_work_data *wd = container_of(w, struct hidpp_ff_work_data, work);
@@ -2436,7 +2425,7 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 		break;
 	default:
 		/* find current slot for effect */
-		wd->params[0] = hidpp_ff_find_effect(data, wd->effect_id);
+		wd->params[0] = data->slots[wd->effect_id];
 		break;
 	}
 
@@ -2454,10 +2443,10 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 	switch (wd->command) {
 	case HIDPP_FF_DOWNLOAD_EFFECT:
 		slot = response.fap.params[0];
-		if (slot > 0 && slot <= data->num_effects) {
+		if (slot > 0) {
 			if (wd->effect_id >= 0)
 				/* regular effect uploaded */
-				data->effect_ids[slot-1] = wd->effect_id;
+				data->slots[wd->effect_id] = slot;
 			else if (wd->effect_id >= HIDPP_FF_EFFECTID_AUTOCENTER)
 				/* autocenter spring uploaded */
 				g920->slot_autocenter = slot;
@@ -2465,10 +2454,10 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 		break;
 	case HIDPP_FF_DESTROY_EFFECT:
 		slot = wd->params[0];
-		if (slot > 0 && slot <= data->num_effects) {
+		if (slot > 0) {
 			if (wd->effect_id >= 0)
 				/* regular effect destroyed */
-				data->effect_ids[slot-1] = -1;
+				data->slots[wd->effect_id] = 0;
 			else if (wd->effect_id >= HIDPP_FF_EFFECTID_AUTOCENTER)
 				/* autocenter spring destroyed */
 				g920->slot_autocenter = 0;
@@ -2842,14 +2831,12 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 	}
 
 	struct hidpp_ff_private_data *data __free(kfree) =
-		kzalloc_flex(*data, effect_ids, num_slots);
+		kzalloc_flex(*data, slots, num_slots);
 	if (!data)
 		return -ENOMEM;
 
 	data->hidpp = hidpp;
 	data->num_effects = num_slots;
-	for (j = 0; j < num_slots; j++)
-		data->effect_ids[j] = -1;
 
 	/* init the hardware command queue */
 	atomic_set(&data->workqueue_size, 0);
@@ -2870,7 +2857,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 		for (j = 0; hidpp_ff_effects_v2[j] >= 0; j++)
 			set_bit(hidpp_ff_effects_v2[j], dev->ffbit);
 
-	error = input_ff_create(dev, num_slots - HIDPP_FF_RESERVED_SLOTS);
+	error = input_ff_create(dev, num_slots);
 	if (error) {
 		hid_err(hid, "Failed to create FF device!\n");
 		bitmap_zero(dev->ffbit, FF_CNT);
@@ -3447,7 +3434,7 @@ static int g920_get_config(struct hidpp_device *hidpp)
 		return -EINVAL;
 	}
 
-	data.num_effects = response.fap.params[0];
+	data.num_effects = response.fap.params[0] - HIDPP_FF_RESERVED_SLOTS;
 
 	/* reset all forces */
 	ret = hidpp_send_fap_command_sync(hidpp, data.feature_index,

-- 
2.56.1.750.gf70dc682cf-goog

