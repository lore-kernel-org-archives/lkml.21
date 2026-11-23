Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449509;
	b=pPL9W1hbtjgugCnS8QG1vOK5uL2HNVfLYK0MsMnZO6thgWYYVBrTzDLszempTwmdufsN
	 56dJl4kBcYxN4hp8gOvmuLGdzRLfDeFJGPNgj+XrVpmJM7h6QKVMbHyrUwZc7Pa7/XYkO
	 /5q6Xrkxb5OwPrfvjfayDbdRVAP9U8rlhAPr1egVo4G3kw37Plb5XxMOMJ/nXZmysQsLA
	 JaXgxyUCLndWV0lsEe7/JAaRJhkM+69tDhV5F3WIVVlCr1ZtAu/8j2G+20/JV6Kx13vqU
	 /zFC0qiMwASeTIiwKXbigwDZdRGpmnBQ8oIIULcDN5rjzdaWQWge8FzSjgxxJUEMIJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=E7V1Mp8qcb2Pgn8vLfudKigHDe8jvtrjrih2NQ7mefs=;
	b=fZc8pkx7F96myEzHRr4KvHeXfDWKjT8jeMPUkkzjqA6/TXavjfuryXzFAm/1avrdB9EY
	 IzB1VTUxLe0GV/ne3wLq6Oe0Vm+DSyB+rZ2VO5bJzsOKgd0G18rPU4Ilp9m9C86vpLSAD
	 /4FwfT6yCs0qTxeApCbrsWS8FTnQiNcp+2+rLYcxy+UWnf+dkmSKu4ga1P9prCW0DyaAc
	 kOMgogKUByfEfzPfr7FGzSVpYfsTJJyNcC0k2V60nDBwCW53wemibvqA0PjSvRmyPE9J/
	 Ki0MMKq+l2yCG3ukykNWwaRzYnPmdaIQRO9Oy9r5XW2ezSXVQ9F32aCBfFZ3BRqDqIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pPuJJBV4;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182D9606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 182D9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pPuJJBV4
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so2778639f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449507; x=1796054307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E7V1Mp8qcb2Pgn8vLfudKigHDe8jvtrjrih2NQ7mefs=;
        b=pPuJJBV4k/NV/FpE0NEfi1sotg07S8b9f7yRjPUrhGmBoAdCgkPc4gwu6ZY5sDWQMX
         OSy0AlaIMQecASC1Vv5ECirBLzUED3rPJbs2Td9gKDnQGdZvJPcmVz+2oI8raDLi7+C+
         Xa1Hf5TVycK5LRLk8OmYWg3LtEZGFAHAe7Ns2JjUPmcKIzn4poXfMJ1raZrMoD7j0X9B
         WjzX431T6IOP6LLO0fkU2Ozev48DKYrJwzIobPriLpGN81Y4gJ1m0JAtasQI/mFTyQMd
         Mx+g4A+8diYSFif60jfVnE2FVdxFuPZKQVCQre0vWJJj9c4RzNmkIC41Hw/6Vir6KKN0
         Zpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449507; x=1796054307;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E7V1Mp8qcb2Pgn8vLfudKigHDe8jvtrjrih2NQ7mefs=;
        b=R2wRKHGtdtrpmTxl21QQSZMYTnLTBzmP/zVAJ3XV4YUyJ0diju9TjzpmTUlcUZ3Bzy
         fJQUGIssL0jo6q1kGthTyJsgILRN289GfQDhsm2GWwfzK5KHevWX0kiOWlHjpqctIApW
         T5Q/rvGiWcw2h91UXK6oPahnCH0idq0xpou6gHWxNIqnvtcn/fZmxCNqWluMGd+3Usxf
         6/QbhKFmh7EgZ0/CssPq+/Dlf0ith79C1ENRxq105VcmP2slO3LnTnMNtgSmPzw7cVEj
         hrgnzDV4VWr/p0eDGJwg8v7ZgLm+BYg+VlQVYkOTBrFeYEe/sKubjigqjAUgNtsKVRT4
         JZCA==
X-Forwarded-Encrypted: i=1; AL+hErFpFKr+eUM7sUy7V5oVciZ+JEHuk5bS1BLti1QWqywoBjJXnLxFxtlTv12kBJNUVSVJfEAnH4yBM7mj12k=@vger.kernel.org
X-Gm-Message-State: APuU4Z83/R7vviSPIZ5/68sihERZQk6oXnUXkM+AFUeX5R8s6VL5Tlst
	ASUh/kM8NsMakXJC7jezXDXJRctPOa0ybYrrZ91g0GHt2aNj5yvSfsmj
