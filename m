Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795144317;
	b=uDfIQ7+0Jv7dhaBjm45u5s2YP6nVrCWNTf9j60yrg9C6hCw4UGTULHWUzRYVvV2WS1SH
	 GkT6fXILUzfvi4u2tE1urUn5dgokqjl7Zkh8Vdw0UaFtIVrlTsREvG2KrG4YMYbRDl1Iq
	 G2YLV3C+9QLvC13HW6BgMUeyzN+WAmAC4p/zE9C5nUzGKuwvOR0gyezrALE/9mEKfLJgV
	 rSmDhBspvGBlTT8XBhf23XA+x+mbfUxj/NVglZegq8UUtRPZa1cuZQXz7u3moPFeMIiCd
	 niNn3xX/GDqE8K6D0gHXApw9SfTfguVDPOT5eq8I4WkGv8HQlqHqDVpKwLcoiw/U3ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PfLDjrfdwYTniLwtWaqO0Y6QOqwiPoyn88w0QJPjNII=;
	b=srPXiBsKdNr/Wff6JrbRtxcLC6vxItsFA+QyTxviLZoaaLdW6SWK9KYhe+BEZ9j0cIz3
	 Si2Pxw3AUVZgOMG/368KYWBTbW+cl3HcLMpulK0g0CHeD/99Fo7lDe0xBB2CPV+04+V5I
	 Bvjewc77fUw/Ie2Az+w2vhL64p2+M927Gsf8SGS/iK3YM8HJ5Ok5ulaywXvjOGHKx08F0
	 VZjdGHoOFy3IIxSsEBbkZEnrZ0DTVkAVXxxxhTtgzlKO70TBfXqAqDvyf6ZX+dgBVqSFM
	 6CyqXfW1+Q3fLH42vgu9nwt0ATbaqsR3m31lEDw4b5dO4uGg9o48AziTHzle9L/2Mgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sbatdsbe;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822ED606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 822ED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sbatdsbe
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9495f083657so63650285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795144316; x=1795749116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PfLDjrfdwYTniLwtWaqO0Y6QOqwiPoyn88w0QJPjNII=;
        b=Sbatdsbe8sS205MbqNcGaqTlkmJsE2zUBv9ETXsBbTVBJQP4wRhqSZm6uI3N9IUyA7
         k8I7Y0luxR7iEn/+4zzkrsBf1BfahL7CxDctsZgJo0O13wOWK6m9Lph2w1kkfQEgHr/F
         hkVAFRD+0yR+bUvw+zBHNimauneog3Zerk2Va5bUkJb1qMMajnsZ0RXpPfnE+q03JLz1
         3hcQpAy6GY00QCjK+C75eQRFehss2AGt7PXE5FqjuzMBBnBtNN8+icw5wI4f/YxYw4ke
         QPtF2v/hP41czFrwTJLHeE5aiUDZ3zlpQnS6CMSYSsbV5PdcjFBebISfaQdeFVxUsuHf
         QfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795144316; x=1795749116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PfLDjrfdwYTniLwtWaqO0Y6QOqwiPoyn88w0QJPjNII=;
        b=gBEfSJz97+1+cKiXWczjlwPclYis3TA9M0UrWO5+K9itIxVk1coA0cz7WzwiWNswGx
         FLdaMUDigTw364OCMER4sa2uxUCeg6tUCbUBA3Vu7MzKZeE9pVT50dhb/ykWFLXo/jdm
         ysiH+KFwfy7fZ2MUFLNzpRJ60/X6g1jXcuYjnl6YgJGPJL+IYVlH4CgbEAglP2desTFB
         z+LbBMCkBGdeV0dC0M6BZdU6quGDnFJjFYgZFVefphgtK/soBoF/TfFlduSDPPfXk+6E
         33Ay4f68M5ARE1dPc0k0fyNK/+om5i45Zg3b4IkyQ4y/xmC/jfxgjvEZhB50E4TPSx18
         Mhlw==
X-Forwarded-Encrypted: i=1; AL+hErE2RiQVo4teCRK87dTbOAxx1+Rn109LRSSJ/2Oyc3tgO4FE6nCcUZZ1KdKnLkY2Lz2UPakArh0AqbUn/IY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/e2I3jEwsm9CRxyjte6MAj1+qcRDkHhia/Lv1FDJZZBH7tbYo2
	hGuIqdNoJDevqiFdp3mdsOYnqEyH53qZsJ8+ZR6G5nZtD7OUqIQyhfQz
