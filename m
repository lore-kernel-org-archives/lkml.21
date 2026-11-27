Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795737853;
	b=4vI5p29n9JoLbVYc5ICOKoLFwNvaI4IUAwtqYF6iTOclaMYGm9UazrazUJ8v8UTDgsUG
	 q3Jls3vezRDOWJ3D4Yi6TLardSxAZ18hgVMj20diBm5ttdG4kCnTHcAmrGar+44QWxHqZ
	 53wgySyavbl+6E3Z4oN6fAD38OiI89ULqwcPLAvPc8OPJtOktSJYB+DoIoWstBC0r2uvd
	 BWZA80g+C28WeGmAmRMwP8tmtHaH2c0HuHiN9QM56oZ8pTWw/ZnAZOAimwI7TOReDa8c8
	 PQfYY0PWOTgc06Eb/p3ewug1Vr6PKStIsEAow3zHxIg1dcGd5/JS2xTgzt3EW1FjzVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=uePKERkPYqyNMKFitbdJV3Xl/oPfgxHA9R+TZal+XKQ=;
	b=cgXJVtOTFWo9n3bbS7LkbzF2SunPEco0vyLHHQyR0JBbtMjdr1+dRyyVDG68r1nycZXl
	 JJfW7iVbd116G1QTjdHL40PVdHBj02B2tI9CdpwVPIrg3ly01Ob6gOWZFTC2DhZCSY8Sn
	 lY4LBD59OMZBaltU+fUgAzoK8l31l1Wcc/LC/I5vWT2ROCmtlKK/vZN2csEAq6kRsHSVZ
	 63mZE4eNFqQL6TU7da+fukJJNvVUvqZ/2DiKGpmMyTsJK04nUCrhtggN0R2VOWceemfOC
	 aXFAl2GtbI5oBjhyIKh2C1hExwXkdHEzmIuy5C2CY3Ecnr7welyjkY3zEtyqWXrH+Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b6w4+8G2;
	arc=none smtp.remote-ip=74.125.225.136
