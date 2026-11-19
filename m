Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795105922;
	b=KGomZaBqRirSzPWwTaKk7LeuZYcRduNJfWr4CmY2ep0xyvcWO7d1j42l5oTeb+dicaJI
	 2JEx8h2oFe4qApS5ToQ7KCc7rhdKaVp/FCQSb/IilTo2oHNEY+LaJLANPaYFEJh1Oqy69
	 md2DutIZ+RzCnvajkhnt1sYJNV7+RjRKdhj7C5YIMdZVkwuQt9av5eBxHKQbNWlaRbRms
	 bgDkWviga1nBrQBdfZ5d3w1mYXYA0mNaD/TJjrgbbpAt7RNtjQC/q732XIdy/Mv4mI+WH
	 fU6t8IrxNDRT/7Sdhcn2STwlEUGd3JnKBzJ0RTZzcIUYY22ixR2wxEAkLkSVLkStN8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j7yMNUPcBawOAAofiPpPFqavO7i9DOB5qyxe4ygPJGY=;
	b=Rxk80ZPxsU8ajVXo8kZ+FpT4Tru48XBjJb0lV6+RceGbWE4jZufax8vqx9lPC9k3+S7E
	 DGe4hy0IiEq7ideVGPCScAUmAIR1P9eRpO7fG7DfgVGAKybcm4M3M9qt+zM0NGsl/ALl9
	 9TjtiZAk1Tt7noNtANf1fR7yrNFxyMbCWZf2hhc9f2f9+lnZnVypPeYSNalfEh4CGJZqd
	 YrKSObJo3I0nMooA6jnOU9ufW0bvATzEdKU6MXysVjripKlmgGDkl8OM8kCF3hUYN1dIA
	 HzB+/+Z1ipySlEZ0dAv4Rnh4Q5XFXBxf3t7enF7qkM5momIJSImcbtxmZ72EfoiqeUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mFAIxap2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5CA606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC5CA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mFAIxap2
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55be673e029so299021cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:32:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795105921; cv=none;
        d=google.com; s=arc-20260327;
        b=hvf8oOjVwEyJLY+CAZa+gyQw8rEfMydCgcuYqd4SBsKU6lxb7c+Ywiquvj9dbGztqv
         5fIuSPyexlh92II1qjRxK25x2Og/iRAHMUZZ5TLHgEM3ncW2EK/nkNaDHZ7gUpSQY9+B
         e7qKKB4bxwbVsX0M57KiSSq+G8JFCARgCcwRabK+2HZHUXVwkvibKJh+DC6sGNqFC33r
         7gwbbZcjYPhgsUesXb6vsnOlSK9fZW0fNpqUDDqj44ljyWxv4FiCvi0Su7tkkCB0o9w+
         2ai+Xx7HakJ+Ltlf8qLR0clPX4w0sUUlsir+MPTcmgIVhU4c3dDs++l9JsJJ585q5Dq4
         P/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j7yMNUPcBawOAAofiPpPFqavO7i9DOB5qyxe4ygPJGY=;
        fh=ikvS6leoydzHZd7XUHxAui+oZbaJ/XxwzAWpEQLM/Vs=;
        b=DL5s6Ja055bnZBs6DQPYIBTEv00XgxWBPjynurG3ngQ+7xIz/mTlce8a+IhZqD1t/r
         SpAmgKj4PWu5bwTflk+MCO0ky6N9/nWRQyRqkxPGn8Y9L3LLqIyRwUYI/nbvUe+Q+vIs
         V3nWyyru9/BtlXtCql1hQBGB4uwAPoo6oavOfau5RekOLzIctENzMf8BSddDcx2iTOUD
         CWiEl/6HbcqKushjRP3AjZHz201GHjYu2BvN0uRR00mCnZQ3iJW6Dpmv3O4T/zXtpVdb
         hmYsoGEZM+UlCqMt4b30Y8GQJ/NU96asmxuR9c7EKr4iRIpinzaq2cu0EnSoSetHlMN9
         S7vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795105921; x=1795710721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j7yMNUPcBawOAAofiPpPFqavO7i9DOB5qyxe4ygPJGY=;
        b=mFAIxap2VFR1v9uPD+hQUTepw6PGG/7sXedKMPdVVmdDk0NRJK/HACOYACWO5jpf3w
         gbFn8q+uBItiBZnqUwCO/JKMY/LpjYK60YscKKlECYucnPff6241wnHkziUMygDCozFt
         fdHQnwGajdhh23O3l8m4TiMRuWyjRAgwmJpqg5oVxAaS3zRZafMvKRbBb/yLmtiVQMTu
         xUFur+wS2y8oGWHlFN9YMrgC8UAIlZ3jhF6fA+Z2pw/bB7r/DmbasacWSqv+RCtg5euK
         2aMgYT8y+fscke7rtAMyuWxlO8apNehK0gdbyfwU/LJ6SIOUDOwK5YAePtEhk+4nuGya
         y3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795105921; x=1795710721;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7yMNUPcBawOAAofiPpPFqavO7i9DOB5qyxe4ygPJGY=;
        b=uai4vJRyfqzH29q9DlrwASKur/vmYYyc0GDAAofVf15r2rtuH41h7CUB90dWqI+Xhg
         XzeMj3ob5E46TJxfAzw6jaGU8/uS4nZTt1oXYBsmHwHrYyuw+hff1pEEFdN3gkVCffYO
         PutkvsVLaIsd1wo/+Thv+7WxTBwAwWfFwZaCk0cZd0KDo5CktJzbp5v/yc985ox6Ly8/
         HC3avNp/DunVrgYbqpkU1Pw4nHRmbvJL2+ALblAmkqHkJMawGNxfLPuMuxtQo/oWFkTL
         HWIrsHOknp90Ee6SkZHvuK0/lKerTF8QMbibx9LZ4cR0bWO15sWkNlSc1lvh5QPjXgXS
         GHlg==
