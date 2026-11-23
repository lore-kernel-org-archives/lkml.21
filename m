Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.152.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443854;
	b=tP8dMQKGthTzrL8lsmt0UOVFrmKLCjX0DkPYW44O0Psjgevm2DPMg1X5LrZWwWSs1cJ4
	 LT1UynNNIwo+NwkQHvFP/dyQXJCicRVJ7rvRg/rHDZyzkq+KJhI7q48WX6ctVOuHu5FQm
	 r9DbKuRXA96SX7gbzpYHPIY1LqG0a+RAv0aQBWh796JMYzjgLS2AmGz7jsn+KepppFJRH
	 nkSJ/qMJ3e74fKR4bVR4doAyB9aGcJekuE4+fcfXVHD/s/NdMjzCkpfNxXMYN7oP/xY3B
	 2UQ+aYWq0DyQB/AZJ4BpWG5kvnUloeC2B32n98HOQRBr2v6x2xmKZ6qjhIiHyaLrP7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443854;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-Instance:
	 DKIM2-Signature:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Jb7lWSdA/FOvxoGpQUYVAsPE2P8oHPnQGeJ8TzBswS0=;
	b=yfXT2uBOt2Ohj5ANo6QDRTc7xp7NfC2TvUWv4Siq+F4xsY79AljITUN3+1YJIbEAiuBp
	 TOZIr54buCc9RwjkwXsjiKOubLrb9sNCOoqzpHeOY79SfEYsUbz6LZGWju6EBinrWY15j
	 0jFT/ksTf0egWHNBVosep/tx/dA45qwFPxkYkWvUwqgIo2ulBtpDresxLpeyqD8BzPkxW
	 /DA9PLA2oxiLEZlYLFWDZfpreIjal0+suVvDgVKOTk9uTdT97cuGrgk6K8QcITSskGAOz
	 z63TqweJxtvb6QbQ+7eKGdTcTDildimzTrJCjrvfiBQU8zyalLcrCyzmuibY6xlcitQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=damsy.net;
	spf=pass smtp.mailfrom=damsy.net;
	dkim=pass header.d=damsy.net header.i=@damsy.net header.a=ed25519-sha256 header.s=v1-ed25519-20261120 header.b=Qkw2N36y;
	dkim=pass header.d=damsy.net header.i=@damsy.net header.a=rsa-sha256 header.s=v1-rsa-20261120 header.b=Thrv63xZ;
	arc=none smtp.remote-ip=51.159.152.102
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F1A606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F1A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=damsy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=damsy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=damsy.net header.i=@damsy.net header.a=ed25519-sha256 header.s=v1-ed25519-20261120 header.b=Qkw2N36y;
	dkim=pass (2048-bit key, unprotected) header.d=damsy.net header.i=@damsy.net header.a=rsa-sha256 header.s=v1-rsa-20261120 header.b=Thrv63xZ
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20261120; d=damsy.net; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1795443824; bh=Jb7lWSdA/FOvxoGpQUYVAsP
	E2P8oHPnQGeJ8TzBswS0=; b=Qkw2N36yfKv7exqjMPPXCGm3LxYbRVetoqgVP70AjrJ60mzSzW
	wY44ohBZPJJ6ktnI6Iyco//GeVuLqEfgIYBQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20261120; d=damsy.net; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1795443824; bh=Jb7lWSdA/FOvxoGpQUYVAsP
	E2P8oHPnQGeJ8TzBswS0=; b=Thrv63xZtLBWVUooaRPAl8YRQDzfkdabIl/JXajZiTYhFjM/BW
	x9178xHEueVdhweYrHYAq0YFjW7BXbSFHMbsV/SONWShX+11hRDoxDRcFFLUZW/Kdv4fc+wGn5k
	cXqFFWB4U6YHna7i5Niq/c247yB3hFPEiAqiP8iw64AhSpo+78O3XXuBcPZRdrHACZh8hnNb2v4
	Kl+d0/1WKaLtQHL+jM9HTrX/T3laPUy/bF2otj8sF1vFz6f3N8QTtqFwgQLWqvhhJ2jfYNDCEL2
	vhnYRNdiVcQWKET0Ym4MuOBMAehkXFDn1bp1W4oklNNt7WGrdpKyhpXGKrmCyaZH4wQ==;
