Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441395;
	b=TNeRD8Me9aJ2sQhZdJsipe+ygToa7ZutegxWTuQfHlstO4ctrxc17RMAyvEHrATifGBf
	 A7IIrSFi7165E4OZtNqQLAXuqfT0kSyBjLKb8M0M1I5G2R7D7EszyudAOz6fegozpl9W4
	 Iz9bDJVeicPEeQhUSqWH+HAWhoUiBzG6NYkPFrDkH3gxX+/D/1FDBYuw7H2Dfc/WYImr/
	 GMJxp2ATTXTyeN64k0LJHPBW4XcR1laffoHwQyb1HzTwU5b9MmCMc/XWpUUqhuL+ukkID
	 ZBrxjN6HK9omYpNSFYn2SxrxRCqCpF9Q09B34NPXIn1b04MiFTpzAlSZ6TvOwu8nizg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kqCL8yR438jqEfqX8sdAOmG8GdM6o1iX2qDOd73H3eE=;
	b=UFOIxxY3WgC9j8NJVxqRRMsF2S23eXYzSqzefF+tpvn8tbU2GRJbBp6mxKdxTEC8HSyy
	 LfHwl54JPqWx3bMlPrcm3279+m8YitmH4p2AmBu47GIk7AAcCI3RNzqC4rRxF4rJFUSgF
	 fd1VK2Zhvf5VFjCgTta96mKPNCBBeiuOA4n2q6yIOGHDlyXZOQerWOsXwvdrumnQltVdM
	 Ky/k77gb4HdCngtdLmgiBwTe/hq+7yQqB3JxV5DaSa5dFHz/YJib9RHP0EOi18eP448tq
	 GwtNmvsfWUnbxPoef0QvgDRg/Hp3uiD2GuWgOMKIBZA46RUiOVL9R30b4c2Pwmp8d7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tSQq84S/";
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0993606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0993606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tSQq84S/
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d21051042so539167366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795441393; x=1796046193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqCL8yR438jqEfqX8sdAOmG8GdM6o1iX2qDOd73H3eE=;
        b=tSQq84S/1UMt0IuanHyasApDHPmNpDwhzVwotDPkeVq/SQyYZhFtggn3Cq/Gk/1tCk
         h2cA1OEReS/CYPQpS40RC7oB08MVqUd7hmoO2j5ugvGQeh1InNKeFitZ+YOOi7s7VDVk
         kyDC14iqfVs+yv1uzySejV0P+NH+PFQwPOU+3jS3mTPfmL6qomnI8+BCpKJhq3+wnmK0
         /3c4tviGXnzIz6iHoW1QhfVYLYZTEEUWmKBd+iYSEEDhv2iVJJ3HF5eOOzXLPrYX1BfL
         bAi0dp13I8lbGwD8qBUh4z2IGeZE250GZYAMy2MdxG0g/K6rOzOXfmCJZ62/M2fgsumP
         2CPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441393; x=1796046193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqCL8yR438jqEfqX8sdAOmG8GdM6o1iX2qDOd73H3eE=;
        b=GQBLBTm1+y/Pcnuqm61xYPuv9P//TyVAnAXePsrejHygt3xX9mIaowI5PMv2NwkNgd
         qlppou6IjKYH1IV7e5XaQitMLoIr7bzC69cwTsNdy1KmnrC5o+1tPmncyCCOjm8cTSPt
         X87pUips97VANpNlB2LgqSIAVVFsj2PiDhpTMXLvFCVMEHxHJgAnIKbaqpkw/c6n8Gun
         Ob/wf11d8Un0ioEY2LVVE4Pf/TmXwMkJXR1oguOPzo2pBjKYVmC2A9HirMhwk8thfTux
         X8jiv1skpMjo1dZwkY6qyrJ/sOPuV3VPcGYCYWnv/gORuMdzYlv+9vf+cZ5bNuH1u+c4
         R9Dw==
X-Forwarded-Encrypted: i=1; AL+hErFY36ZKtZQavN71LAN3DDdJZpzy7r/IJKhaFB6CgTnjUyA6pEs7iz9Bpb2oOkTo2kauWJRvWf6YH8bAoU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V/l+bNbxbag5AmkbANK0mCY26oduBWIpVPDS6Eohnq+1CNoWd
	Dwa74oCnoJ/eB5nM39go76Qic5Mf+knUPEsxW0cGOL56m8AtFwZuHwoW
