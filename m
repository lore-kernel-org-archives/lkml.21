Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450352;
	b=esyvTjC1M5jLZfYxi2M3usX1Q7D4gkE305GGfIg63Nal1tofDJCrO9yaGg8nWG+SnqkM
	 BcjwYrMNlbzPx3HJM7JUjVMCxXs2z6Hi+vaIx6f3vk61wenLXg78/fXEB2cu1qaQQW3H+
	 BiBX1CXwOLZwYmho8HKjMQoG0HZd4r+xEXOuKDVGTqF0q1Nb/Arq8LWG9BjVyMaiRBQxM
	 gl59pEwwG2XNDbG6Uv4UbaPsKrQY3+9FR4AMJgAhDXtP60m4NfTm+4+b/2kFoPYK8eyER
	 9qYcQob/2+3Bw3LQa6SM7hCryoYqnVoTrocXHLRMmL6Z9aOCD23+aOhoL+1bm/YJ7Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=q8nYEbLZ2llq6j+JAuDJiblDLINgvbNEzxuytFyLiig=;
	b=J7Ox4efBN3fcG04mASxZSiMlRhI9qWx7NLpAWqFXSy2EW8NAb3qSDPlP0L/+auzjNEpV
	 eGK9U5IW3Bf+pD52YaNDolSvSnvRQCwZcpRa1DlAG2snjHrE/zCXn1jaTH6OW8XAlCUFg
	 Pki29AbrApZ5JqCg3kAOa4ZGOsly5frLIlQumNUPoZhx1ubVzsK8qvrh1XmcESBdMjENq
	 F5uroTTh79yAm+G1XQXbf7F2JlL7TEwqAfI6TG6ychA+slCdMQi4KJKP2taBNRDPvMZuw
	 AApXkXA2g3YxIKs1JCOUDBdqefZm7N4ma6wVypE/qzQEJwTZpO3uygWmyIJ8qcrf+DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lq6ozNge;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAB8606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBAB8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lq6ozNge
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so44892975e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795450350; x=1796055150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q8nYEbLZ2llq6j+JAuDJiblDLINgvbNEzxuytFyLiig=;
        b=Lq6ozNgefhx1Reb2r25IkR0ULI/2hbXHfEn6Yw5MiFTkBQ/9TM1hJxdSvIUAwA1iV7
         /4MJwvN2YWss7L2ydGbUFAVMBwDjNnCjUqqLW5F6gItVynWIZphrvBOTyN8d0VB7hu3y
         booP+MAOKaqh/zSVAfXstFCggLNmGiyIn+3UU13YABGdNcvn84hB2FXZ/Zjdq9lbjVUK
         FLHCqkvfVJOxJFwCwIVhSoZQmeP8JrrrLD//rL0aup1EXFiXPSRlD7t3T1l9N2+iFaZu
         Z6LmsJP/yjXumS/oMlImdWi43WN80bn1mKPX6Y4/RlZ5sHwqPhSK+RsK8JFCxQVGAx70
         fZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450350; x=1796055150;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q8nYEbLZ2llq6j+JAuDJiblDLINgvbNEzxuytFyLiig=;
        b=J6RtXZGGHv6m230jf3GG1rw+1ss6sPFM0T2T4ddNlHgDqpvAap4GCzdej4Y2Rn78cq
         u1/EyXZ2S6V/bQw6op+KMrksNKZ6Y1CM/Swmok6KIDFh0WvULO5EX9RZSkLAFJudDJc7
         9/z0BSNmYcGyq3StyJ5TOIH3atug9bmqFtNxR44EQhk9G1rG37hHXLvhC40SM72nyRyZ
         TVmOaxy45gJuoUv56MJZUpFS7wk8H6AWnsNEFWkyF+v3ZtzM22fhc6CWc3qG+xKq2wa8
         La3FHmEHdUlkgowGvx16LmE65ZNrovi2rOkPTRcJ0hEJ1i+DrUph+geIwZS+EYSK1Vzt
         WBYw==
X-Forwarded-Encrypted: i=1; AL+hErE+BsMT0YPeGpqxjjpCMPYcDzMBfeXcCGsuY/uknMJ2HpCF1JoK7KScFx+sCVC9x0feS1wR5l8f9r4Hyu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hh64+rpIWPKPsi0yi0bqJi6R80jNq1U6RQXSBGT1t0IAco4O+
	//E8VRlSS4jq/4byCiTAfm1sJmfFKlyVUU6SMZK5J++MfWcSAqZ4Gmru
X-Gm-Gg: AZFdTZfDcuJ1Z9RQFVmjLQ9fqPIYVAKH15S0h8vGH47aO0IcdXFEbJRvTjEQj8x47sZ
	RQOHOa906SlV2cwGM/v0JQH5jXhNQW1ULZckaPJylbZkQKtJ5vCPy1Oi/N/N58msFustYd4UG/f
	jTKURENRQCKnFdzzq3xEm3e/WFqV6myKiU/XVYlTxstWxIYmg5T26oQaFdAQ/rHi84eJc0ToXdJ
	Cs6mQMm3AUWeyyOUbH6uBTFj5fob9uITIxkZkjQq5XrRwVrFWlkK2WOWrJKNEYdY0NvUm0VmufF
	zwqISoSDopqKRk5FCEd6CnQtMkh86p2ADv5M4EmabdD2BT7xzx1lE/b3crm5tpk1x8qyo7t/1qz
	9sBJlGFRUNu0Rxxq391s+LEX4VDSSdx1GGQCohYVj6Ne7V4Oa+yXZ3LJbPqDRtmSHxrWG+HPpM/
	kgJ8X2K2gKVqF5qENyCIADazyi0BhkcnPxQHFQP8U0vkB2Fmsko7q+SjFbyUw59z+JYP0GcD4UF
	UMqYgSI3+0o70mlTJGBBfokWFOGaHgEHa8Ze5l2sNQN9Oe8F/pNnFAOblGkg/0iV6oZhNhJqJZh
	kHgTDx36kPz5uI68FSdj/5WobYBcO3fU8A==
X-Received: by 2002:a05:600c:848a:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb887fb678mr237295105e9.4.1795450350202;
        Mon, 23 Nov 2026 08:12:30 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm201819645e9.3.2026.11.23.08.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:12:29 -0800 (PST)
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
Date: Mon, 23 Nov 2026 17:12:08 +0100
Message-ID: <awRlnGwi30MkhfyZ@Oarora>
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

Reviewed-by Oarora Etimis <oaroraetimis@gmail.com>
