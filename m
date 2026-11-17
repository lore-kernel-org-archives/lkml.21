Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951884;
	b=PWzUgoMX30dfDQNVF3q8SnjuhLDkf/veBfK0tcHOl94ztdNh8t7xbOZjtY5y+lSJ3bdc
	 +nawv1SDrKgj1oAWQnDznzvTvxIl5e2i1iddI+B6Pavgz429okGYYdlhEdGcaogM3ohan
	 99QTKszHNvptOeklrh8jUqbVqE6u9DdCPGdRZ16VoP00Dw5ogV1f1vCnN0CSC1KgfAPaH
	 qU+EOsgU/JMzvjFlU3R71lRwi4SEAkrsqjd/r3xs5JWlJ1VLs4+RWLpwWEtJgtI3ZxYuO
	 T90MyHQiIa109Q5Pp8srWda67K28j6qS7Yj3wJnbSn9/+z3gESQceimD74wJqwrqHzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DOc7qs5gpmxDny1UvV4waZXrE2n/TMggor9dB+wdMFA=;
	b=3LHMK1QKochdc1Uqb42E//7ehiaYAJQDbkT78BC8ZrlGL/TvrvTA58TWnmdCQiGhuq62
	 DacITXgI9TB04r+8JA1sf1Jq9aTHWhfM3jFCcj6orzjR6wtGxtFqpCBl/4yxwvcSso8eh
	 ZLlMCgLMQbV3Wj5553Zt+67/5aBxtXaLaST4B7sv0S74mqgjUCV8hfjfT6FxUSdKpeINK
	 3bWYwKBAB6p8Y2XzOA83ILPCr+P55XnWhfonH2OLOQAiFfmngYabGaz6QieTXS3BMi4VO
	 QNrBU+T6X6tOO+zLusA3Tmx5CqBeMfRYGf+3ER8pP57aOFReBiRvqG8WBrq+VF6iZYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rYqInaYh;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4517F606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4517F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rYqInaYh
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so3192265e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951883; x=1795556683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOc7qs5gpmxDny1UvV4waZXrE2n/TMggor9dB+wdMFA=;
        b=rYqInaYh157XQGoJzNdoqprlh9FXQeZK7/G4UMECGtxj2yS3cjPs3n8niMgyRVZBSR
         PYDxRcJ1vTiGAGzIwW+SV5lEpjlhzbU8a6JckZz4ezyrgIGqVK+ABSRixPZAsuFlpfGl
         2Tw1z9zw0wZbNPUo9bVVL5UBznLZoHgu50Pp3RrN2LdqYhiZXVBwa0QuTPMoqPVtMM6m
         5ZR+XTXU+bd0cB1ON4SrbORAHxz/ncmUjAsyhTRIj5Ezh74td/0N0J/h73axsJ/2iTWt
         VYi3AlKQ00mJKosKg7hquXpRT4rz36y7LP7P3Mnw6jJbq/Qo5uIhi6rm655CLnl8uKHo
         D/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951883; x=1795556683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOc7qs5gpmxDny1UvV4waZXrE2n/TMggor9dB+wdMFA=;
        b=IY6Bvfflq1wV8Cb5N3G6bS18Zkvn0PaG+d3JSDfjJEcshIFenxf4oducJhIIIB+g0I
         3j/xqJc7jWhYR12KO1SeFYgKQWZud5uSs4SmzSk384RCk0Q2xREYosZTAA+LUgz8G+yu
         8jRRKZFf4bwJyrF4gX8v+4qDoqm+GfInw72wAtFMvUdsZRpXlWodCLa8/jJ8W8P3u59I
         v6Hglh6LTOP+jO60pzvAIcdy238Jap9F6Uf+USbIvzjqGRI0/pwwpoxgMLUg5gBZn43b
         KdEttLYG5AdtbJ2iJK77aC2fAkJ3gOUak3e+GXGXRUXwOmYH8UoPpH/VZzqnh8+pvJJP
         /S4g==
X-Gm-Message-State: APuU4Z8Kd0VguMPUd6Qmhej3sw4IxyxR3cumFl+cW77wRFkQZF5CLHqE
	X500HllvMCIZjAs3EHqXjkxJK7r9upgz5BY+RUAQjoAhR2mARKyQAR54+uO4u66/2pA=
