Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196336;
	b=kutEC1WUENZvvKbhjj+oxCwGdWZOJjKJohHhYC9yXpbRDr/MHpdo2uuMsoIiMASVcLBa
	 /GoYnTgpNzRrx0yWpM4kAKEgCQYpS1G85dBLhA/88wfaLXdQMg3hUW97IQbkbdMjJjl4X
	 RISf2k+18WxhAc+TvGmG24Svqy/0Sdx1hvp53RArRMw+mWEx18hHv/L5F46gdGYiWGeZw
	 NoUxFBF32MNRnnomIwp7o6oajHSEClUzbZiIWRDIfTTDnahJuALRGGrseleeNRQ81POga
	 QlQ6IxZyU/Vjs5+7nODItAeHkYkvsLEb+vV+I6+4fHMOVlJrnLRXvuLOw71Ts0w8dqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=KTQmlFfwUQU4v+NLA+yUDpQoUdLsc1gGPYlZIjQ7eEo=;
	b=0jdSBDOGNpLtkQK35HaIrm+e5Htl/SD1ves9a9ZXlqm14AwG4+3HpHPIHlEQygoJ+Es9
	 hs+L7do4GvHSAc9vbeurQCqtElCYBjdPieC1MEJVBG/OBytylyOKNALsHSlTGETKDm3Yl
	 h9t2Q59mLFV6rIoz23D+z03C+Gyr0u/PQQWI7W8ROcCJF1Xs1OIZ8ACy68BNCHgMlICKr
	 /gqXRb245tsSHRNYyi/zZoj0zX7KSr2uCU94CNHjccf09FwEX9VIJ5gGLPD/h267f6hpI
	 m54/nsGKTBFMJb/0pqM+58tbvqyeikuZP0Gq+gJDRNYqqqX4po4AS8LfpkUcO3x+XYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLqTU0I+;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6E8606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA6E8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLqTU0I+
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f03eeda984so6411445ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196335; x=1795801135; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KTQmlFfwUQU4v+NLA+yUDpQoUdLsc1gGPYlZIjQ7eEo=;
        b=ZLqTU0I+DIIHMin65pUJcuDQgDfSkiYKNkHSq8jQ2W1y3uMQaQPbei6+eu81GWf6Vn
         KfMyIv597LZ5FDfOmkRrYz6QA5ZVwklvvIkdS7QUpmDkbyA4nTtBRgXM72IXzfhAeP3W
         KnXGCWDrVBPaNcPYgQAPiwVRHiH48IWIP4jw1/pM35UI3IiPlG0O/c4k4O0yd7gbNsM3
         81YCSm6zO16/6p/yt98D/h0Isr8KQ5k2zBEa5m6cdNPqxQX18ZHqgxKDzVTvmtpZsmkT
         zbZ6YQPYIEQu+Y/TT7Tm7ujj3OxJ1vOEgM4VTNcKBV5LHzJ3MjXuqmaRaP2FvG9ghfN/
         ec8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196335; x=1795801135;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTQmlFfwUQU4v+NLA+yUDpQoUdLsc1gGPYlZIjQ7eEo=;
        b=haGxh+OpwJSRKEiqEGeg+3BH+6ml50fi6nHFG1+0Mpb+ilgcUfvMFvjQavYfxGHkNY
         RHa+b4HVxPNebyRPBH4dbJKJBnG+Pndfm9TuXKOob7vyk9Y3uLHhtuMr73aTMb/0xpxc
         A0QsVTuIaqNqyjPQVboipIBuoKHdeC4wvmleZZveC3ukRSo7YjEbjf3cbwGfE3IEUKak
         qpxe4Zuy2BLbQs08M5M9pFwK1e3mwyBuveWr30U46UjMRB1jatvqifQC/pL8wTVMrvH4
         6n0LgO4ymT/j1tN9hvvGT4bFM50zUDMwPVozaktVVf914oOeniV8rQDsTQUO+Xi7If7Y
         +kkw==
X-Forwarded-Encrypted: i=1; AL+hErGybQ5kXb03gYKRi0B4EjokEznItLEg90zAXo1NTDn0oxmR8epGP6bYKJzN2qmeBOX1759CAoIwFcy0smw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YVFZpA+ngE+PcpnHpW8BtpS5MJrxU+b8Qg3SDD2QIlZJGQ9oW
	40PXeaxgqtRCgtwkibH1aeAQ+cdfMnbpiNqEB1FSb08JyfV4o9Tuqrne
