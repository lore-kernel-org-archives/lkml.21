Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951863;
	b=ztR+xNTnL2L4slJ1AZm2iHi356rX66QYSGb6Gi0LXjJuDZ3EC92dyZgR7jlAEchrNjLz
	 Dt9Os9zNeJH3lFK8h+mMlmhqVBUX3ZGdLiWZeFrLm7NaEt5Bx1/l0d2QbTEugCZsd+csk
	 XDlvewgFlg9jk3Y9xvjoVcR5vSVE/zHPJNJnOFIpbNVTCR3tSoBb8bTidlouVElIgkmyS
	 TUyj5AO5n/p2ZCU4nIS1hzoziNyce3baq6tPvKhpOR9S3nEC5bL9I2r5mB7YtvS25AhG5
	 Xq+8ABEkWsMCc5Y5iDy41GYSCN//Un9hpykCKT6GZefsZe0TlZgFIdgBT42lWMefIsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qJvVhGm7m/yddOVh7TzhHkOYiZu5bDfmIBnbwu2rovg=;
	b=KAXwlvE2nH+o6EDe1WSWvXV4wbjVVWx+AZUMm0QjinAVb930hrrrT4huCyyOf4cvO7BV
	 JEsGIS7twcRQSWxqmGbt3RsXCa6JhqWTgQ69XCS+/NsQlBCO6lRCwwwwPOQJAM74ey26A
	 QjtZPXJYyrhFeGhVsen6rHyvhcVhcX8Rpo9BAD5DwVgaqJp6WBbmDb/oh4iEe1HhLTQgb
	 UlGMJ9BwHRcD84AxV5EYTGPIpmQdEXglvMNYCeTfUj/8+JGkJq9nzmGERa72HbgdhFzyk
	 7fwEEPa55OxIGhctbFBgEtNgWINM102n79u8TACvfN2z5yyPVwkMpjxtriWhJ/3sKOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CchlIyUI;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B3A606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49B3A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CchlIyUI
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso11321885e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951862; x=1795556662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qJvVhGm7m/yddOVh7TzhHkOYiZu5bDfmIBnbwu2rovg=;
        b=CchlIyUIiFLzWp0NWiPX7iDKjuoDPYIt7BX8oLQ62POofLVyCmG8kBcycWbB1WHSAF
         S5mRQ5bjCp7Uav4uPQnhOmW+6YW1ECy0VB9X2XYQhOSMCnatHr6297cQH68vpUac4Nop
         YTev8UHFzfBdEagjN5dtPew+VcLuht/CiZf9PgbAI3xZk1Kct/2Z6Go16wun7l1in+Fr
         7XPItg5mDEJ4i6u9CG+aE6FyyFBP4EnYN+8T9LLGNw+bhXQwc9E26BIESra7CpX13IV/
         3HUtqIAaxzyf7bK7e4c8z60KAuQvhO4pjYti9xR41308BrH++XjrxIkIygA5qC6r026C
         2FZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951862; x=1795556662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJvVhGm7m/yddOVh7TzhHkOYiZu5bDfmIBnbwu2rovg=;
        b=Jo0UwWyfe86jFq4SPMfPrET/4J8Oc26pnIXotDjbBgCOmRP6nYCaEH+GABZ2vfrzhm
         ieQYs4zih6WPDneT5OpS+y+dSXHLgnsdhMpiuWFV9WDHHdeZJSTuXRbfZuI7NLoGEXPP
         iRVXE6QYqWANSoBIdEWcOWvIRY9uWazEKq5EqYKEEFpUiluIbj/p5jML1GUoOKq9wBBA
         GE+GMgSqZXoFdxBKmB65nkzeFVi4jszGRGtwIlooDayKmZN/CW6ZHq7y8a748Q4gi5fn
         nmoM9mxvunbPa8pbr2i2g88gpaqEL9iXHFfqV2CGWqdYMdStiq+sofyiaTRZ3f9PwNs2
         sF3g==
X-Gm-Message-State: APuU4Z/s/Ps+MCGU3yXtOPeU6x2B92/73Kzv2/5t2Ojs0bQZppawQ9An
	nVoOrUjLo/2yhswb+dTDG55Ff+25WRANQkHirEQvQdtVLlL13Kr+jD3yS3z0CxGU1pY=
