Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014380;
	b=GV9oN/yHXFDRNpgfwhxM2FGdqClBB70MTXkgiZ6r+rPupJ0Gx+MUNDAaNqS0d/7fzgDF
	 tr8vp8YZPuJ/82C+tzIYqncpzGet87xEsSoRirA7S3qwkjfsVo81RlAjbcnbxy7xfGHXY
	 p9jqzR7j4h3rrXoRu+QBrCj2aUW5n+n1I0dYWkwaC9qS2Ho3gGNsEslVJVJpWZ4+X/fza
	 0LlOQsq/kGsDrLZD81gmMCPh11kZoQDb5bTLE2o2B6zspxNjNqRzGsMnxrLEi2PrK4YdX
	 6Qk7/hE7wJokqGJSyrbTyQFMHnklaGOIjWUnezwszFo1hClde9ffMvbFx+WfjA9pYnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=tKPUcQCwUJ0o16oWcFk1SSJYCflKgF3hlVLSRCArcVc=;
	b=VFsN11/SKuKWHYqbJa/DJmuE7xo/mR/fwYf1Uu+fDgcga35up7tyVlHOxrvffBxLnIRp
	 BYcUpwNFprTpv+7PXMlC8XeNEOsPGyFcwnUOsC/gyPpdr9pqp++SxlBfNsPHpvt29b+tv
	 8stk1iWgXKS22IOYbxSpBZss+Tx6VaARwBHLfLOjiYb+Lv8BiHd6ThpkzXzI6BjMIZF7w
	 soMc6uDySsKc0bNvJx1GNGeIsF7e29rx/CFF1zyPw1qLFIYrCtIwh+40mwJY8vr0HVsOE
	 7sowLEGDkK/2Ur2Us3XLpDrczp4pA1NFsbUjzk66B6j3WEM0GujlSukvJi6gyQcl8DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oazsg+Kk;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA6E606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FA6E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oazsg+Kk
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-381f65e4e4bso1797991eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795014379; x=1795619179; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tKPUcQCwUJ0o16oWcFk1SSJYCflKgF3hlVLSRCArcVc=;
        b=oazsg+Kk9ACdNFN3l7hy2qrJxFy5DmqqWudZXT2Ok3anHQMm83IXM/en8tYt/ko5DI
         YIJsIWv4Qxmtotwhu8i8Zaqg6jleeUeXuNwDX5NleJJKFaFf4I+kkAdN9/19ZQqwf7Wh
         5mA8AI6yT3WG5bCugUx8bwYrQVOvYWZ000hGFMXwJr9kLJ//tp3XsKDgtQkLJEEFkhRa
         g6KbCBxFVIgixRK2xvZWa+dQPi5dSlPOnSkO6Ro3WOnKtdngBVvK/fiRZtkI6ICpESWM
         bhXYH0UbMWTWdpKmwSE78M4yJ8yWSsJk3rZZrzekB0zlTVPfHMcPR2duimRPtlIIochU
         mIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014379; x=1795619179;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKPUcQCwUJ0o16oWcFk1SSJYCflKgF3hlVLSRCArcVc=;
        b=y0hBUKjBVh8eQpyBIdQ35OqBbiv6/ojfWIMPANaB185/YE0euAUwOfG4zUKm+sFuKo
         N+JaEoaiFslPW+wKQPzReTHr84izOvP1r1JCPCLEOzPVsLARyBiDxFUcQJAKv8CGTFNr
         FHLTegPCJBaVjg7fKOKwa9bVo/EdpshcpEq4QzGH/+qALvqvpTzRttW7YusfxkAwQAap
         cbmQBm5Yx4NXX1rrXAHhqgIF7b3LJO7NoPBRiHnWflRX+yQShh05RTtIywXUt6+LwTjk
         AIpDjLNqhkNVcUsCpBbmjS+GLvwHQbbDisoNrGk6gexM8TladCUIGeSv4UkqMPwuBvVF
         YcGw==
X-Forwarded-Encrypted: i=1; AL+hErEcFHmhVv0O2tx3xo79AWCstEp/logOwrJe6I2CNx46hsT1rfNBswNwWdoonsFDLbgZ+Gj/22WEuXuSFas=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dTZoKiHxX0W11IIU82pSX04yZMUsoTk2b1A4ZodNMMuKGiuqF
	klhktM+m1WIOr2Jwt76LJ4mBTaCDnbcryeUCUwxY0NGGWRV9t1yhzRmE
X-Gm-Gg: AZFdTZfmn7NtjR/B1HkUfAQ4G9jfrpQAP58RFFYoAAe9ZPWIfQnKS1JFRELMgW1gp3X
	szzR0zyOZY0rnF7Mf0ZYBgjkrL2LWK41W8I+IMV2eUS2broL/f3ISblA8V8eMsOhEgLCUhVewBg
	X4GgVk8SBl1G8jKRFMJKFkKdnFDU36X9VU3PG601NzGX7xRlTifwG0/X6ZeaXzLgGutAo/NooD+
	skqOvX2JLBU0sTLYlfC0A2ESVSIlb9prEXzrZWGi8ayNtQ+Akb17I+2rID3KxDQR/7fnPYBscpq
	DgEQnzerm2CoxRhQs8NH90JEKWoQFxPgW2I3l6AxpauZ3asLJkH7H7+Lxu/uIUzW3Rw0IB21N/L
	Ujie6+Vz67an8zmbSl6TfzDAI/3086Lu9mpBSIZrx+hFvQ8Qpo8ISwpu2aUeYRNwzRST8pcTTlT
	/TYDEQedQH5ZolIBfhMq7HXdBhdXhfqVR4qobxSfPhWWoaCeFEyVD5DCoPHk3DeT5aymPtlxurU
	wsihkTHbk7JmCBB3bGnF4uRS5qAd4DJAbDH1MQe/fw+2+sfefg3sYb21hp23zgnqmaRpm0=
X-Received: by 2002:a05:7300:cca9:b0:375:dc5b:4400 with SMTP id 5a478bee46e88-3827dd05a5amr2957513eec.1.1795014379070;
        Wed, 18 Nov 2026 07:06:19 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6df02adsm9897638eec.14.2026.11.18.07.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:06:18 -0800 (PST)
Date: Wed, 18 Nov 2026 07:06:18 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>,
 stable@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net v3 2/2] tcp: fix shift-out-of-bounds in inet_csk_rto_backoff()
In-Reply-To: <20261118144249.358481-2-jiayuan.chen@linux.dev>
References: <20261118144249.358481-1-jiayuan.chen@linux.dev>
 <20261118144249.358481-2-jiayuan.chen@linux.dev>
Message-ID: <179501434217.2486727.13336571553047162527@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 18, 2026 at 10:42:38PM +0800, Jiayuan Chen wrote:
> icsk_backoff is used as a shift amount in inet_csk_rto_backoff():
>
> 	u64 when = (u64)icsk->icsk_rto << icsk->icsk_backoff;
>
> It can go past 63 on the paths of both callers:

I tested the zero window probe path with the reproducer from my report,
an orphaned socket that keeps probing a zero window. Without the series,
v7.4-rc3 shows the UBSAN report, but with both v3 patches applied, it is
gone.

Tested-by: Kyuwon Cho <kyuwoncho18@gmail.com>

Thanks,
Kyuwon Cho
