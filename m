Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175959;
	b=MFFkjnBHzzAqNZZEhjVmlYez2L4R7w9nQhwOWnWud6n6d6RqeHXPTcnINyJ2aRSqdqyF
	 oEVQ1cSxDH9eHCBKcAfROWk04kcgnGui01EV5yEJIt3GQ3NaHIMZHpdDVNrc1AsNxDDYL
	 Wo6M4U3QXwukFSpWbjcDs2wg0w+XgtsCH+8lVNDVyLwtE+SomsRrvaPw7/2g458OGj3IS
	 87Pxv46l3ytZ9RaxX4fdfX9c7e6A3Z9qZ1D9ZD8WBu2b1eTLceJ0BAKNHGmg9s43ASeXS
	 APNKMhR7NHraX5cFtFDcECMIlN9B6ydltdZwCi7Q4Lev00QInc22WzuJKaAfuH8XM9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S6IS/mU9CGQB+CxcqZArg7eMwtn8KJF1AGNkVI6J8eA=;
	b=2Ta+LvTDqJjKkhTgn8b0gMh7CWZtbWd54ZZYxM6oj2sLwilhipgSXTul+uQGHu4iYada
	 /wRonn28FeVRo2YUH6Rbblv2dq2N+rcKT/KPEqCtS6Q9Efs5NIC5lWA7Gp19Rh96U40ZC
	 ZRBKNR85rsh+BC5UDz90hgiU4XSh27+9TqdL7MPT+EbpYHUExWklzm1oT2veEJUu8ouU6
	 mDJb+AR9llgX/pylE57ipdEmyPxR2KBOw06V4JirNeZYH/DFwxOI/Cwb2rjmH2yhCEKmo
	 ZwRmULfsCqYkAqpeIC0MSM4e7Aew/C2GszdT3TzySK59fAdO+CffEMUimh08aE24gEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LeYD9kP3;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9C2606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D9C2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LeYD9kP3
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cddac941ed1so335701a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795175957; x=1795780757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6IS/mU9CGQB+CxcqZArg7eMwtn8KJF1AGNkVI6J8eA=;
        b=LeYD9kP3LEkPFodkTZtvjQYkemxgiuqkO0RIBQ6B6V4n7J9B8Ar3paQvjquel/w2rD
         bx7HN2K9tJFqK0nYnC2e9vly4Tl98pmxNmDNCz/CrZ9pCZAYlwM5Yd2Dia22kaG00+Q/
         rfZVgbFkxHz0S0kZS3f048oEHHCEog+LauqiLE7eV9ZxA6tjI/od2i1Ihz2ISt5YGLcO
         G7CjbtpABjFtoGy+GejsInpDrIlbCojwLFlcUbV05rfCV0RdVWrv7lXMfCxYFPm9/G9w
         OsmnIXLrHEMGxEipj05BrJCa4nDWIRAMMwsE/NgO9+cnh9VwMxCVCpczlBFxm+4pZ2be
         7OdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175957; x=1795780757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6IS/mU9CGQB+CxcqZArg7eMwtn8KJF1AGNkVI6J8eA=;
        b=ZZRPZtMI8hjzrBWJhxl4ieBdTdEnhz4t/Pesm7iFhVb6u+fd153ZLQXQZAo/WoY287
         4oI9KddKHe1zo9/1KLgGj9wSUMBai2Bj3r6ThHLr/qs1a+UhfGJa7dflz4lwpjrU+vG/
         FcR5KGdWUJRl44uixyeOUuhuxdhfb44YNRnJBwUKo8qIMhEYP9Hh4Lc31xtvkZ7Ep6U6
         eCwdGb0a8t0RyRlC2lIeqv9goH6K0volJ6Hi1sJZ5ZNUG9bRIMeuxV8oVAyKZToGvse7
         ey7e2Cgtyot11zxXnWRegZkj2N+AiKn+zVBSCMp7yt1G/DjpYf1+TWf40O0FGBlxFavM
         zEew==
X-Forwarded-Encrypted: i=1; AL+hErHh5plswbSpNys5pYUK4FOM2lYtk6OXS2C0WF6FiQZDl7nQJAxFAWbfKTs9xoCQistESN9VVkRJkd16H8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z//6xkytipg3tnjre2HcCc62ou7mWJQPqX3lL/kel9cieZxoNgg
	JgIMbwTHY5oNT0wKPS253wFwjLF1eOjfz4HnZZrH6Za9wT4ErERhznd2oLFMFy9hNbw=
