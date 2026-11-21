Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795243492;
	b=Wg8YV4zxr7FDYdyVVN0AJc4+Qg1KbGenWdJAia9HK2Wsgnc0Sy+wiQOYw7SbHNzr4fT3
	 n28XxkpIvLT2UwKHqClg0UX/IPz+Bfr6gqre99ZMwqSCrU1+xom0xlS4OzbQHnxvg4Wao
	 9Wqj98MMKV+QdjMQdO3hAKW7sFx3UfXXqTqAsRhYJMIB87T36tkNp7kYg8Iq0ucuBDUCL
	 jU03ZIxiVJ971XPZ1Ka7kmkaG36UKyOwRaFmyb1YIVmj4BjpndQwsNbo3/AsG8WZsZAYC
	 wmcEB9Phm33UtdLQYaHFbo4EFsC4F/FsNSwCjNYZSyJ1gy+R4ADBLg+oP0glCxvpD6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795243492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rJGaXCKWewK0o1WODe/ahcxjTKhVHE+pDRivB69i4vo=;
	b=EMWAm6moHJxgkYJyn4Lf9Hk0++0RCprsgnpVXBEBiLUE2SjlUDtnTucKbWQMHtNRTnpb
	 dCJWgD2XPt20XQwRsPlBdHooDnqqk0G8oLb2bAA3W9zEhpl3KJEtze7F2uvrx/los6n+H
	 jO8gbkhnqOOaOX73AJszyWW//AFHp14MEGSWXXv/x/Av48M8+piTPKNwpAr0JYBgINQqx
	 IYFsjjV2IoZUG/IUUQrK1tDeRyVgszxEoQbIkXu/UCdFzCjKvz0CtGhPSldicxMFWUM3I
	 Qhd5o+GSOWlvFROM1Ze0ymiGJlQnFjB5M6rc0xLClCD/z+lOzhpZhA6OLi9OXTlweEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PZkMDnkV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD145606A68E
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD145606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PZkMDnkV
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533202fe429so135411cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:44:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795243488; cv=none;
        d=google.com; s=arc-20260327;
        b=APk1dJEvuhbmsF+uXfjCo2xgSrwg3FPgBxM2Ixo+IW7lslUMtB9vhFf5NUWzkRZShE
         y0VCVCAfgJsHlanc6Yuim8tnf9N3j3m2Gr842k7bHxIuCitAc9418lQp/jboFrNnxGSM
         QGLse/rUKgqu90vS3CGsYl3RmqM8r5C0A15ur6ip40fPkTY0hWuGG+NS67xSkjadKT8m
         BEWPzhD6pLtkVp7qa5Ru06EvTUpVVGepaTSzxglgeFKXfpZmp+1ijRRGiZTks/DQL2x4
         3JtMbk53i5DIs4zByb8jnb5pps5rrOKkvz8Az3rQAvDlRq5ZNYJIO6CTCiBApNKu7Oye
         43RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rJGaXCKWewK0o1WODe/ahcxjTKhVHE+pDRivB69i4vo=;
        fh=ER9wGG8ZxVgHcP8yoSh3nPtQJfFjPOL3ODv0k1TYXO0=;
        b=TLSNfbjJ1JKekYyHZxBxThrCVFBYDOPzbEyU///30db2kr9w3dTcF0m2u1mrruEBlg
         PM4rzfDR4am3a0DRK7cGnlRohHsW8u4URy/IzqMYvHJy4nPSQkTip2bwhKbvo0uM5zgx
         k57F0G8+HRR0/16r0Z3ntL2StCEqyfjg7EiwEvfnZTFwT/QC3wApAwZTqgOS4fvG+cOS
         wEVrlmIAOSyLT+WUa+sQ1pvlCp10uLWOo8c8hkQijZO6D/biiDv7NyMd9Xr440MJ2uJB
         MSDuOifZfHDWpUeAX2qybDWKm9fU8cC7yCM0uLDeVhjRVH8uyYIw1BFqCbWaF/lsJ1/d
         Z1BA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795243488; x=1795848288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rJGaXCKWewK0o1WODe/ahcxjTKhVHE+pDRivB69i4vo=;
        b=PZkMDnkVarcdoXoURc6+S4eAc9MUQqoG7OCt8F3EMhWrOQFPuQxNuNs4DH2eXKxc7O
         LE6Q5/ntHK1Z6yBp4O/dGez7oJyO0WvTq2NlwoYT6kjtMuDdZCedU/RNHWWBvzKhmDXq
         OtYPM5ImVNUkkiSL1ndqP4q/4J/hMa5ohNlcadghVe0VVEW1s2tnGs071E2W3GVU/FPF
         Q4eie//Q6cHXcPtbablirHfizCXdy5EK8PEcnlLUvBDoy1qTwLcYMh68n1wFEH2uvmRG
         CFyMMSw8cOL/6WaFXNp+kOnPFQEwDHZz6GKshw0hIEkbV/ZlzKXa5sUd6pp7tw7Bh0IE
         D6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795243488; x=1795848288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJGaXCKWewK0o1WODe/ahcxjTKhVHE+pDRivB69i4vo=;
        b=G5467+fRcb6mJ+QaQSXbWjPh8n11iPDkLgv9dZMk68VOlddvaCLCO7IERjshE5BDlq
         ml1OCXQALhJod8hF5K09qe+KxzwIO5B1wG9W+uUKXLKU4Ls+8RpejWbR9wUExXU2mq8J
         N1hj8im5vRHICZfWbwo318+yX54Bb6wpdbsYLgI7ATxKvP6geknCARNrxAzB+vihJyrM
         wcuGaDg8zcaLEsfP5uXxqB51MO/toP+AKSlI4nTqhpDMCeuWYdR9pbt6RwBBm/ZNcDOI
         GHf1FfMOOrLATp00gvR7J0gIaCuZxQcHkzt7E0xV51erVEd/MHvY8jAL7TE1fhnAfksz
         F5/w==
