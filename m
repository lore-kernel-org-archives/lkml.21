Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198233;
	b=UgSBgVZB7ogj4yRr1Rfd6XxFc0w5lT4pO2/iN15jAk3+cXyM+fE4QNFjq63xWa4IYUBH
	 Pt5J+OGpTxPof5hD9tiCbOVpVIEKSHjJjCRRBLBt6zwp6GX8eoCaflxmqMTFPgS2er2xx
	 TNCf1gb6NhdgSvpFqLsegBVgaNS25Floh6b4Zjy64FHtSmiviCYLBVjW4l4LnAKBRj2q4
	 Z2smZbZ7BxkoWwngPxxDF0bSI1Y3GK5UshCpx/TnVMUZu1/q+ur6v/zU/rJNuuuI1wSjh
	 V7y7crKObgI3d20YynBp4uc+iQr57wtMvzokYleHEqULNmUw28fInATBgGEkrcowBeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1U0puyPddAK/k0CBoSD8bUy1ngE3FQLTiHGb9GIY5PM=;
	b=vT0b6q5IbIhH53kbdjAgmos8u6u0asxmqEfEWiNpe74a1lJ9zGGMcuTjXq3wTCJlaOrZ
	 VydPY27sAt4U04A4Qo6Ek34XZJILnr5UoUP617b9njvkxYJsQlmh2n9tXNGvA3agGf1Jx
	 JPcW/uU44CKLiYuZOcbJx3bxIcsgkZ6ajMkpxbesjJGAX0pMgK92VwthuFw0azAHcKGFU
	 Q9da2UbC3OAne4XRqXaCodmLWCcDeChrYM04tvCmF5nqlnkpwJhhMo2pQ3I0f/NxG6w8f
	 PHyna/ABQ4+ez9mWSDq/KHfVvU0mknlJdQeGj17CqqjqgC9G1iQ4HPI/tpoyIcWFF8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VgTUh3EU;
	arc=none smtp.remote-ip=209.85.167.194
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE48860A2625
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE48860A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VgTUh3EU
Received: by mail-oi1-f194.google.com with SMTP id 5614622812f47-53dbe9b8d6eso932825b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795198224; x=1795803024; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1U0puyPddAK/k0CBoSD8bUy1ngE3FQLTiHGb9GIY5PM=;
        b=VgTUh3EUycmSbgOjP7Z0o8iKhKfaz/s16qBa2dIHG+6WIx00GZ7LlTEaQ0jHpVVmNi
         xNMv5Z+G410uoEoP4Sd2c1vBLgFGdX6q4vUWQGyIc5qLNe0c9RBtNtlcZPYVqwT5wngD
         NGm1zb38bpHlBGss6pFmB6LPxTg207bS6cbkL+oR68GGuMIhm46aSlWTlB6smlLBsJXY
         iUlOioaWJoxWh8d1x5DSI5tCsBbH/b3njKIY0bisxGMV+c0bsDGIROlQjIq5OJk394J9
         JwT8C95sYrnpmMnuhVtZQRVoDlACjp2zARu0qyY4unz8yQUVKwYNnjnYOskNbLxe+el2
         mOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198224; x=1795803024;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1U0puyPddAK/k0CBoSD8bUy1ngE3FQLTiHGb9GIY5PM=;
        b=tbylxFZXZ4PCRKfVZvXtieXm6OyOwFcCPo9WWg3YGd8YGDILMhDkqcFFm/MhCZrGYr
         1zxRGWMXDiUMlxIQpUUtE/kWS90km98L7kS2h83WWL44W81Zi94I12KfQzK881k7gkLE
         2kF2bkLP3SsXNx68QfROUanuw6O6GwgqLO2CZlrsiSqf6RXQEy3ea1vMwteX/7vXcf7a
         ulkr5MGt6Wu9ZPu6O9Au/Pn5WXEpXo8rmZV1vTvmnEJxez7YdJg2Vbf/cuLOlCqiKJma
         zg27OzZlQQq1g7QABLazLcx8BQY3eB39/NFMKh5VFthJ0bUN8yyRl5zl3ZKfGBwy5+qs
         HHDg==
X-Forwarded-Encrypted: i=1; AL+hErHNkTS15HQtQcSPA/1phSR78bYcXLlzLdkSuUIoLiwtQvK9qfW4DnpMt5n6dlrwQR6AfdTOFW/6yVyJ1qQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iKUDobzuwqt/lHc+w/Rmxvse1YlulZgljKVD8aFp4e6NH/Klz
	f5uq9skv6emYyF1Rtl8N9PJS0AOmTO3PGCflxCK4tb1w49cIBJrDf91SBWVUTr85yPKEUA==
