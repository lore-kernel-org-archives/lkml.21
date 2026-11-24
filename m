Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541969;
	b=FX13C48r+Uu8pHVozaxl6gHMUNo4xp0Sr6Q5a0jvx6/bYC8pQL9wWNYNPBgIfbbzcliK
	 n9O4j0o9eA2SknuKNB6bNSYGNDNiz7wZzEUikbmrMUW592ckum6nepY8Qbwwi3BgxWdhr
	 pmtLpt7Vzq7s7d5P0ypolC+d2Ypbxsx0JL+3Ra6AsrV1QZdKKVKjYMbUVErPfvBg/Zli6
	 3nCNzYHlSMKjzWlztjrSb32zHtlzXYppREtYEq6kr+9nwDE3vRuvEd8Ko4GCOt1fUNrNF
	 scaqL433X87Df2J4Uva1VjIJjzd8ZZXdeJLFwBu+W5CrEBVORMQgL8H1z9lG/mxWbcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541969;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wEVUsPXL+/9WghyRMIFhi+HChMwXmmXY3YDSRyt6xMQ=;
	b=BpqaCJWAJFE5cRT0KecuR0D/lIZ4Rs/ad6Pgch1vB6Mp8REPzMZ4fey5FArvUq8dmT4V
	 gNnW1UYwCW/8bV9kZZILONFvZbCaQcgpovbKG662lF5NYF2wUeF1ZQnuy7ttwgFC/+0pa
	 5P/jZ/Jc1jtxTZ3qtyz0gIdJZx3r3/s7M9sH+0GbtRWIdYHKrfj0KROXq6SxZi7x2lqlV
	 G4BE1E5fhAmeupf6Oi0Ku+1GPI+7AtBx4cu0f1X5d9JF/Ip20ca/gSkYsqOfD4buaa1vp
	 7MSJILLCtlfaokmTq7mlWVavhW841qlY3VV78RRNaiwwpubsb6zMdy6oqpPiDxLeKBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B910C606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B910C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9211efaca89so56501186d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:39:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541967; x=1796146767;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEVUsPXL+/9WghyRMIFhi+HChMwXmmXY3YDSRyt6xMQ=;
        b=bKgVaTz+rB/p9xnyevKR83ZmssTK275JPngZAwwZK61glZC72zqPznmlofeBzel7Ts
         0uRLYIGiEfa3w25Li455iuwjr7vrhefSg4xLEv64TfMekwhFVaPWp330yOR97cBz/fEd
         P0+kfDuG+rb+z3Qan26TXPadqz6omBr14HIPkY3ZDVDWbN+e7KdcoyvcFSPFk7VTvreN
         Tqc2GHd4JtkizWlkEo2TmUGtsDXlxMpm4X7Z5QXfUBBlAqPeSIr1ztaKOsPzyIzv1h+Z
         XMVMIqPXdMBkEaORZqWulFLpT/Z6WBrngocXJCBk06oiLbJRNGQ7NYdQbyHdX3cqNlBM
         KUig==
X-Forwarded-Encrypted: i=1; AL+hErH39GAf2CExuJz5ODiM5iBcUktCgDxnZIRrSpUVA189I+8SAUNQtgj/WEZ5IL9dtM0ZRnqdZ5OZSY/bhx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9182GxbqVp73j0WvCyvO0N+5oTxzZUK5OqsNmoCPAEheJVn8Wu
	vpdEdnoFgjpzKa2ZcwCq13he2piFaiNSRswdfqbIFXl5sp7+Gkd+7df/
X-Gm-Gg: AZFdTZcQ4FO4cYaV8MX8+CLcfkTtySu78G6DNU0/LOKBrm2VeY9k2sHhxiYlXL3U8a0
	XO2tz5eIHUNBgRtuF5widA7+lJrL38JYa04+lS0cBeUM+YTk74DWPBKJ4dr+BJMNSgDQdB5jHeW
	GGJNnvznvbuzQC/ESPATbdQEYugWcyUPnJOEqdfNnDaWk7W7uAL5QNT5Xd9YuHE/cQ+4JqLTlL1
	1p+Aalzq3aO1LlXSFsoPNp+FW64w+Ar1H43m4fpBoY7BHcwmzeLPAkLPOCMlMdft8tVAVq3R+OB
	I6mRLjx9BqxB1ASfCBonaBJq8NKu3It4lArpY3IdfNXedvDxpXKGeuaqK3OMhP48RC+SNB5wpVO
	jqLxopWAJAD+Bx1/aukwDNQ3LN11skBEZ1Xnq6Cr99Kt/B+hqcGHmFa9clVYgWPLsqz6bKJWESw
	8Zz0Gg5S+k1K3BpmfTFK+rpkI4TVzl79D507s+AXocFg0g/DvBNb6DrbcTmX+ap+lqMkTX8dj5q
	yeNYoMKnoGATOITdHk9X5jcolPrJmxhKfGz4O32eH6tEtziKwEVJQzczbtMXKWvRkNv0f0O4ceV
	4GLuAjdnhywthBt51+9hT+ldvhjcimAhYQ5zShIY2xa+iScyMmdJnNtwZ5FfMjUZ82PiyTCANBf
	Ngwo5MKGfjhNg4gh1PZqnSH4NvcmTTosJHKBSERu4GdPPn5v+hzuQ
X-Received: by 2002:a05:6214:1247:b0:91f:355d:d7f4 with SMTP id 6a1803df08f44-92134a7a7c0mr274698866d6.18.1795541967504;
        Tue, 24 Nov 2026 09:39:27 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349f8c34sm141160046d6.32.2026.11.24.09.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:39:26 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, shuah@kernel.org, arighi@nvidia.com, xukuohai@huawei.com, billy@starlabs.sg, void@manifault.com, ihor.solodrai@linux.dev, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, awerner32@gmail.com, andriin@fb.com
Subject: Re: [PATCH bpf-next v3 4/8] libbpf: ringbuf: Add a caller-owned iterator
Date: Tue, 24 Nov 2026 12:31:21 -0500
Message-ID: <179554148179.68173.17534252990255417064@kernel.org>
In-Reply-To: <DN2WJMWD5G0R.27OOI2IBOXA6M@gmail.com>
References: <20261120-bpf-ringbuf-fixes-v3-0-ff7ca15d6c37@kernel.org> <20261120-bpf-ringbuf-fixes-v3-4-ff7ca15d6c37@kernel.org> <DN2WJMWD5G0R.27OOI2IBOXA6M@gmail.com>
Content-Type: text/plain; charset="us-ascii"
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

> We can compare notes on the API design and decide on the path forward here.

I'll drop the iterator proposal from v4 and keep the fixes and their
tests. Your series can build on that; it leaves callback consumption
unchanged, so the callback wakeup fix is still needed.

I've reviewed your series and will send comments separately.
