Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795763718;
	b=ECOygZFbkHshMI71dxniedNf/WQdgCre6PyVwdeci8Fwefe0c/IDzdZ+CuNAeaBUKdLN
	 Edfj5dtdzCuzTsVbELCMr/je0vM94Y2j2SOTMvh+R0Y8cJZu/6hugMRIon7p4+YILkVqL
	 vsdhy9TkvILbbZEHqs9mil+FU6hqIvAFrRJIqC+pKS5nUPbEml4asSfVHaXuRvHz+apOc
	 dukA+xqpdZBnmywDbO5h09cDrGQl0d2ivXtciS9ULX9DmlMaUddEPgk1Bo8OULdrgzZvn
	 oyCJca4ovNIAUdZjXVRh9FLcvQn+Jf5jV6OHm7i5OuwCbI0FCqT1NuyKmRTHNWH7hcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795763718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=wSJgjK+A00lNH/iVraNbWq5SwVJ5+VOU0GV4DugumqU=;
	b=kt3Im9xQD5jdwqnf9uDG4K/NRLd9n8MqNecEFPPpjS9oRHu6KA/4Zesiz7aKSIaGCYgd
	 G6RLXNmwKgcSzZU2gSNZMqI4jXmNfWLfFO4RX8JaDrdEHchtHzS3dfpEksFc+gcMi0wAI
	 9VLbdhqIVEGN1UCHICDLCKEtf9+nbO9OQhcf8t9ZOyfvG+85oVR5thyTYSW7EnZzLlhMS
	 +RT7ziPy75k+5MAtpyxRq5wIyxW1KkXQG/CUnfzroozG/PV7KbINl2BUit/LZ0evI0XzU
	 N9wsZBFTaKgVA5N1dvpg49aWQM++mU99406qOyECWQSjc42A0f0wih1oPvDB7yNjvoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cGce4Hb3;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25B3606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D25B3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cGce4Hb3
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491846221ffso6805155f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763716; x=1796368516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSJgjK+A00lNH/iVraNbWq5SwVJ5+VOU0GV4DugumqU=;
        b=cGce4Hb35o/vxcQ5vjpStXA8xJGlB1XuenFpeR0e9jbCyLye848Y0GUN3a83AJOJSj
         6Etjay4JbcYxW3GszOxqFZwo8mq3kZwemWj6tS6q2NZoS5oXoHaxD5XTMSIz6xTSgyXw
         aa9ltx//D4O3OTT2PUCN5FS8rjgz15n/2FaCOzETKnR4uSbI4YWL66cZ6f4pERd5bgdy
         2RYtnrJzlIKZS4Jt2SIn+QIu2O43fsOEAf+IoT5Ns4kk8PTGkH57kHoRbjI2vAf4ZCII
         JKrg7qoGTwi+eCO024d7FNDqhy/b9rVOp6raQ6BSVKP2gPsSm1U2h3JJZq48dnZ/JiAD
         xMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763716; x=1796368516;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wSJgjK+A00lNH/iVraNbWq5SwVJ5+VOU0GV4DugumqU=;
        b=Dzw8I2SPEN+4WeQENR7uLqzI2i8TEiVifoc7l+mUFkOF+sN2zjJmyagV35o12Wcpyz
         6H8lGy5Xww454ZZqZ6gRYI9pOowVxlGDeEK8k3iH0Xs+kNxxO+qR8uF8+KNgL2Liyyy6
         zy5NHP+UBTBk9ZDFiUTg8USGAFUWFLIvNhBO7nmK+VNxgGVCiwF1z1R5Ct9X675wSfjU
         k//IUyJusotC30eGC95bzFXHeFNk95WUo7kTqngvz85n4vt1g/HbDoUltDCX0oWO91HJ
         BP+vNo7MIxQ4TgtS002M999P5Ujrng1nsZy7Kw0D36qdkhFQKRcwE7l45dR569oeFsg4
         eWUQ==
