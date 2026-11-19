Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124428;
	b=oi/ls1y02vKJ2ryIJbn/OMfx0pirmJjCQaE50dwMFIbqNYxZXRPMBQwrLbIWcI1PWZdz
	 kK28puabMt8An5oy4eqcElMqMzmULfd2zE2kCBwv4Gbsb6LnDW+Ge//lVs3rFcNtXfuV9
	 4ICDnbbJjbAbyZI3S9PqKuW1WtCrRCS1+LWz0fRXsbcKD32pVkHHalRnZtM3sX2VzRkAw
	 ECGtH28AON0+9tjCD07qDuR3WzQJj18KlTyjkLDxweoIUkPTdQRwzDYVPzYDPkaXOspkn
	 re9Yq9UxkTxwELD4ot3TGVgT0tviuzyF+xvLqeybjKevh6h5phip/AVzOS7J4HBgaNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124428;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6BvNyHgvViv9IZmuvvYxPHjZklGMCfTMavfke1LQWLY=;
	b=xXyPkXj5abtx6G0DJMAOdZi/scUQX+tYbGrCIN0UK42eIzWq2dn1Rn54H3WlBfWUDT2D
	 uJ8o5KROaE09VdqfKXUZyo8taXq9uNrRS4nrnCOI5CofFAMRrq3Dd3uzYvgsmE7Uenes4
	 OU9MsDTNz3MeBT32BRViHdj3B2BxfZdhqXpvaPC344eUFeaXJiToSBsmB9tVzJAUuJMVw
	 rRK6AZ3ip4byZ1ExkxSSC4WSQ0zLhxXOUxxyfohVeWEKebCcFtkfNz05c/gGb4VFFork1
	 braXzX/FzNlKYUP3MworbyeIDWIMeq3vTzsuCm35c2YTJMR2RfiZiC0hrfpwRIKEpJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UY92mI76;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431A360A2613
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UY92mI76
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B851F000C0;
	Thu, 19 Nov 2026 21:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795124427;
	bh=6BvNyHgvViv9IZmuvvYxPHjZklGMCfTMavfke1LQWLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UY92mI76u/GrLHGRSW9U2aYfpLifGf0FrRQz14MIS6aPNp+bdi849ODOyJlX8IZif
	 ihhrZ51v2tlrmZemnZK69RTNyEwp2yVK78RaxCKf0IhZgAP2N/5i6XRSpouHsgMC7B
	 2lcrt1cs1PUJDGYblXRv4zKOqD/wv1X525cJI3uB8QWGgQwaDfLCltOGI2hAFASr/a
	 SxBPQaunwTUzNrgzhZeMhmVvzsNUgidxjBETtT9GEtQrGbrqGLahvOP0MuNaKRL655
	 8hSM0rIl/4jiQHtpv6fSp17ztwuHFgXrbVzN8CbJWF6/Dy/TvPITyxQAocPCmBMtR4
	 tPROyGoz6wnXQ==
Date: Thu, 19 Nov 2026 22:40:15 +0100
From: Gao Xiang <xiang@kernel.org>
To: Friendy Su <friendy.su@sony.com>
Cc: xiang@kernel.org, chao@kernel.org, jack@suse.cz, amir73il@gmail.com,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Yuezhang Mo <Yuezhang.Mo@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>
Subject: Re: [PATCH v2] erofs: set SB_I_ALLOW_HSM for bdev-based mounts
Message-ID: <av9svyT3otgEEDgX@MacBookPro.fritz.box>
Mail-Followup-To: Friendy Su <friendy.su@sony.com>, xiang@kernel.org,
	chao@kernel.org, jack@suse.cz, amir73il@gmail.com,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Yuezhang Mo <Yuezhang.Mo@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>
References: <20261023021635.2852395-1-friendy.su@sony.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023021635.2852395-1-friendy.su@sony.com>

Hi Friendy,

On Fri, Oct 23, 2026 at 10:16:35AM +0800, Friendy Su wrote:
> SB_I_ALLOW_HSM makes erofs support fanotify FAN_PRE_ACCESS event
> for bdev-based mounts. file-backed mounts do not support this.
> 
> This is for use case that erofs file data is not available on
> local block device at mount, but need to be filled at fanotify
> FAN_PRE_ACCESS event handler.
> 
> E.g. format erofs to blob mode, meta data on /dev/pmem0, file data
> on blob device /dev/pmem1. The file content in blob device is dummy.
> 
> mount as below:
> 
> $ sudo mount -o dax,device=/dev/pmem1 /dev/pmem0 /mnt/erofs/
> 
> In FAN_PRE_ACCESS handler, actual file content is fetched from remote
> then filled into the DAX mounted block device /dev/pmem1.


Set SB_I_ALLOW_HSM to enable fanotify FAN_PRE_ACCESS events for
bdev-backed mounts. File-backed mounts are not supported.

This allows EROFS to handle cases where file data is not available
locally at mount time and needs to be fetched on demand by a
FAN_PRE_ACCESS event handler.

For example, an EROFS image can use blob mode with metadata stored
on /dev/pmem0 and file data on /dev/pmem1, where the latter initially
contains dummy data.

The filesystem can be mounted with:

    mount -o dax,device=/dev/pmem1 /dev/pmem0 /mnt/erofs

On receiving a FAN_PRE_ACCESS event, the handler fetches the actual
file data from a remote source and fills the corresponding blocks
on /dev/pmem1 before access proceeds.


> 
> Signed-off-by: Friendy Su <friendy.su@sony.com>
> Reviewed-by: Yuezhang Mo <Yuezhang.Mo@sony.com>
> Reviewed-by: Daniel Palmer <daniel.palmer@sony.com>
> ---
>  fs/erofs/super.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index 0967aace9f7f..be8728b8d116 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -667,6 +667,15 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
>  		errorfc(fc, "FSDAX is not allowed when inode_share is on");
>  		return -EINVAL;
>  	}
> +	if (!erofs_is_fileio_mode(sbi)) {
> +		/*
> +		 * Only enable HSM to support fanotify FAN_PRE_ACCESS event
> +		 * under block device backed mounts.
> +		 * For file-backed mounts, do not enable since erofs-utils
> +		 * has already supported FAN_PRE_ACCESS event on backend image.
> +		 */

Could you just change it to

		 * Follow other filesystems by supporting FAN_PRE_ACCESS events
		 * only on bdev-backed mount. Don't bother with file-backed mounts.

I hope we could avoid mentioning user-space details
in the kernel codebase directly.

Could you send a new version as I suggested, otherwise
it looks good to me,

Reviewed-by: Gao Xiang <xiang@kernel.org>

Thanks,
Gao Xiang

> +		sb->s_iflags |= SB_I_ALLOW_HSM;
> +	}
>  
>  	sbi->blkszbits = PAGE_SHIFT;
>  	if (erofs_is_fileio_mode(sbi)) {
> -- 
> 2.34.1
> 
> 
