Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795673307;
	b=hwKu8yLtP4FHT9nnrrPek5v6N/Ly2E27u4QtQV9dSyd3b+jJ5jeItIFyeilHXoK4U5Sq
	 5rTed8Yls3DKmdYRWQA6wJ41OJxzdgovCZfXEOqIobzPG9Fc2Yyw8ORpP5x8T3ZmlG56L
	 L2wviv5HP0ANJhyr7bbcfYbOgSFNvicelLxC3/z5+/RciC4DAfbDsj90PTlOBoHSlsFqm
	 CtsEKBTRlnya5d5YXCZFzI/0LqxUn0biYuQ6sRb+07nzfvi4DuWz47J05S1NAMdmpLmou
	 jTupvuEmB9ZsSW6dCkhAuF2GMLKnkC92aG2WLBK4fPAa/U081Y3In0TWGN6xIWclSqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2yyDoeUfOAGstlBUWiMGIeqYp1mC1ESfIoYKc0SeXTw=;
	b=T5ndhuHIzIyMdbMzZBSxvUT/1ESleFNzikQDN8+H9l1ITjBTjd6MbKwYQsTzPHVJMVHM
	 WQ0ifYf2fSOl8KPRQKvI/IFLvwh26I5KZO0d8vgF2wuYTXPewpqrj7jDfRhkXZHhbrqL4
	 oGbzY7ZQsglFcAxAJ0FQSGMVAGX1QtZBCW3Ro1f3eNc1bV3w+JDqey5/TwGAPJ/XPuGlk
	 +oZwgN1WKmoy/Hqi7ffEnl3IKn9XunCqKv3I6o0q9+gXg9U+PtWTq0JAVEaDa4zmiZ5f0
	 R+xcOTfDB9hdpiaCHynh4PasZJmE+S3q7vpqzLm0rGnqZyn+TUmR8aNHOlZ1L7sRZqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uw0pDESL;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A220A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A220A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uw0pDESL
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cddac941ed1so2977340a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795673306; x=1796278106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2yyDoeUfOAGstlBUWiMGIeqYp1mC1ESfIoYKc0SeXTw=;
        b=uw0pDESLf6BfjH+EwEOgl9p+1updH/5RWW5Km2+xzSkR/ew0Yi9Wlt+hXE24MOEACD
         5E+sH3ASINEGaFKRzWcjY28FlOIUbaZdlT/QXipqdXpab07irf8H/rV7q5kikMdfQA1E
         e+quMxUQjjSs3BX8Nbl4FsVMAky52gTQqFwHlh4s0WlVUtwQtt87XTj04z2hasYsnPgF
         5REKRvaYNOmDZrDWagvnsxTdi7JHSbOeg91cg+ZD2We5MinlSydRGpT13bpCfZysI9Tn
         25vpqdZVS1XohpBW5dQdf1PsjMnL+35UGGKPp7wmR9OGz7lLuKlk1SKTR7WkCbRnVIuZ
         aFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795673306; x=1796278106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2yyDoeUfOAGstlBUWiMGIeqYp1mC1ESfIoYKc0SeXTw=;
        b=ZdFtEk6OuNRs1CQpVbcWAEXho70g1x+UkpWAvL1CHpJh6VOhuOxo5MISKHCuzyYmUj
         9031z/OYEj87Dp8z7xVNNWBru1jhwtsBXGynTg6l/oJKN/O0i6tNyuelmLFDBqd8dIcw
         bQEl/15ZznjOkWHcQoYyxKGPOCzNRqmq+bZZnaTuInqH/MItZ/OnhFPa53LaBG6INVns
         2hHbmitA9tgoKwFDEbBAT7rYAxHC47h/WBR1keX4q4NA/598jPAwtvn74UPD1Vfe1eJ/
         2VmZ0KOjnfjfylykM8RMHRg1/nKQB4C8/Xk5gV7COG6yPZQBf4SY6i6mmwoEEarKZejB
         XttA==
X-Forwarded-Encrypted: i=1; AL+hErHV9cinEVXZQ6kRCEqPGjNw7/zKW1TiPMrQCWzNWSaSBqv2D5FoyGp/BvlTywMHeFz7x1Pj6v/GPGgG9ro=@vger.kernel.org
X-Gm-Message-State: APuU4Z80YTNxNqEfAeHUoTsFDVG4r5M91enh16oY+gmGfEoKF5fY0Wou
	w4xVak6v1rOusUlHaK27YBCf7gN/TDKsSnDij5Ej49LE6I561RtpfzJS
