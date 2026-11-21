Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795234481;
	b=jq4JZJtQPXST/Indy2+OO2MTWq90Xvt/a5Nt2vraHTMaLh9zfY+4vRdvR/Xzg1c8FMbO
	 I+44HkoqdIbNo0epDUP6KgfRBjohrncB/tqQsdaKG0odaSKYZfetPQBdlaJvIlO9I32Ld
	 oiBDv1LosCYLrH/h4TlXTeA7gytq0Ts7dbFjhQLjL7+qrcO2q0rf0J+KLJnZ0U7G3UIAd
	 BISbVJ9HPLgtTOzmMBViIR18ozYhWARIvHmmXn0zRBSk1XVMtu7ujGbWWmrY/wxkau38B
	 KSzoziSlDUD7e9XiZoWYm6yraqMfVrk2G+XcXJ2ijNL2dNTyvAoGXYSOQ4Zldy3+dfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795234481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g0XEzBGmvwOkW39Vxp4j0TIiOhGg5iVLxt1dqiFm15c=;
	b=pn1xZAnagbCuCU6Ze2JMvKKooO+CyQGkSqOj/pVGr6Rr32StiGyhpn7q06pcZ3v9jrvy
	 +kRW85WCdmjtZGT4rcVWiKCiqRCyx3LzQxgKegIFjlxYsof+jhIg5Zfb7HWRoN4jlj5og
	 dtpytEXUS70jYvW4MioiTgZhDGSrslux4PlNmVETWQ66MH1i3Al3NRbAcEmCOPYaTbLWX
	 c8jaiHyyBXfuABv0OQk4csUp/dWZ9W860rzraCfOorr4kn39Yh4EDwSXvAKsUqxdSg6+e
	 C2tMqWIUIWrLWh1wY9fK4mzVOqxUQ93KZROgznhikvceWSRT4RD6b+91lUYQQvU+b+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eu1zg4Ip;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC17606A33D
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AC17606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eu1zg4Ip
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-380c28f9e35so2478261eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795234476; x=1795839276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0XEzBGmvwOkW39Vxp4j0TIiOhGg5iVLxt1dqiFm15c=;
        b=eu1zg4Ipa014dVky2VWTh84Ro9EtH92eTWuXAixz3coODaa71l1ZqB4X6WyvUAboRC
         VYNPEuX30WqixyPmt4tN/b5gtyuVQC6I5Up88PySLAMWGCQlxarZivc/fOn874rnotL/
         njDlq6TaVM0vPdOw+rhxkQbii+FtA4Cv32inZ7AJyHtIUFbzo5DGKuwaFTuO46kikSeu
         LpbIehL55AdPuNuSF0fl48D4OuW3EI0ZebWcLVIEYHnOuDBllW96YxR4dj6Xfepj9foN
         sKSKzer90maOTHkLhj1dYCHPuvI0OjyJWnJ8QHjjTFBq3lnM42IbUUbYW9Y7NHFbPeAr
         OhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795234476; x=1795839276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0XEzBGmvwOkW39Vxp4j0TIiOhGg5iVLxt1dqiFm15c=;
        b=nm0+Y192XP7Ixsp5UiIC2W8dqN42I26No/wOJh6+atWhuQdhhjQ8pCD+KwJ9idrXFp
         qaByoiSxonDZ0bz/eR1DUwaYTClTJ1XwhtPlPyni5YPH4mRAW4rutyA6vcINmwkrdTZQ
         6ry9STbUw7IL+iTCV03F5iIp53XDl5cfjhfxJWNpem6eBi4h5hcwdDkD3+4tG3Jhjc9d
         P7YU4VnWd2lWvSedstecnResRU3XYf/x/7NO1jKSW3jcGvXyJG0JnMqlOqbwAOy2gH+J
         RH3MVSWUehqBaRhWRtRxlckd5l9fkMubKcCjmv1Vv3byaVWHQP5n15Qq9c1M0EIe42v7
         bmfA==
