Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077149;
	b=3VLtL6r28bsLFnGIYO+adocMVdbvcZGUg1ZxVblynCBVlOKYinvwYjpcFHunCtLtQCxV
	 DNvfWLjzPE6n/KRK/mYKGPprHv9zjuBdHNOPO/2um6zbMPKk4qSL3PHYtijypUudpXvOp
	 XZJ58oLTPAn5U0YCiqXixs1+5AS1QPiz6ommuxJfpBuTr/IR9QYo6Hce/nEdSHRY6cF5T
	 371A8y6B0nK4JsPCpKFVJBQNR3jxq22qiE24neW34ZIj31tdi6kFweO2BzIwdPyRiSe4z
	 TKOAjSYSKmoczYTHv3iAFftgLzyDo6iEGyhSNBWvcMQCO/Mv5pKd8zEVvwnP7eSXdcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077149;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=d+pbzDtS/JQiA7b4wrmuxjkA2iPIz7YvM7ymaKga0rs=;
	b=AjV41ese3brHfXOaTEcfnPFj5ZTo/X7+xfWyNlc0qbUKMBcXdxK7lTXsv9o1MNnbxhaH
	 hQ8M0vf601cslKkWYu0gM/Wpi6SpZOWNm0f0/tod2wCMVP6otgaUvln1naUtzEe9bwmS0
	 /5gPrrC4sdAJ9fIGGV8JlbIp7LXoOAYusFf0WrRxvtS4ib6orrz5GaWmZnSC0GsujRX/F
	 shoO+j0tizcnuFt70sd+yz8ErHkx7l/BH+vY9wfpTBYEMuck1/jHZEM90Z/sYx5629P1V
	 qrx0ZYFpUXe8U4qH+40KXR0LFo1JiLUlG3UsXvsIhv7WVN4TAn0MMO2T6cuo4F302Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=J65EdjmP;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93A0606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C93A0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=J65EdjmP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1B0AE1A1705;
	Thu, 19 Nov 2026 08:32:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC49C60237;
	Thu, 19 Nov 2026 08:32:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AD7F11BC31D3;
	Thu, 19 Nov 2026 09:32:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795077145; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d+pbzDtS/JQiA7b4wrmuxjkA2iPIz7YvM7ymaKga0rs=;
	b=J65EdjmPAxHMYXVljGZhHi9UwDX8egcSnd8PSZFe9AhLAwFS3tqyv9DBuO5bhFFxpMJp66
	oopgmeIVRLQW3xYvB1CCVUqdbZkcjJuIdrKbSXyoDC9SO7LezCP6JNI0Cv3AQn/zqHrLWp
	2tP/nMASKt4MayFXPa8xTaI8naoQzTDfsNHgB4L6MSwcTXBXy6LFRdTlKI9d3BLbK6CdML
	9MiKssAk9n1AnS3bTMcPpD67AoixRvHFjticPSCwyGaQQRsfxaf7f97V1T+gRL94x5gcRs
	g/lMUbG99dFuADw9mxJxAs37zWUyTX2yV9lufMvIgPKYNEQ6TJwTLgFGLFWJww==
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
Subject: Re: [PATCH v12 2/5] drm/imx: Add support for i.MX94 DCIF
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20261118-dcif-upstreaming-v12-2-29b35e27a1cc@oss.nxp.com>
References: <20261118-dcif-upstreaming-v12-0-29b35e27a1cc@oss.nxp.com>
 <20261118-dcif-upstreaming-v12-2-29b35e27a1cc@oss.nxp.com>
Date: Thu, 19 Nov 2026 09:32:16 +0100
Message-Id: <179507713631.198693.2786295335112670846.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

> The i.MX94 Display Control Interface features:
>  * Up to maximum 3 layers of alpha blending:
>     - 1 background layer(Layer 0);
>     - 1 foreground layer(Layer 1);
>     - A programmable constant color behind the background layer;
>  * Each layer supports:
>     - programmable plane size;
>     - programmable background color;
>     - embedded alpha and global alpha;
>  * Data output with CRC checksum for 4 programmable regions;
>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # bridge refcounting
> Signed-off-by: Sandor Yu <sandor.yu@nxp.com>
> Co-developed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Looks good, but there are some issues reported by sashiko. Can you either
fix them or explain why the code is OK?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

