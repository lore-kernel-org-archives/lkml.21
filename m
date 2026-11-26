Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689435;
	b=D4DZw7krDoBFeI3ao02PBr3W1AVF9d3bqtweAO8Re1smjotCL1lilzpF7mPxgVyhRel/
	 pEwlNNJYA4hm/gPrx/KSbDrtjrNwoRoKRPlbUAcW5FU1iI63omdzHESZASUIzsFOlFVpi
	 RukUnA6YhtrFo0Mc5y3p33aPFDHL0AY32bw//zVcr/QLFs7u8jQWNzBH1iXp4F9A7GXfk
	 PitF/AqwdWUPPIZbbGblD2lkPAtB7g0NA5+WqC4y6OdMaXsv0JEig647vA21Ew7h+nCF9
	 lsWX6faS6K9ucrhQD1RJ64iTiMxUpUKrb3r0NSJ8cTtFZ2lCfebvE9CUzZkW0IDQWxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M/yk3Rw+nb4AIlTzNbRnpuuYhSg7gPe5Ia3PULum9P8=;
	b=R3W/CyBetaRg21Isz/sE/ifIpy0UjuDn7gh1YttbqlfV7Aj9DcYk4GtAVY1nOr1qQFOY
	 FHep6n/Au8kNE1OqurIaZlQ87SYGteK5m4JTdh39bvY6JPlXQhRKYz+bTk3U0f9QnhQhS
	 FAnTqaylj0IbTcFUmwI4Zk9BWOHpv3FbUZwKQfTyKEs4sc9n108X+DblwnmEGQ3zLh9W1
	 pZxmlnwlv/jwVCkW81yS+Ye6yL3V5nUH3FLO3EU6FjU7pZmAV1WIroVC23h7dVMUib+LM
	 4w1OFGiBGH6DYQ37g1+y8aowrynAz29A/QOGi7V1uZ3AlEb/S1GdKtWOP+LZ9WTQhxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=poNQxyoL;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDB4606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BDB4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=poNQxyoL
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso4139503a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795689434; x=1796294234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/yk3Rw+nb4AIlTzNbRnpuuYhSg7gPe5Ia3PULum9P8=;
        b=poNQxyoLgEX9cA8pzqzrbM6j4tqgsUIErZUoKoIruV1vh7zCgWYMgw6u01Q59YZZDN
         6PuRqZRzqvwebGiM/xPkAyuxhM0UvQOYCp/XnI+hzZFVZFk8hwb0JLsA0dhPE2igUqCT
         /L43iHfD1YbeIfxaS0W8BhKSyy0xqRKqlHOV+r26WXNtS75IwNg80HTSOsvkFPjeSQlS
         3GTQaCOJAfVCr4atahXzU9T29AdQM4v+PqV58lEQ239Fhp4uEzqh9ZiqwN8LAIkx6YA9
         GXVBGCbjkxr3Lyio6mf8VtWSx4tCcIdM505DXDPSHBXp4tG5xjMVUlVT/PWDmz3X1x8H
         yszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689434; x=1796294234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/yk3Rw+nb4AIlTzNbRnpuuYhSg7gPe5Ia3PULum9P8=;
        b=cWoI+E+JadQQFSiDHS0A1QqX/4cpxGMI3nTIvewteE46Fe9f3ZW7InssV82kZhuNhr
         egmSrEFB6kXmOwtSGgD48IA6Pfy4ooaBCIHaLUYF3mVC2lcSJQhFTKygm538nhelXi45
         0mgHJ6keO+Zlf8aMzQSEzFT3WtJKQVF34fERxETG6UXild2ECFoKJkurwGBMaIemYQY6
         eS1JpeMKyRHLKRv3Cv6+Ws/bL8kj5aecGgQlMk6WQlWPfN7j5yEGv9KX3ibCOq4zJe9J
         2CwZTRgFrLEohiGYF7vIB8x78WfzQvycQLwjyMwXGX6k/H99+E6oM4ne5asQ6F43FRdE
         Bptw==
X-Forwarded-Encrypted: i=1; AL+hErGZstBXb62vzDqgNVO7cjEA9YT81/Vtql+fL8nPgF0AG8Z29DL0rKlY6F7yyiApFioqwuVKFrmv5I8Tn/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yg7fxETeyyq1+/HgDtOq06AORJ41xJPf29+hGKGrESavdRGNm
	HQJqFV+x2RlWRb3lRKASVtXWMVdmziNNJ1Yd51KJk+lV+0iabzK2CjXmTgXekqSn
