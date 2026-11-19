Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106561;
	b=gBD6e65pyfnBl7yMQoPn5aJkog8bxQt935X2SxiAmN/uMDDzndYOz3cgH5eR27JM1ycA
	 QHI+nmtUx83AboWhDA0MrJG63O6pdtxmBzjhvfloaTivh4dt+BgawUQgcQHVDvCrgc88p
	 JN+MDeqIToZnH2lqHjkqjrIyiQIQUx5SvA5I51FZYmWaFu5XaPGnSgOhO8ZdH309xDBnl
	 z4uVirhVSwk7DCYlm+WFE1hqV8XLm4RO1eiLeOwkbf8c5Ntrr2v/iOHR9fO6pae0ao+FC
	 vrhEDexLRE/52zaY5OUPjwLAzdP/aLkgiVsxPq07SOuQLq2V7/YzfQsJymSZpMjtkKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4c2tomY78ENRH0Ja91CkTFAAwqmDM/gzLGOxCRtSTus=;
	b=eH4x8CUq0eWSxmhrE1nruE2ntXUqEQ6WcXZkCtc/3i3qmwrDgz8nGADmlG4YNCsDSKI+
	 4rHNSp9oJgEFd6XdAvBxfUpMglivgVTIRC6NWJPh7FznaGWSfojxppQXftEdBf1XoPuMP
	 /hFcUof/01hrdNOreDUvjIPTupwHdgNSEe3t/oaD7vZTzhFBG0OZhp5ryGGYglOMGVHOq
	 PW4wJyAPPHBv7dl3RX2ydFZQbZHIwngmKNjcSPGB69rxGT27qSfHvO/nJIOZrWjGzxFsj
	 cbxx7ki4un4pcR5v3dLRkw/eSVuLH+xiAmrzuorgI+FlBLMH0JDQ2UQs8EP9yVIun3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sq8tA4IV;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C516E60A5BCC
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C516E60A5BCC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sq8tA4IV
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-71aea92f666so1593608eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106560; x=1795711360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c2tomY78ENRH0Ja91CkTFAAwqmDM/gzLGOxCRtSTus=;
        b=sq8tA4IVlwNQYh3GCsbQYbM83DahYmZVtQi9b5vBFV2q0448yWdksWrhIss9XyUnt7
         9wIpNZYX82DkbCbVklCTdj4NgFNO5GpFgtUTS7f3+nrdoX8vjHOe0ePp2qu6IfmMK2Wy
         0XSmGI2vVTsbX2L01DH8kcwte6y8KzD6Yw/JuYfTfB4hgDBGeelB12SnrKqhl2MTpfPT
         /sLLgBPlX7n45ophDzkl8SVC9CnNH5gfVw4cCu86/AgPiWd1sFBFjX+TqQ4fkDokjTor
         XcPEiIY5iUrmZNQjDPfftle1iAATkNdSc8r3MLLB3HHMgfJZSkfvRwu5ygj6wKFoOqQb
         WRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106560; x=1795711360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4c2tomY78ENRH0Ja91CkTFAAwqmDM/gzLGOxCRtSTus=;
        b=x/yU/K3+OLYrUhvZElMrPhNPwX0gc0DlImIoKRlA/ajeV1fNNp6JK9qCyQl3QSoDRX
         M86NHzu3mppqzgqvLApWhAdDZ3e5S8mikVAJq0MqViss2WYcZe96jBk4A0Il1X1OLEfH
         bpYAU1C1T45i/AXJY+M8+9qPceiSlf4dQcrNyb75AKis9fja3LiABkVMT6V9+85ONbIS
         qfqTv483/b+xScXoFqJNEhcKCyrhWYdDgeA/2uspEVOlr+hxRNCLBayxt3uUQNOW5ASg
         bBVu40hUEe4+QAnpT/nRx9Pz8jatkjR0qAOIPN48YwJMBgFNuqKgdiUWPJ/o++2O+h/0
         px2w==
X-Forwarded-Encrypted: i=1; AL+hErEF5L93Utq1CIGnTrZVwLrWnATh7ECWsA1UFT7pRrrQIicHNlsYz9tuJGQQ++glaQj0YwJ5P2THMJ2POTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zcBzLA9qPPfYaph4O5D5OqGyt9b0hdHOqqTrJ9VTt+Jg+ra4i
	+kNfuKq1u/1mJcZxEHi+Ix8/NdqoveXOSwSira+ZQvnfFpG6F5fmHFFW
