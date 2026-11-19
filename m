Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795084412;
	b=S3B0oRJAqcl4f8ebx7LwgBBWfCtoHQtx5Gf4X6bUuXGOYJpRT8g2i+IbaX29YPPO9MiG
	 4Chi52YMMqcJFt1Wjl0yTQjqsio3PK2KfzAIkOKr5WVAwkdElvqWqZAY/UEoWOTpPZPlk
	 ovIOQ6CfgqhZ7ku8J2b4Dgw8WrxhTmaG9wHcfTybJQRu90HiimoMBbo7tMfQcLieb8uej
	 xcuT5se0DEGkhVGiGARJHCUr9nn5XYtncB+sl4mL5GIMQaoERVbeejGVIdaO9G2Qlz8kz
	 LXWPOP9LEKA5UVPy79GXAW2fzJuI14jOBIeD4UDo2oejv5E+U5yC6h16aXtJH0xDVNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AbhIExdnNVQaXKmn5rB1MANMqxiDuTToiM/aLoPhPik=;
	b=azSx3UHdemLH+zzqDlnsNp9QkGa657z4i4pVfHZisxwHk3eU/14DGOjU0pr6wEcfjZXG
	 t9BiebAXaNIgehQxYaZz3aEf22jO3nvEWVtZSFBMvLsHHuCjY54OeRR/yMLNVg6/hNWO5
	 /qAlS4CaWatWD4VEwyWP2YyG1H35PVzHwtUawNH0eCesae2P4lAjD6QZ9aTlK411eIjdF
	 0T9GbcFuYqqxtf8EB3AdaJ9TukLuGQf7UEZf9b3MoNNrC1e+s0NK3oCKu78hTLKiZGBWp
	 hDE3eRtEGat3YfRb1qgkRER5alEFqynlPCM0CYgmpahjiNk53RZzmj5c97D8UAlpQKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WF7znHpE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFAE606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAFAE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WF7znHpE
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67bee1f693bso1728367d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:33:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795084411; cv=none;
        d=google.com; s=arc-20260327;
        b=juJZ4qT950FfPQiaEWhuda5BNSyufgO0/BomMqW4gLsXPHoehAigYxQCCuGOVXrgdW
         dKAMNlYqrkelZLGP5Hg1D6++nDAxLX6hfuN4K/i6rb6PEeTCwAUCXT75gdLbTdmXIV+J
         /XYuJ8hW8Pn4L7SOn1kOT26fjneaHqTTdOW87IC7HmOn8tXyG4cG+GdDuOpBGtHkbZYi
         XRSpuY/+/FSwhdfT7kDhqpYU4YtI05aUZfuCHjIeFNv07TDS2gjQU1dyXJWfwCZEnEqj
         O7m8U1QjVFwnGYIi5rshYs8TLZc80mbg+SKfr5bGtkMZGwWRgQz0gnr3rR2LwFGdb/Hd
         ZrUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AbhIExdnNVQaXKmn5rB1MANMqxiDuTToiM/aLoPhPik=;
        fh=AB8WBw2dMGY2+TWRV15ELunr9FjMGOF2IDUC+aPPGlk=;
        b=feGXvGszZEAycbtLJ6TpfEt/nD00/eNO/JamX4TVf+IG4OMQMwq6QaNx9prOeDbhOK
         55pX84pDEpOUdE/N2eLKUex3o6BvFNSR/7xg5fa2uJZ7i72QmUFeI0F8deUporjsvXom
         2gEv5B9KWiciF+9KgBSGwjAcfvDmK9JDGmB64S8iez/r6ZDMHgHU02TaTF81HHKkk0zR
         R1CbxqRbTiCIjW2VYigGsuanJE7bfPsaTvjP2yb6WOdky4JcrCPwyDKao1iE8BBAwR52
         EUQjRFg/Q7e31hl8P/9sTJ1QDTpKUwvrOEtWhPrANVndpG3VVHivWCkg49t/QB7ppKhT
         2WQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084411; x=1795689211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AbhIExdnNVQaXKmn5rB1MANMqxiDuTToiM/aLoPhPik=;
        b=WF7znHpEtnLITfImXXyBQWaWCTlZGspYO/uGV3nr57Kd9NBsgCQJTlJzhpa8/EDG4w
         RP0VL6pJ12W6XBup8IsM6rbt1LnVsIy0279Idnk1E9+U9lse2/XTWiLm6iLWoDGj0rvd
         tAyRfXMkFe6lZ2qQS4969UZMvB03IQgQY756bKS8LsfewnYohZy4U8Gpc+80aUOrLlxi
         AbqDXroR7QqJsC/VvlP0ZGXCyQGf9gIWjSMAfkfbTeaIA8V13wKccLQumqPeWX5Eni0t
         HyrLD5CZ+4N+xBt+/ODyZR+DbGvE5ieySq6In+gmM+2eKvTeLGLPtjiCjYQf6Z0r4XFD
         gSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084411; x=1795689211;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AbhIExdnNVQaXKmn5rB1MANMqxiDuTToiM/aLoPhPik=;
        b=asswxOw4hYPbk+6o6tt0oGtXHU4oMlGb6fRtAma21f5QmzQF0EA9PJNASsXeJvp+Ua
         Cku0l5MsiZ0RaLg7uHQGdNiDoLbVkBpRSZDccrAjZDmMMPZ4P+IEp9x9Aiq0ry1M4Wdk
         UjKyIr3bbOTVcMoYkfutc2upcl0cpbBp4+tdVud8JTPSB+5nfAUpuxeUvG3rHP82dg4O
         IrQHBimZes4b7BlGLB2IqoKArGJCc+P0kFaQfhsi8i6yimZs7/vc7KYnNofMNwC4iwEM
         E7vph765SmTgkXJ/yneSnSaQu1eC91v01TJnVQWDO8ZESeyVnk3HhuHE7R+40A+jXMZ4
         qIBQ==
