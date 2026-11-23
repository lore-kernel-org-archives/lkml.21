Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424723;
	b=I7GfWsQaLWyD/mpdUJA5hAK0h8RRQ6CizFSKvNb4+pVUdfrtpIkiavIhESrWGk9zn2kg
	 dHC+NAY8Ya9tUe+CVFOhyz8lqvKPNxCd/FURCnnYvyj0Qc6Rv0L/1vKSplelJn7b28aR8
	 k5W2/wNmg+LQGobPcYbFT9DgfQjveRu97DH7g80q8JU0UY2xlKY4Alld7o78dLTTOySh7
	 xl9UtZz1fN8NRRz/csnCYn88AsPOlEQdT38bwAjhni33dNxBQgctqHI6n09aAmhUebf/L
	 zPDHDTquybGE2Ivp/0yiSbj4AX0TOOnZfmQZaokJ0r+rOC6/jye2V4fGGz8g4ck/+tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=sdj/skV0mpKyTKeONzZHXUjijG59MmM3EwIg7zBy5qY=;
	b=Q3+w67Fr6Kz0YV8z7zX/4oeDEkkDp2ZxBUJqv1YNR+AEO8yyyHC7pt7anANRJKipG52i
	 m3mJMJ5XckjmDe7GYZHaGlpou76thIoEdyQtaCJT0AhHCxuZs2lcde5C37Q3qm+wNAbtX
	 ujjRBxXHOr8zpaKG08UvO1TrPviICs5Apzrf417pLOAaLzDq9M1s7CPTS9/s1uRDMc1wl
	 4C0w/NEZxtTriJFLs3W7UlRWbfODc9VDSPw2j9/n/W0PX8SdCA7g73/NbQV/MS5COYIIM
	 /FRIwtXZgXK/lDcM1Mt0V51Fwv+CoNeFJVbISoDNTF8tQluMc3RKNE8+KbmYW7aLSPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CP5Fp1Z0;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C81B606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C81B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CP5Fp1Z0
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cddc250d815so1109094a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424722; x=1796029522; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sdj/skV0mpKyTKeONzZHXUjijG59MmM3EwIg7zBy5qY=;
        b=CP5Fp1Z0OTm9YV6uS9BaUVOY+zJomUbWcAMKXIzj2y612TJDfZ25vEIS+VmYWXez23
         VDnAEbDV5DpVUCZj+npRw9NNibggYayrF1QqCoXqHsCWlL40VP867e/Kl5RyRywQ8EQf
         z0YekvZWsBCJsqD3gLJtgAeTaP1ZiflXHERvK3rb8cR5+zaaG+LidlwR0bmbXJpIwaCM
         9HhWXKPnZNsTLc8m0QzUm2H335p/vt9o6Yi73YYuLEYfjSuMUTSgzZuqWJbuTF/8TPeW
         v6S5FYECOL8FBqvc17m3SsUP2yjNIWhivGAir9hbMSnHwy6yluZPABuf49zwLJBABggI
         BMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424722; x=1796029522;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdj/skV0mpKyTKeONzZHXUjijG59MmM3EwIg7zBy5qY=;
        b=BqUxDo6eNMEIjzM/5y4hnAFPis8RlW1OJ2RPOhLdqB/gGLovxDx0ZOQ5lV0a2XMaTl
         MimD0y5tOgQ8PfHNI4b63slUZtHDAIfXh8iCOv2L+Aq8pnNVcAG5wLD8I4fvsGHJFEbK
         rUNE/L9iffMMAgbFzlLWTvGBqHgZRrIrO4nfmWFX8rE/PVPhJ+CfVrJZbQkr9dtt8Dc+
         koATUGzkgLlbS2Q5UG80oP3vlJZDxKcX5j7tsCKF5oVDGga9dEJL/OHd6RysELrCV8ti
         katnkjOOb+XFT7EIqgkCtgrjlf4CZilGEw+23z3und59RET1LEzG7Ezm3cULkRiMcdLg
         tpyA==
