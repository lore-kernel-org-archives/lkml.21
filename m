Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509302;
	b=AZQ2Xb0IccomVyYckkSdtrn+zfKWhJoz+jc/nWJlWrPnKG77AR1vbIgPTqeTsV7aVk4/
	 LHefOAB1Ml1dgC2xETzEskHPK+nOV6dKv1cPACBLfQAmzRZZ+AQiWruBkGlfdzzTnNCEd
	 Ulg0HjEuSUQNaI1A5psSX/7Zsy3hIZ4c9klpqL3aebVN6mv5c/NcRwcm5z1KR33hJ4zvD
	 x2nJz1KoiUAEudCkAeCVllp73GAUbrZwRu9jt6sAqkjc3VvQyqXdknAXmkKDfcmRVMZdO
	 E8DFCw65/3GYewqNF8ZRmTP/6kNa/EbGFnMK5XNSykmpTrsL7DuRfakjWQtAG3Z7Uvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509302;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=OE24u3hL4+Or6VLu2xa5Tj+yjte465jW4ZgW+bKyvw4=;
	b=KlErVVH6WZ6noe5jeuM17ijypPNKgRvNvK+DAZo87g+eKCo9/xO95HYdVcaQ7xjkF+2U
	 EmxvaxVd/T8aNbf0KggjbXCGqv9RnqmkFLMnyReA20R1wB7yD+3kAw3dStkgH2fRjfIiP
	 hemt/zthDdgL0fqgG3o/g0xbn7FlD1Y+OFA0U23/orLFnSezOGnY2FEMim/orAJ27x26T
	 jCxYXH1LIphFRfhOeZS1qK/N8qPPPEei1PNKLFmd0QnGohxRmign37NLzi8vwFOBMMC4e
	 vMmLSTJ04og6RTTXd8cQR6omUX6KVZhroP8IKWy7w1rBKaKURVo4p8QTSmXg9jjBQpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=I1mEl8mG;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D5D606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54D5D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=I1mEl8mG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795509300;
	bh=FYbA62KWNToiEpqX44ANZiX8DxNvw/+C0GZDsKBSEbQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I1mEl8mGQz97LlyJPrrSghHY5DLcOi0Z8VAfS4k6tBMBRQbPmxis9LcE+h9HXTxsV
	 1EssbkvPNBIhKsj3MB5WGZZDfS81vuX+u/gEKqOlXbgwn1V8DyQA7mDlxbfwJgXnRR
	 E4i6YQzPx8DxCuUdzLzmS8wrj/zBIHI2HYJSFinhk8CrzbIFoaxK6H+0XkY5tha6nr
	 gCGnI5DtKEzjA8dN5H5VUclFBGKPnpeqUZD9KIAcnTpYrCg4J5SWTIT+8AKLunbDG8
	 sXQwyYucyWJu9kdwSC2cwtGPzWYGudRw/NCmAvxL4HZ8THxofC/3OL1REbIAK7mV10
	 GzhGZ/n2otliw==
Received: from fedora1.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1D7E117E04DD;
	Tue, 24 Nov 2026 09:35:00 +0100 (CET)
Date: Tue, 24 Nov 2026 09:34:55 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Cc: aiyengar1990@gmail.com, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panfrost: Unmask the interrupts of a re-enabled
 address space
Message-ID: <20261124093455.44ba0561@fedora1.home>
In-Reply-To: <20261121-panfrost-mmu-as-mask-v1-1-13ffb84d5562@gmail.com>
References: <20261121-panfrost-mmu-as-mask-v1-1-13ffb84d5562@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 21 Nov 2026 19:05:20 +0000
Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
wrote:

> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> Sashiko reported this in a review of an unrelated patch.
> 
> After an unhandled fault the AS is in as_faulty_mask and its interrupts
> are masked. panfrost_mmu_as_get() re-enables the AS but writes
> MMU_INT_MASK before it clears the AS from as_faulty_mask, so the
> interrupts stay masked and the next fault on the AS hangs the job until
> the scheduler timeout. Clear the bit first.
> 
> Fixes: ed7a34c57def ("drm/panfrost: Disable the AS on unhandled page faults")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260811215454.A1C8D1F000E9@smtp.kernel.org/
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
> Tested on a Mali-G31 (H616), 7.3.5 with 8a597d099b8b and e9672bf9382f:
> a heap fault after an unhandled fault got no MMU interrupt and the job
> timed out; with this patch as the only change it is handled at once.
> 
> Claude (Anthropic) wrote the patch and the commit message; I reviewed
> them and tested as above.
> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index faa62643c..98d52aca4 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -283,9 +283,9 @@ int panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
>  			 * disabled. We need to re-enable the MMU after
>  			 * clearing+unmasking the AS interrupts.
>  			 */
> +			pfdev->as_faulty_mask &= ~mask;
>  			mmu_write(pfdev, MMU_INT_CLEAR, mask);
>  			mmu_write(pfdev, MMU_INT_MASK, ~pfdev->as_faulty_mask);
> -			pfdev->as_faulty_mask &= ~mask;
>  			panfrost_mmu_enable(pfdev, mmu);
>  		}
>  
> 
> ---
> base-commit: c408466a4dfaee4b12587e926c5b85e68c8b3c40
> change-id: 20261121-panfrost-mmu-as-mask-f5e7ba0994b9
> 
> Best regards,
> --  
> Arun Iyengar <aiyengar1990@gmail.com>
> 
> 

