Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110666;
	b=24Hfcmwlg8b8CMeAMHLHKXPb5qIy0xqT8dH4w5v+YHdjG0c1RmpWPKKq8GmtGZ4+GJZa
	 E/PnoELZhFzLi+wA8cjDrxSSMsDTwCIEMADZ3ofAfX+H/2aKr2BNDGjWjRGQHln9Z/jQC
	 5i3TY99P0uNg7z3++yd42GDnZGbQE3LrxwWfUBAg5ubMUV34hIhZwpxPFlENRM/jhPsZH
	 MHYQzn+y8KlsMSVvuI+3FvTQmHjoZjTDVBnxGhHluzi2cnhnfIp27cL7zt2q0dBNTOr8K
	 08LJKzAYh0WuzB23YQaZj9IkzPmq0H6o+7p2ET4RdP54au5KNVtLMUptaShmzDoM+Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=PAxZIVc3BZ+cIHdTDgBUyRKBf404I6ObunFzKbCzhrM=;
	b=LbZ7/Lxb4VPGO0ZsbOroRnmWUXVTcIB1yEbb0QB3YGJzJj3LWDR2gMyjGA7GUHTRsA2d
	 jos8/MwJUA4BhHxp6E41uVT5VJ4wTADQ0hXG8HsUo3pg8W97ZA/NhSk7Xq/hOyc44Wn62
	 Txz+UhUCtTpwTTSy9ZTbnG1ctVwQ1oYcgFsBhu+5CDa/N/SrRbHne2yRC75vymi1Cl+wr
	 TtMua62+PSfp3CJgPdzz6F/1Slanb7AkcR2Aew80W5Ugbnsvwfamwu0nXBvNyUzL6y2OW
	 F6JLYYMqV9fkA8p5A85jW28HlI0kuH6vAgNSyQCyauVA2ACYnZeNUpPuqESqVzvJjTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bgYWtpIa;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D35606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D35606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bgYWtpIa
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so1561830f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110665; x=1795715465; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PAxZIVc3BZ+cIHdTDgBUyRKBf404I6ObunFzKbCzhrM=;
        b=bgYWtpIaPdbKZ2qHz8iwHRb1iVorMu307hYRPjqxc7Jd3NO+o3lRDAEgNg0W8ckrZ4
         eGDD1hUN4yN37RHRmNzfLaGVNvVlDav9adgYxDxtpppguT29gnM/tL7IyJL5JzxhSE+X
         oa7KOqg251NfS89hyBc3SY81cEXQ3KQVlE5d3sA3u5bz51hAnnxLtGq+13zak8Jsl9ia
         0KBN97zxXHv8z+Bzazu+tyUnH9Ph7jMEVRL1rEGTq1ZAx08QBjq75S9AgFeJ1Eh/qtAP
         bO/JQFhbnR6j7LOkATP9z0fSw4sQvt1+6NSji5kmtXQt5yJdpma33Dbo0yNvBUU7l3c+
         h4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110665; x=1795715465;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PAxZIVc3BZ+cIHdTDgBUyRKBf404I6ObunFzKbCzhrM=;
        b=EoRZWNQX+rGnvpnWyXDwQTim1alyei8R6ZqaZh2UiT6xbnXlhQNX8PSGj6pMeFrC8O
         cb28voq6HOt8ejPdkuArr5HuIyagwNgo+LZnatRGCsCZkvQ6JTRCHnKhFimfj20/TyRC
         1zf4mqNAGc/9gUYUa8naEv9GRdx52Jj8s8ZjUrhdA6xsG4Q6qR/xNSlxcCM0up0kjpWY
         dTXLX+Nx+JCi1nf7OHZCek/tQ4Tl5JSTeWr2YXz23K3WuVQAtXOcIn0OP0Yl9g0/xkTP
         P0+Jt3KArNopT6nBFDbFtWOBqgbl3c4NUYnnK9/QyMLtRPyTcsrbslmRFizK+WpZtZGA
         +S8Q==
X-Forwarded-Encrypted: i=1; AL+hErHtuwlvPvZJ5EM4M+LljhwCjnnHnVM3+roq7Awnlh6fzapNywyda6VDjbw7+5VizJDv4BHTJ+yx8/DhPqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mgz3lpsvUNT7Y+L7AeLl3WtK21KDWwpQGnAiuuMGX34s1kAYn
	OSuSm1R3S9rrXRFaBzGOhCZw2WNxF/k5J/hva9L0wbBth1RO3SRqCdAN
