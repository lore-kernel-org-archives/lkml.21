Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597820;
	b=QkqP+t28C1yPa0DXMOZ4S6xcuRDoT3K2tnHIuelcUUMBIYXSYHJgLwug3w/B6f+8+7xH
	 BXaHj1F5FkfW6JZFe5uCkwHZMO0m0REOMr+yuLJot75Iu+qWI4nY6H43uTzV4CpJTSNf0
	 GXl8oJeLJzQ9ACFyCFnwKgpgqiFtwTaI3kV24mYVHHH6Av63bjx7+7iS95j9lb0Dem1jG
	 G7a1gOxzqzixt3fN7Rn3Rkc95bxeEe3oPS04YqctcTfWkGSZ3gL4C7iX6Sb7yEM3nmVBt
	 7TMflU7TRJ8nANyEMaw/JEqsxAI0HFd/y38jUPN3ge/cf6PWLD9N0qKgA5gFDrHEFmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q7Jp81/YwhVY4mwNzcGG+yudpq87Dczt69r71yvv/Ao=;
	b=a1yYQLh09K2z1b03FZU2AD4Tm+cal8mEwiOzdAGKNrjUirPTdGvQtggljiOnWfN4PLj6
	 3U4NptatXRd1zY3rBIzp5xKZI28TElpqW+tQb00B88AkegBJILwnnk7pyQZmWfRpSptd0
	 eO5S0xhg5zpYJRRjmr7kJjtLwIQGLyFyj0o0y3D7Kb4QJzKl49hyy5maazAajURzJlYBg
	 h6UU4Y8E4U+07ebQChHANjssIN4wbFSYFWcU2ZtSg5kHBIkgkPvNsr2gGT+Kr7rZwzKTl
	 EhtPPjZLIt0TE6XmGI0mSXyyreKmIlTL9m1YD2NYc2onRe1aPK48lXJouZdk/aE8M7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u9mhLm99;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC500606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC500606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u9mhLm99
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8ca6a12efd9so1717647b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795597819; x=1796202619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q7Jp81/YwhVY4mwNzcGG+yudpq87Dczt69r71yvv/Ao=;
        b=u9mhLm99dVc1rA1P6PDjbILqTqzAD7xN4ouRsDyOT03MrVA/AeyoA6KunG2NYM0gDT
         ll8knTQjsI9aOc9VlsZnhh3cg9lHkXvChnNxrnyRK5zI1DDuH7JBv8QYUzo4/8k2QVNv
         eDqld6wz9XfyWcZHCFnn0s5yGRd2VLRXCumHRaz9TjUsQfEdTjYbp490bjRRfQjHZOdZ
         faM7S+oTWv8CCOXtvHVVBNWtaqth/JQq22kFIRNWVIt4IVCrmtjY59/60tLaHWnJ7D0f
         9gY51/ZgwFKDIKBZrjZ8N45haYmPiV5yivy381EDWPlQ4g7F4X3yS0o+b0Ld7W6ESz1W
         6UVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597819; x=1796202619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7Jp81/YwhVY4mwNzcGG+yudpq87Dczt69r71yvv/Ao=;
        b=keEncfAI3avLE7cwLkdxOZtp8fmiUkz1SRLz0XieF2+1CCtJKVWbWZkPrYIZ6TIFg+
         5plTxdzMGit2SfQNsdFeOkl5FFcAXUEDhNouy5Ppa6hrRZi25fmNxNEiglXvdwCjo852
         jZeuETlFpP4KcdAk4x09CtgmuEgI52644bGWUD9k6MUzxHdpGTEoqooX57B51sNV8WtP
         45b3No2QdQqx2guTZns5xI8QRFRivSkbKxA1P/8RV+KK8mqcK+mc4MW/38p/wJcUneNE
         YFpZyQUkUCq64x2FfTKFVqLTmx8A7lLqJONuUfgfeuWL2TMWGaMjpSVCFkjxBscw04Yy
         6oOg==
X-Forwarded-Encrypted: i=1; AL+hErG/ik38NW/71QvIKE39xhBs2KaKlB+69HH8KuOz7d0YjcHlI7fJmRKJ8ztx17ahMH7tcDH8SHsY3OkN8SA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SZn1nBD2l28V0aMFfFbbsUeIpjlfoh4SOqfFKUGfp2Nc6/6ky
	jk+Xoocuc4H3R63Y3bzosUb54qC9UZs8rlURwaodvHYMm1DUifIwuAU=
