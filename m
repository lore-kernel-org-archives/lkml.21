Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438628;
	b=IKLPngG3OpLbs/BfSUL64J3bQx9DMGbPGeXyERGxDJFaw6IxODScp35OFV97wYMv1APD
	 6JrBuYFSKL20txVQ1rxYFxcRxoxnEX2D5o44qIMgCVgYOlwwpAvxaq/U+ka674dTcsTiu
	 p93xuuNDHq6My4PpXWXVlMY8ZG10JYtlSEsRjUDLVgp/g6DGx4wL39G1DmuagElzYbzKa
	 OfiN5Rj0Y6DRJCMwM+7y7zA73R8ku9QYNcy+SBa0kTQKPkychSZzcmTVsokpvvbJti763
	 rT1R0BsrZewU+tkCGV0LI9/6wNYH1QgehLYdFytEtsWLnrZMTPIvCfUNiDoqP1MxzEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CozIl/nMLzShLCc13DpVZQu/fWHZTEKCUOFKOb0MjSA=;
	b=KKoW/otxLHh2UoHaqaJGYfKKjVsU2MMbGFuV5KfliA6y4Iwr51encehQz5+RUFtDNxyb
	 fMyCzvXu0mbkLDXCEGDifFF4JpG/fmTCaJ1AvqXyuhTABdb6HldIZo4eN81phZsqLMmJo
	 nvLScfT3PiHD59mAIYWB4+BG4V5G7nIkSv0X9EV19o90Mb2j+nnznQEpN0BoDaEWIyk09
	 RLPc/FyLsGDm9IP20jkxXjgpTaEbsyRbkGwih22XQwNLWHVb8t81QGd73N8dVC2eO+VNH
	 fSmral24mqizd6X2sAgZxHI+4Lz3poG3HotdwOGcBWsHUwmkBR2YYhPYfkKhyepH6qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O87i8GVc;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43646606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43646606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O87i8GVc
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491971ac844so3002989f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438627; x=1796043427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CozIl/nMLzShLCc13DpVZQu/fWHZTEKCUOFKOb0MjSA=;
        b=O87i8GVcp2rY4oL5wP+87gFKFjwahk7pR4foZm6HCuDUGX5vA2H5zrUbu6AbGWrcwE
         V57Y1P06JQjuEXHTs4gwPjZronptVBRKQADW9co9FpImSZtsjvKFvaYHaA7xZ+ZA0ZrG
         EZDTEHiRBqh3xR7/8cd4HmcxDIOSmJzYo0qcuxsp8gBebJU7V00FLXxa05zgXyiOE0UD
         CMxfTUdry0bbXaGFr+Lkw2XSbI1fsbR0ZbuCrw/UPVX5uNIG+qjEGTJ2eEOdBduxC/CW
         aBr6T/phVOyB6W9uljyqyMIMpPOO1VAmBAQBpJ5c8t3ZLPMTU/j0uacJW3Eqa+XnIRiQ
         K3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438627; x=1796043427;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CozIl/nMLzShLCc13DpVZQu/fWHZTEKCUOFKOb0MjSA=;
        b=MA5c+6GWZU6SaJyGTXWcpJBARQH6DTBkAFDrGKvSM4YTF4B/eYRq0bwdc0ZF+z0TEH
         bGTgem7As9vQJLNIwibQGMc87wKhsZ4pry+idbnCUSaZSysu51jf9oARjXSnxjtAX3W5
         Nx/eI13IqwvvGmXybQA9PWPumWQHx+LYKm6KQfewu4PTRBVmpBy19ZFmWc7x3sd0V8K/
         2tN/3rOsuOeED/l/e1E7Oi3siDGo2aXCcFaWNhE3Cxh2teNlck5a9avVVt2HDAMdeRpe
         2yMwk7/SSyp8VfUubogAUZTHZCJftE7IzL5IKcqND5nB3ymObFKsNMbBaTvq+fqInS7k
         RQWg==
