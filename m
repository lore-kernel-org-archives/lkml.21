Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648298;
	b=gP98szkchiq3L2TILFaNr+aWBzRpvk3ekIusA5H7y76yzgf1HV4GYMnbkG98CxbrxpSS
	 FDl2JZbddXkO/oa/MBnV4ein87chtISmaWY2R0QOYHIyKNqPViwNnJo2SPDiufc5uULka
	 VCZT2MFkpM+gtQ1Tm/zIKDQKbYjlseAdPaLrYOPNXFFy2HyAuEBmf1tDr9CRgxoWJ+jR6
	 CEFIyVX6RZygmSDChBTqNrnHmf1+nrGcB1BEe9MqESQLrFR/q8/q+T2VFd6leH7CmhMcz
	 jXqa401PSCE3w1Z1e1NLMHimSZvTyvf2nFT2y8iYYUOd9M8MEJX6os6He/WA5EhopQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kOt4u6kmeqJwLnHO9krQOCVVCUBfYUR7mdfB8lBiBco=;
	b=4yf+iP1TmV3zgE38YiEdxgxeGAiwMoLhzxE5CTzxIr/4XPp3y3LFklzyLdROXCfm9OW5
	 63lWdEqyM7soq25yo4vBVdqK+Y3dVWkzYHaZDkA/nRHjA+epp5q9Eyku2YuRAh6+8F7+U
	 OGftzcE/3z457ujeJOYr0u6jszMsQffRObPvm6e0/jG1CBiiGaEZxFSTBrHPb+1bgZ5cx
	 TqZFXQEgE/mq9aeAYy2otz0nFf87hJGR/aJxwZWkMnbdI5qWqscHFnJRg1fruSt65pMe4
	 6/mt8RbdMZRBWTjZ3f/kJbAfUuOmQ6TRJGER47j3sJbcOJChTbzDjuaEzGT/Hmw/8Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vt1dQngd;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DBF606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01DBF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vt1dQngd
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38431138772so8309573eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648297; x=1796253097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kOt4u6kmeqJwLnHO9krQOCVVCUBfYUR7mdfB8lBiBco=;
        b=Vt1dQngd9PVZy95Eefs0BcOZV2rR9e4rTVBllCLhg4ChIUKR2raGYXgyz3pzp3rML7
         VocROAwgqpzT7Vq00CHSgF5O7gIgNLtiBPKn9X8zwylfPDaSWQN1AaFyLU5ZYUdNIMNP
         uEeGVQjRMTXvpUPXvp/hx14Z/PfJBw00hG5Ga6CaawXIofxAHNVMkMNPUPZDPeJt5s12
         kvQ4fXIlWNiPJfdZ5R2zLJHB0I9Esi08SArw/7AinHveuoU4XdnR4oVt5P6xeMRsZhBl
         Xj6IJ6hF+jDgTwrIxK/Wxtf6hNarT9pdT8YGUpe4nd3vFmSFmwIt572HIh9Sn0VEy0VE
         97Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648297; x=1796253097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOt4u6kmeqJwLnHO9krQOCVVCUBfYUR7mdfB8lBiBco=;
        b=kvtUtsg6J6lDdlP0CBp50wcu3x0FwERTNpvmdPZYqUhX+t+sbqk+/7YA3+uKoRB1r7
         riJUCTO8ZjKhF0xaeqENiRNwx3kTtkYl4CzerBv8JYPeiYIW38TvOoXmFSHVlsRewRY7
         9wjLVfx/t86arGnC7EkGYix9wOunALQUlFWJpnjk4pzShsEKcUntCpE5nrVUShncJy6N
         6VWMrKbF0jatghbhp86T2GUcbN7jLd/svwyBMRYXYHoyPGKYFYewaqWwEMpCXBN25GVp
         WdrLDkiTQjxu10D6iR02f4mG5em19ZsG4TbX5msFBZt0+lTWFGad259SAE3qSw4ytoJE
         5dxg==
X-Forwarded-Encrypted: i=1; AL+hErE7jczT5ElbrkaQzrdxr3wuJ3uc/dJ1T2d5U1y/ToDEwLJF3DC79W+rwGGk8LZd2TvPoRBZUL9G9gh6F4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mRz/oH1nFusG6YoDeDBdQIIWNSvskg7Q2IVYSNrxIksKe6J82
	YlX9azoS67dojCkxUGOrwHSnHKGRBiHPLjd9NRgHLxqWsefckswHSx3F
X-Gm-Gg: AZFdTZd+NasbgZmrbVF0UvcFJNpSACDaFmn/cQTLNMbdjvzS9mcq7n/cOGbsC1GRQSP
	RjvhgwReU8rfbM4JJKJkAx7PxMA4Sd+xc6EurmGQmb4fSBpAGl5QkwARAYkfUkP5wEjpdrwN8gT
	3SATLFoH0GRG1/GUFDYgdgaEprKxUNBZ5UFVvO/VX2dt+ahdsh1BNdCiTiBKNUHEJPh7JnEdTFB
	QiuRwzkYnkrP5j4mrua+fmUqQJAvngzNiUskKxSIbaMKn9f8YfDyfnpmIndrzwXKY9GzMjCoqb0
	+Hzb9bgMBMVDt9v72qotnAPWt6+gon78G8cR7XD1BaE4Ac+NQAkePi3EMgVErL+eGw/GtfRNMrN
	y2DYxHmD+SviT652BdZFoVmiUQt5810RzJPDOg7iyprMmMNNKThyfHwfNvnUSTz36AhRrMHTAB/
	FkRFA8vxZ3xON0Tjct5pPs4DTLVFqiLOQTbgsyQgOU1tBdgTuXpdSjnwSN1sHkYRtlWs6lp7lN/
	vlo6EoXHQPy4atvPDTqZNQUo9msuwp/O+Zmx2jF/t2b5qLzUv6GCVUv4NCkwbd4mXprkXlEtnly
	xSK2eEWa1oWO3Ihkd8/OtRtsbmGSXaQ7Iyl/OlU9lLYgjfImR+G/xM4dbURTEYK9diSPgGs230I
	GbIcuKJY4kGHpEnl86g==
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr21778101eec.2.1795648297132;
        Wed, 25 Nov 2026 15:11:37 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm64430145eec.26.2026.11.25.15.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:11:36 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 25 Nov 2026 15:11:14 -0800
Subject: [PATCH 1/8] platform/x86: thinkpad_acpi: remove early exit in
 hotkey_kthread()
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
Message-Id: <20261125-thinkpad-acpi-hotkey-poll-v1-1-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

hotkey_kthread() starts with an early return when tpacpi_lifecycle is
TPACPI_LIFE_EXITING. A kthread started with kthread_run() and stopped
via kthread_stop() must not exit before kthread_should_stop() returns
true, otherwise its task_struct can be freed before
hotkey_poll_stop_sync() calls kthread_stop().

Remove the early return so hotkey_kthread() always waits for
kthread_stop().

Fixes: 01e88f25985d ("ACPI: thinkpad-acpi: add CMOS NVRAM polling for hot keys (v9)")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 1bccc21ee29b..a586113ab1a7 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -2451,9 +2451,6 @@ static int hotkey_kthread(void *data)
 	unsigned int poll_freq;
 	bool was_frozen;
 
-	if (tpacpi_lifecycle == TPACPI_LIFE_EXITING)
-		return 0;
-
 	set_freezable();
 
 	so = 0;

-- 
2.56.1.839.g22a8290db9-goog

