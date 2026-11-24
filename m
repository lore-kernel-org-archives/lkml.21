Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480228;
	b=llWjRM0mR5gy3bdmmSXpRAryWkYTJAygv+oUh8AcRf8/+PUuOTAE4L9lL55zYt299LXR
	 UOJpx25FM1n9sGeq0BUVWXhVNIWHwQd1nzyfFBkVsH052+3//IHttf8T+F+3yB/+N7VCQ
	 sAPAsk/TNZSRstP4xRakfhtsp+qHNKcU81wGKWaJ7RiArsP6ZSddiYZ9vF3AfEZ3VVxPw
	 eT/fQ5OXZFexjpiR6KQYVbBSFa0kMTLbZ4D0ZAeG53dPiR5h7kNypn+dU82RkTxcFVlcJ
	 IxTouWk/KDpOygiKdDC/g9hwnaGF6RvJZp5PZAF+pczw4W7SPqUCo/7jzNjvR3E8IZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=MzipZ8odBG4jdrhH2ZJejfMmjUk7sUkd+9+WpxV2B+M=;
	b=jB60iG7ND0Vxt6OGAIo6Vm0RjWRQdefRg/zSWbOhrjwci19dMq+bAcR7BhnlFgVA929G
	 GrsEW31TYNbd7644WpnN1E+loOVS6PaFs9UzRZIQRdtritApTzKWDTHxyjLrmkx7voOCw
	 xF71334v2C4hRiNsKcy/bsJ+BhQ2GjqAI8mIEn/X0w4JXdDNEqcILyOECUlIkBjNBRjdV
	 gS/ib9k8mNbr8zi6cpG66SXE+ApDxMs3smhLn4gVQcaSvuOvK7M2x4Jv4oV8QpAouhzm3
	 ebIHuNoY4d4/rw/GC5KfVl8nCrhHk+t0nrYsopI85b+pBg8y/880AYsnqXCJaJiO0+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nHmCKCeW;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEAD606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DEAD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nHmCKCeW
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3866a784546so5053462eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795480227; x=1796085027; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MzipZ8odBG4jdrhH2ZJejfMmjUk7sUkd+9+WpxV2B+M=;
        b=nHmCKCeWqvmzQA2LdmWMoIutUf95eOE0JytLF45VaLqPVqSomrbHwXD6J/kqx0k2uO
         UgxUClZJQD8n6VvySSnKAgpfQd5y7WBOH9ubnOzp7ZdY4iDmCwvXf6Wj1kFOgQG2oGRn
         4rga4sIj+PdC9twy0WyYf7KxaXnZZUx9Tm5bShwj2C4R4ic2lT/xb5yR62tKvCW9ylQq
         f7kgT/uZu1AK6Tru5Q1lLKWIrwfGKpVv5istLs+vETD3vIcpC/FB68TLNuM9STZfSUHF
         7Ts5YIEHK4fwP1khdsGNR4ThInjEPOkYWOh56LJdZAXRZ2WeZ2cuo0BmH/BqL76J5Ldn
         kIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480227; x=1796085027;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MzipZ8odBG4jdrhH2ZJejfMmjUk7sUkd+9+WpxV2B+M=;
        b=f19efFxKNn/wUB/DsV6mz+P1cndyx5zE/HvFV9BcPpd+ORpmnoEjUooGeATrpawKsi
         mUlmcvbLv0oz8f2e8C1AJEyJ49uCvzeHsEVERUk6AyYkfvrt+/A72aQ5pFwvULci+qFz
         XAasCeaeovHZJPXvwjkckzKSI8hyAJK17+n2jQKlPxTbJJ2ocOygRRCW2wlyZP6+EN2q
         s8Br7yZD7H3zD2Y9/v61N9Wg1aSIjXxHNjpe5+vLxvVGbqdBuPDEl/Z5ZkS+CdphEEf+
         oW86vdXJXDeGR3IL0wHMzUEQIZEW7cEqwYfSW1MCLAVgpyulRCmTB/9aLueUTiPNi2+r
         E5Vg==
X-Forwarded-Encrypted: i=1; AL+hErGdS91WDUJ8qjm4lwurBVDv4DSaK5jbfdyE3XTCa3O3/giyJ8kPq1TJ1PDlNO3On+sZ+R9WcRYTCoL1/3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8koKUtGueRL4nD4yin3CDauYnOfRacBAZ6blS/jLcFxlmeXBR0
	V4w3Mi1pM0yzHCmg2aUHAcUcedvESNg/H++FoGp55DA4g4S28G9qy9E6
