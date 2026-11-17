Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939378;
	b=3+IJb7expsw4T+um1hUUM52QawNE5Fxkw+fi6PC+HNFXDlq63gXS+HvS2NcrG2qJ/IPN
	 I0a1ELZcVib9g6nItElIq8YYeo8pVpGPR4JAssGUzrTky0a0WiNmPqO76OgC0ZQcYE8hj
	 KnqUGYYIAtH2cZuIqL5VWbnXDR9WsZt3AHCRKx3bzBOPvDjW7Ciy+3wy49H6JSxlAaudf
	 5PtuprvWJmnOzOWxK5BMwWzggEbfeuR1qq9uLVt8dTiWJItZq4uTSRoBtJW4MfqsUzY0V
	 9lssEGSZm8UYaCk5fp8D6oL/FXMPndiRMvnpm6uJxa3bz17poQcw66ZVY52LeMDjmsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=G3F1D5a6ZABD/Ct6UJJ0a/xHnccDHKfohgnWBX8JTZo=;
	b=qzUt/Kk8hM0FZy8bSbLHvis7G5Z2xyZ6JwCn/megeo00wosADUNXz6k+dyJLBs2c0yBb
	 s77s6f+Wi9vhu61uNbeLOVkQHmhQvLlNx5GUwYQfOSAtm8Nk3JLmKghUHeoxqOKVIwLH/
	 6sm/gFYhuSYkKcA7PjUu/voof44iK0MkdfTuzALyHrx36R+CfTgb/kzWTVf45eZTPR+15
	 ZADsmytp9P/rQ3Xh0fNKGyVe3js4vZlSo9h8urm76EZdcbcRs5d3GCzSxtvuHyu+NwcGX
	 50As7tDMJeyhDHg55giBtJFbjEafg7ZYnjs/Pz1msm44mlIl+Qf7TW+N/CzWb1m1krA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=FqQ862oe;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B1C606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9B1C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=FqQ862oe
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so220164a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794939376; x=1795544176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G3F1D5a6ZABD/Ct6UJJ0a/xHnccDHKfohgnWBX8JTZo=;
        b=FqQ862oetmz1K12bF74clKD6N1+dPa/uE3WY/3hPfxyjvk19FalxbBVFypbiwog2Vr
         c4T+iwR8gTiPjsGK2SFczq+LS+oSAX4/8jCqj1GOut8VR2FHRFQ9z+VZCfDPl9Ks7oh+
         P2n5gsl4OpTBPGuhQyUoyMpmpfh5kO2SdRzRcDeUoxHpY96ie5sh4erhAuBm4HRVlaKX
         UedtR6XkOXX6CjXIyHql0Qe+/6HO7dPw02CjdIjmVH8VYLtZmqS8Zn7Ypt2RddjCvNNg
         9CXHEN0eoaJNPGIhVWhWW5uizVU99GS1pTOUki/iUc4U8l1apn4mQHorzxuCHZqHi3nI
         SakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939376; x=1795544176;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3F1D5a6ZABD/Ct6UJJ0a/xHnccDHKfohgnWBX8JTZo=;
        b=DY1wmjdZcObhaiJhxwG7iLDdM5OSZtRHx3AsAuG5keoDJ7ZmpGkt/ls2Gj7rGV2FZu
         wtLaU3WDHHV18Oqw3MZSQ72tKQmozYyoqnfrdaGxngrWUGQigNH5jl6mfN2+OGPBdfsQ
         28HqUamF4RjSouVMtqw5QIQqJVJugofaMX3ODnsYouLAZnj89lJ9EC0oa8P3qnJ2GII9
         T/bQhLOAylHuh9Y4wLXViznliZkWOuYcJZs5j7MPAOFxHuWdB/zuTBGueURwGxfb1+Tq
         /vkJdJz65GNGe0980cwKNruBk5DJsg9Xy/5DqniHldPUpcJKXCoPl0bMuBD626RCiLO1
         BI6A==
