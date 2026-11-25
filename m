Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621673;
	b=dx37Wd/SAuGCiSCrZf22RL5kANsXyO89ZfTyVddhmfPUqVrwnDyW195mQvPoEZUuQFsR
	 jwV2C/8m39Jl42AFJLFkw845R6SoSTX0NoRFdRMZfeaM+uKvDSPNbGOgEl/1UNbraZmTp
	 7JPkXGUYRUuZEw9CutzfMInrUNRZJT4Vjhx27k59jtUNiOcstQ5EMUEwuLki8P6sH3SlN
	 xXT4Swn2OMlhuXhlfYS7BQQ7XJyW0Xbv1JCUNl+2a2vCM921g6SPuHDYmKK3/Nk4XYw7i
	 7EGQY3U1OHlXHUigFbwYIww8ZJPnvDFmJ8PyEM9qOofYJJFSIZlRqg+s/dQURQ61l2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621673;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=YUSjgUN/6KwEjmXPfb+omVKhEOcotcQptSpIZk5o8Og=;
	b=ghCyNPVd/yDSThYXYQvFgH8B+Cy52AqVkAYdCuB2M4G4DzfC9M0S7xaNxU7RFku6DHqe
	 G40pmfNEzOTpwFMsGERMOTHIjFm5q02OgK4OmV6DWCRp51F7HrQ2NJmNid83bhrlYxReG
	 NBkjGnla8gT5pai458GbMLB2aYtL8F6opFuHECC+j72o6jWTLHhDr8e/zEFPx3xh4cezt
	 AgN/9Tbw0w4dxeW2wDiqf2b3/EyFI0EYZFY0Q2jdZ2IWU7J/ZVrmhDO+wXpbZI4E5+xtU
	 hWJmRJzsfa4cEyeXUJvgFUbpUIavMSj+CmJWndi52Aay/9FvRtEqOxslqFJnZrwthWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=C+S2LwEI;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D91606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24D91606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=C+S2LwEI
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 91AF41A17F1;
	Wed, 25 Nov 2026 15:47:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D21460480;
	Wed, 25 Nov 2026 15:47:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8064511E6A143;
	Wed, 25 Nov 2026 16:47:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795621665; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=YUSjgUN/6KwEjmXPfb+omVKhEOcotcQptSpIZk5o8Og=;
	b=C+S2LwEIUFJ+PTX3f9IkDYUibHEsDLM7RogBuUXLjinyt0WjiCx+i23061HWuwpXWe38ma
	w5AsDVpNowR+gtIF9h9G6qc7J4jYSq/sk/a+WKE2i0jugap5pfYym03oixnuMV5aeDE+fe
	4fUEja2SKvSYXe5Rbch0F6gjMxLxFHJkqAtifqTnsASakiFo1uwo9iQOaudND7403nLMZo
	EbgnfE1DLKtCriM17wadIHjr2V/AbluOuHc01w6pE/FisAVKX6zB6/4l2nlQh011fo0BQ/
	Cai1IOR9JNlyWteTB/KzCHygtZviKVrr5HJHnxfDw/OADItzj4SccxRdTOqkdw==
Message-ID: <02c97b4d-778f-4657-bcb4-dfb9bd98bba9@bootlin.com>
Date: Wed, 25 Nov 2026 16:47:41 +0100
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
Subject: Re: [PATCH v2 10/12] drm/vkms: test sRGB and inverse sRGB LUTs using
 more samples
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Cc: airlied@gmail.com, alex.hung@amd.com, daniel@fooishbar.org,
 hamohammed.sa@gmail.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 mripard@kernel.org, pekka.paalanen@collabora.com,
 robert.mader@collabora.com, simona@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
 <20261106201813.129911-11-leandro.ribeiro@collabora.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261106201813.129911-11-leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/6/26 21:18, Leandro Ribeiro wrote:
> We're currently using srgb_eotf.lut_length samples in
> vkms_color_srgb_inv_srgb(). This does not exercise any points that are
> not in the forward sRGB LUT, although it exercises points that are not
> in its inverse.
> 
> Let's test with more samples, to also exercise points that are not in
> the forward sRGB LUT.
> 
> We chose 4096 samples. LUT inputs are u16, so we could have up to 65536
> samples. LUT sizes are usually not higher than 512, so with 4096 we have
> at least 8 samples between each LUT point.
> 
> We can see a minor error bump with this change. In the next commits we
> replace such LUTs with non-uniform optimal ones to reduce the error.
> 
> Reviewed-by: Robert Mader <robert.mader@collabora.com>
> Tested-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
