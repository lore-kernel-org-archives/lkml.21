Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775782;
	b=PsnnXkSClFi8aBTtLXhuoow7KMjlcXEev7KYh8ZWaQ7e+dZH954rlYpwz+oymrnBvZ99
	 ThFednZ03v8AdRDuAcS3GgzhKXysLr1/dQopMYTAeSWuCmRoNqAXw7N8j1mFOud7GRNew
	 7Leuv4uWAHc0zUan8faGrjqvOKaJilidBGlXHjDyL7tXQTticQp/8XkDCK8Ub0QAuUZCS
	 iLlZBwUg4oD96hW9qtcWqnF6HeOrI5AJmk27/u7aTMnZFHlABy051BBW9UwCv5ffGwJN1
	 lgUKj6mq4G9XcPJOObtaRsrp5DhU1g1aucpbxasnqcWGdQDUktOrGAG4auLzIeA0nLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=iCTbyzZob8FXKeEZRFMgEo/F2TymOMg6sLKTzhBxgFI=;
	b=pbYwBzBGDOpXRRFnD3zorq/VS9syu+RBIrhbdW10BteaW8de8odQBWrm9jOiTSxtu98v
	 RaC+6N6W90w0emGMV+obnqXS7rPEIZnlvUWwn8yqlYSCegiu1fGUREU7ZUzeyFaoFD2wl
	 F+rI9mlDeht0j+bCavicyJ7T/B1gwYwIyKynPF25Lm6OQU3W6hRael8PXGYj3czFMxq56
	 6EroWHtK7mp6Mf7Bo4MQV2J5gG4fommE6iQU1rPNLVqKIhg3HsATA5wfI1bBiXx9OrnOK
	 iJPsPSCF+vf5WMRQ7mKy5uTBpL8VIUmWtYiTTzUGm2DVmHR3xniLxhLfvaqO7EVJASA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ik5G0Fci;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1218606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1218606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ik5G0Fci
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so61658285e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795775780; x=1796380580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iCTbyzZob8FXKeEZRFMgEo/F2TymOMg6sLKTzhBxgFI=;
        b=Ik5G0FciQpGYL334LoqWbf3SmW1Rn/ZTUFXdMWWLEK+D4HilKeCz/3t31YZCGkw1Jl
         eITA0U3xgUDxmPvXfLGO2azz7MM37/41jCZn2que7SSaPIm8O4vJzBC4JeetYAhIB2sq
         xTaseH5BGl6ALyfmCp+dfbySZ47UV+UQz5Hx5rIUzCtjw5iNrPsu5RomWst/jP3CHH4+
         0qFR/raZpMaJSdTKSs5/JSXiMAfo1GKXRLnSCrM8XjnXVhZjiof7tsTQqnohpMIHHgGQ
         ap6pdQFqtsnm9MFoUkgltL/qHtoGl5RlIvjNm+QJNK42yPh63KxDlWqff30kTL5KvuD7
         bYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775780; x=1796380580;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iCTbyzZob8FXKeEZRFMgEo/F2TymOMg6sLKTzhBxgFI=;
        b=MlTkhq1SixMM8KcSSgTUOwIhAtXX2hi1m3roi6CB2fiBWf5WA8rZMy8YLnDhv8Dv7B
         J1Y8NcBoKvMWNtcBRHEceWnlJmvO0d3sfPR6WKqFx7qG3bqxjMaGlpl9T0LGBXGX8iQg
         Z2B+k6BUqbJ3WYU88UxA+FAVdaQIA/5zs0wfoyN8suWy3JEHPkjWkoHnOVOl+LdJLUEI
         N5zx1LqMxBmy3b6ZxWrdidLCiKfaKlEry3AXkCZ9I5W3bbD/mSf2rEwnLaSYmyDJKKCq
         eoVDChh8URh79Da/HcgY5hqkxpJ80jXOpn5cfa+o2AgInN/BSozxPB5ighgUzyhingnH
         RgUw==
X-Forwarded-Encrypted: i=1; AL+hErGxuD6NKtSQf5BzusQXDi/wreMCpyv5MCjtKrtlG5WDKMNm62crXQl73oUwlPOA2/GSuvky/p83Mjje62w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/p4cZxGvqBfqZF2XNPrOZl8usmIeM++kw4WL4WGapeYStmr2U
	8wj/UPuAFwtkMrO8gJTRz/VK9NdiVW//yjkmyjf7lrzkZAAP3DjWyUa2
X-Gm-Gg: AZFdTZcFez6D/vSgmOrzqI/r+nnJ9/sDMQXakuCy3axTirwHlraJzYnK4L3wea5Lpny
	z0IyXqlxyi8L0fsiVTkow/NES0HNVIw4Cy62uNUrh+ShXVzU3GBuvDkrQZlbT6fQCmbI1OBL3Km
	yNnr50/+/hHGDR6rSqnzGxo9Jx48cjPoBst2nXHv3aJK6YjZqNs6UKyyY2kMsXFAlTXb8lSbgSY
	LUNny4juCuklzjVPiM8ESkDX4pT2qdvfH2IUXpEzUKrqYUVM1hSM8qZpodGMejxVa8uukfuJXZ5
	MBADp+tRoiak1mXg54TFBA/o1sls0ZwUiAW+h3im+D/srFV+TNHBjMwcyyCusOkBgRYmWJkA6Qr
	DW5BokCah7VGnL7sLGuN49j4WDBKl80g9fuB8kemHdtOZOMFi9cDRglcQ1xdp4nfaVMb/iRGVhE
	HMt+XBM8wG4c8OIkK4vXh1h9DbUPpGaXE/l6cBsYJHQgDH4333PLdkDG2ugQmNGZ1yizi6dCxhp
	aU7kBUNMxjwbpRmL6Z8PWDysQ4XAPq3dLr25F4gaMp5D+T+P+d+6C1E/O51lb/bdngNzPEsDszN
	cIxnpLBOtmOCf3Lag8gOcTtSQd+pfmA=
X-Received: by 2002:a05:600c:8b76:b0:4bb:b796:66f8 with SMTP id 5b1f17b1804b1-4bbb7966874mr14558915e9.21.1795775780152;
        Fri, 27 Nov 2026 02:36:20 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm670160975e9.10.2026.11.27.02.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:36:19 -0800 (PST)
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
	llvm@lists.linux.dev
Subject: Re: [PATCH v7 13/43] drm/vkms: Add error handling in plane config creation
Date: Fri, 27 Nov 2026 11:36:00 +0100
Message-ID: <awldBcp6Ci4FoQX5@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-13-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-13-21194cda2468@bootlin.com>
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

On Thu, Nov 26, 2026 at 12:28:56PM +0100, Louis Chauvet wrote:
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
> index 8cd4fe6551fb..c5d90f7e934a 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -421,13 +421,16 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device)
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
> @@ -437,6 +440,9 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
>  	list_add_tail_rcu(&plane_cfg->link, &config->planes);
>  
>  	return plane_cfg;
> +
> +fail:
> +	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_plane);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 95e5c3694742..8f038562afd4 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -314,7 +314,7 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device);
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
