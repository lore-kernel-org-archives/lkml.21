Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011911;
	b=iOp3jGMFzic3GRW2LnZWyOqEc7uBFbhuKIDqoZI4oNZMmzcvfdQgZDbpm42ULXDqj4mB
	 HCn0y1fgqLa5IXV8wRlRKGZJ537icNsLZKBRLZpz7eJiHor3DElS49fNXBmFJYs5i4W+H
	 ZAJRiN8Lpvf9eNUq1lOXF+P/ufaLrICQiJekpHzIY1rE4aNuIKRAdridRlaa/jX5w8tK1
	 Q/2DIvhNVztvsP/KJS1+K/e4eSE0gcUylsyqPCGzItX/vcE2b2dMZvHrUk5qPYc52x2/C
	 Tu/CrwRHTGbpnt4VxDgUWV8eMshMtr1rMgZl53/vZGdxeO0JEYZ/hsxo6yxbR4Vf6UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011911;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=nFJbK8/dNKLZ9Wci+tDCATwra1Lrr5nEu4JyZ/1PmU8=;
	b=P9tvwVEkl+6837/km8OBJMD8D6OsZ+d7Y5DFJqgFfXttxv7IaWc8N9lvgLvUvpGvZUjW
	 kZMbtLdo+NDlVnJKpD4s7WvYFOXj6+jflDVodcx4uakJI6bW53lO8Zbii9iuF0/9SBogA
	 k5VKQuEd0jB7NwlMJPVwtOJQouGJQhOM54YyiKkB80wsBoTZ6yeN2XElGtbmz6bOjOZ20
	 v3/fMunr6MMzA94f8XJoPtbrMpb2dYNxLzgGTE/0LENuHYOs1y9HwthlawTHSL5AbiU2J
	 qooAeqr4DAfxpk6kQ9JFa7SozEC+PpOWpMnBQgEMUQAwvcPQI/dU37kv46haD5qE/hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=eV7oY9Om;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A6060A2600
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80A6060A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=eV7oY9Om
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=nF
	JbK8/dNKLZ9Wci+tDCATwra1Lrr5nEu4JyZ/1PmU8=; b=eV7oY9OmDxaV1muuwA
	ZCyZiRq4q2g17ZIj1bNvWAuk4UOpfpCfPwm8doX9vGKHE3ZcbkgeLY/dvf4vEqjh
	5zE+MVxPT5dQ/b/MhQBSJgxr4u+gkjngZVC7T87h6nndxkiyavIm4Vky/+fsUjRE
	7uevPiAJKsAzddGRKDs/O0jos=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD39ygTtf1qsV7rIQ--.20297S2;
	Wed, 18 Nov 2026 22:24:21 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	mripard@kernel.org,
	linux@treblig.org,
	aurabindo.pillai@amd.com,
	nico.antinori.7@gmail.com,
	superm1@kernel.org,
	haoxiang_li2024@163.com,
	pierre-eric.pelloux-prayer@amd.com,
	Ryan.Taylor@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fix VKMS plane memory leaks
Date: Wed, 18 Nov 2026 22:24:19 +0800
Message-Id: <20261118142419.2389009-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:_____wD39ygTtf1qsV7rIQ--.20297S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1kArW8GFW5AFykJF4DCFg_yoW8Cr4UpF
	48Xa4jkw4UZaykGa47Ja48Ww4SgF48uFyxtrW8C3Zaq3WYyr93G3W8tr12ga9rGFW7Cw43
	Ary2y3yDCF1YkF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUO6pkUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7RWM+mr9tRU0cAAA39

VKMS planes are allocated with kzalloc_obj(), but both the plane
destroy callback and the output initialization error path only call
drm_plane_cleanup().

Add amdgpu_vkms_plane_fini() to clean up the DRM resources and free
the plane structure. Use it as the plane destroy callback and in the
output initialization error path.

Fixes: 84ec374bd580 ("drm/amdgpu: create amdgpu_vkms (v4)")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index 5c5fdbec93c2..a511322c1c02 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -140,10 +140,16 @@ static const struct drm_connector_helper_funcs amdgpu_vkms_conn_helper_funcs = {
 	.get_modes    = amdgpu_vkms_conn_get_modes,
 };
 
+static void amdgpu_vkms_plane_fini(struct drm_plane *plane)
+{
+	drm_plane_cleanup(plane);
+	kfree(plane);
+}
+
 static const struct drm_plane_funcs amdgpu_vkms_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
-	.destroy		= drm_plane_cleanup,
+	.destroy		= amdgpu_vkms_plane_fini,
 	.atomic_create_state = drm_atomic_helper_plane_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
@@ -375,7 +381,7 @@ static int amdgpu_vkms_output_init(struct drm_device *dev, struct
 	drm_crtc_cleanup(crtc);
 
 err_crtc:
-	drm_plane_cleanup(primary);
+	amdgpu_vkms_plane_fini(primary);
 
 	return ret;
 }
-- 
2.25.1

