Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444590;
	b=VJwjNuSluj/sarTj/AAQ4ZLwaI2CTFNDEke2QaVV1hOZfco8b7Z1jZ/zuLdE48zU6boP
	 mTfgJLQ4sKP5af/o97i1JBd7NaRNVImhYwCA2GUhBgZM5YYBxXdwiGeLd04mS1gXaJb8b
	 o+hCsQZAQGjceHSp7xR00IZ6Z/NyW6VAT1AI/bkrdJlmuA3peaAVeWKw4Qyuo+g5WjlYT
	 B2/esreKlPOq9t3C1aIZEMGn4XUDHXNkYnmG9PgTxnXaqga6rTO0jhYszYlZVfNON7gSD
	 6S3yc3WKmyT8Ns68Qqdob57z8E0VdBiWu2mkDSnIXu2dqnDf6HKPpk57zorhJnVRL/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444590;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0vSK+rEhIOTiE1e9j/UHGI1JrIFuyU+/Fce5zP6Fecc=;
	b=Mod/0lpX7uAXG9DLlyhDe2cUwUJ6IkG+qx0UKLQqwBQ8MdPOq9vUrGGlUSWvknqG/lK8
	 D9fnhSvkZTdLe0N1Za6d6s6Fc2BG1NfKrxDVNngiyHwSogTmhN9ebaVdFZ1/sQHWREV/J
	 TVKf4mFEisbWRTdb1SCBu+j2wiUWsspBhScdvj87EqIGZIzigyXc4IVxej+QWPU6EZRWn
	 gQhBmBOwVOAopqNyN5/w2P3unFX2sITl76nojvr4cauJuT94NghDZlmarA0u3GFBOoA9E
	 2HRHEroKBSjknjz5bjcCL2urmBID6A0uPvMFuMBMsAXHYWKI9qQzSVfSoPmZeDMJELg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fmubSp0l;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BjxDy6Ab;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AAB606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47AAB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fmubSp0l;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BjxDy6Ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795444589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vSK+rEhIOTiE1e9j/UHGI1JrIFuyU+/Fce5zP6Fecc=;
	b=fmubSp0lTe2lBpHS7z32eowYgsfSVd01t21g+vVCpUNoRNvaPforfSKdyE2lStg75wzIa8
	p1X5W97+2QffiKSSBiXw7gEyA64GuB6hNcQ7Sirx7doKQ/FDBcMzA4I7tymIEWKjXFXFSA
	SmQFQOL4QUl937C6uPqGL/mEOOnDvkc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-rNnV2DOjOmK_XuVg902TOA-1; Mon, 23 Nov 2026 14:36:26 +0000
X-MC-Unique: rNnV2DOjOmK_XuVg902TOA-1
X-Mimecast-MFC-AGG-ID: rNnV2DOjOmK_XuVg902TOA_1795444585
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49953abe51fso23391225e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795444585; x=1796049385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0vSK+rEhIOTiE1e9j/UHGI1JrIFuyU+/Fce5zP6Fecc=;
        b=BjxDy6AbWNi9syiiWesh63AHHWJB2ob8mqmJVI03lYATnnN7gl7jFETQgBi3hLgHzS
         Wn4lrSch++eEjkSyF3RV9Ycyho+IB1h1BaFe58XLvOlmg0r3/PatbaJlB371eqqHmUod
         bm5k2vMOQI+DNJNorZGw5wDM1KlCxI1ggazU3VdauVNbUr2/Pef6MRDY5lwDLKCfXCgW
         Kvjfk2QvDK6kHwah3vpQGIzhi3zR7TrQHlxSdD8c3eysabPR6Crf5oq7ThyakNOqOZWV
         P0EHYa3EOskBwkKmMuF2dyi2rLJkFHlCOY2ew1a5NfJeAPGm4uBrQgmIbK2E5KSM/SKC
         L/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444585; x=1796049385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0vSK+rEhIOTiE1e9j/UHGI1JrIFuyU+/Fce5zP6Fecc=;
        b=fT54SvQxzhYqsGL69r2cGYhL7lMw6RRJN9J5HHkiTBSu2wTwy5ICj+6MRQcQUy3ZRn
         sVK2tn2aOSofrc2ucGwY45IBKfOX8oqcNPovx5g/JbVYExyZmPqkOy3b249bYzhFj6AP
         l2XJlVJ3qwyfMo+0k7vlA/i0pm2KLQCYhOl4U6WDMHseNk2k8vN+lsiGBfbprZ2Ea6+u
         8nC2fxMoS+RqAww+MibTDuC5+uXCD55Ymlq95hEHHvJ9ih8xwWNbKx418jHIGNsXmFTF
         lwJTEifjZ5J/sjlYlUrMcPPGSHJvDGBnlCkd+KFc/eNQxYcjImHrpfL0Q6ni5izwGUJV
         FwTQ==
