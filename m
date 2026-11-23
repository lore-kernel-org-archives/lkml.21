Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417284;
	b=OSOjpGpW/rfccWA7vlAMxbNcQcCMHXxRJHyCW+jYSowK25z6WJHUpdlvy4TGV2xwhHxM
	 lvuQR53RkEEEqYuNzDVbgfeJA5EStLXrYSCzfkho83DA+huXekngflqWsxjFbRQ0kx1w8
	 criliNdX9nGs2ArWLP96czSx0ntr6fH6ML6t8xyQmbBt8nHjva7M8ot0I8jOCcCICp7fr
	 /ZFWFu7/HoAJy8jk+yFsVD+gPYNLkgRBY9w7CzSu8u/PI6AkIz2bVWVI3bNKuaCHtpRCT
	 qSqi4Rjx9GVbgqXhSwsoGCFpUC3L8eQ1QzFQF+84PC0wjKdt3JG/h3FVNRYhbxcJruQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fgm5ZvS0zUq+ILWdJEIWmTetdq2Cml8WgKwtmZG127A=;
	b=ItYzISzIbpHLMO5zGaCvi4ErqTCac1B4W2B1mBI2YiWQ4tmYOkF6I8dda0m0DpN75pPP
	 Cz7NXTxlMaxF1wfazoJ4RNmEO++IwMhmW7SWRvOjfqMd6FyVqmpGBXZjA6u4s2Z3SsOxg
	 u/QBR2+rOSFTvYQntoVs4jd7LNjNLSQqoyatmTd86PzPt9YqmWld1vGz3EYcJgUu+YIwV
	 14c00mWZZfaRdNIcLb/8TR+duMCOi3nQAyHp8+cdnbFKOwKg4Gbh06DPvPPcxXXkyYmd+
	 ff5pZAitY8YsdiXPShZVkzRVEIrA0i2h32hj9M1jCdBr3MhpqRNGbb1xLzVPtzRp0jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+45vGMx;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B52606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27B52606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+45vGMx
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1758595f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417282; x=1796022082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fgm5ZvS0zUq+ILWdJEIWmTetdq2Cml8WgKwtmZG127A=;
        b=u+45vGMxjS42cM2492e89L5UWBsfoUxgsiUha3+nrcTgxNCcxkU3AzU9iGK/z+J7nz
         cwU0LEl7S3RO4Ae5PFR7gp8Rzavocr8HFfXV4/wuSZwB6YY99Aug3CcqLCZ2w6CaMrmU
         qwtmsOHv0NNmq71p5XL2aig8ljxJO5WpPAJS3os63gUq00+hlkJq7vtxf7AuQIw8aX8u
         RuUqnJVGa/5Q/ygbXDHAXvTw7A0n04wJ1aOx3tFuat6sZcfNO/zfLzp2GD0WMtedkg1y
         GAV/QHAOvQp0Q6xsedABhEOXtoy5BMCrz2Xh7oG8ohplTq2iHqrXPylyYFWKovnngXx+
         D+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417282; x=1796022082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fgm5ZvS0zUq+ILWdJEIWmTetdq2Cml8WgKwtmZG127A=;
        b=zyrBJ31F8jJkbosNWXjCU560Mie1GqmxIRaCRNYMm/+MCLXkR4cDwWv7kvJw3iHfFk
         t2VyjZOLoEMEMwjaQSRs2dX+ZgsmCKDjuKJ8488B7S5WgQL3E+VDJ6NUNs96YblX4nO9
         wWvNwBqetdjvAruN4DtRBBd0R0gyxtCd4J2H/f5llAvT4oKQMx/Zg6nRVrab8KrI4/uS
         vOAo6V6jk+NIuqrbG6OZ4dxkrTcXIcFqilRCLbmqX415/XTPXbg/HS/1pHmy30jvwycj
         x9L9PhBGD3OPRq/3Jfzp3E0Nkjao+E6MiyVECHhNq+P49kf3wHjM1TsmYzKMtvHl4k2b
         /Flw==
X-Forwarded-Encrypted: i=1; AL+hErFxKSywsVQWmTWCZuHmSrbFEIKcoUB2hI9iNIjuBhykHvcXeY8QeLVZNtcgJsleiIKaKnUkB6lp69ra1mc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/Yjdc93/80RnOdVEMvDKMUl3bDXhf/D2/EuIJ6Kv7eNN0wqsh
	2c63Zbwg5HHeud7PFoHVNbX+F5jft26I9tYMZna4yAbUWm0UVnuM5ryC