X-Gm-Gg: AYBFou1GyI2ELgIhAkcUvqUYdUiFvPgY9WderNlwHQ1tifIKJYOHdYP/iwOyxevZOM1
	qkxExY+euV+HrlRaSICKXpv1DPqKel8AKeN3hB64QhfS/AiR6eYQKNnaMhHVFSxbqgi6BEvZhS6
	B2jWT3bo7XcKZovfhJeKygpinumOAWtgHXXKZa6+uL19iZf0yhJFKbyHNSePSAO2i9++PaFcO2L
	yB4slhne0+gG+pdd5h++26CTrCamXvyI0J1nfP/WrVKxplqFaYi5qbgbmDBlUAChKAot38xaPCW
	SiWEeVKkpQTlx0ZvomD4H4jS02UEgtOpTCmdLWppDh0bT/kITCxF3uHpdDq7jlKu3pVD9caatKF
	xNSZAakF2QzhnMaogwPKYCo2GeOOQuBSrnPsGspDixamr6jYaJZsa8yaTOBwMCEgOO7u4CAT9lu
	xpZs+c4GphXsXBWhxY47DRGgM53bten/ETUiCKSuAPNeMvLHqU04rk7r9v9ClDpXE7KO8NIZlME
	WUNLFA885AEjKQI54R4SdkcmypevR+9so6/GjU2LYhDPNJ5KQdnmbsn1p/x9G8ynR7IYtjfjsZo
	apRLF5GiysQmNgqt0t9g3abof+PWDTIBr37CXP7tHYrD1ZBvoT1lmnyTnAPyNw==
X-Received: by 2002:a05:600c:6090:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb7da0c872mr9124615e9.4.1794951861506;
        Tue, 17 Nov 2026 13:44:21 -0800 (PST)
Received: from fedora ([94.200.248.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb784231basm95069675e9.11.2026.11.17.13.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:44:20 -0800 (PST)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Mary Guillemard <mary@mary.zone>,
	nouveau@lists.freedesktop.org,
	Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH 0/3] drm/nouveau: fix instmem io_mapping faults and slowdowns
Date: Wed, 18 Nov 2026 01:43:49 +0400
Message-ID: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
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
Content-Transfer-Encoding: 8bit

After the instmem io_mapping commit, some people noticed that some VK CTS
tests became much, much slower, while others started running into apps
MMU faulting. This was because of two issues that combine together.

A synchronous VM_BIND waits for its job with an interruptible wait and
ignores the result. On a signal, the ioctl returns 0 before the page
tables are written. Userspace can then use the new mappings, and the
channel takes an MMU fault. This was an old pre-existing bug.

On the GSP path, the BAR code keeps an ioremap() of the first page of
BAR2 to flush BAR2 writes with a read while flushFBZero is not mapped.
The instmem io_mapping covers all of BAR2 and overlaps it. However, PAT
gives the new mapping the type of the older mapping it overlaps,
uncached-minus, so instmem was now uncached without write-combining and
bind jobs became much slower. This is what caused the slowdowns, and the
slowdowns in turn made it easier to hit the pre-existing VM_BIND bug.

Patch 1 fixes the faults. A synchronous VM_BIND now waits uninterruptibly
for its job.

Patch 2 takes the flush pointer from the io_mapping which allows us to
skip the ioremap entirely. Nothing maps BAR2 before instmem does, so the
io_mapping is write-combined again.

Patch 3 sizes the io_mapping to the part of BAR2 that the driver uses.
This is technically not required, but this matches OpenRM and makes more
sense. It also guarantees that a similar issue can't happen again if
something changes in the upper half.

Mohamed Ahmed (3):
  drm/nouveau: do not return early from a synchronous VM_BIND
  drm/nouveau/bar: take the GSP-RM flush pointer from the BAR2
    io_mapping
  drm/nouveau/instmem: map only the part of BAR2 that is used

 drivers/gpu/drm/nouveau/nouveau_sched.c       |  6 +++-
 .../gpu/drm/nouveau/nvkm/subdev/bar/gf100.c   |  6 ++++
 .../gpu/drm/nouveau/nvkm/subdev/bar/priv.h    |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c | 32 ++++++++++++++-----
 .../drm/nouveau/nvkm/subdev/instmem/nv50.c    | 19 ++++++++---
 .../drm/nouveau/nvkm/subdev/instmem/priv.h    |  3 ++
 6 files changed, 53 insertions(+), 14 deletions(-)

-- 
2.56.1

