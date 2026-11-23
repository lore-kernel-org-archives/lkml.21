Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795460783;
	b=KWk2NBdI5i+u9BulCN9iBVnx+7iFAx14sHzf9xn7k5nYMKChROKe0faPOB84UBxGAdGL
	 A+Bb8y8aK/GllsCVsaaoo9bxLsh156t3+2pOR/0KTHp1hKC0N72oNcP3PZshsnYqyajg+
	 nMTNugrmmRkDmL1QnoC7qLmxasR/4Y8RprbzX2xtfFaiJ79RjHSKPEmIkfGyy84a02FG8
	 wyOee+EvBSErgnN7F9QlmmelB2YktZLGumIWdsMLw0lgEPj5dG96N4qL8zHWvem2s7kmv
	 Ab4lOxrknnalQjyGf4El2WTOZNVc3MxGaIxyi/PKZfk+b3ANE/8JF+Jy1afB4KxDUVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZXMGETsC9In5OHuZKA5+0j1fdxY6lC4P1HFXTVDB2us=;
	b=0Kz9zGxcYDbfWYRK+E9rbLSzz5kln7GhvAFbLWXJIundLvpKYF3lakcKZThM2usPDPZl
	 al2vjpDNf49y7OApthlJYHNShowY/Ptd43ibcRDybPA7IYVpBbZBd0Y51B+/3WHN5gQIA
	 mWiLCYZqwEt8PneyQfclARlHsRzWnvbh6us0ZrX5bbe0O0L4ZDYU2BMKQx/E85HbfjI+T
	 FZ6qI6zNOF69GWYJ3vbq7Z/eApERIXGWX47/Nu/UaidOHYKeZoUQ0B1C5mCBFsdfF12PA
	 qLEHxOjGM3TjNt3H+oEduzPdbNPy7dk8h7BviQS2jSHZMSvfSqUw7w0edVOb25SxHBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yG5ytjDk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E740B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E740B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yG5ytjDk
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67db763cec7so3793330d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:06:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795460782; cv=none;
        d=google.com; s=arc-20260327;
        b=iX8NDE76PwrWTZSVvQLA4HgGTqEZ/pQQGgCmj6CE9m9YaIcLLwe4vbKJmWl1cValwI
         +Pjvu4qTOLVcbfW07aq64I30kD6AMtWJPOxuX/dh3/a9Rs9eLVuxiegXQtewdCp1cqWm
         ibtIZoMLNMbuU6Kn+7Rb7PQ98OjvH3tGsIyq4Wl0z4/J72nd0OOm/v93i61qjPl4r1pC
         MjtUWqbE8BfL3p61gXn7tbuJtBMonh5rWSAxQ7XRCYfYHIBRVZKHXco4LdDkk/A0jOU+
         nPU59XgwzvfWI1WDeFBopAZta8Z+FS+wWWQXhGu7IMhbSBW9aEpljT/jIccXsUHoawMl
         4fpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZXMGETsC9In5OHuZKA5+0j1fdxY6lC4P1HFXTVDB2us=;
        fh=ghoWiRCzC01pE2UY63kpqK7WDYK43qL+uTjF6ICCGgw=;
        b=j6HPFUkpclB/GP4GQYfABpTfwyXp7A1V7pX9J4b4DA+uq5LJxqZAivjhzFOEpvfcEx
         phJjlOAgcZdB9YxW3Y62/iCnWd6V41j5W0GrgM8M/eB0kNLhWkObPBZD9TjNqeQACAc9
         9ugbLjs3Hh8S6st63ffA4dhcfguz00h1JNC0rCL4xNC+seyT2LvVTL7haZm/3ZI80tkM
         AR+OE8fkPeiCeijxcsKQemKVGLQpLe7VlaiBv0lE53InWt2fziuUaSVckgXe+ZugAnY8
         XNjxE3NLyC7X9fwy1SrNY3BRrdM503MF5iedAbNId1wm//yXuKHjcexnnIgJbluraHyE
         LIfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795460782; x=1796065582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXMGETsC9In5OHuZKA5+0j1fdxY6lC4P1HFXTVDB2us=;
        b=yG5ytjDk3DBIOAAOhEEJ7a87ul/fSrNc4i2/k3//e5lkl5CyATwwvG15RJuHRs3Iwp
         2o/ln5eQbsqXJ0S9URzbgrVgrMVANPn9G4H92UEKcinFuKe6lsZiE5/SrpXmKLvJP+yJ
         h+06e8/bM/OytbmotVwaGrgWrBkEIr2JFIBkFRFtzQPl3zjvgBdu+3vPSoD7hKKfCnv+
         8I25rMwBxDJd7UaPMjjn7QZxPPvrLEF+ACTEVd1XhqGNYCGj6qj3IxmoJpucaUDwIuOU
         9iKyyiCb/WOic3G8LJ8L4X+Km3BCUtq9v7hfUcVtDtEO5S7F5XNXmk4xb9XxMa+38Vj0
         derw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460782; x=1796065582;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXMGETsC9In5OHuZKA5+0j1fdxY6lC4P1HFXTVDB2us=;
        b=aZHhyFJU4YglgERFr7mJkzpomVNjr3QlsuNARpLIO2e7OdBEaCvg/NDMAOmVYoj5M7
         cHaJ7Vg9ygvIiLghPsYzfaqvHSBsQG/yJOFY/R1Kw2gRV+ckgCuVhXVxrHxJLZyJxuRP
         3illJhJr9iEEsr1JwQvlG18hfcejCex2lusEVS+iBnVjtlLsbNQr/D45QCG/spqvq9fZ
         nGfNBlyf3xJxEkfPFc8TngAuuEGg7/yTBZ/SNFgTr+IgKniiy1DS4r2ZMGmMpTXGcRLD
         kw+bXhdO2RrAflO7uGHt9QxFZr7zb5I/DBIhMaq30W11hJDMnI5jJlURhYRupSlvCOYq
         WMLA==
