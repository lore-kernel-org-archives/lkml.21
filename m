Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621823;
	b=tI7c1Uyw5vdtuQ9hh/cymutuhyYcj7IGB7jHzOBkUL0eiMvayjP+Py2tnZ/+LLgikUSe
	 G9NXgKK2subYjoAQbPeWdrKRtpUAfLyXy7Je2lBUnjqQWi3Jbr6U8txR25gHtFFkpkeBJ
	 fIRaQ2FcIODiwphU6hGATUYkhIlIrbgA3nOMcio4lsv18vqSfjQTal5IUqlIEpBJTepjs
	 Fh61xoFMCQFRLVhUE17CB2/+vXCSQjF/mnSgy0uSYrrkkTXmMwqE7osrkg3yrJHMmzX5/
	 5YsvUYD9AIxjVfJEJ7vUjRD7DpMX6JQOmK+T7h+V9YZTW2OrJm0Idbw/jTXN81UmN1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621823;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=i66x6SulCuugAeQE9LzOp5zVoMaKrTk11/eSNR3HO2I=;
	b=bYCHwlXx6Yb+MFE6iPJWW26YGkApCR2yxTFlwwV0IMANiuYHAAJnmXXE5tzeY4QOUYWh
	 3NkiZTP7bqJBL+HQL0Rt934efGaAUhxU3WOoZ+G7PKCepzBW0LkadKRifzdbrGUk1TSCS
	 PLScwiilouucAsy7ek0Zh4UEAYPRKFjlCF+dZhNQuZlEAf9ZedL6e/jikWGFB9sbl5T+Y
	 D6RKJMdTVCnpeJkN43ISv8rFPMx3u2Xn5F+OM+a+96A+E8PVVNXrrwv8/solDgKLU24G6
	 XDRPN55M2MxO7xK5L2rIRkRTu7FIa013fpwzxutEaODWO8+/Eu6J9xXtiJ7pdDZq3xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JRg8LcAJ;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF98606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDF98606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JRg8LcAJ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 74C07C62219;
	Wed, 25 Nov 2026 15:50:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 872D560480;
	Wed, 25 Nov 2026 15:50:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F00211E6A17F;
	Wed, 25 Nov 2026 16:50:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795621814; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=i66x6SulCuugAeQE9LzOp5zVoMaKrTk11/eSNR3HO2I=;
	b=JRg8LcAJgi/KjbL6IwLz60whI3amVQ1fV3T1HKKlo7PMD/hoE/1nJMkfhMRsqU1XkINeSg
	nMHaIGfq4deXYzBKmAXhGzn3jpIKOGsktbDANvnDxPTOydp5VX/5PmI2z5irfwx9PbqdFW
	xqSuMgCfMoShohmKnxGluilivwCWmkk8loCM8+gfzXhZ+Tiz9Dss4BVV1vyPThzRFD7bXP
	IS7ASOqH1iPmaIDp3Yx06LJDNOgDy2nR3JF3x35HVeJRQGudSCkq6zpHUTQMQed0eBbwBC
	oTChZh81dOoviid9Lw936MheMesPzE91ufmk4AkdwfsWWJ3sqM0/j8KI2w7hcQ==
Message-ID: <d979ca00-a6c6-4297-8186-92c50c95bd63@bootlin.com>
Date: Wed, 25 Nov 2026 16:50:10 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] drm/vkms: replace uniform sRGB LUT and its
 inverse with optimal ones
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Cc: airlied@gmail.com, alex.hung@amd.com, daniel@fooishbar.org,
 hamohammed.sa@gmail.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 mripard@kernel.org, pekka.paalanen@collabora.com,
 robert.mader@collabora.com, simona@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
 <20261106201813.129911-13-leandro.ribeiro@collabora.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261106201813.129911-13-leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/6/26 21:18, Leandro Ribeiro wrote:
> This uses the script added in "drm/vkms: add script to create optimized
> LUTs for color curves" to produce optimized LUTs for sRGB and its
> inverse.
> 
> The LUTs are non-uniform and have more taps where it matters (areas with
> high slope), decreasing the error they produce.
> vkms_color_srgb_inv_srgb() error tolerance dropped from 122/65535 to
> 11/65535.
> 
> Reviewed-by: Robert Mader <robert.mader@collabora.com>
> Tested-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
