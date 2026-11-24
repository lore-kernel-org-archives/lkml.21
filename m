Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529538;
	b=gUNHtaaWF2J6hs5orVFutEh9tf4bceqcYQ9UAtYCeMVzaekdYlWKo3Toj58SmkfYhBcS
	 7Kl0+y5YnAoCqNvdO4jXh+jO/UNKCcpOzkP2d462UyU/3dh0pJjY3xOHbbLHBl2ZLr8iG
	 /7QPefrRZMYVQqjStQEPE3SkbZEDV9uAIiLKn47kcsDeXP1/3l5I/rNWmwyD2Ka7PS9PD
	 lw3lK3/phFxiFtiW8AFkPDaitHn3yOgiR5JOQDFBAEKZq3R5nW5qcX93gltl697+BhlSq
	 vYLsL4NjOqscX40SZjXV09oqUYXSPXCkIIOJDE/2wBCGBwW/BclwhpluHmcaQwwA1lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=a2jTjAttfP/k6A0fA1FgjeitHCs9Uab3ZxcInWTSuWk=;
	b=ewLPPJsfM1CW8594y5Y9Xvq8CjcybDNJzzJxrbqXK5l4aEMUIrztk2NGDgXinsWUNGf1
	 90d3ZxsEib5fQkpicgGJElQ96t1TuIeDLJi5roPHi4k33msef2Juwz8aRz7Z1xF26Ws35
	 OjEbvzvTuJc+Mjar6+nEbiWjBAMrDfKZc/WArhMpX8VG4+SqMiWLAWT1t6mW2utEoI8Hb
	 QpXgvFBuSr+XgRJyUSS8eIcVIXix1kM21oPTFsJbti4DbaWFXC1wonGSlDLGHym2/g3Bb
	 3Xj0bPqjkWjEk8SfwWcyI2n41v6gvCONAg/JCIc+2qrztCbbfpm/l5k3pJUf0JnqxyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mh9/B5NC";
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84801606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84801606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mh9/B5NC
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c506a231b88so628335866b.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529537; x=1796134337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a2jTjAttfP/k6A0fA1FgjeitHCs9Uab3ZxcInWTSuWk=;
        b=mh9/B5NCDd7FTPewAQdCKu+NtCWx4NkbGoNSdHUS2Xm+2zJ0DEKjDHQdgZUX6Ofdiu
         gzBrJPPDx/OdrrKxyNNg7xMQCLCYcTUkWJOFSj3tlGo5A72moyxiU7QuJONFcYhqEgJs
         mFMtXYgcu1+B1+BfXfTZAO3xIA+VvmcvYUYYKsqmlDHCUFgkGsQTumkFcyeamtKkB168
         1oCjphr/iEF03J8z5od7m+uEXFydUnK8qjOMFCZy2yKyOxG3kyqfApoFnyzM8wnSwRZS
         YT0q/19V0X6qV/pOWLv4gHP+DjWS3EJGE6rChvrymuiXSBQS6lnEahqyFrw6OfeIg1gS
         y+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529537; x=1796134337;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a2jTjAttfP/k6A0fA1FgjeitHCs9Uab3ZxcInWTSuWk=;
        b=hB7mtfeUC+8F/w0wLjaorYotumlc3Nv942weThjV0yk/52yETouiDNbiCU4E1n7pTj
         L6MCTkkTx6qxhnXsxTptXKv54Dmar1qehMP57/WzgXba3FKZ8XmY4fGUFzve4QvYmC1L
         v5oHU5Aw5pcQGBuKJhbJUp5uY649AZeUysfccbAmwhu+maUua51xN49YesbQ5PdgGJUU
         1P2iwyo8mTGYE3Zaqp+ogIOmV1sAENZz7Z/ZxoqDHxDB8pfFsDqx8+xrKk6tJ7+/jf3X
         QUecVWiVD52/KkNM7qH7Utd8uy1JVCa/xCeeEEwY5UFtxyXSlLxJkmPqwaejtoJid3WG
         px9A==
