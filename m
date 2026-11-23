Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448284;
	b=3hof1lbbdUo+o6M1jT84UaFUU5YxTF+HXQnBtiTk9wVz8iisPgcjJ2rhM1A5/9Kc2Qhh
	 XTIPvxv6MXSSm5axbcnu4j2tpM15KMoOp1F8D5jP/B/4+JROK2OSIBJSbD5c5A7JEi0Zm
	 njtpIafX6RZULPwVOMCgORs49hWEepEDoOsNLEX4+Tz7FvRNz8TpXv5WWSxvzYHKuC00O
	 MXohGC/mQxpU/fyUcMS3lLinzakfJ1AhozhjPmzfi5phKolTi4cSUiXlK2G/8HpRviyJo
	 yBF5om16THrUfURydK2pzeV3B1L5mMoWvWTw/lh1iq88XdxSLDCOSYs3RrmmVvgtMXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448284;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=l6dScsxo+0ITDV7Zfpa7zQsqdsYOTYl/xp8pCTnJiVI=;
	b=JdIuL6FPPtHfpp5nV11wB8/UlB+qk25yhQsaMsOVE89olY9QjV+3tXXc8vg3u5TahiWB
	 QEbp5q+ZX4KS7ulkJUJVnZjkLsSqsS7lOvSvG4wtCwXx9zrz+WM9IvsVIuGL3opHnHx/P
	 xIvhU51+QziloOTjwSE/XgZkrUC+GcPaGGfD0gvE7y0BNAu0T9KMa6YcR7kcJ44C36frT
	 Hy6wyVDkmdeF9av/DeS9RU1XjWHyM35fEB+7ip0quHnMk5la7Yja/kgu81CAZWygtHG+Y
	 s92c7iMvY085S+WNiuL9gnPN107i4HoWfpkYr/5tBYqFWjUflthZKf2C1PfdgugLbeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oBfS5aJH;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CFA606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7CFA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oBfS5aJH
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE7C11476;
	Mon, 23 Nov 2026 07:37:58 -0800 (PST)
Received: from [10.57.63.212] (unknown [10.57.63.212])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FA593F632;
	Mon, 23 Nov 2026 07:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795448281; bh=c98wA/p4y1OgCpSwv0LnhnHHbNl7crB3Zu7U0JjfI7g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oBfS5aJHGgVKJUL33HJv7MLAp/P44S7y7iOZ4xvGq+0aQtXzsXcGhSoLWw07gUOTC
	 modZVsEP5lrGtGUg3+tx95QfVmYhJ1AxfevFKoAxFnVCs6QKhgBaChO8mxDDpgpc6S
	 VPEsW9/BCxY3UVFyDDv1jWSL1B16KoIyUwMypI8Q=
Message-ID: <37d17a3a-6b8e-4909-85df-7980d689bb3f@arm.com>
Date: Mon, 23 Nov 2026 15:37:55 +0000
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
Subject: Re: [PATCH 3/4] drm/panfrost: only put powered shader cores in the
 job affinity
To: Young-Jun Hong <nirvanah@nirvanahyj.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, =?UTF-8?Q?Adri=C3=A1n_Larumbe?=
 <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexey Sheplyakov <asheplyakov@basealt.ru>,
 "Vadim V. Vlasov" <vadim.vlasov@elpitech.ru>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261106054210.2893230-1-nirvanah@nirvanahyj.com>
 <20261106054210.2893230-4-nirvanah@nirvanahyj.com_quarantine>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20261106054210.2893230-4-nirvanah@nirvanahyj.com_quarantine>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2026 05:41, Young-Jun Hong wrote:
> On GPUs with more than one L2 (core group), panfrost powers only the
> first core group (panfrost_get_core_mask()), but the job affinity is
> written from shader_present, i.e. it also names the cores of the second,
> unpowered group (Mali-T628 MP6 on Exynos 5422: l2_present 0x11, 4+2
> cores, affinity 0x3f while only 0x0f is powered).
> 
> Write the affinity from the same mask that was powered, so a job never
> names cores that are off.
> 
> Tested on Samsung ARTIK 10 (Exynos 5422), Mali-T628 MP6.
> 
> The analysis, the code and this changelog were produced with Claude
> Code (Anthropic), a coding assistant.
> 
> Fixes: 6e55d273708b ("drm/panfrost: initial dual core group GPUs support")
> Signed-off-by: Young-Jun Hong <nirvanah@nirvanahyj.com>

So this patch might be a valid fix. But:

a) It's AI generated and I'm not sure whether any human thought has gone
into it.

b) The next patch in the series basically undoes the change.

The T628 is an awkward beast because it has these two (non-coherent)
core groups. So far there hasn't been much appetite for trying to
support it well because it's pretty rare and AFAIK it's the only GPU
which has this setup.

My own understanding is that this patch is also irrelevant in that the
GPU hardware will effectively AND the affinity with the powered on
shaders. Hence I'd want to see an actual user report (not an AI-report)
that this "fix" actually helps. Sadly I don't have hardware to test this.

Thanks,
Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 6 ++++++
>  drivers/gpu/drm/panfrost/panfrost_gpu.h | 1 +
>  drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 6081b27829e1..420d224276a5 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -452,6 +452,12 @@ static u64 panfrost_get_core_mask(struct panfrost_device *pfdev)
>  	return core_mask;
>  }
>  
> +/* cores that panfrost_gpu_power_on() powers */
> +u64 panfrost_powered_core_mask(struct panfrost_device *pfdev)
> +{
> +	return pfdev->features.shader_present & panfrost_get_core_mask(pfdev);
> +}
> +
>  void panfrost_gpu_power_on(struct panfrost_device *pfdev)
>  {
>  	int ret;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
> index b4fef11211d5..78a6270b7fcb 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
> @@ -13,6 +13,7 @@ void panfrost_gpu_fini(struct panfrost_device *pfdev);
>  u32 panfrost_gpu_get_latest_flush_id(struct panfrost_device *pfdev);
>  
>  int panfrost_gpu_soft_reset(struct panfrost_device *pfdev);
> +u64 panfrost_powered_core_mask(struct panfrost_device *pfdev);
>  void panfrost_gpu_power_on(struct panfrost_device *pfdev);
>  void panfrost_gpu_power_off(struct panfrost_device *pfdev);
>  void panfrost_gpu_suspend_irq(struct panfrost_device *pfdev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 4ddf4b722ddf..33da86587db7 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -143,7 +143,7 @@ static void panfrost_job_write_affinity(struct panfrost_device *pfdev,
>  	 * Eventually we may need to support tiler only jobs and h/w with
>  	 * multiple (2) coherent core groups
>  	 */
> -	affinity = pfdev->features.shader_present;
> +	affinity = panfrost_powered_core_mask(pfdev);
>  
>  	job_write(pfdev, JS_AFFINITY_NEXT_LO(js), lower_32_bits(affinity));
>  	job_write(pfdev, JS_AFFINITY_NEXT_HI(js), upper_32_bits(affinity));

