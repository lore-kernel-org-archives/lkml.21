Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422078;
	b=weMJR9dSqluElkTvlD5zvRxYQ+pfpFzyvN3MiKrp6u7MeQWzZRLD7nrQoAIRBcbhWIai
	 SkpPIxSPOZGud5ddJ6jYe3v1BX58PY4Ypde8FK+BHjyoOI7xKhLVWTQfCGFZOi/IbN9wl
	 H+wGxMRvLc5qCtmk5r0B4/hFeYayfRiaIB7ntHo/2gZQ2xwgyCNHJ5vqFJX4EI+dB1rlS
	 8xDEe/pudGaldJVuODL69o04zVpyARAOwmcxEvbYNAEhLdwZRDR2I69VMYOUTOWpKNXVs
	 GxzORbSpVV41VTSfStdIpc7tLxKAgDFGYjHUwaqFBjrhKP9dPuZ1usL7W0MBT9QkilQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422078;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=urV9PEPwEvrHK4qayGYwaVV8yhJ/QEoLReqAK4fiRYQ=;
	b=z2wk9gCcX52MGMcJjTLq7VwStijeR0KEicgcZ8CpuXFqUhgbO91T3UwOlcOdjQJKsBrx
	 +xRhmd7N/M+MnndpeqBFUJobmy6rsJ9wHiaojN74hzy59MbFaYjd8ftSulO03gk5vxZ1F
	 UlfPhW/hxy7AWoCLQuVFrr7RoVZLzdrK6bupKjKmIOZ44pv3aVju/fnJWLziVTbeBEZol
	 XhvR/ZLwk165LWZQfAAADh0Wrv46GsKaE4JLGz9noE/7RVKfLU+S8/kV2w+2Ax+3kWe5Z
	 /ZEVYvTee5oCXYS1KKaXey7SASJV5k8oKUYuP/hU+A1X5C3YOq02Z2/gsiKDEtrEBNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7219606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7219606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ee36376a0dso1754543e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:21:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795422076; x=1796026876;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=urV9PEPwEvrHK4qayGYwaVV8yhJ/QEoLReqAK4fiRYQ=;
        b=UIMR6eu/FI4HPzVxREH4oeZWTzvEjMHfgw+IILzlmZh5jHn6zDY0LIMqwyQF35iB9A
         6avAX4JColhkvXV2bBALKSfE+gr/O/OMTT7g6SEi+ILDUgnOyePBTzzQGKJ258d2UU4E
         rVLbfW7ak4WHJy1oNxJ1DSm+36GAyUuatkSCAnvfMpGiJjERoVQHjG9mCqHpjVxMSF9R
         PdVahn3YqDxV1o6YQiP6SZW2QFO9G1Ntz0Qs/nNqMjjvYTbxjSvZ70PNVEy8kxLVzZx1
         0RJsjvlYM8jBpiI5hojq6EfglkjZGWcI2qa2xNVPSnbKXESRfNQ8F7UVbc3Oou9KGB3O
         86rA==
X-Forwarded-Encrypted: i=1; AL+hErGqO2ZtE7AKzuVMmOAaNiZt3xj3ktUFGL4XH25XFMwavEIRCtH2z9vM33K53Jx6urnoUldaGkdvLbyXiRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B+Nzg+k0gMhWguo/gfvmmJtbhwjRMjP+l97orTRA6VSWZg6aZ
	h5qSIe51YEgne2qd1a66yQEoYdgOTAF1pLGeLgVVZ4F62SlIAmDc2SviVuYgIOj1
