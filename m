Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706187;
	b=U0/I5vRgatiTAZikLzhnMIRdysqnUSu3uo1qEM9LwxPAeAZERII3BKWS6uSzKkfnXkp/
	 vHIqMcRNNjq026+jArCl8bLbplf/eJfqDVSIsYnzWOA/O7G9Iu9jo5TYbOWQGIcz0c8Xu
	 P7OZX2MvXKiQkCDEAHl8cNWwlm7zebLUbyyBPKuEqyx7aFm+8ky8BIiXPAGovBVy63rIx
	 GZAUd97pP4IBS61Z9KMByMaKjbk8M3MBY56qdnqXbuqSM2/2pIUZaPCdeQiv2b9q8ojIA
	 NqBLkzG4ZxIGesuaI9QVXuDp5iLItqDna4BhEaHJGMyAgz+SNxW0JA39vHS1MOgpqHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=73RhbSCzzEXErQpCoUjkNFQF+UmJqC718yIoC62o/2I=;
	b=lnDbN9F4HAJO8gQLsdgNPqonLxLm3o1h4zq+JbsmTieN6GR+auu5MopH6bg4DzKYjvLq
	 EGyguSglb9g6cHgjuiZlTXKlLuBwjLN2A9ql5g6Pt3RmSzmKvM4uSvecXNZ+90UVtpPYh
	 iMAVYecz6Vxk8vCK/8NieNntYE/AX4n6DU0MoK4aPlTp7UidP4/YugaB6JA2+ba4VsbwY
	 CZ8J1JfBoQNvy254N7rGGtCrE5wwAciHD8y7sFDsVjPOVkx4N+wwBROOnMuZhg5jVXES9
	 JbsYvSRtV8CD+Ihn2wyLN+i8INvlD9bT9ZS/JJRwTk5jvfBjrct4YORS9WSg/tycDjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0bF0rIll;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE0E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE0E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0bF0rIll
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-99e09f4c44bso1346134241.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706186; x=1796310986; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=73RhbSCzzEXErQpCoUjkNFQF+UmJqC718yIoC62o/2I=;
        b=0bF0rIllZMds9r3Rg/X9Bi+iVHdHNqm+S1vsVtFnT5IDmowjopX6s5Jm6OZvmfydcf
         w5lvVkXo+toCwdm7KFyah1q0wvuXDdthl4mtV1SMGemFDmdUaV9OtHEJzjgNc31QkRUQ
         QP2gJ5cVLG7u5Nv8uQCm8VC/oH67MbE9JLud1EqvFxMpaMMjQ7Q8lA5/TkHO5H85HMem
         3q2/EbLhzaNpqlvkN9/vPueWbZyrRHUPorRN9t/t5ttzUwBv44QccQe1Tm1w4LMh/dh1
         7dTGRzrwRiAAyCCCvPvRbgc+3gzRd+mc53T0xG7X1PAECRZEYWDSMxWBOeh2Mgr2Oe/b
         PZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706186; x=1796310986;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73RhbSCzzEXErQpCoUjkNFQF+UmJqC718yIoC62o/2I=;
        b=WqmzgO6lVVggYwKwS/tJSQ3PplF9owWUueeHbwHExNWFYNgPLhfMfelfTsTFHFpwkU
         ODCKzgCqCxramHRBSUMl5CA6OldBH5Ni2TzmUhCq7S0xQXlApYu63xsYP+xeqQ3QN61/
         a3c3Owax9DjoApLpxDPCGlZmBnPlAEnxXlIkUfbQ8L4bW8Rc5u8WVUCa1LCNN99/EQRQ
         wCQODztumUsPOI32cPlVKorZ5Wu7R3F2QIYqeSQ85YFpseOGTouZ/UBE59TooHvswjjj
         /xPLgSX2WypHn/rvew+KCIXO6B1gsc+QOUH2sGvKF49WxHEirdWmF8sQK2wvX/L75Nqx
         SzgA==
X-Forwarded-Encrypted: i=1; AL+hErEM3DwE1a4wQ49BsggTWJCulScpyllwFLDeIR7vEtWIQ5N71yuf93pFn9xL+Zu+p3vkR11TYCaCgo3a13w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b7k6AlExSGPBAQiJWewTlaf2umXjZDz3eryORsAt5svSBLGkA
	j1cKsBRxqQCF7FrmeQ8ZxZmB0Gk/57df5dvzyX6mn+ukSdipMJIsaug=
