Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197041;
	b=sePEP58fbJOe/pSMoh5DBplaUG+1+0HLHfdQ8kubp6XLhbiOaAt0fl8wZEeKyGCgj8R7
	 0Wpz6U90nxENeh+f7ned+nh7d2IUEWUILyt1/p9vL5W8PtHT4yFIBUSy2rxthej8aFHAo
	 hMh2hntrENs+ZUn3rYw0hSW2zdGL0TAksgzSK1dontGd+566itBDXyAgUGOoOYhD1K1z/
	 gKDPxXdWgZEtjjl0SGfemIsoQMoHzv14rw9SipowTL07Bg4DfXw9l0zekIoAi73j2bZ47
	 MeQscVLuLyXNislD2FqaLBJkkm33TiNuflLpz0tKgAf7q013tKJYyyKaH+1UU7s6U1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dczCRr28KD+uTEJAqXrQFrzN9Ta198+TxQkvrodr48s=;
	b=z0Y6AJqlJVBQmHynhaFG389vIp26g+pnt+fuF6BRjIIaD6c4aQxlTvM1ZwAJ59mtiUzb
	 9IrzYXi1xY593swoZmyzHXSuadbaQ8cuJKvr/7GFMC1usX4MCexCaAKW5clP79YirQgpW
	 f0Ek151/zF4qyznoNPqNof9R5/ULAyM5xWMS5Hdi3knFSxzhaiBxAHWx4mJX25iUNXBKX
	 e4JHgLk+6EGY0x/iXQwwBHmImn8m1AlZLfvA1QcD9sNcFjfGEEqibx8/gMlOGhdcLjP3T
	 yUxtk1mZvFbt1OPLHZKdH6+7S+ScNRWTtgSjQyu2h0Ckf9c3Bakg6n21HLf0TAWPYzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UpuiBTQU;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A9260A2606
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7A9260A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UpuiBTQU
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c5118deebcfso187056766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795197038; x=1795801838; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dczCRr28KD+uTEJAqXrQFrzN9Ta198+TxQkvrodr48s=;
        b=UpuiBTQUGJmwSFS4Jnthxb10aVlfEM4wkQ29i2ohJY8kKDUVwMhBuPYbVOZZDvnqWg
         TbvXZVivcWUQgVpVD17BwViVvK5KcC+Plca35oT93nLlUx08YBVkZxMVZ6tKZ4YiSesR
         jxAeLMWpmPPGY8Bxoi0R1rJn3r/JKz1OZyBpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197038; x=1795801838;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dczCRr28KD+uTEJAqXrQFrzN9Ta198+TxQkvrodr48s=;
        b=mShTSi4IrKH3P7b4GWjBn0lOmqyRTaX+O+mixArCKDA94DzPH/cLiv+Cs+wA9UWclK
         HybYm1Qvlh6/cSzmYoQ+YUMuscCiMP5Bd/zjWoFZ+85suEFzSq93PH6V5TG2nga6ufbq
         McFHhwcQZLJj4HlGIuyviGUYjowBJOO3DmtOFU8T/H9mJFMScztBLHeHKobhrTDknu0V
         A0wFLVer4A94RK2SVPpCTWY1t3/ezjCkV226/+rlTB4wJNWzP00t5f3Acwhpnm9/OnEt
         phDz6ZiwVLqSguTj3uMxsLDveSwfhjO5LfveBPCsC3gEohHFgwwGncD5TemOzbwjmOya
         9mxA==
X-Forwarded-Encrypted: i=1; AL+hErGSJ5vJVnp56gq597J4hlhYVL5Z6SPsaBIFzG7H1yEkaM99hGhLsjquRO5mV5w7HIqogoitFRUVoDdv8Rc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yq0Q89cyiyhYPbjYQT+zf3blFfO1nNCZLi4yVeuT+FVkU8SyG
	WMRzFyzBYG8AH4zkPP58WP76tH0phUzgCrfK6jdapr/t0B6eakEbcvUc00Gn9l0UTpVM5TIgIiT
	eVWhbzqbu
X-Gm-Gg: AYBFou1M1o4n+Pbl+9hi5tS5JIrBRafpfg8ef+rRcC1IELsUg++MEvXXtPSYZk9XBK5
	7tQ6VYoNssMryRtKoymm+/mIHzg3ApELF7whmwBM0ZLhwd1CJ3HX/R5uUM6Lc8qD4S6ywq815/y
	vdsbT/0/viQu/K61GbtDoU6CBRaEhhn6lLuvlbBiGOJKR5NAuvAXfr/VSJCOpnKmYMXGiYmlpMu
	AFgXgDXMq5teCcfzcITIXOPMzZtHjQ3fpp5XKJhUUe9YSboV12eH1seAUbJl91jJKQIWwkZdRRj
	df7eCb4uk6Tp+dGhbgLLo5iiGREMrSyGyM5e4XwgGvHHU0/6C1W9WHmUai7QMRVOGBlpx/7mlPA
	pegfBqO5CEu46RnrUk6CXA9hP3zuKIrih9kFjUqxz+nGafG3CYvMeZi0vjRl7cWHBpx0kMnR0X9
	NZD/dIB2VFcg86jbr91eBwjgQWwoxnKpqk1RQq+5Lv8FZIPLwVLLyplb0zSJQ0dP2NkASBkcKxc
	oYMrc3IVv9v5uiRRTAcH/JHbLY7TWbqxm2tjYrCXZNBLI6OpdYRZpb6K6ZcM0Wn2Z0KPSWdA66A
	iaW4XBXs3qN4LgR1MaCQ2g6a8MxrTHhISELyVmqBfNrrl5pCpRvJO4dtFFQbqteeP+ZO
