Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671077;
	b=uObw9llUnQkhZtfr3glrYTAq8xpytDUZD/A2ABD57TRHh6wFqhyFk4s1as6F/fZO0cvK
	 J3714pu52ZlsG+TfZpmrFZwApPvlOAIW4YyYeBBm3cI0I987fO6LbT1CTd52SmH5xN0Oq
	 uS9cIdZbTQ4dEDwnz9m/KBTXDaYnKYWDuEIVJ/ExWRLfuVKyZFGNT+aDURpsOuAU7S3jw
	 Zw2xOvcM3DhDxLOqLeudGRrqSdIvZCiXKKxVG4gI2GX/Jh6n4BcN0Wvetd8HE0Wr8IYwG
	 P/yKItMXXUcPK/vBisEY49smgZOJ3WKTHUkWt0RMmo4lR4RYrg5HDgBnQg474zWW5zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5mSI3ygXKsW/OwLZiR2YvgT/uFmunlZkjWCA05tV8u8=;
	b=keQWHBxi3xKElRcgt2UKzvX3hNVuCgAcB6OfLkO/wPqbLhfNicPsHFEYM/KWlN1eU3Z+
	 nK4AwqjQLSu6OagErcfk3f6/jDLxv+W4lkqR1WpkuwYzaCk5ntX1/VsbPKGfezR3QWQXm
	 kzemqnt+WscFCBSETsxDSO5NHdR2Z0Qkcss3pUJHxH7Lj5AMk6dGoa2nbm7SheyT/CciV
	 TXA8Lr6s8yM37Rw/OtRUPS5rYRHT7+XIsKrafTzsTPEE0SEO1Zq8wEngZGUzIaLcs0Go0
	 o6iLE8ITrZsqq1kOVDrUYL+1sRjwzCKSroc8uixmwD376SZ+nnNSsM8HUfcYKN+YK1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXF31PvS;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD59606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CD59606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXF31PvS
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f03920c4a0so42336555ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795671076; x=1796275876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mSI3ygXKsW/OwLZiR2YvgT/uFmunlZkjWCA05tV8u8=;
        b=EXF31PvS6uhy7QwK9PgvUsmqkvUS87utw2nnzx6T7zdhWTDe4GwkemuudlAF4Du6iu
         PIIzCAsOxvPhdKuBxmQm9hjeTzoQyM/KfHWRkgV1vVIzGdfZmi/BCL/WxRXvo47+axl3
         0qbgkMe2T3FQuLV15qXjyJFQujFQx3Fv6aNFsczegue623/8V3fI7lkhjaqhg87elVLg
         6F/kxDPVhmcXYowkk8Ef6qr/d/ji8fpqI5m6NAdkHHkbLbUxyOIsU1rO8jC6EIBB2V6Z
         BlpVYFtuFFYbuarbJeJybM7mljj92LBkgoaGpFYVVQU+uLGs73u7/uhkTRuOFiLXFqL8
         YOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671076; x=1796275876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5mSI3ygXKsW/OwLZiR2YvgT/uFmunlZkjWCA05tV8u8=;
        b=KE/jPCqMJBmE0tKVbug39+6VAQeQv+R0Zj3O45DAKwddjaJJcIrNvIo0Ee8M3/dG85
         oC06exfk+VTSwbX3YGCFU+c0S+X9BRvbcWs5m2VDHAviyqtlX5FziDIY0aAnxDa19siK
         TBg71zQAVjdZmmluAZnhmH+QC9k2ABYjQbcUOgXGjWLz6Gt6aCBBuiX9wwbPGZhWh6uP
         1f+XrZsUjEcmdla4vHS67e4/fUiX1KtK14QQtKTFqBogl9N+SXj6cF/TnZgRsaXHa5sE
         rjBMykWPIPYPbdwo5XXQACXWM+Q70bE+Bqm990rZqPLroMr2GowYRne52olOhJ5bxA8v
         FrjQ==
X-Forwarded-Encrypted: i=1; AL+hErHYXgGHwkljCeUtJVQJBKnIX3vkBRsp6tFudcI1kogIcz1Vf1uAh0Fn88f8OCHyaUvTrM6Ovrxr7QVNWC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E59aTRT32EPcy0e+ZdHatvyyiCUyECc8asIsTJBQj2S05qDFp
	4hl/TBFSOmwNVLfh2aWB1xkl+ELgV1jrwGXLM/PuCkzbwfFYcj1Eh4is
X-Gm-Gg: AZFdTZcdKifXGnKaya9D4J2RG1XnqbWqVRZpbjGutQQBRR+q/5hh7v2cSrV/oBxnoE0
	IrUsiETDcR+NbqP1piLszAYqvV4NLERdi3QbvJPm7GjD/zq81Fp7/dlKGjSlK2Jyn+wYyPgOLSu
	Edj5lbjLgmF8SAzIikCjWu+2APeA2MkCciClEBD5Cb6fCDPSmxxKte+cm0TdCpfDDi1EgKr3VH2
	zsS42ye4fxPVZGmgdUQdeiyBAt/Sl3j4AwnHmTHOdbrXUjuRW54CGf0gE2bZ/Czh7yqOKKET0iV
	46ihcO5qmDkbz4IOdH3oLqA3hqNIvWcYQ2L0pkSh/kBnXFTAxEUBlpv8zMBctoy3yqVtR04PQPL
	akxsdQlsDvlogbWNlbRcizc7njwnwAvkteiCUleF/qH+vbEWgCQVPj+N7+2nxKUevloKJoMJy4v
	SN9iZe5zdS3FNNeY2b8ykzHxHH3HkyVCmPSo1uc+prTHF79hi63eSQyctkZ7/0lIdlm14Bc9yJv
	xSo7ygAretayinWwuJOlpvum+IrV9JsCRA/JK+Dl8CnQcVrfRh2jBh55ojrwT7xCYUc+jrcZozf
	Nwgt3qYJrXXHvlst0wh7EU3yR8QK3ukJmA1ld+8nB3maAy0Q18aMAcXshqehY5/O+yH1Cot6apl
	7RaSS2ru0nD067lGcQIBkh7pNbbosx59CoQ1+PaEekUxY7iaP0EddWmnOSUnUoACsuLj6ycY6X5
	p+kFlH3yaF166Hw92ijb2LeQw=
X-Received: by 2002:a17:90b:3810:b0:3b3:cb3b:1965 with SMTP id 98e67ed59e1d1-3b41c8fe1f8mr19194774a91.16.1795671075704;
        Wed, 25 Nov 2026 21:31:15 -0800 (PST)
Received: from kapoor ([149.40.62.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm33700520a91.7.2026.11.25.21.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:31:15 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Wang Shuaijie <wangshuaijie@awinic.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 3/4] iio: proximity: aw96103: wait for the configuration load before freeing
Date: Thu, 26 Nov 2026 11:00:27 +0530
Message-ID: <20261126053033.603086-4-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126053033.603086-1-kapoorarnav43@gmail.com>
References: <20261126053033.603086-1-kapoorarnav43@gmail.com>
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
index 504e92ab9b07..b4aa31a65369 100644
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