X-Gm-Gg: AYBFou3jAubkeMw1jMLJbfuZ3H2evW0/sznn8MJl2DkQ0b8X6Ab/TO8Q1JmPLr4+XGR
	OLmYnbo+9NWEk5/I4XghkbMSzZhTaOg+wzB11QMMerQfm+37OPIU+YJXS+8I7t+zFjhd3tDuhso
	fe8mqomNIjO0AF+a49ekDiFqPZM8KSyags98WyYdxQyaqtPeexisKIKItCOjSJA1GHjBvabE1X8
	/AzZCKcuHUmr352whrVFMLzjaKfVFPBNnNjDLho6O1byUjLeohrRUXUux2OhiV0cW+vHSl+FU2S
	KM8Ubt/CsVkFy2DLTP7lfFNHEtddXb8Sq9K2XqkHGfwVnEKeBkZTWq1wuceRDnp0o25cpUgI+D0
	Y0UuF2OI8kuJhe++lm2hw0j31gnAa561lZLPqgc16EUvW7zlkXFsgnjpHXC6YDaPdNt2+4QtLmJ
	xIotXbKXaK1RVzd3CKGuO6Ls7oQ79ip6XvCfC9ysCsYjC65sF2AdyVNbwf3cKVuwuDN8Nle6TYG
	HwnwpiHmdmpSy/x/K2kXEyrrtnijQv18hTdLGGCXVbF1j3gbTMgUV8oXhTDd9mcLWKmrtuJN70h
	A9G9DYnAiZU2l2hS4C6AOtomorWvgTmvded77ON9CD0jIuCpLLu3Dk+LPqxpFMGWYgQ=
X-Received: by 2002:a05:600c:a085:b0:4bb:7bee:5496 with SMTP id 5b1f17b1804b1-4bb8880f04dmr6670965e9.13.1795110664663;
        Thu, 19 Nov 2026 09:51:04 -0800 (PST)
Received: from ?IPv6:2620:10d:c096:14a::28e? ([2620:10d:c090:600::1:977])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm13550055e9.12.2026.11.19.09.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:51:04 -0800 (PST)
Message-ID: <323410cacd68268a607902c50ff565af1e69e1cf.camel@gmail.com>
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
Date: Thu, 19 Nov 2026 10:50:59 -0700
In-Reply-To: <a54689c5-83d8-4a81-a8a2-ba971793d981@linux.dev>
References: <20261117192153.3384031-1-ihor.solodrai@linux.dev>
	 <df72a9ab1ebcebff573485a808e45cd493665e75.camel@gmail.com>
	 <6a1b6f05-448e-461c-bd79-0acd67fb7edc@linux.dev>
	 <d2f665211f7c294bf7a8f3897b247863090e4e19.camel@gmail.com>
	 <a54689c5-83d8-4a81-a8a2-ba971793d981@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-18 at 16:13 -0700, Ihor Solodrai wrote:

...

> > Maybe I have reading comprehension issues, but in order to decipher it
> > one has to:
> > - "kept old prototype" - figure out that two functions were declared
> >    "scx_bpf_dsq_insert" and "scx_bpf_dsq_insert___compat"
> > - "bind old binaries to it and broke them" - figure out that existing
> >    bpf programs referred to "scx_bpf_dsq_insert" and libbpf mechanics
> >    didn't work as expected.
> > - "reversed the naming" - like a new function became ___compat or what
> >    happened?
> > - "A ___v2 kfunc declared as vmlinux.h spells it ..."
> >    Now there is a ___v2 in the picture.
> > - "... doesn't bind" - figure out that this refers to libbpf mechanics.
> > - "fixed a compat macro that silently dropped enq_flags because of this=
."
> >    Incomprehensible w/o looking in the code.
>=20
> Your reading is a valid approach to understand the history in more
> details, and you are correct that the paragraph does not provide them.
>=20
> However IMO those details are unnecessary in the cover, but pointers
> are useful. Which is why I left this ai-generated paragraph be.

Examples are very helpful in cover letters, they save reviewers time
and make the changes easier to understand for people monitoring the
list.
