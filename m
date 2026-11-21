Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795295684;
	b=kNlTdlQYylRI0IRutE6vrYgduksoX5AIF/NIPNTgXbYFms4K+7oiaSiQPdFtsloVBI+O
	 JVBYnxhvjXhySC+QH7JV68sW4b3RE6Ej6IZTZjwSTb21VHXF6JNr0rVTLLuBjlRTIOn7c
	 8QpKw1UgniXPcfyXnKPAEJdNEitT9TXFUq/D9OO6Fcv+gEz+fvtUtRNAGtyjIl/VyMvVw
	 0tdDmsApBZcB+2Ob+5LZiOPClLpzkA1gxD3bUv6iv3n0PL6MlRAnkU1/xqg24yH/CY89d
	 3Z49biwgn4ZtPiS/5ZeTazeqXosUq/IJTOH7exExyRyR4SNRFj32szHRgzQtJYk5EZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JVXIUze55zta93CLasHcBtUF3k3F0VOVstypLu4rWEo=;
	b=kyqNbq4B/FlMcLVlqw99xWKyGJY/lGzTywiP/DJQEfYStQe5S+Yu8xhnpJwZ3sp9wxwl
	 bwRk3IgDDzDrPXR8ls6OethTVoIXEA8qFet1HgsN3yzS5c4aOVjowMPpBhLkzIxa5Rmg2
	 wztVdbeYHSvITtsPfHtn+GCYbngazj+cbDEC+I0OMrOyfDaKkjKf/eYMDWRU3c2Azxd7x
	 Zdt5jL3BEHNuxpTqx+OiOLpvC7MKG6JsyXShNuyXRQeCGKAOJGhAdLvb0EIz6M0ZtRxwi
	 1GRzVlwwPj3K115db9S9NZezmsez+HaD9SM7NyIdX65CKNnP8HNZrCtMxKuNDwJ6oLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=daSCu1rV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7E0606A335
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E7E0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=daSCu1rV
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ee3e658c70so582272e0c.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:14:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795295682; cv=none;
        d=google.com; s=arc-20260327;
        b=cTg07BzIDfo1L66Dm6F74HuzNbqojfkosbcOGte2KqhMEGiY8fM6CzzrVIVZAcUb9p
         s/l5RiABVSzQ+Bsx321VpGDx0NLZcdco+fi4HT2hFSodKUh2jeW/Z3wstoUcevWN5WFG
         QIHip2/gfebmLuh8IdWr9DDg+joNqZEWWWMcTJBjWh5Vwp9847y7kwb7MXpq7rTq6Vko
         fV9UADwyTMJrH5fwgXikGvgo1+MjHuz9W6aDFfbZBO50haM+pPVbs+XKeZGhQomIyx8/
         g8X+xZy9uJaphxzWPFjQK+7kwQ0Aare2ySyuq41zgROlPVbLu/KMx1Kx5nQRSrfaR5kK
         aUdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JVXIUze55zta93CLasHcBtUF3k3F0VOVstypLu4rWEo=;
        fh=jzaEuOfTDKMLNK8jiQIxuCatYtpx+M1siO/7j1CekGg=;
        b=FUkoIiWJK9b7LyxoWObrxE4Hs5N2CH58kWVZP4cRO5q1oNfFuK2zIQLp9WxXApweXS
         6hz20B0Vf3qB7UErl9hEfCxWr+jUshSO7XQQzaswFW5uGJfnwOmVvZG9wsgW+kppZEW1
         S83qjhA5Z1VkP+6w40EX/29IbgQLnqjxU+frKpw852A+3Kh8g8MMPSbZyzvQMM6kwZmG
         EYHL8iJ8MWLbKESm7VEGD7Dfg8IsIrK78RPtiphdirfeqsECie3gu42ilpQj0rBAC1Cm
         xz9561IC0abONIl/kpHJ2xPuP+es+aKWaiD3kazTlgbcMElVm4EKDOL/C+rfCokqrcH+
         4E7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795295682; x=1795900482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JVXIUze55zta93CLasHcBtUF3k3F0VOVstypLu4rWEo=;
        b=daSCu1rVibP6KmyXonSqkr5VdhcRGAjLASbLzwqytA8wCCYmTkuypGNc9yh3g8tYro
         gcoLLfqIjpVrzh1a0Qg7pINTcCVmT9WihsvEDNJcu/1iRmj1MkHnYT/nJliaeU0aCGor
         ZG2WKAD3ONqob74E9Lt0wohObg+p2u+kz5zkhu2KVXO9dz6Xj2PBhjk7iII9lIDYlyMQ
         a+RLJ+MTy74iMQR/JNE8Gmj11KQj3Vt/CQcLsv+BFt7Jg6Hkt2MjgL5KbLZs78NXeif2
         TMXPkxEW/EQNSJFgb/HHs3nh65h259gh7DP4ybPfO/JH+toj05KzMIIUO2fFkflD5GF0
         JmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795295682; x=1795900482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVXIUze55zta93CLasHcBtUF3k3F0VOVstypLu4rWEo=;
        b=lsFgz9R7WeemfMloT3LWZhvjLvCzIerCXO/5h272tyAmDp7vmYvn0ULdpaoMXD4SvX
         A4G6hbx9bL3O3iqlB+IL7TYep5vsrTojGS5zYj9bE8KlQ7sBgxdQcws4FBQmBP2Fn7J5
         swhTXiRsbSKsrhbAmosDP1HTwbYn156tMEEEkrSw6hWvULiEkZPA+2/Dsz+8K71HW0ZO
         S5iclYQiO3iFv3zZslBDm0XEBBID8LlfGqZ3CtxOccVRQJsN9u5yrR905BP4AmH9do5e
         cBjq0AYncnJSpUZWiskekb70kFcoW+qx0VWbY8FSm2HgJRZlc3HFhm8dl6eUolzTxuL3
         TfRA==
