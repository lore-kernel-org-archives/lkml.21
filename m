Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795860281;
	b=4769cW0qklKFLdgsQ4hAT+Nukc+DLRmndUko1xvI9LrKkZBcct7O3cP6j6Z80NXqXMGY
	 VnE20BAMEQrGxJx4ltH9NCjDrLpwqfl6MNFYO3+9iw7PTfnR4rjzsgHpw7TvCJNmCH92P
	 8bGrPecwvkYf/x6XKE8AkG8GRwE/VfTeOxrHo6f8WYlPahnWQdkqasYZRp/Uw1owRlfqA
	 fKHYeuydA2/15Colx4N705NlUcbNYWmoD2UHvatoRP+wGMkjJF/oVB0xP/fHITkZaAbEd
	 sz6N4QJJk+qElsP7d/dwjruC1qkVL2xafuogvTIS9er+BKqKP8rFp8X0minYjGJflIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795860281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wJHu2Cmp5m4NLvlBcGUsPCjvAUhFeSDFqDBREkjtkr8=;
	b=JnoXFFvDTY0cCGPWjzYi8vmXDJUAUixqFaZuyuNoYrkSpflXYXDapouGLDXsSolA4Vku
	 WI7V5baOHPb/8zqjs6zPq5t0XJYM1EE3/j7wYh+j+H9J/vizHECQak6TKyURXZ9MSH/iu
	 B9vgcFYV3K+OFYx1w2EaF4FRAVpTZTbDHJh06cqKkyz9P1mSNbqvQaeE0dizjJEN8nn4+
	 9Oq9BuYNLii247k1bFV3fpf5lItjUr1SqmPC8RS1oDigj6vnodjm4FlJhq5Qr0uvblRTd
	 A+DCsQXsxbcuIDZvzmnA+684B/yqRfOKxPysU+oCbMGvBa2TxstNT4xd2ZSOXDxoQMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DXH0puPQ;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77219606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 10:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77219606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DXH0puPQ
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b51a9606e8so1581657a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795860281; x=1796465081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJHu2Cmp5m4NLvlBcGUsPCjvAUhFeSDFqDBREkjtkr8=;
        b=DXH0puPQ278caxJWMSXej4XQbsAMx/Ujc4A1qyIs+lDdWQ1S2p5f9mFaGfZGPvEzGm
         i4M0PRD3iHDJhTXA04YKn+maOFEawjPoFZRvTNmEQ/p7wxkl0EAvpw/Bun6FHZ1TwDBf
         V74dVgaJzam9uTCptJhOYbozsOy0mOpSbA7KErYTQoK1+LUYuCrPkSo8EIpwRR/Us7JH
         3aGferK25u0MqVQRpTOOyTbw5JH6PN85Uea3TA9j5shDa2b/QV2ofr3xtY98tYyp0qxv
         8l4UuE+MmCaV71qev3I6MCTo5/T5MOOy0tU7VedhfSSjjui9fZZIjKhnE5lpW/5M6OQJ
         Kltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795860281; x=1796465081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJHu2Cmp5m4NLvlBcGUsPCjvAUhFeSDFqDBREkjtkr8=;
        b=sVUeQnJiOJrUiVULbmDlZL182YACpZv8AzdkqzuyKpyFsEqFraqqNb196DZUXdw31m
         dtoPWc+p6fJ6vVLKxAin9njTdu8N9skMRVPShsRPxxb8fwxU6JdodzUgkbft9V1B4Axn
         nP2UgQ7GBoyF/qnqior87t5eYQNjVdeTdKK0wiRWbO8FKtTEhFSbRA2EazosJlHfccwV
         VoEHawYiUwhqRejX4RUSFqCC1qqmX108H099PY6kImd3NJQ1vbxyZJEaAjbb9E/fokvZ
         GDl2YraXkLEbLwUujJX6hWAksaSxyrhxtVYCZYVu5B4flbtSV9Fc9wNl4/uvDj8IHd3G
         /+UQ==
X-Forwarded-Encrypted: i=1; AL+hErFF8Lqd8wCB3ROLEmTk47FbmSggyTiZkGOm83qQDQ3pds3QCT2V7oE5Bd9+ptmgxSuytwYzXy6buSbZuoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FeSvA5ndVl6DSoyS5FCXx553UC7bXSYtXoFJo/PvmvcYcMZpm
	Bx2eu3H88Bv8DoLb2dT6nNzUp0RX70Yr7PGkgjjlaS5yNQorQl3PCKKsC0IMgCCE
