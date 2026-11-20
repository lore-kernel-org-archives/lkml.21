Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795209275;
	b=VW14A1Hb8RMStPsepxLAQyoyvuzGCrvJyu8voj+9KzDoSpJa1pjqVFVJUmpNa2MswxRa
	 fko/ofGW3NlZsFDysoAwZLn89VAThrwb4Ys4S5cXBQlFkA0DLd1wC1ZgUTJylM1ozjLah
	 XeXA7tWmIKQOMaR12hGaNbpZftH3wjXCEinRBmeSoDDM89iwzwwccPADq+1PGjS9jIEFS
	 Ey8Gg+zmLKDEZhldSdGLJ2Pmc6/ACVI9CfNNPyi96ecXogZ/i0ZmpUg/5/XayZ8Rbpdx6
	 ZlJ4P6yqQUWQSm05TVrvwYfagKGnwILH2Uy35N4uokX9pUFghizr9pcCWiicGkxBt6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=G105/EwTftSMSsJfJTgrHQWjcbh39Voo9ViZSiMzFbs=;
	b=aYQwTXkOSrKTCCa+ljgX5gf15OcFQkFCKFQ6+wWJD/Sxbk+uNwytRKje73AprLdBNqAs
	 tQVopOrzfmVygRIFFTgH1AGRwmJLCz+aOgxw2EXeIOxjVev/lFujGQ844c3cRGCmauPM+
	 8Q32BVIOcxcbHPwpaEyZ8pk6IdsXAf0naMYT2/Qc2YdykyG4y19pfzOTOd37eM2KLY075
	 H83dvbGVihPcKsr8w7dXGB4j/P//kmFxGmeRiunZ+nv4+xFH0cXI7nzr52FEZr5QIXTxL
	 xs+F+nnrESPut/ZHbeidabjt49jxv3VKRB+FSIyNkkK3paaOCmN98Jvgn4bSh9pMwAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P6SKJzZA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A85606A694
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A85606A694
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P6SKJzZA
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55c7445cf85so16251cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:14:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795209270; cv=none;
        d=google.com; s=arc-20260327;
        b=DZCda7cEes8iXCEMsMpilqkodXk2VY2EN4wwJBUIUL7MDtG9g5ciOEPxreP3tumWLd
         0VXP1qBB8Il5LwgF5k07WHhp9Kex4lmF7SOu9evV+ostDrmNr1/ilBbwXDekCJZ23iad
         I8HrtFZ7o7C6f9FLcAyHMoSmKLGiBvr7CM/IDsAxbd81KZOz3FNI+O9pcqazpfSnIOwt
         KXsFRthAT1At/bEXbS9m1MgPzX5uh3zjzQMDqD18sXIc5erJi0QObVtWU4QdbQ2yNeYv
         1Y0TkllA0dVlZUFGmUnWXSaKYMqKGBjDaCcWjZya9D3lT0gyz8sb8V35XhbFhfkUraga
         dVKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G105/EwTftSMSsJfJTgrHQWjcbh39Voo9ViZSiMzFbs=;
        fh=mvFweZ0q2A5D8RD+o+cRdPSqVOxQhoBXuK9zeBVZyhE=;
        b=RcxHot+oK1qOljGuzBAU1a6zIpZ6wT+jk7EY1CjGv4YIay4VkGsHiSommC3hKaGDr9
         gDQCjX6dy9wnLM0jHlxZtY4yABRbOrba0Iylnr4+6uW7yg2tAg5UiqxIYKMEJgSqM9pn
         1rvRWX1lChN1TuZH/WwL51NXPOanK3IiF5tTXxBpYHDGpxpZ1RvtNwGAdJrMKr4ndLJy
         sE9GEj5zV6xTflw7Yf368AdIDbuIJNw9UbUZhTVDsh07JRyDNvO+m3zM6k0TXFVFoqhE
         RU2rf53TCbrl6wlus39J+r3ZFvJbOmj17vGPveNYUyzIe20xz3b9iuCRpLNOT9Duxs9A
         Nu4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795209270; x=1795814070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G105/EwTftSMSsJfJTgrHQWjcbh39Voo9ViZSiMzFbs=;
        b=P6SKJzZAPmQIDqfA23YKnCW3h1m/JA2LEUr2DKycJlveNQ8OEkefFfSMr4vaSYnite
         uAlEaZhzdM4p/FfEKCK0IkANOklC2UzWzm2sNuoL76R6CFUrG43lxIZ6LOXOtXbB2Kt2
         0haAi4Qboao0aYxLBXlmsjo0dixbdoBUG8STLXtaYIlA32VqwXsE0xyA1PtNzq50dUm5
         6wIvFcOAvVmNWbuVFT6OojJdYXscs2kLoDPvxTi9FE0DQSz7JF0OMuDhZzJMLU4vzFYH
         DZGUhhKmdSVuGp1PfdjFNg1yX+d3Wugrxv3qiSwmqbzOAv2henW6R4ryCm+742GoKN0r
         MIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209270; x=1795814070;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G105/EwTftSMSsJfJTgrHQWjcbh39Voo9ViZSiMzFbs=;
        b=JytUfohMMvFEUmOaSNg66rCFzkyRPE6X0kkQPT8bbPCWe/GkIhjECHuaYCN9gN2wlp
         T8k0UHgSmmLoTa0SM19vUWxI/z9X1kR1m/3Ol8ntj/AE2ns4W23B4JAPhKWPMHxcVpHS
         hJv85b1HROmhAy3dS7Z0QkyzaHuRn1ZpGW1kFjJFCi80OKFXVRBKPrk4f2ATHrvieFmL
         cmrS/GzMrm/O1oKsM0GG5Wg0Dp/6vL19usuYxl+NjptXEwRgzz5pNuIxLDvwQvRHdtmg
         1fbHp1e4jqxzXtJzLvQ2spzGpY03mQf8ArRyIiNKkgQltT/LkiUCG7qz/KyiPkABRB2j
         O4hw==