X-Forwarded-Encrypted: i=1; AL+hErHprGBWswHB4WZhbhoQuwexmK3gsCGxW/WzZufhYgxCdGGqwHqTMbU+n5EOvNGiP3Zb9w0y009imQq0tKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wGHwFsyK+RWT9smYNtFGnDp5cR6LLdD9S/40AV6+2YHaUOY26
	Z0E48QbaoyveZhON7RcmMK0/l+oL0+GXV36J/Wn6+h6zp5pA0G6v8ZpFYaShpfXg+X8URdH3Ygw
	XkdfWwSPVTDTi1TJrzVvyucwNeGbPhQYv3rQs
X-Gm-Gg: AZFdTZeJhAA0iSgYXeIScrOcSwSQ1ydtkBx22xz6Eq4QkWhz05MOJ2gq6kJeHhh2koH
	6TrMejdGuXdLFVKVYvwjioA6rguCZ0yEK64d4jv2GW9OkfsWt821AgcZji3IqL5NTQbs2ppYRPS
	Lt122ij7OlKdBngaNEoK2JpP1KgjcF+dHSA5VgEqkcfR5YzFhwQvMqHiqiQQIglA/cdSryVVuaT
	qkYAuDtSaOUq+3XIi+OgKdgXrJz4h3wLSm99zMl39aftrGKaKfTX+N27XMjfOWNVjHKejbyJE+O
	rX0hFlfWBCGmbhP2bWtVLYASzWHxBMdxg69nQixfFikEE16F1UvLIPGJRiJkNBZCD2RquB1HNmt
	Xg/L0Pj0+F1f2Np1T7aqB925vGhwUgxmga1mQf15ASRVk1aYj/Ihs6Px75KZj09YEsJD8ZQ==
X-Received: by 2002:a05:690e:4145:b0:67d:e4c3:d850 with SMTP id
 956f58d0204a3-67de4c3e795mr1296491d50.80.1795084410833; Thu, 19 Nov 2026
 02:33:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115082505.2012573-2-thnkslprpt@gmail.com>
 <E9412813-7A76-46D0-94E5-0537E9FF5DB8@suse.com> <CGME20261116134536eucas1p1b30ea07e1a1e3be753ff25a653be59a6@eucas1p1.samsung.com>
 <609175e0-4e1c-4130-a9f1-0cfc7815c134@arm.com> <05c05ec4-b321-49d4-acf7-b9fa4223dba9@samsung.com>