X-Gm-Gg: AZFdTZerDCycbGzbYmcA4KRmzlJ2E8oSgtp4IwKpKJeRDeiU/WCpvdyz1DceTx3Dy07
	KfCSrx6vymi70WrVL0LJCvuhZqqYDvd5iODGAX5LU2nUxUTRvmpo7D/68gMSrxLjOjmHtstCJvN
	Fc9em2V1ZyX7BaK+7SPehlN3dhJ5YEK5EIHeMMZK6RaQ6OvWcuDV2Te7ciJXZpBmyx9btS2AyVD
	Z8uv/lhCdE4GhhX8mmcS/SwqANWlRi3Gjf/lj2Csqecs9THD2/71R/IuHlLKnw21854vCrmmMFG
	U61hVpi3h0hui7FSIEAI6wlvLAOfbdaq0sEu3TgPxl8/vgyxVuMP3YZ2mjVlQghfisbSQPnS29g
	ZIjA/1GIEdHexzql1wL1bXX6Dak0auXR6Faof5gjswjNdrMMt5R1ZEEf9HVoJfScImxPMGIdlIK
	5e8pMLOuh6FxuBzTD8W6DfcHRug0q5wQkULdsnxk1MciNYUu+Gkpw01diDWQC1CdktQMey1jcd8
	j6hRcy3A+C/cUa/P+MnomSnY8DO+i/pBmDgpyn5clAgNz//E5ZSUpKM2qCp46qz33PL9DPuVVYS
	Y67RZwYAOOxyoz9CQ+bdjWXPlnUVEM6NZQVDX8qr8N1LC17YtdNr9hBdWn2idsuzBwaPvlTjwMH
	v0Ap4rsCx0g==
X-Received: by 2002:a17:90b:2cce:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b41c909001mr2615121a91.21.1795175957247;
        Fri, 20 Nov 2026 03:59:17 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-226-249-217.dynamic-ip.hinet.net. [36.226.249.217])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0575d9sm1226566a12.25.2026.11.20.03.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:59:16 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: mwen@igalia.com,
	mcanal@igalia.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Roy <rongh7426@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/v3d: Don't free the core's sg_table when PRIME import fails
Date: Fri, 20 Nov 2026 19:58:40 +0800
Message-ID: <20261120115840.417741-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
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

When v3d_bo_create_finish() fails in v3d_prime_import_sg_table(), for
example with -ENOSPC because the V3D address space is full, the object
is freed with drm_gem_shmem_free(). At that point obj->import_attach is
not set yet, since drm_gem_prime_import_dev() only sets it after the
driver callback returns. drm_gem_shmem_release() therefore takes the
non-imported path and treats shmem->sgt as its own: it unmaps it with
the V3D device, calls sg_free_table() and kfree()s it.

That sg_table belongs to drm_gem_prime_import_dev(), which then unmaps
it again through dma_buf_unmap_attachment_unlocked() on its fail_unmap
path. The exporter's unmap runs on the freed table, and the kernel
crashes:

  Unable to handle kernel NULL pointer dereference at virtual address 000000000000001c
  pc : dma_direct_unmap_sg+0x84/0x260
  lr : dma_unmap_sg_attrs+0x60/0x148
  Call trace:
   dma_direct_unmap_sg+0x84/0x260 (P)
   dma_unmap_sg_attrs+0x60/0x148
   drm_gem_unmap_dma_buf+0x38/0x68 [drm]
   dma_buf_unmap_attachment+0x3c/0xa0
   dma_buf_unmap_attachment_unlocked+0x58/0x98
   drm_gem_prime_import_dev+0x1a0/0x1e0 [drm]
   drm_gem_prime_fd_to_handle+0x1a8/0x280 [drm]
   drm_prime_fd_to_handle_ioctl+0x40/0x58 [drm]

Users have hit this on Raspberry Pi 5 with Xorg importing vc4 buffers
into v3d.

Clear shmem->sgt before freeing the object, so that only the PRIME core
unmaps it.

Tested on a Raspberry Pi 5 running 6.18.39 with a small program that
exports a vc4 dumb buffer, fills the V3D address space with BOs until
creation fails with -ENOSPC, then imports the dma-buf into v3d. Without
this patch the import oopses as above. With it, the import fails
cleanly with -ENOSPC (60 runs), BO stats stay at zero, and imports
succeed again once BOs are freed. The fix was tested as an out-of-tree
v3d module built against 6.18.39; this tree was not built for arm64.

The bug was found and the fix written with the help of an AI coding
assistant (Claude); I reproduced and tested it on hardware and reviewed
the change.

Fixes: 40609d4820b2 ("drm/v3d: Use the new shmem helpers to reduce driver boilerplate.")
Cc: stable@vger.kernel.org
Link: https://github.com/raspberrypi/linux/issues/7504
Signed-off-by: Roy <rongh7426@gmail.com>
---
 drivers/gpu/drm/v3d/v3d_bo.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index db95a2f..d0b672d 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -185,6 +185,13 @@ v3d_prime_import_sg_table(struct drm_device *dev,
 
 	ret = v3d_bo_create_finish(obj);
 	if (ret) {
+		/*
+		 * The sg_table still belongs to drm_gem_prime_import_dev(),
+		 * which unmaps it when we return an error. import_attach is
+		 * not set yet, so drm_gem_shmem_free() would otherwise unmap
+		 * and free it as if it were ours.
+		 */
+		to_v3d_bo(obj)->base.sgt = NULL;
 		drm_gem_shmem_free(&to_v3d_bo(obj)->base);
 		return ERR_PTR(ret);
 	}
-- 
2.51.1.windows.1