X-Forwarded-Encrypted: i=1; AL+hErFUTBApiYZ1VoZqoWVhQXSHoYB6iVD3kmNWPzshBlEgDdoBk+d/N0jhnWASYgDnJdzKLPN1JA9T6dQRnpA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hVAbB9vKaTpRLZhGo3E3a854dmYfSN55UQHVzedTCO1cnI37a
	HDz+iW+iVjm941iAFVF5Vgle5MZhkcRJh1B9uFn4Im/IQWFu6I2GEWb70y1G5zCZHtQ+VwITbHQ
	KqwKsx3zs4Bs2+MTyNOj4gDxZDcBgQIFsbi8bhzha
X-Gm-Gg: AYBFou2V2vVyhlYG3r6vbNutEAFPSMhAspuVzXJfdvl/ggh0x752YD92A/KVl2Ky0xz
	YbfR/HSKUYYFOyf74XAjrQvgDzX14o/41FHpL0rU/krHTr5AXJwH0JrV0kcCvAUgH+2EoKTZZGO
	ohMSl6FSBY25ql+t4OZi3Tam/gIzdiU2XBOJcZXWAMGHRVsO28d70au1KexUh2GMZKLtDPEgx4+
	JIAXq5Y3VXqIAvlTY+62XOOePhix3lw8c36T7KkWQH2Txb1fg/pgoZLwY2VhZARcAeOZgKtq+YO
	BKKHDZjVT4NoawMo6/uZvC/j8Ttt5Ume0njDUBmatTTawZ+dzgBCGTJh0wyrrXKurJ33ZpT3aos
	9oGXER/32Xl3Co0BnSXt9rG+Pxh228Rawi+yC0g==
X-Received: by 2002:a05:622a:4808:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-55d6c7995f9mr16593651cf.2.1795105919993; Thu, 19 Nov 2026
 08:31:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117185305.108003-1-irogers@google.com> <av6mfhEBYhJUebPZ@google.com>
In-Reply-To: <av6mfhEBYhJUebPZ@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 19 Nov 2026 08:31:48 -0800
X-Gm-Features: Aa3M54ry8V8L6QnN8lpgrTFnO3sd8eftianRLEL_N05ktRrKLRjNBKFclMwv6Ik
Message-ID: <CAP-5=fXy3L42T03AiSfhmw9pXR5-VTxFK4bKu005tkocJAXp6g@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] perf symbol: Sorted arrays, DSO-owned lifetimes,
 and memory shrinking
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Alireza Haghdoost <haghdoost@uber.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 11:34=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Tue, Nov 17, 2026 at 10:52:56AM -0800, Ian Rogers wrote:
> > When profiling large binaries or long-running workloads with many DSOs =
and
> > threads, symbol and DSO tables frequently dominate perf's memory footpr=
int
> > and startup latency. Currently `struct symbol` has several structural
> > limitations:
> >
> > 1. Every `struct symbol` embeds a 24-byte `struct rb_node` for the
> >    `dso->symbols` address rbtree, plus an optional negative-offset
> >    allocation prefix (`symbol_conf.priv_size`) for `struct annotation`
> >    state even when only a tiny fraction of symbols are ever annotated.
> > 2. `dso__symbols()` has no internal synchronization against concurrent
> >    readers/writers, and `struct call_path` (plus Python callchain frame=
s
> >    and nodes) still retains raw `struct symbol *` pointers without
> >    retaining a reference on the owning `struct dso`, preventing
> >    unreferenced DSOs and their symbol tables from being safely reclaime=
d
> >    under memory pressure.
> > 3. ELF symbol table loading (`dso__load_sym_internal()`) repeatedly
> >    invokes `libelf` section/program header lookups per symbol, calls
> >    `elf_sym__name()` before filtering out non-function/non-allocated
> >    symbols, and resorts `dso->symbols` with `qsort()` even when ELF sym=
bol
> >    tables are already largely ordered in ascending address runs.
>
> [...]
>
> Applied the first 3 patches to perf-tools-next, thanks!

Thanks Namhyung! Should I rebase or do anything else for the next 6 patches=
?

Thanks,
Ian

> Best regards
> Namhyung
>
