Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795238690;
	b=dmU0b83reN62hSa/McKJ0xsXqdXvH4rYIy//RPs7fV3v9iaYprp9/mQtwfPGKI+pFnHM
	 ZADTDL9T9VGSz2W+Pa6UK+x2SdYTYpfHtS/si5qqzDqxU7awKUPdSUVveMEAegu9L7uUF
	 g/Vq5UYCjG2u4du8UJuoh5LsWNJ/VHTWX3eo+go/TitaxLf92m4roadg8Y2VcbEzPKKUS
	 fGkaTk64cAL2IGPgL8C75B4Wbid1yuuhoAIOxAXh2Hsaf6OYwXASoNExha7a9KIWmVHHW
	 ZW5UKgk0p+mvOdS11VhTEE+WuL+8Lu3Ytl/Qrej/xZaoqKMwQODEFEsywKDeX1UX5PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795238690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vrAH11RxlITDJuS6ccKcKd1F7cmDmkL8RNwIxF0LPl8=;
	b=SnMHlfbCojJBq/jPBDacHYdAxnTrZJnLBOfbWKsf/49ifX3fUCjIkuE7JNyGe0CD/PDh
	 DpjfOaHMAskPnrb94nGSBSvMidKf1fUUS4wPK+xpxjAopda4So+shw1IY3q1u5AAgXJiW
	 mMbGexD17c+UeiTXCr3itIk+k8hn49QXzmH27h4D2LLhh8fdZQar//6fYfJtnz3VtXPYn
	 dN+VXgtVPGWjqtQptnkJAB3QU/IQnJZv+uXSrPS3mkuz3M5zDzGo6pugFivMw7SO2z0wB
	 MpbLmCUt81p/77L8TsgbwQpzKQTrtjAKNzvTgrR2vWEQ/QsvYnr1UihiZQ0t2IEW9uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDbB8tzH;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE05E606A331
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE05E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDbB8tzH
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-380b40319bdso2093076eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795238689; x=1795843489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vrAH11RxlITDJuS6ccKcKd1F7cmDmkL8RNwIxF0LPl8=;
        b=RDbB8tzH0MaqvkGFj9/YfKC7tmEOs5Hy2q8yEMCLNCCrXOJh6R1ANTno7DTBrnKYfv
         AZUciZrwMv1IE5v5jM6JdOWy+dxKegGx/gl2+NHst+7dMbIUgjwYDUY0bUDeRfkuS0Y6
         8g2Ia+Gq9f78G4NTeCOO4HHfCNn+LWUD0IXBeCLQX6jHEzqG5dwhrE7FHVY9TM1JAb1W
         JZDcoblzR/kBgvYe339jN2ucmBUTETsIjhNm8wUPCNt18Oh0+3UJhPHcWDbK5KuVTfCc
         +wcyCUvRB3V68Ggra60ETEK/FTVVeUTZB8sBydWdNtejTFQWSjVJBAkvvtox6oNGzyoj
         V6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795238689; x=1795843489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrAH11RxlITDJuS6ccKcKd1F7cmDmkL8RNwIxF0LPl8=;
        b=I3qeBCAT6zL+YjvUZ3hOd17N3YqatSM1sNEWqD6lIKs3imYZWQAVq8HMJArcYOXO1V
         U611YwOtzc4QIrinVxa5ehuWeTI3zXybhPp3712vCQ9PHlUnlkCFBI+ibkVYDzgL95HG
         homMWE62EtmDVdxuMsF+z+QgZFrLLgk6jF6Fy06rHrLhcGOjp7GB0uOzNyD3OBmO3tOf
         XRotguomsrBsmPT6G/+gGDfvRqc/5ObFcp/QxmZMZ4tX3tTEK3WJku+xMi/6wqf28/O9
         Gjfsz08ji/QXv6tfBamRbhZyT5R8ZatWSN2vVETSZtofu2Vg0xwRu9WKzC0TB4AMncYT
         jobQ==
X-Forwarded-Encrypted: i=1; AL+hErFB7XCCmqEeX9LauOZc8Qyp83odpWkRXoIja5fyOsVCQ822g3eSPxu7JCJIb9YqWxkxPVfn7aM2IkuK9K8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7N9s0AxhptK4p4pqN6STdKm7CaAAt78T33czusL0vkDss0dzi
	DQ08ID9F+An5Td2/5oJsF5hqc2nFXeG63AR7LX7VlyKh88B+jQW4HoTlxadtgYcf
