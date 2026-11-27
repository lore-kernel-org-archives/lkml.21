Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799486;
	b=vlPaKmK17KXejveArJhha15+fQj91+r5fT2uUbaSPtOHWDLp9DtK5BwEa2aNG/5dZQcL
	 JDY+OETwYr6/5Xden5Zgzl9tF986/B5mWk59+24m/73k9fO0pLlZWeFQiERHPX1wdgmMZ
	 kh/0gHBCsKxGw2KghKu8Pt3XGKyc3K4qtqaj4nNUB1Jx4+yYTlocdDIZlwkfOi1qlbqpR
	 QKNJt21uEroPkAJ4IowjtCnjk7FPgV1QdzhUwBpgF4JeZ4PrdTZmngPtV6TLOPasvcS9y
	 FH3ky9cDU6nf5NWFZcPuY5GDsqqEio+78DU3Ta7DDZsDmL47Onue4EMEJ1jrzDsxWyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799486;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=apzcDRIHeBZ/dYrq4Jwj+dpEblyzUsti3DhR06LQJUw=;
	b=wPR9q0lk9GZW7/i2hHbYGLOgtuQCJw+E8Wjc+tYw0D1mE8MZWEkWbbJq85q1rjNuKceU
	 tBb/m6oV6MZ+8KUo23KzB4C40PbVqCFbKAJ53z0mipcHlWRlXLdQQ2+LfR5LlAFtp7suT
	 miKWczY6yYP1PUE6B10Dj39PGjHNWIXdwG18C2/dwGNcwdMpZql1PkJuNnamHmJE+RG5Q
	 gTApRsElsA8PPCEW9FjrC8cKh1GjusjMnQkIJXeynA5VHuQS/rVuNwkfxLo1t7sVqxP4B
	 PJj5kjj9I0edhvWVMXm7svGP6+9vHlSLTWlcDrM1uXJIOTjq81RpQ7naGlmCoQdxawg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=l65UF0NS;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17EA606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A17EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=l65UF0NS
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E6247C2AC4C;
	Fri, 27 Nov 2026 17:11:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D25896049C;
	Fri, 27 Nov 2026 17:11:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA11111E90B4E;
	Fri, 27 Nov 2026 18:11:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795799477; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=apzcDRIHeBZ/dYrq4Jwj+dpEblyzUsti3DhR06LQJUw=;
	b=l65UF0NSWu7TOYLbvatZe7UIP8pCbmLdWgTlDTZJ89o7apX8FdGQEUx2uV3NYdtopv06jY
	HBBrxdLdfTD0MCZ1Kikq1i/zhxHVZpktJWTMwjy4+t69uxIe/qMLAo0/ro29J6dbP5EZXn
	SXqkQ0YsV3oFeq0n7+C6jRZ0+YlruomLs6NNfDOJ7QcebX19UmcSjlF6cKiRT4+HekSlY/
	VvL3ittbcZm5m4eHnKuS90K6pKAvvvY7LiwQSQL/NRJCsAM9DAV4y+IERn+HNxalKY+o9Q
	uWNMLEoVKnDcOKw+3GdKFFDHP8yKq2kGNLhT4cOAwy4+N7LAUnoPUfi8Xht6nQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 18:11:06 +0100
Message-Id: <DN65S64HJVP6.1UPREYZ04SVM1@bootlin.com>
Subject: Re: [PATCH 0/2] drm/bridge: lt9611uxc: fix firmware update
 verification
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Sam Ravnborg"
 <sam@ravnborg.org>, "Dmitry Baryshkov" <lumag@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261125-b4-lt9611uxc-fw-verify-v1-0-7aed8dec8018@oss.qualcomm.com>
In-Reply-To: <20261125-b4-lt9611uxc-fw-verify-v1-0-7aed8dec8018@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Nov 25, 2026 at 12:13 AM CET, Dmitry Baryshkov wrote:
> The firmware update verifies the flash backwards: it reports a failure
> when the read-back matches the image and success when it does not. The
> read-back itself is also broken, as it never switches the flash into
> read mode. Updating an SM8350-HDK bridge from firmware 0x41 to 0x43
> printed "updates successfully" even though the comparison had failed.
>
> Fix both.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
