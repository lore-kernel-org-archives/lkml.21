Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544526;
	b=vCoeU8/HDexu5CiePTcjzSBINNl8iOTPYiUshhzt0QJEOpaEQKI1Muim+Lj1wwtgux8X
	 5B9YakzMxV9LPv9urROssi7oTtFPLA6/PoQDteB3ZQqVeOFhUKydpnHL0zUvWVK6Cc9mD
	 e4n6cplwIjJSs7LiMstUM/LRpeB+Izigxp3QIWEKNaKg7cQV3AZsms5N0ojAtK8rWcaAk
	 AyJc0AE+5OZX3UMPfkfy/xY4TnCdIjJxwfywxIrSbva+xHNkiNP9xEH1hE+jRoFMpo9om
	 JLx3tEcPuY+5Qk9kcp+ZHvhlModc0GdDxs0rDatAyKK3duG9vw8KW1QGAXwsKTuR8vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=UNWM0kxmEWnOWwACmt2LEHoYvhY3LG1h6QPQ7rX8clQ=;
	b=vfFl7c8Fp/A2VzwoGx7dWDmc1fzFUIaA1lAn0AeFpzkQpa99aWsQvvxT0p7DI4t1TWmk
	 Nv0SxVCxGq0qlKK1Ujbv/cBmHR+jeNWX3RKlBEiWKnD2XVpMq/2bvR/AKmQ2Iw03Rvw8Z
	 mSF03dzuLIaaIAfU6S2/dWfvz9rrB6bdeiTcVDECSPUBJv00WDc9DVXaxxMOWrVowUaKE
	 d+vxzviCcFHvpkl0mlhJruDaq8yO2eW2xf7mG31CKI0vf5YfjzgKQKpKBZ7ADqdbasENX
	 o7jBnKipbR14mnWYYBPm4hjOoNmJhgav/35xVKuVkY8VDGJc8iHhxOUhhFc2P1tRA0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrVsW5Y1;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B24606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8B24606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrVsW5Y1
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so47579395e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795544524; x=1796149324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNWM0kxmEWnOWwACmt2LEHoYvhY3LG1h6QPQ7rX8clQ=;
        b=XrVsW5Y1bdWNUbF0AXAKO+y5TpLoe8GfxGqndppcglHWXyVzHnzgl/rPx/zKCBANzj
         tfcyEVENjVfe/0u3hWD6v0kkS3b7DjrY68QN1Q8v5uMSTqpDEfoQKQKWfAHsv1r9FnPi
         Kqt/28D68T8DjO1+l15y8cUuIOL0PQ18171i/1Y241ZCCFpifXuyph4TfPRpnGEBjbSr
         pXUZUvegKzw94OWAT48MdEi6A/k+RyRnPxx8D5KN73Gi4kLMHbYqgX+OlADQH4XXIFzh
         j1t+kwhBzn+ISz8iD5Hohh9XrQTI15hSNT8GnG9r1dI11kiOqihj9dCE+VvrnTpF7VpD
         YjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795544524; x=1796149324;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UNWM0kxmEWnOWwACmt2LEHoYvhY3LG1h6QPQ7rX8clQ=;
        b=Bu0Pdl7GPpqUIUAbEeoOuzacVkquTRCJC6NpMXNKBg3io/eZY5YySEtXEQgDRq7iOj
         CIOajbmNC0G5FQPh8fplC9MvRDXGjOcaP/+nxGeajEZVQkkNL1vqv5HAokobpEqcDIPk
         icv6VvpnkM2LRYGSyuq57eUge0sBcbijqDamaT9edlLD+RLFPFyAV614TKHaHt1xS3Hj
         RLkvzYrz2y4HEgDwjSlniGrdJaRQoDCHuv3/R5SV6NpjZHFGNEY5wXmy4wJJq0aoXH65
         1UFk4bXNqI+CsDv5LtVMgaXYn3MiuasJxqD7HsGEYye1bDntach5b+TuaZVgAV+ltdn5
         A+MQ==
X-Forwarded-Encrypted: i=1; AL+hErFxbJyWr4Gdf/67RH2JjW0p6502xHCFimNDTMi+wPt0YRkoEcN+stIN77FJhw1dyz1Q6jNuSa/NOfIPbnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n+KyBULOX7+ZA+M+gO9PngcXM4K+k7qWNiIoKwwhV0mPCZvWj
	wIkAprHqHzywTE4njpgt2OGYOPLC/2t4kEiukW8Oq6yTMDH+Ja+fHqqJ
X-Gm-Gg: AZFdTZdhnbYIcu2Djmwx0AiWY/21XHEECkuJA3QomzhOpqxMF5UyQMcziR9gymKVIWY
	APuzHCwUleP8XGQKasR3H6gWQg9DDZx+WFHzM+86Ik3ptxnmmEqJj7Z7q55n+Wdtq0WJ4Tmg6go
	z0nsMNwtHAwZA0HZJ7mKqGMY7hgV2/NJBFKbEvnV5/mQQ22gF2GyEWG8XhWxzTp6Zxs6E9HvDzV
	NXsBzH3Qiw1VODxwOJIXPscc89JBxVqQrQoEk60BpigLZ9azNz9OP0Riz4zKmZQnN9aU0cVstNU
	7JsJ0IMmexDcrcOp4LCEeZd4XZu5xvfuSjeLFQ5UbpzyK4P2W5lnoN3yoh4VBdjEGGb/BpgFOiE
	fyVkanijIr6PnDS4W+Ggh5D/175Zer5B/dI6bLQgXdoEyoSMuawR/PDtvv98olkOUuGBgjpe461
	9yyeYOe1xculYZz87HdrkL8g3TTO9g3UEAbVZHs4i0atFBi2K0cIxIUxXrtmwUYqUHIflMybwqY
	s3ATP52+AqhkCyUnREVMXRuhgOKOIy4QHnc8Yl01ovoDGBndngbsF8LNUX1SN/oSNE65UTFqhw/
	Qq/csZYHYfOp6Xr+K8w6aOchKkx41H04
X-Received: by 2002:a05:600c:3b88:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4bb8880789dmr358586325e9.13.1795544523856;
        Tue, 24 Nov 2026 10:22:03 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm34524117f8f.21.2026.11.24.10.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:22:03 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 13/43] drm/vkms: Add KUnit test for device lifecycle
Date: Tue, 24 Nov 2026 19:21:49 +0100
Message-ID: <awXRsQbfxPzFWHzw@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-13-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-13-78ace90f4fc1@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello Louis,

Two problems.

.kunitconfig fails the config stage, so none of the four suites runs:

- DEBUG_SLAB and PAGE_POISONING_ZERO are gone (2a19be61a651, f289041ed4cf);
  PAGE_POISONING_NO_SANITY too (8f424750baaa), but it is =n and skipped.
- DEBUG_KMEMLEAK and DEBUG_OBJECTS* need DEBUG_KERNEL, unset in the UML base
  config.

The device name collides, 9 of 12 cases fail:

- vkms_config_default_create() uses DEFAULT_DEVICE_NAME, already taken by
  vkms_init(); device_add() fails with -EEXIST, vkms_create() returns
  -ENODEV.
- 12/12 with create_default_dev=0.

Tested at f046b77fa3e9, CONFIG_DRM_VKMS=m.

Thank you,
Oarora Etimis
