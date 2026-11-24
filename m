Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517333;
	b=u3KyY6g9JmJAANe+u+vY0GvkOB7QoqmIXnytSLi+LCw6hQOnMcdBW7Q4oxY8aRmpKESa
	 BxkfsFN9NSsQiQB7VWN8QghfP1NRR7jpw5GYhWVwni81UnHoAY89ZxjT/ymgaEj6IkYqz
	 KD+LqgBkZUrHgNUHre2Pn1GBAknIbukCrbTn7pGQAStmUrfqhSXZZkIIhmWaXsYCNodvV
	 C8TDXU2e7mNEi/lyNG5uIEtkBRldBRhdndnhyrKYQf7jnJJtJ8m2Ly+i7LluPV9VNHnag
	 q9YdFbWD51JDx4iWejKTPbvAMvzyMnZtMVTooBbSCrs9RVtyaeNmIOU7nkbYTTdm7tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=BQWm+RaJP4cvkyTJMqTUs+AJFoZOLPdvH4gKpxS4kaE=;
	b=DPLi9v+fQYZmcfL8jGTUZwp6nfK1WtziSsrRB9Q30WkZatwX92K1HXyMdj+h2TzSNqb9
	 JsADxgca/hkFRKt9F2BFOdx44gLRFLNgkDPVmH7374dogg5r/hx4y/7oc4b79OAHshtAw
	 IZdkLpqOAw6p3aajMQj7BNPN4/e2Deu+9q70fnD2Ru5waqHbFg6d7HkIBtCVK+/TNxRhp
	 lFCnNkzFy4DEWK6pkVtu1Jyn+bi0bifhC6bx6CPsplYz6SHpaLV/ZH+e71f7wRvkpUFFf
	 W/CTCT5W/RW9agQdADVHy0OmxqHpTvZrBilN/6Rud3M60G2E3u2Dj7t3zR6yTwk0Uig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUFnst0x;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CDC606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72CDC606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUFnst0x
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b467581b98so41526645e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795517332; x=1796122132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQWm+RaJP4cvkyTJMqTUs+AJFoZOLPdvH4gKpxS4kaE=;
        b=JUFnst0xtFv7w6OjOq+K6fqMUot4nVGEpjGBDPWVBo1mFyxXXwQeTEEu0DnU/M0eGS
         3lfnPbQbBqX7BtBpGUbFDVxrnobuJNG4e4CnhIE1Jcevr+s0bb3qCdBnEqaR6POrAeJE
         mZdPl6zhw9uJXjtJKAyWMzVH/rclPspvnw8c8s+Z3VOltX6sWH4+gajZKnKhFLsZa1F+
         SvSmXYFyQ7SaZuxF473azwJKPsBB6ZqbxDIQBZIDINYeKNC6muV/vg3TUDVzuUFCtuOs
         jXwZ2B5brMtnA491+Qez1UrB0NFaCnZ6g6XMHeCaxIG46And8WLEvH6npTCIURwEdg1+
         wQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517332; x=1796122132;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BQWm+RaJP4cvkyTJMqTUs+AJFoZOLPdvH4gKpxS4kaE=;
        b=UG80YKpjYOKEcdMUxnEKEYgNI0pLtz/wz+0ThJ/hR5VKrMZ929RaoALPDLUq1Mf2f7
         /yXLr7wl72uAVpaB/7MCPgrucFNOMOP36uxkBx0rkul+9UK4R1UcW/blJbiPcyo6N6Iz
         VN7V76bg4PudC0r1wo37ag/E4mDw1/v6YIrVMWzdPkB2mIS/sGGfbECMmaNNT08LjInO
         lGOT5wU2YrztPGAhhv7KwfRixSUfUgM1P/PXGAmmMNxt4ia6Flie2H5Z5H5dXpL0xy/E
         RaYcDQL00iOJ0pl5fhppWkMB4FHR9o8voQyjQezhj0MPEw0fITYPNoqGk9rHRKgkebuO
         3GZQ==
X-Forwarded-Encrypted: i=1; AL+hErHiHQXzFHqfTUNT2QnEe66y+73Nw2TcuBeH7qT8QnAza+jOM1kxAUJtUQ1dMuu1oKLqiW8ZwkkL2bj6jbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Arp1XNoxWWDHaTOdVI8nXOIDazJPqBRbAk8KjGjsNuOm23jMF
	65CkWJICDQ5/WMu5oDPFxXsarmJtvvS5KkXE0gbf7C6r/tSY8ee3lftn
