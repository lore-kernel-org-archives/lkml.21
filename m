Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795287921;
	b=Ao55OMwDxTGcRh6ECrdnjzI7vEIbrGN/gIn6WEV4EO4+Udp2ql41lpo12P1kRvQsquEu
	 /hEHEsUdx3iJM6T13/1TbO07C3O3BtEg8S0pH019GhsCxvoGioj9mzfy8apkwwDLtFCHo
	 AHFnefx6FLPGHODvsS9VdFmVCIIrOX+JksTyfrTdHS7Y5Y2lp6jhWgCPn9pQKmK6S6KwZ
	 z4xpppDXxrZR4z7AU16H6vpfIaoxuyrI6NhXPIxHlLYqqaD1d6LLn9uyj1y34AePVqvIY
	 8juw5Y9n17anTh/o9oDE47sh3z6t5wyy6g2KQW42snEa8pror7mOf/LmscXfCazxA2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287921;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gFdpcHGX3wO4L3lzPGqtUvwZbaMQ0FLlfOj30IvG9Rc=;
	b=KfAxzDw9V1FcKKrGuxCwFnNXqzetCFZNOpr4C0+i2IbxFb1ud48+W9U29/F9gn1InCFn
	 DCB3kANhy9WZhVjPBaisNjKkBUNTMHX1CDeMI38A2yYNo5yQ+62Eh+Xqxky44PWa4FlKf
	 jWbpSwrowz1fYd4YEjRNWdRAwW19u3AKf0gqMQLhUYyNQ7QZSuO5TTCPegY0ge4MqX5GQ
	 EQPWvhdXbl+UMyt6jUbVORrYcs3BlSXNGqjWljPnwrcpMycTfzjmuH8oMIjAWV8TiEvBx
	 4Y4X50qbvCshNLg5A154jOq+UltSKadeES+cmRtaGMbLp9q2lZfIknDEN3McS/hunpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2UGLRaA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64AC606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2UGLRaA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795287921;
	b=Ug00dmNEfsejWWHabICnqB0v2hGnaTcREKeOOPeQTfvc2NTpORem32myhTzxDlSlBRlK
	 RWVO4J6Udt662dBGuTIYiU5+paE/xL1FNMl7V11OuLTa1jnqUsjnJIIN4VUkZqMwSWwPY
	 1q+K9MwJfUNRDeVn9ciaC3O+n1tI6dnNE7I8Q6wpYSZymqMQ2y7N8lv047gtZpjvYP3T5
	 w4HyZ3NF3RnI3qJaUegCF4PyA8HYpcLKR7xXaJWA+27sdgegMxcFPi3WhTfYUgYYk2nig
	 CfqHc80Ljzi6f/2KoHI+2Bl4pNRfhwmCYCFQOiLdCs0b9bx1SgpTDtazUnkDPWOIv6Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795287921;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gFdpcHGX3wO4L3lzPGqtUvwZbaMQ0FLlfOj30IvG9Rc=;
	b=CyV5IRrp+0rsHPGm/ZNisqUsvtqX6Fg2L8ji1bECkMnxz56OF4z3aKBiJ5ZQXrQsnuwc
	 I+y0neuOBiZeEKQ+0RtkpQH5KkvZy2E3kg7vYZFXopOfPFcd9uVsORHBqSieVLg/Oziru
	 YIf4ltN6EVv01sNNd72oL5jjQTQL+sBuPS29kQb5N7uyjuWpwAZAqJ0CKrkcDWBxtdbNd
	 Y8U/cIv4tsFGT4KSaVPwZmThs9k9JkJiH0Mz0VATkw3Q+cRVczlUAPQ/x83l62JfIIeLQ
	 xA1PYVX1QOX1Zyrh+hHVYrt4D8XVvOdBWa2g3JIadrqMUdFL9M3ltqxtGm+HMfwduJQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D435A1F000C4;
	Sat, 21 Nov 2026 19:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795287921;
	bh=gFdpcHGX3wO4L3lzPGqtUvwZbaMQ0FLlfOj30IvG9Rc=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=T2UGLRaAGpW6f/LUr9krhI2jg17QH3TG4usqslRYn/LOZUD6b5TPD+2I7LlF0N/hN
	 sMfvPB8tuoSxsx/Zo7ZH0lEQzg7qkjrtWXwQHjIp/UTfOLhapnwMqsqyej5/Tfi6c+
	 XbOIVwnQGPDvvEz7G4o2RSs5TyYLyKbULuLTO/9a+Uj5FUSiOLtEn2KexXh4h5d9yb
	 FAe8rxOwypp7Q6MrMWFfql1TjbdQzX7NYGZKhh937BpPvvPOotj1ri4IhiBSPy+Ul8
	 We11mGsYHZmlbr9bPJUONryc7tlyUolmDUQgLzwJTvjU2YUtLOElQ4J8tYM6QsDv/t
	 4YNUnDVf6sXwQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 31DD84BD56;
	Sat, 21 Nov 2026 19:05:20 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 19:05:20 +0000
Subject: [PATCH] drm/panfrost: Unmask the interrupts of a re-enabled
 address space
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
Message-Id: <20261121-panfrost-mmu-as-mask-v1-1-13ffb84d5562@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDtggm1Jr1K6mOhEpyVRMiqCe
 HfTdvkW/++gnIUVHtUOmVdRGVOBuVTQDpR6RumKwdb2Zow1OFEKedQZY1yQFCPpB8OV755q5xr
 voKRT5iDbb/t8/a2Lf3M7f19wHCddOqdMeAAAAA==
X-Change-ID: 20261121-panfrost-mmu-as-mask-f5e7ba0994b9
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795287919; l=1936;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=K0pQ9F7/VC+mXmqa5mrb5ZLu5JBV43cmtWNL0qBRLk8=;
 b=UTi0Pl9F3glZ6ZBQdexj6k4QpYeIH3xdTWKCxQwZRzr2XU/a/JTVxlvc7B02k0uyoGWKrATcT
 g+FcGFgPdCNDTEHA+NQjKMyEW6LFejD0V9/42nHHqn7aCUM0ZctiwOG
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Sashiko reported this in a review of an unrelated patch.

After an unhandled fault the AS is in as_faulty_mask and its interrupts
are masked. panfrost_mmu_as_get() re-enables the AS but writes
MMU_INT_MASK before it clears the AS from as_faulty_mask, so the
interrupts stay masked and the next fault on the AS hangs the job until
the scheduler timeout. Clear the bit first.

Fixes: ed7a34c57def ("drm/panfrost: Disable the AS on unhandled page faults")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260811215454.A1C8D1F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Tested on a Mali-G31 (H616), 7.3.5 with 8a597d099b8b and e9672bf9382f:
a heap fault after an unhandled fault got no MMU interrupt and the job
timed out; with this patch as the only change it is handled at once.

Claude (Anthropic) wrote the patch and the commit message; I reviewed
them and tested as above.
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index faa62643c..98d52aca4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -283,9 +283,9 @@ int panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
 			 * disabled. We need to re-enable the MMU after
 			 * clearing+unmasking the AS interrupts.
 			 */
+			pfdev->as_faulty_mask &= ~mask;
 			mmu_write(pfdev, MMU_INT_CLEAR, mask);
 			mmu_write(pfdev, MMU_INT_MASK, ~pfdev->as_faulty_mask);
-			pfdev->as_faulty_mask &= ~mask;
 			panfrost_mmu_enable(pfdev, mmu);
 		}
 

---
base-commit: c408466a4dfaee4b12587e926c5b85e68c8b3c40
change-id: 20261121-panfrost-mmu-as-mask-f5e7ba0994b9

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