X-Gm-Gg: AZFdTZfTegaCGdylxv0G9oo4HuUwBSmKwYUcLYv0Q5bgNQQmutRyPSiNqQym+8iin58
	yjiGLk/wo10if+ruCxUTCVyf9hc6WmqPg7/OYcCX0li4FBRXpwixvywRXDgDq5MRBsc3uT1ZSDy
	znlSqlYQTPa4PEFXnIy4gh9CkRuUjLmC53rLgmrRq4TI/WgUXGlB1zY9saV/Iq3+rIeMVT22e4K
	iyJvtcc/PqZtr0lxEcK3/oGd6pYM0vmRoKgwe1GiJHOb3vYWB4Q36qyO4jmiGQNQWGH1cuAzOsG
	QlXCb8Fduj20jiP5IrwzdGNI5nylcpDVmwIpefsP5Ny/Tug2rtPoQvnEb9v1P5D20weDMMjIX7L
	fsnx9Wb2lSxnzJBbPnPF/xhqU/rz9QoHkuLns7t+0cvWPbRH0DwXT+4UIEx+7gOtwd0qS8oRDR2
	eKm8XmXzSVT9h/iFeOsgmtxK6gEojKpybqiA97YMEa5Va8lPYsNb24gCbPNocAVaJnYOyD7M2Ug
	VujZYD7yB9XSqID/HT8yHBoaYxREtPIDSDowaA3vDocwLyIp0yRSEMdUOKmxpe+5nSKiSpeDhvn
	4a2QQmhnPuvTVN9/X4yN/w==
X-Received: by 2002:a05:6000:258a:b0:48e:720a:ccaf with SMTP id ffacd0b85a97d-4abaab633d2mr21602958f8f.5.1795417282236;
        Sun, 22 Nov 2026 23:01:22 -0800 (PST)
Received: from fedora ([154.182.66.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm20779007f8f.3.2026.11.22.23.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:01:21 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com,
	amin.gattout@gmail.com,
	antoniu.miclaus@analog.com,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v5 0/8] iio: adc: at91_adc: fix NULL trigger dereference and convert to devm
Date: Mon, 23 Nov 2026 09:00:53 +0200
Message-ID: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series fixes a NULL pointer dereference during trigger teardown in
at91_adc and modernizes the driver to use firmware-agnostic property
APIs and device-managed (devm) resources.

When the "atmel,adc-use-external-triggers" property is omitted from the
Device Tree, at91_adc_trigger_init() leaves external trigger slots in
st->trig as NULL. Patch 1 provides a minimal fix in at91_adc for easy
backporting to stable kernels, while the subsequent patches modernize
the driver and convert it to devm_* APIs (removing the manual teardown
code and the st->trig array altogether).

Changes in v5:
- Patch 1: Keep the minimal NULL check in at91_adc instead of modifying
  iio_trigger_unregister(), and explicitly note in the commit message
  that it is a minimal fix for backporting before devm removal (as
  requested by Jonathan Cameron).
- Patch 2: Drop the redundant dev_err_probe() message after
  devm_request_irq() in a separate patch.
- Patch 3: Switch from of_device_get_match_data() to
  device_get_match_data() and check for NULL in a separate patch.
- Patch 4: Convert of_property_*() calls in at91_adc_probe() and
  at91_adc_probe_dt_ts() (renamed to at91_adc_probe_ts()) to
  device_property_*() APIs, removing the local device_node pointer and
  dropping "in the DT" from missing-property logs.  Since no OF APIs
  remain, replace <linux/of.h> with <linux/mod_devicetable.h>.
- Patch 5: Introduce local struct device *dev in at91_adc_probe() and
  switch devm_iio_device_alloc() to sizeof(*st).
- Patch 6: Pass struct device *dev instead of struct platform_device *pdev
  to at91_ts_register() in a separate patch.
- Patch 7: Replace raw 1000 with HZ_PER_KHZ from <linux/units.h>.
- Patch 8: Convert the remaining buffer, trigger, touchscreen input, and
  IIO device registrations to devm_* APIs, use unsigned int for the
  trigger loop index, drop the now-unused st->trig array, drop the
  redundant input->dev.parent assignment, and remove at91_adc_remove().

Changes in v4:
- Split the series into 3 atomic patches: (1) standalone NULL trigger
  teardown fix for stable backporting, (2) local struct device pointer
  cleanup, and (3) full devm_* conversion.

Changes in v3:
- Address review feedback from Andy Shevchenko on v2 (drop redundant
  -ENOMEM log, use local struct device pointer, scope loop index to the
  for-loop, and convert error paths to dev_err_probe()).

Changes in v2:
- Drop the simple NULL check approach from v1 and refactor the driver to
  use device-managed (devm_*) APIs as suggested by Jonathan Cameron,
  removing manual cleanup functions and at91_adc_remove(), and inlining
  trigger initialization into at91_adc_probe().

Abdelnasser Hussein (8):
  iio: adc: at91_adc: skip unpopulated triggers on teardown
  iio: adc: at91_adc: drop duplicate IRQ allocation error message
  iio: adc: at91_adc: switch to device_get_match_data()
  iio: adc: at91_adc: convert to device_property_*() APIs
  iio: adc: at91_adc: use local struct device pointer in probe
  iio: adc: at91_adc: pass struct device to at91_ts_register()
  iio: adc: at91_adc: use HZ_PER_KHZ instead of raw 1000
  iio: adc: at91_adc: convert to device-managed resources

 drivers/iio/adc/at91_adc.c | 266 +++++++++++--------------------------
 1 file changed, 77 insertions(+), 189 deletions(-)

-- 
2.56.0

