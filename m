Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533266;
	b=Ya/36887Y/pFNlGX5DPqczYFqfMbr9uxD6p8qEPwybI04T9EcsXsv2G+H8vOAZR+TxLf
	 D/qGkLCV/QjKTp0jXlsozZ3PYmrwR8o2CA++Xb7KjXvF4utgVBRncS1bYWDmMLcpKGoKR
	 54bT+Ay9mLItIh2Va9vuDbMDmy27ai30DFrG96UeJ6Wb73wIMUoWw3NY3Phw+Uy2nAl6+
	 Ksp4zV7dMaoFM/aYgxfzttGVf3aCYp0xABumuT6DO2dopChgQuc3FDYlOIaMcQDFKA2HX
	 09bDll7LT2rlGukyy7DZltXSd8wV88o4STZoqjGykoUg7kNN9ZA/HAgGgFCSrTEg3yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533266;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=p+bpU0SHAzyafeIyqxsdITumZBdrrKe6R0doc06h36Y=;
	b=ha8cJjLrDZk9EXQmUcGxPTORzStkiiuvYQn3kA+kZKdyaDFgnqw3SQbbnqLVTBmtsoDa
	 jMcg3XsALwDf3nYqN+e8jKZCbDvYAqt6Y1QajYefJop54XGDCG+ZKTBry2B1L8f6Cte2/
	 Cu/WK4AFQrm3elKMl0vqO94pmhENeo1QNsTJPWGCzO3QMZL+X59ZqV1e/txwypi1vSkLI
	 KDhozRcUnsojlZSrkr82LicBChndI4UlcLn+yWOiTDVd9EJjcWEdjVdN7R8QOAr0marMP
	 QODjXVmlQ+DtoueNECcJJLi0eCuf/Fwi0BukGBlCtMnoNdQaYHISftMB60LIxFb2RNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PVYM102Z;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7727606A68D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7727606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PVYM102Z
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 05B42C2C678;
	Tue, 24 Nov 2026 15:14:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F7F2601E1;
	Tue, 24 Nov 2026 15:14:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6CEFB11E681A0;
	Tue, 24 Nov 2026 16:14:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795533263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=p+bpU0SHAzyafeIyqxsdITumZBdrrKe6R0doc06h36Y=;
	b=PVYM102ZFuqJJ55UqGyg8HVM1tZvss4BSsQa7M2LFgwDxTMA25XCBlyiFOoQ0HlkQsmjyn
	Ugwd5EL/bWqKZS9bbTV84B1PfBU7WO+xuON2NBn0/4ENYMU3aNb3eZj6m70WsQjAy/NdBD
	ND7L3XqlGhJIFpcLKelQqD/hhqSUjADmtLEaISgBJOqpde0zrzlt8kNbksuRbdeHNQSqXB
	BePDntVGvjHuxZ0dyAMwhNyBI7BAaAcyeIFhiGiS/n6Hi9bSJkL+ke0Pq8fVL1mexGKM9F
	g6dUkvQzQXb69tbNuhId14BuzPSvYa0xguAK0QLm3fBxXzCfgM7h2nPUZrv7Pg==
Message-ID: <75aace8c-5bf7-4e9a-8682-b3d37d6cfe4d@bootlin.com>
Date: Tue, 24 Nov 2026 16:14:18 +0100
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
Subject: Re: [PATCH RESEND 4/4] drm/ci: drop the kms_plane pixel-format xfails
 for vkms
To: Oarora Etimis <oaroraetimis@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261123-lut-v1-0-5556c89a2ebd@gmail.com>
 <20261123-lut-v1-4-5556c89a2ebd@gmail.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261123-lut-v1-4-5556c89a2ebd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/23/26 17:20, Oarora Etimis wrote:
> kms_plane@pixel-format and pixel-format-source-clamping are listed as
> Timeout in vkms-none-fails.txt. With the per-pixel interpolation they take
> 160.1-167.8 s and 78.9-83.8 s locally; with the precomputed LUT tables
> they take 9.70-9.84 s and 4.87-4.90 s, so the entries no longer describe
> the driver.
> 
> This patch depends on patch 2: removing the entries only helps once the
> subtests stop timing out, so a job that takes this patch without patch 2
> fails.
> 
> Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
