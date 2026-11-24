Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503902;
	b=j8J3YfURSz5/xSeBiM4/V7iE2bx+8z18vr19ru84nLSINAkcBDZy1zTgp2J2C6jODOA8
	 GhcptKAdnhIpfNvvxiC+fRvXzPkjEd7x2cXNJ42nrdxiZKqpNCHrinaeD187mMBnNRQ/U
	 QNJbxwbnWWMEu6EWDBEwx77YzDbkKcJmbaHutt1NDoAavvLJyDLHcwdzavBwZ0nVuBlTo
	 /A3IWdOKb4DYJWhrKmfnYGqR9BJQT6wjotqORYNRnpqj1TgusSW3GHozXeJWe47Ix+Rvy
	 9Tr7Vc27J8eXKYevEfjwHrvCOu7kV2vAEl9NndPUqqV0N+IwgIomeU0Oz371pjaFEAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=BIMw7C3LdL9dEcQe5UAN8K0d6FbiCwVm0msm5sc6v58=;
	b=ouh5kz4stcZa0K45jcaUQQR0ZiEvG7V1F8x4b+TiaNWFfhQNjFO4Pe1g3RVQ7RWInYtL
	 ioDh1W48A/LshM88fb8hYJu8HW1IlswvlG9qPylKpOJDkVd2mrwPUn+iGtMNMV7a6IVWi
	 TZ7LfClf2Iq/JDFIaL5BsYxmhchXh9oNVaY1L+7UWfwB3GZQtxtcP4JRitvWiEK2IeQjZ
	 CHeO/SrXjzAc08d8i229gIkzLAsEQHoCvM2CMcK+w4l7pzVrgTxE+H3qqgbcHFmSgAv0z
	 qGsUtjLhhHpL/8l2bcslg/seJokpOiun2+Q1zN1nlVmvDVAqAkDpQqD22HlA37mLdjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mO/mZZbu";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D8A606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D8A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mO/mZZbu
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso2358142f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503900; x=1796108700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BIMw7C3LdL9dEcQe5UAN8K0d6FbiCwVm0msm5sc6v58=;
        b=mO/mZZbueEgry9+LtmX+rpAkAbrYWNZLKMp198Y/yWZOYXOT6GgnfQMF+GWrUBCrHo
         5j2zb6r6TP4k5KV3k7zZ2GECskcs3dM7QwYIO/qNCA4CFyfJXhonVaq8Kn0BLoSm3LiU
         RJbH5UWbyHg1VHrKWkU+Ll+DtzyPm1zGiovDujH4FgcguLgpClTY8+Xoel/L2nEozEsz
         ntXyiClfi6iPDQvrTWRLIPD2nzqgAjaiS+bpWbLoiiTm5twO05w4BMAcONkBUVYoBMoq
         Tq4RQkP6KABDPsLgpKlVxyDjn3jTcvM46Uzb7Xbz/0kxOMPXSMDU7H6CscaM/dYtwdfP
         YdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503900; x=1796108700;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BIMw7C3LdL9dEcQe5UAN8K0d6FbiCwVm0msm5sc6v58=;
        b=rsStLyKZjBa2jFIOhnyI5pyN8Q5Ccw3cpIRy9rpxwPfivpk141tcPgphQ6OK4vIRDo
         9+MYbGBB4OSknFipuEoafoClTKBLMd9XQKC/7RkcsmuarLElPVvCufYiz0ItQHwUOfpV
         X8xcEkBl71R0L2GvebeXEaccLDLlI0h5t7RjKwaNahtuuQ8bhscLwHWGVwyjLV1o3dxF
         G9mAqAw/CqhaKhC/ZANpQXpu+bC/FdXXRuDGhB3GTPEIbpDCfBGk6pd5gLgLZUbD4GRo
         quKB5A/MB16jtohL4/zN0fCfEdOVNi98fi8Skp9Z26UtxLfmzGd4lTaL8vfbjhYAaoW4
         98OQ==
X-Forwarded-Encrypted: i=1; AL+hErFUBPJosp8/NWKkgOsLy6mvUZUpw4/L89W7dBFGIniSnkmRYISCJ6VHZm8NbupsLyYMyeORy+qOBfnRS00=@vger.kernel.org
X-Gm-Message-State: APuU4Z/McPwqDHJ7fNZ08FgrAkZPqhBY620VSTRfjiOXns3idFWRWUIZ
	lhEJTma/kRyn5TJTgM+BmLMdrjzmFa0/HISb6icg7bWwm5eMq41vFxz8