X-Gm-Gg: AZFdTZdyvY/Ja1apSXqG7ycJbXDbxXor94eCAuqHG8ZAl35M+8TR6nzhVOnCYCpACSN
	NUpzgIAd9FX1aXqU7Bm5tZ9Og1IAbyzAD5uqQCUvOpazZfreY8QeK8R91eeLEmDJZZCWNgmR+RO
	j8KTlW4QtPl9BYVsyEYZu8t8LbXFfz3dvm4vJ/V7OVoW13BKAiSd6rlIn9iEEeLnL6BHbZ/CnUR
	jLK85GUAsaI1HrePkYbeVH//P0Z1OmQtSoR66SCWtEV8DUobyx3MNE9V8d3jRtK8AHD97H+5dGV
	2M4tSpC+l1vx6dFSqtK5PpvWZDwA8BTuaOjZwRoWPFcddIPKcC1sJ+hTEMXPMxXZEr0u6EXS9kh
	xRbAaSqNfFvJOMmsRJ+PQqed8WBJUHrcglr8ZBlT2MnmdZQrZrTP1UZxA+B+rvHNpq5oOva6WCh
	hfDkvWe9mQC5J2MAAmjLA8TweNT9C1itaUIFLXTqpxrpCkdFtfKI5OWd9vsa3oWuZmIjqWsvCY5
	wNxO3TYMM/asy1Zivz6QY3YS6xQ5WjRETNpqG5yuiAvPsRJfBk+j41CZImmsS9nNMH/3fZQACow
	Wr1EQYe1V988OaJUw6WN1zpA4FKCxKOeU+LNE/zlyH1vt8K135kgAUg=
X-Received: by 2002:a05:600c:5307:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4bb888283d8mr232622925e9.17.1795449507258;
        Mon, 23 Nov 2026 07:58:27 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm175808205e9.2.2026.11.23.07.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:58:26 -0800 (PST)
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
Subject: Re: [PATCH v6 34/43] drm/vkms: Rename vkms_connector_init to vkms_connector_init_static
Date: Mon, 23 Nov 2026 16:58:05 +0100
Message-ID: <awRiOQv8H-nI8bpq@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-34-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-34-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:59:16PM +0100, Louis Chauvet wrote:
> With the introduction of dynamic connectors we will have two way of
> initializing a VKMS connector. Rename the current function to clarify
> the case.
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_connector.c | 5 ++---
>  drivers/gpu/drm/vkms/vkms_connector.h | 6 +++---
>  drivers/gpu/drm/vkms/vkms_output.c    | 2 +-
>  3 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index f5e99e77e84f..64d79b778551 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -75,9 +75,8 @@ static void vkms_connector_static_cfg_release(struct drm_device *dev, void *res)
>  	vkms_config_connector_put(connector->cfg);
>  }
>  
> -
> -struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
> -					   struct vkms_config_connector *connector_cfg)
> +struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
> +						  struct vkms_config_connector *connector_cfg)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct vkms_connector *connector;
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
> index 89d7f3a15d6e..61a8dd55d7f7 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.h
> +++ b/drivers/gpu/drm/vkms/vkms_connector.h
> @@ -23,15 +23,15 @@ struct vkms_connector {
>  };
>  
>  /**
> - * vkms_connector_init() - Initialize a connector
> + * vkms_connector_init_static() - Initialize a connector
>   * @vkmsdev: VKMS device containing the connector
>   * @connector_cfg: Connector's configuration
>   *
>   * Returns:
>   * The connector or an error on failure.
>   */
> -struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
> -					   struct vkms_config_connector *connector_cfg);
> +struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
> +						  struct vkms_config_connector *connector_cfg);
>  
>  /**
>   * vkms_trigger_connector_hotplug() - Update the device's connectors status
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 7783a2f6d343..2b0f7a8a80b5 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -97,7 +97,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  		struct vkms_config_encoder *possible_encoder;
>  		unsigned long idx = 0;
>  
> -		connector_cfg->connector = vkms_connector_init(vkmsdev, connector_cfg);
> +		connector_cfg->connector = vkms_connector_init_static(vkmsdev, connector_cfg);
>  		if (IS_ERR(connector_cfg->connector)) {
>  			DRM_ERROR("Failed to init connector\n");
>  			return PTR_ERR(connector_cfg->connector);
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