X-Gm-Gg: AYBFou3W7v7hdJX/mAxKzif57MGKKu5uh8lwtL/sb8lAUxycUGs1xVfJzvK8COxYCCq
	SJ0okOtURSjH3NdNmmIQZoW8w5f0OejzPL3TGwWpYx4iIdXvKkN6o4VeGIxNSnDH9lUDYViarfs
	rRxjgEj07rexr5VEF7oeJlEEMx51Yen15yB5naxlgL4nnIOP5ojIMXLZDws8Dk31UleOf+d4zfV
	4oot6wXkuamdnZv6F2yELAa+dBR3G0iccDqfduJUV4kr6PHB/hNsFr+umVVlzwXnLSqwYXQ0r9L
	kkI7EQ9lv+Uz9LOx1aDi6TXkI/icgKm4PTH4TctMniOCnCPBujZjdaXOpaDgbKHaycUXzGvDw7q
	3JuI9yOvNYyysBEijyoPwwI/418VeMbrdjEH9z9QUg7g/cyB6u4qiQqWn6m3IrN8MqFyZcZwNMR
	rd/HHC4gTGiO+9tDYWwnlv9sV7OKSDtbBmLdeuXuHh62KRwkwb78qT7tRDt0mqoqoCe1i6a3kud
	vTtkTX7FlGtSPVMnDhz488OfqzwqJUIWf7rcrO22Ydzptd573kZyHckSaotXXETblSgJj9mHipS
	76NrQwYYMvbKIjD+bWhKRmUMvCtGSRVpO32arpRYwU1jvwsmgVB/Hvw4peS1ztPjh/UIwOlEndn
	muqQ5H2TRFw40cur9bPv3
X-Received: by 2002:a05:620a:2996:b0:93e:6620:bde7 with SMTP id af79cd13be357-949ba9b71admr305091385a.20.1795144316405;
        Thu, 19 Nov 2026 19:11:56 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38319asm100211885a.16.2026.11.19.19.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:11:56 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Zack Rusin <zack.rusin@broadcom.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Martin Krastev <martin.krastev@broadcom.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] drm/vmwgfx: Reserve the buffer during surface lookup
Date: Thu, 19 Nov 2026 22:11:52 -0500
Message-ID: <20261120031152.1696587-1-lcy8047@gmail.com>
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

A GEM reference keeps the buffer alive, but it does not keep its
surfaces alive. vmw_bo_surface() walks the buffer's resource tree
without holding the buffer reservation. A concurrent surface release
can remove and free a surface while the lookup is still using its
tree node. The caller enters its RCU read-side critical section only
after the walk.

Reserve the buffer before calling vmw_bo_surface() and keep it
reserved until the lookup has tried to take a surface reference.
The reservation prevents the surface from being detached during
the lookup, and kref_get_unless_zero() rejects a surface whose
reference count has already reached zero. Assert that the caller
holds the reservation in vmw_bo_surface().

Fixes: d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index a6d7156e4281..625c4b33daa2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -864,6 +864,8 @@ struct vmw_surface *vmw_bo_surface(struct vmw_bo *vbo)
 	struct vmw_surface *surf = NULL;
 	struct rb_node *rb_itr = vbo->res_tree.rb_node;
 
+	dma_resv_assert_held(vbo->tbo.base.resv);
+
 	if (vbo->is_dumb && vbo->dumb_surface) {
 		res = &vbo->dumb_surface->res;
 		goto out;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 3064a2a960e1..13548fdfa84c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -877,6 +877,7 @@ vmw_lookup_user_surface_for_buffer(struct vmw_private *vmw, struct vmw_bo *bo,
 	struct vmw_surface *surf;
 	struct ttm_base_object *base;
 
+	ttm_bo_reserve(&bo->tbo, false, false, NULL);
 	surf = vmw_bo_surface(bo);
 	if (surf) {
 		rcu_read_lock();
@@ -891,6 +892,7 @@ vmw_lookup_user_surface_for_buffer(struct vmw_private *vmw, struct vmw_bo *bo,
 		}
 		rcu_read_unlock();
 	}
+	ttm_bo_unreserve(&bo->tbo);
 
 	return user_srf;
 }

base-commit: af1cf92e8617a7f7aa24b415596cbf64b76a12e7
-- 
2.43.0