X-Forwarded-Encrypted: i=1; AL+hErHT2eHjHhadMA0KTuAwz03/xU4Cmj3dMCOGJeCUJquwu+9skiH6mD1Cj7VLMfkS8MqjnnHM8neipt/tGxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WbXZJN464dZVAhuRNHWRYnP5w5r08ow/QiOEZHnqfuWNqRpB/
	bnQrKG0XVeKdeMLuo2Wok+INObVWJsXWnv/5A12Jku/5jIAMCXv25OvvLqbm1oyg
X-Gm-Gg: AZFdTZeIHR5SXUadnbA7IVcCUP5jYlN5pZKYgucTU70XnFXjWQOkagT1M8YDLtKyO5j
	WzQWqJLuEpNpBDSWEseOX3FkiovQkQ5IhSys16S9HsMD9c6JH6Jp4n+4iQEIPaZkwLPrLER45nc
	UrqvsH2dooxKOcE11FZ8PVbuHbNvKTPDRX2gJd6fTNIW8vJDzyu3d724dsgJloEjzO4/wDV7IIh
	9fjRjjN5Y222nfF3BO/BLVYepuMpejFScaiyD2xy+JbHNI8af9KAVJ6USZzbRXEZt+nCMaG4FQr
	NWlSzsnpCfKpt2nf88P//U+DOG23Uz0dzAN5nhyuSKBPxZibiZarKu7vpz7ODYdtS/BGL/YNEHX
	TPFLZbXj4sKBHIl/RZPRAoitQXWw/xUArbMpwxpUN6pqDUutgngfHl9g3LZCah4LnrzPGjMX4sN
	2KmPTuM2Wl8UyU8gl7pKaWjNTBLxubvD9BS2EOHJdzwu7fXswQdlc5UqskiR+3rKZTTySVIKxay
	SxbCjFUM2fl+zTcw5ztQfOrBHHvngJfBqchdv5ee3x6h6lRuQEStkzvxnUrPDTyGUNVh2+S7cjm
	/IlxQMEdIUwQOWNvEPyw
X-Received: by 2002:a05:7022:5f0b:b0:196:b805:9546 with SMTP id a92af1059eb24-1b5568c4890mr4499639c88.10.1795234475899;
        Fri, 20 Nov 2026 20:14:35 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm10379603c88.2.2026.11.20.20.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 20:14:35 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Huth <thuth@redhat.com>,
	Weijie Yuan <wy@wyuan.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 2/2] drm/amd/display: Document max_gamut_remap_coeff
Date: Sat, 21 Nov 2026 04:14:27 +0000
Message-ID: <20261121041427.1743954-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121041427.1743954-1-takano32@gmail.com>
References: <20261121041427.1743954-1-takano32@gmail.com>
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

kernel-doc reports:

  dc.h:329 struct member 'max_gamut_remap_coeff' not described in
  'mpc_color_caps'

The 17 resource files that set dc->caps.color.mpc.gamut_remap to 1 also
set the member to dc_fixpt_from_fraction(S3D12_MAX, DIVIDER); the other
ten leave it at zero, and the comment of mpc_color_caps does not mention
it.  Describe it.

Written with Hermes Agent, an LLM assistant; the author reviewed it and
ran kernel-doc on the file with and without the change.

Fixes: 1c5e6cd8291f ("drm/amd/display: adjust floating point format for gamut remap when needed")
Link: https://lore.kernel.org/all/ec4d7cff-d23a-46d1-b245-921f442b9a7b@redhat.com/
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index debdd69bbe4e..32bf87fed40d 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -314,6 +314,7 @@ struct lut3d_caps {
  * @mcm_3d_lut_caps: HW support cap for MCM LUT memory
  * @rmcm_3d_lut_caps: HW support cap for RMCM LUT memory
  * @preblend: whether color manager supports preblend with MPC
+ * @max_gamut_remap_coeff: largest gamut remap coefficient the MPC supports
  */
 struct mpc_color_caps {
 	uint16_t gamut_remap : 1;
-- 
2.53.0

