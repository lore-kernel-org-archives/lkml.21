Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795360639;
	b=bgcEobpRNiWyhKxIIDBVLlfY+L4NmEM1/iO4Tf80l5hp+hADuRgzkJZsedZkUEW/JicJ
	 PSWMyGjYsNiFGSEN8ZiZAz9XjczMkOAMZ0V/dn4kG7FWg7mbsZwMYlwXHvgnm75m95anI
	 z/j3H7HIJoSuErNZIzbX2sz1zAlfadlwIhe0EotNiaG/oyXRYi9N68dM6vSucZ8TEICrX
	 cwa87YMHhqyPJ1l8Bg9S0oQ2akgwb3j5At+JbgGYPvJQHjK/Sr920sasfNcn4X+j8leQs
	 RuHFjAQs82CtnIRs0V5au8Dnmg+Yb+BYZq6FG4s7EZ5TY1cIJrHRdY0/K28L6JApC0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9Ug5mbNx//jfk7IJQqQS2kOB5UthZWxihtQTk0CboWU=;
	b=Zu3qM3HORK55AKkDR39G+AdqDnbXhuJRKd9tfP1KNdxsDmEqJMgDop9kWrFbvyjXRlAH
	 AtvCopwARxDLGk9CNQkA9l2aJlOSxc8BTuJoGBgP3jvg9uR80Gu8Y6/NDzHHA8LDYciwZ
	 VFFaDslIy/jrYZTGvEPUE/OE5QE8sE2wKVZ/xsdXO+HjMc2ZNqrJS5SmNn089ZMIt4ikX
	 C0K9EKc5hNlpRtRHLSU1g7nowRjiQO2kGG46RfXdLvFRhKxfNRWHXyOXYaci8caYgyIc4
	 V6SFHAqK9H3/6Vx6ti0+kSox6gyNI7EhYZDn+0LLot2gbiJsXoiM1FLWSTsLQvjOq6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tuccvQna;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D04606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D04606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tuccvQna
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so29546975e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795360636; x=1795965436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ug5mbNx//jfk7IJQqQS2kOB5UthZWxihtQTk0CboWU=;
        b=tuccvQnalJbbzdvdg/SwbMuoNf+cd7N2ArpBLVlHagIBrCHcBXIsX2g1Vnirs7kmDF
         aSjBRMx4XlB33yQCgMIMkPFo1kpF370pBs276Tt3VlsKgKOCweDZmRp8m8jBfP36fXl5
         uATYr1VL3NWVlGZltg0jWV5GHOEotHs+PbefZvlFSgTN1olF8QPJ63JWQha+z7ZJTEOZ
         i8lzG9RauBoi5kVGyiZIpunI3p2jKHOafepNULbjgaoWZm79Fiqry6YMDkaEy09CgkY9
         ynS4UFosdNR+XOudBOci+JKkRKVxDmsEVdBnp/TO8C+80XlP9ZlUVZUMkDl35CbKa0VD
         1nAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360636; x=1795965436;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Ug5mbNx//jfk7IJQqQS2kOB5UthZWxihtQTk0CboWU=;
        b=RlpOiO75GGrdC2SYYFlSwFminZLi9hj8DWj2dBJXOy7FvMh08R++K4uERrFB5Ju77Y
         tMOfNpR0UfkzNM3dzA7n3nBEgUSgReoIapOb0B+tcx36v/6OdRMQslRgsTYrHjgdMFhL
         LmcG98KGOh+oZYC1EqiStd+lCXNle+ISF+fBBzCdmNQL6KQJH1AO/mJIZgD3hoiDB90I
         LGvqskSXUI+upIGwsTiYTeSbb+6pcf4XTaq1I19BKoa46e/63op0OOSBkNB/ryT1R7Yi
         pYCp8yPeFvTPGWn/Fnz+7EOCHtkPsSMK1Dvi7YYRXaVEGKihHNwmkECNImUIaG19AjWu
         mV5w==
X-Forwarded-Encrypted: i=1; AL+hErHpPYr7xUUl1ZH/AvUnlXzbC9zUMHTVVCZv0/zw8D16D98rQojtzbHtHojUe6K3YAWSh98VCkFVABlhgHc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CsLQXi55WCp3F68tctsiSAAP+jTXWBBgjlghW2L/ZZ7zaLeNy
	+IBbmAk69CKiV3FAjETwF9Er2lI6Ja1G2dKdeXeoWCvI9oiq5p6OQqsG
