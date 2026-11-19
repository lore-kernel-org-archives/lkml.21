Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795088987;
	b=RzAmw68inTHYN+FwWS/w/IxuTfb9LYJ89vQ79QXSj4n+iCmkppJ8kEfcHr+VVUiX8lZV
	 a5AOnQoErcCBOi1i69FJH5FLNxqIh8zigi44OgKflCwn/XzOEOknMTjIrJD0omuyLdCa/
	 pqRotxxHmRt14cx1E6eR77IeigOiGJ5hy+reGB3Lae7irkRiRdmgakO06KYLinomCrWQS
	 wu+Xd/0SkZqwT0E1U6QDtfMZSeonEa7NZMX2Cd3W7N3EHojYNAy4wFpTZ8wj9E6Jia7M4
	 bLbHTAI35rs5ws3blEcOsOJDi3poR7s2pw+6CutA/+NKn80itnEIiTHsP0+ibC8g1aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0v8Qwz2j1gJFY6/8JHaQ0pCMABY6UQgwRHSnLdGgoSo=;
	b=3Z/McQwRMhw33pxn+BRSRXf+kGyBGd/LJrdYV9berhIPbEC936Vw24gKShH3vtB/8LU4
	 OaQyZCitVNGxRbh5VRXZ3GQHSA2hhIvO6vHf5epfGfdB20GKyVCfxUf81weYb5Qw1+c+b
	 v+w88qetCzBf2nvArdfi7dMwo8szbL45GoqAwURmD6vssRfxGZBsTE8FbFBJhrWyTM8qv
	 qlOMHaMQzBE88bLaD2rHZdJDtxg/U/DNwEcaHu7HYlVQtuIb0Ye4nNs3nLSVr9akdjr3d
	 WI54uLzwSeEwUxeru6fP6JVgTL02LWw2BX1OomSvhK1Ah/Nit4bSUAcEz2L8qSPHsqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z23fiON6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9208606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9208606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z23fiON6
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ad3ef75223so2416541fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:49:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795088985; cv=none;
        d=google.com; s=arc-20260327;
        b=QqDA+Me4nKFt865AM0b43/pwRQMloEGnMIPxqlWYroNDJp5+d+EP2CYt+mAw6jk9rx
         eGQUdr8CLT29erylv+4/rIX7K8TBjaRdnS9t1ltQnTBnkAtMaxdgiP6ZHiWZDe2QN0/t
         W/Kjzo+f6k4qO9g0ztvc99VEoHwjcKs74EMOsEurOzjRWrq0fDz70N9QCawzlebzl9wS
         ZEf8YBKRA9B1Bp3pirHATpCSSc7Hh/PmujtjJxJ0otBUvY9DeWxeD29l8Q3jHMzJukL3
         nxrKKgmXug2qaMUzP0aB8sACtMKhBsmWN9eKAoIdK47EJrklT6oRDlDohpQeLBQPbRlh
         4AAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0v8Qwz2j1gJFY6/8JHaQ0pCMABY6UQgwRHSnLdGgoSo=;
        fh=gGd/GRNbjLiuQEi07bwDB6V1hYvbM3mhmA251TTEL9o=;
        b=ALFOHRDhk5YeRI2sQTwXnFhpldJ/aC3fV7XXnkaLF3ovwgXMUsLbnoSPjQL/gww+Lh
         rBFPzNks3MfjnTxzJgH8qr4gBonJqcA8ILegENNl/Q484runyIbEcvA1WnEmkKi2c6IY
         qs231u+ZFEYuBb1pXX5FUbgKA2XQknOhDvqu1UpC2mlR7RCLi4LGPFwzq0TCniB2Aebh
         I2xIwc5GBlJ2Lpn+iQ3S4GX2G+m96L8ttS87Na6hd2ZXYAiPKI30giLLMs4QoI42+Qys
         wxpLIfwZbuO6Jw/sWZVVOEuvX1vkzMZRG5WtmOwCXWl+s4uQhZHa7sIcoPNgE7mG75wj
         BPbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795088985; x=1795693785; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0v8Qwz2j1gJFY6/8JHaQ0pCMABY6UQgwRHSnLdGgoSo=;
        b=z23fiON60VDqRZJVWbZ1efJNn/LOmgGSb3qJoydq7gra7IPdLTFjElS8MzhzTZk3oF
         ATDPMr7JAZiVz4J4GvNGB3fvZy03S4txliQw9YWFLb5oPjuhZp3VP9Rdv8ZC00pwwROV
         KmXIbyvdPtGeMsZNUQLocoIXSzxG8Yq//8OdahAWyfWrRtUej3dLXmrQ9uKNwlTX/E7b
         Tw3oXiFldyOl5oIzWXrt5ODq54ExhLvKbMNId7hrPsWODYp748RFqhbF0p/oNJveRmMI
         55YF/caa1kHgv7ZU+4zhbPDOn7S18N7AtZfWHnjfdojffeySUOTDoagmd5LW+R4Kn0q6
         2vAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088985; x=1795693785;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0v8Qwz2j1gJFY6/8JHaQ0pCMABY6UQgwRHSnLdGgoSo=;
        b=voApDqpKHSp+1pleHy7pNticZHWy1ixjmYCyk/8m3NFXrxJSlW6yeLmvJS68NpMqg2
         JRLp3EYo4pgCseAaWkZMeZYNZEJSAz0n0IkvtgTAFS5oq/q+ET8vEc4DVL4FAB4Rxd51
         2nOuDq+Hj7LKx+76qugpn4XCs9SHmokdLoCS3Sj/iawyyjApC0bsxje/9kIrwbHZL0Tf
         zdewNygxKWQquq6l4S18MNGDPRND3UDrreldBrvq7pTrdXs6kPyTBELM5OmMjdAs8COf
         3Tzu7cCBufudRCsMsdRWv2HNP4zxhqBnpZfOEmfda9/hua8I1KH1Bz1J87C3eqrhqPBx
         WQOw==
