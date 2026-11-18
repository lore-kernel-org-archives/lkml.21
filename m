Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795038150;
	b=ii1u7daIv2hgZArs/k15ePeRxGedlHhNW/KCgMOJnA631bEjWT2+5NDA/CpTvcOzGHUL
	 I6DvPAATF3Dx/yeXGTJuuhSAthmOl0Y8N0uWpt4KjtB94rF9RXlLE2DZ36f26vabLoBFV
	 BL0wWCxzvNuTIAY9Qa5G1dFUWRp5ypRREWWNhx6wUopTTFqifrVWw+X3SA37lAHYiIpop
	 bp/gQNWxFaj0VzMJnn86SG0lDBpiCcxuLlGoI53Lv0szzjQTjAPava6zvoIEAU6k9/sU0
	 1w043TmIJ5rXDUyrQ9ohj5oPnSk6r1jJB1nrXB7TnniK8WPr4kXO9DgmpgoTjUZMZLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=pdzz7LkxowMA5/oolvKxj7aqpaNg52beDkUQ9AFP9q0=;
	b=BjrFH/nzrD0ruCDYUGLNwQHaqiUSaOCsV+iIl/5bsHHTjHwSPHP2+P5VyUoyFng8BnkB
	 JiCTcsPl+I/aHWAJ7yQlxLE4n/EbrDOCqhK/hPEbxpjq82Bv46vFF4mzL0rmt6HH8YXk6
	 aDAbebAm/HMf3B0bhgONzikMe++QUksOWRVsHEt0PbXwYG6Lz/kTEolqiCM2LU2EDlgxk
	 IcsfbUdRSqEXyR9kUR1C2g5Rvpf2hd0lVLLoWQtw7sdmQF+zA+HIBVoFxr0SpAoScwIG3
	 2gM1uhpLSznCrGHBpiScvlfS/GztRqyh5d2LN18EwaRb3NKnKYptTlTYbOt4T++1pUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ut2V3P3D;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942DD606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 942DD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ut2V3P3D
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc758830601so1293292a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795038150; x=1795642950; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pdzz7LkxowMA5/oolvKxj7aqpaNg52beDkUQ9AFP9q0=;
        b=Ut2V3P3DtoZZ2MjzXy2yvrB518myCMYfnziJDcctRMg6j2Sot58SRKxlSTGS4tQ2Th
         CrPQbPVp/U0V+qYsKlvhJN3EkSG3JyYkYhJt9punYckWllRy0qjrXzdhYaATzEBZEvVY
         +sIs3kjbpKgs8QkIFcLeV2r+NA8Shwe8GoBtK/gIzeltSITGDXM8WKqUp8SmSkTb4JQ+
         WX0s7D9tMSW6hOqEUR7266hd8oCY5C0UC1VxGcbEAzRTlYIBDttCT1ewLozwIgjjlgTa
         OefsDvzQYO7MzDmWNKAvyWJVH1aSGMdHtC0G4ebnS0iAXQBMDDJCMqGBU+8Km5ueGJqF
         e7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795038150; x=1795642950;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pdzz7LkxowMA5/oolvKxj7aqpaNg52beDkUQ9AFP9q0=;
        b=tDnZoyoqLjET/KdiUZquHj9T7ySm9J8T7+2NgXuCbJ4xGfwJe4xg90CN/dGAzpVJBc
         CtJ+zl0+fs0nhPK4GzsgfHQBWorgXP/Rvqux/34wRR74Y3eetKWDNL/7HkJt+2UF+1Et
         L9MX2lj/H/G0ljPerx/9RnHH5dlcx+qqgGqq1iPzwf5eKYFHLvetIM+vEDahwuHKWjj3
         O3blCJ2CLVA3aC28Ol0im0Ux6PG80VnAB1cD7+blNDnDwf4DmFWq+WBF/Jgqko0Bnl1K
         VLaCLiHkIXs3fjmFzmjYNNa9PKgsT+p1O5c6Ld9dXrsiUtqQQ6zpKQOChfh6X4LX8sXH
         pWQA==
X-Forwarded-Encrypted: i=1; AL+hErG0qa5sScOrEv08b1RO0hSV9G/BmVvHJFparBZ+SYRjxb/54b4WoG+3x6W4KrkNrhiGNVMyVWyWv8W1cKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mShCMUFdm7DqfnCLgVXwaZ4eqw6EQT/CKFAFtdETl+O5ny0i0
	UMMwkosm0Vi1qQcX8Ee3HuqN0RA+C8xWc/l6Jqogm+mf4gcwF0TZOjZn