X-Forwarded-Encrypted: i=1; AL+hErEwTU9icaB3grE8Ca6r37uIwyDfs0AVU2LP3XV0uYI0rm34Pn9MGvK0YRZfRol/HCPhR5Ev7keGcgR8GXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VbdEvT7Wd3In1vQ5h1piYtbE05CpzDbMPU3AW0pn7EW7STvxL
	PC+68/IbX+SePRh/yQDXut9qjt/16H2EigYa/rcjHuZwefMXy3dyWYbMy00+xEq8n/3OLJNzl7r
	KJgUHMdAhMqDet4g1wQ0dCMlEa2rRNkA7fg==
X-Gm-Gg: AZFdTZfw4yH1sB/l6Vdaq0BMz6oMaH9E1tKz/0Zi18mWJIT1tpHrodbp6Y7u34sEeN6
	EwbTmgi1BETA80DOQU6H3u58UZP9JhzJCC4qxYb9kKABvtMQmL0Wcp+1w9ApwaL/isO9SeC5VkC
	VSMYmlGOmu4ZoWHFWoCd0O10kzKp1IO0+8ndELO1sZbZOCG8bN1QQl+eEbmHfOJViwEXouamdBN
	7mt3LcF0Vth2kMGWO/5u6uD2c/ENySPdAZhKQncLuLfpvmZrxDDyUgM9IfSD685Bw6i3ImyU4Xs
	c/BN8qFTjrkMTSr6xgMyE0am4Wbqb6JYNLTWbgTCzzqDyCBz96tGMxRjq1UCChY+4HXZbC9pgFL
	yDVnTe8jN8Tg/1AT7FwQgL0RRf4kQuWdzxsLuc+9MBdWgVE6GYPiqe51QhwruQUho19MNUThzBq
	xsWwENBKYhyV4dUpVo8afGhcRjOQQTmb22O2tEz7RD8Fo3lFyHVTJSxbyV/2yDv0zEk30R8TAU2
	IDpUslZumJbPxdaW1Kv4+1meUi0A/2EvEaf/Aedm4HWDp3A3YR9bJdxeTEl2ZqFKzemJVp7