X-Forwarded-Encrypted: i=1; AL+hErErFbhODaUwshWTCPIIjwiWpg62LZYA3J5QcLYYxmt2ji7VUJsUtGHxYBwl6jczzWcI0/gdXGRKgwF3t1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fEe/NcLm3JnKoS+HwNN5NXlreLW2wXENMtS5cTFB9LsGcrcIS
	KbfS8Qk6cxxdsxRtFWyl3BWoPAq09H0q3WYkP4WrLT4CvKFq+nxAxg/O
X-Gm-Gg: AZFdTZfT1lGAJy5JAlmEOF0m1ISIFsEe91TgnCFTisXvDQakjNSkp6fl0e3nmj+oKlp
	f0XakzzGa7FFfXiycb1AfkVh5KliM4Ou39gYpBStwrlbmgTLAr4ZkdIUmGcjuEAZ53dFNZmOPin
	Y7jVsH1TLbQ4n/2OQDVs2x9LgiMAul85uJyzrpuUOfD9Z49+yGfbaFUQM++WsQZpAgTPqxpi2u2
	JARLv+zbTtmkzhW6bPECkahjOS6gtVRCWKcfR7DJYBtnWtvgC4pJpEDk9lBIIDdyZjy45P9j+3D
	nOdg1EV0TxvF8Oc6OkxP+u3036F02XKYTpcn6R1XvCO0MZJHsw7gKulnunt0Cj6VpiP0AePoset
	3PujnEIA6m9P+ZI9RQq30e74Qq3YQD67pXwx4EVOf0BUR/CpAjer1Xc29beU8H6jpOSNwtzgHb8
	LQcWCwSsol5j0TxYR4Bj/nstrikbsFEJ1TXSsL8Ejk/wAS03qJcAn2ljCVbqRi3lSKcH4tZGuzh
	8DmWILCKOHGxF+//XwfvNByYdYobI1XLbcnBqL/lDPs6gArryKM8gUQbGkKn5nj3dDojSzoXeKR
	fHuvEargFAXW2sBiP6ede92mGiI=
X-Received: by 2002:a17:90a:e70c:b0:3b1:ba59:56a1 with SMTP id 98e67ed59e1d1-3b41c939b8cmr9271983a91.39.1795424722320;
        Mon, 23 Nov 2026 01:05:22 -0800 (PST)
Received: from localhost ([2001:8004:1ef0:7a2c:4a7e:bc9b:e9d9:4205])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm16760336a91.0.2026.11.23.01.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:05:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 17:05:06 +0800
Message-Id: <DN2GXVEC38QI.5BTEQWF3UY9C@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Jean Delvare"
 <jdelvare@suse.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: dmi: add basic DMI matching abstraction
From: "Nick Dowsett" <nick42d@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Nick Dowsett"
 <nick42d@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261122-rust-dmi-v1-1-4ace9449f872@gmail.com>
 <CANiq72mFCq01A_=B0gyaut1rPWeECOdDwP6pD3FBv7n4oH6TWg@mail.gmail.com>
 <DN260E1QVCJA.2PKN1JODEAOB0@gmail.com>
 <CANiq72kRX4fECZGjEXKsSE=bwT0XsozE3+GPpvmOPZ117B1_zg@mail.gmail.com>
In-Reply-To: <CANiq72kRX4fECZGjEXKsSE=bwT0XsozE3+GPpvmOPZ117B1_zg@mail.gmail.com>

On Mon Nov 23, 2026 at 9:10 AM AWST, Miguel Ojeda wrote:
> On Mon, Nov 23, 2026 at 1:31=E2=80=AFAM Nick Dowsett <nick42d@gmail.com> =
wrote:
>>
>> Just checking here - is this still applicable for doctests? I copied
>> some of the example from another subsystem. There could be some
>> conciseness benefits from not doing this here?
>
> Yeah, it keeps the rule simple (everything does the same thing) and
> also helps others get accustomed to the style when reading examples.
> In any case, for the example above it is hidden, so it doesn't matter
> much for the rendered form.
>
> (And, ideally, one day, `rustfmt` will be able to apply our formatting
> to the examples, so it would create a bigger diff if we don't follow
> the vertical formatting anyway.)

Sounds reasonable to me, no problems. This amendment will be in v2.

Nick=20


