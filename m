Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795019018;
	b=hJpLolD9e8V3X1HKvWb6S/i/3FovjnG6E9uIOFJaYwIX4V46E1aE8gju4n1o1mOkfbJo
	 2TDsESbupl8ecr+S2/0u98U+fIgrrJX4sRLbjsHy+i8L7H1MG5Pw3eUnzVpYrtlJT94Uf
	 fP/9bWg+E1ZRUqLZUXctP1XdJoXsCMc94MMdKFHi6rQguwZfbsivcz9Xot8/G2cEY6TD4
	 4BCn1BOAQ84PDva0OTd0tpbt+jpa6Z22CzCa/WvNHdorZB86F+ib7dsS0r47YAWs3hN52
	 wc2bCN9wx6ED0MZ+Rek1JLgKKWxvkTz408sMwm9ryXV85VXdRXKFvADo4ktF5GrViiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZZL6VyLlbXFZof6UXR0IX4gvKyFon/J77+MT2G4Z9M0=;
	b=kJhNYdgbJkO5IxuLm+7g+iBG2wt1T3QWgKjp6Ivfxf9vHcaHdN631aXl8wMiZevJKv7G
	 UuBt8bnvykBl6iak1tYmpD/coxsII5fIyspE9wQopWsx77x5JKfQGWsgX25MPFyOGhy6R
	 0KgoUrdtKbHfU8JlcAyaqBVhkd41SGh4Jm6o8dh7aqYQpHd/gGGrcPbNlkhcahXWDZT85
	 T3qUut+GYBxg/OUGsAtHCpEwOL9OzLdXG0XYma10aZasUfKrjeYQ8KplCJd7AIHAcz/Kb
	 4mrUHjFFE4tabB+RzhMjuCfTJmviz2aqK06TBgZ6UnOs8Fh/lW0HHTwC+JwDX4u0u/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WHOIrJqz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5AA606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D5AA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WHOIrJqz
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a210470b49so11391505e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:23:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795019016; cv=none;
        d=google.com; s=arc-20260327;
        b=ErGflKJbZpl48vjeQ5suWhwW4EHTdsn7pVNFvw2TnaUxf1hqgWKkeMAzdyV4yciqZa
         pnTzcVdkHRtzflFcKUlBinwGRu2pfylWQV6kjJA1lAmL1LILEv6c06h8FzTUy7KQNSRQ
         PcPCnIVm69IR8G18eG5JcglR5A/cVqIOXGmjLgHE1giebIlt32t24AMm4vrWMnXRadrU
         mFNGdfO8Weegeqg567uD0Q1bSweGY+Wsoi1ltX4UqDcCNb31I3GzX6D4b0QcCnwCgnsc
         f5TbgqcHiohAK6ETFiTlwbzFo7Tk87RrGvDqq//R3DtE0mEvwXufifyMM1OKebqVh7FS
         iUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZL6VyLlbXFZof6UXR0IX4gvKyFon/J77+MT2G4Z9M0=;
        fh=GWx0HMjaJC9R//dglWUPOx6fyJIX7ai5/UQnB7KzQ7o=;
        b=pksvTeYKRS7qDb2W6QGycSGG/wOrIEEGP1jWWOJBgkbEVDP/s6zv8aNQKYAukpJ8qv
         c9nEic+59LmCwqo7TWqfX6qw/dT3381l7GuP25U/3L7rqGFpyW6NNmhPacXDvYdZqd7L
         TzcHoESS0Aa5vEj7ySaMmA1jhl7Jl8GPe48H48J8k7EBGbXdE/96e8pClAFqWskaaA3n
         BeKufsXgMjadjehamadrOLllxfMSoJXny3zpPEUyKL+KN6CsmwkzHyciVp/9z9pSYNEY
         U70GDeHb2QKcjwKDgLH5oB2G83pj8bRjRfYQjH1dr43scBvcmCF99KQQKQvSMBQuInQI
         MfIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795019016; x=1795623816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZL6VyLlbXFZof6UXR0IX4gvKyFon/J77+MT2G4Z9M0=;
        b=WHOIrJqzbZ4onJn/wtW840vKnvsFlAgrptZhoxnYa/uYUYNd7ueyBmyorKWFor2yXU
         4SQ4mgoh+xuXa2ZF8yBrIBC2voVxUIhx9BM+S+/ru8EWeam3FVzyJ2hczPI156otlCVJ
         A8dAlNeiyJzJkY5whssv1EPDrrgAPEasfuknaQXKwHHA0Gc+TMbp2A2TgdHGrw4g6MaO
         H/M5WtbkNh9PR29qlKiTTW/xS2hqv4tFXbzPyU/60j7H1Au6T2SGr4RJkH1kYdKlgrLe
         BMs4Q23nohX26XfAPc0xPhh/65615tQpHFh4keZYTQjm4uy9sf4Lt1q5UExR1+kbmwoN
         lu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019016; x=1795623816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZL6VyLlbXFZof6UXR0IX4gvKyFon/J77+MT2G4Z9M0=;
        b=dYxJEmMAsNCFLSFnXwu8V8yqHqIIt4EQE9LnNZR6QIGqe12Lz8KZUUXMSJxDYVleuG
         +Z9/WV1LAdkEczNw/+oXGsqr8VF1oq6CUqnHpoAsu2SiVwhYD3jKdv2wir4CtmxZKlfR
         81Ln6qDtzKDrWQ6CEpPRThFXdPkDbbYduFLBIrEpBrqFiymuoHy60t1wIZm1DCQAQCh8
         mN3MTHo40aEwts2TizvFqvMQZiugF6PEGhoOnggvtODxfqgGNXOGsqIiZX1NrK9Te5NT
         JH2x3LtJfcb4NqXrPtP6r9EoOw0cmnGz1WRYj1hh3FAM5fuYIrqhj7TeE6/txdz0f+h8
         SR2g==
