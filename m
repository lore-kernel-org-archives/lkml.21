Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512520;
	b=TUCFX9HvPz+qmHhLcY59y6BhVrSuFaJ7qFfMR9ABASzHD5Qt75fdwVhWEorPXXvwEVcn
	 52u+sKuUemLAoRAxstzEVenVjyjT1QAJXCp11e73haEBma9AP4ZLXSkrAXMizn0e3KZxl
	 VO8QLFBz1rTfyzEY/p0PtWM6k7nN4gxsCY1LxwPU1wkQCmeenKOMistWa+DxDmMdYTLgE
	 anZhlu4ox40tM3nN3/iproKGpx3H8uiaqJD69t7JIMGxEK5WV7kcoNdeaKHI3M52XelDy
	 Q4nEyWRwBNtBPKUddj3SADMlRyAN2dE7DXC1nrwoU75Tm6HodRz3yHAKcphbGBSP+/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=CzKgPvM79v6jsfljA7yM9iAbIcPsktxf49AuQD8Felg=;
	b=29SfFGp/ax95REZdeUdQqTWrLugBA2isOQSy4dFwrgFiJD5Uaea0Y+2DE1csbJsUlCXj
	 RucUq5LqQqmLm4B2PN/C3/cPcX6GfKVgyH++7Mkhs7IxzuOg7gi1282kIW2JGjEKQYFnS
	 2QNurQokMBebUNpxEUtlIYAMEutEku8C5ep3EtkJ22vpAXl3w2AII12yy4lFHO6mlTpvL
	 ptZrgPepOnmCgtN1t2YyQAsFqF8bb7JtSSmjOT80F7eNImyRz2NwYeM3wgWOyG7eu2XYu
	 /H9ysFzaoUk9isHZoZIpXHyeLQyb2Cw+318SyTx5+AA+z80CTL3mCfZR9pY6OXMS/nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a5KW4ryk;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AF8606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82AF8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a5KW4ryk
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so39011255e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795512518; x=1796117318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CzKgPvM79v6jsfljA7yM9iAbIcPsktxf49AuQD8Felg=;
        b=a5KW4rykzmoBF3wpBKu6drmzIHlRb0P4hCdIPV0t6U4Zfn6x+uBKAXogFnZn8p0sYK
         keE5gJbm0vr4PZx4QFkVG9HDIi1NMNDvnJMaGTUk/LN6sdCX1XWI6DXDNgMmST3r5EcF
         aVcmcl1tSvUV0sWwqer2aUv7IV/7xd3ObJ0LC4WO08KD2mcGGdHq59CKdvRETcHxLJPJ
         r1hFIg2P6qeQYVO1G1D5NTlvC11jsCGBHLHTd0EMuQ+tOMueed7B75XA5s2jX6wEuMHy
         vsch2iLxmQG/7vRjqtyqcgcJloEDQ7SB2dKEtHQTdGRNWmO+kvhlWRdk8wtdiLdphFEu
         wPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795512518; x=1796117318;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CzKgPvM79v6jsfljA7yM9iAbIcPsktxf49AuQD8Felg=;
        b=xI258Oh/Q3kaNIIuY3vHmje/Gf7RyUbWNBcC+EbW9XOvR3vbM+6eDnN2D54EdBYS2K
         CKETzzUCxqzMlG0VbhvpWlXnkGVC2s/+ZUC+KoHvUQz9767ooT2JNeeIKH9IdL/ryaXI
         Z2BrqaAG7CdcGtpATGRzcXnTVE0UTyfiznX7occGy7NbTR4XXvO7M4rH7OrD+oHitr4t
         3RclpwPiMGgOxQD+cO9sUYC1xYVcYH313lqyO+nGPhMt4Ctz3evbvrBU8wIixcRjdCcP
         oOE9Pxv7dZR3qGNdnSpYqB5aQ1ktJ9GR/xAW7+t6UVnjwSB5E4evTGNRKw0tmmPLMO1s
         Ib9g==
X-Forwarded-Encrypted: i=1; AL+hErFlqJ8MEVObIHHaJtGl+0dwd0yVmXn5+A9wGYZZ4tN8yzkgefR7tJzk7JLh2hrMFdubwycMXV3ubK0ckHc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yPH8RDyi3Z1Fjo3D1nYfubmlhQ7ZCyztVdvnp8GCnkpWsrFXW
	ZKcKiJVvsPv0Xex6YAf4Ves77QUy3EIrZG+Y3LEKHQyXtX/YT+mvD/sK
