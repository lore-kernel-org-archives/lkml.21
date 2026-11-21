Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795275488;
	b=dE138blg9Tnv86EqUsrPg3q9f/sNPjsrFcE0zpO8c040bupiP5jpAOTS6qMdWymhjX/1
	 Zw6ikzK3tai3KzyWs9LXaLvfkTVn9WZEIHFW8KYj8kC39C3TLR59mspE4xJg/hDA8xsmy
	 Y31Jd20kAGczPDg3vZw6b83UG7kdFYrXa72s25DNtWPAEiGrOoCCykGYNrRbgA+4r7V5E
	 WErmaAeixEh/JvG/C6hIq6ICsaziVGPuxVLosLa1QgYIBWnHSbcZSqecrhxriIcP34VVz
	 w5MIremEs91TFmeWrIQi8Wbr4nlV4Oid8t5D7l/H7lP2oRsZ2cGgbUFmwzqT2ULoKVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795275488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BfoBaMoCCGI4vvuBFtM++JU7Un6qYx/YS0fsp6MCiU4=;
	b=E7BMUMGOByARc389i5HmOfku4Pt/aOPXJTakYSO7Yy2rfk3d0c9+UdtbN1JYMfSPk7g8
	 jisvsnfvTL8MWL3wyo3MpGsC2WCmZd4sAkRcHEMFUQZh5bxM3GLWwueoACutvNa9NYL+6
	 4YHvGsezh/uyjQEpPSqM2M4UZY1oR4vON03CDP+1ZwhOObhK5G6Suvzpqz3OI4guyQmCw
	 oAT8KSsw91TABwZwvciLu8I7Y0j2/X4lfxmJBR64yVdcaFPhvLjbqHaIxTR1KqFPzR75j
	 mxSYOSiRWw52BMkOhHmKEpy1jFxGiKydfqKTDeJ7KE2S/5XpPmvrErphFgr9PCKDnLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bPNRWH8z;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65C8606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A65C8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bPNRWH8z
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so16121075e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795275486; x=1795880286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfoBaMoCCGI4vvuBFtM++JU7Un6qYx/YS0fsp6MCiU4=;
        b=bPNRWH8zK+xOEHgrXNYQ24sc3PAeDN8U0e7ZvQhjFEvBu0m48vLA6XUGL/+HaRm0g+
         PY+058LPxgLgU5PtOsgCGD0BQUlC1gFmE2VJKX6ZQFOCuJaC7x4Bc+M2BR1JVnwsa31b
         aMs+q/fjKr4X+t9FwzeW5StO41dUyt99EHYWol56HC5l7E0xhtcSpfwfdpxEXWkUQ/4/
         37rYEOpInOLXuElWRGOed+SnSVyh0WNWc/e/Nv4s0T/e9cdWSto3jBim8SZL+KgrmnaL
         LJGXfK2TIYcnwNzVdr8wWDLlFftjCywDUEraXtz2KaafnNKBcjCgFODpPUZkxiDi7mXn
         Uafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795275486; x=1795880286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfoBaMoCCGI4vvuBFtM++JU7Un6qYx/YS0fsp6MCiU4=;
        b=Vf/RWpWNL2K/pGDMcXy0hKuR/2wzrfboJuGUq2zLMekUBk0C0GujePf0I5PvBL43Hx
         /WZfOiqPuBGTCLRJmdNFag5Cv8BfyZwh0CPAESBSOsDm7mz8fl4Wld7QNMYOBe9VV8EZ
         hIcXnX6XG9/UH4c87lIgDr/tG1Rlcxt9WAiMy6npdHgNV31JvrTzT3LEbLpmYYSkHf+s
         7X4CliP7AvATLBEdNgjIQAGQpja63qtlKLVUKVqJG5i9gRr7nwUnhGJipvNXB7by6+Sf
         Ec093pdhVBJo3ngpVGccYPCK/kB/ZfH8PMuQyyurJobP6MLri5xpjy/j6q7n8cGXlXt7
         aD9A==
