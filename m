Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863978;
	b=F4tB4mL4qEe/dwpC5qvv5f2wmaAIJjWF+d043dpAym6x7LXD9ikN8GhIArp8YKbHxKe3
	 tN9Jz/SiqxtYwql0FmB/KzJntVC0hW17+FeuzvqNWDDVzscrbKyDwgYWhGXiIycxt6QCJ
	 Lb7jiF68W5/S8C1HSqjJGMAsucckbyCTPggBhFSYDp5dpVzKUkg3YwqU5cNfWBtsckw/+
	 2bjQSotALCpB8D/l6lWIgdJpIgddWKn/hdK2jlBvW4sGl1koanvCVskF9fm5yqJZGvPI3
	 n+r/Jide9eRR55DF1LTeD6kIa2yFUdnFsy4o5XBq4CmcuN2lcn5KfqnsmNhEBPYhXjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ezN6dpWTDZkj1sKNDSS+kFdA4nYR7uGcxRXk/sDauFw=;
	b=ECtsXgmMivmLmcLO+UPb+68f8JxMzteGovMkllCDb0exHZmAdHsNYfhPtoWrw2WpPSZF
	 bBsvxp9y43Nnwt4Or5wDJItM24HSWh0rbbzHPTmYS2MxtpM3utv/1f0JhujwFHtjUNqPR
	 2gbgBs0gniVDYP73VvBQopZ6GfbdVTxmwLODH44Pgley4Vpu/IjTPZ4OjkJui+RbyhMv4
	 Na15JhvCit21eEhc7mEaXyDNDKBURfWHYLcViMrApZ1TKeVN6KVoQOmeAkilwmel5Gqez
	 +OVxN7ZsEzPWg87pK5o4ygUiJpiho/yOPZqgpmAu+mKnLZUCzYcc/a3i/sijEyIFd7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FTrr4t9G;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4504C606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4504C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FTrr4t9G
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-385d8a00598so14228304eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795863977; x=1796468777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ezN6dpWTDZkj1sKNDSS+kFdA4nYR7uGcxRXk/sDauFw=;
        b=FTrr4t9GodIYYjtqXL7b/1FJ7dHbYkxLKi+TNs9QxX3oQWcFVKODI14v71gf6DSvZ3
         LAz4eZs1vWYLLf41OAEJVFOtsPzdH7zELwNWMUcs9gZJzIHZZ0i5tgSeq8JeSrdgsxKw
         PGS/9t0JHQESKMtdH8YF1V5MuXa5j8AZFBX2CVjNLqd0Dadajhm6EGrVzslpWmEldevT
         dzELwYQ7kgDfvpJhNCRTZ9xXJIAushtjsl6W0n8hqljS5h9ZFPgySG+trXRdVkLSMro8
         B2psgd7ZZeGeuD3eklh5pKSZKtiINIU/BPckiODRLKQJJ7ERbrIlWMF/APQ7wuF+j8eF
         X+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795863977; x=1796468777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezN6dpWTDZkj1sKNDSS+kFdA4nYR7uGcxRXk/sDauFw=;
        b=HzAdpGPnJ4kE8TCgsL4OZ5paYoKm8tPipf1CXa0x0MqKDl23+Sh/DtLLAXdRapCSDE
         A+kMcmy55D4+JX/xEBLI4nXa1tWUbvxWlMBaWxX1D9DAcbfU3IUMLP9TqucW20gh9zaK
         hsfvrFaNGNNiiBZf3CWDVE7IrJY50YxozsKCb8vLmLRVtXUaByFNx2kxvfdqlX3IoOtL
         ncdW14N3aD9srRgSSXcP+5mNgh+eAiklAJ2qlyqNPE2nFosY1nnPWUV4db2DISMy7KAi
         O5bA+Be0EpmSBxVi6h8TU0QFX2681Ym/i8yLfLn4XvmcFoVLF62rf8SkltYgWz2fcL2h
         0AnQ==
X-Forwarded-Encrypted: i=1; AL+hErFVCytAcsXhfrYsSW476vCVJRCnpOVKyo8BY/pEcfIuWfBacHV7cP1JhDhlMhe29LKDN9kgtoa4J/tfry8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QWj4e5o/pPyAHE2AYrwZlyGXoJbAjfYb+/bzcoWIo1yImPON4
	zF7FRPqcJG9QEV1mAtJqfrlqtl2KWovNOEod2RoN1nXd+rgVOjRvzDBK
