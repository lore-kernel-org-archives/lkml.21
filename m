Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006466;
	b=Osrbbz4vY+zLMJ0xmk19vl1kEPiCWdFxReB4JNFP/C2CHGsDkEe7awoMyhfCBWoel4RR
	 AYbDKUUsqlpUaIgdt1uQICZmQtB2/eH5/BalCOOK0z1LLd6vW6NcwJ6kGfEJdvXWEYpAj
	 ikfwAuAwfqd2rmvU9tuIkBO+Q9Q0D+IGkfr40D0FkaGjVgCUobfd4PX26HmKv2wwJyb++
	 QypVHyKU2c47RgR0nVxum7JspG73v+/QZxt7NDVN05O5SO6ntw1Tvd6DeCqPRNJNtwF7Z
	 p7KLTBXdHy9wpkgbkmMrsr1IlJI/6iFqHWu7blTFu0ZadXx177UVQQJ73grL40McsDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006466;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=snVU1uqD4hTlrRX9k1xzj/33svmeMLTwMOQ0/0pcN24=;
	b=UIYOzw7roxvYHMhAzJT5f2kiLN4X7GSExW8YRaFOFyHj8mjan8v8UMkcu/pqCigGWoSG
	 bxh+GVj2SHg7eA/4F5C4zCkRCjAh2akr++Dcxr2pfie2KqOr3Pwj4eJ/CjBC0Ef0y4NgO
	 ggcRK5+jDK3nYNw5FGjKsmcXYFLuseDHlyxbzV7rLQjOcBWVCcK7r9Mli433PG4GEBiZw
	 e6Ua8GGN0iHrYtt6SSzNvlGDRl4VPB2EBmkXT5oDX3FUhwLsXQCzbrY1OLqjY96zOrGnz
	 CE2VDS2GkSEJm0qXwxCX7O8KXcMnwGVj4zup0zWaQu3rxiIl1xaFsqzbXpT3tDord2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Ata6ASR5;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2209C606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2209C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Ata6ASR5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=snVU1uqD4hTlrRX9k1xzj/33svmeMLTwMOQ0/0pcN24=; t=1795006464; x=2110366464; 
	b=Ata6ASR5Vq10W5iDCsKEQpIW8aZ+AQXpbHjqh/ZohNuCoCIUBvP5HcD/i7DDLFCI4cZFSeUwSeR
	yr0d9bmRxxMmPczqHy9murxLtPeSHSwD3sbuvidHrZXCDc8JZ6yAHUNSqbHU/UdPKzv82PqI41QXt
	owmpktnbOegbYe3N2gtCF9PzhTN+1F5EFpktmxcLNtqNsSgZ6JDu4+qPqZkZomWOSpjNLpXL+P9PJ
	FHLCaCXIOlXrxIqknr72GjzgDDcDBI31om2/AH8cFceCBoBLnEvnHAxIidJJb+1dHI/tVgbaaHPx6
	vuX6v/o/3rrnZqePgP1Z+cR3u56BBO99jWoA==;
Received: from [179.105.94.163] (helo=[192.168.0.4])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xTfB2-000000010Xu-1j4R;
	Wed, 18 Nov 2026 13:54:16 +0100
Message-ID: <99676bca-eba1-46e8-a23a-923bffdc574e@igalia.com>
Date: Wed, 18 Nov 2026 09:54:12 -0300
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
Subject: Re: [PATCH] drm/v3d: Fix double free of the sg_table when a PRIME
 import fails
To: Aleksei Riapolov <tsbol@icloud.com>, mwen@igalia.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261114164451.9222-1-tsbol@icloud.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20261114164451.9222-1-tsbol@icloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Aleksei,

On 14/11/26 13:44, Aleksei Riapolov wrote:

[...]

> 
> Hand the table back to its owner before freeing the object: with
> shmem->sgt cleared, drm_gem_shmem_release() leaves it alone and it is
> unmapped once, by the exporter, on drm_gem_prime_import_dev()'s error
> path. With this change the same test gets -ENOSPC from the failing
> import in each of three consecutive fills and the kernel log stays
> clean.

The issue you reported is real and makes sense, but your fix only treats
the symptom, not the problem.

V3D allocates the GPU address inside the gem_prime_import_sg_table()
callback, before the core marks the object as imported. No teardown
would be correct at that point.

I'd rather move the allocation after the import completes. Implement
.gem_prime_import as a wrapper around drm_gem_prime_import() and call
v3d_bo_create_finish() once it returns. At that point import_attach is
set, so drm_gem_object_put() takes the regular import teardown path,
which unmaps the sg_table once and detaches.

Best regards,
- Maíra

> 
> A reproducer is available on request.
> 
> Fixes: 40609d4820b2 ("drm/v3d: Use the new shmem helpers to reduce driver boilerplate.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aleksei Riapolov <tsbol@icloud.com>
> ---
>   drivers/gpu/drm/v3d/v3d_bo.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
> index db95a2f..48c7807 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -185,6 +185,14 @@ v3d_prime_import_sg_table(struct drm_device *dev,
>   
>   	ret = v3d_bo_create_finish(obj);
>   	if (ret) {
> +		/*
> +		 * obj->import_attach is only set by drm_gem_prime_import_dev()
> +		 * after we return, so drm_gem_shmem_release() would treat this
> +		 * object as native and unmap/free the attachment's sg_table,
> +		 * which the caller unmaps again on its error path. Hand the
> +		 * table back to its owner before freeing the object.
> +		 */
> +		to_v3d_bo(obj)->base.sgt = NULL;
>   		drm_gem_shmem_free(&to_v3d_bo(obj)->base);
>   		return ERR_PTR(ret);
>   	}

