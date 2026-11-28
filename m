Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852641;
	b=3/jFkXZ0KLZuc0OHFNuQKYdbBYWhJyUmaGLVlgzmgk/egHGFegi+8LncxXFGOX5v6QoC
	 LVvhBpDPYl/MyhbMNfrMrCTqdEICVfCf1qRpGgmE64v46NxBaWCT10sgFSLb//XJw92KO
	 XEBEtxebL/i2Bq0ZQPJAZqW9D/U0fgwkMy49RMGvSaJOhLbutSeRv0e21DP7W9a3Togkj
	 F1BrzbZ50eiIUn51CulXKuKbMzh4dPghBiTzMhYjakfk2oXElfXJsyTTNzd/BtixjcSN5
	 e1a/6Cit5FlbmrzIL/BRnGFktOkv31wE+jkT9DI6ulr2/ie+yXKUFAwgOt02u+IltLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3YRc+oLAH9CSMjzqL5DaXtGZiCmjzwmhJmG8W8jBwCo=;
	b=kwWRVJYINp2ZWfGiMiAmKbk3zhbxkVCNr/awsaoU7mFrr8FVBkgsvyGgg/b6dyVR/KZI
	 0znOuKQ0Yck/ux7PCmFWUpjcaQPg2OrwkZSqxPrqqcNXy4/Bqp9xtytVpNPeysaWc1o9d
	 5+TbNWElTZoL0lp2Rl0S0uZw+tL+ehHRVRNSvvSEYCJ7l0+0+wzl+4BNb8dUNSS+vY+mg
	 1ztsIFstshRLNh1XBbaF4pdO/dLwyyBtXXy+LagHoKK6YKrYuAt/ZuXZREsQHBW2872Yl
	 b0Geq5TOFLabp62r9CzovpmgF5zNw5s9kET+F1nzCakEN4MvwBpt0HaWxTtKpWefw7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mstEU8RA;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEE0606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FEE0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mstEU8RA
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3866a784546so12254749eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795852641; x=1796457441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3YRc+oLAH9CSMjzqL5DaXtGZiCmjzwmhJmG8W8jBwCo=;
        b=mstEU8RA5nPzUW+HtM/x3MO7+YviSGCI0+a7bsHHrwCV+zfsDccIDgwjXCUn+yrTwZ
         WEmS+zV4K8REfZnNqJTAVeBVdNoe0rHLSP3QkNtQedI285RZ3E2ZbPPJZ+Canne5JHuG
         CMx6pZE98ZFGVKEJJWy/fT0gj4Y104a3Q/wCaNL/yAz7cj/D8clAbY7NmHk8gwjD+l1U
         yJaE0r/PAMebIwgr3daE1bHk5HDJP8z4SxrvAL9beQJkuamswrpKCwX2M5BoxyM9pDRa
         WwDz7Oe6XlBnCIBv6Bxvw0U3us1innr8k8j63UuNKyCBzAw8Ht6s55P4dsVQ+/J92jDi
         cGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852641; x=1796457441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3YRc+oLAH9CSMjzqL5DaXtGZiCmjzwmhJmG8W8jBwCo=;
        b=c29OZ3bS9zRa6/Ru5u7HZc0qWVO/87XwNR/hkZa6CtiXuaB26du+ll1AeioFFcxRik
         B1Pg4OFgmrLC2xh2dGTw++pCY6uSlxR6DC0Ut5EyuzhJkVXnMGmhxj1tWjSWJP16hEQS
         A/HW2QNuiex+oErVUw3+828qZYpwtsFHZZ0u+UrGDHsbOg7LzMF1/y+Y1G8Ilt0Be/dW
         SAIh2jgfpFldvnzqRkVAporqaRiK1H4822EWfGRHzp/tpofOKtUuPH0Inp39TGqJueLA
         vBlPLDGibH0fiGqoHPfp+hmocfibeR0z8QMpeDLzLPpk45DDxTXEz5iaVLN0qE1QQQqS
         AKyQ==
X-Forwarded-Encrypted: i=1; AL+hErE287nG9rcUg0KDDTfSlFnbOyFer2WJHdZPveuqbUtu6fjepfO/RG/1986nXDT5REQzobPRVYjJge/Lmfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z85sueDhj41vfxRy8OpH6LdGmixJ9pkEQijaAoO1FDJDr0yxnqW
	/yDkwCNFZ0t/SAheVa/e4EmYGYpZJ7rJfKiBCsXb4SP+VBn+w7Cj5KJs
X-Gm-Gg: AZFdTZeR+41lyfmqWIQTv4Nz3cIE4O3mfEU8rT5VN3P9GZA703BQVZoJCGxVz0RqWGz
	86YbmOv6tpR3IYEPBLAv4uwFiqALGH1pr0q2w2sRSr/gKjmOSyVnvP8pvsmJhJ/tbwI7cp1S2v6
	fn7qKR/GNKjO4dvg0TxYZZdB5QfS6pAcE/H5nITrgb1FZiQ0A/J/o5aJ4zMRBB3N6RNNPv5IYqx
	TMZSWVg3SnuGOfy34nxBx5UZJCgh4Ut5Mq2pggB/3H7OK8ApvR8KAyDY5hj2NmOQXMnUZHQoQaC
	eVljUWJzyr+Il0FPyM+XXkbjmC+EoYRosYnJzcFeZxXE195CxYjMCYA9bQJJ7/qLBgH/i3efHb4
	p+VBwKZ2G9oOkBTltOH576+lZmdj7xP7v/d2J1DsCs0rmUnWsemE2ZGM3jiR+9IYWFYzy6hKBpo
	1/r/1TpZxphJhtm7zJGsAJB3NCCVAT52p5HOtyZ6hCwQwnz3nYfYcFSQSTNR0SQRWQ3vpYo5XQX
	rG2gTA6fSXlylSVGOWXjIsUNpB3PznhQjwWEDO4a1Gf6JRZiY0VMMSs5DDgJwnbEDUabv9d69Wy
	dSevxS4muYxJZCDLdQgFCEwXZdEeRCn4HHdA2yrin56k/aGU8Xp68tOs2fFsuLbC9AbCTGuAFX1
	/hsQPZarM0nkma44=
X-Received: by 2002:a05:7300:1486:b0:383:6eb6:5730 with SMTP id 5a478bee46e88-38570e24c0fmr32195217eec.32.1795852640554;
        Fri, 27 Nov 2026 23:57:20 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm69117082eec.19.2026.11.27.23.57.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 23:57:20 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: Chris Li <chrisl@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5 07/19] mm/swap: consolidate swap inuse accounting helpers
Date: Sat, 28 Nov 2026 15:56:52 +0800
Message-ID: <20261128075703.36392-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CACePvbXsmTWf6GNXi6W7HabdskuGRO8gfUtVgzmr03+oi20itQ@mail.gmail.com>
References: <cover.1795439990.git.lianux.mm@gmail.com> <21e7cb1a16aed56568fa400f5385acd36513aa46.1795439990.git.lianux.mm@gmail.com> <CACePvbXsmTWf6GNXi6W7HabdskuGRO8gfUtVgzmr03+oi20itQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 26 Nov 2026 10:27:38 -0800 Chris Li <chrisl@kernel.org> wrote:

> Can you confirm this patch has no behavioral change? It is only about
> manual inline and rename functions. If so, add that to the commit
> message. It can help the reviewer.

Thanks for the suggestion, Chris. I'll clarify this in the commit
message for v6 so the patch is easier to review.

Thanks,
Lian
