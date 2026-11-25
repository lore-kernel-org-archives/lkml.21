Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795585797;
	b=0VlOiWX+6RL7KJhfIP6JUfyLfy0kQnFjoITjpw4B+IP9HUYS/FOePEX0UuY8Ey8u2UN7
	 6yLS38VJF4liIyDAHL29AhfzkuY9jhE7m7WbW58/vm3IosWfv+4yjUreh9eTE749SjLq8
	 lc27oGGb0AVqc0lSONVOr9sYb0G3/lFYfgcfDuxZjkp9VvUMFFDU0ygGwmnPkw07p9Rw5
	 nJz9q5jeIEx8hgHXnJtt3fVpABJdwDXMOEAuwwjUw1QdLF48tO2RtZiJB7OqQYjN093H6
	 vbUL84UCiKITOL1ajILSLBWrQ5FqTzNTteHiF6ErPTpXng+4nDzshvrahQCEXQzTPtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=M0m3xJ6SKs4qbuy6HlPELsinPaGfttdr+a2t/1R0rkE=;
	b=0tCrMGXPnsC0Zm/JUfzE/ullwhi9d0fweBHAvg6sMoXDUrvnG2OqsVzNBvWp71pNsukH
	 jhk+DSrqqnTAhje3Swvm1AblAGj7WevT7UfBB3IHoj8BXedVTXxyh9thuVQ10q1jGOfYl
	 ZdaB7Bh9YhnRGm+aoNDSlyuLL0WeweU9eq6n+gYi6+Mmmjl9j0AIRdZeX1Tjbf3lPcgdi
	 roQcmLmbZqvZ1IYBKIH6ovbtFBr3ObGSJCOA7IiPH6KBzud2W3g0CCf+5bklN+Qb0D7Cv
	 ZB/+28WpHAQf79/pEohZ6uu8Kq4D+fBZzb075Rx7aqes113AShn4Fo+MUa402fKLRnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=hQj2Gyfs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642FD606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 642FD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=hQj2Gyfs
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so46202875e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:49:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585795; cv=none;
        d=google.com; s=arc-20260327;
        b=KGk+oHQcVXIERZJvyXUTCBgKEFYk4hwLGdPQevu6Li6uKJB8H/e7tCDEVrhlAERp25
         Nre3+SKMl0iyyUZkwkPKYt8hrPQmcIlLfG5fUYcpavy2jOkpo8gKwUuOpGkZTqrFkVYM
         +oXSzq4xwt857kLD6aBsLKh+mBjeqe3V/+RDBFmiU2jo4hGsWKPpsFed/mvHm4/sSK8X
         2Q+imqEbSDqIG8xLjuHadbpGbfqoPUHAVuKGO4jbQn9rcjt5IsUp+tARbJBFQaVgZbzT
         Swlzfc6apJ8xA2L78qOBGJScrgLun75VUEvE26uh3HTYa3JDK/gQWlgdQTKGOXXG6Oo0
         Ms7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0m3xJ6SKs4qbuy6HlPELsinPaGfttdr+a2t/1R0rkE=;
        fh=lgmeOoYroObvsRkOJcFerbTNelwTXSGdCcyLAJI7R4c=;
        b=fFqPAa2cnl0Pxtdt68chhSX2kPk6YPhfZxTHS0jwAOFOhZ0IZUMvtemrc3zEEr2i9m
         9bN42jktnbYyiBoLSO8kR3lBsbE7gShBOaixXxp3MeuYSaHZjmr5cM9afDvn2k49ZltP
         YNc+RDeGjbp4lXauodgM4tYgQHwWYB5+iYxIgWGHVHOLIR6MOOyH1r7M39stx7bmayU+
         NqyrRGNtghyvFK9mP/t5b55Fx3m2xN9rn0/4GDEO4Y+2G2yvTwTHo7AR1ioRh7flWKWW
         IHTZ/3/emxK6OkugwxFocMR8sxBCSqhEbKwvBoJ9IUvCnYXXzn0A8USR0Hs2ExuEiz27
         ASdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795585795; x=1796190595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M0m3xJ6SKs4qbuy6HlPELsinPaGfttdr+a2t/1R0rkE=;
        b=hQj2GyfsLLRgSfPAJAhir9BCkUrof4QlxmnOdTS2A62hzMAzU46svYeZPw1sTGgbX5
         JFXdYDSIuHVLBVuN1ipSnPi/WVfl4DVfji8hKpovxrNcxaDOwp0ET8nB9HO6oHQg2RFt
         KX4UVl048WnEw36FnrlZSrO8173mca5sKMrj/u7TIaJrD8gLJd9j7HxdSvF5Is3K+2jZ
         zUVHerSEgxkPtwuNdpbRDK/sSYnzoxVCB308wtkJHXkCAd+SyzRmuQWGGBTqqIEfUHK+
         0hCnm3uBWww8s7eLwQcKknigmflpVbNXkyNclBYRS3q1vJEYwCzERcU93Qwb3Fd7iWfR
         j/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585795; x=1796190595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0m3xJ6SKs4qbuy6HlPELsinPaGfttdr+a2t/1R0rkE=;
        b=JFxr7fpsXGZPAWa5QsEvqRJxA9skTK+e7caYHzA0P6i5r0dln6sM+PHISLXErt9kjo
         FueQvsAL3u0Y837xyRtRDWw5ESxa5vccIbSOaRiFgoMPyBv/mNf8vmSgo/flubYi+HwZ
         FX74dQG7twdnLFpOYhA2foQf+UuiY9L9aWDuJ1/ho9bGfXhvQp+Z8AiWkBfR7AG1nZdo
         77U7tPkeLuVpDXLzz5rUkZ3OM7N24OcDz2uqeyw7cbzQ77vr+9MMUO1xh7/EUL9nb2g2
         XRwHweuwhIDp/fX060INTohYa5JqiwyksWLeWrPj+JPJ2fv5hH74YtYM5S+EKh732XZa
         1/sg==
