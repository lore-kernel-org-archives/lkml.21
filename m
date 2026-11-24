Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558406;
	b=P70Zb6NRyoulNvihU14W5HvjpSGCfuinbUV17vwgyIl9vvai8iGo6a7eWZbluh4IUZoG
	 OhJ3VSId/h8oAHDE8YtIOAd6Qv0jtGmZGRSvq40WqRvbq97ULa9NqcczJLQ/6j8li26DY
	 3/dvMksDEyqmZ2UyHGWx7jzWfquKhD8YBftETB2tfNhO9Dy7hok3PaL8ASJQITnDuigcF
	 CM1Plug4wJZ+guw/Te0aqhFEWNUR7i0xloUlomBB1nDrlcXvE3HeDuIhZdhxZ6FrF8Kty
	 m7BtrxQwA9FZ4mTondCIbHSZQAUgE0WGMiwQjVYCPR19UAULF93lgTZIa562Xlcys5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0L7WJQgcx2P9Iy3RWSJdXtSMcIIiqi2RystV/kGBxpo=;
	b=vvM+Lmog83AS274z/mpimoGvgIwxVf4VodnmFhQxhw2Op//O8gj8FEEoe9sfQT4bm+hh
	 fmkvkiCpftGSFoEKXLdGCdg3QnjEqm7MVzISfMEf/MpED0f/dTELymXMPgfEmjlKAoa3S
	 Wu1xW9qwpCLP3XYt14jCaIW235cG0QvuyqtNguruQ/EEtfJGeXFWGCrOlaKwd7FOBNtWw
	 PJHuLHP4y0ZXT8bMQGbD2JYteNRN5qCW1aOGlWoC4gMMxZqUNDb6fl8TCiEe3q/DI5Tr4
	 MbNhgD5SXeqWKteLpKO0LsA+dJs+GksMTq68SDjsOWheHcAg6cJtMoUMqA10Ydne+2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDLc7hNT;
	arc=none smtp.remote-ip=74.125.224.129