X-Gm-Gg: AZFdTZeaiPdUT9SyHCsG9Gvshj5NsYJQCJEn18bcmFkWxvMI9t4CBjMclxaqw1pPs5O
	29T74elUqS6aq0SZqNBhWvUEAUi1hoOaDZXfYoKsCPHWeWc3Z+Ogtiu+L6XlWEHkIj7TvyLxO5o
	1tQdjb+s/7l83B+PgWt3BdpklX3mtgT9Jkl+J6yHvg1BUVejLoXcVLmvytkH/wnNWXX4b5v1iHp
	2hL7w/Zi88Q85c5H8CnLDaBQWWG2H9vqRBjL6/FzGL2a+Oe8R6flFyHXlExnVW1SUEEEJg47LZX
	JnFiEjHiMpO4RA+zUkJpbKZr4jXpXE052l1yCsf3yD/HlRHdqHMwwfaz7wKoPqV+cSmQE/AeX75
	MbUaXNGLK9SEoIk82QoI62PttTMSZ8scmh4pzhXpMiZZpbPVrsGA3Y7QQ4uVX6Wu1g6J92jU4zm
	Cpmz+KxOXUODIZFs+drz0gSTEez57gfsh4aN3Uun60KTyMlwns+PNjZ003IWT8jSO04Fw2TuweE
	fDCfITOVOi+Oe+z6nBu2n4czV6iq/7YA1HPb0ebSgRCEkvtsn3/AR9LepSYuo/SPhXop+vM6WnR
	1cMSHCo8LJdJSf28OtyFwIoj3ASBvVigGUQI/pmfMIWZo1yJGOnK+MQ1HseFfbRA7aXTSCDV2/+
	fkAGM3NOhEu8arbSs
X-Received: by 2002:a05:600c:12cb:b0:4a2:1104:7ca7 with SMTP id 5b1f17b1804b1-4bb861576bemr155677955e9.11.1795360636349;
        Sun, 22 Nov 2026 07:17:16 -0800 (PST)
Received: from torre-GIGABYTE-B550-AORUS-ELITE-V2 (212.pool95-21-2.static.orange.es. [95.21.2.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm16470775f8f.40.2026.11.22.07.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:17:15 -0800 (PST)
From: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>
To: Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/qxl: zero-initialize struct qxl_release
Date: Sun, 22 Nov 2026 16:16:10 +0100
Message-ID: <20261122151629.223013-1-megia.oscar@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

qxl_release_free() used to check release->base.ops to find out whether
the embedded dma_fence had been initialized. Since commit 2bcbc706dfa0
("dma-buf: add dma_fence_was_initialized function v2") it uses a flag
in fence->flags instead, but qxl_release_alloc() allocates the release
with kmalloc(), so the flags contain stale data.

Cursor releases never go through dma_fence_init(), so with a stale flag
qxl_release_free() takes the initialized-fence path and calls
dma_fence_signal() on a garbage fence->lock, triggering:

  BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave+0x7b/0xe0
  Write of size 4 at addr ffff888010462700 by task kworker/3:1/91

  CPU: 3 UID: 0 PID: 91 Comm: kworker/3:1
    Not tainted 7.3.0-00341-gf47d223627f8-dirty #556 PREEMPT(lazy)
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
    BIOS Arch Linux 1.17.0-2-2 04/01/2014
  Workqueue: events qxl_gc_work
  Call Trace:
  <TASK>
  dump_stack_lvl+0x4d/0x70
  print_report+0x14b/0x4b0
  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
  kasan_report+0xfa/0x120
  ? _raw_spin_lock_irqsave+0x7b/0xe0
  ? _raw_spin_lock_irqsave+0x7b/0xe0
  kasan_check_range+0x134/0x220
  _raw_spin_lock_irqsave+0x7b/0xe0
  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
  ? __kasan_slab_free+0x47/0x70
  ? kfree+0x21b/0x450
  dma_fence_signal+0x72/0x130
  qxl_release_free+0x2cf/0x600
  qxl_garbage_collect+0x25c/0x500
  ? __pfx_qxl_garbage_collect+0x10/0x10
  ? __pfx__raw_spin_lock+0x10/0x10
  process_one_work+0x696/0xf90
  ? __pfx___schedule+0x10/0x10
  ? __pfx_process_one_work+0x10/0x10
  ? _raw_spin_lock_irq+0x85/0xe0
  ? __pfx__raw_spin_lock_irq+0x10/0x10
  worker_thread+0x4bd/0xd00
  ? __kthread_parkme+0x8d/0x170
  ? __pfx_worker_thread+0x10/0x10
  ? __pfx_worker_thread+0x10/0x10
  kthread+0x32e/0x420
  ? recalc_sigpending+0x162/0x210
  ? __pfx_kthread+0x10/0x10
  ret_from_fork+0x362/0x5a0
  ? __pfx_ret_from_fork+0x10/0x10
  ? __switch_to+0xaf9/0xf30
  ? __switch_to_asm+0x33/0x70
  ? __pfx_kthread+0x10/0x10
  ret_from_fork_asm+0x1a/0x30
  </TASK>

Allocate with kzalloc() so an uninitialized fence is always seen as such.

Fixes: 2bcbc706dfa0 ("dma-buf: add dma_fence_was_initialized function v2")
Assisted-by: claude-Sonnet 5.5
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Óscar Megía López <megia.oscar@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_release.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 06979d0e8a9f..ffc9e8f0a4c2 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -91,7 +91,7 @@ qxl_release_alloc(struct qxl_device *qdev, int type,
 	int handle;
 	size_t size = sizeof(*release);
 
-	release = kmalloc(size, GFP_KERNEL);
+	release = kzalloc(size, GFP_KERNEL);
 	if (!release) {
 		DRM_ERROR("Out of memory\n");
 		return -ENOMEM;
-- 
2.56.1

