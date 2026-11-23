Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477272;
	b=koaWG0nzwKh0kRDEA8PyF2310Uf4C1xKMQlCFnuk/vdPtbt1W2tWa9JmgHfY90Qefy7l
	 NSWK+Cqc3DICP8kXUKrecGyFcHWZOHohKYCjz5A5SBGwatT0l/xZbelaaGl9wXzyrXvSs
	 d9itu4S8zMeyok4Fc8dO/BlUDctu99F2V0TXac0T9rD0SMYVprY18S+AtiW5upKMWE8/R
	 ooE83HcnQrtpL/y+t/TzsmRfeqER6iYBE1RAFYPHtSFW4uEZ6fupyON4JyWz5ScCAypYT
	 R08qcv4oORqQTmn2KW4zYwEjN6t7qUh3wo9YX+OZ62rGpzrgvuSYE/nfK8tSuUjEQlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=7sCs1EHW+8IerzbWNfyv2UgBTw/vhw4f3rwKGqlZg4g=;
	b=WYoPk7YwTt8C+61i83OAJt2uzXMzyjHw2xDVhXIsTGT8EvZB+iLhRdIOgkYMDLaHmofb
	 jgxdtW8JWAsKXqP/axBb4fS4NObuQXnzurqtq/SL7EuE0NQa+b8cLWDs5v8rvTuWT7oDy
	 J0gHuaVGlmkJMMh2kxmPVQz5V8SQQv+bnuh3MLoqlmF/TSZX1TSLXs3eNqkQ+xXhdl/mX
	 3r46eDp+rNOGU51S5NWVjnQcs1gc6jSzlQ3RoS7osgzbkfkl9Q6Gb2O3yBWFCRVoHL2Oa
	 sFvM8yErINYyRatM9wiCSyGewyVAosJc1lCcekqbvUPBnBpRfDs1ZMuexv6WBfswdZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYWt5XT3;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9FC606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D9FC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYWt5XT3
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ae85add4ceso26082021fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477270; x=1796082070; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7sCs1EHW+8IerzbWNfyv2UgBTw/vhw4f3rwKGqlZg4g=;
        b=gYWt5XT3dQdvUniO8+A/+WNJltKocdfgxkgNxZe8u7HVwfNGB6CA1qdTF5017B6rnb
         98PanKA+f1HpBkUcmRqPBdXcFCc3FJI+Ug1A19doLUqC6V1sNwobGVwzJE6zsYqVfLIg
         3W+Dzl6vvvB4YkIzAagXieJMiasMu5GxJBNDkvlc8o1pvh0iZDgvreteWtF1XXdgjG+j
         mIa5mYRLJHka30/ESkNougpg5hX5vQlZab6K5pePpngpPUfUN94211ZkVeRX2C1rh3Wn
         pzXRGh064vXiStuc9IHGJyKV9lj2DjOwgitxM4KN3rwsO/lYRek6kxgoDpqN3CTvzArP
         E4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477270; x=1796082070;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7sCs1EHW+8IerzbWNfyv2UgBTw/vhw4f3rwKGqlZg4g=;
        b=QgXpTTbMCtegMoLbX6ev3m/dI4sDmeLfH/TrQYxTaoM7Qkssqjl1B4UkwMsQJ5Y9py
         UYvZJ9QleZQxUIm52GAEobNGD+t5l9uuVuu61vpocjz+lPoWb+vUcDRj+tciqlgICgoy
         v7EPHSp+M6Hsf1n7l4t/6Zl05Ari+eReKmC0ltjDm4UfUZE14bDB8114zVgPqEz8GTVv
         2T4v2lDXTvZ+ry3hgFvxyHkDgmKk8KVUvGGWAms8FYlFRfXHgutuNghjwVbaPsldDPRG
         2L6G94/GyQ2dGX03E5Jk4yTgHL1KwOnb5L42xmNcECJJWnSTMTCzBsghURNfu2FPaKvg
         cbLg==
X-Forwarded-Encrypted: i=1; AL+hErEd19kKg1fkxczoqi6POXjk27JpKuov5d7maB2dFGCUAnNq0zlv5ptYwxQpd23GGO7ulvx6hbFwkQbGiIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JFEeeC0tZk63JO1WHfVleTNKuU68ijFUSmstilvQlcv1Nh9WP
	WvstDqfpBeLOBbBLwKPhJ8qubFo/V4Jcfk6JQjxlEbPkSo95BTl8ivUs
