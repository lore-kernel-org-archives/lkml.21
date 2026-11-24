Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527421;
	b=plSMHsLmLwmYtijGqgaELqfLXRySWEkxo7NAvH0PbvB1NMzlKJQLWEkPyvcXUYfyKdrq
	 Fra6H/EPZDRUeynD3hc0IM+DZxbF/Q2yUwq/xgMKbBhLpivGTq7BC7IKdPb9Jq1T3q0Dc
	 nhUIREGMwrzI09TA+uLo6KW35kRcdFzDDbvX2Vk2OwyDiUJzATdbL3Ogs2MBd6QDhpMPp
	 6SQPHrY8t6LKudAniLqIZ638zilX7yVXBW1QUzsG6kjEDD6/vCAQJ9fy47WCKCNkvXu98
	 W9N8dA79oFInlOAe6dX0xzRG/izWCtvrEv5vIHvNphC0rG7JH8xCSUyW3965iBZaeMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OMWPkn6WhxY4f7wdVsdoOSvoulFg7SWEyNDQ6uY2j0I=;
	b=GdMvV0g7pBLO/md3rT2QEbTanFRktP4GSHTVUrTgUpxsqcYT6ZmR/h8ClLaGtNrGSuUA
	 0g5U8ZnwB/UaCAySvoGxtX/v6Y46w3TuJLT7wwgiGLqxFUbYIfhzHbLjwbwjjFiPRpW4P
	 Cg7/rZWbJzVW+p5uYta0yUPuvi/6bGL+/gM0QmAjaZFF56ySe7m28EBbBFOBdKsPkyTgp
	 pPQv8FvfchKWewIFOZ0MY+8dPOe6ycrLgL6glfetDQDSup1vfXOCpSGgXNOdQSK6KRAoV
	 AjajgIJwQbxTBX+dopvxAFfuR4sARBiDThuuB7YhDOmvw5kumNb4eSZdPbyvHxwDFzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EFXNT3Iz;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A882606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A882606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EFXNT3Iz
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5361e313e63so61583051cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795527419; x=1796132219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OMWPkn6WhxY4f7wdVsdoOSvoulFg7SWEyNDQ6uY2j0I=;
        b=EFXNT3IziQYc+oNGextAk24H0QfXC6KEihJLrB2JugUZbfrRIlrO+UNvE/6og/yDt0
         8ivVXx8/Qyyk/ma/4Lppgsu29Iqoe8t9hbNGpd++WhWiTl3+Ec9l7dhNI4FEJb5xYW+3
         4BO2UvKS5HkA5mVNnuZZCcUEdKEHBgar66WnpFbXUh44l6oVKN6WrYpij03jLwpckx94
         4nlhtsUOHdm0IUyNyDP/ms7sObQ+sAdideuK6Vx6wBsb7CTkTXnJJjDD6YW7rrk/CMwQ
         GliwBuniIyO5D+ciyFRCNSr0//87yMYH0sETOXbmEcQGoj3IUAegKrg9pdV/ss5bBCkI
         6BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527419; x=1796132219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMWPkn6WhxY4f7wdVsdoOSvoulFg7SWEyNDQ6uY2j0I=;
        b=wYp8W+MXqBjFgkTG0ckeM+dfzYMyNsH6d12NfrXFKJp5PGhRZf188ORUyvy8ZCP9or
         GISSNcQu/MTEKwN1PuSLq3MkpjQVOVHvdCSVo0T7luL/URqot0HokHI3+gc8JsWWBzCQ
         TZ+4+S+oWFT8Xw/5BvMUBce+wYbMBtm3GtFgWLjtzH+BHcXdBj2Ah0BUSQt+xjIQrLrc
         N0Vm58fIXDks4S0jIKWRb+Ncmmqho+Hl+7nnHma7GQdijdrQyXDqTDAng/2hpu4jPuBT
         5BkoPpgDxkoGOcE/TYBGMNfwl1q7i0uScT+EtdleRh+VTervxo2TYTs+lDeU/dK0Qe9V
         6ZOA==
X-Forwarded-Encrypted: i=1; AL+hErF2UtFCs5xOEUPmmSj3jUyvu1ZB5hfEVtCsuyxuyRgzChy+T7gb9pe5cHvsqik4XuYbZY9IY8YTsJpsyuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AG+aany5S/hOD1Ll05lOODb5u6F/bQHWWpKzbj4dbT5jjfMxL
	eQ9/aUTxooJuJWvvRSW4rj3z3F011oexkBHFyc8BYQkGLvk6iAQkURb3
