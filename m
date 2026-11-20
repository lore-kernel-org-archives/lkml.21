Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171236;
	b=fF1IycRAxo1fxBDeX8q7VodjKsu80SIIx6GpxVHLSplHbVW0261KamcE1qObCa5MzBid
	 Xv4+rg5p11OxPaKt08rew6wKmptjrMZVFnI5V1pqBDW03HUqhsMLnvekhEzouQMS+mZzs
	 rqbN8ctTaG20iVuOt3e8UCm8qqv28bOcRumqWFPrLZoyzp0LwMinjfqqTpAGxh0KrUfc7
	 +u64HGNOZIkkPB9bcdiCCkydSoIoY/4YplnVhTQcKDlNJCJ+MdGPz0B6aQLzEsKGbPwWl
	 j0Hcnz1vjrLbnYZgkE0drnFH6AO9hlRQtuglF3Od9mqUr0n2dAr7sr2xMqn4W1FCQaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=hHlxygDCb53QOZol2Y7OOBQXofD0V8rGJEydBMdsadE=;
	b=SIikkJYFVbjVqIP3MBiVsxmptvjebiT0m3Bj5R8wXxrsOd4NhVznPNx5SLojTVQOC2vj
	 09TNKrsZ+GmDwBrbHkwFguWsUIO3TPB8Q9ovBsyc/DiwL6DT93vZB7bTiRIwNYknf7qIq
	 dZknCm8raVEz84NAcsfV2Hij+fccDApFdiuakRhnpGEUHDJ1LSJeGoTHbEq+CBsFS6a1k
	 H1lTVvgPmhnNifHtOzpTjtAcAUu2jvprFgfbdCngxuJR7TpzpIvvpQkvZdWl0iTH3/q1y
	 hU6S4deZi0oL3IX+dvRQ5I0mrwc7meuEgk2k7vXBP5D7RaJY/u4zPATFMb/La/bFv1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rL3uJwkt;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470BB606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 470BB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rL3uJwkt
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso5523485e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171233; x=1795776033; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hHlxygDCb53QOZol2Y7OOBQXofD0V8rGJEydBMdsadE=;
        b=rL3uJwktmpAcaM7joTHyHVycDQ0x/TeapALzLIKE54q+iG2iarM26ZvUkG+2rpk1uR
         sTRSLhB8yGBlo/VhXLhlVmPbPnE+cSctSvV3cgZhAmP4YDNPqqfpNT75UZuTxCaGrLq8
         gJ6tPZyoaMDW0r4U4Pp/dXWAYsypo4H+e01mxXfRW4N9fnBbcx04QarF0WpnTzDzs0LN
         Dp/jSaM9+FscE/l+6yd5EadAR3XyNHhlV+SBYHY9RQWDrh2VYyre8xid84k0bYPs2s6C
         TE1apJycezZS3Pjf9kPDecyHaMWyze7i6ui2zBJiQFVM5fr2vLrB7SAOk5qgoJKduYyy
         JWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171234; x=1795776034;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hHlxygDCb53QOZol2Y7OOBQXofD0V8rGJEydBMdsadE=;
        b=JcuoRc4olzwVk/fWO6qZBD2UglK+DWawz3ttQ8urcp8VQCnqGSFXHEZ0LuORlpYBEL
         MUv2idUhc4WJlBOX7++jqEH/rOzLOkHZeI02b86MgzWdnzBLqGEUdWN/B/J16N60a8rf
         Arfuy5lPhHX/ET42R8sj6Ab/jfoWicXT61tM4R11pUFMX7FWKZPc2r+WHCZdfFj2MLfY
         Hy6/xumwf0JhGR1tezvnl9UA3CaUjn8jFgIo0IbMrILRjVptBKyiMwYebqiU35QTWpWg
         uWtM8iYj9TmPYlF8ntgpEZgSLXKq4p2xIEpEl23862adK7/8ajqcuNFM7Qz2zBLRGn0M
         Nlkw==
X-Forwarded-Encrypted: i=1; AL+hErFjACGU3fiN8WLgx2rqFHYapQpwvBivxXWFQqxhXQa72YqeAUUjqeEMd5K0mbS2hEOWzunnFIk41c6gqx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pTfUj+dS+S2yUlIzD67M8Kv4Q/9pAGXk6qLEKpOXsP6AD13ER
	WYSC01aC/OUGuWjwHLSYQ6M9AElpD/DNJ2lnCFifI1sDx3xl0cE/a5JVcSDHmwgRO5Y=
