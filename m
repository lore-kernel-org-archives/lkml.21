Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795737378;
	b=jOrGgiU6eYRAJAfVZnGu5zHoBWMTycEBe3qiM8cQDWgVIsuOdxHy1RI6jMtJkBZ6bYCg
	 aZ4ZZhD/uM09mZ0RAQjNHaJ43f6tWFOmCac0n+S/LN01rZhGlOgbXhF3Cbm6TU60AQLlC
	 Z4z9aC3y5KghnSBKjFUuDCEu+8SySw5ItlO3Y61LWIDKQKSmJv6WQJjl8+kBYlCWK+nSR
	 Uk2n4Tg8rbQvrlMd1BF6xOXNwNmBfnQwmqxUnbCAh6P/ZlfbTwWzau6s67dNhzcjkDqkm
	 UkkKzokDUFZRH8/Dxmvw1JPm2xTyy9A0YzrPh2QEm4LpQL8oO9Ir7P3vNtU2mOesoLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To;
	bh=LaUG1WyYJVQ7dlLvzt89P9Dst4rSbBmHbm3uXYe8MRQ=;
	b=AxmcO52lHWs9SW9cC57Au7K6WLWTdg5FCpXt0miOQgHYVTDraF2Q7Y7B52psMr58OeTE
	 ApBRsKllIEZtOEq/RHcOYIDy26KQ6ycqhxTL2G/EPFkaa4gJGp/NVVjquX+FD5dNVLR9L
	 02AndyqQzgohPmwMbanVHWqPTbxQR3jBafUNlhBvWuOWg5QnYCLSRS8ej/o5AM7MnSopP
	 W9YIgZkXvMmbevWCsw8hpnu3yAzoiwN+qlgTF9/5WPb9dsRSmBD0yDFpjyvg8l00iBQEX
	 eERyTp81jMkSDrMGpRd9D9fCTEuy9Egqhdv8Ck3f6l+hReivMNSarE4kAVNt+iTtDaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ikJhu+W6;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BE5606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91BE5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ikJhu+W6
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3ada81853so8705035c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795737377; x=1796342177; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LaUG1WyYJVQ7dlLvzt89P9Dst4rSbBmHbm3uXYe8MRQ=;
        b=ikJhu+W6juEwDhcC4tRupeakNXkzVbxGKgrdXD19Dy4SL2lQ17Ll6DeeDvZdYxOUzI
         +9VJIZ6Y0Mz5hi4u1RNa9gEiLZZGWOwDCcgkmfYyslEsD4A/9tjVbewqlSsT/5a8yWkN
         fjYcVYejRr8Shh5mw1hejUuI0AqxvmVhOcyjN0QldOZuyg0M2uGFGpgZy7v1xy/ldI3b
         CtfgNjN9maYwagLkdJTFVsA9fwYtKiQoSRWsiIYDG4bm94qmVdJc/6oDnYd0m8gl2G+n
         heR790DtFHFunGZt8xeHakgTdtNj/go68pACV0o/+LwIdqH0dg2XfAENrus/gbj97vd2
         r1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795737377; x=1796342177;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LaUG1WyYJVQ7dlLvzt89P9Dst4rSbBmHbm3uXYe8MRQ=;
        b=hsAvqnHugQ2C54S1kyDh0YBGuFDOl6Ro46K4A/WcCsL0xNx67joQq2mlnmBuYvq4uF
         xNU+l2lVSFN0cmMDoPJeV7gcX03DUpkf8rBwsE+6skYDN6CqHdYA2oV5BE7UNowWJQGX
         9Naw4yRdHASjXpbdllhgapBuTWzjhcy6Cprai0meOguSt/2M6iVkGx6PXD0O8tkkrN6k
         Zkaofhs8FsdsCqxNlwPRpHYL1kfy5agczUW7VY2k+XqdHco3HO1sT0qJCe3Ex2jHfiNV
         enKEeM2eX+HAsXhCOFGDuQ9/cef1UZ9g1lmkAy/rIrjj+yT7qd6iNzmers6E1RD9019V
         tefg==
X-Gm-Message-State: APuU4Z896JRNLpwH75lcuEtt4P5BoPhA2tzGw1zNBp3r3wrRQgGqR3KC
	T5hU6tzMKJo0j/lw5zXJJTKpqhEz6VfWCXJcgB952/ygzYDQBhpnymwa
X-Gm-Gg: AZFdTZeuXUw2KAJyb2Ll3Giox+GLrkPkX5LE6A+eDMDecW278Qa6rdlES9BN8PlF/er
	C8quc04BCLt5jRiKd8JfaKEPL2J/1K1HqaNa3dysis/92thOdS7hUHgNex+n4ha+eKK6XPYnCog
	i7k52E5w+UsKSVjm6yWZZyBtWT4+BuisRkr0EqM+iMLdBFjryX84zZhzZ3X6PgTmm0NGPfKQ8e+
	ygu/fsYNc4i0wiaM1hGT8/5R4JpM2KLpYqDrkoy5aQe/4lOHSz5NIndsgO+6LmHk6c6i+FFg6oo
	aUE/2SdQ5/Zrr22fL84qGrD7DSxhPhkL+eB4hB3Q0YLo1VSvezPabYWmVZQjJXJH7tIPVRDeBYf
	LkQOj2SyT9MZlQMgqRdP3tmVNFjnPVM4CDdIrCjOv/7Bf/YHbEloc8lyNx154P64U3ZPiUP/Els
	8L+WG9wcuQszVlUJKwXH5KomTI0d/yjPFYLwRIdXnKKKYhx160sM4wFhpxny6wQ/CJWyAY0h8vr
	6rYoxVj+iI6F11A9I+/cpqvxWkUouubwusMSSMIYKiioaUyrNBPiJbyFsx4b1vjhacTGdIMFEIu
	ccOgqxSCTfEdct3va5q+vMygW3w=
X-Received: by 2002:a05:701a:ccda:10b0:1b5:7477:ff7d with SMTP id a92af1059eb24-1b574780064mr13682312c88.15.1795737376560;
        Thu, 26 Nov 2026 15:56:16 -0800 (PST)
Received: from localhost ([2001:8004:6f80:e4a4:63f4:2ea2:b5db:9dfa])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm51067878c88.2.2026.11.26.15.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 15:56:16 -0800 (PST)
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
Date: Fri, 27 Nov 2026 07:56:04 +0800
Message-Id: <DN5JROQRBFHK.1T3SMLE6KKBVD@gmail.com>
Subject: Re: [PATCH v2] rust: dmi: add basic DMI matching abstraction
From: "Nick Dowsett" <nick42d@gmail.com>
To: <nick42d@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Jean Delvare" <jdelvare@suse.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261126-rust-dmi-v2-1-33064f0bb005@gmail.com>
In-Reply-To: <20261126-rust-dmi-v2-1-33064f0bb005@gmail.com>

Please ignore this - I missed the `#[inline]` annotation.
v3 will follow at a later stage with this corrected.

Nick
