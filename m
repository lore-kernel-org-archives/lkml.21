Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648297;
	b=pBgG4v508X//o4RSrdsJVqGMRX/dzb3a3WVd5KekpPapgkJ1Y/cIU6Pn3+5X7iWWxUIU
	 MEAvf2yor8mY+aPcHFA3oJv8lFcV0KEfxzcSXLv941jJLXYmJ0V1CsWaVjudSPAju3wko
	 PZJVvjyXupMiqviWjenr8fqmU7ajFTlsrpoiabJxGWJya9FMwjWa7aN9WJ6urlkmPVeAc
	 rWMi/8sVI07piPNUB4vUYdIm9JoC0nwUwQTg1cKcCCkHzvXqUl1smql4M1iKnksWa/BZg
	 MP0saOY/9icHyMBqDBLmOhMUFvbJzkDgzHUBZXlexKt+dD8q4Ggepeu1wTZwjjjTV0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=6fK/lhjogqUYKhE7aNUS+Ico3frDqjb3CNTeub+YoI4=;
	b=M4BQ1XB+S+8yHTbQVwzE4novkgA3k1D0ORJ5mdc9aIBLZXPID/3N7cFIXfMWQ5UHOMR3
	 LP4Z98kAlaanQzupld1GYIQiEu9H6h4p/TgMoBiOypo4U6zBMeGLnUmwURXf7GwG8+vGF
	 g3Fuu46up4Tp6HojyrSWnALeObkBXazxob55+KFHOL+YFwAZ4LQfP70aTxTutAq9qUXPL
	 KK0XIwwO5ktjGal3xrTXdV1diGDAH52ILDpAMtA95HS76si3pYP2+q0XidbkOniBGvK6F
	 fV+uvf/LgenZfr8qzm3Q5XsoIu7ar/QLGLQ1ibkNhaY3SX7qZgoZUmqtzo0Ku7OkfuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpRZmOyN;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EEC606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99EEC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpRZmOyN
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386bd881d39so5683813eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648296; x=1796253096; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6fK/lhjogqUYKhE7aNUS+Ico3frDqjb3CNTeub+YoI4=;
        b=RpRZmOyNVdikLRmWT2EcoQgLc3lrynTGUfSKn+qLeyNP3Sxl/Ta4GJ/iHN/86E+mIr
         ZAkUXJhs+82qn6E5o+hNID1N1jiNeSLOudAUU4TSwhxmDEcQhA4prFnC8X8rDyzMAKGG
         7Gt5iTA30clIVZ8VBG2jIa5xP74vjFFaRkd6HD2WmkyNmAOUgZ1Vkfz5zwggQ+v+2m87
         X4SbIs6gXc5B35szxd0IYRcXvn3FmMEsgCiUOWCrzEfbakQGI42h0PpjwjSdNc6l0jTP
         /1PqzNycI9TMw6ZUmdz9e4zcaInRNsjDEnWVm5dCC7YQP52/qPuwZ3ZcclUI6nre5Pxs
         Coxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648296; x=1796253096;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6fK/lhjogqUYKhE7aNUS+Ico3frDqjb3CNTeub+YoI4=;
        b=mnbn4nBQdqjM65/OiGKVZY0JyLxAwWBmuVE6cXKrmEEbcIwmAciVAEf+0Bm6ps7Py3
         vhgyHWqRFtozjSUIVGVxiTeHAl7pdl213eJqtEs3VE3YOJF4WnourWPfJUFfQtj5sRjX
         Ux8qrD6+cy6XDBQXEFIMdcxAoV38wKUEafvGs04KdOqz4372qHGmT0LcNa1vm7DK02Jg
         lnjEXOK4DPuGo7B6D6JhpArN/P1qFRJmRELZkNI/v2KwA9IFkCaAKeMmIvrz21XyeoCe
         6lOU1KC5VwlaIiuHhXaPF7xbkDTJx6ktiQgcindmUjR/AIrXXkw34qo4rq80aM4B1PbV
         cMgw==
X-Forwarded-Encrypted: i=1; AL+hErHH1cC4Kma1uwQIjc5pqVMDPxLJunZdTlxbTzaysuuybWpwB9AdVO1Q4dExv7fDvylN348wEGxk4FpY4T4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/95lxPZeReFfrjfx+XpSVEoa3NSXvUzWCkM9gyXaQKDkrVda+T
	FJv1KxaIurH7jDfk0s4kl/Her4XvFjkDx3+pCkGYQIFnfF/60qprHXZq
