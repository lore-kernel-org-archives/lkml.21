Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505921;
	b=2D0DxbT546r7v2pttrSmTtN9eWTdsh1nC5VmccXtxRoie0H7fs6OCYUGMKCIkQsPq6mC
	 QQ4c22PC0fKkAjZZm4cnHVJKitgrib049hftgXIOrU66g8nzm/J6jVtlw1RUJo3PIkTuh
	 1tLYq2VwsvYvoMDRm3b+YOIcAD4R073kgEUhCkjcRG6lQkeryyQkhAelMagiwDp/gpGEW
	 HiGAAMirtpXtNsslzLUwu/i3VIsdXTpBmJ1byZLWqCWW8J6r1+mEhSkFeqY20OMQqpSNq
	 kpTdhycLzkV9gcU0PuUzFLbNJOx5WZA8O1rt2c+huBYMcTXed4KGaERtoiYxqJxNmIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=YsrbWXbneAhmlRMenrVJ4CAefsGYSIi01YHG77kZWSE=;
	b=i7KywsvP9gllWYx4qoENLoAFoM3AP53vX1oK49MweNnoVlzsoBP6p3ZjAzL1jad8HcEZ
	 9+FCH7dmp3Ohhj8RSqxEaSYWFrGX7ypH2V1uFeWvE5YQ4s/vtfqw2vGNOpT0b5iftN2aW
	 6m8jpL3JAY9QYsHp0vfJAd5k5i6mX4GRcSnJOIn42JB9xCza9tCzbA2UUzm8R51q7Fl3X
	 gH8YXDJnAiGwwKDTz7+gem74b58k0O/bmKrBscpiBz5hyaEwLjDc6+kwI561cGyUfMFZZ
	 nJW4d9TFtMsMI7S202b9Ob0p0jxVR4X8bJ2MDE/O4qTBDjuLmkOK08tAHMiDxGC06+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0J7YUXAk;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41FE606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C41FE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0J7YUXAk
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b467581b98so39498525e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505919; x=1796110719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsrbWXbneAhmlRMenrVJ4CAefsGYSIi01YHG77kZWSE=;
        b=0J7YUXAkuVbWvNMR2NittZISUbkQHHMqKx/m8queXL87lfLICQTSQntH5YNCat5WgV
         TtXD0MVKx91SOdwxL2MssYhNFdyxJ7H6EKSQ/oqRhOZTWnyrWZMi2em0eim/uK1FNpKT
         Cn0SYV/1VhQ7sxSReeftuTb61c26wbk4Ifo0dgcuCS0a9uMOyLMihnt3NI+8JsyFG1jb
         nPCAA+rNpAS3fT+KVabN2wZ/egkl94rQpIBmGnI1jV8H6PMMqLaKzWoXnx3gDULN3eEn
         x+58fXPCRN6Srdqizx2tg/GX3ONN6Xx+e1/5CRtESslxl6D2J6A1jsZLDeo+FBEG49e+
         VZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505919; x=1796110719;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YsrbWXbneAhmlRMenrVJ4CAefsGYSIi01YHG77kZWSE=;
        b=1sE/Irj5F7LHlx1322bsLh/6JAmFdcurEnYjTZ6v4ozD5dHDUTuYjL0PdD1vAIy/7V
         YQMqbDDH1ie+FZperXO/F09ZCfHOkT2Fk7vZRCVACxwBBHwkBw7ROBTzLFAJIeG2hPHC
         8FkLQ4Fc9mf2Jy9WhpsmYistGPLmh+Qw00Vy3aa/uyOZr8Wg+i4mG/SunkWbQDgSeaOF
         H3f+kMIohTjpbrCIaju7bB6GrRoZiGExTxo5xpzFapmlEQTEUoRzGyPlzz7OJGd5YZv5
         L/QJZrieQNVzjh2xod13I9lLkGM5HMGb5pY8MMB0XDHoSMdPideGSV6LSIg7KeVpd0wy
         r/ng==
X-Forwarded-Encrypted: i=1; AL+hErFVGwFJFgp5KSPR/E4e575wtLd0RuejMsHvqV3SceKK0Fre0rXyO7jhVFntFwosMrZvnZn50rlp5+XEQz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QObM8bIMabyybQwXgPVmul0D6/mQFD4lTDOtxaoNY/o4YwYjS
	kAfolruIMAP/7SIzYZbVaZvuduHP+qwAfNqvM1bXA0ri8SDoEzaQ42yS
