Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621580;
	b=IWtRtpEv87Vd6+O1HVniaLHt6QsRKyv5NLWEDqc/morcsA15nMz5jSrfWX9hLu+cBw3e
	 Q+4sqcguh6MWZqNkb4D8enmJrRmR1T6mKvxhg96tQyqRWIq0EoDzq0UoXgkPOkoc2rM93
	 Fm9vqJTlTLMicduqmYKhzz6YC09pkOnvsm1NPuODybfgow9g/xGCt9ftY+h0vYkx1saZX
	 1nNceLnb1MZdeT8QdLkjWfr5jrhDeLe89zMuAK3YB7ccpnvYUwKt4vYlwQCIyNJxm/Xi3
	 ChL1JHlbt6x2d6aj1vy8nljhsocpg0rvE51OGhbQdF7KGC/zBDCFmB6/AFEmQZUGqYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621580;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=5M+Y4WoolzAgpLfZyN5TlkHUMbwAipYug+VFIXMqPl0=;
	b=TUUr7Viq//RVvjF5X0eIGzMOKqDllMTL3Z1Tw2rThy7XvYHpp+qOeeZi/nbyPBgeL71W
	 FDBbwfCyyHmIX2KW+/LpHy611lwbMUMVDbrnwopsQKNJcnJsBro38B4w/EvkgB6HlNsrE
	 /yAiL7dMJlgSb+TZrR4pon7cjOoIogFBEU/1uN0y05I6LI56GowXZHRtB4Z0ZqGvnxJ8e
	 whe8V6neONluIIINg0vh/Ye2AqKwI0yNWmSgg+/x/ImOeqIALxxiJhf818G8kowW2/jnB
	 DQkEbWX68Ah0pylCpJqz2EDnNLlBtzs/YFoTThrc+xJzgvFHPSKC1Nl3MTGhij8l1Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=k2Dt9nmE;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C1B606A336
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74C1B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=k2Dt9nmE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D4D8D4E41601;
	Wed, 25 Nov 2026 15:46:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9443B60480;
	Wed, 25 Nov 2026 15:46:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8750211E6A112;
	Wed, 25 Nov 2026 16:46:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795621573; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5M+Y4WoolzAgpLfZyN5TlkHUMbwAipYug+VFIXMqPl0=;
	b=k2Dt9nmE0buK4bYqIChKcV0tgCmwNutYBmzUfMncz5nmqXPDms7CzBAk4lHG7w+AwEWSnq
	59kSslg/CIxRTi3pP3zP2mUDOnW952toHqPOyIYlYU46yZwRBMRGQ9ky4KtgRex+fa6Q2Q
	/qRJijNE583eo6zqrkWtf7kbBLG48BaUO7/zVQcmIJjI+QbsQFu5o7F2dBvPDMKo0LEp23
	aB7SlttQOA1yhF3iabe80jIZnVo/Zziy8gX6LYgkmzvpxzmbQBQV4Wr6UpJ2I3X5UcJSZi
	juUI05Mv2gDdoPNBxPrPiuFGItbvUfI/IV6QGlq7LAIOdaQCh4NlEN9pC7xXBg==
Message-ID: <c8551be7-738b-4a0f-9694-5e557a1dd5ec@bootlin.com>
Date: Wed, 25 Nov 2026 16:46:07 +0100
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
Subject: Re: [PATCH v2 09/12] drm/vkms: add support to non-uniform LUT for
 internal color curves
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Cc: airlied@gmail.com, alex.hung@amd.com, daniel@fooishbar.org,
 hamohammed.sa@gmail.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 mripard@kernel.org, pekka.paalanen@collabora.com,
 robert.mader@collabora.com, simona@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
 <20261106201813.129911-10-leandro.ribeiro@collabora.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261106201813.129911-10-leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/6/26 21:18, Leandro Ribeiro wrote:
> This extends VKMS internal LUT implementation, allowing it to represent
> non-uniform LUTs.
> 
> Such LUTs have the X axis. LUTs that come from userspace (gamma LUT) are
> always uniform, so they don't have a X axis.
> 
> Note: vkms_color_srgb_inv_srgb() error tolerance reduced from 1/255 to
> 119/65535 ~= 0.46/255. Before this patch, the test compared the results
> after quantizing them to 8-bit precision, while the updated test
> compares directly in 16-bit. The LUT precision does not change with this
> patch.
> 
> Reviewed-by: Robert Mader <robert.mader@collabora.com>
> Tested-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