In-Reply-To: <05c05ec4-b321-49d4-acf7-b9fa4223dba9@samsung.com>
From: Avi <thnkslprpt@gmail.com>
Date: Thu, 19 Nov 2026 12:32:52 +0200
X-Gm-Features: AclHuK84_rag6BmioJeNu-IKBL4AqRWRqNEzc2nSn_WJYtEjEDMmHtXvraCuXx8
Message-ID: <CA+jvY9GZGhAU48dquqh_qZj-vDShXmmO1zXX8EZf-OwAWQKvaA@mail.gmail.com>
Subject: Re: [PATCH] dma-debug: Avoid uninitialized hash traversal in mapping dumps
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Anthony Iliopoulos <ailiop@suse.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK.
Will do.

On Tue, Nov 17, 2026 at 3:35=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 16.11.2026 14:45, Robin Murphy wrote:
> > On 16/11/2026 12:09 am, Anthony Iliopoulos wrote:
> >> On Sun, Nov 15, 2026 at 10:25:06AM +0200, Avi Weiss wrote:
> >>> Booting with dma_debug=3Doff causes dma_debug_init() to return before
> >>> initializing the hash buckets. The debugfs dump file is registered
> >>> independently, so reading it traverses an uninitialized list and
> >>> triggers a NULL pointer dereference in dump_show(). The
> >>> debug_dma_dump_mappings() helper has the same unchecked traversal.
> >>
> >> So the debug_dma_dump_mappings() issue seems preexisting (the risk was
> >> there since its introduction in commit ac26c18bd35d, given that it
> >> doesn't check if dma_debug has been initialized), and it is not relate=
d
> >> to decoupling the debugfs init.
> >>
> >>> Skip both dump paths until dma_debug_initialized is set. Check the
> >>> initialization state rather than global_disable so that mappings
> >>> recorded before DMA debugging disables itself at runtime remain
> >>> available.
> >>
> >> I suppose this makes sense for debug_dma_dump_mappings, but I am not
> >> sure we need this for dump_show. See my next comment.
> >>
> >>> With CONFIG_DMA_API_DEBUG=3Dy and CONFIG_DEBUG_FS=3Dy, reading the du=
mp
> >>> with dma_debug=3Doff triggers an oops in the unpatched kernel. The
> >>> patched kernel returns an empty dump, while dumping with DMA debuggin=
g
> >>> enabled still returns mapping information.
> >>>
> >>> Fixes: 173735c346c4 ("dma-debug: fix debugfs initialization order")
> >>> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> >>> ---
> >>>   kernel/dma/debug.c | 6 ++++++
> >>>   1 file changed, 6 insertions(+)
> >>>
> >>> diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
> >>> index 36c1f7cbb2ae..2f487246d8ce 100644
> >>> --- a/kernel/dma/debug.c
> >>> +++ b/kernel/dma/debug.c
> >>> @@ -543,6 +543,9 @@ void debug_dma_dump_mappings(struct device *dev)
> >>>       int idx;
> >>>       phys_addr_t cln;
> >>>   +    if (!dma_debug_initialized)
> >>> +        return;
> >>> +
> >>>       for (idx =3D 0; idx < HASH_SIZE; idx++) {
> >>>           struct hash_bucket *bucket =3D &dma_entry_hash[idx];
> >>>           struct dma_debug_entry *entry;
> >>> @@ -576,6 +579,9 @@ static int dump_show(struct seq_file *seq, void *=
v)
> >>>       int idx;
> >>>       phys_addr_t cln;
> >>>   +    if (!dma_debug_initialized)
> >>> +        return 0;
> >>> +
> >>
> >> I think it makes better sense to skip creating debugfs files altogethe=
r
> >> when debugging is disabled, which was also the case before 15b28bbcd56=
7.
> >
> > TBH there's probably an argument for just getting rid of debug_dma_dump=
_mappings() now too...
>
> Agreed, remove it completely and register the debugfs entries only if (dm=
a_debug_initialized).
>
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