X-Gm-Gg: AZFdTZdOqKLQm6/0/sLEYK3NE529vFEzbKWOThGkU8L9NpkdiP6hrjajFNQiFIdxOtg
	5MGTOIQ5v1n9C9MmuJE2Qt7Y3bl38pqAQwpyfy7ijlFFg6W0M42SBVXPQmAEzzRksNtDPrRVdrT
	CfteNTtnVY347XvjRlYyvz7fY4CKQmNonKlQNtxf0ODMp06HZ9QYBNOph+iGhF879gkoXX+nmLM
	Mp1fQHZ23cn7Zt+2n3ALOi6KaUQ6N1CgysRCMEFDh3xQEqTnsYjNd/dlGgZuRn9X+UvtctoeRo9
	ioPUtkEvupcvjI0FBk8TU/wW5sMqCB3xcIcg5ajfjkoO0Tx8NGeOwOu5DxZJwvuEMLDzpkZdWZE
	rZB2K98WEEHD6AUUjZiC1lgiTRKiHT3xgwo7c9Ih/umPbl3JIlyLq8v0xY+Dw+C/C5pKmQJ8nUy
	j50bVdyIyrjHYbAAUMDwRCy03cmhfp+7fWNuMfcvLma/eio94UKSsqPJi/qa1r+Ec85Sh8xMfWE
	kx+xXDCHS3vIQFgUY3rYBKjHMiJgp6r7hROKKf7YWQRbA4dgbwg/ubdrXoKMlit3D+ei8fANAev
	NdP6mLFL/wL1ddD1SwpSmULNq7AF6S7zpg==
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr276593835e9.10.1795505919009;
        Mon, 23 Nov 2026 23:38:39 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm25975635f8f.10.2026.11.23.23.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:38:38 -0800 (PST)
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
Subject: Re: [PATCH v6 18/43] drm/vkms: Introduce config for plane name
Date: Tue, 24 Nov 2026 08:38:23 +0100
Message-ID: <awU9pNtc2l0JXLzs@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-18-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-18-78ace90f4fc1@bootlin.com>
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

 index 49510a0957c7..8704b6f71000 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -44,6 +44,7 @@ struct vkms_config {
>   *
>   * @link: Link to the others planes in vkms_config
>   * @config: The vkms_config this plane belongs to
> + * @name: Name of the plane
>   * @type: Type of the plane. The creator of configuration needs to ensures that
>   *        at least one primary plane is present.
>   * @possible_crtcs: Array of CRTCs that can be used with this plane
> @@ -56,6 +57,7 @@ struct vkms_config_plane {
>  	struct list_head link;
>  	struct vkms_config *config;
>  
> +	const char *name;
>  	enum drm_plane_type type;
>  	struct xarray possible_crtcs;
>  	bool default_pipeline;
> @@ -342,6 +344,39 @@ vkms_config_plane_set_default_pipeline(struct vkms_config_plane *plane_cfg,
>  	plane_cfg->default_pipeline = default_pipeline;
>  }
>  
> +/**
> + * vkms_config_plane_set_name() - Set the plane name
> + * @plane_cfg: Plane to set the name to
> + * @name: New plane name. The name is copied.
> + *
> + * Returns: -ENOMEM if the memory allocation failed, 0 in case of success
> + */
> +static inline int __must_check
> +vkms_config_plane_set_name(struct vkms_config_plane *plane_cfg,
> +			   const char *name, size_t name_len)
> +{
> +	char *new_name;
> +
> +	new_name = kmemdup_nul(name, name_len, GFP_KERNEL);
> +	if (name && !new_name)
> +		return -ENOMEM;
> +
> +	kfree(plane_cfg->name);
> +	plane_cfg->name = new_name;
> +
> +	return 0;
> +}
> +
> +/**
> + * vkms_config_plane_get_name - Get the plane name
> + * @plane_cfg: Plane to get the name from
> + */
> +static inline const char *
> +vkms_config_plane_get_name(const struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->name;
> +}
> +
>  /**
>   * vkms_config_plane_attach_crtc - Attach a plane to a CRTC
>   * @plane_cfg: Plane to attach
 
Sorry, only noticed this now --one tiny things: this helper is ten lines with an allocation, sitting in a header. coding-style keeps inline under~3 lines, so maybe vkms_config.c is a better home for it? :)
