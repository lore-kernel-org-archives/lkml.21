Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996373;
	b=I5At2WIARmBe+drRUskqemUHQArceRE71IxvGZMPe8MkhALAKsZt3+TcQtVHAwr89Kij
	 Wamo1X5w1u8YMfYhVHggUrDU3A61gfB4Ht2uDMeQ2bC8KnUXe1qVRxE8lg7QN1qaVpUq+
	 tmjqFdvR3LGXwVlqVc/jwSWXXSlbwf983u15wiyYNK4S53hgqDW64iZ7dVOwxx+xeCYYo
	 d/Is2jCqAVvo4rNU4hveSPkOwB3BXpdLZ6zvJnMXBmhOeJ8T8T/LrMyNBdrZ0vZTOsUEI
	 aJZl3ZxznWheX9g9wgHKZTs15gIicvrPCK8jjkZxNWtP3hLI90tZTcKzZK822sBUBWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ptek3L7MaoTJgYqQCUXK+3f0qzxCpv92OLf/1V4Kc8I=;
	b=A9frG8EJER0A2xnnBjtixzrqd5qVhC3kElmJffQgCp2cw19aDhRFSHGEFX4raNIEWEsy
	 8dRMzOU1pZeOd8gUspxUmVSoGSNsUlypP6oQJISyHjXcFhhw5Ln+mEtw6HBZHYlCD15Cg
	 gPWLLEaWF3hKi9kmpQ8D9PryqvtWxVS2lk9M8G+WEzDTYSs2wJq4R4iBiJ7idauqIVu2J
	 SN3BS8MBEJXNHtrLMkw5vjc0C/TJsfDSTMjDWEXLZchcZAjGT6bqmccaYLfD7BnZAjgNM
	 vx5lcEx976QVhP/r97pjFZNjxfXQyHCLiLwxAqI1tkxKfCtWL6j9Q7bEF8F/0B2OcMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ssWMbJK6;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BAA606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16BAA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ssWMbJK6
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2af4c8d00so1620534c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996372; x=1795601172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ptek3L7MaoTJgYqQCUXK+3f0qzxCpv92OLf/1V4Kc8I=;
        b=ssWMbJK6tykegP234zTQmP4F8tfX+bemU0xjgrSDP+YQ6xxrOkSPRg/x2RUkfFS4Zt
         IgzSR97X3AV6fyvNMdi0/w1uJd+ogztf9QjS4zA9R2Wl6vql1WH2TG+mNv6vYP+4y7II
         n48d8UDaqOYXkv2SjvMSmg9AtnrXVJD39NkadvndaSPNhH2F0H0Z8j/omU2lDBL/ZL2X
         CMCU02mCcrhVz97Kc9DY05+zJebJ5jlVr42/Ymx/j5+/arx5t7Waxqq8XCzf51TahMwt
         MfsHu3dqm1dEYyAgTOvi1HdsypYrRqWQhrEDHdLfLitsywvwCOWKGN0LthWE6GNNcYEI
         +64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996372; x=1795601172;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ptek3L7MaoTJgYqQCUXK+3f0qzxCpv92OLf/1V4Kc8I=;
        b=dSOAYFpjm9V/t1u6DVxmp1QNsc+QEmtqus4aTdEBsTkN4RVq0ftNb5hu3L1pEak2Q0
         RBh1r8a5v0A5FaQMLT2jUp9gpMnuDjxgW4cwyBj3B559j1h+bdUB4HREt68JCinYq1Og
         DdFoIArmgGoTb13+93LFgrULvUhkJGMldPBz6p8GpjCJr3582CJhhMc0mmBDTlPsGf6r
         NiIRJD7mq6iNKNCZzs6zrFxOPeq5bRr4okIOfWT2+tNXz8MXIObxys+AbdzJl1+TsQAU
         DkASv+O8Zs3W+48XyLzE9tcpU3HSKyhJY9UM5A/pp/p9y9XwmAmotT62xpKxp/LwmKGt
         6WGQ==
X-Forwarded-Encrypted: i=1; AL+hErGXao1235AbWU7rj79nSylotCoTIp0In0nmlG+4CqHLUl+CK06nEo4Su9yUZ41+SD66B6eTWLp3PHZqSKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hYSEsLgIijejrGjzUxK37QKmoSlaOrlP/f3RkeDYtl1LYqsqm
	nE1xrzhO6OmFl5R23eO3fQ74UIjeR7N631o0famXa/XTiQmrxH0nRcK+
