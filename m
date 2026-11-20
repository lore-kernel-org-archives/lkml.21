Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795200280;
	b=whqrd7zXifGO8FSSYvwb+PAC+tqQrZpkw0WRl6UhXR/VUxB2C+ohA2bQuEc8z4qOWJK4
	 I04HoCDo/qr7qFhnk5q96/R8wjoRK67NjxwVNLOhNGdb0aDEw8Owqu25N40w13KVFvV/X
	 pTzfR/JI2T5h3Oj/CnYtbwIdaPZs2IxznfnQcK3GiEA24M5XmaiTeZ+Ths1/24pjTZ7Mb
	 pGgHs9wEwRhObqsUs/nDL4GyyfQH7z61vFyqQzeObfvnPdQKRi2V/enm2J8LVCnzsYQcD
	 mGvxiMWO8hw3kVh1BKaVa0hMbH1zYHlJ7RBb+Mlat+jZmc2NmaUf1DFQLf38JtddH0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ge3pmyLmXCv4hB1zhJ0eXKU1oHUklR6Msezg+VICCTM=;
	b=ejFdtASBWdAHzIQXJNPF2dD9GqC95SWG+c7e42xXP3Hn0DMN9p5n/4u4mVZc3opsNkUe
	 Qi+dco8kuC0AQ6Twso42ltr6hMWkKoSU7nLYybw99EEnrOmSpOmW6GX7icLc++CqyCTLq
	 R2StnVE5iVtZqpoBzqGMbynuFqaYcw+9JK3KECUMWz1IrHoPtxd+9WXThk9n/RcvGkIpo
	 sVHJRPz+e+lgSZu2eXNuRis3vV25MXhQEu2y+L35hV62/9ZGLpi7VWrKkXEeirA0vVcpw
	 Rl6fP4Ikv3wfvVtRoG16npFgBdyrqInQJtpz1YZG91obKVc0B4X7V7nf+zvAMqY9mFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZJr5zkin;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B2860A2611
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B2860A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZJr5zkin
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ee2ad94713so819245e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:44:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795200274; cv=none;
        d=google.com; s=arc-20260327;
        b=KRGu1OE0fuFi+ow/uFSa5UYKJSu6mTurzTQQqfuWyjuh4smu4gSbRjRQ97KPt1wuNe
         gXDvQliHDqsphrzQ+Qzbpp/04ARo7f12qw1tqmye+xkvlosj+IF/VXgvk/d8c8OZ7lfC
         prMaafAV6f+odq5TfHHkB/laetS0zKP1rgz4x9mXLNmCKgkAE1dCGtWHxkOVoiuF3PIe
         ijVw2GQ/zWHnyf9n+NX0jcn0CnyelEszCeNtFXwENc0RLjSC7BHJKB+olE18aREIIl3e
         7x5qV6IjVMeNdF0dKRvyy4fl863kf/GE6SI5/+U+ehwrSaDYdNHDK+panNIeLHxqPOFA
         NGcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ge3pmyLmXCv4hB1zhJ0eXKU1oHUklR6Msezg+VICCTM=;
        fh=frrDefuuateCOrrOOCDevxUgTcvrDAZd0bINvtVziQc=;
        b=kFEOXBWISIUKNfHKG/LJefEhTLrPPViBG4xaltfYITE+ohaeOyii3LqBzI49kVnHlW
         5T//QexS3fFyP8YQStdhwFNoRiLq++vS2XrlFFnRLlWZZzJggUWrAk97r7ThJVvJmQy0
         O4s/lMUtLAAMdLF6aTrJV/ORerG+3mtHLMYq3bzersiGXZaBzCBvubdbXojzGHVU9NnZ
         4CNDID7WuVvfBroBGvUQ8N6xXcFxeF7WldaHyL49MTw7p7+GdaUcTEHGA7WKr4QFcsXx
         DbgF+w+A6ZpcE7uAW6d/vUID9IdXsaoa7zlcd7gO7qde/4FSVqkM2/PDi7iWhI9k6sqB
         euZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795200274; x=1795805074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ge3pmyLmXCv4hB1zhJ0eXKU1oHUklR6Msezg+VICCTM=;
        b=ZJr5zkinlPUjzP75ruooLP7bnWorZ6KrEMUYaB2+nsH98WYaKEFKXiR9A5uKaBjlf2
         a9k/J7Q8TeJU6JcxrwI04dMyEynnO7TSBGo7Qo4bfuE9VqxcaHZDV6dOjmqBndWcT5Du
         9BDlJjShUnHIguuNKB4eF4mQRXny/A4cdZZfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200274; x=1795805074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ge3pmyLmXCv4hB1zhJ0eXKU1oHUklR6Msezg+VICCTM=;
        b=hsZPhsiHLab18qHqctiVORUHkpd75a+jni0/9/MEirNcOJKo2esF5EIuKdC2znX1EE
         61g9PBiiWshGu6BsU2JufN86XbEmk9rZzZguPsLtxtodlkAIOMm94I+ATArfvcTIqH5z
         yXWS1HBCe2YGE59GkMIQK+EWKxGzG2Sj6JKq9IpZespXqeWgRBfyZgli8+HXOqzTHQEs
         1pFgSR4GJAvgkwiAhiXlMvSLISQvZZfrBR/cDbHm5AnvFZeKusq25o07q8fOSlqYxUI7
         jX6ICcv2rJiZf6ba5LuxeKtey1YGuOlPCdyhqhyaJSNfX6YsySYbGnn+sOjJa7LRNp1M
         KRgw==
