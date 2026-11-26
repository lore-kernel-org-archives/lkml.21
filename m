Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726061;
	b=xZ9yD9nYydbG7FpABGCE6BKb/V5CtUr4rDvYmgbb4POsvbugxUVyWKsChGqjnW/VcxBY
	 dOLh6ZfLoIPC4MVWniOnQITeq/B5cdwn/9dd+k/QiCSkSp2G9EqMhgDlv/ilJoHcTl3I1
	 eHowep6ydsqdz4KraZcCmfFLQUG+WDpMMUXTn2qRkujL2sJw1s6YPXIYUmJZ9nOFgbCsa
	 8qp8YfQUxAE486GWomiHzTcSabbtX6TDtB0WQqN/mMADli+mMYm9WJhEad1NoWOL9a0RG
	 7hVs2k0qPXplkvmDJW9E/jUYF84ty1LrGHIH8PcY0swqK+X0R1q02dGyiu4JCDVktww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=SR/AburNxAUCmUNTJKXfpF56nBtKEZwAoNFv2gTiT7U=;
	b=mI66J6ce/skeNSh4SG9a0PHkkCBVWOAeETg9bCzwvtsnc7+Aj1HMjDUA0OxH4gt4FUrd
	 aWVmpTnIvxxuR70Kw8H8Q9uFlzC5HSKGHP09ZHAiXcxOL5gNFkEVeCzW9k9VlsrVCWvC+
	 nVVY+mhbpvwd7F2IEJVC+nH0BT+YZ/DjlpMHF6rQYMUebrtVR+f6je0U6Pw4o2/TWUkrL
	 XS809OyrRdXmKMpBeccICv2crqH8ZQzWGKh4xBB5Ql5SexVv4sP45N+5LpcUewiVzvjhC
	 +p5jANQbwKrdxZoNAFyKZR+gOSeo9TVbcgEGUSHxziL4kuvseVrzI/GIPJP/qaoXp+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yMZleQi6;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD18606A338
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AD18606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yMZleQi6
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8c5ebbc5150so5081699b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795726060; x=1796330860; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SR/AburNxAUCmUNTJKXfpF56nBtKEZwAoNFv2gTiT7U=;
        b=yMZleQi6ph4KHNFEIJ5ju/BHODTOW3zjrQtMdDRUa7E74VniG6wfkWAWs3nrqUVNsa
         +2b1Dnb1Tq8OMNC3qdoxxS11KNZrzSX1werpMh4SrjaVz7PZnTkudMBsAyBRsNQ4oKhJ
         YjsFqSwR+TXBIlZ2iAxS2H0F2d0pAB1AhrNcXFFNO1jN2jMbVnOeTNsSY5vmWDTkxANK
         b9TU9p54wNDRh30PcNePJys284zAPIxHuMXpd3uyaZj6ZsXYKh4Y8hbVjWXY3h01Hvb0
         cUTTKi6/6KNngek2uV96QeMXTHnB2qewBdsJGcBKRMvC4iM5on/tQPxOGm4VdGm6r/a7
         VHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795726060; x=1796330860;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SR/AburNxAUCmUNTJKXfpF56nBtKEZwAoNFv2gTiT7U=;
        b=cTAHQ72NUYvhGabmIWJL16IK3o2UMZSTwUwpw4A4sdPNluQgK0f6jmn/jqiJ8Mu6W7
         sNeWKpVKahmKNv72yyfuvDoRQY9w+NQZI0n3TXkYSgCdni/iRWoEfsM2TLICWBCrNaMd
         0HR39bzQas7uHQF373O8vSmF+TxCWnMChMWM6m1/8V4oofNQiTMCofVS49cPu+kOYiSE
         88OW+pqzK9UYat4L1D/tTGILy73Dg9q1QaSHGCNSmScfvVYYIvBqTaX1OKqlFGdZZSsW
         MIq7PobTcmZdN+jY6powf7abV6w7Y3T/oPVbdJ6FhNZarpiNog152ddlyMIg84xNWkIR
         EfOw==
X-Forwarded-Encrypted: i=1; AL+hErHhmPJ4BDTJbekX60HzmnQgW8OorHJ8/rYjDiD/TbJ+km4gzWOdYYlN39nExxozTI5DhKkCr8Uiw2tgQ1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z982zDwkzYDb0A7PCT/yidzDkEq8QSmlp3eI8/zZ51tUgj9IDri
	Pn+mQRo/efsKqj5PeJ+OUp05ocTTv2P07ySg/dx4gnzlTj/g/p/C5p7i
X-Gm-Gg: AZFdTZeWjDJeMn4rR86G2W32SAlujKCm7Pjbs62omgZHmTjbUhGYUV1WN8g9h1BdhZx
	uB5OgKTdTt7nDbWQVQHlITs3IiBErKTpvhzHMknHauvugaJhV6HxdLZgolhCgp19UAuA2HVhvHK
	/1mZg9H8VjCTZDMzmAdvHH8LyvW2KVGAgGePkSJYtqka/QCkSA36XQvRZPqrgbvkiVzHbG53/GY
	AsITtHNmQ8RlPrY/+QyAtimf4DpdTen2++/wVcn/M5JZO77YjTjUME7LVjWP2DqDkWTSr89vaQK
	3sPEhYF0ob+xVQafAJ9FOhW31GzYg4aqtwZUE3HYxhVIubJkgfivIuXcJ1NBaTEUM4nExg2qkKK
	2r2IRvAbTOJibovPPgCsVJA0dZ+ChFd8pWojDky9m+43ZQ1rlM2m7DJUy+p/lfJk4rZqaP7/Z+5
	JXDAKD3iqUS1zOL9NoH4oFTcJchpus9iag0rCeK5MnObP4kJQ0MbsFH6P81theb7KCKKmy+r05m
	hKAiSrFd5taNwbupK0qDKiS9XPKzulYklXgetgt8CzB0zWpox1is3fYaOK/LxFYUVUqQytf/Bkj
	Ift27qP+7GRhUpFLVi5balolW6KO90zp7MH6o8jOVA6Vqx5UoWxqOoGurUVzAmk/8qnjILGaZYV
	rLHZgS1L28cUaGSzucKUoWdd2sns3bJoz2w==
X-Received: by 2002:aa7:8893:0:b0:89f:9da8:1b66 with SMTP id d2e1a72fcca58-8c87c389aedmr20766524b3a.33.1795726060064;
        Thu, 26 Nov 2026 12:47:40 -0800 (PST)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bc47sm11459429b3a.6.2026.11.26.12.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 12:47:39 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 20:47:39 +0000
Message-Id: <DN5FRF704VPN.12EK2J9356Q36@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/2] selftests/bpf: Include bpf_misc.h in
 uprobe_autoattach.c
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
In-Reply-To: <20261126051307.13170-2-yangtiezhu@loongson.cn>
References: <20261126051307.13170-1-yangtiezhu@loongson.cn> <20261126051307.13170-2-yangtiezhu@loongson.cn>
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

On Wed, Nov 25, 2026 at 09:13 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> Commit 8c2b5e90505e ("selftests/bpf: add bpf_for_each(), bpf_for(),
> and bpf_repeat() macros") accidentally removed this include, causing
> FUNC_REG_ARG_CNT to evaluate to 0 in the preprocessor and silently
> skipping all assertions beyond arg3 on every architecture.

It wasn't an accident. The log of that commit says:

  Also clean up a few tests that either included bpf_misc.h header
  unnecessarily from the user-space, which is unsupported

Nothing in prog_tests/ includes bpf_misc.h today.

pw-bot: cr