X-Gm-Gg: AZFdTZe5AYD0N4R2MaJN2LpwZXSx8iwca4v3fLQ2HA1FlB3CGr4aDRMkOt07o4HnHkF
	ytLXvOGDs71yd2mviJ5dy46hPdfNTYdD4M1uE9V2J62qFK7xDxZJflLDr77YVN5ApcFEfMgB3YH
	2YfyDqN3Vai2SVevdDFATyuN9HRjbbGKPJlmWFcLrNJEb8s8SPmh663EaKgsqnJZelueyvwqR77
	s3tsgvaqYFyqRf8Cc+9zeh+9CXd7VtGlLvnwbrv/luPdG57aD3JwngcJgCkjnii8n7LqtABXp4n
	uxd83pmFgxFuDSsIDNcmP0AKm/J7suZ3NhVEIDY/DvurabdKnMP5j5L06cM9u94yb4lCK+GvbEd
	e3fBnMN1MrYOxeBAd61MkOSrDn17wphIbfL8D/BGzdpdAC660kffZYXjpfNG+Kr0W26hkkhjT67
	XdW4WeJbykQpLZTOMZ77qKe8x7EdIAtak1IwJgBmEbkgYPlBLONdrGYk929T61MF01jaqqZgRYQ
	59qLmJDBuhCgscdFGaDXQjsFxocPzBTb6whQewT3oILGEsJx9L1KvVIaL53K0erWP6IBJPZmpkP
	F+o20xGOyG2y6rCJTxiNLHfaqnUDEIoR/SdpiNBglwMHoL0Je875Y1TyPexsns2Tasnfy/zWlV7
	JlO3EhyDv4N7pKIbpJ4EuvFuyOkCyays=
X-Received: by 2002:a17:90b:4983:b0:3b4:1357:d529 with SMTP id 98e67ed59e1d1-3b41c97c444mr20610837a91.51.1795689434219;
        Thu, 26 Nov 2026 02:37:14 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-226-201-204.dynamic-ip.hinet.net. [36.226.201.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d135e9sm34846229a91.4.2026.11.26.02.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:37:13 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Roy <rongh7426@gmail.com>
Subject: [PATCH] drm/vc4: plane: Don't log LBM and UPM allocation failures as errors
Date: Thu, 26 Nov 2026 18:37:09 +0800
Message-ID: <20261126103709.655707-1-rongh7426@gmail.com>
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

vc4_plane_allocate_lbm() and vc6_plane_allocate_upm() run from the
plane's atomic_check. When the line buffer memory or the BCM2712's
unified pixel memory can't fit a new state, they return -ENOSPC, which
is the expected way to reject a configuration that needs more of a
limited resource than is free. They also print it with drm_err().

That lets the DRM master fill the kernel log with error messages just
by testing configurations with DRM_MODE_ATOMIC_TEST_ONLY, as a
compositor or an igt test probing plane limits does. On a Raspberry
Pi 5, 1000 TEST_ONLY commits of 18 full-screen planes add 1000
"*ERROR* Failed to allocate UPM entry: -28" records, and the same with
the planes upscaled 2x adds 1000 "Failed to allocate LBM entry: -28"
records.

Use drm_dbg_kms() for both, as is already done for running out of UPM
handles in the same function. The messages are still there with
drm.debug=0x04.

Tested on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39, with this
change applied to its vc4 driver), counting /dev/kmsg records around
1000 TEST_ONLY commits that fail with -ENOSPC:
- UPM: 1000 records before, 0 after
- LBM: 1000 records before, 0 after
- with drm.debug=0x04, both messages are printed from
  vc4_plane_atomic_check

This change and its description were written with the help of an AI
coding assistant (Claude); the testing above was done on real
hardware.

Signed-off-by: Roy <rongh7426@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 20c9fc9..81df567 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -958,7 +958,7 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 		spin_unlock_irqrestore(&vc4->hvs->mm_lock, irqflags);
 
 		if (ret) {
-			drm_err(drm, "Failed to allocate LBM entry: %d\n", ret);
+			drm_dbg_kms(drm, "Failed to allocate LBM entry: %d\n", ret);
 			return ret;
 		}
 	} else {
@@ -1028,7 +1028,7 @@ static int vc6_plane_allocate_upm(struct drm_plane_state *state)
 							 0, 0);
 			spin_unlock_irqrestore(&hvs->mm_lock, irqflags);
 			if (ret) {
-				drm_err(drm, "Failed to allocate UPM entry: %d\n", ret);
+				drm_dbg_kms(drm, "Failed to allocate UPM entry: %d\n", ret);
 				refcount_set(&refcount->refcount, 0);
 				ida_free(&hvs->upm_handles, upm_handle);
 				vc4_state->upm_handle[i] = 0;
-- 
2.51.1.windows.1

