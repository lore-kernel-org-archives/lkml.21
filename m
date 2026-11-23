Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795472755;
	b=JYa0p49qG/uKEDHB7sxhblr0X+rA0Zhjcn3AuCkMddgbnyuj29QhGVNJYwY7rp2KuKEg
	 feqz4Db3k8Zr4c1SHCfWHzN8Isoepo811nvU7hQ5ysg1pqtddyrCE1ce7Nq5tCORLDJC6
	 mFjvH39By1WxGJQKNedEC7Hc9iIS613CV9R+JyMLtUZSfm1cX1ZgmTIl5e5hI/wD++QDi
	 6SWg/emR+zKCV6AaudUUiHsU6RztK+tOX0gwsb3XMHSowUEJwljMYT+D6IrppJmo+Gs4s
	 FdZJ25JGBhrgY6GSAKnhf3qF6lIoPYPOjHxjUmCKLAllUj5xuz8jI/be+wxsjooJDwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795472755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=BtXPIF6zuxugnpKlB3s97+d2G4wbStRwqKqhiNp2vrQ=;
	b=jFjFihVMHSYuoOzBJZvfwLQUNxqNsdzRex/dQa4gmLcfQVRm1fUFiFzbNeiAR1QecdES
	 rOmBvfIECspno4UMi9T2ntpdL1pR/PUP2AZsBeOoYpK2KMJj57Qim/q4ykpUc+R3ul/LU
	 sPW4qsloPM4cOuJP+eiZyWEMJXPF5Q3o45ACRgiI70LXOHHnylnJnQN8K0wAZJ9A0e6fn
	 AYwpwQFgTVncqJ9YGB9wy6u00SayH6c/CbKm2xiGyPCeQoDABH7VNuh3zUR3pc+wZN0yW
	 ryZINS4iRYad9IwoKkc/yjRU2AhTp/04/+OKLWsZKBwjS9NPw70hGN8aTUYYMC8p6vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=e98dMe6g;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647FE606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 647FE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=e98dMe6g
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b502b9b702so44011737b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1795472754; x=1796077554; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtXPIF6zuxugnpKlB3s97+d2G4wbStRwqKqhiNp2vrQ=;
        b=e98dMe6gm2exhvdBQLkJgkWZLGoa89wM77dlMbQUqONXFgVk7P2OD4YwpM6qTPfqe2
         zWCMRjEShMVSyo+E7j8bLlZped9v/lmATgSh4sWfVtBiOxXLkUeVZJK2nwaNy93JlLwF
         4ifnmQfxdlbIui2CDquCFO4ZrctkHCq8oL3dYFNfe5HM7qs7Wx9ywANBnY7cj33+1JF9
         WFKMDQy2Z8xzz6C1u4sijqGj/tgMNMHMDHLPvFLJnpJNemYbwp7qOIsWuzsgcsNAeK3V
         KrZINq+g4/HcPCctpz9u7sg/yYZ6mUJDp7mjzyVuL/amBmRb9/ugWY19J1ZxToVih5TM
         Xycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795472754; x=1796077554;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BtXPIF6zuxugnpKlB3s97+d2G4wbStRwqKqhiNp2vrQ=;
        b=VshqvW2bJETWePWjN9fzhClHZflPNEw02Hf4gYQJINZQKLTv3+DbCP2njrHOZXo7jd
         sNKbqkQzOAsbv75cFCEC3LMd0dzbtwCRWFxO8k3muaLAiTxMq0LwcwTsBrXupr/IrpNQ
         EoGHWW788fquVkRsDKklathNhTVV8vqi9ewAaCvJVPHXKxPU9NHraDYeup0pdjOTU2b6
         3Kgig2n30HS52LaAP7c36qk17/lteZ7jmOh3xgAv7aOKYzxRmT0JO05sGUZFbLu4Vo33
         4Lg1rgFn1gGFZRQkF5Am7XStNmqS0OG3LCHC0jNdh2xUiizswFk3Wzi7wzEA8UQfeJOo
         wBSA==
X-Forwarded-Encrypted: i=1; AL+hErGtlVq35dQRTI2GWC43OCBZ9Yxsw7IJwx0HkO0jwRTEqYclKx9Q26KSEUvWsezv3KibiNg0sJVggdNqRyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7+tsc4yrwxeRgMjh1yC3yXaeh4BIPUZxU5f/KsF/7r99FdVhk
	GLB0dLTsOpQi2LYjsw9A+6aLfendjHgDv02QAbW5HCsFBDeITVSniBdbjMrPaqmKSmE=