X-Forwarded-Encrypted: i=1; AL+hErGB9X+b0xRxHZ1K4o1zvSax1VFGCOn28t8qc54mfwjtAioJsuwCg5xtwzk7SyENj+iOKB+kE5O6ciRd9SA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jy8vQMU6QD9tY/6awXFnzpoVdAKni3PJw0cAMg8FTnyuD4ZJo
	KTbmBDXQLxAS7kEq3jIGqkm+te2EKCJrBd6qV0VIZLbQ49KjWlfF2bCjHv2XypCMYtD3gW2kRxb
	4Kcr1ivOY1ymgIOTRi2bUjGz7qaen2Go=
X-Gm-Gg: AYBFou1FHnNev8dmL3braJR7rmvwaiLdMBbIkuFxiirsuHd+iQavRYzWShFDfxd0HEf
	1/g+I1AcPjZp5ZExW2CwSeBkiuo1goe6a2iteE7MAVYNVJdraUIQKyyhzRBlTXARfqcX8XT2WZZ
	cmQqq/kuQCRUh6J1S6+SlB4R6vBIledzNW44T/c9PCktKlIYfg+pnwXNQO4X+zuCUnpluB1327r
	l5sELd0fSMzKAd0Ov4VwPaujLzDa8HR5HOCY6S6KWcR4YngJBtDrFUWVGQpC5nF+zmGSKNjVWNE
	Erjk1nnYZGrH6w0qLohs40+rKyyhfOwyb3H1G45jM+aKslDAxJ/S2G3Ya9F+VzgdYzIR3d2FL8u
	njeajlW4EwnduVkLz4xIjoIWQ55G7PRQWO9fDARh3moyevey2gUTiyj2O0qwmmrOqMpVeCOo9lv
	wyzJ7jkbG9LiwfNtbIE466ysj6wHoyWGU+DQ+GqDPywenH4ca93zI05Y0=
X-Received: by 2002:a05:600c:524a:b0:4a1:cd83:b23e with SMTP id
 5b1f17b1804b1-4bb7d57f5ccmr65127875e9.0.1795019016429; Wed, 18 Nov 2026
 08:23:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-unused-sym-mm-v2-0-2f845e94dd50@amd.com> <20261117-unused-sym-mm-v2-3-2f845e94dd50@amd.com>
In-Reply-To: <20261117-unused-sym-mm-v2-3-2f845e94dd50@amd.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 18 Nov 2026 08:23:24 -0800
X-Gm-Features: Aa3M54o1d3r4VOyC2nXueP0BXfHMpFVW1L51WNF9Ut6r4bdATy19jLSCJyr3yhE
Message-ID: <CAKEwX=N5v3Kyarttmxfe9TRh-mf44hx2kqam0eFzg1KYQcaEgQ@mail.gmail.com>
Subject: Re: [PATCH mm-new v2 3/5] mm/swap: remove unused folio_to_swp_tb()
To: Shivank Garg <shivankg@amd.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:17=E2=80=AFPM Shivank Garg <shivankg@amd.com> wr=
ote:
>
> Its last users were removed in commit 0d6af9bcf383 ("mm, swap: use the
> swap table to track the swap count").
>
> Signed-off-by: Shivank Garg <shivankg@amd.com>

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
