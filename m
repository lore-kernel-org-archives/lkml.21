Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034415;
	b=ErFQpUO2HYm1gh4W+9qdWGEFUxu3RR8VUoIbg0o0EMx8Hxx1qxZ+BNQEZ5D8v6dQu58v
	 BMkH/pX4dTPb5EJCbEECzNmLHeAK4DGx1WJCOqi9pqYmInVb3Ohyw0HHYw66e3MWeXO7A
	 /OFStQG420acS3w8rhs7s/ii+KoA0eNCpneRMYDGqQj79iqUKJxHl7kMxWpTlFTjP59w9
	 yvwTU3sVVXWiYwcpvLt19xwG0VXF+Ai2YVBPdITbkXVbsoTxJKOTsy6pLJHQempOGr/jl
	 QRjMHH86GFWJhXvpyJieDjypdhY67wwMwDaiJW4uSyZ7dhnPSVNBnS8I9xaWdu/sppQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0GtKQDTphZAnerbZFh/WoAg6lsqqk0SI/tZyIM6vqWU=;
	b=PYlsBJG++zY+z5D0XWx9XeQt+EfJ74KqZPa7z/nJAmowoz/flzL57ntolxVtcj1Nv/cr
	 ALK55ATJZGHFM9BwK7qUbKxU2VRMgOTgKj7cqsAgadVce7Lcr36IKUnU5Qf9590LhyKQ0
	 6keaNXQhYDmreW/ZiMeFrgBvQJSO9h9tl9Gds7/QGJzSvUp4q7JntXE4JSBb/T2FnXY3U
	 wVrsx7z0/9r0O0E+uHn+FQzIu/NslQO9av+KCzlPIg6A028DyjRuxbgB4lC2/g8chX4mG
	 k1qqD03bBaZe/5AigSdlNfMjbUteeOhntqLkPg9Ay47IH3wBaSHpj0TUFsdC8LLE/ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PEQtwhpU;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2734606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2734606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PEQtwhpU
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso1479645a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795034413; x=1795639213; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GtKQDTphZAnerbZFh/WoAg6lsqqk0SI/tZyIM6vqWU=;
        b=PEQtwhpUg4YeAhDdhcYhla6V0gjmm0JDMiI4/LAII6jtbPCYRZFwDRX3zTmqFR0aw2
         udxhRbOV7wROykv+ywHSvs/8C0e584gLos42Iv0Gq21uT0wZK8AV/0cpiXYAVS6C6EOH
         6Xu6lRpBe4PkIXkDJZ6jyVbj3tkHqkqdBng5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034413; x=1795639213;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0GtKQDTphZAnerbZFh/WoAg6lsqqk0SI/tZyIM6vqWU=;
        b=yD49DIc+ERvz2u5oH3qAU+FOKNsoUgil9DFatA5Ozo3YfbTv/QeRJ96qS8U5nidzcu
         TdymcczVSKDV8IQia1gsVt1UcA/d/tqmYPQL7jAQt+yhnlRSTuYtrkVD/AU127/Qq/Ol
         e9b1Zuzp8YsO00+at75zZwekvJUk723J5wXbn/Clyf3Fk1cH13+cwtJDqzcXSBiar2Wr
         rv50XygHJ7eEKLOpRo4rzBivI9u2E3GVVUTzIcYO8jAOX1ZyvGRUSmdcRHHopPpNF91j
         V+h6fAwJc33qqlbZSJEHUD5rJEpO4OxURevG/wvpT5SDXp74mhjzW5sD+NO24okv2hHW
         uhIg==
X-Forwarded-Encrypted: i=1; AL+hErFDL+dXJ7A5j5mrsUZsCJ7ja1M8hCgV5XOmnotcvMtGsWoS4U3f3zE2P0C6jodDGLy9W77wXEBcigIi32Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+z/vGGOFB22M+S9UNmuGMZUr5EdaeDOQqYSnBKRoJw/WL+8kh6
	5J3UOEyNu4w2JGE8VNPb+CZSitDk3XcJYHHnmJ6fqsjOGWoIu4vs1ujhDEecLD2l6ia2mftf1un
	VcD9zD797