X-Forwarded-Encrypted: i=1; AL+hErG12WpcnobxuoOmzKBePi6XAP2IuHS3HrM1fKq64ZHnWZ9NIevf4i/gMufswGnXIaoaJNk8+tafPav/cWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x+9exZxFI6Kj1uRuS1RnFUQI2NKiyBuH+ksgVwnlFNpnXBD82
	iqR0bTWSFEuo8M7d20xu2myxiipAkn3wRPpCobp/wCisfeAuVA4Qg9MUc66BrkF9leu54992HIq
	XOP8g3Iybum+alDIqG98kKDBoY8tY8FA=
X-Gm-Gg: AZFdTZf2tdQGoV9Lq/E55urZ5ORAiejMR8X5oolhdOqutPOMmbbpbp1iouVSZwfxUiA
	ZcAeUHmCl1Imr3AX7MNfeOlAHJflST2295pDmTMBGqO0UGvXkY8XYvl1OFmhr2QD7YWoRCw5v8J
	8llNfXjMG9urSCb2mBTgIp5n+Sf6DX+LRqntQYFb9vYSYXJ1YlhilQjwUNkgcbZstbEBGLVnVTy
	oN8nELr9SX0e/FTVtBeZ04E2qmdv2/uUII/9ml3d8/psmX572cIJEUD+mFwSZvCGQ5ipfVv6D3V
	dFhXk2UoE9x/EVirKkR2Y9si+DqNi4t3h4U+sttrs4HmoqJYrY7sTs3iOo/ExEVHo8TQmgycm+H
	+SuuyhY5i6nq6nXueNNe3yF1cBdMkfzley9TNmJg2RuOkjFsRuCUdszH6cvSn
X-Received: by 2002:a05:690e:168e:b0:67b:f3b8:aef2 with SMTP id
 956f58d0204a3-67df4425a32mr4425732d50.25.1795460781865; Mon, 23 Nov 2026
 11:06:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123085351.3415122-2-thi.zirnstein@gmail.com> <20261123085351.3415122-4-thi.zirnstein@gmail.com>
In-Reply-To: <20261123085351.3415122-4-thi.zirnstein@gmail.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Tue, 24 Nov 2026 00:36:10 +0530
X-Gm-Features: Aa3M54q7qggItqO2nWN8m27kiDXSWPUp3jrrfb_cbuCo6wTR6DNactR6aMlLEKg
Message-ID: <CAKfKVtFDez0kDJp0Kx4WbJ4BwqV8-0hb6eeRNjQ8YDFm917_UA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] i2c: i2c-xiic: fix waiting/clearing while atomic
To: Thilo Zirnstein <thi.zirnstein@gmail.com>
Cc: michal.simek@amd.com, andi.shyti@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:25=E2=80=AFPM Thilo Zirnstein <thi.zirnstein@gmai=
l.com> wrote:
>
> Use non jiffies based waiting functions,
> if in atomic context.
>
> Suggested-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
> ---
Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
