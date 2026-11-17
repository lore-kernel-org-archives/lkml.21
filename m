Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944332;
	b=Tk3130kRycUUNSl6a0dqNvu1T/QKaUga9aMtrFOlF2IUcNdRotwlt1kcCXjvb547iCcJ
	 KPRzLjo4TSdxt8zcj/MFWycC0IF/3HSN+GnVABl0ERAXclLWVXcDwtgMFu/XSwwwu0nI5
	 IdlFRp3KEvtkbVR7avet9YgUBZFsHrIIpEeYsjmLGTTYswC05yi0Omnwe9NWysaAkTNux
	 979wJjZ3BA2OGuPDBNy2uiS5uXQRnlViAJoWZH5/nLQQaLT+ohrjnDnJvb52QDJy6xmMM
	 EHqONiSyybR6y3VUHJgGiK8L1n5xx+93gqXDUPPyE2BFwi2L3TgTWcmZOXsAE1w8j/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1jqnv5GeXVKy3+PA2J2dSMUWrWP8qlh5fFKvFo9JWLY=;
	b=1Aj8aw/L5N6zsfL113X3AHrw+UR8J9+RWXW+PsfJH+AEpUExUwlYN8vB1513w9LAT3BD
	 GUmpgFXBV6qNnjvPuN0oEb7w/vbsWofSOhwIUrHVmF2HoHoncl+d28u9HfRHZ2YVGmy3x
	 s8vvPI1qzyPvZZt4RGpqmJumy0u3iW6MpszMH8fUcdvHxeucCpV4adJ+3/UVKCfQrw1x5
	 LVG7i/Q23+1L3vfSeObIhb+M7RnXv8cdrDWh7lmGqDO1V2icnaLAkY20Edjh2wQONA+J0
	 gfbUIyXXuPYFjegYcx7BAxRqh3FbUfMtvUnyX34uydudLZnlVo3oPilYy2rNmejD/sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H3X84ivY;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6E6606A888
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F6E6606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H3X84ivY
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-7190d9bdb2cso152097eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944331; x=1795549131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1jqnv5GeXVKy3+PA2J2dSMUWrWP8qlh5fFKvFo9JWLY=;
        b=H3X84ivY37WOR3gR/T2VIty9gfAqCn+UZwUtuymtRkgRMO7h/y3RuS8X5Eg2DisuwC
         XQvfFt/gzU9dCEnFdrvUIGZoTdXF9uCo4gfdcNnENuZwhgoi0keMKKhOZLM/SAZKUW09
         c02LkxVjEMAlLb79gaWJhsyP9M+E4Pq42DW+Nl7/jsI5lv6+HwxTxBsH6w65Acz6Bjzk
         9Taf10LiyoCra2CgwgzH/uXS9+yN7CJemDz5XD700Ye3PteNSG2E4JG2TKg9BCBnRsQE
         SPVZMN4nNchKMcG1nls/IOSuI87Sutu0C92mYUaQpG5Bsmbwq4em7lfzSAFCMop7SESm
         rB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944331; x=1795549131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jqnv5GeXVKy3+PA2J2dSMUWrWP8qlh5fFKvFo9JWLY=;
        b=idk5Zs9nmG5sMx+e6ycYnC7hUbql088nB89+/r32/iuCn3qAgicVJQGzM7Cp0xt5iQ
         yv2pH2ZCr8SYVtkoQFyZe+bYuyYA0lK+2ORWcQZpoOp5sixWpynfn2X7IQjkYen4d7gN
         KoIGI8QW8dOv14gssD1DEvGojJQTlWjHE7f5AC4wb2f6cJMObofXTaOzHWoT/iaG+Vrn
         rdnYqxZHu0cwBnTdIwWrafLXewqWE9lXJnl5eScb2LCOmFGYaW0PuAcjPsWpfRroguwL
         GY0I+E2UJTw2/B+gUbLvm3+I75eoM3GefoMz2AHhOsDcbvbEbu324c1pz/blXnYXzv3E
         gfow==
X-Forwarded-Encrypted: i=1; AL+hErEdQoSgRNFmNg7yZK89600s0ytrlXVukC68CNhepKpmbIgGXIxesc+h2UdSTXmoaZP3fW2/h2vTKxStRIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iC8qjHZXk86w+iJ8pn8jUb29ulRrl8Bwr/UuHfFpRNAbEodxq
	dnyiFZBbdEG0meNbEFgS8UoikOdGOGeRainffI7OnVUr+TaU5uruGiQz
