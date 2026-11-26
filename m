Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690120;
	b=YnPmtXqXDuDVDDufWmLA+EDAwZ1RD7a4z5kqd0J/qeAg/+2CVdAXJEYZYoTIc/h6IsSL
	 SKRxDaiOerySfOEcV8umKBKkhBvzmp6w9REiBhyvq4l93B0DlYjYYKMlQAAdQFGtsTkHK
	 uJlMXEPr8T+eB8dagR/OinZePQ1jITJ3gGAPPotOPBantlJA7ShV07Hd6B4gJYBU1UCCT
	 7MWr/fJjhHzAQh/7cl7UBig8EiPsxXorwSagGJ5UaURl574ac3MhJ88cA6TqC/39qUooP
	 G0qlGYsg0tKQnGH/xnIy5LS7JrDjGVz9eMfIKwMNDmG5ZNQ3fgmArUVnar1cc3s4aPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=q0JMax0vQd34r8Jzb5i5IRxK+8bWWNqoR9qhYGl1CV0=;
	b=TIBzw0RLBbodAQZ95k7aQJQo3HBVhYz94nCMKsODZzBof2sUbK8JNQEZxtvRLmiLFnLI
	 WYZeeknA786i6wFxqbHQ/BXhaL+B8lzULKnlNNjCFj/YH3uUMeABlrhXh65XKoWUtV9oE
	 jbCWmIfBUp9BUxrdChBR5ecDbqGp+CiEz9ZyexkkRwmNZT3WLFcJZ8w7MqOXIxtREP+4s
	 bBgAe/G9y/IXFzG3IUUaBNRnygVGdhyZdqrbvSMY5BlXU18oHREvpo3Pc/wC/gL3wfk5b
	 pl5EcmTuw+OHFHqZF7dnR0GXj781m4F+cEv7hDYkccFeU9LmR/jFy2Y1U6qFsyCOQkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jTBWfLUe;
	arc=none smtp.remote-ip=209.85.167.69
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71204606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71204606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jTBWfLUe
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5c3251813beso808693e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795690118; x=1796294918; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q0JMax0vQd34r8Jzb5i5IRxK+8bWWNqoR9qhYGl1CV0=;
        b=jTBWfLUeGGzoEr3whoChgn8VXNQCPbGoQHrUrNq223/OFVMvZlC7xkPfFKOjdtwwVV
         vNjFWybYvyBrXxsoT5nx/Wx2T9+P8lO7hgIIYEMey0PiPK33TLuC2RM9eYXVWhv3+geU
         JU9g/MHhR2/CMRjM38ZnN+gz9u1uuILmd7v3v/EGXokxDd0iXIBK67HcBeX+TXyzDfWL
         ZUvx6X1vUObilt/2LT2ZXnbMuT/BA29v7GavCEsJ2hXobFPnGEw4pE5VXh2lOXoWoOjq
         q+sG36m0VCnKFz+T7YGC9ZWXx//Vt9rwUn8L+XVnyr6a+p1l4FQXElNLvxLdvtiAi1Y3
         uVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690118; x=1796294918;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0JMax0vQd34r8Jzb5i5IRxK+8bWWNqoR9qhYGl1CV0=;
        b=nb2xPTEnqaflcjApbRfBjnMjyxHpQ114hyCCu5dIIiYgGCBakDuLWjKPn4JSHnZtlq
         4nIbqiXkScr7b8PLmTHvUjL+/7TX0qqn4I0Yw8R3CoelrVh3jD7gYoDTBy+jiedSnMzb
         zq9nmyTH2SWAbPbDhVmCQH0aA71t9USKcY1Ct8lW8Yg1uEYsRXsloGT6F7bRO+JHqiI7
         8LXEUTVb1ENnvjYMp3/mFbSyCvjrfJVVDGCYUbJbukZ4VKQ3Tyl4EbfcMX7RSJYkAXJL
         QDNqdcet0EJ7ywKILDU8aeyoakOdtJKyHlVeTtqpTJF593c9+25a8AqGWHWZBhSD3/ZF
         26lQ==
X-Forwarded-Encrypted: i=1; AL+hErEHFOgFQ3BQOX+XCZ05RdCRMdSIgaLR2+IcI9veGSRyKX1YDl7ChZnLItz5h0c43hsVZYXtTSZa6XJGTMM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nxwKTDiZjmMg8HKTkcGJMY8nWLqsYQpWHoHiM2501LLla18Q8
	CHW2QwBjrzWJZbyXdjhKRkBY5cYulrK5ADRVD+x7pM7jSCmJdAOfDE8GSXFHU4Jzia6lEdSL2oR
	KbKtRwbREPA==
