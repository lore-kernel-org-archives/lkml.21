Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764108;
	b=Kv7KkGUEKVtEBYW1CrRFwscabJSXN2yazYt15AbyeHv6usXN4F9+eLGolVE+M/tp3b8t
	 f6e5+sRDHThJ3rFhe+SI4EnRmR5L1RL6dNdjeJFz4OEtrxS97XZWapqgqML9vB+gThObl
	 OIyKQO7sGWlgB/GmBMfeJT7aT5rQwF4c6Uh7qbTnEuT9U9VbiP6MxZX8KGrVTHA8MPYMQ
	 JnUC3Cc+XlLKT2KC8aeUSjW+5dVu/nIBLai/eowpQk4m+b/AsPyYGI4S6IlfYeMPhxx3s
	 6va/uKteSDBCS9xH6RnXmD3zm0Zv5D73iBC+Jzk0l60NVicqMGDDfjeUYMAdGlPfJZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=RFWIIK5B2bXDOJcKTvFKiX1dOLs0oT0s7HmTLBjeOw8=;
	b=5Q1Hfs0QTrBplm1KtfLSSojhXMSOxM5N2HIGKNxi6v9ve/b0IHMaFQAa96HwfUNZjFIs
	 Ew/DOg5+q8nhMiY4PHFMQEsvf1B9BUTPP832GdX1iOI0BJmaF7tbSkPcKRKqxn76VXInd
	 zxVKECgvOZldOZxQBadZ3Df2os4YngcJl+YEiIPCB+4uIikh9fOp7wVtj7h/zSvMl3Mga
	 MgSiAD9NPlm7ym6dRZdz/gdJzSFKAczeIsdwMUicmTHCBCALDDm2zqrHMx62Ibffmy+mv
	 HLsGTrrMnnagIwOvWWVDttjt8BNf/GYKnEah67lyPN17ax6gY6pZy0NGZILy++fpwpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HcztGOmd;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5915606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5915606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HcztGOmd
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so54565115e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795764106; x=1796368906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RFWIIK5B2bXDOJcKTvFKiX1dOLs0oT0s7HmTLBjeOw8=;
        b=HcztGOmdc5oyCKWNkB+7dO5kui2rNOSDFOUQ4TRMlAu1wzaYlaWENRe89k2hQleqas
         MD2bZSscuRXfFlRzXY77y6rcq2MUGZ0lG2vR+tWFEiVhbud9/JVzpMcVY/OUqCdQvbVk
         Ox4SdSw6aixLDn+axItLaAZzR0VN1Qd1slhDa1eIhBSgRGhItUhj2B0XFiB0iNE4W0r4
         oeR7h9Q+FLXLShDVveMqI8nxy1TrJk3B5AqySG3MxM9Y627DpzPQ0ycT/MSZ14U1UlNe
         kYfUn9PqEPGeMtzPZaBxa8b1hnJrXI6C7Odlv/3cAlghDtat+cxTi2aP2CJkLnGUPfcR
         a3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795764106; x=1796368906;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RFWIIK5B2bXDOJcKTvFKiX1dOLs0oT0s7HmTLBjeOw8=;
        b=wC/TaNjgD0LmLsdXmcUg0JOUDRYdiPIxytO4CsDxeLa+sXDp9aSfyTPtVZ2t9DsSVi
         6oIOtVtxNjauvxU2IDR0Q6UwWhXamHyGGTuoLq2mikequbiMLjXQYBVIaVCBCBEzaojW
         itrfXtRrFjreBfj1CCEtS9kzpAn7gHvy/7HeEB0+gEy7Hoc0Ict93ypkLHU4483O1QAC
         3Zb8It7zI42Or729epOcIvqkVGeEQajOUqwnAoR3ldIx1KzWwkwe9234i+lGMCabtEBl
         KuVnEMfvOQ4jo/JM6ZeMtUvUHl8Gxe6+XIxRGeInmY/dewBu02QDY9PEWjmzsijFtL16
         gqNA==