X-Gm-Gg: AYBFou14GExUov+9s6UPIiN+Ng7PK3TbElvwympclQXFHr1hNDyu5XprXjbAfAh8L+k
	aAZNAbvEhKtx2DebSwug2Dn5QVwAQ/yVBmU36BStD0insMwhjowd+bWiTr286QHls4YnQT2Knq7
	0BHQFRMvZor3wzccuvwJ0Zns04wBHbUdViJUiJP4XwLnESmANEwbbBaXUI4zdPg7IHhnp9IYb3D
	LU8zIZyPZ3kgxjQv36dDiJxrjArYbbR47uywk0HOd1IR07DpqfX0cxLo3YjHOfOOhB1YUOzqnPC
	A+Vhi3AvL/SlR8FpCRcYsTrOcXxQ+N2I+ZwkTmfHskykJmlhPPn0gvMfHEoDnMmeVxgHhbylDSD
	p0VJXnTHrrfPCTRRQVtU9u7P2qXXgzRqEiSBCkJXkD7TaEF8twhh+QTuywa+W4+Ys7uuOhESChY
	UJx5Bmj79HPeEzYxQItkDR8NoonCwNeM2DlQHvC9PuWVtFXVtQ2WmmgsSF7Rmr+AW6sWO/qJi5b
	9NnxZ6SGZhTM+E3LWjK2YIN0BAiQcJLYS0HJ4MqqdvX1WHpgUyN/XhKTYuHeE01Wh7+8JYQ9qWd
	3habpGJR/cENblZSQ+v3D0dYyFCeyIt4TEmqYowc2TPQvImUAKdxe4Wgp0FbkmfObVuJ
X-Received: by 2002:a05:6402:4501:b0:6b6:eefc:ae7a with SMTP id 4fb4d7f45d1cf-6b887da0ff5mr3436114a12.4.1795034413050;
        Wed, 18 Nov 2026 12:40:13 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a217f97sm1541750a12.27.2026.11.18.12.40.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:40:12 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb61185057so12319035e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:40:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE52PUtNKepLH0YsI7CzJxO2aUUw6R9PxXtfOz2Tq8022bbt6pVMJIpSJPWDikJ/+VeK4ED7Cx6jG//T1k=@vger.kernel.org
X-Received: by 2002:a05:600c:3485:b0:4a2:5267:3cd4 with SMTP id
 5b1f17b1804b1-4bb7d5d4ec7mr74358925e9.3.1795034411072; Wed, 18 Nov 2026
 12:40:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-9-dianders@chromium.org> <20261118095418.51d30ee8@pumpkin>
 <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com> <20261118191559.7a39c37f@pumpkin>
In-Reply-To: <20261118191559.7a39c37f@pumpkin>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 18 Nov 2026 12:39:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U+KX9-XMK0xAzeciAapjFecfTS_DjyVDMGwypVmEE7vg@mail.gmail.com>
X-Gm-Features: Aa3M54qPWjb0LuTmUz02ixp8KHKLIDWhYST35zoNbnN5SMvzy4vFcTOqvK5_r1Y
Message-ID: <CAD=FV=U+KX9-XMK0xAzeciAapjFecfTS_DjyVDMGwypVmEE7vg@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with memchr()
To: David Laight <david.laight.linux@gmail.com>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, Nov 18, 2026 at 11:15 AM David Laight
<david.laight.linux@gmail.com> wrote:
>
> > 2. Every stored string ends with `'\0'`, whereas `s[0]` only appears in
> >    a smaller fraction of bytes. On a real upstream Qualcomm base DTB's
> >    `dt_strings` block (855 strings in 11,259 bytes, average 13.2 bytes
> >    per string), `'\0'` occurs on 7.6% of bytes while `s[0]` averages
> >    3.9%. Replaying those 855 insertions makes 362k `memchr()` calls when
> >    scanning for `'\0'` vs. 187k `memchr()` calls when scanning for
> >    `s[0]`.
>
> You need to count the number of times that a letter that is the first
> character of a string you are going to lookup appears in the entire buffer.
> There might only be one 'j' in the entire buffer - but you never look for it.
> (But I might still be wrong)