X-Forwarded-Encrypted: i=1; AL+hErGkLtoxVfweCbFyc+P+9/QowfgkwwCQvlSAc6UQqsEBI83UIidCw4uoXW92+v8UDX2wiTus0K4slqzkpDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PD3P1UE+WfiDu4NXHeil6F29evNkwCiGbxV2jdl7GcMnv7JoZ
	8Xd0b/Dof6t5mg8l1AXeIxF6JVaODTVzGglqzKD2ov39LSDZNwvMDk/egkqtWkebKfA=
X-Gm-Gg: AYBFou174adDfZs3sD39pJuefBCWMMyFiz0wynWTrn5YlCNWT4qrEHAbZeW6NtN5j/5
	AFlZ7Dx9l0VwXyIB8VKr+W/lb9Q5QyrCYN7voO5xaWaASyVLCJ9GMC0IikCGTEdsZQ5ddqbkpH3
	xr0htyAF5uCfMQ+C8H7zMiaJkRMYwgRWnYce6g0Qrg9ovUE2BfRlJriVGb3dgQbuTej4Mi4TGSO
	0q5dQqjN4vOaog3zbBdGkTx+ybDajb8+lG9ePubmwqg0RlYJDrAuJI6Y+y5lE4vJsnYyuUk8zoZ
	nYLEei2yi2tkz8y8Me2A8akAIz0bw1L/1xeYO//b5nlxJbr/zSDVA3N4f6x9a+HxlOItpZYeN7u
	r2B0US5/bMrzw5P/AkMHWGwTBKEs51ICVhJsX8VTVmnG7Glxra+FCewZ2DcsC7Ma3ZdKDPur3kV
	BEdUkTyoU2YyNmSB7gO16d38wjMHi8ykKtrGppG3WHTu0aOVwKU+aUsdmsyTKBdBzl4DFXIdq5C
	pvdjB7u5qoqbv6RvVMk5hsUW5Nj9aO1zdd5i4SvIQ61J9ia6cr8V8hJit2pmqzYkuU9/SIFg8t9
	DdJs/9PAq5ZAKH8fXoDQSct6YkT1oh1eZrInuH5hqfBVGgJ9SHtELeOC0WEGA/AMkHRh
X-Received: by 2002:a05:6402:2341:b0:6b7:ce4a:7cfb with SMTP id 4fb4d7f45d1cf-6b887eb69e5mr71531a12.24.1794939376195;
        Tue, 17 Nov 2026 10:16:16 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b886a7d7b2sm93434a12.6.2026.11.17.10.16.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 10:16:14 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Simon Schippers <simon.schippers@tu-dortmund.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Toshiaki Makita <toshiaki.makita1@gmail.com>,
	=?UTF-8?q?Jonas=20K=C3=B6ppeler?= <j.koeppeler@tu-berlin.de>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net 2/2] veth: wake the peer txq when deleting NAPI
Date: Tue, 17 Nov 2026 18:16:06 +0000
Message-ID: <20261117181607.30219-2-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113104648.225983-3-simon.schippers@tu-dortmund.de>
References: <20261113104648.225983-1-simon.schippers@tu-dortmund.de> <20261113104648.225983-3-simon.schippers@tu-dortmund.de>
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
Content-Transfer-Encoding: 8bit

Hi Simon,

On Fri, Nov 13, 2026 at 11:46:48AM +0100, Simon Schippers wrote:
> +		/* veth_poll() can no longer wake a txq stopped on a full ring */
> +		if (peer && i < peer->num_tx_queues)
> +			netif_wake_subqueue(peer, i);

I have reproduced the stall with your script and repro_delay_us 2000
(stuck after 14 GRO toggles) and confirmed this patch fixes it (all 300
toggles pass).
It is tested with veth from net at 5e9b2ad9b838, as a module on an arm64
VM with 8 vCPUs.

Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
Tested-by: Tianyi Gao <tianyi@cloudflare.com>

Cheers,
Tianyi
