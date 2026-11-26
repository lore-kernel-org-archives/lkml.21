Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685835;
	b=EUF+/mLMOzfg8Y9tsrGudi9kHlPnyXz+XsraaPh/eAzgltfZPm+ZrnEU4kRwLKcEzBND
	 ixjVdWe+jqP3sopDG36lKLi4Hfy7WSKvC0RYRdt1xLclu4eCkT2Luxrs5gkDO68m7P6FX
	 ws/j9nXC3SxWYmffuQN5evqsAgeOH7f0ALwE/UGr63QZRJh8ba9sU1wZpIzRtqqmtazUC
	 ltBCx9izVtm8aBtAK2aRVHo/2USDkiYWrG/eJL4f3pEPcBmqcd8g+mXWmtKJfMby7TZ9B
	 E+UrOnG6sHoR61a6p3Ysxp8H1JWwbWD1Hlap9rNIF3r4iJ84rarnqpsdRUjorOZrodQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685835;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Bek0tQOss9y058o3OZ6jwGk+0z4tO0g6QTI9DYa0+Vk=;
	b=Roiw3RlQz0CeyRK5FYnyENftNu4cM6/xQQOAgv1t9+KV7Y5uut3jXbVW0fMOwbBq3OUH
	 zduVTg/oIFWCIRHQZtPoimxzEbXF/csx1VUoTCA/TlJCD6XPaUlsrkKIQoflTAIfJcAUb
	 BRiOHCK/ys1Jkb/zAQnDIRtb+pw5NPn8cTu1ewmLdMmQkLVHJc/Qv1Atmh+O3N/fXny17
	 8imZFplJGG2fLDQ7vhKH2f5NeFPdl78QRj9X93rW6lA3TxI6ABgr0KnKSpyYy9HwtFPQt
	 8pV5TFHixwXBxZjJAYLWTJ7cXl5gcUpBK/R/B3lWk2W4sQUYtiPhuMa5yBpYKiJnO0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KgEiyHRz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1C3606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KgEiyHRz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795685834;
	b=1J8Si5t0E10XhHZcqgLl86GunqE5NYAVQzAtdIrRMSj53u6tfJiq6/+H4Mcbtsy72rs5
	 guIgCN3DB4uRfcRfN0l9LAtdtw0NyCWj9XZMKe+1Y4h2F56cA9awTVd4hQj8aaectdXFU
	 x8Y92616AKpX1ZkWC6WYLg4EQtOh6+TRvQ5/zyIis1tslQitBsXZptie6rF4r1aK2xwW5
	 yJjI01yqisCph1uXMecUKVkG7bsInXuBTlRZ6+3i4GgKzRRk+b/cNwZoIpdQLDvCkLrns
	 OAgDPjxlV5nF5eV7zLChPeBVyjOuUsbQcXdBfy118bN3OMephby68XMQ3ZG/vFdec7g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795685834;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Bek0tQOss9y058o3OZ6jwGk+0z4tO0g6QTI9DYa0+Vk=;
	b=XmVeQ3MG3w4mc9FwhIp7I49NbiMOpcP9FkKXYFztWyq5DFkShPQyu8VqOo69a74wp9ZM
	 SEklphu7whHd+jmDeBtm541gs0JMSBgTlzMhhBuytICn158Vc3H6KOxheQLXp92VhiskZ
	 plyo/R5vHjn9Wu5bZzjtrgHWxY3RYZ0PigOt78O7HYMLbWTh7Qi+nbQhkwoOasHCcr1EZ
	 gUOFvasNdorwAzpBzHvy5A9sC9qHdo+zKLDEnjU1kUwtInfO1c++X4aJU/mzR5l3bxAGY
	 zR5ci8nJnxJWIg2LO6ExEkGcq133z0GGxJwjtdhaoxF57aR7f7ST6p8u1dFEc72QlqA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D20DB1F02838;
	Thu, 26 Nov 2026 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685834;
	bh=Bek0tQOss9y058o3OZ6jwGk+0z4tO0g6QTI9DYa0+Vk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KgEiyHRzDIC93pRBrG7JcKt8gMM3a1nwmAKaND1wWLUSwfdw/CHBbtu7VfGc0zaPh
	 P154jRNOy1EiF3+uQQ+WhmX7YN4a5tRzkRycj5Eq4nLUUt7Vi/HfPh7gkcmT10+p+E
	 uoS8dQvz3xQ03p2ZDLgk7YbherYZ5S+N1sHvuXS/RvMFb8T3Tlwd3v2NHpgREu68qL
	 m1SC579Dtbsn03Lxf1ZW2v/U4/moGQTgfBj1A0b8kN5FFu8ey+mojb+cM7c+dJzAP3
	 epFca9hql8XU/9in1Yl8m8q2l1hy935Tm5+JIu4L8m8gxDEKfSHSqB2O+yucOWoMZu
	 TSL8WfNO2VK/g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4C0E74D373;
	Thu, 26 Nov 2026 09:36:47 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 09:36:44 +0000
Subject: [PATCH v4 01/17] drm/panfrost: Freeze the reset workqueue during
 system sleep
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
Message-Id: <20261126-panfrost-long-jobs-v4-1-23579629ceca@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795685806; l=1382;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=6c2Dpu03JGJeqBmpPCQQMuKsg5qJDVUkSb2yqZ0AwZ8=;
 b=kcxN7jyStNOcc+0ERAgPsFBQOcBb441MSYfRB7xv1nj7A4SOYGIzHgZWGnCgiMnfJyZ7ALQ5H
 V0YvcIVTlj3C7puqcE7Pss/PPS7n/+/8oBP2Xdsmi034hh0QWny1NjP
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

pm_runtime_force_suspend() can power the GPU off under the timeout
handler or the reset work. Make their workqueue freezable.

Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-210830@kernel.org/
Closes: https://sashiko.dev/#/patchset/20261113-panfrost-long-jobs-v3-0-80ae78d38f6e@gmail.com?part=13
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
v4: new (Sashiko on v3 01/14 and 13/14). Tested with s2idle entered in
a test-only 8 s hold in both: before, the GPU was runtime suspended
inside panfrost_reset(); after, the freezer waited for the work.
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 6a604b5da..79b302fef 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -893,7 +893,7 @@ int panfrost_jm_init(struct panfrost_device *pfdev)
 		return ret;
 	}
 
-	pfdev->reset.wq = alloc_ordered_workqueue("panfrost-reset", 0);
+	pfdev->reset.wq = alloc_ordered_workqueue("panfrost-reset", WQ_FREEZABLE);
 	if (!pfdev->reset.wq)
 		return -ENOMEM;
 	args.timeout_wq = pfdev->reset.wq;

-- 
2.55.0


