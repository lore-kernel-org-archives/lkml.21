Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795673206;
	b=jnSMISvpcfTq3gewKN/nkUnE3K3OV11sIDbyvKur48DLR559wqb1dS5SPfuCer2e0I72
	 K2gELfd83ilKIBMC5dmPERNLbXNLoCSJfZiqCjKC0zwvngwSehfrftRBUkDi/JPFY6hgP
	 3qCKxrz52pQZj+piCj66bb3Vu8/E/6GZi4tnH5umgubyzzm4jJyW8imNz0XMaR1iqXd5D
	 xWyUq02iIYUMOLi+kt9TbtKUL/ZyiLB+Rl2BPdAqUFsEVo/kqqMvDd7gZFmYXM9PNZrk+
	 armKau+VsCmEiHxuZCPhD4TEOvwkP2nd80VBbcPOLeMtzwudAjmlMj5F7CzSVuar+UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=rgZI8bJgZuUFpcROH1WhHUr+AAZ6H3onNQ6CGieUEr4=;
	b=vU7Z9CSG81fmiVDodexrH7j72JB9gxDgGmUOg5A6jnP5OZeZ1n39oLWjzCd6UsiaDSoe
	 HuZVUQQ8tQRYqNLfC1jKlNDyM4JO8TQW8fTZHgCjDTF24KbtAiuzxrLci0ZHmYSs5+nPJ
	 HZavzin1BAXSuXY63XH//7ejaG3cOkFpeWLe2IlyupPSkixBO79HNcZt7Ip+qt7Fi3uuI
	 9lCTZcOZpcgINZMr6sOoh52sK1ZjdmkgqosW0vqFeukJUAKuX00IkCWTomC59dtqLSJo0
	 HkP9iNBrAFEKsuTx1Jthlm2ZO88Y6xeBc3WKAGur9uuT1O0OL2Vq2+WBCL6yJxyt73w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=niWKuk1P;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC16606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEC16606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=niWKuk1P
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f07a960666so45419195ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795673205; x=1796278005; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rgZI8bJgZuUFpcROH1WhHUr+AAZ6H3onNQ6CGieUEr4=;
        b=niWKuk1PT2vuPBvZtqOiboHCy/NqOBPF6effjQvkh9munHdBOxrEWGk0m2QEULy4Bc
         h0lgnHuDtzWsJobYB0IsgQjhn4yNowB69wjs27yVSiY6pSqMCIoZjCaeeiWB9F10FnnP
         QAzLvrNNAZ7jmVGryOF9s7bV/IcBKqNkMKIW2IKViavN2Z2TksuR5/2RegJhA9+SGkEz
         vBn/oY2TXogY3zG+UlBn3/bCWwy2igmGZl1bhWvRtEiAN+VVafnIBCKPui9wql1SR9tO
         cr7/a8OcZwdxpLcS7LcYoEvfgqR+aMr1MH/eD8xkHKIFYke3lXiUFTR4xCN8fa6eGoNh
         YEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795673205; x=1796278005;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgZI8bJgZuUFpcROH1WhHUr+AAZ6H3onNQ6CGieUEr4=;
        b=qIdw58srj0WAqRVp8dUy7u0UU9KBioYpDfpcuXoxX/O5qdPKQ5Ath/XZ9uJvuUt3M2
         JlFHFrKj23sFg0tes/i0n5FBlIWfPd87xQnKog4lnw17R8hUMrGPkw1PPjczzb+QQBbh
         08ePOXw6UzyWabSAQJKi1VaQS1NuASiF3eiQ5bBS6JBASx3OZsZrud5LopTZxRqDkSa+
         UuhKFi79V2RdHPQZuGBo70ld9utzALlBdf+KGUjDko/pdm0PwIQWlNYj1Pg3xldpVFCd
         GspG3IudyvgS8mqeriwFWCOyG1xkcGC8CU3cAg5tJ+sincAGxE4Dg8y3phAkvlSkY61u
         /plg==
X-Forwarded-Encrypted: i=1; AL+hErEjy6LxTz+265/ZDudqp6NG+3cktw8je8rzIUy74dSybcGdenM30gEfAp+4eotSWbf075AqhBmAEEOHYPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NirTRYeL53nZmd9vX1DXMxQNbe5jGjZKQjp4JsAf9A6MgoPZ3
	CDA0QzXTuuomgScsKoW/dLWmBg0hJIWzLX64O8OaRY5CsHfTztX0d+lz
X-Gm-Gg: AZFdTZdNCZRxv5bbhFsIxv3/CD/bLfsGQpK2z1prbwP9l+nNp7NJcWWvk+U86tOyHdD
	6nCHOmSlF2HShKB9WJsLwp6V4qlIHNH8N8Skv6xYAChUQmLLgcDPCNwitoT+PBB/GUAw54Lqi9G
	qrHhB3wPztaPQfFPPGyZ2suld8uGJP0oHCCbjFpd2BPDiDLoMXX/cbD1mDhPzteydYs9ikz0pX5
	xGtBJ3l29Yhe73afIlSH8c2/nBoS+xrQ8EmSlMYUM7D0XYh+MQs+q9uAU6xwDuRq9fArYL9SVdB
	cLGA/d9qOe10I/AKXH/pPFD3xoi6py/d6f0Mt4uhcMcM0QkMSPARCz3BdnfNwU5WfF+JlX/6LXH
	tMfM9ZHf1g6CQ6kzhQPc3N63bN0dZGwLNV0sgZLjCfc0ywyKEDVWnBfr4NfR5MYufOFTl3Dv05C
	JmmNc1rOGp+bHhuKtz8zhTC9Xu7qqmnGD5OCcTRefgw6YGGhFmqU0LhoBqPDvmjxmsM5255x9/E
	fS+nuKqESOEEkYMr9qxpeE9VcO2tVzN9Lad0NRtGtgHYLjdelcX/5LOJgWAyohwVZuQGYGtTsOc
	yA08IanCVS0wpn6aiWdRdvEZzd3vVO4mTTKotxZOMiZvBdk5u9NP14/uDVEdV3z85uKjVjyCHD5
	B4u0aNqtWdHgMF4PsYUDI05ezLSg+pXe9Lz8s
X-Received: by 2002:a17:902:da48:b0:2ef:d1ac:c97b with SMTP id d9443c01a7336-2f03f19372dmr200960655ad.61.1795673204870;
        Wed, 25 Nov 2026 22:06:44 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm44555485ad.45.2026.11.25.22.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 22:06:44 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 06:06:44 +0000
Message-Id: <DN4X0XRWTM33.F4T4JF23X58I@gmail.com>
Cc: <bpf@vger.kernel.org>, <loongarch@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "George Guo" <guodongtai@kylinos.cn>
Subject: Re: [PATCH bpf-next v1 0/5] selftests/bpf: Enable private stack,
 large stack and arena tests for LoongArch
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "George Guo" <dongtai.guo@linux.dev>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>
In-Reply-To: <20261126055355.9967-1-dongtai.guo@linux.dev>
References: <20261126055355.9967-1-dongtai.guo@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 09:53 PM George Guo <dongtai.guo@linux.dev> wrote:
> This series enables the BPF selftests for the new LoongArch JIT
> features, and fixes a libarena build failure with clang 19.

loongarch folks take JIT patches, so pls don't post
anything to bpf* until trees converge.

pw-bot: cr
