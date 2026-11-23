Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393887;
	b=dVPao1v675vln/n366flvys6zNBZpFA7vieOEQ2PXG39rFugN1qnQZhZcQDKzTGVDa+F
	 j374LnGzD3/NVNriTj725IoqyQKaengLl5KZ9dKaITBAfxjCdPW9Kgtly/BlTeDZmMskA
	 Mhvas+iYOKIUbvKr8YEchtqjbqThoKIgzvgQwu8fGe5Q8iMlinCSNVGDJYiqlU8+Ycw6Y
	 yhjYgbd6xRDA/mRmvS15iRZYBJphe4oIcWiBBaTEYvhFxxpJ4+u9xFawbCXAg8VbJIraA
	 5iyOKJrsCANNyVhk2t+oH2S5kubuKahkd0x1/20AVndn5UoGUu/yLMyuRX7ySNfNOeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=e39tlZHzmx/bxiI/iUdemmQRs6p1buIjK2wE6pNqiSc=;
	b=YtNBRnvkxfSg0RN/mtV6kUg9qQCE5WfAG6hUWNmXVLu5OXSSx3M89p+zFko1Su7sDX16
	 iw6rNmR7njRX1TfLSrISNeqvVKtf1txPGWAQ8gEwC2Vpj9TrZT+JR1rdRxf9FqbBnaiH8
	 SlKZpXEATQ36c2GS/JPCh9vitjAZanrPjIFuQmhZcmSNecr+9x1/780BWkDm+OF40H+io
	 TlCdg08OBcbZquVqTos3ck0SzaobZD23stIjeBPa/O/1fcdoJtZHs0y1TXwamq89gtMPU
	 2aGwFyNAK6jfZ690707mY+T9DN5oDo//NKeaS2Hc3r42qtsEjDDYqOtPZkWjAo5O+xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bHZ4/Ixb";
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0092606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0092606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bHZ4/Ixb
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a05b210703so1186796b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795393886; x=1795998686; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e39tlZHzmx/bxiI/iUdemmQRs6p1buIjK2wE6pNqiSc=;
        b=bHZ4/IxbDhS68IOlYgZmMgFojKTMzxAN8Oafo5xjlPz5S1nfgxrvHkr938IUhthyZt
         zvjUMkv+vv++wjf7Fn0Kd7iVR957Rdtq5neZ82Zo2iHSq8ACz3OslATAZYrtXfhh4KFy
         AQt32KGkxGQGnE76bebO/p3NkGo73QgFvzQF0vtWQyEU/prsbsVQP3r6UlsqTsxwvkZ1
         9T30r6168y/Zjs4+UYUav4wUV+ZnmCeS5KEdppOtUqw5bweII93U3fh0jbvHLvRcVYIZ
         vEeklZr1LyEl58BElyaobwMHawaDFsRBC3HN+f0UZ7HMz0lgysdmpdZvQt8K+onNOnUP
         IDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795393886; x=1795998686;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e39tlZHzmx/bxiI/iUdemmQRs6p1buIjK2wE6pNqiSc=;
        b=Ldam7xyUaPZCknd7BMkZKOKGoH39cyXytn1OFidNMuD9N7kIyND9YPoFxnzKR/XrV/
         5iJPvALy+SYUEif3biMKEyznDsqZK6CJb2eA/GNF+nQNJVx3lEhEb1T4XHds+Ev9LV+i
         HbOIyJhoo2jHNTwY4CfKEf4DZcTXd/CH92rxhyExohJ0tg586ptQlFKjgLuy+SR7aeTX
         HDR80qqdyeKBZrn9MbdN9ggSSdvYTybaWrG+G6MY5LLWLqXpEYfWRdTScVpPF7X8f5Qv
         h9DQaZ9FRdRCbilULXN/RYe9x/yMOHgRMmkWWFxuox8SiK3Vp++EOPpv8PQB4uqVsXhD
         Xw7g==
X-Forwarded-Encrypted: i=1; AL+hErFz1b3xsc3Ik8Z7k2WY0au9WTlwX+OIowB+fgzADw/g6Hk6c0uFuS7tEefOGIgbP47wNCyCjdO6lJowvFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tFyUV9J5I+HN05JfNe0exSRYGMTEgUZfGHCVTXjNQKa3nQofH
	U5LERKdyuWRdzdOStctEtYcZcwDzbjUrYhrYv8wxG2xYcNPzbpFwlPIn