Received: from mail-yx2-f1.google.com (mail-yx2-f1.google.com [74.125.224.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC3C606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC3C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDLc7hNT
Received: by mail-yx2-f1.google.com with SMTP id 00721157ae682-8b4c8f20fcbso5341557b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795558405; x=1796163205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0L7WJQgcx2P9Iy3RWSJdXtSMcIIiqi2RystV/kGBxpo=;
        b=IDLc7hNTu5+Ki/2urx0xGVwPx1ge6KES8tl67HhEyposIInM0NddOsieyTHhoBgRZw
         eUDh3pmJ5kPD9Lm7UFichaB1jeC2oGKsbtCdp4VeabJCFDYUydsl8PM0qIQs1t7dIB5z
         05o0lKtNRFIiNhsZe6HeyHpR26szeysImpDo+yB9d+RxbNfuKleNZZ0jOeJvBYUWV1KX
         VGRLmjh2PDD8SLm4vwpsjUEwPsEPmHKdN7xZDwD7E9RsWTeLgGX5X8ENm7drAFPd0S9e
         mlV5S4svAzhoMWD9ItfNanRRJv2FMGccMK/KBjFaX71pAqPozA9w7gbkV7O9Fcs1UC0P
         7/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795558405; x=1796163205;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0L7WJQgcx2P9Iy3RWSJdXtSMcIIiqi2RystV/kGBxpo=;
        b=i+TOfLVnNkE1vXGVb1onlddNSh1XI+clCjTPQRIXv8cKb7FctA0QPEtBgKyX+pHYay
         2WtU6pnv82dcm9RMMuQiPJtGCmeFrSL5eGFwfDBEjIIG/ea2gO4iwfZNmOAAwo/ja+MW
         8tGP//S2d+tR/s9zcFbbk1WL3rwo69xU/wbqVDV3ev8hn4K/7MSdn40ExZBDIYuo9BKq
         5WewzLsoY3YtMvXs3VYzeMohAeUS/zFkzSzqLuCLt8x6fYMvr0kBWHiaJW/5gGPbmeQ4
         AJr7Q6wL5++W9/bEeie/P0ACIx5OuudHJ5eE+iPunTI3BgKRNiXvIxSdESPRHApTlyKr
         5Stw==
X-Forwarded-Encrypted: i=1; AL+hErHCA6vYo0ykcZI/6AMDCpdGihPuPnGUydwC4hJcyvl/oMixVfJjhg4hF4PuHzBvCtkSgOq7xVwfCDptZQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YeX62C5yL9b1i7XIicnWmyMjsy1otWKbTVsWAx2Z3KPr78MEM
	8mluK2m0brw4oU7cPNqELhQA8OuYNE6Mp4xZgk8CtlrpctoEFJXMIskX
X-Gm-Gg: AZFdTZd51AMkeAMtaddAcFvf7JBW4N8zcZmx0VmjI4eMi9q5vVJkL2ZrPnmSFAqvTPh
	LPaSJ6heJULQlIDTubAs/0rvbNga6edJuYM1u0yAo8Ib/o0enKnJriPgs/iafH/400L8jhV5jm5
	vRPYDi23c2yxLdjLFKF4HM6v5Ulv+WEqUDIpbEbsWQr1813zWczz6mzvn+pL/rUa7k8W4Ug4iqx
	04g/KPtUGYu6iO7jWToEManASWsWgVeSnJxEwh2G0IsLoCIXZqaKueJDGhpA2AEETxMj51vC0yS
	u5kHdDPh94Cl778fMdROvdNdQGfhmcmkdFFYWq/KNKmRmia04Fwwm/51319vX7+8cl2+7P2fpH1
	/h1QD6gwGhAZYW0p7MmMofI8uzKdACMyl6L5tN6auZro2cJVLz+tfGYNvLjF2IxhdXec6i0hLXM
	KmNjxD1p84lPQLh8sSH9TMTdWcSwsqvq6cTUaBSDntzW31SlbajqVQ2MOglanb1PDQc3Or6zCoN
	BXsKbY/rEsLBXoleoiG2GRpW3jnFYTEW0nldJlIIGWkgsffn7bVe2G2fhQKQqWbwqWVRZ5nQOOQ
	gBTVeaDHoLUD5jkadTnJjNL6v3OmGnHtWRcK
X-Received: by 2002:a05:690c:4b8f:b0:8b0:e10d:1975 with SMTP id 00721157ae682-8b520435695mr52461807b3.29.1795558405356;
        Tue, 24 Nov 2026 14:13:25 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028d89csm65560977b3.15.2026.11.24.14.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 14:13:24 -0800 (PST)
Message-ID: <c2163003-948c-49fa-815e-b1f91814a80a@gmail.com>
Date: Tue, 24 Nov 2026 17:13:24 -0500
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
Subject: Re: [PATCH v6 0/9] nvme-auth: switch to use the kernel keyring
To: Eric Biggers <ebiggers@kernel.org>
Cc: Hannes Reinecke <hare@suse.de>, Hannes Reinecke <hare@kernel.org>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org
References: <20261123-dhchap-keyring-v4-v6-0-5082a49715ab@kernel.org>
 <20261123212105.GA18468@google.com>
 <692e91cc-e2ea-47cc-926f-6639952fb195@suse.de>
 <20261124201152.GA2227373@google.com>
 <851e3fa5-ad88-4470-877f-e977bb1a6ad9@gmail.com>
 <20261124213222.GD2227373@google.com>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <20261124213222.GD2227373@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/24/26 16:32, Eric Biggers wrote:
> Even if you actually need runtime key rotation without touching
> configfs/sysfs (why, when nvme-keysd could just write those files
> itself?), this series doesn't actually implement that.

Correct, v6 does not implement it. That is what I am asking for.

Writing sysfs from nvme-keysd would give two mechanisms for the same
key: the keyring for the connect, and sysfs for every change after
that. One mechanism is enough.

It would also make nvme-keysd controller-aware. Today nvme-keysd adds
a key to the keyring and does not know which controllers use it. This
is by design. To write sysfs, it would have to track every controller
and know which key each one uses, also for controllers created later.

A lookup by description at each authentication avoids this. It is
also how NVMe/TCP TLS PSKs already work.

With a lookup at each authentication, the sysfs and configfs
attributes no longer need to carry secrets. For a key from the
keyring, they can hold the key description: a read returns it, and a
write sets the description used at the next authentication. The
secret then stays in the keyring, and changing it needs no write to
sysfs. Raw secrets given on connect keep the current behavior.

Martin