X-Gm-Gg: AZFdTZcrWvhYxOIG+NLqJO0/tsyVMNlbEbvA6JuxefMfiYVzzFIqtwbXZIy9oS53hPY
	UIhyGfBKa2j5WHcs5SDMXK0ay2pnbJj4a4IXD4y71oZ5EtzL2wgkt6T40BTid2MmxeQKKnpRhYA
	Ui1WE3qM9c4xMUTC12LaksBMFJuDPqYX1JEwMJscBZmPC22jHneJW5QxGnoZajCwO+9nnO1UE8v
	pInTABc1e7uz9+LXQAwCLB8xGMgSg5hsNCutUj8uHbFwFZsO7UDl6qw+DOgN6BiT2SGZyoPz1uH
	qDFqS3IupweJTbTF5yM6v7IuU/BhKas0ssD/+EvwBI5adHq/k8FQ4LH9wXuq8quNx5Qn7SCVaUq
	Eot/LQNvpKcaZhrkvie8iEyhfCDEucH7031FPCsKY7ig2intYM9SSk5n0fHTV7SxSZh3wmzHhJo
	9lbCUe8ipf3gSsmsrnnpePgrCRuz+/sBkZJFrXHfqFVKMCgaQo90yJeL5uf0ExbjUHmeCT8KpvH
	Ccea4fWQJHeHw6DiDnwOM85SbqgcxRA5Ryx63KQL+dOhNx6YIvrUed6/30dO/BSqJRK4cuyOxhA
	Z9vjS4lKR1akqXI2oX1qq1NE+YuCrTNtHE37FkKesuUddOa4M7eskVdlkTtFTw8qIw==
X-Received: by 2002:a05:6122:8c8c:b0:5ec:e6b8:ebad with SMTP id 71dfb90a1353d-5ee8af4a759mr12322188e0c.10.1795706186471;
        Thu, 26 Nov 2026 07:16:26 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee91a4e0cfsm19662910e0c.13.2026.11.26.07.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:16:26 -0800 (PST)
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
Date: Thu, 26 Nov 2026 12:16:18 -0300
Message-Id: <DN58PQ0UNTCV.2C8E5QAXJ53I7@gmail.com>
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Burak Emir"
 <burak.emir@gmail.com>, "Rae Moar" <raemoar63@gmail.com>, "Tamir
 Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Yury
 Norov" <yury.norov@gmail.com>, <kunit-dev@googlegroups.com>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] rust: kunit: add #[should_panic] support
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "David Gow" <david@davidgow.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Benno Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.20.0
References: <20261113-rust_kunit_v6_send-v3-0-0d7832c07166@gmail.com>
 <20261113-rust_kunit_v6_send-v3-1-0d7832c07166@gmail.com>
 <0e68f60e-e9e0-4443-8189-72180ff07a14@davidgow.net>
In-Reply-To: <0e68f60e-e9e0-4443-8189-72180ff07a14@davidgow.net>

On Mon Nov 23, 2026 at 10:36 AM -03, David Gow wrote:
> Le 14/11/2026 =C3=A0 02:20, 'Nicol=C3=A1s Antinori via B4 Relay' via KUni=
t=20
> Development a =C3=A9crit=C2=A0:
>> From: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>>=20
>> KUnit tests in Rust are written using user-space like syntax. This patch
>> adds support for the `#[should_panic]` attribute, enabling the user to
>> test conditions that are expected to cause a panic and report the test
>> as successful.
>>=20
>> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>> ---
>
> Okay -- this looks good to go to me. Thanks very much for all of your=20
> effort!

Thank you for the reviews and explanations! I'll be sending the
implementation for `#[should_panic =3D "message"]` once this lands.

There's a sashiko observation [1] but I dismissed it because before this
patch `KUNIT_ASSERT_NOT_ERR_OR_NULL` already aborted before setting
`priv` and executing `kunit_init_test` and `kunit_resource_test_exit`
performed the frees without any check. I assume that this is acceptable
in this context, but let me know otherwise!=20

> I'm not 100% happy with how pushing the attributes into struct kunit has=
=20
> balooned into all of the different kunit_init_test() call, but I think=20
> all of the other options are either worse, or involve even more invasive=
=20
> refactoring. (That being said, I do think this might be the thing which=
=20
> finally makes me look into refactoring how we handle the struct kunit /=
=20
> struct kunit_case dichotomy better... :-))

Yes, this was tricky! The alternative I thought was setting attrs
directly when declaring `struct kunit ...` (right before the two calls
of `kunit_init_test` in `test.c`) but I was not sure if it was the right
place (we would have avoided passing the attrs in all the calls if I am
not mistaken though).

Regards,
Nicol=C3=A1s=20

[1] https://sashiko.dev/#/patchset/20261113-rust_kunit_v6_send-v3-0-0d7832c=
07166@gmail.com?part=3D1