X-Received: from lflu22.prod.google.com ([2002:ac2:43d6:0:b0:5c1:a392:10d])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:ac2:4f09:0:b0:5c1:57d9:270c
 with SMTP id 2adb3069b0e04-5c1bc8743dcmr5885193e87.46.1795690117479; Thu, 26
 Nov 2026 02:48:37 -0800 (PST)
Date: Thu, 26 Nov 2026 10:47:55 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126104757.2860272-1-dbalint@google.com>
Subject: [PATCH v2 0/2] Introduce cros_ec power monitoring
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, mfd@lists.linux.dev, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, mwojtas@google.com, 
	Daniel Balint <dbalint@google.com>
Content-Type: text/plain; charset="UTF-8"

This series adds the ChromeOS EC On-Device Power Monitoring
(cros_ec_pwrmon) driver to read onboard power-monitoring ADCs, such as
PAC194x, wired through the embedded controller (EC).

Several ChromeOS platforms are equipped with onboard ADCs connected to
the EC via I2C. The driver interfaces with the EC via the existing
EC_CMD_PWRMON host command API and EC_MKBP_EVENT_PWRMON events to manage
ADC accumulation and expose per-rail accumulated energy through IIO
energy channels and a triggered buffer. The driver is only loaded when
EC_FEATURE_PWRMON is advertised by the EC.

This is a borderline case between IIO and hwmon. IIO is used rather than
hwmon [1] because userspace queries all rails (up to 64) together as a
coherent frame -- for example, to compare per-rail drain contributions
across device-state transitions (such as screen on/off triggering a
snapshot) and to correlate fine-grained ODPM frames with other
timestamped system diagnostics for off-device per-process, per-rail
energy attribution, where relative deltas across channels are as
important as absolute values. Since a single EC latch and MKBP delivery
takes non-trivial bus time, latching per sysfs read across 64 files
would introduce significant inter-channel skid and redundant EC work.
While driver-side caching in hwmon could avoid per-read latching, hwmon
has neither an on-demand trigger ABI to force a fresh latch nor a
timestamp ABI to report the actual latch time (or expose whether a read
hit cached data or crossed a mid-sweep cache expiry), making IIO's
explicit trigger, latch timestamp, and single buffer read a cleaner fit.

Reference to detailed v1 discussion:
[1] https://lore.kernel.org/linux-iio/20261120091022.1459658-1-dbalint@google.com/

Changes in v2:
- Dropped v1 patch 1/3 ("platform/chrome: cros_ec: fix alignment of
  ec_params_pwrmon"), already applied to chrome-platform/for-next
  (346739bcdf65).
- Replaced custom multi-value energy_value sysfs attribute and its ABI
  doc with standard buffer-only IIO_ENERGY channels (.read_label, scale)
  and an IIO triggered buffer with IIO_CHAN_SOFT_TIMESTAMP
  (CLOCK_BOOTTIME); selected IIO_BUFFER and IIO_TRIGGERED_BUFFER in
  Kconfig.
- Replaced wait_queue_head_t with struct completion.
- Grouped per-channel state into struct cros_ec_pwrmon_chan, and used
  aligned_u64 scan buffer.
- Switched EC host commands from legacy cros_ec_cmd_xref_status() to
  cros_ec_cmd(), which manages msg buffers and cleanup automatically.
- Dropped redundant st->ec and st->msg fields, used local params/resp
  variables instead of casts.
- Added an event_size check in the MKBP notifier.
- Fixed signed/unsigned energy integration and channel counting for
  duplicate/out-of-range MKBP events; returned -EINVAL for missing
  channel labels.
- Switched probe error paths to dev_err_probe(), clamped channel count
  with min(), hardcoded indio_dev->name to "cros-ec-pwrmon", switched to
  devm_blocking_notifier_chain_register(), dropped direct
  <linux/mod_devicetable.h> include, and used named initializer with
  "{ }" sentinel in cros_ec_pwrmon_id[].
- Capitalized "Load" in the mfd patch subject.

Daniel Balint (2):
  iio: adc: add cros_ec_pwrmon driver
  mfd: cros_ec: Load cros_ec_pwrmon on supported ECs

 MAINTAINERS                      |   7 +
 drivers/iio/adc/Kconfig          |  13 ++
 drivers/iio/adc/Makefile         |   1 +
 drivers/iio/adc/cros_ec_pwrmon.c | 370 +++++++++++++++++++++++++++++++
 drivers/mfd/cros_ec_dev.c        |   9 +
 5 files changed, 400 insertions(+)
 create mode 100644 drivers/iio/adc/cros_ec_pwrmon.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.1.839.g22a8290db9-goog

