Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621801;
	b=j/Qclo56iuo1SPHTF3XjgLUbFSZdJRp1fqZ+zwoHTPOD7IBAq2tQJUeZhDm4AHvUMMJt
	 sPM2k9DgVKDvdmX/eTNmQ2EakmPoIvm13JzEo2wTL0jZOhqyo1IxTc93LKMHUci0gCu5T
	 6CPMpUhTA/UkbU/zufW91iHX9fHfCSDEf+Dx3/wR1yc0eE6MUOcdHS3L10nQcoi1/bZBM
	 0pz+87oj4emCMe2wDkfrESBxbZ7TrkMIW4D6ypcZ1J7hok3ykFYEpdrl9gCedjSZMkxMK
	 XExufCkmxAleFFCwQx2G1Cn0rVyK+cDm50bD5rYiR+RujWXS/OTP40gl85+c6/AUtPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621801;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=e76EZuVdk/zJavZpKu/IrkQBob1XPJ451/OfmCEgZd4=;
	b=VLthbf+TFMMxSaMOKqdzMVkEDLv5+G7jYyyd+AD0oPH3krN5nBNOHFXPFoijwjF3JWZ+
	 qVJOXfbOvPmEgXasVXJyIAmA0f+Txn6duM405rkNSHoT62CpjJ/Ey4t8q9Qss2PLZREqk
	 He92HE967bEkivnIlNlyUePOFIexAlVEENe/I24nr6zCTSDhZQff8Y1uXB90RDTvZ7oJh
	 QRZKPDQ0cI/OWUG1qKEQmHjVJrzTsQV2nBZXiAYMkO/cCxuSsHSK/m8ShFzRZejuBQffj
	 ij0GptG3Yqa45Za3bVs9NbJctcfOdWqhzBQkqH/wiRDxbjPD6lROvq1euvebrcReooQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=D3VTcu+m;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD4C606A331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD4C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=D3VTcu+m
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3962AC62219;
	Wed, 25 Nov 2026 15:50:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C4D660480;
	Wed, 25 Nov 2026 15:49:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92A4511E6A175;
	Wed, 25 Nov 2026 16:49:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795621796; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=e76EZuVdk/zJavZpKu/IrkQBob1XPJ451/OfmCEgZd4=;
	b=D3VTcu+m4wLag1usrlpRaoceWYMUfAq5PwHhGBJiWy2vDDrmZll2RplmdIeak/KnCeb0bM
	KKLAx/yQ0VgUJ6FDL6egz4jdZlxQnMV9NWG1Dlqgem7Agc2voTAB7sV6kJGltt8Z+eYNGP
	hScxABceZnP/8sVIFaHm7KkaqSb9zNTYE8QMCxWZtMtLq+RzfuIlmwL6W7pkSo3YM/+XAb
	7fkEAeg5XMi/hD73MaGF2gdEBjgLB+ppBnadBw80imPovsluLsv/fe+IPJDb5TYvT+yi4O
	xWOXsjD/nWwafWGtX0aOZQ+WIlzgBSwbPX2yrrEJUJ6z10829CLqDYkLkc4hLQ==
Message-ID: <ec16a467-5d4a-4c39-876a-4d108c16598b@bootlin.com>
Date: Wed, 25 Nov 2026 16:49:51 +0100
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
Subject: Re: [PATCH v2 11/12] drm/vkms: add script to create optimized LUTs
 for color curves
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Cc: airlied@gmail.com, alex.hung@amd.com, daniel@fooishbar.org,
 hamohammed.sa@gmail.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 mripard@kernel.org, pekka.paalanen@collabora.com,
 robert.mader@collabora.com, simona@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
 <20261106201813.129911-12-leandro.ribeiro@collabora.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261106201813.129911-12-leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/6/26 21:18, Leandro Ribeiro wrote:
> Add a Python script to generate u16 LUTs for VKMS color transfer
> functions while minimizing interpolation and quantization errors.
> 
> The script compares different LUT generation strategies and uses greedy
> subdivision to generate optimized LUTs for the supported transfer
> functions.
> 
> It also outputs the generated LUTs in a format ready to be added to
> vkms_luts.c.
> 
> v2:
> - Address feedback from Sashiko bot: conditionally plot, to avoid issues
>    on headless systems.
> https://sashiko.dev/#/patchset/20260804203351.148521-1-leandro.ribeiro@collabora.com?part=10
> 
> Reviewed-by: Robert Mader <robert.mader@collabora.com>
> Tested-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
