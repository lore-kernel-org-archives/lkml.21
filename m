Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022397;
	b=cOMIsbyTObUeY1xz16spXI+qLnm0VeZ9Wk2Eev5JJeWFVqBzM5B1TcoJNBue7UnfhsDG
	 b8aZ7W9fAUGTr2j5Fs7ZfJKxh2B78cNYY2o0XDPr4xKCzLVNKsOfRDL2NyVqpJ5YZ4L9j
	 DO8P5QXHIQfJVGjvDBIke7KEGw5CDGu7gZGnELEYcEaLFiiEx1RD2IdzpdC5Bvx7I4lcA
	 9ulO2jc+8QfvSPyRo6zIDSRP2CFUy73ggk/VsndoLQBWCG8QoVSAELWSp8BcrRG2KRevE
	 bia2ikqSlHyQDDxBlllFkLegDihvhO0zBf1QmXco3xTD3KykI/kdxzT2SWCOgGNe5NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=O2dV0dR6P4vtfkdK4//qQQNUz+8h8vIYbdZZXYxh3Lc=;
	b=34zjhhxd39UDg8R77FfKGmCzPvun/CCRi4/xVXnzEteyU/ygyd6AcHxiyChANYkVZQLo
	 eOCFjQ9AtggFUmkbdUVxNmlpnuxDClNUHb81ln6IUiE4QV6dNxvMXKRW0aAWVlbSdyfZe
	 uyStB+fVdB/jRpZ76kbLqB7JdJZdepvXRwbazYo+VUvQJ2gRqxgs5jdLfbU7ORYdkft+G
	 qFjh8n24N9d/3yFs58bYoRYBSDgpuC8oL+9/3AHTPl4qfQGf9Os4ms8DjeXSNDtewPaFX
	 wWRMFx3qQMlCJMbwanNX8Z/2VcZrUlUs0yWxGB2PR2dXf2Y7ELpRzhoAZeOm447NQ/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixV+8uic;
	arc=none smtp.remote-ip=74.125.231.198
