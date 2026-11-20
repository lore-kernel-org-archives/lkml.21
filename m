Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205336;
	b=3eeYJk2CeG6FqRs072rw6dp6PHeWS1518vQ9cckK4JIpS7tCDrnOOSV3b3Qj1q/rfm3W
	 +FiZAEglL/OnvG03jNEv1rWh4tqgWZ+VFh+frYOw+sd3BYz78guE0+4oNSQy0HXNGke7L
	 u2/ytiBtdIqirC8cgsIi7Dacr4aNm+nN2UuiAIEd7rj7Flawli9VnvbAov17L9Xmd8Yjn
	 5Z2EuROAfI3Y9tl8fupiwi7kN74tVcONkpHAT0mhvD7WcmAPgkRhkmBU17NG9RNgH4Tq5
	 Gy02Q+WZ5kY+0dXzVmRTVesF6/x6ezEmoqzIBsYKHlC759HBZ0lsL8TfmKtrFMIVdSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4c2tomY78ENRH0Ja91CkTFAAwqmDM/gzLGOxCRtSTus=;
	b=Zequ2ivnor1YgheONXjMX58V/D01s6hXIAdkDmnLM9N3fJ1HxELa9lCmOR8p2AM9UvVr
	 7kWR1/YXXVc4We7Fd+25JdyPyH2m3hKPfv5cKHBPa5b7QrAtHgpXAwagUhF5TJRUr6WF0
	 4nGin5Zpq/9pTSmI5fSXa8/PKBnR6UuP5/yFGoeIQUKjdWGCDIcVzXrmuUzmoo1jQsie4
	 JmY9WE/1+p7UQK2oJRl/BJDkhHOW5V8U/yj+uvLnxVn7xgpzvw6q4RJ2kzDcUGGEM0CTY
	 XuLoOiYzEu72p1Qk/vDqJgAtRgeFLg/WH087OArYhmAIwRUzpk50ZsDXsTlzAPHvGNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kPhJgUNe;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA42E606A6C2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA42E606A6C2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kPhJgUNe
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8631e07b756so483259a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205328; x=1795810128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c2tomY78ENRH0Ja91CkTFAAwqmDM/gzLGOxCRtSTus=;
        b=kPhJgUNellhycDbtC89h4S2cNeoJ0fdRWJl+AfN7lrYIOsdYZZAuKk1JEPHv8wGsv4
         /hUFpTg0ge+Z9wJ+gCxeUTQxAnP6RxrZy2P3wdaBim3DM77m6IfSXeGIISpdCeMsPFKl
         laDhPSK+kpKgf6xZzHCwxHEqvzongYhyBX4Zt7if8dnFEAp8yVknlSrQAzQ2k/KawvsE
         cCQ3W1nSVODO/ZH2vnyRizqvdSpRG4YyzJxBfbbHCvTgexN5k39vDawxGfr39i4WaiZQ
         JVvcOsVDMK4yfo4896vUVrOe3ikB23IYtasg40WwuE6ux1Aabbd3cCKoinqEXo+Z3ExL
         A8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205329; x=1795810129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4c2tomY78ENRH0Ja91CkTFAAwqmDM/gzLGOxCRtSTus=;
        b=wzIkZw+CrrNlqk22ISezebI9NBwvOmcGSyiVsk9cMxzhcFFEfF/PEeJ4yGJdlythlh
         +I2Jo3UtSM/MVg96Dwg8qJEwMJmDbSWCfGYLTu+CnCwcebGdH+Zzx7f7FffMpngYln5i
         eTKBz+hDry1TZE7b74GbY2rrH/cXKJsNjJl6mi/v8Fg7n8Jy+onWEMWyhfKYUREbtESb
         1ehKQjcHEHNcGn1a2XCnBm61O/rZP+117xQDApRPv3a7fwcktogn/tVyxaSM63DLTFfj
         Q0UYPZ76e6PTrMSDHT97iy35EY9bhKbnRfkvuZPOdDnGF57v5TT2p2m8L8/mQDIA6+mb
         Alww==
X-Forwarded-Encrypted: i=1; AL+hErHdFlCKJ7feTW4OHB6qzKos1T/WnbwhrdmGvt9+oWzsmrBUZQQGERn7QUTY234YuhDC9FEScGrbck7WVnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8E3tUc7hMmATS1lcWQ4PG/PSROorPCOn+su6oAandGmYYfb6T8
	0EmrcvV6uu24VYeAeOpgHCCfU9xdDyl8Cok0UXNLhg3SFX65IyBLDOZN
X-Gm-Gg: AYBFou2Dm3SeLMBi8ticEClGomq88flF6OPaxlkgm6si8wNbhbGkhRAbVn/IdOEWXy5
	57LZWH7DsrwihpH3wsucRIU6FagcfgMH/+Do9k32lSsLdSGy6I7JOo1p2MYhLEvJtCIkudKv7lD
	/FXzGDNJCzOJeJpAHQn3vJVuNsxiTi9d3V4Qi8rbm/vdFYSSaZkuN9qKJ6II+fkG9u2EHWhXqvz
	OB0ifleWV0YhOvEGtaLI0k702faMFUORvOBLSByjhsikR9yLiurYyf0AuDBKaNX8cvDv2LLXzUl
	XSF5wHwmNDum6KYPzNZsxju7Jgza/+g6Un8mk7WET7a39X5WNIi00m+YWfqVHAGI9xjgwVo3Ach
	Ye/FJeyH+ZQz9zcPw4iP8tLpHUOdL5R71fPCBY2ROfsU5tGqOF2WtYGZGhZZn0uJ7Zl0qQMF7nk
	vvhLZhC6Kj8tjNEcemuabQ88TgEXJh2Xrl8m5UKjDy9Usc1izJV81M12QU69ibcgdQvGY0YmLdS
	Murl7ksSmg0nKAymdXdXhhoP+7mQyb+Jdn/hCiOSWPn1WxWUnqSA+x/+jlfCK9jQ6C6IIffq/mU
	sO5xsBDnDryb2gv6r8IsjAHg9C/kacvMppqFNfgP1X7D2i2+32r/54SbzYseOdRuch2KblRZG65
	DbAbCMNBZkpHEC5akRR1vfv3zaVVIRKwVV67ZXTcSg+kIVpQv4gTxKW9KWLVcFAEqLojctX/CkK
	dHBom+V0Ep3zxF5d2OD3ibQ6Hjm19ItB2z0BOw6rVB7xx9VIfBQ5aA
X-Received: by 2002:a05:6830:719f:b0:862:c6cb:2df2 with SMTP id 46e09a7af769-8631593a225mr4802462a34.5.1795205328580;
        Fri, 20 Nov 2026 12:08:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:41 -0700
Subject: [PATCH v3 11/11] nvmem: allow providers to specify an explicit
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
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-11-523610652402@gmail.com>
References: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
In-Reply-To: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
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