X-Gm-Gg: AYBFou3KAegusCGn2j3JpEAwxQp+R19MymqNqUIFjGPdUkairl6Wl/rnjwirfTyxOrg
	fswHwPPiucYx6mlTZrHF4pUIt8jNpY7K75DAnUej/gYz6LAQvcom89j3Vm6d40XGxf4sxNA2JCf
	B2sB/sHAcCp1I98vKMoGk0eemqkZJsQR6LV9mbAd8qtMqH5rqsaoEDKKCLdfRJgOt96Vy9xiNnJ
	DcpzcO3BQeUXJgFG81zN8eSO080PY0UnZ9UZWHfSHXBjVzQrjozDiiTfO2SWbSQYqtpNOPVHXgz
	VSg2Z+V0FfmYvt9l9zJnwkIx6dDQnvLW1buOFdAGsOmcKQcrA9O4NNaUHEc9x+8M2OJgcMEeiV8
	8BAfj7XGFBmXRYS47K1Y+yD/lRhVeAAl+hOtxkxGVeyXiefCEhDT6tzRQcKGEBraArYVxE/YVJA
	Eh6eeoyASbCDsgLTmJNGVtU5Ycc4YQwbP4/Ws7qxEiKEG+PBABi7qSIS4zHwA/Sl8Nqi+LircWV
	sJq0jhAx2XSguyqptXfssXu6NNNkD9otv6415tw2KltKU/lxe8FSRcFePPaZ+cSHUwPyHP5RoXv
	KmuDBpazQ7GRRIb5LKCVrEsylraD1+12ec2rmsq8gkfJHRThWtgRWz9w181OKRtuYHfzogkQszt
	yHXI2f3mvNv6fTHJ5Nvnxk6Pwk4dU+olVTvqNh9hr
X-Received: by 2002:a05:6808:e85:b0:4dd:f8bb:e1bd with SMTP id 5614622812f47-5797bb9f526mr4100230b6e.13.1795198223670;
        Fri, 20 Nov 2026 10:10:23 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc6108104esm3310383fac.14.2026.11.20.10.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:10:23 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 12:10:21 -0600
Subject: [PATCH v2] drm/imagination: Fix the value of
 ROGUE_COMPUTE_FLAG_PREVENT_ALL_OVERLAP
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rbrue-suez-pvr-compute-overlap-flag-v2-1-ca2b0d3adb4e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/5XNQQ6CMBBA0as0s2aMRUVg5T0Mi2kZoAnQZgqNS
 ri7kRu4/Yv/NogsjiPUagPh5KLzM9QqzxTYgeae0bVQK8jPeaG1LlGMrIxx5Q+GJGj9FNaF0Se
 WkQJ2I/V4KaqbZTIVmQIyBUG4c69DeTaZgsHFxcv7QJP+1f/+SaNG4tJcS9L3tjOPfiI3nqyfo
 Nn3/Qt2kCcm1gAAAA==
X-Change-ID: 20261118-rbrue-suez-pvr-compute-overlap-flag-3695ceab9ab6
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Sarah Walker <sarah.walker@imgtec.com>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Brajesh Gupta <brajesh.gupta@imgtec.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795198222; l=2520;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=hzVweLQWGGnWgZbDJhzZq3hPf28CyuB7MpyqTw8FFOg=;
 b=0o+bvH90wEF2XntpIVzQMXCFEt6HJ+4fJF6Ul3mujWKykchEVKx1X1zs7uHyExO8r+821BE2Z
 RFvPMyQygIKBfuQBY6OLYOPkMuwCJmkXWEPYn76OFTtv4nUtE7S/NLq
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The firmware takes "prevent all overlap" from bit 1 of a compute
command's flags; bit 2 is FORCE_TPU_CLK. The kernel has used bit 2 since
the FWIF headers were added, so the firmware has never seen
DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_PREVENT_ALL_OVERLAP.

On a GX6250 (MT8173), a compute job overlapping fragment work from
another context hangs both data masters. With every compute job
submitted with bit 1 set, a test that hit the hang on every run no longer
does; with bit 2 set instead it still hangs.

Fixes: a26f067feac1 ("drm/imagination: Add FWIF headers")
Cc: stable@vger.kernel.org
Reviewed-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Found while chasing GPU hangs on an MT8173 tablet (GX6250, BVNC
4.40.2.51) under Mesa's PowerVR Vulkan driver: a compute job running
next to fragment work from another context hangs the GPU, and Mesa's
request to serialise compute never reached the firmware.

The value comes from Imagination's firmware interface as carried in
Mesa (src/imagination/vulkan/winsys/pvrsrvkm/fw-api/pvr_rogue_fwif.h:
PREVENT_ALL_OVERLAP 0x2, FORCE_TPU_CLK 0x4), and the board confirms it:
forcing bit 1 into every compute command stops the hangs, forcing bit 2
does not. The other compute, fragment and transfer flag values in
pvr_rogue_fwif_client.h match that header.

This patch was developed with the help of an LLM.
---
Changes in v2:
- Add r-b, and Cc stable (Brajesh)
- Link to v1: https://lore.kernel.org/r/20261118-rbrue-suez-pvr-compute-overlap-flag-v1-1-ae8b48a17dfb@gmail.com
---
 drivers/gpu/drm/imagination/pvr_rogue_fwif_client.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_rogue_fwif_client.h b/drivers/gpu/drm/imagination/pvr_rogue_fwif_client.h
index 6e224400083a..967e903bdca6 100644
--- a/drivers/gpu/drm/imagination/pvr_rogue_fwif_client.h
+++ b/drivers/gpu/drm/imagination/pvr_rogue_fwif_client.h
@@ -74,7 +74,7 @@
  * Flags supported by the compute DM command i.e. &struct rogue_fwif_cmd_compute.
  */
 
-#define ROGUE_COMPUTE_FLAG_PREVENT_ALL_OVERLAP BIT_MASK(2)
+#define ROGUE_COMPUTE_FLAG_PREVENT_ALL_OVERLAP BIT_MASK(1)
 /*!< Use single core in a multi core setup. */
 #define ROGUE_COMPUTE_FLAG_SINGLE_CORE BIT_MASK(5)
 

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261118-rbrue-suez-pvr-compute-overlap-flag-3695ceab9ab6

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