X-Forwarded-Encrypted: i=1; AL+hErHrfU54yFAGZwXkgXI4L5oGmz/pZfCAnIoCPmQSSCb53YLwvuIxNNyeufAJYItby/KuxMJVStCHwHGF6Xg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dFk9UclIQfmQ7Pe2vNY+LkwKkIEc/DkzgmNjqHiV3lMQYZpn7
	PmQiuHT8CcgJGevQYoPPdfJGbl9lTFy14ldktNcexQhXPsvVQcR02qObYq3vVX8KgwsR3fD9Yuu
	cfiBhtkDp9oKtePTSjF0YQu230Hwzva0yVZuAytF/
X-Gm-Gg: AZFdTZfDbyRFJ6L0a4CUu0GtbEnHcPcQMXHnsEovPStDLsYhOoM14kUcGFjbiQ3Q5tl
	tdi6vIn39wYANLgSBYfpzalO/Wubt1pNEegS3T91q/gC2HIBbnfZd4du7k8rpEwoYL3krP4qQus
	+ox/Inb4hQn++jW5LleOHvAbbKfuo5bDQhWMzUX+0yN3DzyvsEBjk4papWLfZmSctTOpAbWg8R/
	By7Cp7d4ff/wU+KStxmJKuk0h1eeslzsNlBeNEYJGnJNGaEioZCh7l4OyK/fXE7K4/Uizdhmx4U
	ZO8yObUejbx9/U5tku8/wX5k3qjAtmKU1A9wZ6L3vYDPNmwExwCYYUbge8frAwQ4IstWtWQ3ZPo
	ph3UKWAOpza7qHCBoj1bZ7Icn7IxvMRTzYm6A
X-Received: by 2002:a05:622a:2b44:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-55d88013e93mr11498761cf.2.1795243487193; Fri, 20 Nov 2026
 22:44:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com> <20261113164152.2095566-6-irogers@google.com>
 <av_aLv6EpM9Umko3@google.com>
In-Reply-To: <av_aLv6EpM9Umko3@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 22:44:36 -0800
X-Gm-Features: Aa3M54o_O14Zh_JgQcHXrC4CBU15axyWAwszYpzIdNObSrbntvtFzWqzUehOzsM
Message-ID: <CAP-5=fXj-43JCDZVhY_E=hEQ=x18aN1TwsE4rKXFX7tfZdzCZg@mail.gmail.com>
Subject: Re: [PATCH v13 05/21] perf build: Enable additional Clang
 thread-safety flags
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, bvanassche@acm.org, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:27=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Fri, Nov 13, 2026 at 08:41:36AM -0800, Ian Rogers wrote:
> > Align tools/perf's Clang thread-safety flags with the kernel's
> > scripts/Makefile.context-analysis by adding -Wthread-safety-pointer,
> > -Wthread-safety-beta, and (when supported by the compiler)
> > -fexperimental-late-parse-attributes.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/Makefile.config | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> > index 3eb8d095cda0..b50702bac53c 100644
> > --- a/tools/perf/Makefile.config
> > +++ b/tools/perf/Makefile.config
> > @@ -64,7 +64,13 @@ ifeq ($(CC_NO_CLANG), 0)
> >    endif
> >
> >    # Enabled Wthread-safety analysis for clang builds.
> > -  CFLAGS +=3D -Wthread-safety -DWARN_CONTEXT_ANALYSIS
> > +  CFLAGS +=3D -DWARN_CONTEXT_ANALYSIS -Wthread-safety
> > +  ifeq ($(shell $(CC) -Werror -Wthread-safety-pointer -Wthread-safety-=
beta -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
>
> Is there a better way to do this?  I think there's something like
> cc_has_option but I cannot find it.

Good point - tools/build/Build.include defines `cc-option` (via
`try-run`), which wasn't included in Makefile.config yet. In v15 I'll
include tools/build/Build.include (updating TMPOUT to use $(OUTPUT) when
set) so this becomes:

  CFLAGS +=3D -DWARN_CONTEXT_ANALYSIS -Wthread-safety
  CFLAGS +=3D $(call cc-option,-Wthread-safety-pointer -Wthread-safety-beta=
)
  CFLAGS +=3D $(call cc-option,-fexperimental-late-parse-attributes)

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> > +    CFLAGS +=3D -Wthread-safety-pointer -Wthread-safety-beta
> > +  endif
> > +  ifeq ($(shell $(CC) -Werror -fexperimental-late-parse-attributes -c =
-x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
> > +    CFLAGS +=3D -fexperimental-late-parse-attributes
> > +  endif
> >  endif
> >
> >  include $(srctree)/tools/scripts/Makefile.arch
> > --
> > 2.56.1.703.gf848ed807c-goog
> >