Received: from mail-wm2-f8.google.com (mail-wm2-f8.google.com [74.125.225.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECC8606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ECC8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b6w4+8G2
Received: by mail-wm2-f8.google.com with SMTP id 5b1f17b1804b1-4bbaf1ae076so1743505e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795737851; x=1796342651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uePKERkPYqyNMKFitbdJV3Xl/oPfgxHA9R+TZal+XKQ=;
        b=b6w4+8G2DQUZUN148oFYxnwqIgDDAeL51CuwWQfdYHcgrSBfFeE9UQ28Qf5wWpxyO6
         SZnxDp5dgZBUqJkh9ah1HGbsFEmRH6VQrcWCyUFQiRadFxqI5knOUYal9PkIcDAO2VCH
         uVsv2s+eJv6HU0QNhdUGRMctouEoT9LODYqscp+pST8ggk7E0ai3T3iScva1nXleRRK3
         Ud4zkuwelrRf7HABcfch/XCT6NGVtua5N1y3OVtwakmssutc32Dc5tYxd3s9LBG8Hah0
         IdA6MkTEX/0tu3xZZBUPEnZol0smUtG/G8EjA/WI31DwbJbAgUkzs+ajgjfw+i1lzRuB
         dXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795737851; x=1796342651;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uePKERkPYqyNMKFitbdJV3Xl/oPfgxHA9R+TZal+XKQ=;
        b=Vlq0dTM+1TQY26ZPFJzQj6gbUy8jYaqgn3ZDqk/KxpInCDtpSP3GgfdWoojoi4ruGn
         LofehLvz2a42P0PQ/b46/Ns0nN+AWvAYCEfMiNanVI+LnURUevFvGj45meroHrHCS2oY
         uQARSY0vPxn9IjGFE6YrzqNdNPN1mrBzbE5o71OYb2zexxvS994/DwOlnUyXjgwurw8e
         3hbO9Qd8i5CGYdswqwPclY1Es0xYlWjpvtXh6cpKET7fibzHTrHtpPj9K9N9YPkUqeeQ
         YECyjGnJMtPaW4VZvbZmgavmC7GcT1VkWLlOTFne9xSTKTC6BiauQMMvuFBqYg+Aqm58
         UEqA==
X-Forwarded-Encrypted: i=1; AL+hErHNNKYatCVaHmrl50iACya7P69mHw3iIjGEVU61G1CUP2tzfi4c49gktaBgqIST8+tFKcgLwOhrj95P/YQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tyw26IJvpOfB0htSAq0M2ruOfSPaU2xlnv9BjgAm0v+sauQU6
	gUid7xWHO/56njbFCRVXmBApnruJht/dAtooL9hjg60RgexX4H4N0Y58
X-Gm-Gg: AZFdTZd9Hb32gImpGMnPKeftockEMuLpIl8in2FKsJLu1UBv+jnGPbMxyJMXooLJaio
	+pUsCzcn/ZuevVCkW7ExeHclpQ83QEosYUK09joTJVY7GQEf1YJwA6WW1elcKzH5SjnR68YSr5i
	1PQbmP0XoR7nNqMCojsrxwsyG3/aC8buRejJSghINvbITmlUJ3VEB0I+HHiLF9W87eKRXGLcVWt
	AA7LsVQt962HHcptn9ZkDh2G+lFH1eAzAl9bAWf1DsBuzcGZf6ZocC5Rj2kUFtHyj+gnarBFAmK
	HCn1aCo8NHsHTkiwlnvfAV6vfypIuRoqmJPfH61c/dYmYHvDT+94fAHS8jP8ThoI0g1xWY83DWf
	grWL9x6WTzY+z/yPWQIsO1KE6YVDZ+DVn4YpBAiZVaEdrdiZbHNRIHLhP1RIGIi9v3B/U+pzrMN
	UzsXs3YUIZXRorsDom3kNTbUWTW5Ri85anLhdQSTZOR99oKiFCLJm0yrjqR5XES+mC28cjIadh3
	MMMbdn/suwk3/uqyx9DjUJm5VrKKx1aJB2v+MZjEkqF5pwo7pGu1sUknlUKCN+UDcmK4y3zbdGz
	OCv4C7Qc0mvV7fYqRNerjiP0nRSkBwcRYzXM8g==
X-Received: by 2002:a05:600c:4e87:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4bb88922c81mr452682765e9.32.1795737850830;
        Thu, 26 Nov 2026 16:04:10 -0800 (PST)
Received: from [192.168.1.11] ([31.94.68.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm782004905e9.6.2026.11.26.16.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 16:04:10 -0800 (PST)
Message-ID: <90d8b44c-1aa5-46f7-9e5e-d108e3d2646a@gmail.com>
Date: Fri, 27 Nov 2026 00:04:09 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Richard Lane <richardlanedev@gmail.com>
From: Richard Lane <richardlanedev@gmail.com>
Subject: [PATCH v4 1/3] drm/amdgpu: use pitch and surface offset for GMC v7/v8
 fb size
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

gmc_v7_0_get_vbios_fb_size() and gmc_v8_0_get_vbios_fb_size() currently
calculate the pre-OS framebuffer reservation as VIEWPORT_WIDTH *
VIEWPORT_HEIGHT * 4, assuming the scanout stride matches the viewport
width and that the surface starts at offset 0 of VRAM.

On Apple Retina iMacs, EFI initializes a single-tile viewport at boot
but allocates a full-panel stride surface in mmGRPH_PITCH and places
mmGRPH_PRIMARY_SURFACE_ADDRESS at an offset (e.g. 0x300000) from
vram_start. Reserving only VIEWPORT_WIDTH * VIEWPORT_HEIGHT * 4 bytes
allows permanent TTM driver BOs to overlap the active scanout and
corrupt the boot splash screen.

Calculate the reservation size using mmGRPH_PITCH instead of
VIEWPORT_WIDTH and add the mmGRPH_PRIMARY_SURFACE_ADDRESS offset from
vram_start so the full active pre-OS scanout region is preserved.

Signed-off-by: Richard Lane <richardlanedev@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 8 +++++---
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index c09f5153679e..00704dbfc1bb 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -929,9 +929,11 @@ static unsigned int gmc_v7_0_get_vbios_fb_size(struct amdgpu_device *adev)
 	} else {
 		u32 viewport = RREG32(mmVIEWPORT_SIZE);
 
-		size = (REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_HEIGHT) *
-			REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_WIDTH) *
-			4);
+		size = REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_HEIGHT) *
+		       RREG32(mmGRPH_PITCH) * 4;
+		if (size)
+			size += RREG32(mmGRPH_PRIMARY_SURFACE_ADDRESS) -
+				lower_32_bits(adev->gmc.vram_start);
 	}
 
 	return size;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index 15592027e7c0..a64a3cc07858 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1037,9 +1037,11 @@ static unsigned int gmc_v8_0_get_vbios_fb_size(struct amdgpu_device *adev)
 	} else {
 		u32 viewport = RREG32(mmVIEWPORT_SIZE);
 
-		size = (REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_HEIGHT) *
-			REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_WIDTH) *
-			4);
+		size = REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_HEIGHT) *
+		       RREG32(mmGRPH_PITCH) * 4;
+		if (size)
+			size += RREG32(mmGRPH_PRIMARY_SURFACE_ADDRESS) -
+				lower_32_bits(adev->gmc.vram_start);
 	}
 
 	return size;
-- 
2.55.0