X-Forwarded-Encrypted: i=1; AL+hErGbHIcBQxBJMp2GgZDhvmRVvSG0J3ayVZqdwKIlsJvskmT/2Gyx0jQn9vv6W6J1+JSbsxRmiAuXe1YF36I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vxcEMjN/TNys392mv99rspTQxOC2pcRMBwAbuDrZz0qJffbVe
	A9+wb2s0EX//RFFzAsonQuoKA25fCYmdKCgGHGLGSkYvnZoZ+GVAUyCru/5s5SizGdBCgcut0C+
	heLEPKKVNVlaq0mdSqdeHgq8BUF4cEEqsMCVQOONj
X-Gm-Gg: AYBFou1DCX2JE7A7namkBzOgtaXHMR0L7pXqqj/JiXV0DD5pEX6rdD02gtIyhCwZFRC
	33iSkJg0YJbYHXtvrdzPSBzifLffC2u40y01C6l9GzGMWlQ11gySsjlNWoCkMfpQvDUUUDQw603
	RYnC9A7XUlP/a9xFas1wv3M7I3sehz4DQnKAZby8/YI9Txq/YSp1Xlv0zV7fZMeOzpBcZc5W7j8
	IjD7ske9/Nt9j9hIoXvDPgJdZJ5nbPgY2Df1jNMTzlPO0WNSmxpHvJ8O1i52GgG3fyU1orwnq1b
	DF1EuN5oijDJk7tOl294R3PCEv8UWX2/Mw1CciHBMunyG7+Tu42E6CZ+GPpCyeD0/g76t60F8bB
	qPiOjAeqLSJF+uncC6vkXOplof1OpQ6C9W9lbgarwWxnAZtYmgviABccx1cqZHNw1UnOm9I+Vy4
	dTMCioOretkYXfsEP8UNw+R9pb
X-Received: by 2002:a05:622a:c15:b0:530:e335:4ef with SMTP id
 d75a77b69052e-55d88014944mr3792091cf.2.1795209269050; Fri, 20 Nov 2026
 13:14:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116071325.263682-1-hao.ge@linux.dev> <20261116071325.263682-3-hao.ge@linux.dev>
In-Reply-To: <20261116071325.263682-3-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 20 Nov 2026 21:14:16 +0000
X-Gm-Features: Aa3M54plrOc1jkMpHJwvUpjhSrspGdyrmpubZwGwGNbiFNMddwdSWFYtVtM3KLk
Message-ID: <CAJuCfpHOZS6mp_no3wKmU3-S4HKspnbriUw8Mwtxf3nmw0-pfw@mail.gmail.com>
Subject: Re: [PATCH v5 02/11] mm/kmsan: undo the shadow mapping when the
 origin mapping fails
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:13=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> kmsan_vmap_pages_range_noflush() first maps the shadow pages and then
> the origin pages. If the second mapping fails, the first one is left
> mapped, and the callers do not roll it back. The next vmap of the
> same metadata range hits the stale PTEs again and fails with a
> WARN_ON() and -EBUSY in vmap_pages_pte_range().
>
> Undo the shadow mapping on that error path, the same way
> kmsan_ioremap_page_range() cleans up after a partial failure.
> __vunmap_range_noflush() only clears the PTEs; nothing has touched
> the shadow mapping, so no TLB flush is needed.
>
> Fixes: 47ebd0310e89 ("mm: kmsan: handle alloc failures in kmsan_vmap_page=
s_range_noflush()")
> Cc: stable@vger.kernel.org
> Suggested-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  mm/kmsan/shadow.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
> index 0c88d89bf0d6..212449db34a1 100644
> --- a/mm/kmsan/shadow.c
> +++ b/mm/kmsan/shadow.c
> @@ -258,6 +258,11 @@ int kmsan_vmap_pages_range_noflush(unsigned long sta=
rt, unsigned long end,
>                                             o_pages, page_shift);
>         kmsan_leave_runtime();
>         if (mapped) {
> +               /* Undo the shadow mapping set up above. */
> +               kmsan_enter_runtime();
> +               __vunmap_range_noflush(shadow_start, shadow_end,
> +                                      gfpflags_allow_blocking(gfp_mask))=
;
> +               kmsan_leave_runtime();
>                 err =3D mapped;
>                 goto ret;
>         }
> --
> 2.25.1
>