X-Gm-Gg: AZFdTZe6hEecZ5d7wYVR1G/VPeCX55uEVpWfMijbMO5MDrDQ3ccMQl+4oej0X9krG/1
	cLDXN6VoY98OdYyW3+K2yxrqhdOwK5QBOA0zHkBnP3b94GjG6nOEK6O07T+EohRSzDHusbR3+9G
	rch7aobY7dMMFl4iDyNoUYkq0C+Xwn3JLZ0np/C2+e8unvzA4QVK1aJgPkB7y2hEJ7n+Bdja8Ch
	daQs8VFEXqesfxdFT//KrhJkYWCdQ2ChkOgXkj3Efv/yMJvbJpq6J7qA3uNBMxB1H0Yew9eQYOg
	9/YW+Z18Q4ufvO9UacaxvS4yMsUDVrgrR+AYLZUhK3d1av1eDzaDSkwyVQuEF/prvgfrBPGmpY6
	hof7z30wOW/LBE2CuSfqFrnXxVD2/4IvVhW+ZNhjGGJJcdOkN4jTHiVR8uPielSQVj/azbJqtDu
	eA3xmSnWC2Pnoa5D1U+vaE/8eW/EOrJnse1D7BF3prgcyK7QMahKEBQloDx/jDPXewk32D7cIxc
	qxKlBhU5h1pAaqyYirwBVhpLypuvF7tHvubGmIEkBtZcjTzI3Bybgdv1MbTaLK+4jkoZ3aZdO4k
	RlEqh8dArEH4oqpTjeLluw84DXmW12luH7V/mWAV1lhz4l4gWsYjzNEP
X-Received: by 2002:a17:90b:4b86:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3b3d06a487emr4167024a91.6.1795038149846;
        Wed, 18 Nov 2026 13:42:29 -0800 (PST)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fdf44c61sm63748a91.12.2026.11.18.13.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:42:29 -0800 (PST)
Message-ID: <08d6be6e9e0dcf6570ecd83671e9dbe63a417607.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 0/4] libbpf: Support kernel-side kfunc
 flavors
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Jiri Olsa <jolsa@kernel.org>, Song Liu
 <song@kernel.org>,  Tejun Heo <tj@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sched-ext@lists.linux.dev
Date: Wed, 18 Nov 2026 14:42:27 -0700
In-Reply-To: <df72a9ab1ebcebff573485a808e45cd493665e75.camel@gmail.com>
References: <20261117192153.3384031-1-ihor.solodrai@linux.dev>
	 <df72a9ab1ebcebff573485a808e45cd493665e75.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-18 at 14:12 -0700, Eduard Zingerman wrote:
> On Tue, 2026-11-17 at 12:21 -0700, Ihor Solodrai wrote:

...

> > resolve_btfids fails the build if two of bpf_foo and its flavors have
> > compatible prototypes, unless both have foo's exact prototype
> > (aliases), so the fallback finds at most one match.=C2=A0 This ensures =
at
>=20
> Why is an exception for kfuncs with identical prototypes necessary?

Ok, my helpful assistant points out the following use case:

On kernel side:

  __bpf_kfunc bool foo(struct task_struct *p, u64 flags);
  __bpf_kfunc bool foo___v2(struct task_struct *p, u64 flags);


On BPF side:


  extern bool foo(struct task_struct *p, u64 flags) __ksym;
  extern bool foo___v2___compat(struct task_struct *p, u64 flags) __ksym;

  /* Resolves to the kernel's foo(). */
  foo(p, 0);

  /* libbpf strips ___compat; resolves to the kernel's foo___v2().
   * workaround used before this series.
   */
  foo___v2___compat(p, 0);

New mechanics adds an obligation on the kernel side to maintain that
foo and foo___v2___compat are semantically identical, despite being
physically different functions. (Does it?)

Would it be possible to use some kind of annotation, e.g.:
- __alias(foo___v2) (an ELF symbol alias), or
- __kfunc_alias(foo___v2)
  (resolving to some sort of btf_decl_tag for resolve_btfids to act upon).
And avoid allowing functions with compatible prototypes w/o exceptions.

?
