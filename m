Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779660;
	b=cG3X/owD3xlEKVxbmNnmejPQ4eIkNDQuce66xckixd2CuDiLx2x9uKnOWZlNjLZkm9p8
	 pLOmL4M+R58N9eeHQfLLBIxtVgoruAWVorYR6Tp2tcdtLNNymyh+A+8zqNLhRg1IgwoCS
	 c6E8pc6TNdez+0xEB6073YjDT/fLy3jM/YmNaEkrmRjnrAkEIjndoKeD5Ka8QKwAfiz61
	 GRMW8CKv9kA06/GkGmPk/VQ3KvEq5usSDYSIqhRT/Ypri1X/BqfOfj9hzDuu3r/1RWiBq
	 wgT2DxOm+YKNRT41F8/nsnXYCJ5R5qnsCA7A+SapRYli2n4kR91XL+Iz7E2z6WnrETA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=bp/KRA36N8EH7qPrylVQjtX79x1i14QeIGDoVR7yhis=;
	b=5TDSDTiGQsGyBfQZ0+U0WvS0mycVx0WdK+6cLoVVj/JAcIhB8kLN+A/P3gjZ34skFIog
	 zgZKaeG6//42kRb4Bo3NwiFrl3qM/1rqDKQciT0x/s38dAQSpTMtIyrDRO0gt2F4vubU/
	 IrLCKuYvkabkVcNWJoIJ7Vqu44qByU0KrFLU0X4PJnsy+X3kPss4TqgfE61eTmiBPsfge
	 DoFGmn2aEivZEdU3evnQnNV45zHUFaUC/3+T/f8Cm//P1dW1lm40ZOZJ0s/gSgYdjNZEG
	 C0BoGV9U6fDyrZV1Qk92a00M5ibu0HyREF5RDMKnCzA6HVJnj0RctpgauaWUga5duaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w76lUYV0;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594CA606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 594CA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w76lUYV0
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so65470975e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795779658; x=1796384458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bp/KRA36N8EH7qPrylVQjtX79x1i14QeIGDoVR7yhis=;
        b=w76lUYV0D4/fpgQ7lJjXlr1jys2WZNl7dtEN7kZpf8x4waPSVDQ3xCU59ShzGHLJ7J
         DxaGd++kmDwn8bekrJkp8EGtNzSf0iu/BM/12/DEsZuTHrgEpnDuAHF69Eba9IT3G0lh
         I8GWsI0fbWH1QmLitKTQhBfdTR6eQPxbBtamuVRZNZMmNHHuIj2pd4V7NMESw0KtS9U4
         /UN+jHiZIa2Ui60zEKxQoxqwwmTVGEqIKViOB84s/65Ay1jkEW1PQLFC4LkujB2V1kEM
         XtTSfDEqU6LeaY/od/qoBE8wpVWsstt5voftAXO8BcW/s9OmTDJ9DxqdIiFLhQWIqfmi
         Cdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779658; x=1796384458;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bp/KRA36N8EH7qPrylVQjtX79x1i14QeIGDoVR7yhis=;
        b=PWrJ1wrWde+qq7xMZRqcGsUtCc9mY/yAKUN2VVNJfr2XqoyaDYgPtcmvug8t64AKyB
         KYrQLFh9valsEUNbrMiAbALpywJKRefdnoOVi0XOfXavH6jAixtbJzXvXEwjNijjyqND
         T50+2ub/O4jvk1UJJv286p9efv+RR4/dadRklc2icMYaKmjgNWYDNvvdVgQd3vUUza9+
         F7V3MJbRwe1F2SEYczrbqBS5zJoHdk9PTdW2f0waYmF85DQJElIFaANQFYUB1pDylzEX
         6Tl5ar50nxTKggo0LW7j/AwyCLEwZDeOoXTxzlEH8DQcUrvkpXjrEiwibenYan6/Nahk
         UZMw==