X-Gm-Gg: AZFdTZeFKNz0PW88lcEBKOD+Da/zFm22EhMGeza17Igm/ZI6Tgel6Lxz7soQLOTawyT
	zDZFgvpuhuCl2+t8M6PikkQDXMawomrbOIbMzrmLATc5QNB7zRK/DaxqoqvatRPVGZob21Mk5Nw
	DV0LMhYqniY+vgHT87R3+oJQPX9IhG+6tdmdgJbVPDmZtzsU481rm7hp9/vUr5saiWepnokrbsy
	qJHeg2gqkw2rgknlr0Ya9wEIklHVPUJiKj9S1BmvHK6HCxrMrJbqNNWXW0R6PND9kMA50BGBpV1
	u7jqBVqCrgP1rm//J5FwHnpgHQ+x2L/w4WjEq4iSuSAqK4yXoUDoim1ELioUFH16edjry0tF8K5
	ltQCEPVkeqb/r1XRw5NJagMByJlc3P3eVy2AWtjPgFUIanQL+ODM5BLQGsgqqvmBQmEPmlEj3xA
	1bZdaEeO1HIZNZ/jqz8y6WAOQBy/xIjLCO2mfRfGQD7Eh/J2uSpbQk6SMGDkvsNF8R+lF/Qz0V6
	qWGpzIBu5kobRIIwhGsTLeMLk/97iZsx6dRpcofoQ+oZBZCeBPuObMCdMZCv2nALrsM7NydrBdI
	tzloA4cZ2nxeM/Tl44q3
X-Received: by 2002:a05:701a:8148:10b0:143:2719:f800 with SMTP id a92af1059eb24-1b556908ecdmr4821202c88.40.1795238688807;
        Fri, 20 Nov 2026 21:24:48 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm19330849c88.9.2026.11.20.21.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 21:24:48 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] drm/amd/display: Fix spelling mistake "pre-definied" -> "pre-defined"
Date: Sat, 21 Nov 2026 05:24:44 +0000
Message-ID: <20261121052444.1797470-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Three kernel-doc lines in dc.h spell the word with an extra "i": the
@dgam_rom_caps and @ogam_rom_caps entries of dpp_color_caps, and the
@ogam_rom_caps entry of mpc_color_caps.  No other file in the tree has
this spelling.  The @dgam_rom_for_yuv entry above them already uses the
hyphenated form, so fix the three lines to match.

No functional change.

Written with Hermes Agent, an LLM assistant; the author reviewed it and
checked that the change touches comments only.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index d3c484f45333..3492ff0af1ab 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -250,8 +250,8 @@ struct rom_curve_caps {
  * @ocsc: output color space conversion
  * @dgam_rom_for_yuv: pre-defined degamma LUT for YUV planes
  * @upsp_pre_scaler: Ability to upsample 420/422 before scaling
- * @dgam_rom_caps: pre-definied curve caps for degamma 1D LUT
- * @ogam_rom_caps: pre-definied curve caps for regamma 1D LUT
+ * @dgam_rom_caps: pre-defined curve caps for degamma 1D LUT
+ * @ogam_rom_caps: pre-defined curve caps for regamma 1D LUT
  *
  * Note: hdr_mult and gamut remap (CTM) are always available in DPP (in that order)
  */
@@ -310,7 +310,7 @@ struct lut3d_caps {
  * @num_rmcm_3dluts: number of RMCM 3D LUTS; always assumes a preceding shaper LUT
  * @shared_3d_lut: shared 3D LUT flag. Can be either DPP or MPC, but single
  * instance
- * @ogam_rom_caps: pre-definied curve caps for regamma 1D LUT
+ * @ogam_rom_caps: pre-defined curve caps for regamma 1D LUT
  * @mcm_3d_lut_caps: HW support cap for MCM LUT memory
  * @rmcm_3d_lut_caps: HW support cap for RMCM LUT memory
  * @preblend: whether color manager supports preblend with MPC

base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
-- 
2.53.0