X-Gm-Gg: AYBFou0hXKQyR+h88WsY2A2H80yHhiD9NTnzjbwoHDuweeT/gJCZlAWLJgXbBMkXJ7g
	/uLP+J4O/leyjE/wwAyDPDH48sqi5concW+LglBmTDj3u7CtncY+2AlUdc5hfkFFxOY3BkNCKhX
	flDLQkiLak8EhtkXhsqYu6St8cbX1TkXJtmHjzbTX/e1sF125sCfwPtvFjbnyhBhpupbMV+nb+k
	jTQH41IRUs0fWOZ1AdLn4p+moHtgQ3lVvckx/NZf1TIa5E/AJjFiu1ekT70Osts+MroS1IOHRgS
	DCf1sb8BTqrQKhngBOEcsxMiRTt2/UXssWEOSmTjn4DNRx0oI6602At3yrJVLAYA7zv/+38Bf7E
	0bmci7/oSbhlO3V45X6SPWteVrCpoei8UWrTjyH1oHsnbFJS0D/B3S0kgHugEweI5Jou08GdwCm
	IEqzA4LnW9jJiKFRqYY/O1b5lgPijBjusRrF1XTodiQQ6VquMuXiARJ0NT+yKQeYzyZzZSsHPK6
	tTB2VAaIdsnHC6uYY9XY313iHcb6E1oRxo53p2iX+BJrwPZoCcGP5mWT/ARTmuWgGFFLDARrGna
	FUexd4QPQyqs4RICLg8fTitrtoLlZYcIIzd5DMEsqsN1kV+LCFwBDhesAdQsiaavNsyl5aNiZ7+
	FDbzrVwLgig4ekPbX5xmDzpbg9BP+aq1v8hjd4Xl+nOcNniPQhcfaCOhEkBQVGOyjH8LHPuWs0L
	VcedaHSNr7xMEmXZRKO6IXSceM6w4O+Z87WvtVOYnjmm47oSNpg8tzM5wbZYj9LFO1fMx7Cd49
X-Received: by 2002:a05:6820:1627:b0:71a:df0d:ea2b with SMTP id 006d021491bc7-71b1883e80amr279612eaf.83.1794944331147;
        Tue, 17 Nov 2026 11:38:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:16 -0700
Subject: [PATCH 09/11] nvmem: disconnect published devices before
 registration rollback
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
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-9-3cfbd48812b5@gmail.com>
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

Registration can fail after the NVMEM device is visible and a layout has
published cells. Disconnect the provider before destroying that layout
and deleting the device, just as for normal unregister. This prevents
layout removal from rebuilding attributes while rollback removes them.

Reuse nvmem_unregister() for failures after device_add(). Track whether
the registration notification was emitted so an unsuccessful registration
does not generate an unmatched removal notification.

Document when providers may release their callback state.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c           | 22 ++++++++++++----------
 include/linux/nvmem-provider.h |  3 +++
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index f1a254a0a5cb..619d33a59697 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -27,6 +27,7 @@
 #define to_nvmem_device(d) container_of(d, struct nvmem_device, dev)
 
 #define FLAG_COMPAT		BIT(0)
+#define FLAG_REGISTERED		BIT(1)
 struct nvmem_cell_entry {
 	struct kref		refcnt;
 	bool			disconnected;
@@ -1202,7 +1203,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
 	rval = nvmem_populate_layout(nvmem);
 	if (rval)
-		goto err_remove_dev;
+		goto err_unregister;
 
 	/* If the device has WP GPIO, default to read-only */
 	if (nvmem->wp_gpio)
@@ -1211,20 +1212,17 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 #ifdef CONFIG_NVMEM_SYSFS
 	rval = nvmem_populate_sysfs_cells(nvmem);
 	if (rval)
-		goto err_destroy_layout;
+		goto err_unregister;
 #endif
 
+	nvmem->flags |= FLAG_REGISTERED;
 	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
 
 	return nvmem;
 
-#ifdef CONFIG_NVMEM_SYSFS
-err_destroy_layout:
-	nvmem_destroy_layout(nvmem);
-#endif
-err_remove_dev:
-	nvmem_sysfs_remove_cells(nvmem);
-	device_del(&nvmem->dev);
+err_unregister:
+	nvmem_unregister(nvmem);
+	return ERR_PTR(rval);
 err_remove_compat:
 	nvmem_sysfs_remove_compat(nvmem);
 err_put_device:
@@ -1239,13 +1237,17 @@ EXPORT_SYMBOL_GPL(nvmem_register);
  * nvmem_unregister() - Unregister previously registered nvmem device
  *
  * @nvmem: Pointer to previously registered nvmem device.
+ *
+ * Stop and drain provider callbacks before returning. Existing consumers keep
+ * their core-owned metadata, but further access returns -ENODEV.
  */
 void nvmem_unregister(struct nvmem_device *nvmem)
 {
 	if (!nvmem)
 		return;
 
-	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
+	if (nvmem->flags & FLAG_REGISTERED)
+		blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
 
 	nvmem_disconnect(nvmem);
 
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index e0638bd50d1f..ba11c807593b 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -107,6 +107,9 @@ struct nvmem_cell_info {
  *
  * Note: Specifying name and setting id to -1 implies a unique device
  * whose name is provided as-is (kept unaltered).
+ *
+ * Provider callbacks and @priv must remain valid until nvmem_unregister()
+ * returns, or until a failed nvmem_register() returns.
  */
 struct nvmem_config {
 	struct device		*dev;

-- 
2.53.0

