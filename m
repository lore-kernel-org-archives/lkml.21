Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096609;
	b=VJyOGp6bMQWBDsV2aotSQXUBDU/FcZe632O+0gcvClaYgaVkfjcxL5SRu5tgrOSAam7I
	 HQQPy/2lyP4wJvscohKXI9lymg5iy0/Su7taJ/F1QnoN9F050S0X/ztk/IrpeVDNSnX6+
	 zsVOa0BSB8FiSsGNnP6HiXuyLnyOyul4TV6HD7hy8bvtCNAAxfMYcEeUQdOMxoWgS/U45
	 CX/O8+ObaB+KgZx+B4u3uh4pAg4mgZv/1qcztkHzsJmjzKi5MfHr2I7lre/UyQDpRf/cl
	 8NrAOIrYPS9kKTZKqo/3C9FsDrP/8NWr57n9mB7osRqBFzRLZ4Dk4UJHhc6u93F3JMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096609;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=JaH2ERcOdqXe22GDDVQwmxv1pTLrLmRw/kARhV4jLxQ=;
	b=cLFu9XoR8m+L17yrQj7vRki0FUhSQmYm/W2/wjbnQ9Y+n8QkQdenq5nW0BAs9T9XWDAS
	 XCvy9iEp0r9hymYEP2S+Zu4m2/QTMTPKvEFpxWbg0bEM9DaD9it/typd9wSEL5Eba5uHr
	 fD3MI4n1+sqgP6fUkCUQPkaB8agkg8jL2cu3tz1OzZkC8LlaQbbrn1WAmpZmkdQ1dAC4G
	 cWTjncseI/PBsd86W8fnso78Ol+CuV01gaHl+786GuxDa+TuijWLMb0x5Rrh7GE4KjWNy
	 Om7jEhYwJo9TcZplMJ+bTLPSQDSIKmlIBxvYM6/8TuuGSyIc2nYPntgva7Lih8K4IRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gp8rIV0N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 977FD606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gp8rIV0N
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 829561F000C6;
	Thu, 19 Nov 2026 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096609;
	bh=JaH2ERcOdqXe22GDDVQwmxv1pTLrLmRw/kARhV4jLxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gp8rIV0NTptIohMnJQ05QaiSObOkq3exz3L/SdW/PqMI6BPddaWWIsIEnpQWOQ/SH
	 iFKIN/DNagn/mKnYeay8ptBSslceV4SLQU6kQ4vtaIc05BJMFRKIAjPqwu5i8QJ/cP
	 ibgVMkpEhNwZ0qSiZqUjl71o4d7mYIe7Oulz+oblkpNqnlKO4rR+FCI7AYFeZy+PaM
	 scwzo0vUtbaGfcPdLDco6Z2ySCtTuo2I+rLGfUfqDNfXxqM7Zoxff++K6Ix7nHF7DF
	 u25v2+8TuA5Hl6Vpfe9Cgm9Qd7s3Mrad5o8b9MprsxllXQ2dA7INrTEfAENpw3HAKr
	 DFVXiN0monb+A==
Date: Thu, 19 Nov 2026 14:56:46 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Michael Walle <mwalle@kernel.org>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 02/11] nvmem: drain keepout and cell post-processing
 accesses
Message-ID: <fhmks2ykxm7dtt2qsm7q2d4b25l7pft6tmmzl5bwlefpzg4usm@i7aqkq6w6fne>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
 <20261117-submit-nvmem-provider-lifetime-v1-v1-2-3cfbd48812b5@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-2-3cfbd48812b5@gmail.com>

On Tue, Nov 17, 2026 at 12:38:09PM -0700, James Hilliard wrote:
> The register callbacks are protected by SRCU, but keepout traversal and
> cell post-processing take place outside that protection. Unregister can
> finish draining a register read and return while its caller still uses
> a provider-owned keepout table or invokes a post-processing callback.
> 
> Hold the SRCU read lock across the complete access, including keepout
> handling and post-processing. Reject accesses after the operations pointer
> has been cleared, including reads satisfied entirely by a keepout.
> 
> Fixes: 6a7b4134fb7a ("nvmem: protect nvmem_device::ops with SRCU")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/nvmem/core.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 802637f375f8..73aa53145f0b 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -164,6 +164,10 @@ static int nvmem_access_with_keepouts(struct nvmem_device *nvmem,
>  static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
>  			  void *val, size_t bytes)
>  {
> +	guard(srcu)(&nvmem->srcu);
> +	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
> +		return -ENODEV;
> +
>  	if (!nvmem->nkeepout)
>  		return __nvmem_reg_read(nvmem, offset, val, bytes);
>  
> @@ -173,6 +177,10 @@ static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
>  static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
>  			   void *val, size_t bytes)
>  {
> +	guard(srcu)(&nvmem->srcu);
> +	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
> +		return -ENODEV;
> +
>  	if (!nvmem->nkeepout)
>  		return __nvmem_reg_write(nvmem, offset, val, bytes);
>  
> @@ -1651,6 +1659,10 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
>  {
>  	int rc;
>  
> +	guard(srcu)(&nvmem->srcu);
> +	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
> +		return -ENODEV;
> +
>  	rc = nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
>  
>  	if (rc)
> 
> -- 
> 2.53.0
>

With that, you always double the SRCU critical section. I'd prefer to
see the existing SRCU guards in lower-level functions removed. If this
is not possible, then we may need to shuffle the code around and
introduce "unlocked" helpers that don't take the SRCU lock.

Bart