X-Received: by 2002:a05:6122:17a2:b0:5ec:d70c:6326 with SMTP id
 71dfb90a1353d-5ee8af988f4mr3347118e0c.23.1795295682517; Sat, 21 Nov 2026
 13:14:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <1218ce4d98a4c6ab6df6279c34d973b9d033755e.1795042969.git.edumucelli@gmail.com>
 <undine-1795189391477787363-17dbbdcc692ec995@undined.local>
In-Reply-To: <undine-1795189391477787363-17dbbdcc692ec995@undined.local>
From: Eduardo Mucelli <edumucelli@gmail.com>
Date: Sat, 21 Nov 2026 22:14:02 +0100
X-Gm-Features: Aa3M54q79aKI1og8D0RQNbEoTQYxDDLEgGbfjp3m4OsVj8VXK4D6VmegMI0QjiM
Message-ID: <CAK0NWSOGSiBEHMaMg1vcheH9-EHU4fUW3sEQsg5H5Btr7+S9og@mail.gmail.com>
Subject: Re: [PATCH] tools/bootconfig: Preserve structured histogram filter strings
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: rostedt@goodmis.org, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Masami!

On Fri, Nov 20, 2026 at 4:43=E2=80=AFPM Masami Hiramatsu (Google)
<mhiramat@kernel.org> wrote:
>
> On Thu, 19 Nov 2026 00:02:52 +0100, Eduardo Mucelli Rezende Oliveira <edu=
mucelli@gmail.com> wrote:
> > print_one_histogram() expands the hist.filter value through an unquoted
> > command substitution. Field splitting collapses repeated whitespace in
> > quoted filter strings, and pathname expansion replaces literal wildcard
> > characters with filenames. The generated command is already incorrect
> > before run_cmd() evaluates it.
> >
> > Print the filter with printf and a quoted command substitution so that
> > structured histogram filters reach the generated command unchanged.
> >
> > Fixes: f134ebb28126 ("tools/bootconfig: Add histogram syntax support to=
 bconf2ftrace.sh")
> > Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
>
> OK, looks good to me. Let me pick it.
>
> Thanks!
>
> > ---
> > Hi Masami,
> >
> > Thanks for picking up the run_cmd() quoting fix. I had this small
> > follow-up ready in case that patch went in.
> >
> > Here's the thread for that patch.
> > https://lore.kernel.org/all/97454eceb5d56bf956740b8998972767bcfe6c70.17=
93216183.git.edumucelli@gmail.com/
> >
> > This uses the structured hist.filter option documented here:
> > https://docs.kernel.org/trace/boottime-trace.html#ftrace-histogram-opti=
ons
> >
> > I tested numbered and unnumbered histograms in a temporary tracefs
> > instance on my Ubuntu machine, running kernel 7.0.0-38-generic. Repeate=
d
> > spaces and tabs were collapsed, and a wildcard expanded to filenames.
> > With the fix, the generated and installed filters matched the input.
> >
> > The run_cmd() quoting fix was present in both versions of this test.
> > This additional change fixes the string while the histogram command is
> > being generated, before it reaches run_cmd().
> >
> > Feedback is welcome.
> >
> > Thanks,
> > Eduardo
> >
> >  tools/bootconfig/scripts/bconf2ftrace.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >
> > base-commit: 0ad31c3252d4c626a93ae6251340ef86b18342d0
> >
> > diff --git a/tools/bootconfig/scripts/bconf2ftrace.sh b/tools/bootconfi=
g/scripts/bconf2ftrace.sh
> > index 6a3535a2c..0992e54c6 100755
> > --- a/tools/bootconfig/scripts/bconf2ftrace.sh
> > +++ b/tools/bootconfig/scripts/bconf2ftrace.sh
> > @@ -163,7 +163,7 @@ print_one_histogram() { # prefix
> >       print_hist_actions ${1} "onmatch" "event"
> >
> >       if xbc_has_key "${1}.filter"; then
> > -             echo -n " if "`xbc_get_val ${1}.filter`
> > +             printf ' if %s' "$(xbc_get_val ${1}.filter)"
> >       fi
> >  }
> >
> >
>
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>



--=20
Eduardo Mucelli R. Oliveira -- http://eduar.do
