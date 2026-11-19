Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795088954;
	b=zBQIADfh5jwZprvi6kq+DGedTA7Dgl51wD4GvkEJOD391tCgb5Ae1qwCBpZ5vvhbzdoS
	 cyMt93CrkgLdq5iwtZQ17u0r5GZqP01m3m459bVt6fjSmrfhOxiGI5n0wwX8P7H4OfJV2
	 9dSarYO2xHCPXJIvB4CbUvpHfvGZFbJGYngNFDs/rIDZ45Rvccs7/V2O79XnOZw3Sv19K
	 JsmyIHozSdJ9OlkHpNPbtdrhsO7o+RlEU5Vu+dKK1WQdeNsRHxSRjcwnJxuLVnXAAjLCO
	 zRAZBTq7beuwgBH6wo/sbe0FlqAiHFz1tbVXTTA/x7/TlLoysgAO9grrn36Yk9trpNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m5JCdy+prC5WLmfZzb2euIbx/n+jdsPpvA3OvYZR0kg=;
	b=vs2qpew150BmGru/jb7wMk26BP3Y6sw2jHluznnzTrA72ad8mOEfXhE3iA22L/3Q0Tv1
	 eQyz7iEzLzkbwLqhvfSy3YdsCG2nM0wANRTw38+71mHyzbyjE7fmRqsSHzZ2Kae2Qdayn
	 Ak49Msgh6zdq/vBqxNirBag8627evcsbO9JqO9LKERW0QYumQhy02WzkRSgUIkegteykV
	 T2zv8TZdvTvCmEjpQCiBUxLHHXQM8q4vQtg9Fl8sJY0PSFYSGoGXLjvh7TJk25PIIt5cw
	 gVwJC3QvTs2t/bpjWb+xDAdDDbXO+FItIenXg1BI3cl0gjNXgwdZAjXannFNCgWkZZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fUdb8TI4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861B2606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 861B2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fUdb8TI4
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3adf89523d8so3041481fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:49:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795088953; cv=none;
        d=google.com; s=arc-20260327;
        b=JMGYm0He3hQyTosY/E9EbEsQFxJwWF4V29ywO85pJx0MpLiCAFtT2xrzufbUW//hZo
         rl4tdU2K7COv7YAC9X37mGERURD7KcKvZZC0pvmONY/BHYygbA0P41wsUg16fpplu/D2
         WmHseKOvDfbxBvseQYbgnllQp5euL/G9f5oZv7ub+O824msbCn3ynO3li8LH8aY75mAW
         wBZwNuxytp/qeh1WihC2vzLJXu1ATb25G2FXtuAL97fuMImY4guNMx/seS8Gi6S7hfTF
         rVo4XxEXD+Dnccw43ovrh/Gy3GhADmNSgomte4z6jtXyfHUlTwmww2pNga21Ugg/5Oyd
         1iGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m5JCdy+prC5WLmfZzb2euIbx/n+jdsPpvA3OvYZR0kg=;
        fh=fy+KEDdsJjf2PT2B9YPflZMFVR+1eGtD+Ss2ilG+iWw=;
        b=p2Q7b15u9rGw2PHLrqtFDOJkP0RQAJdVqSRN64iZlcJxxYvnyB7/09+aiwuimxa+hM
         Pqvmqb14Cuzmgc1upbkrzSqFdhKfXFYMY6A/u4x5FTcihIzR6GVnx09RTZ3wQv10A1JG
         pbVLB+Bl8pMhX+zlvUWvv8y1w9f2faofUIdRKicIUae/YVqVebxFY4ZCn9m+99JAaW/4
         O8YlZcA7USw2hI1ZF2wuoUAD7vj49vS7UeiXTg7r5ZQLtq+wdOxs0cDrIZ+aOEzlaxg4
         ruw4wjQjzxVUz4hdendUy1VFT655cG0v5Qq0xXjBmDztGZTK4APWNTyOQpCfgGL/XVKI
         iWtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795088953; x=1795693753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m5JCdy+prC5WLmfZzb2euIbx/n+jdsPpvA3OvYZR0kg=;
        b=fUdb8TI45r/JtE95aHTR1w5KYIMHt9jbmBjUlntNkVudQj8V8HCcEFg6VBX/1akI1q
         cEsyZU1khC3qKgF2Q5gTANUPfpB1GL8niDnw2XKDsgwbRuGjZ7SLg38y0OuL0UKYQdsS
         AZMW2nWiMyKNSpMdu5DTs2w6lAlP7YT+fTpA/PNLaPnVBpm6EyyFsrOuv2k82G3mdi7d
         wfuNUoxLpuKOiuoEnZ7l9aup39V0rU8pIgmzSt5IgNbOvw+eVe8+S2bzxh4Iu7xTzd+Z
         sLmQeJg8emMboHxELS7TmDp213b6VJa91zUW/46XUSz4OTZzoBuyljKmMLouejNGI0Ih
         Fc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088953; x=1795693753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5JCdy+prC5WLmfZzb2euIbx/n+jdsPpvA3OvYZR0kg=;
        b=PVsCNAMfSCMbJdqvnuFxPufyS2cNTDFNhRFwd2kLNc2lOWpgr43fm4dbKFvq9fhnnC
         hdKKEI84P4u1UH2fSOji5Kv/7cRhOhEY3JlZlk589gctZzywcg/gvVug3VsGAiRTbizy
         VQVHXcOqe4T2GFgAbvGeffTrEIUnQppllQR7AFai/K0NcPyiDOl2H6q/Nii71rx6duEa
         FMcejsctW+HzaiCyKFJMVDWzrqW14v4a+kv+xUhXkqkGo79Gp28ooRUzP1rM2exa27Tp
         Q58n8i5sf+y4q0Xul/nnbefG5mlzAw1UTUHcFa0zPV+uar67OnMpYvqZ84tFPwrFwUaA
         VQGA==