X-Gm-Gg: AZFdTZc3rPZV6PxGqZz+9tOskYxW82+hMQ2g3oKSHt9d1QZnPNXqVnjZQp98zAuqA4U
	XegsGqbV2U9IhiepjdnYbDKC8tIVv0948FYELjUR39vGHLO5HS+1E5LmLjtvkDWHUB4ymxWzUs1
	g2XwFkZxhyB5rs/sRxIT5MEYfz0Wi5P49WUMGTMrwDJUWvFqZo7fQUXLJBfHeY4PuVQqRrJZRau
	LcK2r3fzvhRsxKejZRbjS5faRZgbp3b/7/LsBimkl/01YbLoEco2lOY9aQYwR/gmx0dfePsrPAx
	UuH9hok5jqOFQq85zGdFGSg1LB6pTLceCSIR8Qzn2ngR3h6vRnfgAS/RC+SV7UYi9dSP27LSf3y
	cAhMV4vXD5exX24kRKQBT/dGsyUmPE48oq/30cFBt8c+fO56iSI20HPjgHj4XICD7Fvm0mVt4Ol
	YLPE+gnRtYCi7k1Ma9rUar+iKVcCsqa7zktEmj8miLhcPLUJ8CQV1ukYMjiYs/ES+Z5kP2oE+rC
	Ylm1TrAoL/w8fjb09TTCR4GMA/IPXO2Kn0Ap3/cPZHgPkI2Lx5RXXRg4JFOJ8ikps+LkxZ86Eth
	ElWCLUpo5Rbq3akK5LYYJl+kBRo=
X-Received: by 2002:a05:7300:1486:b0:383:6eb6:5730 with SMTP id 5a478bee46e88-38570e24c0fmr16179852eec.32.1795480226923;
        Mon, 23 Nov 2026 16:30:26 -0800 (PST)
Received: from localhost ([2001:8004:6c10:7f51:567e:69bc:1f6e:349a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm49453974eec.5.2026.11.23.16.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 16:30:26 -0800 (PST)
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
Date: Tue, 24 Nov 2026 08:30:13 +0800
Message-Id: <DN30M72ZZA9J.3VPYTARKK218H@gmail.com>
Subject: Re: [PATCH 0/4] platform/x86: clevo-laptop: add initial Rust driver
 for keyboard backlight
From: "Nick Dowsett" <nick42d@gmail.com>
To: "Werner Sembach" <wse@tuxedocomputers.com>, <nick42d@gmail.com>, "Hans
 de Goede" <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
Cc: "Armin Wolf" <W_Armin@gmx.de>, <linux-kernel@vger.kernel.org>,
 <platform-driver-x86@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261122-clevo-laptop-v1-0-881debf4d4b0@gmail.com>
 <a07938a4-32e8-4aa5-984c-d17df8054df1@tuxedocomputers.com>
In-Reply-To: <a07938a4-32e8-4aa5-984c-d17df8054df1@tuxedocomputers.com>

Hi Werner,

Thanks for the reply. I guess for some context for those that aren't
aware, Werner/TUXEDO maintain an out-of-tree driver (`tuxedo-drivers`)
that includes support for TUXEDO-branded Clevo drivers. This driver
was influenced by their work, and I reached out to Werner briefly by
email before submitting this series to the mailing list.

On Mon Nov 23, 2026 at 9:58 PM AWST, Werner Sembach wrote:
> Hi,
>
> First: I never have touched rust code, but I'm not opposed to it in princ=
iple.=20
> Just to excuse a little bit of knowledge gap.
>
> Am 22.11.26 um 05:35 schrieb Nick Dowsett via B4 Relay:
>> This series adds a new Rust platform driver MVP (`clevo-laptop`) for
>> Clevo barebones and rebranded laptops (Metabox, Tuxedo, Sager, XMG,
>> etc.), starting with 5-step white keyboard backlight control.
>
> The driver will have to interact at least with these subsystems when fini=
shed=20
> (If I haven't forgotten any):
>
> - Platform/ACPI
> - WMI
> - Power Supply/Battery
> - LEDs
> - Input
> - HWMon
>
> And maybe:
>
> - Thermal
> - HID
> - Component
>
> I don't know how much this influences the feasibility of doing it in rust=
.

I understand this is referring to the feasibility of rewriting the
entire `tuxedo-drivers` package in Rust. Perhaps someone more experienced
on the RFL front could jump in here in terms of the feasibility of
writing the mentioned bindings (from what I can see, workable patches
exist already for LEDs and WMI), but I'll give my perspective:
 - This is a beneficial effort regardless of full compatibility for
   now; even this MVP solves a real problem for users with this specific
   non-TUXEDO branded, Clevo laptop.
 - Some modularity between C and Rust may still be able to exist, for
   example, perhaps the existing HID keyboard backlight drivers may be
   better to remain in C.
 - In terms of feasibilty, whilst some waiting for bindings to reach
   full parity with `tuxedo-drivers` may be required, this is still
   more feasible for myself than writing and maintaining significant
   amounts of C.

>> It is intended as the first in-tree user of the Rust WMI abstractions,
>> and a starting point to be extended to additional Clevo models and EC
>> features.
>>
>> What's included:
>> - Minimal driver skeleton, Kconfig/Makefile plumbing, and MAINTAINERS
>>    entry.
>> - Type-safe EC WMI query interface.
>> - Driver registration and backlight type detection following
>>    tuxedo-drivers business rules.
>
> Just wanna make sure what you are referring to here exactly?

Specifically, I am referring to the logic used for board capability
detection; ie how to determine if a device supports fixed colour vs.
RGB backlight etc. TUXEDO has already done a significant volume of work
here.

Any questions or concerns please shout out.

Cheers Nick
