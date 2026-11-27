Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795766983;
	b=NRqTzee3N5HcnNlzMoqXfxgmKcYyWPPRvETgZkfwrS2QNsySC+rJ0lTa24WXY/LaEPp4
	 5/bxlrOgB5hU0zHdFmA5JRf+ocCb8sHQf2WkvwMRjUGT7P/JqExHspi5JuL0Hw6+CTPUh
	 aTj1bJBZ62cudJVdkbqE/n0/mD7PyMyQVgxNVgVL686ZezJlqnWd1cY5tSH5Ohmo//YhY
	 Ip1m9cYKRHCjwF+NlVHFbHXSF1V6N/FiiPtxEN6OBhEE928QyQ+ESCa07VKu0dLd7cUKC
	 tR2hbGHQDz4cYdkf91kyjuKk3UNTmrJRPV7ARXfY1zvb7f8RSGGqhG4MgwkXlJTBlXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lfAZ+eV95Jshg9Xk+E5kfkX1skkeC9iTSDENSIQrVdQ=;
	b=hmdk72ayOBvSaAR7Kw73dKRezApPrMNLC7l4I2hjyzQiw66JlCiogo9leGWUUPgj/deD
	 lcOionfpz04H94eeshYDR+4Fov5abKkPg8JMC/mHDi3ylvYGwUUYZ3+evnNxYPEigNpGR
	 NxvYvyg2TrfSIA8zf2pIoYE6obgEHZPspzkqBUA/6UYEItrL1YApjAFzvA3LRLdbTuZDD
	 5y/MwxDDk2wPsb3EOphzrThFd6HLYc6tUyWD2bR0KWyggeCJUvZNQfSAY0nyZZrYyg/Ao
	 omTVYokAJkTh6Ge7ZQqOCb3PsiCIj2umOOBPGEwJZxPa27SYcTgLNnUzieUc3pIM9ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UJfo/M9Y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D2E606A686
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6D2E606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJfo/M9Y
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b28d9537bcso5010815b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:09:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795766981; cv=none;
        d=google.com; s=arc-20260327;
        b=ijcoeVdN8qi1TpbQioJDqBFSFgrOBRmBaKEBPGA/QMh9fpaicUXsDlrC/yW6YmgjYQ
         /3qkLMu/avgHEEr6OCA+qjkHehpt1KqZNVYQ7SFxCukmU/1+f/NnKr5OYcIWQjNQ4xkd
         HMR/nglQPMNDY8ageEDUnCfsYYPCsC6awwQFT5tWIm4cpfUEe5c8IytEz3wNpvUZVcrB
         9awqGMlRvtaRFIo3HZTwNyqSxowuWu6wamJoJayPwq0eObFhsc1RlJfrcpLem6Z5qdsL
         YpKv4BU+Rzt1Hv2To0Q+Qe6JGaswR3mNAsarSR/SLbnVw2MywyLxV4Ll2YvVlYeeamdM
         H1ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lfAZ+eV95Jshg9Xk+E5kfkX1skkeC9iTSDENSIQrVdQ=;
        fh=h0WiIkdDSV2AseVknkg1+josArTVyd+sn9BwzwAtu4o=;
        b=m2bCnGsjnqW/8m+Qz/Tu+4C7cheO9/C/E0HY1bVX2EhXrw0+vH9oZu6Ph1AZNElP4C
         g7F+CS+kpGHtMlpib66iGWsAsscWKHs8L75YOd8owELMNgDe4EgzAR457cBhWkyXEkXu
         P004dt365TMt988WRqIgVQNTfnH9q397uwajORM11xH+xvUNJrd3K7TxST3cz26YKY+N
         /j+RSploW9qp9xhPXQjUJ3JHq95kU1vE3gc+fVf+KPAIhef9yYmqiEp76EeGGz+I7drg
         IeoTU0B8W89GbaHKcCMCmksyATZ0SrF0KhIHqCKLm1U1mzCxHf+l9GI2wKP1/8ZqHdJB
         uKqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795766981; x=1796371781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lfAZ+eV95Jshg9Xk+E5kfkX1skkeC9iTSDENSIQrVdQ=;
        b=UJfo/M9Y+aH86agR5L+WdNAthAJZBgv1KW4YobBsiUHeT+8DGstD3A9sa8KmEbAD6D
         2/wVonWaFRqXqx5jFQ79Lb0+IqD6mS70s6tGB+XHyzaOJwmvwalQnxmgyDqOlTNqSwRe
         N1U3kwrgZHkw09myz5Diuf+QmYXI6OhMr+ADY5Pel+gfP9pnMAq32CSNZCdD5rSM7o3T
         gCRoJjVC7qabX1Q6sYeQkwvd5YgM7DdXBY6E139+zfhTlCWNNKFEpbpEYuyWk9YeiZTC
         RW7GZv7g2wX3QdW4UqwmxBsbvQGsMjDaQAXXFdIVR9QXglZ5bINkcnfZgmJnCe3+1+fQ
         Rdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795766981; x=1796371781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfAZ+eV95Jshg9Xk+E5kfkX1skkeC9iTSDENSIQrVdQ=;
        b=kCej3Z2RAZnYkVEmA5SnSLHynZpdCX/Os4rC6qWvN5x5nJT9geedCvXTRPgYNnH/8q
         MeQ4ZQNs5BjLu1auQKtiqx6y57NbKVkm/jOzMrTY7YF0ELZ0bapZMlUbCpOLfzvU1JYa
         4FstKzvJhdKGGhhKpFwhPY7mj8GmBwbZjOx8v8pZqz0UJzjCQBPocN9+rWIQY9hdL5/5
         bsI5at6CNk3tQirSvJfnBap/07kg7v9Epkfp0gEoN3ME7RtF970iBFJ/Oa2/xdRSbsVE
         dJCUJIV1OGve6PUTS8+0DeiOSMqBrIZHBOwkGQGMYvCe6gMq3gf/SrIOOWuheOe83oVV
         RmmQ==