X-Gm-Gg: AYBFou287misSYvWV+4ir6L9kmhdmLLujJKdhjcRHkRp7PepSJAKSfKPTB7tUh7VeSw
	Z6s7n2jBioXbVV8mZYkydlJ9JCpVsFIMnInLUlMelYOLXDJuOrVx3LwntjuVUxmasJYr4T+T1jO
	NUy2JCO/J8aCWRhMqwB0TrWNm9pxUAnBjXS9MB2By7Qmt9tIoMUthdpCA8UOhSQwwxxgV1HJUyj
	jn3CBMtSLvTbhcF54kmJEzvKE3FOxlk8iurF5YeorrQNMNool7N+8ODgq8xW84Vj5LujhFbK1RR
	KzsAA1Ca/MaU7JGs8xWPbybK20cl7ld2lYIsbWLA7tyDMHGhBAiFqDDK66epUG43uSPKRNRIkDO
	AhpI3wqKNoBHf9phIr//Cm02UdOh2s1NiU61WmJhKV6qITWTtgVNh1d5E9/Ci5eKTgITboT9TSp
	fjgnLLb7lyPTzC5LO7AD4z4G6EDTZkx3/gdqDxZwwbAugWZ5WmULI+bAnoO8jyi1bhKmKvCfusr
	zPtj0S1MhFy6yKoaOFcp+RdPme2XFdW2yjwO5FduhhAcG7ZWx6FYJUw07BfsthCwHdIOjCDjYs+
	xFNI7L4mWSaG/a7Aor3GqGiDpRGJNEWisl8iN5t1XR3kMT5BHDKwvPcDNyHQ0P80RMGloOgO46A
	w4BtCLF3bebBAlBP8/lpctkLHhjm1ybHbBjVRTZaqn9JgKAZoVKRTEgO+yqMfkHyL9o1Wvm4sDB
	6hR+PSP6wxk16zjKxv4ptOG4idMIKvw+aYB837u5T/3RupkKBW8Ys=
X-Received: by 2002:a05:6820:f016:b0:71a:f065:6179 with SMTP id 006d021491bc7-71b39036693mr173733eaf.0.1795106559685;
        Thu, 19 Nov 2026 08:42:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:42:09 -0700
Subject: [PATCH v2 11/11] nvmem: allow providers to specify an explicit
 NULL owner
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
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-11-8fca3ec5f18c@gmail.com>
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

The owner fallback treats NULL as an unspecified module. A provider whose
operations belong to built-in subsystem code therefore cannot distinguish
its deliberate NULL owner from a request to use the parent driver module.

Add owner_is_explicit so such providers can select their actual callback
owner. Leave existing callers on the parent-module fallback. Unregister
still disconnects and drains callbacks before the provider releases its
state.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/nvmem/core.c           | 2 +-
 include/linux/nvmem-provider.h | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index e878931f375f..bf6f2cd50970 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1111,7 +1111,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	ops->reg_write = config->reg_write;
 
 	nvmem->owner = config->owner;
-	if (!nvmem->owner && config->dev->driver)
+	if (!nvmem->owner && !config->owner_is_explicit && config->dev->driver)
 		nvmem->owner = config->dev->driver->owner;
 	nvmem->stride = config->stride ?: 1;
 	nvmem->word_size = config->word_size ?: 1;
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index ba11c807593b..019fdf04cafb 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -81,6 +81,8 @@ struct nvmem_cell_info {
  * @name:	Optional name.
  * @id:		Optional device ID used in full name. Ignored if name is NULL.
  * @owner:	Pointer to exporter module. Used for refcounting.
+ * @owner_is_explicit: Use @owner even when NULL, without defaulting to the
+ *		parent driver's module.
  * @cells:	Optional array of pre-defined NVMEM cells.
  * @ncells:	Number of elements in cells.
  * @add_legacy_fixed_of_cells:	Read fixed NVMEM cells from old OF syntax.
@@ -116,6 +118,7 @@ struct nvmem_config {
 	const char		*name;
 	int			id;
 	struct module		*owner;
+	bool			owner_is_explicit;
 	const struct nvmem_cell_info	*cells;
 	int			ncells;
 	bool			add_legacy_fixed_of_cells;

-- 
2.53.0

