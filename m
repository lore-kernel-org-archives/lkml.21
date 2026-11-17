Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944347;
	b=bDfFUUyherDdvyVTkjk0DoOEALuvAmCZ/b4GsC3Vcd19PErtx6UURCVdgot8/5QgmueP
	 /CTrANW6Jh4OfmCRPbHfSXYlKS49Vo57EWN51KaNA2FmGPIgCl8bthynyVZlg/jOwIs3A
	 N+SXuYqG8ppGTNxfx6+A750yPM7PxvOQFfYuXR6+2WtTN3HXCzq3/Xv28TntalhPxfltn
	 Ub7vHn7r5mekBkKx8AVOfCD2W46s62MptyAYA2jSrVM2ck6hJIqatZnNMabt7i5W9mYZU
	 Mhotjjz0QaPNiq/kGVYqR9cdGDxo0D6if70kWjqfFqVV/LseFvvMC52CuW7ez29BIHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2Kp/vW2rYbu146OE4ja3gtScPJUsYh5ODUd1IOAYRU0=;
	b=O9Q5UQmHsyylY8oBMgZ2ojziMgWyJOC2GsYwSXelhuMLYl47FQiFz2/4gM1sVLE9ufz4
	 7GEKgLyuKh9qHBYfP9eoZ111nHQirYQvxR7IFpzIzsB67zKF4iCCzP5/B2XLuJ4jxTUJD
	 KDoifPfO0ZF0uCapBWJe+pATP29C9DYUfhwWTkCEM00D09faLUydXwpuN+WVxe/+HjPO2
	 YavsCf+IUf4FoV69piYifSS0zwJsQdGtRIpqW69UcpRNwcufKkWE3yf4N8CebCYRxj2kU
	 Z5J1upnJIEdkBYW11jKWEE1YkyoEwaA9wqGQnayLL6UCRmMfuQ1V1jmX9uqpt3HIVmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R5EfHuco;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75DF606A8A6
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A75DF606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R5EfHuco
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-71acdd32a53so87591eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944345; x=1795549145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Kp/vW2rYbu146OE4ja3gtScPJUsYh5ODUd1IOAYRU0=;
        b=R5EfHucohNaUVdoxKMVG9ybtcRpFm7GdJSZ0iydHnmPnnRH+Rxq+sgboILuMpjDDfN
         1jK7YMR+vsXS/91cUuNHC7trZ260s/uGuCMZs1C1z27izOMaEhMiYSFUvmJmsQPUfE66
         UPABYhUteOZ/MuGrYejhdCsAho8t6Nw/KlRiYb1jF0ltEaPiMf3L6Sb+acj8tGV+G/kN
         kHdXw27uWP8JPVwb9EVwfkRMXf4D1d3s8aumuPDq2+8A1OdrrYC4U6wHZcb/E4/hPRFe
         tQakelpHRgfqVtOtuBNCrDbFs8hZDzORPyiX3qQldetSFrgOZZEu2AVQBm8I/0rQNe9W
         Ys6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944345; x=1795549145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Kp/vW2rYbu146OE4ja3gtScPJUsYh5ODUd1IOAYRU0=;
        b=IwCujFoZhdi3JJCE/d110mxM6aCbRelGjQgz54hjZbVmqaoxrenUmqCZ2lXZXkkz2G
         s1baFreDL5M6HQoUL5pforeoUs1oNosNpFx9hfqdVPOJvf8+06TZJTuY5YsELEh8Kj3X
         R7h8pUzxPmEQfnkAa4lYm+ls1OQHVpzTzKSmLlQpV2J4ZBinUND5eY+54iWHJqeJq7uI
         Scd2FFl6JaRBAfaoIC37MR+hBsmKeOGstJ8c+9ZAkGsXVqWKcHc7OX8UemE1oBWQsXbN
         M/TEB/nO+6khfgvrH2ANqGimkdYzaSCu4OQs75iIjQ0CPNGTmg2Hbq0zQJAlT3SQmCHX
         gf1A==
X-Forwarded-Encrypted: i=1; AL+hErGGh9NSyPjUpIj8zRFxiZC364OAqPEA4JhoC3TLuuMly18UG0lrFGLE7ut1Jso0J5vY65vb7ndAoO0Hm1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WQSisVesq9K8TkoewKURzAWNgiHpVfOOKrRHm09gEon4uIs1G
	3pm48oEqkwXnKREs5CQGVzWfRdnMj4LUdCxHW+6/CzyLwyG+o5fZ5B3b
X-Gm-Gg: AYBFou1oYX40rd44i3VmP/EJ2uloPfHQ6ZBG/DsQhAFRUxYCFdIAKUYtp9OvMNnZQ+K
	wA7of3OwPZkCLtirzQlK9508RSWn6tbyoJzcAzvzcrdC8xRhFLZvBeHpVH8alaageneGjgdM3wI
	P5tD1a3Nho2PNOCbCo1nn5jUxJdAhDggPXR8anTYkT+gyjx19OZ4dCaaGBBZkDJilvDs+rrshQq
	2ZW3y5YcV1uGo4FlxQkP3gLrj5QA82rntaPu4z6Tpn1ARJCRgzatod0+CNbb+k24GleKbIahAGT
	vnoCLBHlOTPY1fUsW3MTTtL0PfDve/GQpkb//CmNdV193iMNIrvsloXyMKFGqVqXa0Q0IeS+u+6
	OG794FDLPNXBYSp9zpa7c6hc62YCB8M4eu25MNnC/NwH3TXssENvC8VxCFJTaq6U0BpP3TzUG0d
	L+WJUY8x5JRn0gCMJrO0xoWJ0iKt5jTTa1uk9jeFBmUcXLRB3/npHRzL5n7tifVXe+1vSvHsXy5
	0mI6nRV6KRJuTvKW23/CMmS2yS0DTP+IFYcEyBBmX0ojg+D//jBiuNeQGnEowiy3gUoByPgRgOs
	Qv2gK4mkoMBcV7SwOk44RxaiahwUmXUmmOXpreYozU5ekcEbkAqB4/E9l8eL2mM6eq3LQ6JNamU
	gRAVK9T8ckjv5dII0WgRZPq5jJY+kZYigRON4dKul1WkFjIIPPzJpANZdOYGakun0PkpUSzN85u
	13jfV0THqyWY2lHoGQw4Le2hHvYP8lK1gyPcAC6TI79eKXdF/DXH8=
X-Received: by 2002:a05:6820:2387:b0:71a:f754:a236 with SMTP id 006d021491bc7-71b1865dca2mr216966eaf.83.1794944345608;
        Tue, 17 Nov 2026 11:39:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:39:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:18 -0700
Subject: [PATCH 11/11] nvmem: allow providers to specify an explicit NULL
 owner
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
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-11-3cfbd48812b5@gmail.com>
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

The owner fallback treats NULL as an unspecified module. A provider whose
operations belong to built-in subsystem code therefore cannot distinguish
its deliberate NULL owner from a request to use the parent driver module.

Add owner_is_explicit so such providers can select their actual callback
owner. Leave existing callers on the parent-module fallback. Unregister
still disconnects and drains callbacks before the provider releases its
state.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c           | 2 +-
 include/linux/nvmem-provider.h | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 619d33a59697..ce2a35cb6670 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1132,7 +1132,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
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