X-Forwarded-Encrypted: i=1; AL+hErEHJcH1Bb7j4plwLpl80PWDehoF+lN/EUhN6bO1w/r+qBYdZY26pLSuXUcvLskuzR+I8ieNOhBmbMO20wc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PyEyBVD+PqKB7veawoVkFAOseYrP//K56znCfKDDk16tQCZAB
	/iTQ4hRGvNVoQuGTm66ROgK82x2PI8mO+CyAowQ9C/ViMVrxY8qpkpR+DYVXUR5A1lRH3vDhSpC
	LLz3aqiOlw6BExl8AQnnE8XWHLeKfF5U=
X-Gm-Gg: AZFdTZexJuWqw4+Yb9g/SA7Yeiw23OGNqACBAZc9qZxZrocXWyGMaY3qyH8if6zG9XA
	UtzQoMHVbkRKZcx4XobY2a+LpyLzscF1P+zYoFQ/AEUJUGCzaMYhtKZOjIYDYomJ4AEGpieeGIi
	6EajGGl7PXYf3nTbfgzEjlWWsIJTrVv6qxIl0rF9C4dH1o6BT2DktUyv+NRJ2DAA5mlyp6069+i
	qGcGJqan6HVy9MiDJadOme9tdABuJmrJ92XCgt6AndH+fLtL8x4cf7FUNYh5rNXNYYRVeFSf3Pi
	8fryFcAp4GY0cRV9ovN2+HQg0drnkhNz8QBstuLZdPtPJt2nppoNTBUPl9+DwdpcPnhiu4tdNFP
	dWbyGnr/mxAiEI9xmWddd1v3+B76bu0FZPY0JyJ/uIJAvi6Vcc49sUnmiKX//jyW1fs5InGAeev
	mB80QWwugoAidttoUQgoPNH0Y5Yky/CB2ez+Dk
X-Received: by 2002:a05:6808:250f:b0:564:57c3:2b28 with SMTP id
 5614622812f47-57a095fcf70mr17846706b6e.8.1795766981639; Fri, 27 Nov 2026
 00:09:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126231706.1303486-1-sashal@kernel.org>
In-Reply-To: <20261126231706.1303486-1-sashal@kernel.org>
From: Ming Lei <tom.leiming@gmail.com>
Date: Fri, 27 Nov 2026 02:09:30 -0600
X-Gm-Features: Aa3M54o9OdJEVwey50VSDsmvCuHgnyt-id-FpKGF0N0f936dbtzbMBmFg508QQA
Message-ID: <CACVXFVPGY42hY9qF9485H49xh_ZQm5nPEU-hX2gNVeJ8QBKoiA@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/ublk: use the configured kernel UAPI headers
To: Sasha Levin <sashal@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Uday Shankar <ushankar@purestorage.com>, 
	Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 5:17=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> With generated headers in an output directory, the hardcoded source-tree
> include path falls through to distribution headers. New ublk flags and
> structure members, including UBLK_F_IO_DESC_SIZE, are then missing.
>
> Use KHDR_INCLUDES to consume the headers from the kernel under test, and
> add the headers target as an order-only prerequisite of the ublk
> programs, as nolibc-test does, so that a standalone build installs them
> first. Baseline builds fail on the missing definitions; GCC 14 and Clang
> 21 builds succeed with the output-directory headers and target liburing
> development files available.
>
> Fixes: e371b9d3368c ("selftests: ublk: kublk: fix include path")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Changes since v1:
> - Rebased onto v7.4-rc3, where 3197517875fd ("selftests: ublk: fix the
>   build and file offsets on 32-bit") touches the same lines. No other
>   change.
>
> KernelCI's kselftest builds of mainline 9437ee8b6cf6 still fail on
> kublk, metadata_size and ublk_cancel_ready without this, with gcc and
> clang on arm64 and x86 and with gcc on arm, on undefined UBLK_F_* flags,
> struct ublk_param_integrity and FS_IOC_GETLBMD_CAP.
>
> v1: https://lore.kernel.org/r/20261014200144.1364828-1-sashal@kernel.org

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming Lei