X-Gm-Gg: AZFdTZeu3fZJRNur+gsgEY/ism5t2daYLgs57YL/HxkkG5YvmY7KdPTPLxYmXJpELc2
	aqQk+x8nX2DwhiwLY8c11uCw9HunO+jT+E47lHMEF1g20o6aAYjcmbYvg9y0fJ/sK4lzwC+pUug
	H8nlix4yfn/lw9f/4AmSO0vxF6pTC3IStkgivDvMUer4/NQl9sQPWNvCwUXoHwnwpPDyjAa8LPR
	kWLdy4K424MZuQQqKtuOBSdw2F5u6ayBzoKyNDScLItMSl908WfULFMjfnX1pA6Qpldr4G2esZa
	di8Wtt6QDHGjuHdtrh5uS0vHJLppi1YpOXt+4Bi1uULLSfWIfWCDlhzpr+J7M0I1C7AoWhDOOPh
	6vz7Z3bI5ZFLm9aMTBOuo3/indh7sLcz4kiZECflWlL9qg2kmbFzZCkJTresRNy2mTm1w1WDHHv
	VWKychNK8bZfsHUP7wHvQyAbTU2LmkVgqd0S59HIHD4xaKopkpLZlxeMEtliiignlL0hhz6Hah7
	10DX9ZUibshdFlDGZeFMIHCuLtrX/GQWBap9koyBVghjYcyiEAqKxDHRcKrkAkF/LNhaR31sy9G
	DwMGGqUEIS/HREdFYvzzvik7nszLnhqSrHeLp9fVG/owht8KWOAv3Rc=
X-Received: by 2002:a05:6512:124d:b0:5c1:56f2:fda4 with SMTP id 2adb3069b0e04-5c1bc89530fmr3136762e87.49.1795477270244;
        Mon, 23 Nov 2026 15:41:10 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd04451csm3314217e87.59.2026.11.23.15.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:41:09 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 	Krzysztof Kozlowski <krzk+dt@kernel.org>,
 	Conor Dooley <conor+dt@kernel.org>, 	Andrew Lunn <andrew+netdev@lunn.ch>,
 	"David S. Miller" <davem@davemloft.net>, 	Eric Dumazet <edumazet@kernel.org>,
 	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 	Linus Walleij <linusw@kernel.org>, 	Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net-next 4/5] net: cortina: Add CS7542 CPU network  datapath
Date: Mon, 23 Nov 2026 23:41:02 +0000
Message-ID: <179547726260.3.2509837092976108381@gmail.com>
In-Reply-To: <560efd8b-44a6-4b3f-9f88-d1a891b4f253@lunn.ch>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-4-fdb5e8c2d508@gmail.com>
 <560efd8b-44a6-4b3f-9f88-d1a891b4f253@lunn.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Andrew,

I removed both module parameters and the unused internal-buffer alternative,
keeping the previous external-DDR QM/TM default. I could not justify weight
16 with a hardware requirement, so the next version uses netif_napi_add()
and the normal weight 64. The .c helpers are plain static functions, and
ndo_open now unwinds through cleanup labels.

I reviewed the flags against the core transitions. opened publishes a port
under the shared TX lock after IRQ/NAPI setup succeeds. netif_running() is
already true while ndo_open can still fail, so it cannot identify a port
that shared completions may safely wake. Clearing opened under that lock
before netif_tx_disable prevents completions waking a closing queue.

stopping gates the single reap timer shared by all ports. Last-port close
sets it under the same lock used by timer-rearm paths, before dropping the
lock and calling hrtimer_cancel(). It prevents a running callback or RX
poll from rearming during cancellation. I retained these flags and added
comments explaining their roles. rx_stopping separately closes the device
retry/IRQ-rearm window; napi_disable alone does not join a poll tail after
napi_complete_done().

Independent built-in/module ARM builds without the platform series pass.
The revised driver also passed Almond+ RAM testing with live NAPI weight
64, two load/unload cycles, 600 byte-exact UDP echoes and 20 ICMPv6 replies
through the normal DSA path. A separate internal CPU-port diagnostic
passed 448 nonlinear/jumbo frames, including 8192-byte payloads. These are
functional checks, not throughput measurements.

I will collect further review before sending v2 within the agreed cadence.

Thanks,
Fil
