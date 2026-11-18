Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972512;
	b=wudztFASswNIJdh9zatjeIWJBG6m4YAQxy4JhgYpUrxG0t4NJagfdAYzxhb4zxWMGKc3
	 CrWj7A2+egI2ntKiiK4JJlQTM8tWyjLuA3CSvLbpP/VZV7jQh0riEadFojWEguJ/rRPNL
	 IgSgpwf2JzBGBlfLqdokmJ7oCcq3YKXRW3OgUD8DlACtRS0NHee9Hja16DZ3ZSN1SK9DR
	 MUounLUaJx5mymovb9AyJgcRY4nBXUytmNETWGBEvjOfWyyz+DDpSkidkLrN15scRflCt
	 Wwj79ETrOCjO00/LUVyxDj198FGBqyre5V3J676ZSNOC1Guj9iGzfaGfbQCgaFGdfNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972512;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=OQurdBkKxkbhxtgp8myE5vmibpMYsIIamR+xgT7WLpQ=;
	b=3gflgjenCnQYTGEYQ1q5fISwucbWNkG4LpPb4I7u8VD1LB+ALnjIC1WwOdXLKlp1JG/Q
	 CysWb1cxqQiVtJRtepxlZuemFAarUNFxmgcxRFL+We51qVkdQp+lddDdAOYehN/MjTVT3
	 Quf91EWDQbNCJf0Bek32tGPDdOWBM+ETp2FQMOQIKIVrshlOwL+f41oyB+qDcsC4tT7ie
	 Vk5hB0jT+dE3znxwH2xPGgVjuWsR70cbd+1LnXy7fIPDxOtdEujY20jN0cR7zuLQPqNMU
	 Dgj7Ja4bT632YQsOs3br0rHBbHCf2PqzZU+m+BIr64Rf5FbwfzxsS8M9mEn5Z3VUaXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j8uuaBAl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37631606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j8uuaBAl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7C31F000C4;
	Wed, 18 Nov 2026 03:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794972511;
	bh=OQurdBkKxkbhxtgp8myE5vmibpMYsIIamR+xgT7WLpQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=j8uuaBAlBidKgVeIm7fyQUAg0OFmHPk4oc903Aif4DZYu44m3VZCoswmWs+x8eL6k
	 +/OR+/nEIxmb7g5OfDxba5nCJlPdhttcF6uHyDMBoKB74XGqW/agX6+BdJGJwWj/uE
	 lGGDrLa+XzZ3XgoP1frDyRQ+gHs2xbzhSIJ2+dVj7LihoesRNy8psQyDnvaBpksski
	 NxSPSRfhOLkoW0eESMffJuz0MxvNFiwGqSSb7FT8Z/oNFUXjr8d/ime68FDxb0KU7x
	 ZFTaoNGfhrpSGI8TjOvoaHVmwfxj0GvtusXmZn733uWM9nHJG5ahhk+WSAkog4TnU2
	 Fbz15zcVLtSZQ==
Date: Tue, 17 Nov 2026 20:28:30 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: unaligned: fix __setup handlers
In-Reply-To: <20261111-fix-riscv-unaligned-v1-1-0722514fc1e4@mobileye.com>
Message-ID: <2eee9e1a-83c2-90ca-a374-fd461c0a050c@kernel.org>
References: <20261111-fix-riscv-unaligned-v1-1-0722514fc1e4@mobileye.com>
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

On Wed, 11 Nov 2026, Vladimir Kondratiev wrote:

> Returning -EINVAL from a __setup() callback cause invalid
> unaligned_scalar_speed= and unaligned_vector_speed=
> values to be treated as handled. obsolete_checksetup() treats any
> non-zero return value from setup_func() as success, so an unrecognized
> argument is silently accepted instead of being reported as an unknown
> boot option.
> 
> __setup() handlers return 0 on failure.
> 
> Fixes: aecb09e091dc ("riscv: Add parameter for skipping access speed tests")
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

Thanks, queued for v7.4-rc with a stable@ cc.


- Paul