X-Forwarded-Encrypted: i=1; AL+hErGBU+rwqt5C639knJK7BtmrJ+K0XMd22SZELK1LjLc+IQ0f8yEPjpW70J7ZzhvOaUAFsz8bpft+nWVD2RE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QF0DB9gHVa3EaFMPZZ1eN/pWYPbQcOS9c2JkHwtFhIu034gqf
	2fUCEt5SsjGJVdVqG9GeHcdbU6zaCdSixnTpj3eTcsOyvs2vx3mOGDKHoI03YAql76E=
X-Gm-Gg: AZFdTZeYgFcXmU7ZpV9AW9DGOZZSVMuNNDimnE0gMPIQmr9BW//PuLXQuJEZowV4I5t
	IZVvS6uGLZnIibz1J8LEUb7e91yI791PDcM2/Ezqx0VFmvuhrTTbGW0Zt9iqO6j67sjlgzYoB76
	4kFWUKdqecu0tLoS/zKl23YTExS26w+PQWrJVFLGzaHvbmIpopWFt7xi+bHcOHdlAA5Rx7uG1SZ
	u9zABaOTG4puYt52GgN2WICU7kVm3B41l7/V1Iy7GSpCxBwjkB4pfEmI9kzUT++tor9NdBooOKO
	YLKzcVf0BOXOl04AG/2wG2R9aXrUi/iKd3rzEi0znQ7lAPf7kITRtEAPc9NSpF8bu9iQPbU3ntA
	oySFzZV2rj1wlacJJiK81rJtpIao0CnGIfmhWYnsoEnSNuoXHpcP5FfRKrkMHDMUlSSIEGlZlKk
	9UkkLBRC0D9QFzq2mdjhh3OhpTTtyDb990TB7aKkXxkGxRDywXAucojpxe2ZUWiaXwDJ6L0dRCt
	E8hYO0X1vx8XW6Dqqb2xzahB4Znbre5pkvUYqcKdz+xSNsi7WdxfNU5Ws61udqahcgPKAntxKcI
	TpsZwH0un8KaVNMqZX4EqV7uxu7Sn6H1zXteyg1et+iX2EKnQ2AQNa/e3ACQrQHpFgpc6t04g/6
	ZU0T8xmf0eOv5+hszrao36tp4yCvqMqqzvYm0a+NKgB1dZCsqBC0W2lJbLmw9W4P5N968inGSzw
	w6xVSVxaL4uXmxAqfDwUnoeyqr7p2UhFNf
X-Received: by 2002:a05:600c:5309:b0:4bb:62d5:4ab1 with SMTP id 5b1f17b1804b1-4bb88924a5bmr152319025e9.33.1795275485728;
        Sat, 21 Nov 2026 07:38:05 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aeb0-6801-ad74-bca0-dc5f-7242.310.pool.telefonica.de. [2a02:3100:aeb0:6801:ad74:bca0:dc5f:7242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm254688665e9.13.2026.11.21.07.38.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 07:38:05 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Xu Xin (vivo)" <xu.xin@linux.dev>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Donet Tom <donettom@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mm/ksm: do not inherit ksm_zero_pages counter or PTE markers on fork
Date: Sat, 21 Nov 2026 16:37:51 +0100
Message-Id: <20261121153751.90695-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261120074359.41019-1-xu.xin@linux.dev>
References: <20261120074230.40269-1-xu.xin@linux.dev> <20261120074359.41019-1-xu.xin@linux.dev>
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

On Fri, 20 Nov 2026 15:43:59 +0800, Xu Xin (vivo) wrote:
> With the marker cleared, ksm_might_unmap_zero_page() will not
> decrement the counters on child exit, MADV_UNMERGEABLE in the child
> will not unnecessarily unshare inherited zero pages, and the global
> counter remains untouched.

Confirmed on mm-everything 758802f13004 with the smart-scan v4 series.
A test merged 1024 zero pages with use_zero_pages=1 and forked. Without
this patch, the child started with ksm_zero_pages=1024, the global
counter doubled, and MADV_UNMERGEABLE in the child allocated new pages.
With it, none of this happens.

The new check from 3/3 fails without this patch and passes with it, at
the default ksmd settings. Both tests gave the same results on x86-64,
i386, arm64, arm, riscv64, s390x, ppc64le, ppc64, ppc32, mips64el,
mipsel, sparc64, alpha, parisc, m68k and sh4 in QEMU.

Tested-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks,
Karl
