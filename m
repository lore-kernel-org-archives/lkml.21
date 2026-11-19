Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100793;
	b=EwUeYmY68BC1yXp+FOupsIwVeVOoRvh8zIKXpE5iigrDZUirVbLb8IW9XbI1UfPiJSw5
	 W4k/yvq2Ibx6smo7IOtLiPsFKWTls6onfQbtL1MdDrZJBEjR8+0jPzbV3555VJ+9tJRgU
	 qJg1IcQiEJt/GfnySNFhUxjUX0+HmIsj/KgyKAI/WIkWQ03vU9E4Cy68rTwQY4jQTP9DV
	 1k/qDByEiFDVcMJpsCzaEvsYaEqZYgf9YI6nZPr/MUih4nls2MzRn/3Vf5cb28lMWWpFv
	 Q5tKF6+siinbImai5eJFb2nESyMjuKF0/MrSKy1Sh+su+7clKfxNnHrrrD7JKAbUXyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100793;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=clVRO4n/YgzV7BQnfL/nP3g53VntNfFFRk6rM9i6WUY=;
	b=i4qjm8cL6BfxH6ERQBA9Pavm02t2Bm6KFi4jfnooQP64nciD2/8aCr3PxeeRyrgiut1Y
	 6ZRGAl11zrhNsffywt1LzSp63stSPYRGXB0TIPvD41F4KxmT2zf9T8MPmn1NwrppMQqzJ
	 DNnm13b0bQtrn/KY1qqmh13gC0Tldm6VtFtkcjdI5WsEBtHD0t6o8whz0W/ZI8tyrWojp
	 ezuKAEjWd/OoiGT/q5LRA0qSJk7zXOHePvoUh8VEtQRDYeCfrURN4mQhULU5vYAzfjRl1
	 R+D7VyPUA02LGoZekk3S6UzEewX6l3qCkbsChvsYQc5OCKXJz9//VHP7bWBKhPREOsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lPn+qSfH;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C287E60A6F75
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C287E60A6F75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lPn+qSfH
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 66FB3C4CBF5;
	Thu, 19 Nov 2026 15:06:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CAEE60237;
	Thu, 19 Nov 2026 15:06:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6AA7F11BC0C8B;
	Thu, 19 Nov 2026 16:06:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795100786; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=clVRO4n/YgzV7BQnfL/nP3g53VntNfFFRk6rM9i6WUY=;
	b=lPn+qSfH9qzPIahNDYLH5YwIouK9yKi/FYCKNasW0yZoz/2zH0OnZAf4pLIKGbV0Ozhj8C
	2gBBVeWMR6B31/qov6AlFJCYf9r1QCrjUuL4hivpi6c3VglwS9CMzLWRjD3CRyfmb4yxaY
	zbOao19oDqmpmETUz362stWWYdh109rsNissDA1iocz5eaDin8DgfpK3DtGBriajFRWUxC
	RgCAPJmPpkeweeySQpTLjHdsSDA15JdkxMK68jnzTf6/VbC4I1GgmKSdc2aOtC7bjtQI2F
	ZoLICTS27GofQbTOOs9he5sO0WH399jfHS51LkmJeYlLmFa0qUleYop50nS3xg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Aryan Sinha <sinha.aryan03@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261012154449.42015-1-sinha.aryan03@gmail.com>
References: <20261012154449.42015-1-sinha.aryan03@gmail.com>
Subject: Re: [PATCH] drm/vkms: Fix kernel-doc parameter and member names
Message-Id: <179510078399.1769064.18348312937674902862.b4-ty@b4>
Date: Thu, 19 Nov 2026 16:06:23 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Last-TLS-Session-Version: TLSv1.3


On Mon, 12 Oct 2026 21:14:47 +0530, Aryan Sinha wrote:
> A handful of kernel-doc entries name things that do not exist. struct
> vkms_output documents encoder and connector and misspells wb_connector,
> struct vkms_connector calls its base member drm, vkms_crtc_init() lists a
> crtc argument it does not take, the CRTC plane helpers say crtc_config
> instead of crtc_cfg, and vkms_config_plane_get_type() is written without
> the get.
> 
> [...]

Applied, thanks!

[1/1] drm/vkms: Fix kernel-doc parameter and member names
      commit: 55f54b0dc193f4c9a78ae3390e3b0da6b228b4a4

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