X-Gm-Gg: AYBFou1gZ3W++rfGxMFsQ27kQGKohkQG41ve8hEniSBhFALE8b3AlcFU/h9VkQyRHnv
	b8mS8oW8MFiZG4qyhU66gwzGne65ESrm+gd/dN5HbaaDeUXx/Oe2Gt+j9xXcVo2hhR4IW8zy+28
	5QHkemn8hw29jBwJvCJGAqaQXXZI0sbRa4UUrgd46TO9mB8yVhIGaWu9ayuhsrh41luiyLxmQXC
	XzONP/Rvg1VmyCQiQNlVSPC26eG0OKu+wnShTEA2JFS62G6ENmRuGPp/9PXGfXJj+DT5fHEGktH
	6aJUYOeyiX2TwfsYvy+dZlG0HAUl7Ly5GW54Gfk6YvRpYa9wjn6uKfRJQydveJNUEno7UzqEVS4
	/zriAavT6vzk852Tc+3oBpG3x+iRlF45NfOMYXnfhTuD0ch6BnW3gY+W6eaj8mOJhSIL41WnALU
	5iiaep30ow9dXiCUa8HkWZE2s06XFrYQEbR9AsFJAazu/3vXR4YFhxiPAFqg+OxTsNV5/hnRvu9
	6FQKDvYn+uDu9QUM+hPrNJev48sKggip1CKRde1bHMgNrgIG+5493tyU8Sw7Dw595GTzAS1G9Jp
	I9T7uWagtBQJ2ymyrZcxDkON3Xduup7uHq45vk3kqgKctH3neVL4qZv37U8JcZqB+yemxYbFMcQ
	10KMoanqUIz8Pzj9xDWzQQ5hAuEhZulc9SKafEp8tBpckb5dvEuI=
X-Received: by 2002:a05:600c:848d:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4bb88810b2dmr54158015e9.16.1795171233380;
        Fri, 20 Nov 2026 02:40:33 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895eec06sm22297535e9.2.2026.11.20.02.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:40:32 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: [PATCH 0/7] drm/etnaviv: Report GPU clock changes to userspace
Date: Fri, 20 Nov 2026 11:40:26 +0100
Message-Id: <20261120-etnaviv-gpu-freq-trace-v1-0-445fc6eacddf@igalia.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2MQQ6CQAxFr0K6tomtAolXMS5G6GA3A3aGiQnh7
 jbK8v389zbIYioZbs0GJlWzzsmBTg0Mr5AmQR2dgc/cEVGHUlKoWnFaVowmbywWBsGW5cr0vMS
 eR3B5MYn6+YXvjz/7efV+OcZ9/wJRgfV6fQAAAA==
X-Change-ID: 20261116-etnaviv-gpu-freq-trace-52e421b3f72d
To: Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: kernel-dev@igalia.com, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Christian Gmeiner <cgmeiner@igalia.com>, stable@vger.kernel.org, 
 stable+noautosel@kernel.org
X-Mailer: b4 0.14.3

Userspace that converts GPU cycle counts to time, like Mesa, needs the
core clock rate a job ran at. The thermal cooling device can change
this rate at any time, and userspace has no way to learn about it.

This series adds a CLOCK_HISTORY ioctl that returns the last clock
rate changes of a GPU with their timestamps. Userspace compares them
with the fence timestamp of a job and knows the rate the job ran at.
A trace event reports the same changes.

For this a job must run at a single rate. Today the cooling device
changes the clock while a job is running, which can also hang the GPU.
On a GC7000 rev 6009 I toggled the cooling state every 200 ms during
glmark2 runs and got 25 hang recoveries in 24 runs. With this series I
got none in 34 runs. So the first patches fix the cooling device:

- Patch 1 fixes the GPU state after a failed init and after unbind.
  Patch 4 uses this state to decide if the clock can be changed.
- Patches 2-4 change the order of the cooling device registration,
  skip requests that keep the clock and close a race with runtime
  suspend.
- Patch 5 makes a clock change wait for the queued jobs.
- Patch 6 adds the trace event.
- Patch 7 keeps the last 256 changes in a ring buffer and adds the
  ioctl to read them.

Tested on GC7000 rev 6214 (i.MX8MQ), and with backports to 6.6 on
GC7000 rev 6009 (i.MX8QM) and to 6.12 on GC2000 rev 5108 (i.MX6Q,
FSCALE path).

Link to the Mesa MR implementing the userspace side:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/46538

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
Christian Gmeiner (7):
      drm/etnaviv: Don't set up a GPU on resume that is not initialized
      drm/etnaviv: Register the cooling device last and unregister it first
      drm/etnaviv: Skip cooling requests that keep the clock
      drm/etnaviv: Don't change the clock of a suspended GPU
      drm/etnaviv: Change the GPU clock between jobs
      drm/etnaviv: Add a GPU clock change trace event
      drm/etnaviv: Add an ioctl to read back GPU clock changes

 drivers/gpu/drm/etnaviv/Makefile               |   5 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c          |  20 ++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c          | 240 ++++++++++++++++++++++---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h          |  12 ++
 drivers/gpu/drm/etnaviv/etnaviv_trace.h        |  62 +++++++
 drivers/gpu/drm/etnaviv/etnaviv_trace_points.c |   9 +
 include/uapi/drm/etnaviv_drm.h                 |  62 ++++++-
 7 files changed, 378 insertions(+), 32 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261116-etnaviv-gpu-freq-trace-52e421b3f72d

Best regards,
-- 
Christian Gmeiner <cgmeiner@igalia.com>