X-Gm-Gg: AZFdTZdrb6+okkImMqs8OWNPoXIfkSq5wKtHJ3gdmsKOgynuD9U50DfDPV6uNt3W9+j
	FYQLH5GwFVWjk7J49c0hr3sTpGe6m3FQMlewf7fpcQvMweTVvVrxhzXUvkYTnD2oRU5L+cMTakU
	7D8elUHimmUPai+aDXkwvITP+TKCk/PwxsQxgxI0SLQHwIzKqMSOthtEf9A2nZVC3dKNOQLVqmD
	c1oCK3vNZc4nZ2GTUAbCXCJWMsm/1gdSU3CD0UrFy8ZQAJ7LrwSymrJaVmoC4nnw/vyLpOkOMSt
	yhKz6ELDroKOQd+TnlIIDOFL2Jx9/kVP1Ii/mBjLae0hh1gp8+gNkKX4CJXH8BPISOeG+1FSszK
	eQduL4MjS3BysRP1Ge+QLS1VMaW9sdoMbDVArY0SnuA9zeXPgO0IaVl9Ir+N+h9PJ2VEHE8WtYp
	6/yWDxsbawphcP1XEy6RQRPPtUJp9/urLgN4kOW3RVf2iMOwWQwNzDh8G9xW+n3n7AenC6QpE9m
	agYAL55UKwrJfwLO/S3jj2g1h7WyVgtArnMPjPpSFf7RVhBEfVjiRlFteKB2KrfbyR38yUfYiL0
	9E1ZXgK8b+Hwt/WZE6iuqtvisFB4rtqi41aG/Is3IG1iLwp53D8pFqCONRvCOvId5VhB
X-Received: by 2002:a05:6a21:4d8e:b0:3fa:10b3:c8f1 with SMTP id adf61e73a8af0-4014d25ddfbmr15219804637.41.1795597818828;
        Wed, 25 Nov 2026 01:10:18 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:44a2:4377:d176:9ad1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc613csm8456765a12.5.2026.11.25.01.10.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 01:10:18 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] rtc: isl12026: Fix EEPROM dummy client leak on probe failure
Date: Wed, 25 Nov 2026 17:10:00 +0800
Message-ID: <rc-b1-20261110-vc-22-300211a8c5a0@gmail.com>
X-Mailer: git-send-email 2.50.1
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

isl12026_probe() registers a dummy i2c client for the EEPROM at 0x57
with i2c_new_dummy_device(), but only isl12026_remove() unregisters it.
If devm_rtc_allocate_device(), devm_rtc_nvmem_register() or
devm_rtc_register_device() fails, probe returns with the dummy client
still registered. Every later probe attempt then fails with -EBUSY in
i2c_new_dummy_device(), because 0x57 is still taken by the leaked
client.

Use devm_i2c_new_dummy_device() and drop isl12026_remove(). The dummy
client is now unregistered on probe failure, and on unbind it is
unregistered after the devm-managed RTC and nvmem devices that use it.

Fixes: 4731a43169b7 ("rtc: isl12026: new driver.")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_RTC_DRV_ISL12026=m, CONFIG_RTC_NVMEM=y, CONFIG_COMPILE_TEST=y (object only; no new warnings).
Runtime-tested in QEMU (arm64 virt, KASAN) with this driver on a test I2C adapter module: with fault injection failing probe after the EEPROM client exists, the next probe fails with -EBUSY on 0x57 before the patch and binds after it; unbind/rebind and module reload are clean. No hardware test.
AI assistance was used for analysis and patch preparation.
Needs a probe error after the dummy client is created (allocation failure, or an nvmem or RTC registration error); no in-tree DT uses isil,isl12026.

 drivers/rtc/rtc-isl12026.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-isl12026.c b/drivers/rtc/rtc-isl12026.c
index 2aa3694c4de7..cb12a6366fc3 100644
--- a/drivers/rtc/rtc-isl12026.c
+++ b/drivers/rtc/rtc-isl12026.c
@@ -453,7 +453,8 @@ static int isl12026_probe(struct i2c_client *client)
 
 	isl12026_force_power_modes(client);
 
-	priv->nvm_client = i2c_new_dummy_device(client->adapter, ISL12026_EEPROM_ADDR);
+	priv->nvm_client = devm_i2c_new_dummy_device(&client->dev, client->adapter,
+						     ISL12026_EEPROM_ADDR);
 	if (IS_ERR(priv->nvm_client))
 		return PTR_ERR(priv->nvm_client);
 
@@ -471,13 +472,6 @@ static int isl12026_probe(struct i2c_client *client)
 	return devm_rtc_register_device(priv->rtc);
 }
 
-static void isl12026_remove(struct i2c_client *client)
-{
-	struct isl12026 *priv = i2c_get_clientdata(client);
-
-	i2c_unregister_device(priv->nvm_client);
-}
-
 static const struct of_device_id isl12026_dt_match[] = {
 	{ .compatible = "isil,isl12026" },
 	{ }
@@ -496,7 +490,6 @@ static struct i2c_driver isl12026_driver = {
 		.of_match_table = isl12026_dt_match,
 	},
 	.probe		= isl12026_probe,
-	.remove		= isl12026_remove,
 	.id_table	= isl12026_id,
 };
 

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
