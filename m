Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528366;
	b=4NwVdJvx1lqGu9W0sVn0BBDru2OTRM35tHA0bjWmxql1bu2wxHmFFyDPHNjJibO22xD0
	 Yid54Y0DhB/w9CAN+WUv4Gg4uVpAWixos6D6K62MsqRMC0QqPGFWwgAC292anBlWrLuwH
	 czANL3ThRjAd7VZCNrn5uzFg0NkWsq7Fv2BL/hveRprCO/9d265XKp5YMa57Q8saioeKK
	 zoHou9t2xnKrd4e4Bz1sTkLHsram7iPzSq6slxP5Q4lCrFfRngG35tF8qqV2nkAjElZEJ
	 JphW2Bu4+BolUZ/eK29wZeh0Uv4zDb9SN+AM5PHQeitz6wKKAVTwpkP/GyxD/7Yn/cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=HZKKQf4VXfezngqUfgj7MhmoCUm8tU6EzL5wE2W3U7c=;
	b=zWI3McVxqjLeIribpC7WYsx6NNqMDNv10CKhiwvIW+iTbv1KjLeB5aWBcPHx6uARwXPG
	 sb5rUbbqDm3Kuc7B7MbURZpbvjJPhJUVfBIvZM/HuDvT2ufP6Xk3WgFF2w+7le2hnUXaw
	 Bzi4uhOJRT+0pHwB5icBMrdue0do+PTNnALhdXqzdGPmrPBsoZTefZg3kPI+XZmgOrUK5
	 hKBAhuTgfyHXUc2tRznKxCceDYA5TSZFr6eEMj7knCyOH2RxrQbW0ovuE//UcOgxhkYcl
	 G8ltkjtdzYcNjlTLC2K+9xAoXiE6o1jcEXP48u+831FdRxuG3nauBCZqMZLlO0JE7JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p8oMBJxA;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A2F606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07A2F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p8oMBJxA
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso6140933a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795528364; x=1796133164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZKKQf4VXfezngqUfgj7MhmoCUm8tU6EzL5wE2W3U7c=;
        b=p8oMBJxAx6x3jrAj+qLWsbMnExh+m0b1TDLDWSf2O06ANZAz9+SN8L8cBlKhDtYVVv
         yjp0NrP0a1Rxr5SmB5DjgViu+xxATWx5uJlKvy9HaZtUfnog5Ri2UF6Zw4Y1CBVi9zGb
         wMNPbBjqh9sNC0MSKymoM8csiUT5iMG4YHcYdpQnsrybTdGoSKx5aVPDGL3+PTAFNgv4
         20FzR+vqn+eA6tPO+5qJBKvy55aqkzkXIGQRb4usG4ZNcFlYaNJJ4BFkmmCZi2XO2/jI
         HAhz1Of3qk4PXRAeW7JluwGThK8DfDBQ114r4/GMjMWB+FYM686D2iY2QzCZVAd9EHnx
         DuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528364; x=1796133164;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HZKKQf4VXfezngqUfgj7MhmoCUm8tU6EzL5wE2W3U7c=;
        b=0z3geuMJEdZyRzUv16xDtSCMDJFo5Z82oyVMtZ+xpJbLKs9nOWTFLyaYdedLny0X4t
         +Ewl0ZCfxqhET+yGetmEsQfQblv/IH7zn64NI7d+alsQYwOaBUcapWiGI73mEj3sjatG
         GMOb5psFnVl9lYobYiirWxgJ8xTv90jaXnXJTe8bmFs58BsgIZAc9brVR5+E05PfV3KQ
         UFc4J1F2vB/ToTsZmdSN3J0E2K40LjwbL+FLLaPQ3YEvN4KL7BvwZXIm+0H5HLvXZBqN
         x+kw5DtCV8vYYDjFzPflcpglGDnE93ogI2aNqjpSDVK9U/jsvLctbGRQt2h2eaza1wUK
         gfLQ==
X-Forwarded-Encrypted: i=1; AL+hErHhnpkSQAAAc09quAcjKDQbMD0YpXJZqLIYWVS65VOru/a8K9qnWe9jTSPBJNFLfe+y3mu+OyYS5ZvHPCo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8opuYroiw1qQhYgGkPpdJyd+ujno6tvpdK+Nq8tyPbcEttlAGE
	DF7yGv4apGMKUhe2pZ5/Xb14uJnlWuiDOJ8zMP1a3p0r0T1YmHYRh7sT