X-Forwarded-Encrypted: i=1; AL+hErHvpcikVmvqq3UCg8ClbRcxNdjYiVdMakYTD/RcCgCSTGwqy3XCeR5sfLBeAt9gbE6ELRlwx2eCPi5Y9gI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6GuYcan1f64jIuappYAzEc+BuRrY7GM47nzznb/TRQsEo5K+n
	6XdDeElNgeonkkCuobVKHwF/ggwMoErqWY0AD88lD7oCTqY2Z3PVnCZj
X-Gm-Gg: AZFdTZd1BZtFU6J18gXGQq8r0LfF7yEVyLVrzzc+Onwx0unDLMPX57A4sErI4IiCLX8
	k8xIgW96GeMzVwy0Sc86WjaZQQ8g+dHaZNufzFgS6bnLo3aL+bloNtjKcMGFkOFRAe881Onq2AG
	7VpQ3nDAUSPIosSLoHHnfxuAYiHzKUr4Ad7BJpnT9S2sdd/y0qAmfU6x3zejz/6LAL7tZMdWg1e
	l9krY2c4nntSe/zdIIXwwnaFFEbSYwFJLWh28QD2rg4jQ5kfoizcJLF1yEdLutUfHRmEZ3hcFOJ
	MtiwNP7FTUhNJYoVFiJYnnNJjxoJR4a4QZMM0/upUA50B3SRYG63p4sNPtjvimkFfB+Bsj5kW1O
	w6wAathFRCZTwrT3FkGkFGrCJuP3HaZe73jz/eU7I4zPmgI01bvOfV0GJHgNoEAbFEsWfRFtcBI
	c4PPUjjP5QfFqgu+IqLl4HXZ7gj+dLNKeiyQIg5WPOAnd0e05aw8b0ohkyBlWX+9B60/5CJLnze
	Xs/9+M6AdKbicarllfZ9PdA45WMddgh7cFIgFSfbF3vtdkbiy2T4iwVrGLK0Mq5PMu5BQiO57O8
	p76nJImtgF0O7Tuj9s123ZbPulG1SqM=
X-Received: by 2002:a05:600c:1d09:b0:4bb:73d5:ab33 with SMTP id 5b1f17b1804b1-4bb88816acemr509462955e9.22.1795764106011;
        Thu, 26 Nov 2026 23:21:46 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm885577375e9.0.2026.11.26.23.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:21:45 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: 
Cc: Oarora Etimis <oaroraetimis@gmail.com>,
	"To : Louis Chauvet" <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
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
Subject: Re: [PATCH v7 10/43] drm/vkms: Reset config->dev when the device creation fails
Date: Fri, 27 Nov 2026 08:21:30 +0100
Message-ID: <awkvQvRhbFLBKy8q@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-10-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-10-21194cda2468@bootlin.com>
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

From: Oarora Etimis <oaroraetimis@gmail.com>, To:  Louis Chauvet <louis.chauvet@bootlin.com>

On Thu, Nov 26, 2026 at 12:28:53PM +0100, Louis Chauvet wrote:
> vkms_create() stores the vkms_device in config->dev, but the error paths
> after that point free the device (through devres_release_group()) without
> clearing the pointer. The configuration then keeps a dangling pointer,
> which can be dereferenced later (for example by vkms_destroy() or by the
> configfs disable path) once the device is already gone.
> 
> Clear config->dev in the out_devres error path so the configuration stays
> consistent when the device creation fails.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 28b99511f186..4cbb1173fcc6 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -215,6 +215,7 @@ int vkms_create(struct vkms_config *config)
>  
>  out_devres:
>  	devres_release_group(&fdev->dev, NULL);
> +	config->dev = NULL;
>  out_unregister:
>  	faux_device_destroy(fdev);
>  	return ret;
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
