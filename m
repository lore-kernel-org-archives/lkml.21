Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091195;
	b=w32DdZ50OC2QZzZ1C8QchUnroL4zXjYYnChUTRAgPK85vSoI3YB9tgfuaa0L3qpgyU/k
	 kfXlXQqiy28nQblej56oPKHek1KFun0caycmcAlzTfsrwhJhuFo/YK9YWamNiijupEKmj
	 lOvEbXpyf4i+N1jXb4nwBmEilSvIfSJ6P6R3xDIhL9NkZe5akSodo7fZu2l+y670JTf4X
	 7ucxg6Xk7mgbjc9L5hWKldMDCA16CcJaBFFjhh60EfTKgWKLe7kb3BbTCz/Tn4fNbFyiL
	 CI3jurO7ktJeSFLaRAr44Qm3FRYWzEcqnLwZvr+0P4oZ6CrArvdXS6P2hDhyBxdUcNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091195;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SPtKEPcgPPei/4lpP6NMUNca2C67n223f11xypl4aLY=;
	b=yjTdVbbLxMRJyO3EzAorfWcxsvQ1aNNkF0FgJLXxl91ljeFoEGVl9o9weflxNdBJDEI8
	 5v63mvmHnIB5OM4Gn4imxsefB7lLLYW7msci98YvalbTUX1g9lJJ3NkKdVZdCKYVz+nwe
	 r8auDwgkfRytprHWnDfahoYDPP8PvmY0n8sj/I9IbeFazqsCxyGmySnFJ1t1tci7YaBrE
	 wl9JNlymMr1EiIDB0WbnrS5kMmrzPJQ5vxsoApLsu/GKhrJOo5Pi+QAE/JSRs+HZlHmLr
	 II2biMVIBR60x/KDJH/FM+DF6FqXDBmZ8j3p6fuJ4JCkw6AGWoNDsyrWhLCdNINCldA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sq51NdMw;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=V8rZNA7G;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5AB60A261C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D5AB60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sq51NdMw;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=V8rZNA7G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795091193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SPtKEPcgPPei/4lpP6NMUNca2C67n223f11xypl4aLY=;
	b=Sq51NdMwU8XjX6EzL7kIw7RUFpzBgOffvZHgUmWtgaSZ4CX/Yd9rAyhpbk8VCUUzJVWQ0+
	DePvGeCu+/DleyRQJnC4BCr6dfzvoMV12uJWGHZSoyL/Dm+Rg1Mtf4VbaTelZSOdNspIC9
	EKSlprqSdINF5mxLZmpoBziIzNlRY/A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-Av9-imxDNNufh3DDLWEDXw-1; Thu, 19 Nov 2026 12:26:30 +0000
X-MC-Unique: Av9-imxDNNufh3DDLWEDXw-1
X-Mimecast-MFC-AGG-ID: Av9-imxDNNufh3DDLWEDXw_1795091189
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb6bac1e84so15280035e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795091189; x=1795695989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPtKEPcgPPei/4lpP6NMUNca2C67n223f11xypl4aLY=;
        b=V8rZNA7G2GaTHDLpumciZAe8cxUQQXziNITmEtt3+6mBnH2IFtTdJxV+gUTi5ejbZ7
         tFxcglAZKajrwqDG1xsCKsmeiXENX3toHuU4lOVRnen5rrbNBMlQ7jl9/vkep4YMpm7J
         3tK7xV2rPjDxFO/XhxkM76dwMM5AKbJEEz3KeqrjsUOgkOIA8EhLXTwzsti/rKZXD2so
         x8i3ZsxBe2XUBIV+AC2gQGc+MPBQUdhEMXBcZHriaoi82XbWHcSciZ+/r1D3kxrdZINK
         QqSuFsH+XQaPzGCl3Qzg07kgK1MumkuTlV/5YPsUsjLP/XaOIlye1j4vAIFX1VsSoX3g
         uUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091189; x=1795695989;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPtKEPcgPPei/4lpP6NMUNca2C67n223f11xypl4aLY=;
        b=1RjucAal1NeHYDBVCcw3gQ6jDHMgo+cMK4OsvevZRYsu2CZPIa9XiqxMC5FsGOFXfj
         FRuuAj8UZ88EJxFUmUEDq8gXCJV+Ur0rjwy+UIdiA5zIesH1u1w02mM6k6X+TQTZlYti
         qljBt2/OJbY8CrEi3aUcNpDXerncnfaDM7np1Bsks95mt8aWl5XNZ0OEZquDpnqOMcFY
         2WbGGEY8H7dhjV1WTrmWiAwjIOfd7mBWuadlDTFSJ3vt98nU+ZO9qLkaXO3Mk3/HwkYD
         3iJDfRX3JdM1Q5e12dUxUGO4PKAyXI76/VW+PK9lq9JjZG5dQDnbHGpwJGsO63fiBvQM
         LImg==