That 3.9% (`187,315` `memchr()` calls across ~4.77M scanned bytes) was
actually measured directly by replaying those 855 real lookups (`s[0]`
of each string being inserted), not an unweighted 1/26 average across
the alphabet. Even though common prefixes like `'p'`, `'u'`, `'q'`, and
`'s'` get looked up a lot, 26.6% of the `dt_strings` block (`2,139`
bytes of `'_'`, `'-'`, `'0'-'9'`, and `'#'`, plus `855` NUL bytes) are
characters that almost never appear as `s[0]`, which pulls the
lookup-weighted hit rate back down to 3.9%.

Intuitively, `'\0'` hits once per string (`1 / L`), so `s[0]` wins as
long as average string length `L` stays below the ~22-26 byte crossover
-- and even on plain non-`-@` DTBs without `/__symbols__`, property
names average ~12-14 bytes (`'\0'` still made 1.6x-2.2x more `memchr()`
calls than `s[0]` across plain DTB `fdt_sw` builds, `/chosen` fixups,
and `.dtbo` overlay application).

> Have you tried an open coded scans instead of calling memchr() and memcmp()?
> With an average of 13 bytes per string (26 for your memchr()) the code loop
> might be faster.
> But beware, gcc is likely to convert the code back to a call to memcmp()
> - it certainly does for strlen and memcpy.
>
> Oh - and if this code runs in kernel the timings will be significantly
> different to glibc - it uses some magic avx instructions for strlen()
> and memchr() is effectively the same.
> The kernel functions are likely to be out of line byte loops.

Out of curiosity I timed all of those across 200 replays of the same
855-string (11,259-byte) Qualcomm `dt_strings` block with `gcc 15.2` on
x86_64 (`gcc -O2` kept the open-coded loops inline and didn't turn them
back into `memcmp()`):

* glibc `memchr` + `!p[slen]` + glibc `memcmp`:
  0.25 s (`-O0`), 0.23 s (`-Os`), 0.22 s (`-O2`)
* glibc `memchr` + `!p[slen]` + open-coded inner compare:
  0.23 s (`-O0`), 0.21 s (`-Os`), 0.21 s (`-O2`)
* Fully open-coded (`p[0] == s[0] && !p[slen]` + inner byte loop):
  0.91 s (`-O0`), 0.62 s (`-Os`), 0.40 s (`-O2`)
* Out-of-line byte-loop `memchr` + `!p[slen]` + byte-loop `memcmp`:
  0.86 s (`-O0`), 0.90 s (`-Os`), 0.50 s (`-O2`)
* Original per-byte out-of-line byte-loop `memcmp`:
  3.31 s (`-O0`), 1.87 s (`-Os`), 1.86 s (`-O2`)

Even with a ~25-byte average stride, glibc's AVX2 `memchr()` handles
almost an entire stride in a single 32-byte vector load + compare, so it
beats the open-coded scalar loop by ~1.9x at `-O2` (and ~2.7x at `-Os`).
Open-coding just the inner compare barely moves the needle since
`!p[slen]` already cut `memcmp()` down to 14.3k calls across the 855
insertions.

On the kernel / bootloader side, `fdt_find_string_len_()` is only called
by `fdt_sw` and `fdt_rw` when adding new property names to `dt_strings`
-- normal read-only DTB parsing (`fdt_ro.c`) never calls it. And even
with a naive out-of-line byte-loop `memchr()`, `memchr()` + `!p[slen]` +
`memcmp()` is still 3.7x faster at `-O2` (`1.86 s -> 0.50 s`) and 2.1x
faster at `-Os` (`1.87 s -> 0.90 s`) than the old code, so keeping the
simpler `memchr()` + `!p[slen]` + `memcmp()` seems like the right
tradeoff.

-Doug
