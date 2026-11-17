Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939375;
	b=2ffTfa/JTGDUJEK16iwyKDieO54JefKub3sABoDCAXW9TmqKsRuWb19HWbKmor/8Hc3j
	 mBsUhD08yCGA815lywsluAjZiAf0fbMeD8BgPYIVwwLvDwBK7bCQR8+KMvNqx+f41j5HX
	 jL3aZ7Wv9zL3rRI/T4LCAtYT2HEY3F07rrveQgq/3bK6RIZ8hTrCp4Y/XzNar73956F7n
	 05bVj86TVcdd99U5lZ3weyZB5o/2WpDnAksRzB+Cl/WvLMD7L47zvkha8KioVyJB1AWlb
	 T/WijPer6eVwG3HhzMLIZSeEAiRxSHwjWZrJ6m9lWH1gLBDADpCm0CjCT8yYclPBqYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=TUIrBrOTgzgmyk6kl26pUhy9DQuBuGR438tBzebx9QA=;
	b=nIQEYPSK/6T9P+SRTEH72D25P30/ERHbxkZTITI72/h4mx/ez1cDrkdQWv6ATuwaPm1Y
	 cxRmV83hS8xVJDw4xT0qn1t9dnTXfIej4UezkkXWpt4oNCrpSOfNpoDJNkJaUICJd2AUk
	 FQPc4vp/zbjsDoV7vR9E46me8k4tStHJqMv1Se6AvNl3umr/r3PfYjeV4rY+Zj5JjgEnG
	 Q4bbgkvi7rwkQnXHZFI2UKxW6uzwSeBzPsdh+xKT4m3f34yKhvGNMcajOSU/vfAHwGcGa
	 KKUX9hlPzc0jLQ2l0ABze+AhIjRRz7VUYZbxur+7Sv7UtQHxZoW8hifLDduKfMBzIhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ct39gTeO;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0EE606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF0EE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ct39gTeO
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso801276266b.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794939373; x=1795544173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TUIrBrOTgzgmyk6kl26pUhy9DQuBuGR438tBzebx9QA=;
        b=ct39gTeOPqqzNOu1cYN8qIqrSWum8W/cRJTuXbyaGIoTF7sPfa/apC2s4M8rE0OAK8
         A+23IFq5nG4K9NSQb+30CqQxrUoa6Z/gfx9ESzldcPZDqSA9ACPlIEaqUp2dtlH3KIZg
         C1yLdyIoxSXcdnIpaUMXjxm1kfIf9Lrxbmg11g09hy6tOAfzDFwZvEDvslQjQxNMX7a+
         Y5LUiAzzR8UvT29CU0qIIOzqW9P8dxRPw1c/l0+nBikA+21HeCEZ9xk5B0ji2WgdaoIb
         GTgVsCLIYsdzFGUIeJP1n+LmEt80jqvkrdTxId/AvCFMTWOSZLQshm8XlP8QhptUDtzI
         23CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939373; x=1795544173;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUIrBrOTgzgmyk6kl26pUhy9DQuBuGR438tBzebx9QA=;
        b=WRZm9sxEwsnLAOGa2Baz5Cf3+tAKeR2oEusuutJg/zbqdab6rB3oEtvfTkMi9IS8ui
         UDO67pQAnA8Mw0+tEw7/VMV5HBqpSu5pQQEfMVuUIqGrLvALXsc2L6pPDyZveqJnvRUI
         UnH3pLiYylaZNAOvCPSoGOnVXF0ddN5fmkciqBMbEb8ETaZrkGR1TK02wMGEY1lZKLed
         69OyD5nobPrA/F2yE8OeHAufU2i6R4BRkEEoNurCJSmWXdWdldHzVGms8saCipmMMQFG
         +PH968VyBQDszR6QnDfYcqoJDcnC9wlnJ8GRpx14E4W+uyYhxQ+ZJBJESJ5edJ0toHaz
         ftYA==
X-Forwarded-Encrypted: i=1; AL+hErGd5aP6wKClRD7tFpVaMKwQ7K4Tl8vzGese5q8antM9KISMW7u9pTYEZv0UsE2yRr29DpEwJ1xMRmgfRNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HNk0Gbxgnr07skf2aNoexkSDRzUs42fbffv19xHwg1YqBk2nP
	aSNXeiarZ4e5sv+hBqL0wLCjHnyWrPqD+AiKYQSdvHXoDn7y/F4KFm/fHj1JwulCRY0=
X-Gm-Gg: AYBFou2rfh41O1/6DTJmgWf5SAwTJLiJMd0nyDxqIBVVIj9u4aHW6TVWipN447GvHrn
	iCydWGYNjnE6+dn9R/jW1ILoOfjLrGGV6wKTH4JMNsZportQUzmike+Mcms2K5FxZcBNt8fLVzH
	pXfLstoR+YlmHH2e3dk1+ILJ1SvaQ822l3rOkmymK77Jiy+TE+9bvM69kdkUcQBLzVl/PkYYqeg
	P964vJMPWOJrl+ayQWPFfD7f1GHjwv9q7hRgUw8L+gCN5h/83EYBe/gUwDYbvefR/J7yj6oD+MF
	G2eHwIfY30T9jO9G+vbM+29n+XuPZ+iyPfl9rB/0XBTJi+CDfnO8Fj+p1gnyesBCbANVey50QSE
	i8wZ2rtWFPIrwMLjUfF7TnEWGXHkFLFLJgFTPTiDfzL61tUzd4W27S2NjDxj2o3sGuqzqFgfa30
	Y27ohZOINxqR8323fmFe75LS1FUbHbpX866xmekYii2Y7n/Kk9RC63VNQpFglNXYwQUdcKyyyaX
	yvMtu8eW02mhsb90+4VglSf/8kG2fq2VGgpFt327TaBR0UQdpDq2YLKBOxKH735uG5bsaKkeKu8
	J5v64V2zddF3QLmaqakXplTxIrmENzdi0LQTtNL+Cu0MZS0=
X-Received: by 2002:a17:907:d7c9:b0:c2e:63ba:1f90 with SMTP id a640c23a62f3a-c510e58731cmr7270066b.48.1794939373210;
        Tue, 17 Nov 2026 10:16:13 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b886a7d7b2sm93434a12.6.2026.11.17.10.16.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 10:16:11 -0800 (PST)
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
Subject: Re: [PATCH net 1/2] veth: wake a stopped peer txq beyond real_num_tx_queues
Date: Tue, 17 Nov 2026 18:16:05 +0000
Message-ID: <20261117181607.30219-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113104648.225983-2-simon.schippers@tu-dortmund.de>
References: <20261113104648.225983-1-simon.schippers@tu-dortmund.de> <20261113104648.225983-2-simon.schippers@tu-dortmund.de>
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

On Fri, Nov 13, 2026 at 11:46:47AM +0100, Simon Schippers wrote:
> Fixes: dc82a33297fc ("veth: apply qdisc backpressure on full ptr_ring to reduce TX drops")

I agree with Sashiko on the Fixes tag.

I have reproduced the stall with your script (stuck after 2 cycles) and
confirmed this patch fixes it (all 30 cycles pass).
It is tested with veth from net at 5e9b2ad9b838, as a module on an arm64
VM with 8 vCPUs.

Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
Tested-by: Tianyi Gao <tianyi@cloudflare.com>

Cheers,
Tianyi