X-Forwarded-Encrypted: i=1; AL+hErGLjpwcvxFaAfYkH7tynHPRZlwOiNLuuOtwFMPnp+jU9Vg5NO6ajl/P4rjzok6/OfxAtE6qRftJgwKG2Cc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uR/VYw0yv6XTIVV9wTyd0NzTJbzwd0AyAKqQoUnvovDEdMTxF
	zl6hq1VYMro4K35zTfvlkQ7YOjwK2U+hpFYsVGCod7yUbQoZNdltenrI
X-Gm-Gg: AZFdTZeaVkMcre0mceDYkFpTkLvDMZTr1WTshSD2o40sLdbsqJTH6t/Jy88/yoN5t15
	XtpcekjkGuSYj3MxAvpXUiDU8iQg4aMrW19+nrOrW5+itA+gjzkUMLWXxyEh5Zq44stZQBppF0C
	NfFat6UwR4QlrKgK//Wzl2X8VAmOqqvVJjo1fuzu4Id3yuTGUhHUvqJFBHTPgAsBO+r/ydu+NBz
	TVrCAaZXpiMxPywYVmbyxbS/8/2TGd5rgUKJ4yKZnG9k2I4eSV9ZdmFOylNMluRyuV8/cfX2CWy
	rg5+EgvoVnNuqGWMY4f4RCGxrI+xO/5Hj4r3BFD/bzQo4dLxi7nqE5j5QzJuKu7+bbplC4PgziQ
	xtN8SSjScsr65jc99eW8o5pkS7sW2AsoOnZ6Z13hemnvpuhgVoK8TDGz6MkV9eUbo+J88Ly1pDL
	b1YbOJ6EFUFKwU1xIQyHCE/drAfSyq7NPWGi24AX+sFQ3Ce1gcNcx/EN0XEmtYJOQkHYg0v7Oq6
	JbRleSo3j8bcwC5VDNTEW2Y59ePGuI1OugTKrhQiOfREE5NihoUbMx7aBm04uqXz3mFSj7EF/Vf
	lij6CrfiqKd1CcSl+Qp5tGwkeUTGqcw=
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb8881c5bdmr504767125e9.20.1795779658410;
        Fri, 27 Nov 2026 03:40:58 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm47752163f8f.3.2026.11.27.03.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:40:57 -0800 (PST)
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
Subject: Re: [PATCH v7 18/43] drm/vkms: Use plane folder name as plane name
Date: Fri, 27 Nov 2026 12:40:44 +0100
Message-ID: <awlsJLmNiJhyZH6Y@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-18-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-18-21194cda2468@bootlin.com>
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

On Thu, Nov 26, 2026 at 12:29:01PM +0100, Louis Chauvet wrote:
> The plane name is now directly derived from the configfs folder
> name. When a plane directory is created under
> /config/vkms/<device>/planes/, the folder name is used as the
> plane name via vkms_config_plane_set_name.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/ABI/testing/configfs-vkms | 3 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c    | 7 +++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
> index 26e7f81b5b7d..55e4183046ec 100644
> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -98,7 +98,8 @@ Date:		Nov 2025
>  Contact:	dri-devel@lists.freedesktop.org
>  Description:
>  	This group contains attributes corresponding to the
> -	plane <plane> of the VKMS device <device>.
> +	plane <plane> of the VKMS device <device>. The name of
> +	the directory becomes the name of the DRM plane.
>  
>  What:		/sys/kernel/config/vkms/<device>/planes/<plane>/type
>  Date:		Nov 2025
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index c57791df72cb..bbfc0c8a922c 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -375,6 +375,13 @@ static struct config_group *make_plane_group(struct config_group *group,
>  			return ERR_PTR(ret);
>  		}
>  
> +		ret = vkms_config_plane_set_name(plane->config, name, strlen(name));
> +		if (ret) {
> +			vkms_config_destroy_plane(plane->config);
> +			kfree(plane);
> +			return ERR_PTR(ret);
> +		}
> +
>  		config_group_init_type_name(&plane->group, name, &plane_item_type);
>  
>  		config_group_init_type_name(&plane->possible_crtcs_group,
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