X-Gm-Gg: AZFdTZf+SYmkAYwHb8O0e16Ja/Mn8mQ0aROrtCS0vsTNdhQSnBxd1WYj6DSmxBILWAu
	pzkAhJqFXHoH3SPuHfvzm2zaW+1fOMF7vaVgEdpF9khd8/e9klZ6RpMt3gydK9Q68ElC1HYmwEo
	//O8zGNtSHgOYNMKzLDFk8qXXZBHhzrzn7w6jePtEclarIpsR6stpA+fMZ0mJ8hjHrwal0yOrtW
	090eXWbkJfv1anIQlUOJWgVxl1kq7qn/v+SUVoaLWrdXmO9cMN5c95cFoHIAkK7PNr6oduD/2NP
	cfz9Ofrn5kbNZM1I4MwjLHLAMD5N11HiJ0k6VDtQyWkPpmfqWHIl6Ksv11N/aNiCapzxG9HoOhw
	awKtLqAllB01wtx2PDv5eGp6ycRZ3m1jf8bOXrMoQMBsNy43lxIv7qOiT+aW33VZ4xJwfwFbcNr
	bStK52mmZaVBi7UyJXi6UleNj8tohVdOfhiI0zUcOT4+NMTZJHAIdEXIviAstrbLEzgjcK4N/zj
	iVHv6G8cYrL0mJ5IBAttRuVYOTS7TIjE5CkTpZJj2AoHzqtWPrduqLr2cwqjjJOrhph+sD8lfqd
	ZdbecH7jYkFEQjkPDMm8gfy999NDOySPBkv2By1bqmcer4R49o5zPvktQwrPuD1liDn/gRPkEaE
	g3b12l4/gXJrpiWdvDQ==
X-Received: by 2002:a05:7301:152f:b0:381:c532:3d88 with SMTP id 5a478bee46e88-3857093c38bmr21737527eec.23.1795648295459;
        Wed, 25 Nov 2026 15:11:35 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm64430145eec.26.2026.11.25.15.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:11:34 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/8] platform/x86: thinkpad_acpi: clean up hotkey polling
 and locking
Date: Wed, 25 Nov 2026 15:11:13 -0800
Message-Id: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIABFrB2sC/yXMQQ6CMBBA0auQWTtJpQGiVzEuyjDQAdI2bTUaw
 t2psnyL/zdIHIUT3KsNIr8liXcF10sFZI2bGGUohlrVrbpphdmKW4IZ0FAQtD4v/MXg1xVbalj
 pjvpRE5Q+RB7l838/nqfTq5+Z8m8I+34A4dgW0H0AAAA=
X-Change-ID: 20260930-thinkpad-acpi-hotkey-poll-6c5e037cbf3c
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

This series fixes a kthread lifecycle bug and cleans up hotkey NVRAM
polling setup and locking in thinkpad_acpi:

- Remove the unsafe early return on TPACPI_LIFE_EXITING in
  hotkey_kthread() so kthread_stop() never races with kthread exit.
- Drop the dead -ENXIO check on hotkey_mask_set() in hotkey_init().
- Drop obsolete tpacpi_lifecycle checks from hotkey_inputdev_open() and
  hotkey_inputdev_close(), fold hotkey_poll_setup() calls into existing
  hotkey_mutex critical sections, and remove hotkey_poll_setup_safe().
- Call hotkey_poll_setup() in hotkey_user_mask_set() so that runtime
  hotkey mask updates via /proc/acpi/ibm/hotkey also start or stop the
  NVRAM polling thread.
- Replace the HOTKEY_CONFIG_CRITICAL_START/END macros and manual
  hotkey_thread_data_mutex lock/unlock calls with scoped_guard().
- Convert hotkey_thread_data_mutex to a spinlock.
- Remove the unused hotkey_poll_active bitfield from tp_features.
- Drop the redundant tpacpi_inputdev->dev.parent assignment in
  tpacpi_pdriver_probe().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (8):
      platform/x86: thinkpad_acpi: remove early exit in hotkey_kthread()
      platform/x86: thinkpad_acpi: drop dead -ENXIO check in hotkey_init()
      platform/x86: thinkpad_acpi: simplify hotkey open/close and poll setup
      platform/x86: thinkpad_acpi: update polling state in hotkey_user_mask_set()
      platform/x86: thinkpad_acpi: use scoped_guard() for hotkey config locking
      platform/x86: thinkpad_acpi: convert hotkey_thread_data_mutex to a spinlock
      platform/x86: thinkpad_acpi: remove unused hotkey_poll_active flag
      platform/x86: thinkpad_acpi: drop redundant input device parent assignment

 drivers/platform/x86/lenovo/thinkpad_acpi.c | 148 ++++++++++------------------
 1 file changed, 52 insertions(+), 96 deletions(-)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20260930-thinkpad-acpi-hotkey-poll-6c5e037cbf3c

Thanks.

-- 
Dmitry