Message-Instance: m=1; h=sha256:CbnZATPqXVVlsT1Fi2UUSaZAXHiT5QED/YMAGZaC
	sWs=:feajcthX+9ujN7/lqiDFASl385l/1K3ZGNeesPEE87o=;
DKIM2-Signature: i=1; m=1; t=1795443824; d=damsy.net; mf=PHBpZXJyZS1lcmlj
	QGRhbXN5Lm5ldD4=; rt=PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+,PGNocmlzdGlhbi5r
	b2VuaWdAYW1kLmNvbT4=,PEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+,PHBpZXJyZS1lcmljLnBl
	bGxvdXgtcHJheWVyQGFtZC5jb20+,PHNpbW9uYUBmZndsbC5jaD4=,PGFpcmxpZWRAZ21haWwu
	Y29tPg==,PHNhc2hpa28tYm90QGtlcm5lbC5vcmc+,PGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
	b3Aub3JnPg==,PGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+,PGxpbnV4LWtlcm5l
	bEB2Z2VyLmtlcm5lbC5vcmc+; s=v2-mldsa44-20261103:mldsa44:k4/bdU9X9jHWmx1m
	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|v2-ed25519-20261120:
	ed25519-sha256:CTVKiaR1Yt1Mn9Yultkd1MIPIgQAaRHO6CMKyluErekys3ymK4yJnjuUR2tZ
	GzJCxds6KQMibi9IDKH55fyTBQ==|v2-rsa-20261120:rsa-sha256:krf7UbLk9V1csOfo
	2L6OqouYbWcvu/otMK1Mb5QlDIBJP6sSC9IrBjvWhPlgNsAMpGvY0ES+nxnullC6+HRdLpmB
	4LmxN22lbkpoENYxsLjeSzMOWx7tOkmIEvDlYgMF2rqGaXZyn+35MV8CPo4H1Iz1FZKMWFGx
	EuUT/OvRMNvkLdfxtxczN6UVArazdW+H8fULDbSDjmGvW7wAiR9KJlQheGSPxYRhSglLl9Ac
	jCUTVoO8Tize4Qhyk1YaZvFEyED3Lf0ay8M2/k+CUYASIM3rI7vt+bsuZ1ijn16wlM9vtx0B
	CGOJXrP8VMcEXsOLAfey07Xgn4bFQ9qz+dy4UQ==;
Message-ID: <367d0247-8523-42bb-9c8c-5194f0c9fe95@damsy.net>
Date: Mon, 23 Nov 2026 15:23:44 +0100
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
Subject: Re: [PATCH v4 1/6] drm/amdkfd: avoid NULL kfd_process_device in
 kfd_profiler_pmc
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sashiko-bot <sashiko-bot@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261109171333.4329-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: fr
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <20261109171333.4329-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

ping ?

Le 09/11/2026 à 18:13, Pierre-Eric Pelloux-Prayer a écrit :
> All other callers of kfd_process_device_data_by_id deal with
> a possible NULL return value except kfd_profiler_pmc.
> 
> Check it after the mutex unlock and return -EINVAL as others
> place do.
> 
> Reported-by: Sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20261029152000.22001-1-pierre-eric.pelloux-prayer@amd.com?part=4
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 6c710e4a5220..ad086240a6dd 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -3463,8 +3463,10 @@ static inline int kfd_profiler_pmc(struct kfd_process *p,
>   	/* Enable/disable perfcount if requested */
>   	mutex_lock(&p->mutex);
>   	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
> -	dqm = pdd->dev->dqm;
>   	mutex_unlock(&p->mutex);
> +	if (!pdd)
> +		return -EINVAL;
> +	dqm = pdd->dev->dqm;
>   
>   	dqm->ops.set_perfcount(dqm, args->perfcount_enable);
>   	return status;