X-Gm-Gg: AZFdTZc5iEoZ4RWY3g+kW/egJWydbAyqwrbyMoMhU6rK/dKJfP8/9sTdrv8bc4c3O8o
	eLT+4FqEFQq1w0EsPTim+atufHvtkNftHLE2iiQmt1Nyj4ihJ/f9YQv0d1RlYCfZuf/Z487TNX5
	3+G7pJwf80vaBZj6C3SFj3PhrIRKbHXKpZB74p8h4RfmE0xg3ay13WWMkJC87gxoi9mQ0uDtKzY
	sitNgL/kUpptTCMEqJP4CXbcMbP6ZZXH5JHB9yExQaSO9FzGiB1Ty6af8QBoSOq3WvccjMof9ar
	V6PJbUpOqC3CIZN7N/5fYSuXawvEavPIanntj+7JGRditlVYp3FhFa59f+53VDCxAGXEXva5vuX
	JBvoGSzo6L/CV0zO1tbQHg5/JRsmJ/3bU7aD/Jht8dznUwfC9VuMo4YpvS5j8Rxkd+sft8YzfTw
	nrI/ZMx9HwzOmjnB8hy91qboObwuI+rBLighM5NiFk042R5SvvNcfQ7mzdPVb8H/YVCofRimGdL
	z6dw74u1/QMUAN9w1clxoDxGX4i6FOivDVpPHUaKI6YkEkfYm9GRnshw1uAvwPpxMSC1p+Ukbwl
	IEzCbOYURir3PythkFrQEHP/rAsO8Vm4phOoWhVC/GTmQPD7ZlpaygnZFZWBT8n/LjSW4dZ1Ewc
	ghH6jtMzii4/vuwJ0ugI/c1Z2pBMD1QxUH8AWzjIvABoDOA4D8dPSlGg+R6N0VaUuiaxDpDGBjK
	k2fQJUwrcMOOW4DJd2jL+M2jwVBXPEyHYYPbkhDXg=
X-Received: by 2002:a17:90b:3891:b0:3b4:127a:2bc2 with SMTP id 98e67ed59e1d1-3b41c8d9bfamr26559585a91.14.1795860280740;
        Sat, 28 Nov 2026 02:04:40 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b73b2b3sm20556526a91.2.2026.11.28.02.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 02:04:39 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: jani.nikula@linux.intel.com
Cc: rodrigo.vivi@intel.com,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/i915/display: hold frontbuffer ref across dirtyfb fence callback
Date: Sat, 28 Nov 2026 18:04:29 +0800
Message-ID: <20261128100429.689-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <8247d106ca535db291d2f85a3b8bea7956c6ccd8@intel.com>
References: <20261127133935.1461-1-luob87709@gmail.com> <8247d106ca535db291d2f85a3b8bea7956c6ccd8@intel.com>
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

Hi Jani,

On Fri, Nov 27, 2026 at 04:17:21PM +0200, Jani Nikula wrote:
> On Fri, 27 Nov 2026, "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com> wrote:
> > intel_user_framebuffer_dirty() stores the raw intel_frontbuffer pointer
> > in frontbuffer_fence_cb without taking a frontbuffer reference. If the
> > framebuffer is destroyed and its owner frontbuffer reference is dropped
> > before the reservation dma_fence signals,
> > intel_user_framebuffer_fence_wake() passes a freed intel_frontbuffer
> > pointer to intel_frontbuffer_queue_flush(), causing a use-after-free.
> 
> Please describe a real world scenario where this "if" can happen.

1. Framebuffer fb1 is currently scanned out on a plane (so
   atomic_read(&front->bits) != 0), and its BO has an unsignaled write
   dma_fence in obj->resv:
   - On xe, any normal in-flight GPU render job to fb1's BO suffices,
     because xe_frontbuffer has no i915_active front->write tracker
     holding a reference to front.
   - On i915 (as well as xe), an imported DMA-BUF / PRIME fence from
     another GPU or a sync_file imported via DMA_BUF_IOCTL_IMPORT_SYNC_FILE
     likewise does not take a frontbuffer reference via front->write.

2. Userspace issues DRM_IOCTL_MODE_DIRTYFB on fb1:
   - intel_user_framebuffer_dirty() fetches the unsignaled singleton
     fence from obj->resv, attaches intel_user_framebuffer_fence_wake()
     with the raw cb->front pointer, and returns 0.
   - drm_mode_dirtyfb_ioctl() immediately drops its temporary fb1
     reference via drm_framebuffer_put(fb1).

3. Before that fence signals (e.g., a render job taking >1 vblank or a
   slow/stalled external DMA-BUF fence), userspace flips the plane to
   another framebuffer fb2 (or disables the CRTC / closes the DRM fd)
   and removes fb1 via DRM_IOCTL_MODE_RMFB (or drm_fb_release()).
   - The atomic commit only waits on fb2's fence (if any) and the
     vblank, not on the old fb1's obj->resv fences.

4. Once vblank completes, intel_cleanup_plane_fb() drops the plane's
   reference to fb1, fb1's refcount hits zero, and
   intel_user_framebuffer_destroy() calls
   intel_parent_frontbuffer_put(display, intel_fb->frontbuffer).
   - Because nothing else holds a reference to front (on xe,
     intel_fb->frontbuffer is the sole reference until
     intel_frontbuffer_queue_flush() runs; on i915, foreign DMA-BUF
     fences do not hold front->write), frontbuffer_release() frees
     front (kfree() on xe, kfree_rcu() on i915) while cb->base is still
     attached to the unsignaled fence.

5. When the fence later signals (normal completion or GPU reset),
   intel_user_framebuffer_fence_wake() passes the freed cb->front to
   intel_frontbuffer_queue_flush().

If you agree this scenario is worth fixing, I can also send a v3 that
includes this scenario in the commit message and removes the now-unused
intel_frontbuffer_queue_flush() / intel_frontbuffer_flush_work() /
flush_work dead code noted by Sashiko.

Best regards,
Bin Luo
