Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533216;
	b=VYy6hQghGpZ+LlVSHGagYQ2wmkgB9ZXhBDgL6eJPOuMFU9jBSKcKwFJrsLcoMIeBXNny
	 XR6yUP5vEmFtj2Ho5xRlKaZxlqyNdfoMukXBSBhJYh/8px0dGjcq2r0SI28XECR5jkr4W
	 U+yAL1vVDIfdvmZcx6l7BAd2uM7lWTeAbsqOVucoBzmTOQMRi7dwhV0G9r1jIyidspZI/
	 H4iT/tuwJXWm2o0bnCAIRUb1CeC8TstuJssKQK9lu4h7l9A0wAOlwcFMv/ZncU6uCxMZB
	 2A3rMyi+uEkCyI2dsKtzzXxnH7UvEhklmFvoXLH3napcN5ZUmLs5eMlh5I+P54xdwLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533216;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=NXqk/EsElW6S2KxaRSKdG5paeRpfpZqtOu9th166vX8=;
	b=BkwY9qZIZ+2IHU1o9dQF4go6Uv5yvT7gAalNcTE1YJknOj1Eg6O4fHusjXsez0czNd0q
	 ITWLqUX507VkPRBtSZpt1vVoMiU0YaV41XbS5WNVJdcteNdWjzeW+IWwQq24HFMkQfQ3F
	 FA5ZmGiwZ9Ji66iIXpKNO1mD31ueggEGdXkw1YvCIdup+9jpFAkwBBHR+pCVEyP/un+ni
	 dWPCCxMdHvbOaPtG/YIKRiFsvY755njHLCp1Qd67z30xDqkF7JSuq6pX2vRxYqc8zNBBN
	 7m1cFXy0BfVw8ZHa/eMlO5/7H3HXGiFSnr2NtnJosgE2OPatUPalgeDmJtVE9XBAgLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=i+r4z4rr;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF99606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CF99606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=i+r4z4rr
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 644F91A17C2;
	Tue, 24 Nov 2026 15:13:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3681D601E1;
	Tue, 24 Nov 2026 15:13:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B130311E699B2;
	Tue, 24 Nov 2026 16:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795533213; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=NXqk/EsElW6S2KxaRSKdG5paeRpfpZqtOu9th166vX8=;
	b=i+r4z4rrCxckRaTeNCSRxsUaHI/gO+H0yCodAfkPVR62Tep4gQaNw+aD5O3qU7DcLTGP1B
	H5OW3hm6Dt8yS1R/HygpKnuy8+gmyEruXK1ea000hywxR9t6Jy8+YvQdqZJeIyRl2k0RKT
	8Eo6sqRqXW/0ctOvx3B76knH4O0PwN3W5fmQ34vkcZMjMvbr2u20W0lpyY3iiC3zdZfwbf
	Fp+zHLGElegH8Z/P1Ci06050FSTfup0XAQEfw83I/YcE3O5Ncfbtx7ZULoPU3A6DEYYQjI
	0VD+A5Nmu+r2jTVoeeaPTUCpqRYiSqWrbtPNUk9sDn6r+ZLSdwD31jGbSM1CCg==
Message-ID: <7409b2e4-5f16-4fc4-a0fa-39546c50d0ef@bootlin.com>
Date: Tue, 24 Nov 2026 16:13:25 +0100
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
Subject: Re: [PATCH RESEND 3/4] drm/vkms: add a KUnit test for the precomputed
 LUT table
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
 <20261123-lut-v1-3-5556c89a2ebd@gmail.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261123-lut-v1-3-5556c89a2ebd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/23/26 17:20, Oarora Etimis wrote:
> build_lut_table() turns a per-pixel interpolation into a table lookup, so
> a wrong entry changes the composed output with no other symptom.
> 
> Compare every entry against apply_lut_to_channel_value() for the same
> channel and value, for a 4-entry LUT whose channels differ and for the
> 256-entry sRGB one. The check stops at the first mismatch and prints its
> channel, value and both results.
> 
> The tables are built with apply_lut_to_channel_value(), so this proves the
> lookup matches the interpolation, not that the LUT arithmetic is right;
> vkms_color_srgb_inv_srgb() covers the latter.
> 
> Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

