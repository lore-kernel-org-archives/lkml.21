Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167995;
	b=uB0uwCEFHDg2Cp5YTE48soPCiGScMM5LM+JiHDwxULiQdtku3FSekKRUg5cE+0zS04YN
	 y8DqmBFHKuCFFTi2AIq1bCBxJJuiVcHdR1lkV9ShvRWKnYfdY4vGdP9NdQEjVYbQDxAsQ
	 sQ7mxUKD4OceSxs0rYVStylQpgJEIkHGqa3lrtqNQtIsMteYACMyM/r96dd9Xzq2EaqN9
	 DnOAwSnVJNK53r71qRgdK6lFM9VyQTwWjWnKa+Bv1RrXaA4CxI0V1qfKgI6o/dghr8wAV
	 K4GdgVSpPl2ebWg+m0e8oNmpR17l47fOqCaNoPdeDItvmuVzm8MQN2Ct5Fa9xSWyjpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GcjNI9PrNL1HjMpwoI+gV5DtiJeXajBxIpVqEj/uHtE=;
	b=Ffd0yUtc+CIuOIW5ULHLzsUZP+ioRM6y4j8CQ+WoNy5bhHm6NA4eRM+AU1RyUIoWieYq
	 vAv+EgWvSI45OINhYG2ufaxYvY5m0wOWXj2PWiL3jw7krRgx+Xk5te0uS7uX2iBDI/vHE
	 7+yGSNjtWbXKYNKEiJD6ZUEOLYYCTlC2k5p7M2XXHo4RBRr49Bx/SWw102HXDeoJAkIKT
	 TTRVaReK82dST0Ufwc0i8ElToaw3C0vqXja+h/J+Infb5nyUjWtgRpKRR7RyopmTS9QVN
	 BHUBrTjvlqvcJHbAkpKb6vBS2aKNhfOLgET6Q/Do1FcD9XtHT+FJzB1y0RoHWKj92kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LBRy/uaz";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD81606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD81606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LBRy/uaz
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49a92144733so308108f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167993; x=1795772793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcjNI9PrNL1HjMpwoI+gV5DtiJeXajBxIpVqEj/uHtE=;
        b=LBRy/uaz9mbmJhIx0EYumM8ld+NtVsEO2eRS/sKVugx1eyxecKXEvUNjzzWGC2NkA9
         MLAIvCBghed8pMQfkOrRY/bPIU+kqNvVWMSYnIv+rP06o1lBKbhd2TbY15szSY/ogT93
         balH8PGnHSWozYYn5itxtpf+Pa8SZIQl1FSNCUnshR/xUdGZ4NdBlLrLlKWou8M9Ifg5
         Ol89LktOsaGfAfEecLfy3DZZV7f4CbIGk2KLrOyUcBrebqim10zib0Lfk67kIGJikXM2
         K2lpFbYkeOs900nnMnXNjcxlDfRIAjO7zVhkxx5xEV5cl/Q3K/xjto/o8AeVmmBvpXDr
         dtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167993; x=1795772793;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcjNI9PrNL1HjMpwoI+gV5DtiJeXajBxIpVqEj/uHtE=;
        b=q09qs4JxU2zyfBbAVa3PjGXFJo30IGoMHPETyacw2E0MEJwc1NenNZUIRaLeFm9HZ7
         QOaJmWWmgbi62s1KVBoxa3m07wYay6benTfKbe9L582fIhBV8AfrEzOGA8qiVQV25yRF
         0/4SpUgYTBBSzTbBrugQTDNd4AbbM4Zk4HLgQtbfty/dgpN89lDuMlHNmgse+gEfJpkb
         gRfVvSOYQvtZk3jhbgr+f+8SaaSV6k7GOZnd266T5+Ng9u8ydQfYUeGfe3EUrOwcl6Bz
         ypI+XNbGoHYT+WpTJ6qupaCmNf+d838GyC8pxDQLwPNlO6dWB2E3lXImpwAmRyC+sGED
         Vo3w==