X-Forwarded-Encrypted: i=1; AL+hErG/nbcgdByZ9bVWNdYkdIKHthFup6ktImGpIq+7/osqHoIOcBJE9xKmEPpLTM0eDLE2FaH1tVPev8q/QdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eRq4kf/Jez8BZkWoLDkuTg3Fr7av/3uWFmJbend1i+Sz1WM6b
	fxgqnYQYb7xaeLGbf3MvU7KbJpIe4W4VUxLmnSewdMR+lb0fXiAURF1kQvxmSIWVER/xxhOKUcH
	+dxrQEqwhqur0jIFVdFpJu57pnOID5Xh/Fz7+OLM=
X-Gm-Gg: AYBFou1JtQTAKu0QPZZRx8eY607KnENE/U+oFkzUDhPJ9oZFUxpbh5Gb0gERthHpJ2G
	NQeXVtBusu6+l+keGQ0YJMbm8t+bzzrLp9+EfPMCGHbCWFWM5ucmDXIjL+eBhCsBPY3cYrZdE4W
	Rj4y9GCrE6cI8aPqfFzAn4soNSpZu2B3pNaYLvw4BLTzgHX327JY4DLY9v6OmEq22UmcVD/zSwJ
	bw56mxlA7E6FHYA1KDetyrK0Ttzq1PLYsKNz2pBYurv4Y16IygB+BlwMikYQhjrRYVAcmecY3CN
	biNcSuDyzKCwMmiBC/anCwoUEXkHr/LIxaqEk5vRuLJijRma2/7D3VaxrhWtCUHhkODPutu6V3o
	FdMIHO5QYnfVdqKJzFzg6i89qVjG6RkKpG4w54gqCPJhWTdajGhot30Vn1VDXn63iWVDwlE0ghz
	Ju8b+GOvqkzxmCA2cc9g==
X-Received: by 2002:a2e:a00c:0:20b0:3ae:11a4:22e8 with SMTP id
 38308e7fff4ca-3ae6709dd77mr16529231fa.1.1795088952382; Thu, 19 Nov 2026
 03:49:12 -0800 (PST)
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
 <20261106113142.706783-2-chenyou910331@gmail.com> <avRotoTK1Gt9MzAX@wyuan.org>
In-Reply-To: <avRotoTK1Gt9MzAX@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Thu, 19 Nov 2026 19:49:00 +0800
X-Gm-Features: Aa3M54okjAbOEj_05oVJxNrc7LA7w2MsSPgZgTIBGiScGonxhAvZNmD_KaK5owI
Message-ID: <CAKspUhKNVoOBRiXxu3py2M=d5uDCjwFL-dWyt_fCTVKxusSMvg@mail.gmail.com>
Subject: Re: [PATCH 01/25] docs/zh_TW: process: sync 1.Intro.rst with the
 English original
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 09:08:06PM +0800, Weijie Yuan wrote:
> I'm wondering where the term "=E4=B8=89=E5=AD=90=E5=8F=A5 BSD" originated=
 from? Sounds like
> machine-translated to me.
>
> I checked that wikipedia (tw) calls it "=E4=B8=89=E5=8F=A5=E7=89=88 BSD".=
 And wikipedia(cn)
> calls it "=E4=B8=89=E5=8F=A5=E7=89=88 BSD" Or more specific: =E4=B8=89=E5=
=8F=A5=E7=89=88 BSD =E6=8E=88=E6=AC=8A=E6=A2=9D=E6=AC=BE =E4=B8=89=E6=A2=9D=
=E6=AC=BE BSD =E6=8E=88=E6=AC=8A=E6=A2=9D=E6=AC=BE

It was carried over from the original translation, and I agree it reads
like a literal one. I'll change it to "=E4=B8=89=E6=A2=9D=E6=AC=BEBSD=E6=8E=
=88=E6=AC=8A=E6=A2=9D=E6=AC=BE" in v2, which
also matches the "=E6=8E=88=E6=AC=8A=E6=A2=9D=E6=AC=BE" wording I plan to u=
se for "license" across
zh_TW.

Thanks for the review!

Chen-Yu