X-Gm-Gg: AZFdTZcU1Eb98ZNPd687WealYI7ts+KcI8geHAH4F2EYGyrRAXoc9JU7j/zL0sV2mNR
	RX4Hwq7QGor1iHGrWAh7T2ghTPd1gx2y7+aeju739FEZzxsdsvJblYQDMOKX/0uAiQgGbgt9yrH
	nDbJWxHIQnHIm4dQip0pCxXRzOQGX1dsBWdPxRoJOqdqzbUh0JXDrJNskkhHjit1V6asTXHkGBV
	S+qRRsdKFZ8Y0/PWu1hs/7H1nSGhyv6ElRbZRJmjR9635J2Pp+/a3lBN0/MNJzFtdfaiO6ThVJx
	GqgTvsZ45PU0lfzjicISqAocYTRiFu6OXqI/xYNSuLmW50NDoCZ38QFVo6vC3z7HCKtzthEzA+U
	t+35sis4+dFRekrundQUGCLU+9vf4XSL8OzJlbvuPgZcuLvt1cKliUgemYQtKuHaFq47Jm2z2uc
	Z5lE6OLbnpCPkYZEDqMXNB3KjLAAFyvY3NgpN94UInV0+pDaZNPfyk/4Wu1bm1gk1dPN1gENVMy
	VPSLna32vDAy5UozNrotTcOmT34IPISoVHSDn5SyIP2u0qXxlFMcuWk/VXoCcMeZ+1UFDrcz1P/
	nYXiD1V8WyJJp6CEOg4BeyRjcEHWDsTRKA==
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb8882672fmr303322955e9.6.1795517331573;
        Tue, 24 Nov 2026 02:48:51 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm585521185e9.13.2026.11.24.02.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:48:49 -0800 (PST)
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
Subject: Re: [PATCH v6 05/43] drm/blend: Get a rotation name from its bitfield
Date: Tue, 24 Nov 2026 11:48:33 +0100
Message-ID: <awVrWZkluWav6Jg9@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-5-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-5-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:47PM +0100, Louis Chauvet wrote:
> Extract the rotation/reflection name table and expose the
> DRM_ROTATION_FMT()/DRM_ROTATION_FMT_ARGS() helpers to print a
> human-readable rotation mask.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_blend.c | 19 ++++++++++---------
>  include/drm/drm_blend.h     | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index d17ae964fb21..b62f1db9c311 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -256,6 +256,15 @@ int drm_plane_create_alpha_property(struct drm_plane *plane)
>  }
>  EXPORT_SYMBOL(drm_plane_create_alpha_property);
>  
> +static const struct drm_prop_enum_list rotation_props[] = {
> +	{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
> +	{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
> +	{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
> +	{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
> +	{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
> +	{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
> +};
> +
>  /**
>   * drm_plane_create_rotation_property - create a new rotation property
>   * @plane: drm plane
> @@ -294,14 +303,6 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
>  				       unsigned int rotation,
>  				       unsigned int supported_rotations)
>  {
> -	static const struct drm_prop_enum_list props[] = {
> -		{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
> -		{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
> -		{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
> -		{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
> -		{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
> -		{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
> -	};
>  	struct drm_property *prop;
>  
>  	WARN_ON((supported_rotations & DRM_MODE_ROTATE_MASK) == 0);
> @@ -309,7 +310,7 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
>  	WARN_ON(rotation & ~supported_rotations);
>  
>  	prop = drm_property_create_bitmask(plane->dev, 0, "rotation",
> -					   props, ARRAY_SIZE(props),
> +					   rotation_props, ARRAY_SIZE(rotation_props),
>  					   supported_rotations);
>  	if (!prop)
>  		return -ENOMEM;
> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> index bebbb77a8f21..f000b10a16e7 100644
> --- a/include/drm/drm_blend.h
> +++ b/include/drm/drm_blend.h
> @@ -43,6 +43,40 @@ static inline bool drm_rotation_90_or_270(unsigned int rotation)
>  
>  #define DRM_BLEND_ALPHA_OPAQUE		0xffff
>  
> +/**
> + * DRM_ROTATION_FMT - printf format string describing a rotation bitmask
> + *
> + * To be used together with DRM_ROTATION_FMT_ARGS(), e.g.:
> + *
> + *	seq_printf(m, "rotation=" DRM_ROTATION_FMT "\n",
> + *		   DRM_ROTATION_FMT_ARGS(state->rotation));
> + *
> + * The result names every set bit, separated by single spaces, and ends
> + * with the raw value in parentheses, e.g.:
> + *
> + *	rotate-90 reflect-x (0x00000012)
> + *
> + * The trailing raw value ensures the output is never empty and never
> + * ends with a space, even when no bit is set.
> + */
> +#define DRM_ROTATION_FMT "%s%s%s%s%s%s(0x%08x)"
> +
> +/**
> + * DRM_ROTATION_FMT_ARGS - printf arguments for DRM_ROTATION_FMT
> + * @rot: rotation bitmask (DRM_MODE_ROTATE_* | DRM_MODE_REFLECT_*)
> + *
> + * Evaluates @rot several times: only pass a variable or an expression
> + * without side effects.
> + */
> +#define DRM_ROTATION_FMT_ARGS(rot) \
> +	((rot) & DRM_MODE_ROTATE_0)   ? "rotate-0 "   : "", \
> +	((rot) & DRM_MODE_ROTATE_90)  ? "rotate-90 "  : "", \
> +	((rot) & DRM_MODE_ROTATE_180) ? "rotate-180 " : "", \
> +	((rot) & DRM_MODE_ROTATE_270) ? "rotate-270 " : "", \
> +	((rot) & DRM_MODE_REFLECT_X)  ? "reflect-x "  : "", \
> +	((rot) & DRM_MODE_REFLECT_Y)  ? "reflect-y "  : "", \
> +	(rot)
> +
>  int drm_plane_create_alpha_property(struct drm_plane *plane);
>  int drm_plane_create_rotation_property(struct drm_plane *plane,
>  				       unsigned int rotation,
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