X-Forwarded-Encrypted: i=1; AL+hErG1zWR+553hwuIjylNev80WHKAwDIMqTN/iRsDHAkXCEoSYTypUE3gMCDKENryiTW8ADPdkmGYxjGqfN+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/phie1tiwhftLqJ1nSjautkRwcByTOE8n/niWJiaeGSz6xS60X
	FKMY0NpDSg6NHbwGiai/t1mqUmwffQmguXI5t+6ERcbLRJzLKxYy6yZg7sZVeZsnzslCwkM4ipJ
	iU025VFpVskuVGuFgLgRWlgNgETj9gSURLpnneRTATk5toVbyp5RMzCIpmmt9r6Y+UAQhS0I7Nw
	==
X-Gm-Gg: AZFdTZdPJ5/vymu3pvXUG96EU/H7ZOeXu0wujVhKZSBEw6EPP1uoE9gOAuuBL6vbwP5
	NmflR8tx2/ZG9F5IqGAKyGLsFjrxzxI0NE+CfAzsDKMAVMH5E6hC7bxPdoWklpG2I/DS8Ma6cwh
	PhrxB0dG7xhb357g22/sCpzq9wjVwqsleTZwiAOvFgBbPdKsm7Hdeo+231tkP8Ldvz0ll/pxQXC
	CwAI9vDcx4EV4XOWw8wa7NOS5lNh366aEyucsaCXz3h+UO1DaxtuTi5jv1taTc8WMinXNgshL9J
	SdlsqIZNx8pt9OIL7pG13jBiJZVfFFe+p5yni1bT8feu1G94YG2pvtvGWLieaJFikIkKM9Qvr68
	5e+4XOHi8qFPXSF8yUJwRZ5uBVP83XUs0fRMSN+mQI7SMCAe8i8sTfs+SYXyHSGdfFgAtfwCZEt
	nFs4/J7BJjS3HtGn5e0mnRCqTgJD1+35j0DXWsKlUwH2ap
X-Received: by 2002:a05:600c:3e0e:b0:4bb:6a5a:783d with SMTP id 5b1f17b1804b1-4bb88929c63mr223518875e9.18.1795444584779;
        Mon, 23 Nov 2026 06:36:24 -0800 (PST)
X-Received: by 2002:a05:600c:3e0e:b0:4bb:6a5a:783d with SMTP id 5b1f17b1804b1-4bb88929c63mr223518385e9.18.1795444584371;
        Mon, 23 Nov 2026 06:36:24 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm346324635e9.6.2026.11.23.06.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:36:23 -0800 (PST)
Message-ID: <57d847e1-c6b3-4121-9438-6580ebeb821a@redhat.com>
Date: Mon, 23 Nov 2026 15:36:22 +0100
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
Subject: Re: [PATCH net v5] net: txgbe: fix stack size for PHY interface mask
To: Coia Prant <coiaprant@gmail.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 netdev@vger.kernel.org
Cc: Mengyuan Lou <mengyuanlou@net-swift.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, linux-kernel@vger.kernel.org
References: <20261117175528.3018609-1-coiaprant@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261117175528.3018609-1-coiaprant@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 18:55, Coia Prant wrote:
> The DECLARE_PHY_INTERFACE_MASK_ZERO() macro currently defined in the
> txgbe driver incorrectly uses PHY_INTERFACE_MODE_MAX as the array
> length instead of BITS_TO_LONGS(). This allocates significantly more
> space on the stack than necessary.
> 
> Since hiding the zero-initialization inside a macro is discouraged,
> drop the local macro entirely and use the standard
> DECLARE_PHY_INTERFACE_MASK() with explicit zero-initialization at the
> declaration site instead.
> 
> Fixes: 47f848aac4e7 ("net: txgbe: initialize PHY interface to 0")
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> Cc: Jiawen Wu <jiawenwu@trustnetic.com>

As already mentioned, IMHO this is net-next material, not worthy a
fixes tag.

No need to repost, I'll fix while I'll apply it.

/P

