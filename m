Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529299;
	b=fE8HI4TnN5F1gYXKkuw13NKvl7mynUPBzbOgm0Uut62b2O2oKUhbgcnDKCjH5PvumHMK
	 Zd/rqKMwtEYUfcxg1wxqdKXtyv3phljGMZczooO7WNxPE7ltWwlrWZQk6j37nZ6QEdcyg
	 uTQdtJcPQyPw9n7CVlEC7VMS6iGawFEY5H9BbbuSEJ35uTgqovs21a17cbXSNWyBaEBSI
	 GMfewY9DRVr+ehkkjfX1uWs2QkixW0vrnuEFdiObY9QeItnoUncd/nZdl/CIVrrQyHwVt
	 WPwKxjDTAlgDJzyvLacuN/jrnPV9jiYCsl76/71w8DMZNb0oqAD1yTtgC6UoHzLWKZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
	b=wfKTVy7UMyn1+bnCt7BDCsvtiQtAEob6AQypzOKqtWW4vQLxATQuLEw7ozWXizSm/4T7
	 Xy5efOPJaAzc8V7m8+a/Fqqd1AFfnQUtRzdGluvkPdL0Phid2eBEwd4IIcnaVySawIE1S
	 ipVJGVof4FzjzzfeyFz4ClR3TO1Fdh7gcKcJtbRb2wY40UbB42csDOExTAkHSvTsZvjDw
	 5O8cD6ZXuZcEvZ0BuZZYrO80pjR/9+EwclxTY88lalw3SEZ8JJLqY2C/NlSWmqGXm3toD
	 ui1SDTeJoTer2W9ChzcfnIpJE2GtooWsO6Gc1KOCw39uqCJ77XDV7yN60KKKHg9+oTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUbEhfEB;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5A9606D0C1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C5A9606D0C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUbEhfEB
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50aaad19fbso505799566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529298; x=1796134098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
        b=lUbEhfEBgzS6vFKGKFSIx8aFwnOpFSyP2NjkZKphp/89gyhsGsd4KNqI3I2ZIadB7Y
         m31JgrxDn/SWN3+7MrtULm0E1lvbcRXSW706YN/qayL97IqY89aMDyMNV+40wCwqpOe5
         5P1PbnE7FytUI9lsOATmcCsVTQG4Whip9zIuGQpApc9LgCOrEM54le1YNwAx1QUvfJt7
         QWV6D9Uze300EOVBp7eY77vVITtsacOUIk9cR0y0vq59vWtouZarXBeopX7qB8Hv+vmQ
         ehmQC0vVU7dlTXHShcoFze6qcdOnyXQjJ30Wqdw32dXgwLyF2RYisBNS8b2GC4cbZVRD
         AHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529298; x=1796134098;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
        b=rRDrD1l7Tn2miPBBz54wR4I2FMfN9cxufqyqV2PvrGWCwqvn+qonSPJ6hekQouRXi5
         8yI6N4P1/SpQofYvJuN3rOE0kF3cfUvk+AbOaNRK2PPpAhpEcqXPv0fujlka90RqGjNj
         24MH1m+ON0NWi2Tij/Eg7nk98rYwz4gD8dCWWxATXm2kW9fZ0xcBX3Bnu/gzFQ2MgE8o
         v9QLLEhp316GgIFhxrOBWcHCIqz2rLrSg7e2YJ83KViJ1vBDmlC+6nAGyIPzC5fcgdlJ
         ZUObbzT+1WP5HoTZ7LR6i7dLyg3hObgmIG8uHZIDHRkOWhpB+j8yPiejXq0QVmaXxII6
         mlmg==
X-Forwarded-Encrypted: i=1; AL+hErFJlYM+oPoGiLCrTgwIC278HqHxUnCv6KXwDk/w3XR8xGDq1i/vQL2EmwrZUvetATs2hrSTbEgf4mJymnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TJ+hDWQ1lN8ehRB1sbePkhUZSzxxSTf71bp8lxhGI1IWkKJas
	szzPfYuA77FRjwzTJC4k0hT2lUVkN1BcHAE6Ci9XIKjzs5z97ks44NNK
X-Gm-Gg: AZFdTZc1jzZgUTSym2byDlYV5Uwr1NzkTiUOVqJjy8HBXGY1MIPiinPnjjQzYJYx//h
	kOI0yJnQ6QjykNUhIgsxsVAMAH6yo8uBWGryRdtmQ9dO61b1V3wN7cH5Q601/PCRiscIWifB0j1
	jNj3ep6K80LxEvQB7LmiQzykMC+WQ+xBIekE+oETV7d20k4qJhZC8pZT2cemuAsVnPJ6kVFvL+H
	MqQll0EcVkdCMksVm7PPp662XhQNiPoGGOJHghzrlB+SsKw0Q9rG23TJxxS9+6A0mtBnZRV+3Xj
	yh9+hZVP8w5t3d8jZ/CtgFTrkVl2uISjiyF7W8R6lLnVfinZbvfZkUz/E8TA6tFNHIxdz4iUJGW
	chVT8Ay+biXDuwjr9d/AjysC1H3fAMZDMlQ5D2LVK7sXur4HAL80W9L3BolAlMPIZzCq/w2yWeE
	WGcl91GP0IFFvtnFOCZA9dOXaSrcH0BeU6cbkA09dIrXFGfkY5TpQKanDK4vU0JwTblYQrQmZ6f
	hI62yu64P5HiVOa5IdWAcCvQIQY5LODoQQ4xkRxMAxX67fVNqURDyLUQq51K+m2ESk5jw0NLh0Q
	A1XJ1u6pSSL+nS+7KeMz0gmXoNakBtw=
X-Received: by 2002:a17:907:3e92:b0:c51:9ab4:393c with SMTP id a640c23a62f3a-c519ab43c77mr120246166b.32.1795529297432;
        Tue, 24 Nov 2026 06:08:17 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea1fd8sm512929666b.38.2026.11.24.06.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:08:16 -0800 (PST)
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
Subject: Re: [PATCH v6 09/43] drm/connector: Export drm_get_colorspace_name
Date: Tue, 24 Nov 2026 15:08:02 +0100
Message-ID: <awWaMHsJ2EAn1Tpa@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-9-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-9-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:51PM +0100, Louis Chauvet wrote:
> Export drm_get_colorspace_name so it could be used by VKMS
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index d66188521881..fbff5871355d 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1528,6 +1528,7 @@ const char *drm_get_colorspace_name(enum drm_colorspace colorspace)
>  	else
>  		return "(null)";
>  }
> +EXPORT_SYMBOL(drm_get_colorspace_name);
>  
>  static const u32 hdmi_colorspaces =
>  	BIT(DRM_MODE_COLORIMETRY_SMPTE_170M_YCC) |
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