X-Forwarded-Encrypted: i=1; AL+hErFZvs32br2bSx2izbI4xTwe/A8YdXWPKA0GczKP+58F8La3q1IQv4PqUCIZuGeMxitGO16S17b3BCmzB/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QGfUNHheXbhfNHgt/SSx1xSRA0xmAnpMrOzi8n1nToA6P7MrP
	NHGHDy9M36sX42QLMbA9QE01Ocm4oQZ+HdmplOPkQrwGKwfrZiB5OqOv
X-Gm-Gg: AZFdTZeX734EWRB3Dadh0j6m2AAiyc9lIGP7SmMsVBHzu2E2CwFZzzcYGME6MGiXslQ
	WdULOfdJI+b7j26LLb7U+H7mPKJgld2FV/Ur40IvIbAThm01xsLzY3ZtgnyspWNBgstqteVgZV4
	LG0muj83gXKtw3cY/0Qg6E5VejgSID5/P+WHgxZHPsrIDj2/sMv3gtw22VLcmE+4Ch7JcDvBP24
	5BT3Ma0S0QAE2wDysg3rOWn7qqMcujEuvSEtpn53PSHotA/OXsf4H8xtPTqoKkriZc01jc4gOuY
	ZiDpJSr3GPWod9KE5GaaS7tvjd2kfG1Q8RY9xvsEvGVgICYwfJ18BsY5G56Jvrzqxf6yznhqbk+
	+6EDkkD3LziwhVTtRK1jRkcfZEBJZjbxFMk+4Y5lZb7RvbjDJNfsJwI21I38FUpQ6gzvaeIFqcx
	rEXGF28FQuPxOB9kn84yJVDZK/irFBbKmdGNV5zHNgAcnXyc260ynyAZvzJhv9GWcXODIkp4dSG
	WBXXOmDazt7KfHJniUf4JgyRBLGA+3Tin5BUTczB7u6HjAwf4clvSKn53+80ysEMhnZAsXa+MrI
	PLQY2gPap/b/V1VIHT/9DXH3FMcqZv0=
X-Received: by 2002:a05:6000:2506:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-4abb47b0f64mr55547662f8f.37.1795763715954;
        Thu, 26 Nov 2026 23:15:15 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm44603961f8f.37.2026.11.26.23.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:15:15 -0800 (PST)
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
Subject: Re: [PATCH v7 31/43] drm/vkms: Introduce connector type
Date: Fri, 27 Nov 2026 08:15:03 +0100
Message-ID: <awkt6PBpmDa69llM@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-31-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-31-21194cda2468@bootlin.com>
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

On Thu, Nov 26, 2026 at 12:29:14PM +0100, Louis Chauvet wrote:
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
> index 342b844bfc6d..b415d4bf6edb 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -647,6 +647,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  			seq_puts(m, "connector:\n");
>  			seq_printf(m, "\tstatus=%s\n",
>  				   drm_get_connector_status_name(vkms_config_connector_get_status(connector_cfg)));
> +			seq_printf(m, "\ttype=%s\n",
> +				   drm_get_connector_type_name(vkms_config_connector_get_type(connector_cfg)));
>  		}
>  	}
>  
> @@ -1005,6 +1007,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
>  
>  	connector_cfg->config = config;
>  	connector_cfg->status = connector_status_connected;
> +	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
>  	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
>  	/* refcnt starts at 1: this reference is owned by config->connectors */
>  	kref_init(&connector_cfg->refcnt);
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index eb29008e54f0..efebb190ce40 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -150,6 +150,7 @@ struct vkms_config_encoder {
>   *
>   * @link: Link to the others connector in vkms_config
>   * @rcu: RCU head for deferred freeing of this object
> + * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
>   * @config: The vkms_config this connector belongs to
>   * @status: Status (connected, disconnected...) of the connector
>   * @possible_encoders: Array of encoders that can be used with this connector
> @@ -167,6 +168,7 @@ struct vkms_config_connector {
>  	struct rcu_head rcu;
>  	struct vkms_config *config;
>  
> +	int type;
>  	enum drm_connector_status status;
>  	struct xarray possible_encoders;
>  	bool unlinked;
> @@ -397,6 +399,28 @@ vkms_config_plane_set_default_pipeline(struct vkms_config_plane *plane_cfg,
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
> index bb023b5af4e4..84c49915ed44 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -89,7 +89,7 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
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

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