X-Gm-Gg: AZFdTZeWs8qHMqqmu1B4d2yE51DPY2n4R/rn5nxcxvNx4WxVlj/L8oXkyrbMcRnmx9B
	vntoOuqwAcyM2+nBTQAj2Zu2WDeBZ3zkz3alphjLj5aAIWq0NHZOyPZ5VEvPjVUF1arIaM4qJx/
	Y9KAQk1TFAzMKZgcHD5TPURcOWO5RJoCctuoKpespH3FhYJy7ch9CcLTfI8e+3tl7LLon3z56Qs
	967k2ouoPbqnBsk5EBALrUFmejP7hBmFkMezLtVLl/b2wLnRSoDrNHlFn50ZGWEJwixSFU97XrP
	qG610dvTkCoiG33gr9DO5CmUwf/EGHIgtihnK60lNcQbtvQ12Iyv5hKrSwHNZ0Y0wiCuaLEljUJ
	X/6aG/B4H75v7YRjqgUtgFDg4Bk0dWP29ONvjWPfnhpNplg+kGzIhfteot9YHystuvz8WGvhxEe
	9gCmp59oVRtvKI6ayTvE1JxqSg3zgKSx3bEQOB48Z4NeKyAbbNacSVEsPw2MwVJa68X6X+Of67X
	umPt8FC6XqmXuwIHcyutgIrjstt8gISZArI/fziSFBqwzDX54FRZZBFmb1MFoH+P5gAa+atkX2E
	xgXJebN+RwOkXnulwkvZruTwoW4H20IqVSp/KMPpQowL0XhHEu3FyatZvhHR2b1a
X-Received: by 2002:a05:622a:a05:b0:555:50da:f038 with SMTP id d75a77b69052e-55d768a3faemr271137861cf.1.1795527418853;
        Tue, 24 Nov 2026 05:36:58 -0800 (PST)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d383asm133834536d6.22.2026.11.24.05.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:36:58 -0800 (PST)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	j-keerthy@ti.com,
	nsekhar@ti.com,
	prabhakar.csengg@gmail.com,
	avinashphilip@ti.com,
	sujithkv@ti.com
Subject: [PATCH v2 0/2] gpio: davinci: fix probe-time IRQ setup
Date: Tue, 24 Nov 2026 19:06:52 +0530
Message-ID: <20261124121500.2cd5cbf30f89-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series fixes two independent probe-time bugs in the DaVinci GPIO
driver:

1. A file-global MMIO base can be overwritten by overlapping controller
   probes, causing BINTEN setup to target the wrong controller.
2. Per-bank IRQ data is allocated as chained handlers are installed. A
   later allocation failure can leave handlers pointing to devm-managed
   data freed during probe unwind.

The first patch derives BINTEN from the current controller's mapped bank.
The second allocates all IRQ data before installing any handlers.

---
Changes in v2:
- Rebase on current GPIO gpio/for-next, incorporating the upstream
  devm_kzalloc_obj() conversion as requested by Bartosz.
- Use devm_kzalloc_objs() for the upfront bank-data array in patch 2.
- Add Linus Walleij's Reviewed-by to both patches.
- Keep the pre-existing GPIO-count bounds issue reported by Sashiko
  separate, as requested by Linus.
- Repeat baseline/fixed fault regressions and parent-handler dispatch
  coverage on AM642.

Previous version:
https://lore.kernel.org/all/20261109194910.2282454-1-sahaj123.sc@gmail.com/

Testing:
- ARM64 W=1 driver builds passed for each fix and the series.
- A local ASan/UBSan harness ran the extracted probe and IRQ setup
  functions with mocked allocation, IRQ registration and 32-bit MMIO.
  Nested probes of 87/88-GPIO controllers and bank-allocation failures
  reproduced wrong targets and stale handlers; each fix passed
  independently.
- On AM642, instrumented baseline/fixed kernels reproduced wrong BINTEN
  targets and a stale chained handler under forced probe interleaving and
  allocation failure; the fixes passed. A private module also exercised
  the real parent handler on 12 banks via GIC pending-state injection.
  No electrical GPIO edges or child IRQ delivery were tested.

The AM642 tests used kernels with extra debug code to force these
failures; that code is not part of this series. On those 7.4 test
kernels, with and without the fixes, the mmio-mux driver at a40000
failed to probe with -22 using the vendor device tree. The board's
6.12 vendor kernel does not show this error. I have not found the
cause, so these runs were not a full-board check.

GitHub Copilot CLI was used during bug investigation, review, patch
preparation and testing, and to draft the emails and commit messages.

Sahaj Chaudhari (2):
  gpio: davinci: use controller-specific MMIO for BINTEN
  gpio: davinci: allocate bank IRQ data before installing handlers

 drivers/gpio/gpio-davinci.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)


base-commit: 0e1941b7d0b0a0405b16567678a9bc3b20be6340
-- 
2.43.0