X-Forwarded-Encrypted: i=1; AL+hErFfj9d01bGVVQFWliB20QpWShwLf4vDToyC78b9F8PuvIA2WfCghoFsmnvbu+4X0HZLxpNuzhT10mb5Qi0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9qM2Zdg577v6WuG0A9swvO5nhEquxKpkGmrwdsAq8cXi7KE0G
	rgvuHMEale1AahsekCA7BRJKO0qA6KxIW0F4h4ZoNvOdyFh0YPHrGtRV
X-Gm-Gg: AZFdTZfaGi993eR2Y9/HIAVezV1Z5pdyvevctQzHfoeUGowIQEHKXLL70HlkVzQrVD/
	PKVFj4YH8y3YxhR4nWbYIcnpqkZTK6NMuwZzLDuUjjq9Le2tYknPi0tg7o5aDUKCi1CIcqyhxzD
	cAEiWqIc5s8k+OArwDEoRQRCOEyhk/+Ccxqi+EnjK4alFQVXCHB/ymXFTxeay3d2PYzn8FBF8Ob
	3a7u9DmeU9xqY1jXbP0+b/zkTOxmNIIM7JaAJBiopvz3S2gaFOnXupz+AmTQr8TuJIT5kELFdCl
	eHd/iOLwVYP4mmNMjkjWaBs/4iTnAoQ6XNv/GbZlIvmYTd72nmKOsbEtnZUnBTTXkir++1Sc69k
	sO4aDqpld+BYsz7mjHU9g+UYggDQm3Zz+J7lD47bHHHVZ3jEZLW+AN9rkjX7/YMTWALOqaKxH6x
	itnwPCcgxPKNMIpN/EtwiqSIAz2UcBtxIDs6+H8dull0BsUDB+5UrFD8nDAmHQpR18h7PwhOWBD
	3LE2tYEyQz19++/uJ7NGlizslO6xTv9u0WU6ocm/L2hwFDU74rjjUpbOT7fUrrV1j3ZtUvxjoFz
	QNLfdEZqLezxSXM/Iq3a+dfv2WZDVzs+SXMcPydtnRphPz5tyvoyzjXC1OEwYkiagg==
X-Received: by 2002:a05:6000:2c10:b0:4a8:a1fe:ea94 with SMTP id ffacd0b85a97d-4abacfea54fmr4924872f8f.3.1795167993308;
        Fri, 20 Nov 2026 01:46:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm4551779f8f.29.2026.11.20.01.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:46:33 -0800 (PST)
Date: Fri, 20 Nov 2026 09:46:27 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: x86@kernel.org, puwen@hygon.cn, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 linux-kernel@vger.kernel.org, yangzhen@hygon.cn, dengqiming@hygon.cn,
 stable@vger.kernel.org
Subject: Re: [PATCH] x86/cpu/hygon: Work around XSAVES Erratum 1386
Message-ID: <20261120094627.513b216e@pumpkin>
In-Reply-To: <20261028235712.383977-1-zhang_wei@open-hieco.net>
References: <20261028235712.383977-1-zhang_wei@open-hieco.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 07:57:12 +0800
Tina Zhang <zhang_wei@open-hieco.net> wrote:

> The XSAVES malfunction described in AMD Erratum 1386 also affects
> certain Hygon Family 18h processors. Under specific conditions, XSAVES
> may fail to save XMM register state, allowing stale register values to
> reappear after the state is restored.
> 
> None of the affected processors enumerate supervisor XSAVE state
> components. XSAVEC is therefore equivalent for their enabled state
> components and is not affected by the erratum.

Would it just make sense to use XSAVES unless there are bits set in XSS
MSR that the kernel might need to request be saved?

That is 'use XSAVES unless you need to use XSAVEC'.
Then you don't have to worry about cpu models and microcode versions.

David

> 
> Family 18h models 00h through 06h and model 10h are affected. Other
> Family 18h models contain the fix in hardware.
> 
> For the following model and stepping combinations, the minimum
> microcode revisions containing the fix are:
> 
>   Model  Stepping  Microcode
>   04h    0         0x9040000f
>   04h    1         0x9041000f
>   06h    0         0x9060000f
>   06h    1         0x9061000f
>   10h    0         0x91000004
> 
> These are the only known steppings for those models.
> 
> Disable XSAVES on affected processors unless a matching model and
> stepping entry identifies a sufficiently recent microcode revision
> containing the fix. This allows the x86 FPU code to use XSAVEC
> instead.
...