X-Forwarded-Encrypted: i=1; AL+hErGO2eQMXQaDJZ8qjYX9QfjYWHTsJlmiyOdRRu5AON2nv2bA7SZyFdW7vjHhaMNKhr9uH/tDPsK1XQeNq+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZJzODuCVPpyCC0kAUzIfpRpHsBQfa9Wr2NCly/MML0bz+Hka7
	mYjia+pidulBnFr6PHQizXwbaBuBJO1lNaMu4LR10Mu6P0LVv/XeyJse6sWv3RbhYfJUQb1yuNG
	QA8G/bXQZ1vIDfMycmpZe5xb6k+vr5yM=
X-Gm-Gg: AYBFou1tPXQXCrmXSAfThH/atLbnip0OxoIWfXeA++8s6qP3CjJc/GSLUi9FE8RI2H9
	qI6aqyunsUXfR1P4LTZCVvqUDN7qGWpORO+meoSpn45mUSlTqPeyvUZw6z/qQaAImTOsKxxpxBO
	QTeAASKIEA+KUHuGzuBki+CzRGpuepxfurNXGd1xl+CBpSO1/vp7zFVD+L8HlO8MjM2fTJkj20p
	0JzdevEhx8a3z7yet3/o+fQSTHuXhr6sU4nHzFSNvu8ssG1n0j8tsG9le0wAI1QHusrlW1NqI0X
	Rlz80AHRwg/cKe1dzqqC6cY0W5XfWZvxKyVgDrPiZ5Z5fDbZ6nlNKKFNT0hOTwxN1LxGat6vOKe
	JGic9wBPiYmbyrMVUFZARfIJesg7gyQBVmNu/NrSMZOOLZ2E+Y/d7+nG7XjKaUto/65Dm9t0Pk3
	KQppXRc+Eo7R+sWFAAlA==
X-Received: by 2002:a05:6512:3a8d:b0:5c1:57b9:90b2 with SMTP id
 2adb3069b0e04-5c1a9bfdecdmr2184343e87.1.1795088984723; Thu, 19 Nov 2026
 03:49:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106113142.706783-1-chenyou910331@gmail.com>
 <20261106113142.706783-3-chenyou910331@gmail.com> <avR8baubOL7Aoeh9@wyuan.org>
In-Reply-To: <avR8baubOL7Aoeh9@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Thu, 19 Nov 2026 19:49:33 +0800
X-Gm-Features: AclHuK9EM5hdpbT3TNdOeN-dnx4idoMkonl-YP0dj0CdZKOeHCEG-FJzfj6Fq-U
Message-ID: <CAKspUhKRkx_UW9mep2h2HuDy5Rj7OwurdsmEe6+1f04Rv=2YWw@mail.gmail.com>
Subject: Re: [PATCH 02/25] docs/zh_TW: process: sync 2.Process.rst with the
 English original
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 10:32:13PM +0800, Weijie Yuan wrote:
> The Enlish version uses tab here, not space.
>
> Is this a big deal that requires a reroll?

You're right, the English text uses tabs there and I expanded them. The
rendered output is the same, but the translation differs from the
original for no good reason, which also makes future syncs harder to
compare.

Since I need a v2 anyway (see my reply to 03/25), I'll restore the tabs
on the lines kept verbatim from the English text, i.e. the URLs and
Andrew Morton's quote. For the two tables I'd like to keep spaces, as
their rows contain CJK text: editors and docutils don't agree on where a
tab stop falls after double-width characters, so tab-aligned rows easily
end up misaligned. Does that sound OK to you?

> For the label thing, as discussed before, let's clean up after finishing
> our goal.

Agreed.

Chen-Yu