X-Forwarded-Encrypted: i=1; AL+hErHL8yK7NLfFNAbwaHuuG/Hv1T4q4nTOjpZJWVaTT0KV2OJAi1MBPq6GfJeaeiXnDXwczKWgspj5InSRcTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+00o29dmiTh0EdRFDKaWVtebOPcI68DkSbVyMOwUv+WWnGSndB
	CaAR0m/eLwl7WMhIQ9Oyrr5g467WfHT5K7em8GHwzJx2WR0DhlznVy8U3eI9hGvRdLwOPOi43B2
	/NYbHRzS/MkOa6omNf25iRkERrCHYVPyB3Y+cGKqfJg==
X-Gm-Gg: AZFdTZe23/fapOpjuPHNu5quU8tnoI0sftM27ckNbGkC83K1lR2vph7x9KamA9vHljP
	FF3MagNuGCFHVD6nGhRwhliR5/DwHIlXLzfXoDjXAPh3290F0zb1758r+YTjwis2iDs/bKqR8pc
	Xo2DezPeT0XclT0mf0h1H89KZsllajeVXUA+btRkEuCOgjO+s2JxQ3LZNBSPWKAP2y+t88ZkTFn
	e4mtYHEUlQJSDexuDZWI5V61OHGqTtGx09w3P+32GqK/qPikAsEAiskjf/TPBKavlK0oMmgxR41
	e1Q+iS5Nt/Dxyed0asYEAvVHiq3+ZHP5xpd83qTGCggTHW2I7DsylvF6bxnTayOybanhEnhdVdg
	U80kUBD6ooqEJYb5akU7mxFyd+Mv/W6GJZT2LHEcO+SS83SUxwhFl2dtjKnIlQFpU2HDjqNCEB4
	1j5WPkwZxO13vX9cqvWWNtu32W19IJ1hELHFvfA8hWlrhuHEKVXgDRw+w=
X-Received: by 2002:a5d:6f13:0:b0:4a7:a7d2:eb45 with SMTP id
 ffacd0b85a97d-4abb6d04777mr28721728f8f.44.1795585794414; Tue, 24 Nov 2026
 21:49:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921111402.120911-1-suunj1331@gmail.com> <20260921111402.120911-2-suunj1331@gmail.com>
In-Reply-To: <20260921111402.120911-2-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 11:19:43 +0530
X-Gm-Features: Aa3M54rM0lMmhvxe-VB9jSUcy69cdiFPwqZiJIiAYrdwNUAJS1EnS9yl8AAOxXc
Message-ID: <CAAhSdy0r1WzzK-0rik+qkofG6RWHw__KaYus7LTkGdF-4=fnaA@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] KVM: riscv: Age all G-stage PTEs in a GFN range
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Jinyu Tang <tjytimi@163.com>, 
	Wang Yechao <wang.yechao255@zte.com.cn>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 4:44=E2=80=AFPM SeungJu Cheon <suunj1331@gmail.com>=
 wrote:
>
> kvm_age_gfn() and kvm_test_age_gfn() only operate on the G-stage
> leaf covering range->start. They also warn unless the range size is
> exactly 4K, 2M, or 1G.
>
> The MM can pass larger ranges when batching the PTEs of a large folio.
> For example, a 64K mTHP range triggers the warning and only the first
> 4K leaf is aged, leaving the Accessed bits of the remaining leaves
> unchanged.
>
> This can be reproduced on an rv64 host with Svadu by disabling 2M THP,
> enabling 64K mTHP, and running:
>
> access_tracking_perf_test -s anonymous_thp
>
> This results in:
>
> WARNING: arch/riscv/kvm/mmu.c:362 at kvm_age_gfn+0x210/0x370
> ...
> [<ffffffff800c8fc8>] kvm_age_gfn+0x210/0x370
> [<ffffffff80095c90>] kvm_mmu_notifier_clear_young+0x250/0x478
> [<ffffffff80ae532e>] __mmu_notifier_clear_young+0xde/0x1a0
> [<ffffffff80932f76>] walk_pud_range+0x86e/0x1688
> [<ffffffff80a18720>] walk_pgd_range+0x518/0x17b0
> [<ffffffff80a19aa2>] __walk_page_range+0xea/0x580
> [<ffffffff80a1a422>] walk_page_range+0x3a/0x80
> [<ffffffff80931dc0>] try_to_inc_max_seq+0x520/0xe68
> [<ffffffff80939dc0>] lru_gen_seq_write+0xd08/0x1310
>
> Walk all G-stage leaves in the requested range. Advance by the leaf
> size when a mapping is found, or by the size of the non-present region
> at the level where the walk stopped. When testing the age, return as
> soon as a young leaf is found.
>
> Remove the range-size warning since arbitrary GFN ranges are valid.
>
> Fixes: 9955371cc014 ("RISC-V: KVM: Implement MMU notifiers")
> Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
