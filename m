Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629929;
	b=hPBXBWXw4jrphvsOyU7IAvaZ8q4XQT9U+9SvnhQp7oQgNbPcQ2XhFxvVJV4+1Axzybsw
	 GIO0aTpxl11GN8nvqZGmmLe1vX8uiiGDTkV56m/l+E+7EtnvgTkEm9Masfz2kgCEjsAqv
	 O1iiruE4EdWpfS1yL/3X39QzujbvCZtKCroZr/pHRlHQBMrz3TTVPwMpNANDDKPXcU00W
	 7wJh4+7w8+Db6uURyqFlmajDFyoTB5J9Byye697QGb+Z+Vbv8lKhGsCjmV5LveTvaE03A
	 8tMoqszqmRhP17/0Do19WEbcDS1nuaxbfOaN/0Dyj28sb3XrODkiBQqHVHcKMcWML4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629929;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=z0fn3F766wuQK7x5mxxCqW7uOeoT4GbYQhAdJOMmB5I=;
	b=vpimnxxszjKnHjRuqLZ/X6H+NhVuh2I4cJwzhTU6nNT3oQOG5h1bIImJ94Qgde1UioiF
	 7RwIQPIGEhy4ICHLSc5EZUxqwLZu1Y6MNOy1D2vfxrtIO5idjraV1CXhoqQgQqIVl1TEm
	 2HB77v4uFAiLIJM7/r43qDRu4g0kKb8WaGFDZoSqQPMbYqfMmOzoorgcJtPapC4XJIHJc
	 HD39XNxW/9U3N+3hQTIM3dtMxg2VK1NBqnp3m0COgM6VR1RtrF9JOkookx4IWTt4no9lt
	 TxUhsq7eP5sB9xLU9xUJh6XTrUesf00wRyA98YBDNnxVavZhBorOe0f0/iwFXO0mOtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zyFNXAhd;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BCC606A339
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88BCC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zyFNXAhd
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D7EF1C6221E;
	Wed, 25 Nov 2026 18:05:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E2CFC60480;
	Wed, 25 Nov 2026 18:05:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A456B11E6B0E1;
	Wed, 25 Nov 2026 19:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629921; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z0fn3F766wuQK7x5mxxCqW7uOeoT4GbYQhAdJOMmB5I=;
	b=zyFNXAhdALZuyx8Bv8QI3r5W/mRqMqrMtjWNM79N33AqkCAksk8tmkuOwLNkQtxWEPuk7e
	QuoWGXatVVoMJ63AXUAHhQ3HPh+7BSeV/pTScOyMnjEooBJMC8KHBZlA+3TXYuIaOS6Ean
	CDyrS76D9Z4KXxqP+Hc6XYNtytdFEKGvW80ufcjuk+a7FzLsKGxCUn5jXAdks1dkGAiczr
	P0RXbZbAnKLoEWBYJ8KNZ0gQxi81p8YcpI4PDfombMiU07T4t2EW5gtmMbDK6IF2tzt5Bi
	prJV1kiMj9n2cKIRgO8E/NnGFVU0ENCzexwWg4r5MSIc1EtBW7FtnBfV/qDSRw==
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
Subject: Re: [PATCH v13 4/5] arm64: dts: imx94: Add display pipeline nodes
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20261120-dcif-upstreaming-v13-4-966ac248773f@oss.nxp.com>
References: <20261120-dcif-upstreaming-v13-0-966ac248773f@oss.nxp.com>
 <20261120-dcif-upstreaming-v13-4-966ac248773f@oss.nxp.com>
Date: Wed, 25 Nov 2026 19:05:04 +0100
Message-Id: <179562990452.846133.17994433821419936260.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 20 Nov 2026 12:50:39 +0000, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
> Add the nodes necessary for the display pipeline on i.MX94:
>  * LVDS/DISPLAY CSR;
>  * clock-ldb-pll-div7 needed by DCIF and LDB;
>  * Display controller interface (DCIF);
>  * LVDS display bridge (LDB);
> 
> 
> [...]

Acked-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

