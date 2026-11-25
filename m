Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795568555;
	b=NiJ4G1sj8ALvX4adQDq+5jNiMOz+7RqZf1fhyNzQ68vbbVLeb6/+EU96OcPtBmK/jJeG
	 mDT6BsZPsM4w6L4cyGhVbUfOlTkro8NSeKYonIYdZzJA3gOmJwf7PdmCCV8ezG+aSRoL5
	 wJRJVdSS+Z2vrKNJIMgHKTMHrLGJ4rc27KoxuhPYmfpzvPdmt53rkLnu33TkZXpK2u4He
	 LeoNdqwhKleuTEqwOJ/WRn4c74LRKgBYlpbzmaWPwE5kupmVcKeovn4jOwvXi4AxKPWuX
	 D5r1WDVAZAQDFf689VgrKpgm3SUTRAyNjsljt00ypN0OubEvJP/gGUcWdr5da4jl0dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795568555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=uePKERkPYqyNMKFitbdJV3Xl/oPfgxHA9R+TZal+XKQ=;
	b=t/zRs9nlln+cYEpPYNQliYdPgeMCxU9ROOA2bRlGtMENEjY2PXd7NZq922Is8SJxVPC8
	 T7+HraoFsni47rxWjjKqKkXOjjNlP06vPOASEtGjSv2WoVd85/QqFtZ1fwKD4nRBJEX35
	 Q2RhKU2i6YD1OR7JJTns9TLC5auvcOp6W8dUmEo2EsaAQl6KAfPFONOphmOaYspTEhO9f
	 aXuBntb74rzI/BFekkC3KAUNWFS4mIXYidS/ZuAWtbsTYPiJpnm+39kuyoc44KCMs1+Jg
	 8qdXhnYNG6wKy60BcX++9TaBufcknv5FV1N14JtnF0W9U9ZZVEXVKX7CpB8tZVW7rfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RG5Karly;
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08602606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08602606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RG5Karly
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-4b886ebe069so14082685e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795568553; x=1796173353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uePKERkPYqyNMKFitbdJV3Xl/oPfgxHA9R+TZal+XKQ=;
        b=RG5KarlyyYsWVArQiiPw6wjoU9mKWznmcMbnSGl7j3/XSSGHDUffkDYGTweS+tDxKT
         I5G5pWWUFU/yLrkxuUV9NZzcYXxBBUDe7ie39Cg01SePlhau8ZUnIjjO+V92KZNKh0FT
         G1QsJSN2M3SUtUkjswNndMIxlPTABzuZBDXH+2RbgDysTlQIwRmhAhq4ZmwFkiuMYCOw
         Qs7jrl80KGRnh2olWCCXr1y/lHrMTg8GdSiGDrawXCS6O+DaxDI2ANl6Jeuk3PBKFuGL
         wJgzHi+S17A0H7oLPd3Tyrc4rCJcZZ0hbPjQubG0U/CHSZuwUeQiyjOUdtqhpP/e4Cls
         3cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795568553; x=1796173353;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uePKERkPYqyNMKFitbdJV3Xl/oPfgxHA9R+TZal+XKQ=;
        b=c75G7FFiguRnE95qAOOYnCKcg0Vkc67wpAW0qVAZ7MuvNCIO0oXPEP8RBAnzr4/pCt
         +CM6K5gYaOD9airUVzK7DBtW33lvkvBhzKLsMzYjwOtbQShDRZ9HmDkOx3bf9WolUzdY
         qrn/r15UVJWH5qHqmNVO0t1cMyYgtp7rsIsPnIxWsl1T3nYxAcxaEsFZKBQBQsC8JLEP
         UWzez1yRR+0HTbR2m9ZAr7hL/GIUdhDDt36BjZOKnsN/RFndoQtVgjrLH94bedQt1lPw
         Tyo+Sphkd5kKcVsfZqIGJoDWhgPBoj0U5Rs4m70KK5Sl7SCPml6KiNgp3RPgabrII/lu
         NVpA==
X-Forwarded-Encrypted: i=1; AL+hErErU+/iLULLwlTsObaRR+ZrYK6G7tjCQTCj5lpfOtCGl+F7kjhu0/hL31vRQLypKIZrUNnAwuNer4zFQmk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oA82zjewnhe23Q7X1u3tQTe5AUSwz98Kk0mjLiYHfMnCn8EuP
	SXPB9r+oiFa+k52IHJMIxizFTZ0EpxnQkZMB6e+eMftHBRp6jTZsqt12
X-Gm-Gg: AZFdTZdl3wCuL5CIWZlDSCSNmgv/R8eSI794y9uWUlZnJDeBWNPM0SY/S6lYJBXAMES
	jlyULjCG32CGse7MOWvstzm1DKdLCkizPbKrUzDF4HUaExFBclrdyCtIAB3bGGhkQmBh92dYHr1
	7Oi+9dZtmY/GBiO9aUFnFUQ8YtWym59GzAu7gB7CopGxDhikoZgjHt86RTMxH12oi5Y/tOjal6C
	qrshxxv7X8RatwpzZ/jklTMEKX34Pd8mb2fIo2IrOeqrFwWr6dSWrt0/gjGEHzW5eTZnWCUO6WR
	CDvCljyuQoiT8d+DxsZtn2dBiubotlms1wsdlHrMYGa4hjGRLmylVahXAUKMUKHbhgizC8xXOta
	RRbjEwz9gFccAYKLcbJMrbvIPiF//aY0MhChaCLdxIJg2uEZU8HiGzzPaQ7imwwA1YLeH4ESrwS
	+2NcKU9TjEZVTPzoH5tHrDBgAiYS1c4QKX9f9zCTTL1oRdrcAISu3LXMK2ubY/22rqrRNXT0x93
	/on//8id/uLStPiFTgARqes3nMhElfSp9yEmW4L5nCxe2SVTzvdS0kS3OWxZ6v/mQe3t8AZIEJy
	KHU0WOETdTjAd92XL2fK4Ekgp9v5iGBCObE21sDdu9neeWBl+kZL5Qhq5w==
X-Received: by 2002:a05:600c:3b84:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb888074bbmr395065225e9.12.1795568553403;
        Tue, 24 Nov 2026 17:02:33 -0800 (PST)
Received: from [192.168.1.11] ([31.94.68.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm31262183f8f.5.2026.11.24.17.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 17:02:32 -0800 (PST)
Message-ID: <77a4adb4-5539-4d5b-911f-36b5be6fdc0d@gmail.com>
Date: Wed, 25 Nov 2026 01:02:31 +0000
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
To: amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Richard Lane <richardlanedev@gmail.com>
From: Richard Lane <richardlanedev@gmail.com>
Subject: [PATCH v3 1/3] drm/amdgpu: use pitch and surface offset for GMC v7/v8
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