X-Forwarded-Encrypted: i=1; AL+hErG2hpK3S5qiTC5ADjFR9Vo0novzjA8CgxT4D7bnD57rWibM26HkUGrOj7v4CdCjAFXgn9o1cHHkLWI5KxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cMjYX4unOXjIfRkZTeGSzAgF3rQ13T/WuYZMjblUa3fbWLiDu
	abewMaWHB9IMRQDthMom7bnkJh2AdayNeyh5aatoYa0TO7utJRNBFUhv
X-Gm-Gg: AZFdTZfYlbN3B/eaz8WCSKaDvOU/SIi2916mtI5/a+9J1KJCAji188usC7R1Q47gzMt
	GQ5D7aJWXQX2iWp4ReE9HbCHWu4rzKKpsTJXr9h8/Hd+1qs5da6bGUwEDvLXuTxQ1xtvao73Ls/
	0rPoHRfEUX1tkw7q0IlVXr4yjgySlzzVOCVQIWESTs6j4TpvhwrV+EQ4cV3QbuXFClYmnZIKpyy
	aOXjXyCis9lN2X6c925N1s6W1lFYSQlG2jIikwsO2J9xezk463NKaE59OT4esZZwwVAfza6vER/
	y5ERSlx8IOiZ1jGNXr4DxnD7+/ed+fw15aCuMbxW31+edjGxyBgVxTANAZlFDGz/LF24KYyGZQs
	MEnVdDFmDfL4ue7wjz+sKIpriO0UQ6aNfKJZNcVfxEuCWVNrTzeCSQbjlrLwb/M2h5+XR40OmC+
	ryn1ni1l4qmReUhe9UVXfPBakMIfQGh5xLhedAxQanhy8yN71oPkAsyAf+5+x6pEeXm4mfdA2lR
	uOs5BD3MZmqllQAtzXo/m9QQHIoCs31atHfJhJS3psjHPrfZKf7isFUqnoqG84QDyIyKb2haUAw
	nO8frU++Qj80G0ZnXN8pQ58kBHRvWm4=
X-Received: by 2002:a17:906:26cd:b0:c41:26b8:c49c with SMTP id a640c23a62f3a-c513a5db1d6mr934692166b.10.1795529536866;
        Tue, 24 Nov 2026 06:12:16 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8db37sm520054266b.35.2026.11.24.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:12:16 -0800 (PST)
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
Subject: Re: [PATCH v6 10/43] drm/drm_atomic_state_helper: Properly load default value for rotation
Date: Tue, 24 Nov 2026 15:11:59 +0100
Message-ID: <awWbIh471dkjKGII@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-10-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-10-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:52PM +0100, Louis Chauvet wrote:
> Currently, the default rotation is always DRM_MODE_ROTATE_0 for all planes.
> Some planes may have a rotation property, and the property may specify a
> different default value and supported values.
> 
> This is not an issue for "fixed" configurations, but with the introduction
> of VKMS configuration, some plane may only support 90° and 180°
> rotations, so the reset state of the plane was wrong (forced to 0°).
> 
> Fixes: ab2dd990f4ab ("drm: Add __drm_atomic_helper_crtc_state_reset() & co.")
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 267f44330629..13e848abb33c 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -32,6 +32,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_framebuffer.h>
> +#include <drm/drm_mode_object.h>
>  #include <drm/drm_plane.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
> @@ -231,6 +232,11 @@ void __drm_atomic_helper_plane_state_init(struct drm_plane_state *plane_state,
>  
>  	plane_state->plane = plane;
>  	plane_state->rotation = DRM_MODE_ROTATE_0;
> +	if (plane->rotation_property &&
> +	    !drm_object_property_get_default_value(&plane->base,
> +						   plane->rotation_property,
> +						   &val))
> +		plane_state->rotation = val;
>  
>  	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>  
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
