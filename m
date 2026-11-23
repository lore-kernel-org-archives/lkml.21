Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795473142;
	b=AO6HgvUg4dZ8uzrX3fL9CrIhq36OVNuF1VAPOYoandyFvCHKbYIs10ibNP+4vEmyUtY1
	 e0cnPdxV4CQdQwS5NdMwnI2Y1eFm4fM6ulM7UFbcJMggkpy62M550slITFV/KgXpqN1y7
	 M77L47vf6TyUTvK1KuyrA2AsIz7++HlacK94mHT1a3PMHo++u2ihI6X0BuugBGQW7Akd+
	 7PE0HhdIWdF3h92ROGZfE5X/Wk5FN+AZD35uKGA2E3rDaVFPfNP2FrHdNkyqEOB8DW0fN
	 6Sp+UqKuaZrCnZltZz/1wpDGER5wiqpMhopJItFnMcVvUcdV7EhMfjbbnUETroDIy0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=2Eh/Scg4g1fmeoxJAaW6QP4PNDVs9nNzors+g2yL14I=;
	b=k8eqCuO97e+BzG2upO8F89Q3iGe5iB4eLc+by3fK1WCQ00hhrpmOHO6v1QFhCtMit8WO
	 X2cFhHfdeOD7F+dRiAYfJnuNwnd6KLOaRAPPVWh0KdegZW8NxuFbNsgiDQ2JFBSMUPOFS
	 +X52WUh2ZOKLM37CFLFn3lEmuq+o7TiQNhRQXMzrOt3H380a9E+Dzc++Ok9YtcpEHMmNS
	 K//h8tH9gC6E3/HgCnWDJzWP6nwjuXItTI4fS2bL9agio/x3qC6F5dxrF4Lwrz+cWXxFI
	 j2xIF3gSNORctfV/k0ttI6HtUd7sJSG2HRsvtHAdLpXyyjPx6mWY7r4gEMAFX5FKOZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=pa297P7u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30FC606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D30FC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=pa297P7u
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67db3a48dc6so4375755d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:32:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795473141; cv=none;
        d=google.com; s=arc-20260327;
        b=SyXK/nfU1Qt1tmWZQg9jw7x6SV/xImTfJKYzf7wTwiYZ659Vykr5qFZJsQaGalTtpp
         mPmr1zXbxsuAojEgCPiaueih2hIbMLH0Qku7RFeUP0McQQ/fCZsTVYPho2A/ovVF2sBw
         WZOS5Ump0Fp2EGjPDvYvjNImtYdlN+ULZgYsY5xyR6VxS1vI4zhhtyQGofoyRDYtqfh3
         +rAA9r3htyWs9eik1e1KK1SooEnzF/8qNWlxc/rLaFHPiULc25OZ4dsGZo/IW3FMLkTx
         mgCjOxhXeiPX9Zq1h8+qij7wg9oWrj4Gp5SVmEfd1YpYXsuzF1oRp6wgAMqAKWMFJUJd
         oScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2Eh/Scg4g1fmeoxJAaW6QP4PNDVs9nNzors+g2yL14I=;
        fh=GyzzP2GAX5viRINY/Fufo2Z+oQUARZIh9v9qfpZjEQ0=;
        b=NwRjXEnEhHfOlpHKYpCEdUpvS3UOKqqIqGXaKc59ZNIFzKofQ3lnLakHhuMSI9cuH+
         X1Ou8kF5kcdkM5Ovn6qhnQXSzoNGn//ARNXu/y8c2OHDQ6DpdI9NqZlNJPCKPwkKtQbp
         2xbqbtnRBt3FFZr7j0GvqZgORumgeOxb5HKR08707uugieuu2hgf7fvWjk9NlUyp3z0Q
         jcswfrmfKqzrJQKHgDXvV5NoMvjY5/WyBTCl6yzGhpp4u9tHhhRu1IiRqBlDCi87yVZ+
         KsjwbggyMOvy/giKXahfA2gWA/iPPKYpD/sMXCia2dTviXDJuAXKuaHjFqGOBVMcUvJv
         +LYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1795473141; x=1796077941; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Eh/Scg4g1fmeoxJAaW6QP4PNDVs9nNzors+g2yL14I=;
        b=pa297P7uVZvyycGhMJz0l2Xa740O5yETkXpOiyeBLj6SRme8nWzeEkfhNNf0ReXq62
         PQN3DP9nHQiS3S7C+LsR8YWvAfvwamyZvdIFFsSMsC2QEOYOC+tZXhMBVqUwZK4Qpq4u
         nowomlaQpVIZ0g5LVa3ziiHCNLLbmRO9KRApw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795473141; x=1796077941;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2Eh/Scg4g1fmeoxJAaW6QP4PNDVs9nNzors+g2yL14I=;
        b=O6NOr41V3EbI2DT7L6Tp+GzLWbW5YvDqUyLThHwk49K35UK3h0Iyg9w3eEvSwzbq9/
         0NaTPEpplhtL/8R0KvqYF1NHHy87rJhvFdLlCK+bcnHfBl5S8gzIXvfwiQXtcPO0IT/I
         M14jrb77VQAX+aJ61IQy1urERuD2CkEWSsH9ptKY15Tkyja1zAw0WMRNzMMssQlFqa37
         lK3PBAn6cFJ7P4ES5q975Fsi8PDu8OhKJYbs//sVVvJcLyNlZWOOAK+at1T23x77opWq
         smYeQgTw6+XtP5OuD8gW02kYO5TO8Dl03I66K6nsst4TaoiWIbLvkry9tQ/RuOzdKHB2
         Pt8A==