X-Forwarded-Encrypted: i=1; AL+hErG4hACf3xxCdqOXaUb0PNCFUOafYnvCqkyOaTrE/mNb0IH7dqw1sGLgSdIbItkv4id7UIZm7wB0ogQRGBI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j63jJxHIbXFgLk16URtboXJgHxykl5tH1NFocP+Ed54uOyPO9
	eHVzFfMY2d5Fop0aa0es6U604r+P4zY2T/6/tFTf6enubduICwcL/j7ViHmfVscF/Ghf15+oeiE
	VyEYnnhG+EmAAEh6acnoGq8yoqFCLs0OQlhwdrEGN6CtECDPqar3kj5dAF9jmg3mXCg==
X-Gm-Gg: AYBFou1IPGEIrio2pZeohPDsFGgOyPnWc/RlymqKyc6OKEtDvdtQV9Qye8QUsNNINXs
	XNigCSHEA9I1lOBA225vjdn0+UZLLaLYuVq3URDjkVxM38ybNFUTlmPS7BeVG5zW/EgnJy4fucG
	IwezBlmzfn3eYVuRv/FMK4wP09phW8G01KHJBTz6lsemH/dem+70zmVVrWvwvnNBblXTMXMNfHI
	/ohwvBNGVCqYTUZHDygC5ZkSCGMX5UEAC8yPZu9+x6RKwgCx5STv4q7d84pWsN0X1XqXy25cUCr
	+3fIqRVyTcYR6d0bOYM75uuLz3OINMBwM9puVMOGSvfSXfptNh3USmopIVGO9VKZNhqWw7YSPu8
	LzmJruaRuFavyUDgfQLakJmwliXjcj/jweuSWdjmfurKyAQrSPa69ic4oyoBwAdl0lbf/JZsuJ8
	FtcUOhCAGH0cqPr4EQjX5MHWhz8zBBZPB2gxtat7nb7Fiu
X-Received: by 2002:a05:600c:a41:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4bb7da1c81emr117566585e9.15.1795091188959;
        Thu, 19 Nov 2026 04:26:28 -0800 (PST)
X-Received: by 2002:a05:600c:a41:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4bb7da1c81emr117565805e9.15.1795091188490;
        Thu, 19 Nov 2026 04:26:28 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573ba95csm11163728f8f.56.2026.11.19.04.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 04:26:27 -0800 (PST)
Message-ID: <7ae72699-c528-466a-872d-e9124fadd11c@redhat.com>
Date: Thu, 19 Nov 2026 13:26:26 +0100
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
Subject: Re: [PATCH net v5 1/4] net: make room for the tunnel header in
 skb_segment_list()
To: Julius Bairaktaris <julius@bairaktaris.de>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 horms@kernel.org, dsahern@kernel.org, idosch@nvidia.com, willemb@google.com,
 steffen.klassert@secunet.com, jiayuan.chen@linux.dev,
 mfleming@cloudflare.com, almasrymina@google.com, bigeasy@linutronix.de,
 richardbgobert@gmail.com, ecree.xilinx@gmail.com, bsdhenrymartin@gmail.com,
 linux-kernel@vger.kernel.org
References: <cover.1794151759.git.julius@bairaktaris.de>
 <c976a72586cda383b3e42486ee3d0176033b973c.1794151759.git.julius@bairaktaris.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <c976a72586cda383b3e42486ee3d0176033b973c.1794151759.git.julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/26 19:26, Julius Bairaktaris wrote:
> skb_segment_list() pushes each frag_list member back to the outer MAC
> header and copies the tunnel headers in front of it, but never checks
> that the member has the headroom. A fraglist GRO packet forwarded into
> a tunnel and segmented in software then hits skb_under_panic() on IPIP,
> and on VXLAN the copy writes before the member's head (KASAN:
> slab-out-of-bounds write in skb_segment_list()).
> 
> Call skb_cow_head() on each member before pushing it.
> 
> Fixes: 3a1296a38d0c ("net: Support GRO/GSO fraglist chaining.")
> Tested-by: Henry Martin <bsdhenrymartin@gmail.com>
> Reviewed-by: Simon Horman <horms@kernel.org>
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
This one looks correct, let me pick it. The reset of the
series will require a new iteration.

/P

