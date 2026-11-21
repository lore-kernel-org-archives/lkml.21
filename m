Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795275009;
	b=uZbyOaggFnfK49jUIGN+yKYoDBanN34Xk7ZGe2dFOJYhQkRmfKp96FnGeIpPOMxgOOpY
	 ATPLMPRqP5/NzxMHcT/+pzvl8ZGHzvQnQwwKiqLzTkNx/pvozEedCPThITxQJ3Xv622hI
	 OO9SQOmF14AraLAphKZ5jDaxe+JobayRVJrz6aMWzNHDxnqEfRe9XYW0Z79I5S/e1lBH8
	 oBhxi6b5lw+rl/tFibbTvE3Q6UMfoLPX7WjSrUsx1R4DTU1DIzTLxmDhl+TenkeUnwEwF
	 FTtq489DdJDxkXUkNHmbUx8r9aLuceo3Bs+4X8ZYk8hh7M0nZG452kAi4QzUz8HFjIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795275009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U8Q3AHE2krE4WjwTcA1MAoOcsg1cPYEXK33XekqHDG0=;
	b=GJtsqtCQJRYQxupXG7kP9wEpounvAl9oDGA8x205FGnQDUCnrTcbyOIZk5ws6YWB9f4x
	 EpjfWloUygXP0LsYTqx98wkuz0bbQJCyrCc5AQaD0zdQ8AJunsoVCtUnAr0fTOxunTASe
	 gn1e32TIIWjVWDj/BkxmksJdmt2DuOuAtlYAPEb5wrBb5XCJ4KWDr8IPfFh7+/f4Rpb0Z
	 56go1U4ToGsPN/APNUZh+1E4FG6+WKYzLR3kEAD65+CQY2CERWbEt691PqlxwY8NzPmc1
	 iI0Nqb4F1W43KEb+FNa5qmiluzEV0h5Tl55z6grDJwJ2ODGN+m3FiW6WkefZonoxcAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ChAgozdk;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAF2606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAAF2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ChAgozdk
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso26500985e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795275007; x=1795879807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U8Q3AHE2krE4WjwTcA1MAoOcsg1cPYEXK33XekqHDG0=;
        b=ChAgozdkUP7cXMhO0ipL9UB0ajIAvHMPZH8Hzj74ECxrgVHwUrKzCpuTfFy0kAb+Sv
         W7/Y5HMP47LIxhEE3iBcn91DEt9KoaH19Zn+INhZxVZ2V+dHP7QNPzAkKq0XzTfzaOeE
         drcs/XzTRcSUvJyLbUQEzH8LheweLbkWTTFGe4Wc6PLLMNoLHaoanGia0RqTK7uGNOxq
         2bcY34N31bMRKwppKuOxPqw/VzemJ/hxt4MJncPiLQQxlR/zEgUI3nBBO7D0oSIe0K0X
         ba1efB2PmMIAiDIZXXl4KhzRMDfIIsK+qXiCewvbql6QPlMZ5FFn5ftK/TJ9uewGSqG0
         BbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795275007; x=1795879807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U8Q3AHE2krE4WjwTcA1MAoOcsg1cPYEXK33XekqHDG0=;
        b=BDNL7oz7ill4aJ+LK7mhJZEUJUV1vcmzFH3FcA1JVqS/8+zm1Ul+c3BhuFo2oMotX4
         aSH+l0Qpfz3qWFku3OX64exg6ZBJgrYDpERN7/5TnCwFlzpoPs2VtcQ/4FTOKZJikcHS
         X0M6ef82QIQgT+v8NRxU2IUxx1RXXxzGia53Yw/rWJ9gzRA+w8h4cR4GJ0Dl5ehjScm3
         rPg+MkLQx/W1SvIHNfH+GF9k66cbD27OSovOUDE32gAX2QWxBvK6uB1DBJ5D0P7RZ+fL
         UiRh6ZcCx9MsQgXZiADzP/MbUUqIW+0r43hhlu6gUtMOQ+nTEncqqbGURFAvX11sb0to
         j5IQ==
X-Gm-Message-State: APuU4Z8xKYNr+r+JFoE/xIFcinczoSvJDzXSthdFlFH6U6YzDTtschY9
	ztOJLZKINzHR4zcPXlGEMhfJbLgq4Ump/5LXMRX1BAhcH/hSA7eDHLYQ