X-Forwarded-Encrypted: i=1; AL+hErFqX+b2tNgryrhxvZURWMdCnbmAcBYAvFBpX6zI0epUdV4JNoszHeuOBGtOKDSzXeTzLSaelhea/xw9QVM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/s43SDtGlTfKun+vwjOJTY78RiekXEjfQP94i0Hh0duBfuzb+o
	S4Kt3bV/HiY35rZgnAbaW8JyOzgXJujm+wuP5F+Gf75lHRODyoUSKe8bUB5E8DQ2jYH6sDmiWzL
	WwMh7g955iiIHJA0JNka/39/JVu0fbEMk8lQ8m5SPBQ==
X-Gm-Gg: AZFdTZcrwpBR4RjeycN8v1iCzp6XOOAlMM1ymLYgDug8ds/ZUXy/FxlFaj3MnVBvYOR
	8zsZwkarnQqZhltoClo6TgczoCIYwzi15tRXDsedzBW+2KprldZ03kwy18i+OWkg3yaMmOUPi88
	jJu0WrNHtPwLKXzS/xA4SY7eKvo69YWFl2Uht4IsHnMRtN52GaYPdhwRpyUCGR4NpzJ7erBK3IV
	3hgr7fkIsdGzBWu+s658rcDPg5aCufhrtCbnLWb9Chy8zeEj5zZWYhF/o4Ws2ZI4awmHlABzcXb
	kCMwBEsiN90UAoN8re6XASsI+S6vN6crYkJhM7+hnu3qqOjhY9ShdqxR9bOEagk97s+WOXv5jau
	1eFm1Gy18Ou1XhpbKVBOCXO4k2Dwnqw0ieoAwb5r0nZ31Cv005XXXUK5Caiulm8ZTPjxYQRA=
X-Received: by 2002:a05:690e:12c7:b0:67d:bff8:c405 with SMTP id
 956f58d0204a3-67df42b57d5mr4783638d50.5.1795473140377; Mon, 23 Nov 2026
 14:32:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-perf-symbol-memory-send-v8-0-370561cbb5a7@uber.com>
 <20261121-perf-symbol-memory-send-v8-5-370561cbb5a7@uber.com> <awOQ90bOx9fbW8vo@google.com>
In-Reply-To: <awOQ90bOx9fbW8vo@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Mon, 23 Nov 2026 14:32:03 -0800
X-Gm-Features: Aa3M54r5vhVadGvkZQpkU9NkhzNGma8R6ZXlcVM2afldFAt8JUqLUoTZvG8z8Xo
Message-ID: <CA+w=M=T0FJyuH1LcQLVNHi8LvE3qvBCdFMM-DyRw_mPVq4XPpg@mail.gmail.com>
Subject: Re: [PATCH v8 5/7] perf script: Add --lazy-load-symbols to load
 symbol names lazily
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Namhyung,

On Sun, Nov 22, 2026 at 5:03 PM Namhyung Kim <namhyung@kernel.org> wrote:
> > + bool lazy_allowed = symbol_conf.lazy_load_symbols && !dso__kernel(dso) &&
> > +  !kmodule && syms_ss->type == dso__symtab_type(dso) &&
>
> I think kmodule has DSO_SPACE__KERNEL so it's enough to check only
> dso__kernel().

Right, module DSOs are always created as kernel DSOs. I'll drop the
kmodule checks here and in dso__load_sym().

> > + if (lazy_names)
> > + pr_debug("%s: %d %s symbols with lazy names\n", dso__long_name(dso),
> > + nr_lazy, dynsym ? ".dynsym" : ".symtab");
>
> I'm afraid it'd add many debug messages for -v which is often used for
> quick debugging.  Maybe pr_debug2() would be better.
>
> Also please put parenthesis for multi-line expressions even if it's in a
> statement.

Will do both in v9.

Thanks,
Alireza
