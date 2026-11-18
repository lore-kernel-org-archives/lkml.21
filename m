Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012298;
	b=20Cej/d0IWoEdhAP+qAIxBNjPbgB2+7baN7QbRwlxmWs7AyP30bIhOrCdLwa0k1HVIrC
	 LbbGv3DIM/VaLG1Y3dAdhG+5Vp1p6yc/5ielpO4a276TpeZj1/UMCqFQnVYMT/bottbJC
	 RajdY4aoGJethPexVTqe1bGSaWYju+dxL3YBN4SRu8AUYvf1psKP1vU85yHi4uVCtpEqF
	 jRLZ0JmCZePAzc34o3kFIipsJvTw1yQ6i09VUfr98hPlQsJOrn+3+UleZ0VhD45khjJu+
	 C3r5Ap3+vK0mP47uHHstB6jaDXzsVqF0AtUcMbgovxyt5QFFqZfVBeh9Xn4IZIW7V+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012298;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=OG9POYdEHH7btivB/AUnbEj4V7CX4w1ygKsa7b09Rk8=;
	b=w2kYiX9hFPQTZeTdfn7L4FLN5I7gtAyV2YnqpmPq69syXfpte3ns+rRltKbgp9U6L4t3
	 iQhJV59qoCaZrgil6Eyj9+TFeZ1TOxVPL/NMWuMSLWSRcLnQtf6R0r+AWxTWSrfVRru+r
	 OFNTt9106SA56HfKFsRet8uzHPWxRx8M/F6Qh8pIt4l3jfSw96dWyXDG+l+l947znoh1F
	 dFv+gzyooYfnS5BmB6yevDJuGKqwlpq/zSyNyKzQ6m2pl5vX6AVPn1yJI2+LsMnVAence
	 OK0ko7demcwy61KXo0nixU1imIe2dog8IiHCi371Ru8bmVTRzCXfWdnROsuWdY4g6FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2bS1NRVq;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CE9606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40CE9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2bS1NRVq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F021B4E41626;
	Wed, 18 Nov 2026 14:31:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDC545FE9B;
	Wed, 18 Nov 2026 14:31:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D21B711BC2252;
	Wed, 18 Nov 2026 15:31:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795012291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OG9POYdEHH7btivB/AUnbEj4V7CX4w1ygKsa7b09Rk8=;
	b=2bS1NRVqiott42d5kjBK1IWmEAXlK5HVRiIxhtKO2GL5KL8Bwd9qLcDzmK59MHYTCnH6W2
	hufgIAWgP5qqy8KY+m2j6IJPobNdoE0rYsZ0oYw0HH9JlJ5hRJ9q0tu7g+W148pRGmw7Rl
	aro6gB0Ss/fuV+HLq0NyXEYJmZeihvsOYnV0jNbOy+sOTcFidy2qjSH19FRfd+SJYMwHBH
	2a1gv7pDZxHfmevNaQAz87g4ZJmZLbwOkb3vAEXAOSRo4/xvQ55r6uR6lVXo8j7uD1Y3FV
	YqlKq7UXJtTKjyd05DTqWWQ5/Lz6y1Mmcd6MMDlolqAtmFjW/+6pidVjNFMdXw==
Message-ID: <f728e984-7808-47a8-b9c5-c915bb785995@bootlin.com>
Date: Wed, 18 Nov 2026 15:31:27 +0100
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
Subject: Re: [PATCH v2 02/12] vkms: properly compute gamma LUT size in
 vkms_atomic_check()
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Cc: airlied@gmail.com, alex.hung@amd.com, daniel@fooishbar.org,
 hamohammed.sa@gmail.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 mripard@kernel.org, pekka.paalanen@collabora.com,
 robert.mader@collabora.com, simona@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
 <20261106201813.129911-3-leandro.ribeiro@collabora.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261106201813.129911-3-leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/6/26 21:18, Leandro Ribeiro wrote:
> Gamma LUT size is being computed wrongly, dividing blob size by
> sizeof(struct drm_color_lut *). But the blob is an array of struct
> drm_color_lut.
> 
> Replace sizeof(struct drm_color_lut *) with sizeof(struct
> drm_color_lut), properly validating the userspace gamma LUT size.
> 
> Issue caught by Sashiko bot:
> https://sashiko.dev/#/patchset/20260804203351.148521-1-leandro.ribeiro@collabora.com?part=1
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Reviewed-by: Robert Mader <robert.mader@collabora.com>
> Tested-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 86a8a95694fd..28b99511f186 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -112,7 +112,7 @@ static int vkms_atomic_check(struct drm_device *dev, struct drm_atomic_commit *s
>   		if (!new_crtc_state->gamma_lut || !new_crtc_state->color_mgmt_changed)
>   			continue;
>   
> -		if (new_crtc_state->gamma_lut->length / sizeof(struct drm_color_lut *)
> +		if (new_crtc_state->gamma_lut->length / sizeof(struct drm_color_lut)
>   		    > VKMS_GAMMA_LUT_SIZE)
>   			return -EINVAL;
>   	}

