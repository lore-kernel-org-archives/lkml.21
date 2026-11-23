Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437671;
	b=HwMcJ3kyYvfFF/MwRLaoSw/hIO7345Dc6WobdDf4rvxdWxRQ5AVWASamKuO1aCtE+bJk
	 lR1hHu1b92nSahqmXe2OxEXn10zpoSuQn/hmgSxTe6gJtfMIyNuovi3T9MPozQeLkl6DT
	 Ie/SDXPIQzX/Y+UQYWWKFAVUvwgE4wkZXx2MM7FyoLhdsjyIftp6lrVdcpdtPU2v/9OIb
	 JSRATvMUVsytiUqK+ZHNDFkNxUzIbXUwSJm67rUOzGhTbwgIJUv4D+9l/yyJ2RDkJJAeX
	 eYl9S58Wy5iCqfcutLafnJP1+45gB0aZGma4KAebDHR9unztrvP812NtUyhFQjGOZRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=n3T4SwHjmz2olFUDLYwHC6yLLAFa2tC0UOBRI/f1adc=;
	b=JB+N6tPCmZ8rEFGLY3QBkn4/jWH5uvr5c1iMRMHQ/I3I+jxW9y2TD/z3i+siFzEuWDG7
	 JUHPVlCbYb1Glu/Pa3GxyPZBtpbjLaRYPQfsJlZr1Nlc1nLG9aQFr21zcGenNpRe06OwL
	 aEFW10C6oJFRS0iMdEvvyMuA1Ca/RQIq79ngVs040BsBDnt7bUme2Io+Y16NOuFDaOKAk
	 dMhR3m7O9Q/kMccvmH5o1YX98BRUaWoMB0k0kQiWiWW+PON5BO8nMSBcsjl04zE7nMjCU
	 a74HJXNfquUfOaimOfAckw/Q4DfspOdxV9u4PIyYNTydVYhvdHjliWVOyct+u6LJ4nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UwJvQ/zE";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F7F606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2F7F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwJvQ/zE
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so20531735e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437669; x=1796042469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n3T4SwHjmz2olFUDLYwHC6yLLAFa2tC0UOBRI/f1adc=;
        b=UwJvQ/zEJUosDi5F/d5/RBF5Tx5Bu0Cm4GZ1MRPVxDYjlPPgB/qghK99FcbQBXWX0J
         kVz/u7Xw9GE5yC0CMzetEoEip0gqmzNQ6NnGUikk6XNeP1x/yU9QhFSJ2MG5FTzD0cZT
         e/tq2Zepmoo8drkSqjt/xCXIqtK4u8/AiXcy8RPW1UStqDZfK7GnSSTOKXBF6qxiDovs
         ykzFmpg8pddldS1KhWXMaOE3pdu3jNcdyEPjvOqqUtAmPoB8RzS4+wIwEXNNlBWXBXIP
         rN3VGmkaY3eIp2EY0qPULcthluSoLQqhlM7BPXikjkuVRq0Y0V5QRvm2EaWZ82wPUvnT
         cHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437669; x=1796042469;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n3T4SwHjmz2olFUDLYwHC6yLLAFa2tC0UOBRI/f1adc=;
        b=BP8k12JJOhZor2DYKd9OmBGj38+TShXp98t1k4vDtJddj52BKiGxdWxcaK2QboWRQN
         9SpANGPbuq+l8rYnUlwqRRPXjdujM1YhoeLlQkkCtBUT942mk6z8vwZOaBHF2QHwAr59
         LjtTP5K368ZKBgdXwq31WPn7p3OsBclSwZsoApIT/tluDgBNZ+NaGn9H01R3muI/LMqH
         1C+QEFS/nuX5LCGi1/GiW7adYNCXc+Ql+TRX3WXrdC8+Qs5t4bQyZq2OAnAUVWKWt0hg
         Q/xQ1hfolL2kUJoJcgSn6aiN0JdYqOalb+aEojzWohlImk86o9ywkmjaLz3hcIKkIRMh
         eBmg==
