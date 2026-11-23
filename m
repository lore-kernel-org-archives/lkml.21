Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448202;
	b=Ens2V8vViTSuc9X2t8LQQA/RPoLT6AX5k9w+G3WpUR3sTiBV6WFfQk1g4ItGHCu/CbLJ
	 EYUvf9Ls0KB2DCGGVwzNHW9NKQ2tDQPpIMdRqgt0hyFwF1WhwWQLsQ5TI7LqOOiEgEjHv
	 NssV3KdVxPKBYaSS8zM3dlyddcNj6XBhx4W2Pk4bKWmuuBosxoK/k3CavMo0A1wRKIrrn
	 NMeH29irulotpIWgrX3TxOxJj0Sme8GnraU4FiVzN0V2+ABaR16vXW9KiQzpDiMyvmEz8
	 ievtUejByUPlTrJr5TYr1yZsdAco2nJO1KLwAjHqtZNFP6q4Oxekt8qhw+HWIUrAr+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=iMj2t4hUan0LrC5voc+bXHqikDQMoVSMga8MiF5GiH8=;
	b=hRSwhi2hfhy+wmwRE2ap6wG70KxY9KldFHnFgSvReowa5+miMnWBBRwLnJv7qOFppufY
	 5yND8YnuMbQVT+DbPeglnXBjRIv16/EYS4B4N/23LYF1W/RbnBHgaY1rah95Wg0NPP8iM
	 DViHRrQtFMhtlCfHn6iPuJQHVXCFrr4F19FvR0ip0D1frHURR9UrU1s3Yb/XwQwVbebpW
	 7mHoXlz9pdsAlzMFO1tCTYJzysho0hEG+6lyRXYqQ+3LWlqTq1InvfgjF+CCcTwaRa5jB
	 ndqeRNhV7LEZnX1hcnotgmpi6+c5P9payYtL1UdlRUPvPRy/YOAhu9Cw0ntop4/+mHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nWFZkm4v;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25B1606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F25B1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nWFZkm4v
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so15316275e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448200; x=1796053000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMj2t4hUan0LrC5voc+bXHqikDQMoVSMga8MiF5GiH8=;
        b=nWFZkm4vqoVPoLJ5bAeqhCFLP/tMnyvJhuj/5vvKe4j5l0OYyDIp3QnpbxR774+uUA
         cMSqdoyHbh2ISX5DOL1Q7rK0RsOYS1sPmQZgfclXSYAK5DTgR1SVx0nBiqzi+vVkudgg
         HrOFDUz3zsFRUvr7YppSpn5CpWrQKEuaz2LxjZ4PFQbiU+AZxKKWS1bEUMDPHcYGqv8Q
         VUR3dfV/wtMpc7EJ6MZU4Z4UKukOcZnbgYij9jFOg7IDeGqq6V3WC830bPd6xQ8YYVOZ
         U5gbJ6bznHFjK6Ss1AjwX/krdJ/TBP1dINwPVOO/PHu5YVWD5kJresWc9JzDbcGp/jOq
         bJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448200; x=1796053000;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iMj2t4hUan0LrC5voc+bXHqikDQMoVSMga8MiF5GiH8=;
        b=WWYAZA8aWzNdkU6ZCLCKJIzZAJxmCc8PvYiHToYVsghmdEA6DKiOABlnby0zD3UqE3
         dZo3EnzDpsv0bg/Eas7QpQQRVjjMwXCcIzJNc5O7j0IFLL0JmtV94ytHPH2Qbn4e+N+l
         jxfdTgAFXYI5/FcTtAxJ3V6uXOsZY9eT7INavGCEOZMZbBJ00OTyUiZwSyHukr2cAOG5
         V92d7je9g4hYSS7XkE2oATGcoR5of5xMdYgzzhUn6M0bP16CZ1aETuJK0CB+ZKzV5Dgs
         I9lvaCYJArZFIevied4KV07/93kGC2ujN4UMfTliFQR+mjwwYNbOe2gyoOGrAy/HmfvW
         aIQQ==
X-Forwarded-Encrypted: i=1; AL+hErFPMyve2Fp6KO44sU1ROEQPZw9e0oJYPAufMhcQ890eEtMuQXrA3jHGzd5o/dY84MRkx+vOtGc36/iFu4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NdvBadEuL6CZH3gCtWu9MC2R/TIxHCbwEcbEkJczdyTzwl3yd
	xsAesnjd6a7tX7kgGJqP+GKAtBjUakTXYJm+LLF+S2r6ausnA9pvkxYh
X-Gm-Gg: AZFdTZepHJe7Q/PSER40X/JmbuERwPScJIgoBbcWbxhZFQL1RJ8sbHqwjNl6hgbkdfd
	xZgzdnUp3LomAErpUKiy+/wE3ONH80PosX81+uEgpq+jH6Cz6QGL7Tuz+ojbKnPuUOmafgaJ0ZO
	2MZoSPK+QYCmVqOyeDrTssxqWDwDWtrV7Rc8IyhuR71gsxpAqxoHVUijD0XDIhy2TfavP+kjPvd
	c+8JJJ/KoArtJ5zaKYY5MKdKmyPPpzPk31dF9Tv7k7MqtPm0VSTLap5EPrxnJtlRP9B5VYTCRTx
	vlLOxYIbd8a40bFTBQKcOnXietsLLafdascA93WPdxKoWQ5PwrQqNzAl39vHrO8IeK3lXr2HBPz
	TfoYPheeVnHdYOLKdDo1WkoloVIqt7/tvamLTCb76Nd6XpKsEUFPR6UqV7adLy0I4B6FbKTZGpU
	/aWwYHW/FdXyAfo9tpX4JvQ4Fz9c7KM7YaOxZc+kZsiIQRtfAEiKJ1JQqCb2PoPZLeTRxQvaFXO
	AN1CahX7RS9i6zVxYghowoH4DcymoXcaACvKjfoNRvFC0+hEZPeqGIgmq2QCWB868WAz3UCeiyJ
	YivIAScjbT5n1C2ch4be11YHv6r2I6/0nA==
X-Received: by 2002:a05:600c:3b88:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4bb888078a8mr280286605e9.11.1795448200216;
        Mon, 23 Nov 2026 07:36:40 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm193318255e9.1.2026.11.23.07.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:36:39 -0800 (PST)
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
Subject: Re: [PATCH v6 19/43] drm/vkms: Use plane folder name as plane name
Date: Mon, 23 Nov 2026 16:36:17 +0100
Message-ID: <awRbCaRRole752Pk@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-19-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-19-78ace90f4fc1@bootlin.com>
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

 
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index a7ddcfd4e86e..3a1a34643cce 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -375,6 +375,12 @@ static struct config_group *make_plane_group(struct config_group *group,
>  			return ERR_PTR(ret);
>  		}
>  
> +		ret = vkms_config_plane_set_name(plane->config, name, strlen(name));
> +		if (ret) {
> +			vkms_config_destroy_plane(plane->config);
> +			return ERR_PTR(ret);
> +		}
> +
>  		config_group_init_type_name(&plane->group, name, &plane_item_type);
>  
>  		config_group_init_type_name(&plane->possible_crtcs_group,
>

Oops, looks like this leaks the plane allocated by kzalloc_obj() above :)