X-Gm-Gg: AZFdTZezV/GdMGZox4pMegbo3PA46xAbHoOJsGAJd6D+jDIOwpJeFtcTaW8PUrupD/P
	zPtEUm14dulMqLXLiyehhkL976q4j+BHVF1Cx8T+WgvbiGM+mP+9bZNCnTyZ2PI3F62vIDrz5MN
	hhjb8gZP+FDoJg7WwMVq99gHz5Y5MrnLeUI5BPFFY3cxE1NdhS86gkO+TrS0kPlKKUi/dlh0IxX
	/ncFl6N5RF9Jl3qFedfjriG3AE43bCzyhtZDw2NWPDPzKWpsHB1u8vKldG4ysx6Q4ZQTqfpVmDl
	ZYx7TuC8IXdBqq9xXx0xOXDKJU7mnA2mtH2MYsILMvwbHNYpIRAf425cq8W2eT5xvsViRXHpuAl
	7ygEo8Cz3MNLFAVOyhcaUsliTYnGbgXjBE7+G/5JtR+9V87/QugXLohKj1i5fc0H8bPRFjgNHaV
	MeUCJC00byUsnrP8BzS/p4YS35kGNRkJ1i3AJCPGmlZwqV85gxCI08qtmQITP1a3CQ+8hscCSPV
	LjcqehE3Qy8RYPCWPsWMdS6h/6tvg+q8pxtF5dJ4lEeu06l3Kzj8EIcaPf8b48bZ/nb4/jHdpez
	GJk/ZYMHiQaBMEi3Jtet5p6ZxZV0oRJckL785JPhuHR33bEZrn74vwS4e3rnqAvafOKdX2KsDKE
	J2ICDTULcefaF7UGq4cC3SgzX6tRWn/gZEmP2CQ48YnkGRnpQ6w5WypSBfLpwVckjJiHEXXulTN
	z+5yiF16ZQJTLRVrOXoRY=
X-Received: by 2002:a05:690c:c04:b0:8b3:2d65:2c80 with SMTP id 00721157ae682-8b5204f088cmr50894287b3.54.1795472754273;
        Mon, 23 Nov 2026 14:25:54 -0800 (PST)