X-Gm-Gg: AZFdTZc1sfWBdmvXx3pllqYXLHG4u5jjNcgdf59K1qoGqm6D6TJzstdP3EQrMcipDMl
	nq3LCsMCrvBug0pyKQMhtkynQeoTBpQopB0VKRfTXntwtsqQ7kHKCEoBwyGF2X09H3i8R7dogBw
	WnuGmwtjF0xK3DMkz4QSfV7wIEQFwhTgr3aZeHIAi+L090FOBzdoOrBT/SbVZTnmN9wu6opau/5
	zQFChZ6EVH+39icsuVUsHqypo1O0Gat0ED4wZsqXYq8lLtK+30UWKh2LMZMJ6IM75BzRCR6LNU0
	1YTVB74gfTk46N90PzMTiNTHCvSoPTnF6IagKp8bWWZSqwljcTEz36JEEDuQqAA+RfBLCqbvtMG
	KtM8mhUiVKfAgluyDM2Ux9NM6aVRBDxEVZLFbT+tehzkWJ0CwnmGO1ztUz3yn9MDxJ62iqdYuqX
	K6rh2v386cE2kjRzF8jhcscUkA18F0Ode6je39Uu2pxg9OrKi5d8LChSc+DWHW+oi5Rg7OSVEfZ
	YlQ4Z5sYr/i4zG0SZwkEYWjwvvV6YxTUCQcbLGHNysBJQRSSTTpXUw4/BFxrq+exwzJWd8lT75r
	lraJZ4IWOfpW1byHb++1Uzxs449ci5lw4WU1ngSB9H71vxCkloqg0CQj5UHWZkDtH1YOLyfKlKA
	5EI4gedLXTVZWlqEasGsIIwrOkesKJe/oql+3BbOVLXn/P6hPUHIGhNZPoNcnoQYyxsIohMNVma
	NS5bvnXZCwTH0g0+0jSnq7ft8iaoxPlog4zYaGP/92nQ==
X-Received: by 2002:a17:90b:2ecb:b0:3ac:8446:c1a5 with SMTP id 98e67ed59e1d1-3b41c988620mr17565188a91.48.1795673305926;
        Wed, 25 Nov 2026 22:08:25 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-3-38-183-164.ap-northeast-2.compute.amazonaws.com. [3.38.183.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm31324076a91.13.2026.11.25.22.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:08:25 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/display: hold frontbuffer ref across dirtyfb fence callback
Date: Thu, 26 Nov 2026 14:08:18 +0800
Message-ID: <20261126060818.1654-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

intel_user_framebuffer_dirty() stores the raw intel_frontbuffer pointer
in frontbuffer_fence_cb without taking a frontbuffer reference. If the
framebuffer is destroyed and its owner frontbuffer reference is dropped
before the reservation dma_fence signals,
intel_user_framebuffer_fence_wake() passes a freed intel_frontbuffer
pointer to intel_frontbuffer_queue_flush(), causing a use-after-free.

Take a frontbuffer reference via intel_parent_frontbuffer_ref() before
registering the fence callback, and release it via
intel_parent_frontbuffer_put() in intel_user_framebuffer_fence_wake()
after queuing the flush.

Fixes: 1bb2af547a4b ("drm/i915: Handle dma fences in dirtyfb callback")
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
Found by code inspection. Compile-tested on x86_64 with W=1 and KASAN
for both i915 (drivers/gpu/drm/i915/display/intel_fb.o) and xe
(drivers/gpu/drm/xe/i915-display/intel_fb.o); not runtime-tested on
Intel display hardware.

 drivers/gpu/drm/i915/display/intel_fb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 9d71f59..3bbbedc 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2148,8 +2148,10 @@ static void intel_user_framebuffer_fence_wake(struct dma_fence *dma,
 					      struct dma_fence_cb *data)
 {
 	struct frontbuffer_fence_cb *cb = container_of(data, typeof(*cb), base);
+	struct intel_frontbuffer *front = cb->front;
 
-	intel_frontbuffer_queue_flush(cb->front);
+	intel_frontbuffer_queue_flush(front);
+	intel_parent_frontbuffer_put(front->display, front);
 	kfree(cb);
 	dma_fence_put(dma);
 }
@@ -2160,6 +2162,7 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 					struct drm_clip_rect *clips,
 					unsigned int num_clips)
 {
+	struct intel_display *display = to_intel_display(fb->dev);
 	struct drm_gem_object *obj = intel_fb_bo(fb);
 	struct intel_frontbuffer *front = to_intel_frontbuffer(fb);
 	struct dma_fence *fence;
@@ -2185,6 +2188,7 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 	}
 
 	cb->front = front;
+	intel_parent_frontbuffer_ref(display, front);
 
 	intel_frontbuffer_invalidate(front, ORIGIN_DIRTYFB);
 
-- 
2.43.0

