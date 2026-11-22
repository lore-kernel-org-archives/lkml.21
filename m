Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795334899;
	b=BnvhsCA3+N8luDXsEamDvjkIXjk/4UD3Alpdw/dp21jZFPdQo4oNmaYL/6VEMxKJ7m6D
	 +JycD9wOpaa3cpPUqYn2imndiTWu4CbmrCT7jNciUG91EFomdKeWyvTFO3kZhTN9npn0b
	 aXsojI6HEmLMpDv01W+lHAUJGRQ8T0oM8Mjs2BaYEyOTS+xQKe1QM/xWEdFe2DiTBluEt
	 pXCXDBiVxXEGQsn6gtSF3Edqb8jXn/nfCF2pNpYCMysjfEKG0n/Y9laxFUoz6sVRs94ZH
	 M5KFr+s0qGSwSIuX9T5c3dRQoBUzDCFx+oq6feFLLstj+y3EVH6orNfiYpnP9600u7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795334899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EWUDpDx3gOF11tISsn8dosM22YoRGivzGRUaW6pDGjY=;
	b=GVeOJW1WLATDCYgPqp4GyPhk2qhcQ1yzK1289/WVB+MiXUwqQxlA7TJoPA11OWfMJGEl
	 8FwMe0NivMT0mWOVPl3Qp77qb6tsa8QZ443D0SX7o6Tw9xXB8hwFeyi1v2EKhTjOCxxBv
	 vmidRpwRBs3XaiQwUiXP5N9J52NY+olE09JOcF94GXnKF0Hlcf0bBbN5SnrU/H+iZBfkP
	 y6+LcYqU5EEDXl3/moFxmnRUl72sT1mHDdZ9JifLyVdbLrjvyFmHyzqT67j/wc9920kuP
	 gV0z0uMFu7lrscvc4JXN8fwImNaZSKG6umf2E2sPNoiFTdjeQHACtwd8vD3Q6EK3RAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uC9Jw2OS;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549E4606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 549E4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uC9Jw2OS
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so2511579a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795334898; x=1795939698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EWUDpDx3gOF11tISsn8dosM22YoRGivzGRUaW6pDGjY=;
        b=uC9Jw2OS4jLuvaA7tEOkaSrik+nD7YprBp5BZGQ8p0mMsug9PjmvJAjm4nvQMe71cR
         thKQP4baCaBUXtbzgXrddTtVes6Ezbew5Vqi2hv8B+0OgeiZ9N/+kv9opvQvEEk8wQlc
         w7Rti00eUP5FvT3SQ4kbGv7OCOeW1w9nVUZ02sqeB8Xq0hNKdUlDgSaxjKmOVzyqcG1s
         4goHEuLlHTfO3Ecal9CGCcMDWRfE6QBbmRkFrULGJPrpzyULOa6I7qsAgU4Lirr7Vi67
         vgnWlKiItkhWhCVYmoLSLoRFpy/IKktMWfMTuyOARFNa1DvuroDa55TH7+u4AdotU1Xy
         PSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795334898; x=1795939698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWUDpDx3gOF11tISsn8dosM22YoRGivzGRUaW6pDGjY=;
        b=EIcZM3WMvUS9Dyw0IDl/TCo5sVoh/H4wY5X0FSosVkgJQZh9zZOchL0XxQREZ0FHL3
         GYZnqH9cpJhkYdS/Ir9L6x8g5Y7KH9fGhDX1qmM8ZGX3eQrBSg/1v6vaeLgXfF+NgT0t
         XQ5YRUmU9YBI58Qw8UPIxmPOmI4UBkgvox9hMgA0DSjx/YCVsnYgYukqVp3sNJWC9RIw
         pVuwXb81kBRohCWf+0kKiLf/nCO7f4P67zkYXa9LCMmNRDIfMuIOCMiX9e4ECrHCYRZN
         Aps4gerLMGEZhMkPKI5d5NPG8MvGoAkZQiPoS9pxvypSpPmH9jTBsnx+xhfRgWDjmM76
         7U7Q==
X-Forwarded-Encrypted: i=1; AL+hErFNAl18NBxXW5yROIwYSBDONN6WWDwvsL4wEeyso6LBh6INKO+rjq9jLnMXizppI/JkpqeP/jKsZCUQJGo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KmJeKp4MSr+n4FoGQ5bCwH9+pP+cOl8+kB6IgFTRe0zYn+I07
	likzFZQyBfneo5qw6yTf8ryYX3jwON/Z1kbDr6/Af7cG0B7uIkivJ0Q4