X-Gm-Gg: AYBFou3LbEd0aiTTt6DZbJL9nFuBYJilFJj72gIpJb8Mmx4yG5BEDuZtXletKVyvNbc
	2y62KJkWubkgeNdKwL56iYrMnkKMyah5opz8hYcJekjd2cytkDg0iEnLgRSYvok11jEXaViUdEv
	QAt4y8cI7OLpJqIUztyADDB9qqRVfWHJb+XdjvI8e8ThPnKquu0chPSilLYwDA8T6exNqhzy3S4
	+Oha9B/CaqJtCAriOVog5AnpG129uvIKr1MclgHrLAqK0ddpw5YeDGY/1lp29dtSJxR8tgDW6Op
	JQJlOFvLsDsmV6z1i85XZaBti7A7ODKzUzA5F8XN3FUWu/dDXgGXTxnQKiO3BsZAR3cE57w/tes
	xmL5r37SSQy+VBuip719De1KNMas312THDvax7tSw1cQEXvEaAksh3gjQYyZyjucEmFrAUdrfP3
	wjJJ5iea6/0yS0bSpHuZSzdMsFiltxMoUVbAnl2bNI3KtIYCX5zzQI0A2qrMkB2MQWNu7GlF3vP
	Eh92ZiymHDOYXu6ik+phn55pHsDDdSu+q1EGlAT6Qbvo8iylls1hIze4p11xu97OEFBay2OO2QE
	p8GSLNSNh7LRTwQMSjZ1j0J6j6R1r39uJZ1+h0c/1Re6TABBgI/xy1PNXgnciw==
X-Received: by 2002:a05:600c:608c:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4bb7da44047mr9350665e9.28.1794951882663;
        Tue, 17 Nov 2026 13:44:42 -0800 (PST)
Received: from fedora ([94.200.248.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb784231basm95069675e9.11.2026.11.17.13.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:44:41 -0800 (PST)
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
	Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	Thomas Andersen <phomes@gmail.com>
Subject: [PATCH 3/3] drm/nouveau/instmem: map only the part of BAR2 that is used
Date: Wed, 18 Nov 2026 01:43:52 +0400
Message-ID: <20261117214352.337961-4-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
References: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
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

The io_mapping covers the whole BAR2 resource. With GSP-RM and with
NvBar2Halve the BAR2 address space covers only its lower half. The
driver maps nothing in the upper half, and a mapping that already
exists there would give the io_mapping its type.

Size the io_mapping to the BAR2 address space. The range does not
change where BAR2 is not halved.

Fixes: 34e27b90552a ("nouveau/instmem: use iomapping interface for instmem handling")
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Tested-by: Thomas Andersen <phomes@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
index 1b4be4b1f0bb..1e7d439c2d59 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
@@ -191,16 +191,17 @@ nv50_instobj_map(struct nvkm_memory *memory, u64 offset, struct nvkm_vmm *vmm,
 }
 
 static bool
-check_io_mapping(struct nv50_instmem *imem)
+check_io_mapping(struct nv50_instmem *imem, struct nvkm_vmm *vmm)
 {
 	struct nvkm_device *device = imem->base.subdev.device;
 
 	if (imem->iomap.size)
 		return true;
 
+	/* Map the part of BAR2 that its address space covers. */
 	return io_mapping_init_wc(&imem->iomap,
 				  device->func->resource_addr(device, NVKM_BAR2_INST),
-				  device->func->resource_size(device, NVKM_BAR2_INST)) != NULL;
+				  vmm->limit - vmm->start) != NULL;
 }
 
 static void
@@ -293,10 +294,10 @@ nv50_instobj_boot(struct nvkm_memory *memory, struct nvkm_vmm *vmm)
 	}
 
 	/*
-	 * boot is only called on BAR2, if we can't remap the complete
-	 * BAR it's unlikely things are functioning well.
+	 * boot is only called on BAR2. If we can't map it, it's unlikely
+	 * things are functioning well.
 	 */
-	if (check_io_mapping(iobj->imem))
+	if (check_io_mapping(iobj->imem, vmm))
 		nv50_instobj_kmap(iobj, vmm);
 	nvkm_instmem_boot(imem);
 	mutex_unlock(&imem->mutex);
-- 
2.56.1