X-Gm-Gg: AZFdTZdFT+9AkcRnuNL1yvRYMORcYRCStSxlnoXcrocfHAfymIbD3faVh24SdXtGevR
	F/XqRnjfw+wmI1QKPSVR0M4EoCKGHXkAHXR/SzYwk5r85vembhdGddYOg/w6MMwSGnE8p3Q7upY
	5dbG+iy1AHiNuiDX1/UfWG+fN+Csy1JuzBkOIPEpdHMCYaBaT27k0rHkkGBjbDJKYh+QeH3MvWS
	aaNPQSyUW2zztmPYoHteOpTekvXDUwhyLdYPRBE+glXhpn7f2VpHOrpQflvxmZQ8BFgqtPPk+el
	fK4XcZVuaNVn5MRcBUhoPyUZQfO7UR5FSRQsKeeCCqxAcdRwgJFoVa9PqnCXTkJLa43CZtyr4dJ
	n4nhwHbj/nkDZPMycoeSzcnlxjTMlA7wbbuY8RNSO1nWuor2iJmafo0YWOuLVZJq+++jfWyDzhF
	J0Izii4+4ZJz1teBJHck/ZBJtKOaNH5z36mjibxRH0cPZl4EQwhJzZlJJzAsvL5gzUwoNaRjD4L
	IT6cparwWV/3vhshUcZ+A77Xe/qYz+S3w+fJqprfrf5re3hBEIenJN0R8anoOMiOEdG45S5amwY
	jalPXUNMCFr7uajM2y0RpVv9Lhm3jMIO7A==
X-Received: by 2002:a05:600c:4ecd:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4bb8881e81cmr291163845e9.29.1795503899706;
        Mon, 23 Nov 2026 23:04:59 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066f6e6sm173032935e9.3.2026.11.23.23.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:04:58 -0800 (PST)
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
Subject: Re: [PATCH v6 32/43] drm/vkms: Introduce connector type
Date: Tue, 24 Nov 2026 08:04:45 +0100
Message-ID: <awU0T4JnNWB7xU5O@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-32-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-32-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:59:14PM +0100, Louis Chauvet wrote:
> In order to emulate connector-specific behavior, add the connector type
> to the connector configuration.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c |  5 +++++
>  drivers/gpu/drm/vkms/vkms_config.c            |  3 +++
>  drivers/gpu/drm/vkms/vkms_config.h            | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_connector.c         |  2 +-
>  4 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index a43dff511fc3..257ba0342034 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -137,6 +137,7 @@ static void vkms_config_test_default_config(struct kunit *test)
>  	struct vkms_config *config;
>  	struct vkms_config_plane *plane_cfg;
>  	struct vkms_config_crtc *crtc_cfg;
> +	struct vkms_config_connector *connector_cfg;
>  	int n_primaries = 0;
>  	int n_cursors = 0;
>  	int n_overlays = 0;
> @@ -211,6 +212,10 @@ static void vkms_config_test_default_config(struct kunit *test)
>  
>  	/* Connectors */
>  	KUNIT_EXPECT_EQ(test, vkms_config_get_num_connectors(config), 1);
> +	vkms_config_for_each_connector(config, connector_cfg) {
> +		KUNIT_EXPECT_EQ(test, vkms_config_connector_get_type(connector_cfg),
> +				DRM_MODE_CONNECTOR_VIRTUAL);
> +	}
>  
>  	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 963e32d5adf7..291c0330bc56 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -651,6 +651,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  		seq_printf(m, "\tstatus=%s\n",
>  			   drm_get_connector_status_name(
>  				   vkms_config_connector_get_status(connector_cfg)));
> +		seq_printf(m, "\ttype=%s\n",
> +			   drm_get_connector_type_name(vkms_config_connector_get_type(connector_cfg)));
>  	}
>  
>  	return 0;
> @@ -984,6 +986,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
>  
>  	connector_cfg->config = config;
>  	connector_cfg->status = connector_status_connected;
> +	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
>  	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
>  	kref_init(&connector_cfg->refcnt);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 9d0a0087c9da..88429e01089b 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -138,6 +138,7 @@ struct vkms_config_encoder {
>   * struct vkms_config_connector
>   *
>   * @link: Link to the others connector in vkms_config
> + * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
>   * @config: The vkms_config this connector belongs to
>   * @status: Status (connected, disconnected...) of the connector
>   * @possible_encoders: Array of encoders that can be used with this connector
> @@ -150,6 +151,7 @@ struct vkms_config_connector {
>  	struct list_head link;
>  	struct vkms_config *config;
>  
> +	int type;
>  	enum drm_connector_status status;
>  	struct xarray possible_encoders;
>  
> @@ -371,6 +373,28 @@ vkms_config_plane_set_default_pipeline(struct vkms_config_plane *plane_cfg,
>  }
>  
>  /**
> + * vkms_config_connector_get_type() - Return the connector type
> + * @connector_cfg: Connector to get the type from
> + */
> +static inline int
> +vkms_config_connector_get_type(const struct vkms_config_connector *connector_cfg)
> +{
> +	return connector_cfg->type;
> +}
> +
> +/**
> + * vkms_config_connector_set_type() - Set the connector type
> + * @connector_cfg: Connector to set the type to
> + * @type: New connector type
> + */
> +static inline void
> +vkms_config_connector_set_type(struct vkms_config_connector *connector_cfg,
> +			       int type)
> +{
> +	connector_cfg->type = type;
> +}
> +
> +/*
>   * vkms_config_plane_get_default_rotation() - Get the default rotation for a plane
>   * @plane_cfg: Plane to get the default rotation from
>   *
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index 11e313440225..f5e99e77e84f 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -88,7 +88,7 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
>  		return ERR_PTR(-ENOMEM);
>  
>  	ret = drmm_connector_init(dev, &connector->base, &vkms_connector_funcs,
> -				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
> +				  vkms_config_connector_get_type(connector_cfg), NULL);
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> 
> -- 
> 2.56.0
>

Aww, makes sense! Missed colon earlier.


Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>

Reviewby