X-Gm-Gg: AZFdTZeJkFRPjY32+HMb8KtOODnpKNpO1qo6j3fFYEsmVVLLvh6o+F284jCqj9nK1ZT
	HSDycHDHHuuwF02fSlBx4i+NOPXa36ENSRzHg0VDbKuJUort/eA4kkHl4XDlER91/qxj1fcl0dO
	mvYT6iRZUjlpuEL2UJx5cHsAJuevM0bWkOJGsMAN/t+JAYRXD3NOnpikJg73bxWxT5S49MthYLu
	jBEYk7+s2TNleI4OOomvUYGZQ0i7P3mdojmqyDfhkLEh7PoDx7e+x5NKNvoVc8bwwql+UCMpter
	Uki+LwDpVukCW4IgUNX6eHwCYsdF7MdtO0ydliJCotFTy1vp5J/WCaapH3cvt5qlwhaX+r19/4p
	0/XYSKiz3Hf6B/6xKcnNL5t/sBDjuS3b3xr6P4l2FtImU2oihZFowSmZnWCYBAXZw4OvEpglrjC
	W0eR41NaRB/dmUJFVrrDUx3oinOb2i3WkXMu4DWmuHlMwYeiuMGdos1zWeUmZUCiL3ASQ/sNJgm
	dySeVqJBb1sM0CL6+QrsxwiHv9D3Ip4vmEpvd/sjAvHcQk/E5oTbmtcA/tgsayL7oqahcpxDbIw
	CW6JXS6hyoCYQDYdsKV3HlNaJDK//dro2Y55Um2/u/3aQu4ZOvY/
X-Received: by 2002:a05:6402:3222:b0:6b8:7e86:3e90 with SMTP id 4fb4d7f45d1cf-6ba654bcff6mr8479709a12.38.1795528364057;
        Tue, 24 Nov 2026 05:52:44 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109b55sm6582079a12.32.2026.11.24.05.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:52:43 -0800 (PST)
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
Subject: Re: [PATCH v6 07/43] drm/drm_color_mgmt: Expose drm_get_color_encoding_name
Date: Tue, 24 Nov 2026 14:52:28 +0100
Message-ID: <awWVztVSyL8uOIzt@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-7-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-7-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:49PM +0100, Louis Chauvet wrote:
> drm_get_color_encoding_name can be useful to display debug information
> outside drm core. Export it so it could be used for VKMS
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_color_mgmt.c    | 2 +-
>  drivers/gpu/drm/drm_crtc_internal.h | 2 --
>  include/drm/drm_color_mgmt.h        | 2 ++
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index e4e31bc0153e..de219c23322f 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -496,7 +496,7 @@ const char *drm_get_color_encoding_name(enum drm_color_encoding encoding)
>  
>  	return color_encoding_name[encoding];
>  }
> -EXPORT_SYMBOL_IF_KUNIT(drm_get_color_encoding_name);
> +EXPORT_SYMBOL(drm_get_color_encoding_name);
>  
>  /**
>   * drm_get_color_range_name - return a string for color range
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index 3492787c3697..f3a3ffd358dc 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -38,7 +38,6 @@
>  #include <linux/err.h>
>  #include <linux/types.h>
>  
> -enum drm_color_encoding;
>  enum drm_color_range;
>  enum drm_connector_force;
>  enum drm_mode_status;
> @@ -121,7 +120,6 @@ int drm_mode_destroy_dumb_ioctl(struct drm_device *dev,
>  				void *data, struct drm_file *file_priv);
>  
>  /* drm_color_mgmt.c */
> -const char *drm_get_color_encoding_name(enum drm_color_encoding encoding);
>  const char *drm_get_color_range_name(enum drm_color_range range);
>  
>  /* IOCTLs */
> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> index 5140691f476a..133ca77d91c7 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -113,6 +113,8 @@ enum drm_color_range {
>  	DRM_COLOR_RANGE_MAX,
>  };
>  
> +const char *drm_get_color_encoding_name(enum drm_color_encoding encoding);
> +
>  int drm_plane_create_color_properties(struct drm_plane *plane,
>  				      u32 supported_encodings,
>  				      u32 supported_ranges,
> 
> -- 
> 2.56.0

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