X-Gm-Gg: AZFdTZemnCRrq82BIaexwLd1VF4MlXFZR3LBzvJrrfH9os5SaPcwRQEWDyshmAiZyep
	ffEbN+7c2R0EbKICiFZyLD3Cdj8RMiBczE45OvVIHNE12hVUP95MWMrEMzEH90OvV1WiI2XpI2K
	OBncszNsGg12dEomn7DypBiL6tPvaYQTtRsT3OzRlem4p3mxP5iwocKJLATCcHr9mFldS72yffo
	pP/9Kib32QnsWFRGq7LN4KmnuJIEgxLFkA/JXZj/EpobOcSrnfSCybqPKRlCVJlhvY3nAhv1Slf
	PGhs01qkVsktnpQIJV+2UPR34/94FsLpON2lvUzUophC/QADTVrGFiuesH22A4w5jRZOINPQQVP
	1rhQdkbcMN4Duu9MJgORUpUWp6IeDK5DW4ECPng/gbBSY6zuD8oU6/u12AQt2Wj1WrfJjvYU7xK
	1AQn+YzAIO67YcC1mqgworxVuiA5wRPqj0AoahzKd6WbbdsDGQDE5afs766VKvjOLhHmYUYobgd
	1prH2Ht9q6tAMWNdtQu2GhfRLfvkYxmScE0Puox68b5Rc6SdsgVfXdHl/w6kYOyQj7LsrP5lx1n
	CXdDOF8xa9v0GzNEc0fJcEIHA2gPt9gjbQauIs508STky47vyN5LWcqQVEUgoKNo12Zsatr/ZU5
	VOn1izrVoUGXZYIJdM50SoNRB+ElPEwvGbQ==
X-Received: by 2002:a17:903:2391:b0:2ef:f01f:fa4d with SMTP id d9443c01a7336-2f03f1e0f73mr43801925ad.51.1795196334841;
        Fri, 20 Nov 2026 09:38:54 -0800 (PST)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc4f2sm18100965ad.30.2026.11.20.09.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 09:38:54 -0800 (PST)
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
Date: Fri, 20 Nov 2026 17:38:53 +0000
Message-Id: <DN07ZMOAD4GP.37PG3XUPBG4CM@gmail.com>
Cc: "Ryan Roberts" <ryan.roberts@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: Mitigate Spectre v1 in the BPF interpreter
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Catalin Marinas" <catalin.marinas@arm.com>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261117172341.3152407-1-ryan.roberts@arm.com>
 <DMYSI3BOQWOC.2P2FZB0H872DR@gmail.com> <awAay4FFj1_wQtaL@arm.com>
In-Reply-To: <awAay4FFj1_wQtaL@arm.com>

On Fri Nov 20, 2026 at 10:02 AM UTC, Catalin Marinas wrote:
> On Thu, Nov 19, 2026 at 01:18:03AM +0000, Alexei Starovoitov wrote:
>> On Tue, Nov 17, 2026 at 09:23 AM Ryan Roberts <ryan.roberts@arm.com> wro=
te:
>> > The arm64 JIT implements BPF_NOSPEC with a speculation barrier, but th=
e
>> > interpreter calls barrier_nospec(), which falls back to a no-op on
>> > arm64. Programs executed by the interpreter therefore lack the
>> > Spectre-v1 barriers assumed by the verifier. Contrary to the code
>> > comment, kernel-wide SSBD does not provide this protection, since it
>> > mitigates Spectre v4 rather than Spectre v1.
>>=20
>> Nack.
>> In bpf-next arm64 has no interpreter when the JIT is built.
>
> And what about current mainline/stable or when one disables BPF_JIT
> explicitly? Should we force BPF_JIT=3Dy as well when ALWAYS_ON=3Dy?

Anyone who didn't have BPF_JIT_ALWAYS_ON=3Dy were exposed to speculation
attacks forever. The security hole was wide open. We've been saying it
forever. At the next merge window we will say
"you cannot make wrong choice anymore".