X-Received: by 2002:a17:906:231a:b0:c42:4750:8d49 with SMTP id a640c23a62f3a-c513aad2400mr280280466b.25.1795197038225;
        Fri, 20 Nov 2026 09:50:38 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8ce16sm127039166b.37.2026.11.20.09.50.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 09:50:36 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1025438f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:50:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEUY67Qz+jK/dDp2sMooUJnXcpdJVunaAMsM8HzkpHa7kaydQdCalAI0UhzvS9uATkVkqNbDTak14U4Svg=@vger.kernel.org
X-Received: by 2002:a05:6000:2c13:b0:4aa:874c:a1c7 with SMTP id
 ffacd0b85a97d-4abb86ed79amr7743142f8f.43.1795197035286; Fri, 20 Nov 2026
 09:50:35 -0800 (PST)
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
 <20261116205320.1621386-7-dianders@chromium.org> <CAFLszTjhY-mS0yaUtV4ae4m_zTTBA5rDH4NtoU2MbEQm6WunYA@mail.gmail.com>
In-Reply-To: <CAFLszTjhY-mS0yaUtV4ae4m_zTTBA5rDH4NtoU2MbEQm6WunYA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Nov 2026 09:50:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UAhKxpYwyEeySOC6X_MCNh=u8eG7f3bS5mhr++Ewkr0A@mail.gmail.com>
X-Gm-Features: Aa3M54pY3fAgFZhZ3EalnJBZbaFaTtvllnxvHJmj4hAyavZ60vgvrfdEQ0Tz-zA
Message-ID: <CAD=FV=UAhKxpYwyEeySOC6X_MCNh=u8eG7f3bS5mhr++Ewkr0A@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] pylibfdt: Speed up FdtRo.properties() with a C helper
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

On Fri, Nov 20, 2026 at 7:22 AM Simon Glass <sjg@chromium.org> wrote:
>
> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > @@ -24,6 +24,61 @@ static int fdt_property_stub(void *fdt, const char *name, const void *val,
> > +        name_obj = PyUnicode_InternFromString(pname);
> > +        if (!name_obj) {
> > +            Py_DECREF(list);
> > +            return NULL;
> > +        }
>
> Just to check, how much of the 1.8x comes from interning? My
> understanding is that interned strings are immortal in Python 3.12 (I
> am not sure about later versions), so every distinct property name
> seen in any blob stays allocated for the life of the process. If the
> gain is small, PyUnicode_FromString() would be safer.

Interning isn't where the 1.8x comes from. Switching to
`PyUnicode_FromString()` keeps the same ~1.8x speedup in
`FdtRo.properties()`. Switched to `PyUnicode_FromString()` for v5.


> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > @@ -477,10 +532,9 @@ class FdtRo(object):
> > -        poff = self.first_property_offset(nodeoffset, quiet=QUIET_NOTFOUND)
> > -        while poff >= 0:
> > -            yield self.get_property_by_offset(poff)
> > -            poff = self.next_property_offset(poff, quiet=QUIET_NOTFOUND)
> > +        return iter(check_err(
> > +            fdt_node_properties_stub(self._fdt, nodeoffset, Property)
> > +        ))
>
> This changes the behaviour a little, since properties() is no longer a
> generator. The FdtException is now raised by the call itself rather
> than on the first next(), and an error part-way through a node (e.g. a
> truncated blob) now produces no properties at all, where before the
> caller saw the earlier ones first.
>
> I think that is OK, but please can you mention it in the commit
> message and update the docstring, which still says 'Yields'.

Done. Updated the docstring (`Yields:` -> `Returns:` plus a note on
eager evaluation) and noted the behavior change in the commit message.


> > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > @@ -270,6 +270,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
> > +        with self.assertRaises(FdtException) as e:
> > +            list(self.fdt.properties(-1))
> > +        self.assertEqual(e.exception.err, -libfdt.BADOFFSET)
>
> There is already an identical check a little further up in this file
> (just before testGetName()) and, since it wraps the call in list(), it
> passes with both the old and new code.
>
> It would be worth replacing it with a test for the new error path,
> i.e. a failure after the first property, such as a blob truncated in
> the middle of a node's properties.

Done. Replaced the duplicate check in `testPropertiesIterator` with a
test that truncates `size_dt_struct` after `/subnode@1`'s first property
and verifies `fdt_trunc.properties(node)` raises `-libfdt.TRUNCATED`
directly on the call.

-Doug