X-Forwarded-Encrypted: i=1; AL+hErE71LyUiAZlENdRQ8kynTwmxYs9qB6ux+nDo7j4EPMLxENmhNaSzkWiwhhmIW29+mvT9QXli3Il5VNDrN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GMGdMvIug/SS7aDD+JpDrvXfx8n3GYFKSsG5gQT7tkHP0lIcm
	4ayjdao5uRod8KgrtHGFzSAU11cy60RrUmLGyANfOPqqpfI6WWumIi/OqKg5gCc0/mAf5u/o2qO
	DsKNMTzZzxYHGtSryouB3kGJ8ESh5FMlhIUugHI1b
X-Gm-Gg: AZFdTZcRtmK0E2Ph77Q5/DTGGb6Q8VFYM4Pm6QycQd8Oq/l0rHLD1ijMy8rrvnxeJuf
	K+8w7FxR8l/KV5SkXdF41q0uwHM2uQ7BUWVi8Gr9DGMEuq9Adtyn60lCIM4ZNQ/vqtrvL/Z+Q0g
	87yNoZ5wP/u7Eq7yscyo+Yo9CbEJSkDeVKEgVv8kBQnLRfONEfEnbE+wvtnjTQ1eIXup9fN5SIL
	Kmk+TDG+iq2y4sSjVUzX5sWiEeAuZ22ojtyisWmMrrz6sT1m+8gOost+mXujGwXxajZWpKpLoYf
	rAZ65EJcX2smtBq1S7Sg2oAomIFgiIK7puFaqdxYM7zJvNrFJ4Z1ihsXuamy9SSUlEdDjO0h0mp
	h9DEmFV30xwQcB2zDvsDspHlfPnWPuMUhpxp8A1nSl8uBaXkV6UqZDK+m6kHsk6SPFCQARA==
X-Received: by 2002:a05:6122:30d3:b0:5ec:3e18:a188 with SMTP id
 71dfb90a1353d-5ee8adf1536mr2653900e0c.1.1795200274471; Fri, 20 Nov 2026
 10:44:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1791023194.git.tjdqudcks0424@naver.com> <d7e10b50556ab3b79c7132018249f6f7c608411b.1791023194.git.tjdqudcks0424@naver.com>
 <asLNxHYQ/xQ6KaWy@hallyn.com> <CAHC9VhRMCfahvx89HjSoHfyKR27swLdt2HZuM1enmoi_gxRyRg@mail.gmail.com>