X-Gm-Gg: AZFdTZcGq1Y8fXAGWUFzuj4bir84NOtNdkCE9UTNW62+KyBsoYXGHrZ5UHrT0dztm23
	yUEy6fNiDI4J5qUStytKw2qwLgFKXClX6dj27QZaLGI9bpZa8FS0Frxyo6n/CPUyorIhE+MiRd5
	vNDk9bYbt+oOR4bYp2xUzdxkgsVMGf8TC8DpGNZ+yzMKIFHwTjWqCxN8B/zq8hNsMH6rFi5JdST
	BPDqKQUH3nWpircWvWar+lORoF7T8jEK2LOSaNb30P8mvuJMwtGGpyum2f0/8U9Vs1CQgK/eoYs
	W+ZtTey6Ydd9KQWjAY4zn6Qw8/vMrD64Dmv1/KBHylrO8Ys/uA1UB32vo1XoW1tK9rAhRDgrII3
	98W92UldFMHse7WkxX9NCBjI04EwoGGWB5cuEdFekaTVoeAfNLOw+YR1LJ9O2h0lRhgj+VqYHvg
	lcQcwmaIRn+AZGexfwqZP46yIAcrrAvb2UZCVwYvR/0VoKxmIqEl7AgEZ6aPfM/CeqK9lrzjzcH
	caQWpfrr7DpnTWblNFTY4k0v4VFEXDEcFNMtgCuJOKC4XOMiJVc++i+BKBmHg115yeitXeA2RgY
	xxo/PA1+Bz66WQWpSJ6Fj2uSTVU+GwAnKR7f1LHZFLGD8S+Mq7nYvKfxsOpILWHbmRsjMMPEBnh
	vMZTKSNmEph8g54Pd9dMmT0PbwdnEhridU/p86w9Db7aV9oVcsp8itXUONGMMdEfRS45ODGVxHz
	f9rZI=
X-Received: by 2002:a17:907:2d13:b0:c50:ca93:19a0 with SMTP id a640c23a62f3a-c513aab9bcemr968102666b.40.1795441393323;
        Mon, 23 Nov 2026 05:43:13 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeca720sm409336466b.53.2026.11.23.05.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:43:12 -0800 (PST)
Message-ID: <664a18cc-24d8-4140-9c3a-d522945cd2cb@gmail.com>
Date: Mon, 23 Nov 2026 13:42:49 +0000
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
Subject: Re: [PATCH] dma-buf: fix leak of ctx and dmabuf reference in
 dma_buf_io_ctx_create() WARN path
To: Falconet3 <Falconet3@proton.me>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <htm5h9oaY-vk0g9JVYJmz5XCaKe_nPoWkUJYJqDulyNvv_sAWfzSMp0T6GWt5okc8R4SyvXXpJQ3VGhetKnjEa2KGem5uCYdxpmdzUFf6XA=@proton.me>
 <tRqxbL7txMRAzNLKylzBLQURNLpU-D0Xx5CrngGwLoYrK7V7kREharagUfgQLGIfiYFyTALR0BwL93AL_PWmFXq_MoZPhvPfUojBsyCnilI=@proton.me>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <tRqxbL7txMRAzNLKylzBLQURNLpU-D0Xx5CrngGwLoYrK7V7kREharagUfgQLGIfiYFyTALR0BwL93AL_PWmFXq_MoZPhvPfUojBsyCnilI=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/22/26 10:49, Falconet3 wrote:
> Withdrawing this patch. Apologies for the noise.
> 
> The WARN_ON_ONCE() path in dma_buf_io_ctx_create() is not reachable with
> in-tree code: the only in-tree implementation, nvme_init_io_ctx_locked(),
> installs all of dev_ops (map/unmap/release) before it returns 0.

Right, it's a warning for the same exact reason, and cleanup considerations
for it are different as well.

> And on the only path where it could ever fire — an importer violating the
> contract — freeing ctx directly is not safe: init_dma_buf_io_ctx() has
> already attached ctx to the dmabuf and linked it into the importer's
> tracking, so kfree() + dma_buf_put() leaves dangling pointers and turns an
> unreachable leak into a potential use-after-free. Since dev_ops->release
> may itself be one of the missing callbacks, the core has no safe generic
> cleanup on that path.
-- 
Pavel Begunkov