X-Gm-Gg: AZFdTZc2jYZZEh+q3WPxHxGmDJ2lGXq8Attz5tYRubOa5WwnJOeJEoMy7b5uZ2vm1Ak
	n4JI4zmSCjvTw01Qshky0vEJ4SukUtkMMnwPFZpjw6u6ZSnPYoxCwDthcFmMPHavXoGV+BOi38Y
	Dy7m6oG20idV7R4guc7kQkBiATLMPHOqVrDTADwePEMzjyOCVQo/sv3K8IgU2IDvSgH58g7EEK/
	e2RaHsTZ0ESCI0d6FHTUwYMZVOVIDddMXkwaf6IrWXztlqf3vlF5/Sw4eLM5SjRhy6D6MJx58aD
	mCyJexrmeva9SGasZtC9sRk7Sd+/9xXEcMbk0dJXjrSqPO6f3nRC6kty7mJGr7GiiEFjwrUmE0W
	bWtI/1RVQZ0NzkJt8GAux7Lprf1LuvIaJ/o8MAyUfNif3QH/b10ZeFBgj23ks+YgktEuHkds4kC
	R25CyaoVJf7Z0lZAV9v18SgHVg+5fiE6NLDlHynDTaIn/JVKvqHrrTAu2vi3UWqwB9xNUqTxd61
	/RGtoJhbSjIXNGaLYCke/xg7Dj8K2Xo709bfylb+Fc4fx30zkUttoP+0sljlo6WqOZLqH7GrXrL
	9LbdPXYmRoCKZ3rYCCk9jlClWymAn2casJHN1tC+YBwlzTA4m0En986pAZQR5p9fRRB+X5gd5fq
	TkyXfXewib6L0KK3t1zpDrYEgo+5nN4A=
X-Received: by 2002:a05:6402:1941:b0:6ba:7b46:7885 with SMTP id 4fb4d7f45d1cf-6ba7b468283mr1860652a12.11.1795334897596;
        Sun, 22 Nov 2026 00:08:17 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3710601esm3596014a12.27.2026.11.22.00.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:08:15 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] iio: light: ltr501: Add LTR-659PS-01 prox sensor support
Date: Sun, 22 Nov 2026 10:07:49 +0200
Message-ID: <20261122080753.36349-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add support for the Lite-On LTR-659PS-01 proximity sensor. This device is
nearly identical to the LTR-559ALS-01, but omits all elements related to
ambient light sensing.

---
Changes in v2:
- set IIO_PROXIMITY channel to scan_index 2 since driver will not handle other
  id properly
- add IIO_CHAN_INFO_SAMP_FREQ for IIO_PROXIMITY channel
- isolate missed ALS register calls
- add commit to use read_avail operation
- convert to use modern chip info match

Changes in v3:
- LTR501_INTENSITY_CHANNEL macro adjusted to set predefined info_mask_shared_by_type,
  info_mask_shared_by_type_available and info_mask_shared_by_all_available
- added info_mask_separate_available and info_mask_shared_by_all_available to
  proximity channel
- fixed IIO_CHAN_INFO_SCALE for IIO_INTENSITY since table has -1 entries
- fixed indio_dev->name asignment
- dropped ltr501_has_als_support helper
- fixed channel finding in ltr501_trigger_handler
- isolated more accesses to ALS registers if no_als_support is enabled

Changes in v4:
- adjusted intensity scale passing
- int_time and samp_freq converted into 2d arrays
- for_each_set_bit() + iio_find_channel_from_si() > iio_for_each_active_channel()

Changes in v5
- fixed als_gain_tbl_len calculation
- restored use of iio_find_channel_from_si()

This patchset requires change[1] exporting iio_find_channel_from_si() since else
building as module will fail

[1] https://lore.kernel.org/lkml/20261115083049.46840-1-clamor95@gmail.com/
---

Svyatoslav Ryhel (4):
  iio: light: ltr501: Switch to read_avail() op from manual attribute
    registration
  iio: light: ltr501: Switch to modern match mechanism
  dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
  iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor

 .../bindings/iio/light/liteon,ltr501.yaml     |   1 +
 drivers/iio/light/ltr501.c                    | 427 +++++++++---------
 2 files changed, 211 insertions(+), 217 deletions(-)

-- 
2.53.0