Received: from mail-oi2-f6.google.com (mail-oi2-f6.google.com [74.125.231.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A34606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A34606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixV+8uic
Received: by mail-oi2-f6.google.com with SMTP id 5614622812f47-545a4fb8d5dso322377b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795022396; x=1795627196; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O2dV0dR6P4vtfkdK4//qQQNUz+8h8vIYbdZZXYxh3Lc=;
        b=ixV+8uicyJzDcg+HUO2Cotsah3awuuEt6zbsJjI5ejFSdY/4OTCwN/h3zLUyWegLqN
         L18vRCIuipgwuG1qzcLaiVXR8JhCdgG0+PikQnJI5rn0mUta6jTjq9vqu0smUW3jFPWU
         TkvYbHp+T9cUvDjR90IDjc9QLQLYJ282KYfP4uscgJnovyGDfdlSeTjL+fMp5aih5nn+
         8lCgnq9eMRS9miBhvI/qYkkfKwRiA0enUE/w19XVSS29F8i7OgXtmQND1kKS4+gZEbll
         vaUhJoRPAKD4m2DdlROHYwuQYyAIBHCpwKBQ7Q0ZKiUpBWx3dOqqD8UBNlvedzZGoZgy
         yFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022396; x=1795627196;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=O2dV0dR6P4vtfkdK4//qQQNUz+8h8vIYbdZZXYxh3Lc=;
        b=OUEup+Ve9Q3wJNbqGkdc16VSilKb9i348g6VVMtwsc2FhanSLZsSfR5OxzZQs1yzqX
         I22The8reLimV+qJzno7jrDV4DynCbm67pGhn/T060iwMR0q8WK8/v8TCNHdqUcXLno7
         ql9dqUd/SKe2mV2rTUPvz6yHTsNZpOgkbJvvUZArNAKCEeylqLxR+mPy5VE1rErwKiX/
         0bLzSSv3VXdJ5uOjbKirS31hccTqB0FGngOQEZ7+7YUIealkwbeEuH6dRp/y4qVmDjZZ
         KwgJgychOV4JAkEVSRFqcD7EyzhOfJezobO0n3XO414y1IGgozOm3XLFWXEQJZLs2j1i
         Mu8w==
X-Forwarded-Encrypted: i=1; AL+hErGNFZra3ecQFUCVDTtSLfBih+Ab7kPs9Kd1ACxospljBgQYczv3GyU7hNZqN/0uSzhnt/Fh0SNb/AUdXlY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/apuFE5p+KbkBY+UmLtBVy7sXNDbD2F5j2pVTDLq4bg6yDR/6Z
	4wUMDnhOOplcWtYor7DFjWDKZ+E5Mv4ZwNFF/tPG1pa1IFUrIUNHUkCp
X-Gm-Gg: AYBFou25ABtVOlWKuT3NJrTp1XL3fySMhEtpDrK9md+ji2mVRq8kBdSLDhmBYio/I5N
	aaLZY4PlPxKYN5LSIwtmJQiyRRhQ6nNLrPb4mTJ+Y13vay6/9LQvTdxzkF9LzCOTnOgKspTiHPX
	jjw9MU+Sr1j8Rf9SXVHURmGj4hbRPZ+xAx08mXuzvtmcFG3dFjUETev3imFrNgMFZTUMf1X8SAe
	3C2yOVE1RyBMurEe4ZdF1hv8ZAuxpbeFh7JPYp4+HTtZWHhHtQaBH0EB/GeF4E4byN050A7K1xC
	wu+PLxgJVSgYQ5uBP4MHnQ94EpOEHE0ZDICc3CmjzaxNvocQSNR00TzpoUHOQxqH2rCPWHhHXfh
	P1IWLkHDOaGTIYqFg7kWqj2lqbDX0Dg+ConjwmiFLURp/XeKcCOLo1LXuOQASHC1E/RX+P4zk7/
	SDrMys0JaO0QK/qQj6VeXQ3P/uu9hYHAOjGVG6eCo1QKmeF8BxqJW3gxVcoiVs1DT89EGO54IzY
	zKJYnHTdMjOyyL4NxtgsktXjPpubVlXG7TLnNKWjMruN50DMT4BJMjCtfS4pLvOkME0O/VslMUQ
	bR17gELBGRSvBFEoM/6A2cx608VrM03QMiuMag+7mZqqJNXO6aMNlGkkJbBEAnlQSg2snE82zkM
	3vJMuEmJ7nGwJcr5GkXQ=
X-Received: by 2002:a05:6808:150e:b0:53b:11c7:2da0 with SMTP id 5614622812f47-5773c0286e4mr3393933b6e.21.1795022396284;
        Wed, 18 Nov 2026 09:19:56 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b744313514sm3043034fac.9.2026.11.18.09.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:19:55 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 18 Nov 2026 11:19:53 -0600
Subject: [PATCH] drm/imagination: Fix the value of
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
Message-Id: <20261118-rbrue-suez-pvr-compute-overlap-flag-v1-1-ae8b48a17dfb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NUQrCMAwA0KuEfC9gJxbXq4gfac1mYK4ltUUcu
 7vgu8DbsYqpVAywo0nXqnnDAG4ATE/eFiF9YAAcT6N3zl3JojWh2uRLpRul/CrtLZS72MqF5pU
 XOvvpkoTjxNHjAFhMZv38l9v9OH7K2pv3dQAAAA==
X-Change-ID: 20261118-rbrue-suez-pvr-compute-overlap-flag-3695ceab9ab6
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Sarah Walker <sarah.walker@imgtec.com>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795022394; l=2266;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=V64Hl84PRxafvZ8Tibe5F2+9arQu5Px78eRgalqp2ow=;
 b=tRr23gjLrKL5ReWDABPeacqi7sRGYJbrixALAGlHLJsMbalFHIhMGNupP1KN5x+OaBez8VOrY
 iNod6/otK5CClbqc2ua3xaUp6R4KxNBuFhu2v592aHm3BkvWMnbBkta
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

