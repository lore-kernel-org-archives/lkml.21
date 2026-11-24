Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536705;
	b=l3x9BYZBvcDg9Cf7hLhGTryUHIuCSv+hgHd1QCIadKW8v99M7hU+arITXmbewdS4shLs
	 mAVw5MpDZBC+mhF3gaUzcD3IWh8X1dvD+XdMXFirh+3FORU7GDkhFYbrHkd+E6HRZlTqc
	 +X0JFUElTot8A1BLPQTZ1PBfH3He2qHUeC306jYf29rFmUFqR0vXViXvBPW5m5pweGVis
	 3CSTE5gigCwPFoMfludNBZqtJ/axQ/hMbPGNXNE740p/mGK3GNOlsn4KQThDONdlYtXp3
	 qBhJRqysJacH5AnEj2oocGPecDwnl8yW5vMmfucTTRV9QMADeTqF72/GJjgRNzGODdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536705;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Last-TLS-Session-Version;
	bh=ZAH3uJtDRDARFLlkyP7xUIfb21FLpBpXW/Qncc4Cje4=;
	b=yLwyHFaYlzciBMjdgmMNQIj6BWr+7QuM6m1q7K0mZbfN6Xs9eq6WjsifYdg+1Qzyvrlh
	 x8Q7pXAI+iEdsbRXEuyipxlTPqUP4YbmxS+9qJ0pDYs6vfPQ2o9gYEbjvLV5gAI72Lkom
	 TZ5wIcYQyzdRwIfJUrM0mnuaVMn/felmr/q/QIQflgJNz3zxVqQofHTEKrsGBlNFLLSJY
	 1p6Xf2eruy5J6Dt4dSYzLqxImjiQlDwJlujOhTd8yvS+JSiQA/mlE19CRJtuAvDzhGXd/
	 n79ZjM1qR+3zJaAYjy+F+13M/8oODoBlaQs9QFhlc+2SCmWe5x2d5PVmvXHysd/cSjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=izAsToY0;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23369606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23369606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=izAsToY0
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 58A1E1A1792;
	Tue, 24 Nov 2026 16:11:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21F15601E1;
	Tue, 24 Nov 2026 16:11:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A72E11E69A44;
	Tue, 24 Nov 2026 17:11:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795536696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZAH3uJtDRDARFLlkyP7xUIfb21FLpBpXW/Qncc4Cje4=;
	b=izAsToY0CPCK6ofDDGATgxe0On9y83CeO4uz6Vb/iYIc9JbPM1wsXYVwuV6uoxzAWXsQjp
	ubSqwRDEA5mm6eldGynVFPdOTCchhyoofs8ADkxfrU9IcSqXfUiz26+QyenyYMxLzFeGCe
	uOLVic3NkI+RGgTHH4jAG5vYhMAjvLGuPLTzkP3qGmr7WufqiSZ7dk7QJF70Jx8eKuRyiO
	9f4h0DXNHj1zUZCH/Q/7rOnpX4cwMfrGfvIrrDpoY4WccWuA/RlDRLPUguGNfJ5hcCd1SO
	uS32qZ5/g++IHzR1o/n/1T5nhEjTSM5ymBNz5jzYK8km3k6Ry6n8anK2ufLY/Q==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yuti Amonkar <yamonkar@cadence.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Chintan Vankar <c-vankar@ti.com>,
 Abhash Kumar Jha <a-kumar2@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Swapnil Jakhade <sjakhade@cadence.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject:
 Re: [PATCH 2/4] dt-bindings: phy: cadence-torrent: drop cdns,num-lanes
 default value
Date: Tue, 24 Nov 2026 17:11:25 +0100
Message-ID: <UlYYmHSPRwOwyW5SQXMI_w@bootlin.com>
In-Reply-To: <20261121-favorite-turtle-of-penetration-c3157f@quoll>
References:
 <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
 <20261120-phy-cadence-torrent-ng-v1-2-da2db7125cd7@bootlin.com>
 <20261121-favorite-turtle-of-penetration-c3157f@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Saturday, November 21, 2026 at 5:19=E2=80=AFPM, Krzysztof Kozlowski wrot=
e:
> On Fri, Nov 20, 2026 at 01:55:50PM +0100, Benjamin Robin wrote:
> > The driver treats cdns,num-lanes as mandatory and refuses to probe a PHY
> > sub-node that does not provide it, logging:
> >=20
> >   No "cdns,num-lanes"-property.
> >=20
> > A default value in the schema wrongly suggests that the property is
> > optional, which it is not since it is listed as required. Remove the
> > "default: 4" so the binding reflects the actual driver behavior and the
> > mandatory nature of the property.
>=20
> No, that's a bug in the driver introduced in 2020. You ignored the
> background and history of this driver and DT bindings.

Hello Krzysztof,

I was not aware that this was a driver bug introduced in 2020. Series [1]
made the "cdns,num-lanes" property required in the DT binding back then
(see [2]), so the mismatch has been there for six years with no one
complaining so far.

Two options (I have a slight preference for the 2nd proposal):

1. Keep my current change: leave the property required and drop the
   misleading "default: 4" from the schema, so the binding matches the
   driver's behavior.

2. Restore the previous behavior: make "cdns,num-lanes" optional and
   default to 4 lanes again, fixing the driver regression introduced
   in 2020.

Which one do you prefer? If you consider the 2020 change a regression,
I can fix the driver instead and make the property optional with a
default of 4.

[1] https://lore.kernel.org/all/1600280911-9214-6-git-send-email-sjakhade@c=
adence.com/
[2] https://lore.kernel.org/all/1600280911-9214-8-git-send-email-sjakhade@c=
adence.com/

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