X-Forwarded-Encrypted: i=1; AL+hErFbFlRu++b2NWJywFjzxHdDuWDbX6GEp9DFENqxOoSU5CuaTo+7jTYlki501ABzq9HWFF/Nq/CaZgue3Dg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LfmKyKVxxRQzTPV6UUrARKSk2gtbYn7lRqsRbEUVHUJNhsJEY
	23/QMa82Y5MfeAK/h5ChAaBw3b/er8OOhjGtqP2AHpSHa4mcutNcqkYg
X-Gm-Gg: AZFdTZfqJ2KD/1NCWIDt8QAXbO3YLbeI9u3oN7321GPdCIxcb/w+wPzP345agHD65At
	7+T0Rg15SIUBsonct/MmTDsm/VV273qVrx2fnCPifpC+3KoD6ViQmCNz6VKseMDvvHgPZQEYZVQ
	EebnjZkIFkjOfs1+lw3TMamkxtoJR4fQftXHiWnFI7wV5GWzoaNLl5GdEFQmE97Mu0vjRXpEQz7
	Gzeuppu7+gHb5QO7n2gpBhz5s+fF7WrnIkTGUhkPaTctfJt0r3PsGvq8msvXmBKm7wVZrzFEhT7
	88v0YDn5MS2AdcScOFu4gKQlnVl1d8ca2ACd8+NP3UcUuxQ3OAZl8kMnDNMciBIzuiqxSuVpTnx
	21wk+sXreMUnwPhAjSOmMkJrU9J6mW3mo1SNYrkTkhPIzPYf8SvSYpzbY7DQr0eZTfiPCqiebd3
	ZGbpnKG0h01nzdv/iITUGUjjZTdi7LC/3Bn+KKeIZDT3SC0D+HDS07gePEfkX74q1oTJJHWrsYu
	2ajnRFem8Cf7DiIgq9kMsGIb8QZvzEbLoQhwXUU7HXUrtKYxO2nTp7OyaEugmzKtC/cnpaIEkP9
	4xlxl+MVfWjA0k0UBfkKabj1wgP01XVO0ae8sA==
X-Received: by 2002:a05:6000:4617:b0:48d:f464:6989 with SMTP id ffacd0b85a97d-4abb18cbe2cmr22485211f8f.27.1795438626537;
        Mon, 23 Nov 2026 04:57:06 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm21305484f8f.7.2026.11.23.04.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:57:06 -0800 (PST)
Date: Mon, 23 Nov 2026 13:08:51 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: KP Singh <kpsingh@kernel.org>, Matt Bobrowski <matt@bobrowski.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] bpf, lsm: Make bpf_lsm_get_retval_range()
 return void
Message-ID: <awQ642Ko94a255rT@mail.gmail.com>
References: <20261120-jf-bpf-lsm-retval-range-v1-1-d712e4090907@linux.dev>
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
In-Reply-To: <20261120-jf-bpf-lsm-retval-range-v1-1-d712e4090907@linux.dev>

On 26/11/20 04:28AM, Jose Fernandez (Anthropic) wrote:
> With CONFIG_BPF_FMODRET_SCAN=y, fmod_ret programs can attach to tagged
> functions, so a program on bpf_lsm_get_retval_range() can make it fail
> for an LSM hook that returns a value. get_func_retval_range() then
> reports no range, and do_refine_retval_range() and check_helper_call()
> ignore the error and use a range the call did not set.
> 
> The function fails only for a void hook, which every caller but
> get_func_retval_range() already rules out. Check for a void hook there
> and make the function return void, so resolve_btfids no longer tags
> it and no fmod_ret program can attach to it.
> 
> Fixes: bc45414d1690 ("bpf: Allow fmod_ret on tagged functions and check the return value")
> Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>

The change looks ok, makes sense for this function.

I am not sure if the topic should be 'bpf, lsm',
I see no lsm part here. Otherwise,

Acked-by: Anton Protopopov <a.s.protopopov@gmail.com>

> ...