X-Gm-Gg: AZFdTZd6+fNwa+s0S0FIt84ZKga9j/8bU/KzY8qH5yTuLJPMyrll/impmx7LnHhQAFZ
	tp1RMjT9Ot2GXSwgu4t9s0ISsAw+1lfhnKsciagn1MyJRli1MgWwLhvAFed32TlsOIvITaG6emX
	uyPUOsqZMMd8Th6txmacpJbcXHbrn/CUU/WWraX+MHFGVNTvLummAGbrHjMcLXwC0SgKKrc3iyg
	Q0Z8shDmITC/HZ0onZ0LvRaMDBcAGwqDgha3YC9B5FpdC3rwxYq8BSoqbp9VxvurniEcEFGJ+GD
	xyavhMp+DrI+gDcxv4yJT2G6QZpyvphAC8EEZAEz96jDunwNMplrGm42/QtrfC5MA4M4VieNtq1
	C2JA8QPpRraufy+XyM9RUuHnjCv/8H/4WRDgnThMY9+hrS6VoXxwp6S7Q1EXZ6coR7UlVpxBajl
	aK2BkE8b7WQK5mXsQV0/+y8SuiwZt262p+Tra7gx076hJZxdErVR4FZjaQNEqvBQyUL43/CD62F
	INAaKTsvLnaKnzKsNb5Pjwh1do0WSTja/OGGYKhtoaPSfD2qXb9kn1xWBjJPa6kYQZwoD0IaV5E
	OIx24EX46GI7BAkgnZVOn8xQW4CqiG/2IhaZHgj2Orm1pZbc3pqdR8UVC+5/CPsYn4NKXDZdwWv
	1LBkjAObNFJft4fN7O6OjaRFg5oQd292PhmpHXCAsTJusKnPSGT8exBzb4WAYVcW0bdaIMxIkWu
	FoH5Xv6rlFS4KbaxrthdHkOkz4UukFRUWmqo5QtI3ZFnH76A==
X-Received: by 2002:a05:7300:51f6:b0:384:7b4c:8564 with SMTP id 5a478bee46e88-3857131a749mr30457862eec.41.1795863977351;
        Sat, 28 Nov 2026 03:06:17 -0800 (PST)
Received: from spark-da2e.tail8e743c.ts.net ([211.105.22.106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm40958970eec.17.2026.11.28.03.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:06:16 -0800 (PST)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Jinmo Yang <jinmo44.yang@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: HID: wacom: LED callbacks race with led.groups teardown
Date: Sat, 28 Nov 2026 11:04:05 +0000
Message-ID: <20261128110415.772810-3-jinmo44.yang@gmail.com>
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

Found by coverage-guided fuzzing of the HID subsystem through /dev/uhid.
No patch is attached; I am reporting the lifetime issue first and can test
candidate fixes against the existing KASAN setup.

Kernel: mainline 7.2.0-g66498c75b4f8 (arm64, KASAN)
File:   drivers/hid/wacom_sys.c
Impact: NULL pointer dereference; denial of service
Repro:  syzkaller; independently reproduced with linux-next Wacom sources

## Report

  Unable to handle kernel paging request at virtual address dfff800000000000
  KASAN: null-ptr-deref in range [0x0-0x7]
  Workqueue: leds set_brightness_delayed
   wacom_led_control
   wacom_led_brightness_set
   __led_set_brightness_blocking
   set_brightness_delayed_set_brightness
   set_brightness_delayed

The same fault reproduced after replacing the Wacom sources with the
linux-next versions; only line numbers changed.

## Analysis

wacom_led_control() checks the shared pointer and uses it later:

  if (!wacom->led.groups)
          return -ENOTSUPP;
  ...
  int led = wacom->led.groups[0].select | 0x4;

The devres teardown action can clear it between those operations:

  static void wacom_led_groups_release(void *data)
  {
          struct wacom *wacom = data;

          wacom->led.groups = NULL;
          wacom->led.count = 0;
  }

The reader is an LED-core work item and teardown does not take the lock used
by several LED callbacks.  Consequently neither the initial NULL check nor
the callback-side mutex keeps the array alive.  Other callbacks also access
the same state, including __wacom_led_brightness_get() and the sysfs show
and store methods, some without a NULL check.

This is the same lifetime pattern as the Wacom battery race, but it involves
a separate resource, teardown action, and callback family.  Rechecking or
reordering a pointer assignment does not close the load/use race; teardown
must be serialized with all LED callbacks that use the array.

## Upstream status

Rechecked against mainline, linux-next, HID maintainer branches, and lore
through 2026-11-28.  The defect remains unpatched and I found no matching
submission.
