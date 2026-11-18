Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962435;
	b=2d0f7ZHVj7dhQEV2pbef/iXFsm8+9tpttWXL5Hb0ADHpmpZgN4VmimqaMOb13kpKTb96
	 ZAeFXRBBUxi9bft7ZDAw0J5qDy7hpm/zkTniAgn/D75UDaukykCnDnpgs5myd0f8jothf
	 dONa8PCYwRPekO/TIHTPrFjyRUmMEC8Qlww0z/r4J879vhiOO/RZXXE3VkjLIDluA6u6w
	 2bHIfrYMr6aPBnGRjZu3ytr4pY2YVLb9FrlupaqODpyhzVScOjUgJSQ4z4X9YhfnpfHTE
	 f4ovwNAE2hJ+k3JS3iSqgQSdnd2t2PooP+ytZkOUD1NLnWDuWmLrATr4eRc+bdLW28Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962435;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7vCCcCtwaGrGVv2sDlzk6ia+mY9SKrr7JS36vlskviQ=;
	b=H51V6n2aBFCDQKWqfm9bmZVRIkQtlfAdsibnuLjPKrII9FUtRmt7QvT3xNGIc+rMoLON
	 vwpuCBHfkyBFYzkFPEfQVguswco/D3xFlndA3sO8zNY+92pqEnmT5Nsi1n5yZSSrWDg7p
	 y+BV6N4rx6X85BehJJhUtYfxpD+2QhCKdfSZBXMlYc9CCCepMC3UuXq8wLhHKQRT+J7Ou
	 nt9vN1VdB0zu9jrWxorecDS8Fmzb4sGu9JiB/y7WXv3AAvM9VS3I9RQAfcTm7Dz1lFiN3
	 7OHa057vJcGw5P2yUMy1ImtqELOsMR2tP3LheY+oJaFZEVeWw0vggQ3dzZAagdrIH6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=lVAowdoi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD21606A886
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=lVAowdoi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AFC71F000C4;
	Wed, 18 Nov 2026 00:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794962435;
	bh=7vCCcCtwaGrGVv2sDlzk6ia+mY9SKrr7JS36vlskviQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lVAowdoi1FjiXFrcFtk0+SeU3zy319ccHQbvhAQucoK6rGTZq2FIpzrx8zEzbfQjP
	 1tSSRB5Bj/DvzmdK1B7A0N3nzCR5Ca3ApNSPYGBxCs+7s7xbCwakvwXJDSpiA0Cj2X
	 /xZj833EKA5EgiyW4AHUJFMQZEYfSbuCv8bEj/S0=
Date: Tue, 17 Nov 2026 16:40:34 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Thorsten Blum <blum@kernel.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Christian Brauner
 <brauner@kernel.org>, Sang-Heon Jeon <ekffu200098@gmail.com>, Breno Leitao
 <leitao@debian.org>, Wilson Felipe Pereira <wfelipe@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] init: Use ARRAY_SIZE() in unknown_bootoption()
Message-Id: <20261117164034.556a3539dafa83c43808692c@linux-foundation.org>
In-Reply-To: <20261118000037.552633-2-blum@kernel.org>
References: <20261118000037.552633-2-blum@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 01:00:36 +0100 Thorsten Blum <blum@kernel.org> wrote:

> Remove the NULL terminator from the bootloader array, make its entries
> const, and use ARRAY_SIZE() as the loop bound. Also reuse the for loop
> index i instead of redeclaring it multiple times.
> 
> ...
>
> --- a/init/main.c
> +++ b/init/main.c
> @@ -576,7 +576,8 @@ static int __init unknown_bootoption(char *param, char *val,
>  	 * 1. LILO/Grub pass "BOOT_IMAGE=...";
>  	 * 2. kexec/kdump (kexec-tools) pass "kexec".
>  	 */
> -	const char *bootloader[] = { "BOOT_IMAGE=", "kexec", NULL };
> +	const char * const bootloader[] = { "BOOT_IMAGE=", "kexec" };

While you're in there,  making this

	static const char * const bootloader[] __initconst = ...

could/should/might put this into .init.rodata so its memory gets
recycled later in boot.