X-Gm-Gg: AZFdTZf2ALA1gBxZT9sXhM8jzh7EGr+yTqsIaFN5OjRJIJ9aLipGWq+ckqHng0dj5+4
	4fCraZA8pALL+rDRcXlQlne8tRiFhJmXapKLICEVg5MpsgZyeqvFNeR0BleSaus19L6uKM8OVI5
	r7RXObP25uo9dQj3ZplQePfrnKTDocxTxSxLt3mF5rxM+fSz/6/+PfpyFv2BjW0BFKPMpZluo2f
	q47H9bFHmidYTfNwcsqz2AJwTg1q1cmc8TdB4a3CAWFkRUU8/M965WmmgVqJ3IKWwixPhNOMnLs
	dChlte9bLCjGeLOAwDzt6gIjIThHO1Ea2Zz68XXDSTp8AKGMxMS7ducH4tWD9jSf9AB3bskJ+/q
	JTpp4dS9bxcyJaedQNMr2hQPobGoCwKWis9tOHYYW1hb3iipWSNGQJlWLHFvQkQ2M4GZ2v2YDIN
	aU+hIPpqXPWS6/2bAiPHLr/byM4cFEkMYQWIBfeXWC5P7wpgTO7+Zh6IHd44SbQGmzIWUXHRbx1
	Xopyi4zBFlX0nJ0Snl5qscGs5n8Xq9eXDZbL1yVAL5wyNdPS1ajzLYXqnRcq8+HSdD1iQ/VXrr9
	pmhVJVzUrJc3Gq37mabHw558oEq9Mio4wE8Dxl3a7GI9o6jLbWOaCflDxvK4Le4JPtU=
X-Received: by 2002:a05:6122:3d10:b0:5c9:c60e:5cf5 with SMTP id 71dfb90a1353d-5ee8af2e0dcmr5862586e0c.19.1795422076493;
        Mon, 23 Nov 2026 00:21:16 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b556db7sm9891756e0c.4.2026.11.23.00.21.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 00:21:16 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7a6e560f580so1947920137.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:21:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH5NHOlSsJO0L8S8IqcN87HQiDUDmFL4tucwJa+Um/1X951xh9auUt9TP9yOHXRvPeTgb4jXrbXPYyFEiY=@vger.kernel.org
X-Received: by 2002:a05:6102:84cc:20b0:7d8:869e:8e54 with SMTP id
 ada2fe7eead31-7d8869e8ec4mr1539357137.7.1795422075752; Mon, 23 Nov 2026
 00:21:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122160447.519889-1-zihengw03@163.com>
In-Reply-To: <20261122160447.519889-1-zihengw03@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Nov 2026 09:21:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWxC7LNy3MTNYE62AoWBB6sHm9jKAsYKRjrZ+LfHjArtQ@mail.gmail.com>
X-Gm-Features: Aa3M54oDJAacN4ZgRznlESFwii2fz_UdwV-FQBJ6wD20kL1ynEn2pjnzqtgO3U0
Message-ID: <CAMuHMdWxC7LNy3MTNYE62AoWBB6sHm9jKAsYKRjrZ+LfHjArtQ@mail.gmail.com>
Subject: Re: [PATCH] scsi: 53c700: fix invalid frees in m68k driver remove paths
To: Ziheng Wei <zihengw03@163.com>
Cc: "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Kars de Jong <jongk@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

CC Kars

On Sun, 22 Nov 2026 at 17:05, Ziheng Wei <zihengw03@163.com> wrote:
> NCR_700_detect() stores the allocated host parameters in
> host->hostdata[0]. The m68k remove paths instead use shost_priv(host),
> which returns the address of the pointer slot and causes an interior free.
>
> Free the pointer stored in host->hostdata[0], as the other 53c700 drivers
> do.
>
> Found by LLM-assisted static analysis. Cross-compiled for m68k; no
> runtime test on the affected hardware.
>
> Fixes: a16efc1cbf0a ("[SCSI] 53c700: Amiga 4000T NCR53c710 SCSI")
> Fixes: 8276b58af4dd ("[SCSI] 53c700: m68k BVME6000 NCR53C710 SCSI")
> Fixes: 506c7bbcd9bc ("[SCSI] 53c700: m68k MVME16x NCR53C710 SCSI")
> Fixes: 45804fbb00ee ("[SCSI] 53c700: Amiga Zorro NCR53c710 SCSI")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ziheng Wei <zihengw03@163.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
