Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685842;
	b=o8g+J8r59sAwbsSsgw3ALU+CjU+qWBbtQWhhJuQkF5JuD3vo8rzcUyjEzzpXmKVMWmJY
	 QE0cwIvTL1Lc4qMYPa+WWFpX8LnmoRQhXI98mkvqnIKZPcTPcKODi1cDK0NEUADmLE7md
	 /UhO47/vkVH4/a40vRc/1JQSLkLr9zbbfRsjb/oh0j/aqOZ3QnbVpA9BrS2bg96/bsze4
	 4rt06W2ubJgL0LPCnIa2gKxc0Op0FAI/zKGb7HrJ+ezZtGF1u/Gf6kCa7Fcop7fcllXpC
	 2uE0bnBET/IpDw/adb3dhoosCGzjS1s7S8w8GIu2lBpWXah9WGJwjV4hOiHbOzgYnqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685842;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Z8rRhNnnx7xvbNdHoowQ2dZg6MGm9QtwIQEbr+lOv9s=;
	b=37kw7cczNjTrjhp7KIAuIuf5RxqEP+DPbQVfwASJ7aFJa2t00t3kk1OU80Xe1vZHqrTF
	 HPPR7Ivj4IW3cK3GRfvrxm9J24fL8e9DzT1M80JUf4rlUdvdJNsxmtgwFZdZ8/d2ySwko
	 Rx/l9QDXHKtyVnzC5Zs4GX3/xa98heZviHPVDICThTA4UadBeR4kOz1/fNuaAXd/LiZiJ
	 cPqD4aKxT5DvNXNhqO2LKPwJvbFWh2pJX8Gvm0HSZOxxFF6TJN7odq3Q22XIWReImGAgU
	 7QFJjk6B/wMvNY/7ftEwVcbO1AZMeLkRUMGz6ZSB0B//RDzaQC/eEjKjx2TcDMbb9BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2OFedZF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F77B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2OFedZF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795685841;
	b=PsrsOISvKo/zA0ywbHBT9coDyDSk6U2Te4CT1Rn24uamV7lPw2mkhwTxIJn1pB3w4k6Z
	 BVPQQl3J9/bPyNnkFMBSdphgJV47RqAFbLi93sfEEB5PFzz9iCZ5MB9LTZz4pWq5Jze1y
	 EuG2eNMVUmg8x/XsagU5VVZIRcPRReAjcgbS87HnCDD/0LPd9SWLCNVk9m2ouUKQY38Z/
	 gY6P+Jp/KmyFwppwT4Kdrd+US5K+iPQqvy43mY5eqNxdymONBNrKE1YEV7/EgN6f7j3UP
	 3ZkwM35EhF17Xw7+2PGZZzDoZtB/5J1HT8KB4n2Fq5FS+uqk19bNzkfMX7/LqIa/8uQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795685841;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Z8rRhNnnx7xvbNdHoowQ2dZg6MGm9QtwIQEbr+lOv9s=;
	b=2EWPdG+vjlMvd+Kk7TAR+UfzKvVkDC+fF5Ddm0w/UwHAMoR5/+nEjPjGpBQh/YYBvGEP
	 IjmWajUmJjiW0cZMOjzXwkQWsXG1UU6s/X4uFKeHDDfUFDt7APp0jS40m1+eXMUs1pKAC
	 XrMIfj1xe2Vt/tfH5fVmLWfjpd+Co1AgGsYPHHXHf2RDUMTKO13N4073bczJRr613UXtx
	 AggInbWUWcPj8xl/qyqmmwu36j66F9OFv8d+QtnwGzQyjJOTh7BSiQlgVbSeve09FQi/N
	 DYXgCycGdAmeE+wHyzezvYJcvBXNlyPhp4uO9t/v8bVe63YjliYzSN4DAzY47CgDkew==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E5571F02EEF;
	Thu, 26 Nov 2026 09:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685841;
	bh=Z8rRhNnnx7xvbNdHoowQ2dZg6MGm9QtwIQEbr+lOv9s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=H2OFedZFBR5oIcn3zEmkkeaoNI6zW3bFqRxMB0Gfj56o+aby6PUeIjHtAG1fkWEON
	 dC5B3FujSx4HlK4YxtCLDb1Gb2BD3vlrNVcaS2IT/+jW6MQ+UwhB++cUOyJTPMNOUU
	 vG2bchD2oSGDJVsmxQbwnuU7CBI9+HGSA2uCSGSy4iSQIWKNlMG0q6sZSgVK7X+Urp
	 vynKYnwpnD+P7xIA+0DNdGUTcsxHjgpH3pcof0MyUXunIwQaYOeYGjizZsD+/YIgb9
	 G4uIQe2MRlAJe+8qlFyGqwOQPNqEgXs/+yrnzpR3frDcl3p1wd36DCR0ZaD1EhoZXv
	 lGtYAqqjGz1DA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8B3F34D378;
	Thu, 26 Nov 2026 09:36:47 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 09:36:46 +0000
Subject: [PATCH v4 03/17] drm/panfrost: Refuse to sync the CPU caches of a
 heap BO
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
Message-Id: <20261126-panfrost-long-jobs-v4-3-23579629ceca@gmail.com>
References: <20261126-panfrost-long-jobs-v4-0-23579629ceca@gmail.com>
In-Reply-To: <20261126-panfrost-long-jobs-v4-0-23579629ceca@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795685806; l=1145;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=RVUC7wk0C94NNPazliV5oYEit+c6cilShSIsrPrq+ds=;
 b=J2c7S7VrriP2OYrj52t+m0QkadiJXUD/uCTu8UocTChr31CK3isbSRNiyWCvP6LG+8FYs3mxT
 yvd0fsCkIzDBcn3UMba28ieo8mCa5yDCOc/S7PbzBoe6ewxmySaCfDb
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

On a coherent GPU, PANFROST_SYNC_BO on a heap BO dereferences the NULL
entries of its sparse page array. Heap BOs cannot be CPU-mapped:
return -EINVAL. Not tested on a coherent GPU.

Fixes: 7be45f548976 ("drm/panfrost: Add a PANFROST_SYNC_BO ioctl")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-206561@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
v4: shorter commit message.
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 518f24549..8067c5533 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -569,6 +569,9 @@ panfrost_gem_sync(struct drm_gem_object *obj, u32 type, u32 offset, u32 size)
 	if (drm_gem_is_imported(&shmem->base))
 		return -EINVAL;
 
+	if (bo->is_heap)
+		return -EINVAL;
+
 	switch (type) {
 	case PANFROST_BO_SYNC_CPU_CACHE_FLUSH:
 	case PANFROST_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE:

-- 
2.55.0