X-Gm-Gg: AZFdTZdvRkeGWlaHHk8uPfIkgp8TYoc1nXuo2ECYBoO+2BWYiehywdYVtU+41iINFee
	ybGyejHN6B++qwMaPz4iGhVF7VRa4MkZHlEFISPaKg+CaU8irhpskuTsIFd1IX798OzFcpl3kZ4
	JK+zjkKYcFcFcsug0PEgbjqQJnYhZVSDGYdF10KHdgz7UG76TM4f44q07eRZQxZq3I3iHZGGvux
	PfC8j3CM5aU2i3uVC9CVLO7juN+5ymrbn4cfeYYLfMnn8AnF+GbjXMfp2/3TUTIKWYsoqHtiLs0
	M/siccbvxjpQayolHloV5F/EqOgp2k4ULSiZ4ujHp3+Kx2RZfCfjXwQWD3Rj9mKzUODC72a+tNS
	zUjzZXIWz7SvOIdSjd3lOiz/ucjMkqxNmxhF8XGZI+5l1zoDGubzegAO5Zak2Yof8cxnUNRExSn
	DfJz3cgareNAOVeoh9TUnq4hCOlGao/aNykIez0nVJjTmO/9xrCqsJQ+i9d54FOwaQaNU/gejg/
	SrvIcaCl6781Vj5JFMtb+hKM6ffssnKzUcKmTSPRwinyhEG/Ow75ma2bOzPadW5O0xxKrmmZ1jv
	pKsdKxp0weQrux51nUyqoPuavq7/qnCYgV4zbgz7+DSRApQ=
X-Received: by 2002:a05:6a00:b43:b0:878:38af:1970 with SMTP id d2e1a72fcca58-8c87dce532cmr8545457b3a.60.1795393886071;
        Sun, 22 Nov 2026 16:31:26 -0800 (PST)
Received: from localhost ([2001:8004:6b00:7582:da58:72e4:4f6:67f3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm4589844b3a.7.2026.11.22.16.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 16:31:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 08:31:11 +0800
Message-Id: <DN260E1QVCJA.2PKN1JODEAOB0@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Jean Delvare"
 <jdelvare@suse.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: dmi: add basic DMI matching abstraction
From: "Nick Dowsett" <nick42d@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, <nick42d@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261122-rust-dmi-v1-1-4ace9449f872@gmail.com>
 <CANiq72mFCq01A_=B0gyaut1rPWeECOdDwP6pD3FBv7n4oH6TWg@mail.gmail.com>
In-Reply-To: <CANiq72mFCq01A_=B0gyaut1rPWeECOdDwP6pD3FBv7n4oH6TWg@mail.gmail.com>

Hi Miguel,

Thanks very much for taking a look!

On Sun Nov 22, 2026 at 6:37 PM AWST, Miguel Ojeda wrote:
> On Sun, Nov 22, 2026 at 5:28=E2=80=AFAM Nick Dowsett via B4 Relay
> <devnull+nick42d.gmail.com@kernel.org> wrote:
>>
>> `dmi::get_system_info` is currently marked safe under the assumption tha=
t
>> Rust code is always called after DMI is initialised. Would be keen to
>> have this validated. Alternatively I think a minimal patch to C could
>> actually make this safe earlier if required.
>
> Please avoid soundness holes unless there is really no other way out
> and/or it would be very, very onerous to do. The bar is really high
> here, i.e. if this is just an `unsafe` function, then please simply
> mark it as such, which in turns allows us to document why and to force
> others to ensure it is correct when calling it etc.
>
> Of course, if there is a way to make it safe (whether with a change on
> the C side or with API design on the Rust side etc.), then that is
> even better.

Sounds good from my side. I think initially it's OK to mark this unsafe
- the precondition will be easy to satisfy for the callers. Seperately
I can then investigate a C patch (I think using atomics for
dmi_available).

>> +/// # use kernel::dmi::{self, Field};
>
> Vertical formatting.

Just checking here - is this still applicable for doctests? I copied
some of the example from another subsystem. There could be some
conciseness benefits from not doing this here?

>> +pub fn get_system_info(field: Field) -> Option<&'static CStr> {
>> +    // NOTE: This can be upgraded to cfg-select post Rust 1.95.
>
> `cfg_select!`
>
> Though I am not convinced we want this sort of comment -- it is true
> that we have similar comments for explicit workarounds we want to
> remove later on, but in a case like this it is the "standard" way of
> writing the code at least at the moment, rather than an actual
> workaround. And we can always grep/LLM for these improvements when we
> bump the minimum version.
>
>> +        if ptr.is_null() {
>> +            return None;
>> +        }
>
> Newline after this?
>
>> +        // SAFETY: If non-null, `dmi_get_system_info` returns a C strin=
g that
>> +        // lives for the life of the kernel.
>
> I would word sentences like this stating what is known to be true and
> why (since that adds information), rather than conditionally (since
> that "repeats" the contract of the callee), e.g.

All ok with me, I shall address in v2 within the next couple of days.

Cheers,
Nick