X-Gm-Gg: AZFdTZfy/dRtpTXMhTGbea6BJ1TBxVZiGzspWKsic0kvx/P9TMpmNU+IPyBgDf9aUbe
	zaFZrgfC7UXjEalZ6OwfqGgR/dAypaO817skQOd/2xsOhAFx+RUDPyXH3kRv9AJpsIOUFuR0beO
	V6i2mn3EMKG9P59s4faTl0sZtFVCVsdSlj3gbZRrFe7yykKtoJHH1CAjGUlwnYwZTDXC4SWr3hA
	GMyfGtJ5VCp5c2x1y5HFaGhKJ4+6PbHMugc04quFbb9SRoCW0kaoJnoCo0Zl+nh33LOeh5KAHog
	P0cRWQCqEFYBa2drC85PmCkdLxR4HWmv6m+oWA0sCaFiZWOoyAV+cc7mmB7YfRACJNO4EUp+C7J
	ME7q1PdJ/ZwdtSEBQQfZ8cNSwpoPzWFzXK1ve+3gGOYVnQa/o+nfUuecnWgG/B1xdxsvl3Tk0ae
	AHXv1Mj4PqPMeQOioL7H5HVaNq2IPXA16HKzMp+tPRy3jzR6IYqew37q61Ye4AFTIRryhBPQTep
	iQ1d68Cm4zS4hqlQiQ2XkaJ5h3RATxRSkRnpe9pNBYB8T+S5b16fgd64lz/uFPkqjJEZD4msajt
	MeSFKTKZE1dWXLgIzvyyRHT6HPg/ibCr0g==
X-Received: by 2002:a05:600c:6749:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb8881099cmr275531005e9.12.1795512517667;
        Tue, 24 Nov 2026 01:28:37 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm28275775f8f.11.2026.11.24.01.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:28:36 -0800 (PST)
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
	llvm@lists.linux.dev,
	=?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito@redhat.com>
Subject: Re: [PATCH v6 04/43] drm/drm_mode_config: Add helper to get plane type name
Date: Tue, 24 Nov 2026 10:28:20 +0100
Message-ID: <awVWbUPDh_7UHoay@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-4-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-4-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:46PM +0100, Louis Chauvet wrote:
> Create and export a helper to display plane type using the property
> string. This could be used to display debug information in VKMS.
> 
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 16 ++++++++++++++++
>  include/drm/drm_mode_config.h     |  3 +++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index c1e993a78702..0d814424c698 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -419,6 +419,22 @@ static const struct drm_prop_enum_list drm_plane_type_enum_list[] = {
>  	{ DRM_PLANE_TYPE_CURSOR, "Cursor" },
>  };
>  
> +/**
> + * drm_get_plane_type_name - return a string for plane type name
> + * @type: plane type to compute name of
> + *
> + * Returns: The name of the plane type. "(unknown)" if type is not a known
> + * plane type.
> + */
> +const char *drm_get_plane_type_name(enum drm_plane_type type)
> +{
> +	if (type >= 0 && type < ARRAY_SIZE(drm_plane_type_enum_list))
> +		return drm_plane_type_enum_list[type].name;
> +	else
> +		return "(unknown)";
> +}
> +EXPORT_SYMBOL(drm_get_plane_type_name);
> +
>  static int drm_mode_create_standard_properties(struct drm_device *dev)
>  {
>  	struct drm_property *prop;
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 084517beb924..545a5b684acc 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -30,6 +30,7 @@
>  #include <linux/llist.h>
>  
>  #include <drm/drm_modeset_lock.h>
> +#include <drm/drm_plane.h>
>  
>  struct drm_file;
>  struct drm_device;
> @@ -1011,4 +1012,6 @@ int drm_mode_config_create_initial_state(struct drm_device *dev);
>  void drm_mode_config_reset(struct drm_device *dev);
>  void drm_mode_config_cleanup(struct drm_device *dev);
>  
> +const char *drm_get_plane_type_name(enum drm_plane_type type);
> +
>  #endif
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