X-Gm-Gg: AZFdTZfZ1Vj49Z5kS9YT4Bd6Ltrtl6w1Ah8SLhO0zwLYWVcJTQkw9x3hOH2vixE8l3h
	TxD7o1vCtPxpx15jtG++99kvZu5tja3Xd0D61tplBKUR3hAxFEiFIMFk4RLps2umyJ+9EIS27Ny
	7H2mtcFDpZHjZAXQ6f2vsDfsRoCRh1sjNk7MvGkjD8HWWjZCJ4LT0cBkNyZ6Jw/mzR3DT7Gih7k
	zGTz5pujfglNXqJ2W2JiDX4HCQZp/n2AWpH7SxvZERTYL8QA39xwZS3lzW7ts7f4o0sz9C0Qa+0
	1wfJXALxS1SJMU9G1CntpTVx8saiOLsL/+YZBBFVwV0IdTsHIHPOUNtE/Oxnd6lG2PIwrkZbnQC
	3jgZZW62PK/JPKI4gRDbVTWlPp7W6N5gNYJqU1OOaau2R1p494U2pX7fJ2o2lBu6V8h8wiEtea9
	IJxf811obYf1JG4wHyu7EvNSob9zydT+6R0ufD/8lvHxSazLNacXvOGvageWBdcXJq9ihetn88e
	eefilBA1jq+BerZoxHr4aY8EDLD2ytI9S8KRU+ZKngKfPR9l3kDgAhbZ9bpcA7tPHr3lj3ETK86
	01Usv2unTxbYnnOGcq97DE8Q+uLbvEkjjHGp6TtShEpqgQNvK73RVT6EIgsDsZ5kWgj8Zwc/hP5
	8Sd0AKo6wXNPdd0i61Bj1+uB6dkqZAjqnJW+l7LeKMT6nZWJSgJpxj3vz1RaoswfRvxDYLkIWan
	6oaCz81qFAVvilnXRBCj9n2GKxvkqcjzLhbJWQFTvb7Nw9Yxq7oFrv2yC2iBQ=
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr139219285e9.7.1795275006740;
        Sat, 21 Nov 2026 07:30:06 -0800 (PST)
Received: from localhost.localdomain (static.253.42.225.46.clients.your-server.de. [46.225.42.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm268540285e9.11.2026.11.21.07.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 07:30:06 -0800 (PST)
From: Vinny Horgan <vinnyhorgan@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org,
	upstream+x86@sigma-star.at,
	rppt@kernel.org,
	peterz@infradead.org,
	hpa@zytor.com,
	x86@kernel.org,
	dave.hansen@linux.intel.com,
	bp@alien8.de,
	mingo@redhat.com,
	tglx@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] x86/Kconfig: enable ROX also when STRICT_KERNEL_RWX is present
Date: Sat, 21 Nov 2026 16:30:03 +0100
Message-ID: <20261121153003.2499592-1-vinnyhorgan@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260625090627.1501095-1-richard@nod.at>
References: <20260625090627.1501095-1-richard@nod.at>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Jun 25, 2026 at 11:06:27AM +0200, Richard Weinberger wrote:
> Running a kernel with CONFIG_MODULES=n causes the W+X page dectection
> to trigger:
> x86/mm: Found insecure W+X mapping at address 0xffffffffc033a000

Same here, on a ThinkPad T490 (i5-8365U; "Spectre V2 : Mitigation:
Enhanced / Automatic IBRS", "ITS: Mitigation: Aligned branch/return
thunks") with a CONFIG_MODULES=n kernel based on 7.3.4:

  x86/mm: Found insecure W+X mapping at address 0xffffffffc03f3000

With this patch on top of 7.3.5, the same machine and config boot with
"x86/mm: Checked W+X mappings: passed, no W+X pages found."

Tested-by: Vinny Horgan <vinnyhorgan@gmail.com>

It doesn't seem to have been applied yet: arch/x86/Kconfig in v7.4-rc3,
tip/master and next-20261120 still has the old condition.

QEMU without KVM could not reproduce it: TCG offers no IBRS, so
spectre_v2 falls back to retpolines and no ITS thunk pages are
allocated, with or without indirect_target_selection=force.

I found this, and wrote this reply, with the help of an AI assistant
(Claude) while building a custom kernel for the T490; the results above
are from that machine.