In-Reply-To: <CAHC9VhRMCfahvx89HjSoHfyKR27swLdt2HZuM1enmoi_gxRyRg@mail.gmail.com>
From: Micah Morton <mortonm@chromium.org>
Date: Fri, 20 Nov 2026 10:44:23 -0800
X-Gm-Features: Aa3M54rASSxX4QbVhBp00t0f3m1HpQ0YSwFJsYfciMSYXLIVp5sGFTUKS5zqr18
Message-ID: <CAJ-EccMjtVkvM5bZzUKDAPcOAKZbd1Lc59oNrW0U8m=s+4R9eg@mail.gmail.com>
Subject: Re: [PATCH 1/2] security: safesetid: use real GID for GID policy lookup
To: Paul Moore <paul@paul-moore.com>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, tjdqudcks0424@naver.com, 
	linux-security-module@vger.kernel.org, James Morris <jmorris@namei.org>, 
	Thomas Cedeno <thomascedeno@google.com>, Shuah Khan <shuah@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, security@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:26=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Sun, Oct 4, 2026 at 6:05=E2=80=AFPM Serge E. Hallyn <serge@hallyn.com>=
 wrote:
> > On Sat, Oct 03, 2026 at 07:34:15PM +0900, tjdqudcks0424@naver.com wrote=
:
> > > From: Sung Byeongchan <tjdqudcks0424@naver.com>
> > >
> > > SafeSetID policies constrain the ID transitions available to a task f=
or
> > > each source ID.  id_permitted_for_cred() always builds that source ke=
y
> > > from the old real UID, even when it is checking a GID transition.  If=
 the
> > > real UID and real GID differ, the policy attached to the real GID is
> > > therefore missed and the lookup can return the unconstrained default.
> > >
> > > On current mainline, a test task with real UID 1000, real GID 2000 an=
d
> > > only CAP_SETGID obtained non-allowlisted GID 2002 despite a 2000:2001=
 GID
> > > policy.  The bypass reproduced for setgid(), setegid(), setregid(),
> > > setresgid(), setfsgid() and setgroups() across three clean QEMU boots=
,
> > > and enabled access to a synthetic group-protected resource.  This sho=
ws
> > > a SafeSetID GID policy bypass and group privilege expansion; it does =
not
> > > show direct UID 0 elevation or a universal local privilege escalation=
.
> > >
> > > Build the source key from the old real UID for UID policy checks and =
the
> > > old real GID for GID policy checks.  In three fixed-kernel boots, all
> > > tested non-allowlisted transitions were blocked while the allowed tar=
get,
> > > existing-ID, no-policy and UID-policy controls, and the existing Safe=
SetID
> > > selftest continued to pass.
> > >
> > > Fixes: 5294bac97e12 ("LSM: SafeSetID: Add GID security policy handlin=
g")
> > > Cc: stable@vger.kernel.org
> > > Assisted-by: OpenAI Codex
> > > Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>
> >
> > Seems obviously correct.  Thanks for the find and the fix.
> >
> > Reviewed-by: Serge Hallyn <serge@hallyn.com>
>
> Looks good to me too, thanks!
>
> Reviewed-by: Paul Moore <paul@paul-moore.com>
>
> Micah, assuming this looks good to you, are you planning to pick this
> up?  If you would like me to take this via the LSM tree, please let me
> know.

Hi guys,

Sorry for the delay! Yes this patch looks good to me -- thanks for
catching this, Sung!

It's been a really long time since I sent any pull requests to Linus,
so it might be a good idea for this to come from the LSM tree if you
are up for it, Paul.

Let me know, if you think its better for me to dust off my old GitHub
repo and pull request etiquette I'm fine to do so as well :)

Thanks,
Micah

>
> --
> paul-moore.com