Received: from ?IPv6:2600:1700:6476:1430:83a2:1030:d4d1:10b8? ([2600:1700:6476:1430:83a2:1030:d4d1:10b8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52030d5c3sm51425387b3.32.2026.11.23.14.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:25:53 -0800 (PST)
Message-ID: <ac4e59cc1a1a89fc5d3b33aa481cfa8372562f2d.camel@dubeyko.com>
Subject: Re: [PATCH v5 1/5] iomap: add iomap_dio_end_io() helper
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>
Cc: glaubitz@physik.fu-berlin.de, frank.li@vivo.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	vdubeyko@coreweave.com, linux-xfs@vger.kernel.org, "Darrick J. Wong"
	 <djwong@kernel.org>
Date: Mon, 23 Nov 2026 14:25:52 -0800
In-Reply-To: <20261120182135.GA2183@lst.de>
References: <20261118004844.3849979-1-slava@dubeyko.com>
	 <20261118004844.3849979-2-slava@dubeyko.com>
	 <20261120-flach-befanden-notaufnahme-b0a663466be3@brauner>
	 <20261120182135.GA2183@lst.de>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=mQINBGgaTLYBEADaJc/WqWTeunGetXyyGJ5Za7b23M/ozuDCWCp+yWUa2GqQKH40dxRIR
 zshgOmAue7t9RQJU9lxZ4ZHWbi1Hzz85+0omefEdAKFmxTO6+CYV0g/sapU0wPJws3sC2Pbda9/eJ
 ZcvScAX2n/PlhpTnzJKf3JkHh3nM1ACO3jzSe2/muSQJvqMLG2D71ccekr1RyUh8V+OZdrPtfkDam
 V6GOT6IvyE+d+55fzmo20nJKecvbyvdikWwZvjjCENsG9qOf3TcCJ9DDYwjyYe1To8b+mQM9nHcxp
 jUsUuH074BhISFwt99/htZdSgp4csiGeXr8f9BEotRB6+kjMBHaiJ6B7BIlDmlffyR4f3oR/5hxgy
 dvIxMocqyc03xVyM6tA4ZrshKkwDgZIFEKkx37ec22ZJczNwGywKQW2TGXUTZVbdooiG4tXbRBLxe
 ga/NTZ52ZdEkSxAUGw/l0y0InTtdDIWvfUT+WXtQcEPRBE6HHhoeFehLzWL/o7w5Hog+0hXhNjqte
 fzKpI2fWmYzoIb6ueNmE/8sP9fWXo6Av9m8B5hRvF/hVWfEysr/2LSqN+xjt9NEbg8WNRMLy/Y0MS
 p5fgf9pmGF78waFiBvgZIQNuQnHrM+0BmYOhR0JKoHjt7r5wLyNiKFc8b7xXndyCDYfniO3ljbr0j
 tXWRGxx4to6FwARAQABtCpWaWFjaGVzbGF2IER1YmV5a28gPFNsYXZhLkR1YmV5a29AaWJtLmNvbT
 6JAlQEEwEKAD4WIQRVwwtrZ87KC0La2wQ5XNnC34RAdQUCaBpd7AIbAQUJA8JnAAULCQgHAgYVCgk
 ICwIEFgIDAQIeAQIXgAAKCRA5XNnC34RAdYjFEACiWBEybMt1xjRbEgaZ3UP5i2bSwayDwYDvgWW5
 EbRP7JcqOcZ2vkJwrK3gsqC3FKpjOPh7ecE0I4vrabH1Qobe2N8B2Y396z24mGnkTBbb16Uz3PC93
 nFN1BA0wuOjlr1/oOTy5gBY563vybhnXPfSEUcXRd28jI7z8tRyzXh2tL8ZLdv1u4vQ8E0O7lVJ55
 p9yGxbwgb5vXU4T2irqRKLxRvU80rZIXoEM7zLf5r7RaRxgwjTKdu6rYMUOfoyEQQZTD4Xg9YE/X8
 pZzcbYFs4IlscyK6cXU0pjwr2ssjearOLLDJ7ygvfOiOuCZL+6zHRunLwq2JH/RmwuLVmWWSbgosZ
 D6c5+wu6DxV15y7zZaR3NFPOR5ErpCFUorKzBO1nA4dwOAbNym9OGkhRgLAyxwpea0V0ZlStfp0kf
 VaSZYo7PXd8Bbtyjali0niBjPpEVZdgtVUpBlPr97jBYZ+L5GF3hd6WJFbEYgj+5Af7CUjbX9DHwe
 GQ/tdXWRnJHRzorxzjOS3003ddRnPtQDDN3Z/XzdAZwQAs0RqqXrTeeJrLppFUbAP+HZTyOLVJcAA
 lVQROoq8PbM3ZKIaOygjj6Yw0emJi1D9OsN2UKjoe4W185vamFWX4Ba41jmCPrYJWAWHfAMjjkInI
 Pg7RLGs8FiwxfcpkILP0YbVWHiNAabQmVmlhY2hlc2xhdiBEdWJleWtvIDxzbGF2YUBkdWJleWtvL
 mNvbT6JAlcEEwEKAEECGwEFCQPCZwAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQRVwwtrZ87KC0
 La2wQ5XNnC34RAdQUCaBpeTwIZAQAKCRA5XNnC34RAdew7D/48vw8dfTLcVjp4j6qUH9rOuXp5A2b
 jCEPeI0oOwRdqkyiGzUfUprHM48owvvye5u1mUZnKp8BWDDsjX4ddmhdloY0+6ecRAG73xlWMFKVK
 4P5XGnHU9A2JOtRhnOWQfPTgFhy69BSYyOeG3e5J+xPyUUBeHajbMVPKnD10NMCx8Ux1D2bv8OWbv
 3DvpUNx9D46UhBmkwIfrQWBkr0OGD2AXFfPqo08c3jcJMOAEc2vBI08Fij9o1gHwP2suFaG0X6jUN
 sy6KPOKg7TVMXtMzxNsKGyFxC1pG7lv+oaEBT6TJSVs/pm71ZrOezQANRzvBeXNUixWienTdAEG8a
 x4uOf3EF5WvYUhDiY8XBJyRv2ZnKJmBxZ3jPStadSuh3Bmo4mNgRVpFXrfb7h8oJC1l1WGdJa9aWi
 xUedku0/nH+nZMTqrtWYkXoLxaMswVM5S4f3pYKd7VlHxtlZiQ95RqQd5uWYcEN6xaSvAO3Cs4Co8
 D6etTHtKPcx1+d0x6BvkBvqNJ5yCiuzPPnKE6E0ss52KKvQt3injPyfe8ffofbW4s2nlEL1s0DoBv
 JslCebuQ6+Orb/Sl6zictIsv3XMq3jGFeZcDg2hXzngOC255+b0Z/To7jINTxYQot8jCOJQOLplxc
 NFdvziOa4FgUBC4X71upsZIoZJeii2V/Jtc3B4g==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-20 at 19:21 +0100, Christoph Hellwig wrote:
> On Fri, Nov 20, 2026 at 02:48:09PM +0100, Christian Brauner wrote:
> > On Tue, Nov 17, 2026 at 04:48:40PM -0800, Viacheslav Dubeyko wrote:
> > > The helper updates i_size without any locking, so it can be used
> > > only
> > > by file systems that issue all direct writes extending i_size
> > > synchronously (IOMAP_DIO_FORCE_WAIT) under inode_lock.
> >=20
> > Meh, this should really not be named so it looks like its the
> > default
> > completion handler. iomap_dio_end_io() really sounds like it.
>=20
> Well, it actually should be the default handler as it does the right
> thing for simple file systems.=C2=A0 In fact I'd prefer to automatically
> call it if no ->end_io is set as that would remove a lot of
> boilerplate.
>=20
> It would be nice to do that and remove the duplicate version in
> various
> file systems.

So, what's the final consensus on the function name? :) How should I
name it?

Thanks,
Slava.