X-Gm-Gg: AYBFou1ihlF19qVZ5kEUWFBq3As9d8j6NE3HJMwOO767rDv5aQTAFjCLAAvVOJdo7zS
	o5UmTGG5Q+klwRtwn+lPpIMna82+GXxtiOSA9aVxdBuaKOR5UM6g7zKeCiNlKzydqHY1NM4Vf2T
	YSpPupASRkDpgcfP8DrkdmKDPti8IQ6GZscRcVVhq2D4bUh2f5p+PCsDUPwE78wjQm41gM7ciJQ
	iCPHOE4QQwCLw27me8QCwKJrPIX7Epjpj7QYCu4RAPTQUr57k8SkYqvWxI4kSX78qI8QiTmi1Bn
	POEfxlM5xr5WC2jHapsoxrMCuKNos+wRldzBFjjVyIQioHkgb/43bYEBR6lJRAdk34gS2DDcK55
	Q5Q+zqz67kWBvejVvqI4FxLkkbw/z4m7YzlIQHHpgMPDw2aChdxlzPSIp3BuECes8qihs7AyQYw
	o1ikaCNpeX99UMnXQTihGK63wlWSL8FvETdOLT1pwC9MN3NV/+2LCfX7B8LoyjCpgkEg/HgvT/N
	+sKDwo/DyEAzhVfFm4VNKY0Qa7wtcCARAzDFs/fuYwkh5WDUJAYwTTKN3R5rd2Fv0dOw0BnE/5H
	UNwH4A09t2C3b2065ePzZzrOaJNYZCmMOKtgUS6qboqwN87BvnSYC9T81SU3O9z82hhlMQ66yYo
	2Xxv3wLWqv5m9PZsgiBvToC9V1PU/bHUICGaMYPKiEzXn2yk9l68SelHFheW3HBlBK7otuVTwWd
	8GMQMnXRusPHJ2h501uSzZN4iA2vb+Nu0wA85xKXsLwz73rM/V1eVtqCbvQhHRK7c=
X-Received: by 2002:a05:701b:424e:20b0:1b2:649d:dc23 with SMTP id a92af1059eb24-1b543d2e78cmr2418396c88.35.1794996371898;
        Wed, 18 Nov 2026 02:06:11 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447811efsm5392670c88.3.2026.11.18.02.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:06:11 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] iio: proximity: sx9324: fix proximity threshold writes
Date: Wed, 18 Nov 2026 15:36:05 +0530
Message-ID: <20261118100605.34002-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <av1NN8_Y_f3xtWRo@ashevche-desk.local>
References: <20261116205320.26070-1-kapoorarnav43@gmail.com> <20261116205320.26070-3-kapoorarnav43@gmail.com> <avyj-lOGvj04A_Ak@ashevche-desk.local> <20261117191029.83901-1-kapoorarnav43@gmail.com> <av1NN8_Y_f3xtWRo@ashevche-desk.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Nov 18, 2026 at 09:01:11AM +0200, Andy Shevchenko wrote:
> For the sake of the correctness the whole set of 64k has to be checked. And in
> most cases the + 1 there will be wrong. The only correction we need is on the
> edges of the full squares, id est when val == r² - 1.

I ran the v2 logic (reject val < 0, int_sqrt(2 * val + 1) for val > 1,
reject results above 0xff) over every val from 0 to 65535. Values up to
32767 are accepted, and for each of them, apart from val == 0:

	code = largest r such that r * r / 2 <= val

val == 0 stays at code 0, which reads back as 0 like code 1 does.

The + 1 only changes the result where you say the correction is needed.
int_sqrt(2 * val + 1) differs from int_sqrt(2 * val) for 127 values of
val, and those are exactly the ones with 2 * val == r² - 1 for an odd r
(val = 4, 12, 24, ..., 32512). For every other val both give the same
code, so the + 1 has no effect there.

The reason is that, in integer arithmetic:

	r * r / 2 <= val  <=>  r * r < 2 * val + 2  <=>  r * r <= 2 * val + 1

> At bare minimum the commit message needs to be corrected and explained
> these aspects that while the + 1 gives wrong result for most of the cases,
> it's still okay to use as we work only in integer arithmetics. Also the formula
> (r² - 1) / 2  has to be dropped as it's incorrect from mathematics point of
> view. The floor() happens on / 2 and has nothing to do with (- 1) correction.

Agreed on dropping the formula. For v2 I plan to replace that part of
the commit message with:

    read_thresh() reports code r as r * r / 2, and the division rounds
    down for odd r. write_thresh() inverts that with int_sqrt(2 * val),
    which is one code too low when 2 * val == r * r - 1, so writing back
    the value read from an odd code lowers the code by one.

    Use int_sqrt(2 * val + 1), which gives the largest code whose
    threshold does not exceed val: in integer arithmetic,
    r * r / 2 <= val is the same as r * r <= 2 * val + 1. The result only
    differs from int_sqrt(2 * val) on those edges.

The same goes for 5/6. Does that cover what you had in mind?

Thanks,
Arnav
