Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621356;
	b=WXWhite0pOyAmmvebMq5i5ZiMWNLBO30nb7DA6ANiBx0feP7rRUNFtHsrvd91kiMTbmx
	 TR1/NFMVdmGv9ccn1erbX1TDehjrXImt8o0y0wpOkoML2ExSq37w5piT29j9AaPi25KM6
	 xStrDLtwSRch9LxVpYQMJmrVhBKbdtOKmLtw1V7kmyBVXKDzRY7kbDw4m0wV2sd09XGRB
	 IOl3nN8EVNmoOCzgOP2jGae4umneZsQe+n9X+thyNxsXtovqtZK6sBlJrOAqnA9vNhzXP
	 jmeTrERKMk49xs5+T1L2pdn5KCtfXBIfue/1LSkT+O7jAyNW9U3OPptiBPixKRmBXUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621356;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=QrZy3+lhRmQHvF7PcBAfYtc4rhFm3+J8F9mGHGADgfY=;
	b=acPxBKwIWSG7UY5ssw5Ppb3kJ+JDA/TCcKKnNXWiO1P03ustSodtiUSEk4cDnGwTlRMa
	 eE3G+si8z75m+8iJU3ZNyoPrY3SWtQFnN3iyVRe2S8PMa1WemufISyvGM2MR2q8egZlsY
	 Qn19HlrMvr7OxHrpJ3uz/ZExGqhce+bHx0ry+LbyU0s351EoM7RZQGCiGfV7deT7qA/FW
	 Yssx7ChD34KeL7Z//O5YzaSODmfYnHr5BKSLlzZKMmRlcuGNuA+mNEYA/AWW9hsYAw5YJ
	 pTmIJ9nIjrAXaR/EYOyPLVvkEBg5wIcVyvD9TjwcvxBjsBDHAUCcq5OyIP8zpKIuSow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EjfTl75B;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0B6606A6B9
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A0B6606A6B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EjfTl75B
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D449CC62219;
	Wed, 25 Nov 2026 15:42:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D95E360480;
	Wed, 25 Nov 2026 15:42:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 236F611E6A0D5;
	Wed, 25 Nov 2026 16:42:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795621351; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QrZy3+lhRmQHvF7PcBAfYtc4rhFm3+J8F9mGHGADgfY=;
	b=EjfTl75BrRCZYU4JoDWaf/E7vLb9RVOGESPtlMBMI8u0yeuDgfEBvuVHBguGYUU/OZFbD8
	GS5b1O5X7znThnWGHfAR1E/2N8ecGmSVFSP9QFPb9ovlwiOQhQBMoHjiSzINKvgCW++ngj
	9q5EEszawlsT/mbl1cbTfIhMJEIsfHgmfxWwqSQbXJ70UWiX63TrxMGOUWGzAksFtBH+U3
	bXcGcanETFVbzGZfuvomNhxZteNr2duXK/cW7G7SmZ0juePS6NYAe3gE+W156h3u7x2yaE
	IMUHUqTlgrPxDfhYPfS/lJ3wFYQ5GZPB4+b3Vh00sweAdToxY4IoXw3usy1Qlg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Lechner <david@lechnology.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261111092404.2117072-1-arnd@kernel.org>
References: <20261111092404.2117072-1-arnd@kernel.org>
Subject: Re: [PATCH] drm/mipi-dbi: hide unused mipi_dbi_dcs_read_commands
 array
Message-Id: <179562134757.656989.4812864039990894547.b4-ty@b4>
Date: Wed, 25 Nov 2026 16:42:27 +0100
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
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Wed, 11 Nov 2026 10:23:55 +0100, Arnd Bergmann wrote:
> When -Wunused-const-variable is enabled and SPI is turned off, gcc
> warns about this array being unused but defined locally:
> 
> drivers/gpu/drm/drm_mipi_dbi.c:79:17: error: 'mipi_dbi_dcs_read_commands' defined but not used [-Werror=unused-const-variable=]
>    79 | static const u8 mipi_dbi_dcs_read_commands[] = {
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] drm/mipi-dbi: hide unused mipi_dbi_dcs_read_commands array
      commit: 75f3faa2835c9bf588caeedabc10d5676aa01f79

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