X-Forwarded-Encrypted: i=1; AL+hErE6aEV9Wy0gxXkouDQSPHqXC6O4RoMXCd+asnGGu+sVO9afI4MhUBh7SRCWSu7v3AYd09LSxJXuXPF4nPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z82DFs29/wv3BCiMzGaiFwcAD5f7/dSqIIqPeyjpBXJW8tLfsDn
	DcUeS/FPDUJn6PlLZRLtluya5y9utSi89TTp+OmVlwY3yqESkkjgwxau
X-Gm-Gg: AZFdTZcFA/1ZxjvKdSRwSEwdUMOCQAI0TjQ/L3KHOtzGx71F2temX/FhYBJRWy3XjcI
	TolNkavFBLlmw6bGay++I1LTjpAp1lB5IwOWihsjKDGqsYS0KI8c9noWqI1crBJrzJfHeZqSYcG
	ul9o2Yk6HPx1lppwa6Lz7hDETI8uY57CeNEM5cj+fOzVs/a2P73UrNIhu7eHUi110hauwwvvNqR
	NTMVcE2PK+i8xdkIR2ZJZQ4HFqsTHvJYKGCqZ3gtBiX35vHeJgrstbAvNtxF95kXRofk9NgtjxH
	iY/OWeSXmdeUt3TNF4erjqknjO0v7Bi8ksXYu2MFAd1KA+zKddsymeLkSvXfw7tW/gxKNsjdlvX
	d107ndWLFxGe9OIeSRWPlpDKuYNB9tJMfi22ox7FYFpdUeiHNnWInngHnjN1zZdSvJ0pBQOJaI0
	dNariXWSh8cF4ughdQweC3pzb7hA7n7hg6cJh9SdzF1kV+j5n21HLOaQbzUBrAooICZtr+dd4lV
	0Jo9qU80nmVWbtGS/lTxoFnJRkamlA5wRcIDHmn3tY2Gh6uteBrpt+T0F7kw1KgRYkm9RurREKD
	soYClli/Zby6TwhoBPY5o3QDNUisPRbj1g==
X-Received: by 2002:a05:600c:3b84:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb888074bbmr277880715e9.12.1795437669058;
        Mon, 23 Nov 2026 04:41:09 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm269127865e9.2.2026.11.23.04.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:41:08 -0800 (PST)
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
Subject: Re: [PATCH v6 14/43] drm/vkms: Add error handling in plane config creation
Date: Mon, 23 Nov 2026 12:40:53 +0000
Message-ID: <awQzMoSQfHO47QgQ@ArchOarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-14-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-14-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:56PM +0100, Louis Chauvet wrote:
> Properly route the error path of vkms_config_create_plane() through a
> fail label to simplify future work.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 12 +++++++++---
>  drivers/gpu/drm/vkms/vkms_config.h |  2 +-
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 50cde689f482..03f2d0f0e327 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -424,13 +424,16 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device)
>  			      ARRAY_SIZE(vkms_config_debugfs_list));
>  }
>  
> -struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
> +struct vkms_config_plane __must_check *vkms_config_create_plane(struct vkms_config *config)
>  {
>  	struct vkms_config_plane *plane_cfg;
> +	int ret;
>  
>  	plane_cfg = kzalloc_obj(*plane_cfg);
> -	if (!plane_cfg)
> -		return ERR_PTR(-ENOMEM);
> +	if (!plane_cfg) {
> +		ret = -ENOMEM;
> +		goto fail;
> +	}
>  
>  	plane_cfg->config = config;
>  	plane_cfg->default_pipeline = false;
> @@ -440,6 +443,9 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
>  	list_add_tail(&plane_cfg->link, &config->planes);
>  
>  	return plane_cfg;
> +
> +fail:
> +	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_plane);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index de6a89819daf..49510a0957c7 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -288,7 +288,7 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device);
>   * The new plane configuration or an error. Call vkms_config_destroy_plane() to
>   * free the returned plane configuration.
>   */
> -struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config);
> +struct vkms_config_plane __must_check *vkms_config_create_plane(struct vkms_config *config);
>  
>  /**
>   * vkms_config_destroy_plane() - Remove and free a plane configuration
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
