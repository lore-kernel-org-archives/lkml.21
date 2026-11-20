Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795143517;
	b=cny0jdrLsCN0Qy+M9ic19u6Aux3crtfSsCTLMeHibZFrQTrQklaBucMQAYrYeHh/58fk
	 lsIJVpuqhd0z1+M5pKj3N+mxgB0ZZrz05n/pXqS907DlbSNuKT0a9OJk8Gqc94IpNszsH
	 OwkQqdc6Ph4kBN9nw+dD53p2eWXWbIxBmp3mTQUW6mesSCGSWHOdJJ5P06ZAD8dwR+OmR
	 XmAuoK8EYFmv9ZgZ0/my7hWxy9gNyJ3q0RfzlQJm0jAAaQ4jgzcYj7S7vCNAW4M2nx7YT
	 5aPwfzttRN2ZnsouF2zgFeeTG2Sg4xWlmwFhHNG9JJSYowwKBGUKaN/7yTZNw4Cl4Jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9KW3KGczfpvaxyqdIN9CNSpPnZinVvhah60U0axjKx8=;
	b=vI1EwR6eeQzyy+M0LMGFyENBC1/yZCrGTNunOfwKBkJt03MM8gP29X0SD0I7wPm/B3mh
	 2hguzKVd6mbiybr313p9/0CP0xkQOLKQCJHTS60LxCXbZIj/o5l1ujATnZ+JJP2BhX0PH
	 9vjTCzvxv6AyJZIeBE496ctKuzgMLxwKio3aUdkc3918Fz9auIG08FX8RGz4CWHrQAymC
	 xrCOv6djFmzYh8md7BvnVhfEkiGqxLLQeNLmoIBGd/4ThoMgBVT2dJdcbjw0bkmxetLW+
	 n9n+IBm/JpDzqI8HKiR62lfM1ms2nQYyxCqCYtPC1Gcccj3MrgWgR8md0mLPfp6WhZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7vHSdTs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ED8606A335
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79ED8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7vHSdTs
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so772813a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:58:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795143516; cv=none;
        d=google.com; s=arc-20260327;
        b=GxD9JmVyxfBODcipxgaVXVf5xhxrDRhP2n6Uc0+HhIwOqX9PZUPa66xBRWobgHcsDN
         CDMxhMOrE0ji2ZaVwAhlUikxL2nchnvX7EeemFtgjUjKbroAl9Cj9E7jRCT9E9Hvj0je
         w9tAR2oF25h/Ym53M1TjsJYOZ5W4ZnyD74bsfUpI9ivgA+23t4B7MIPorSAKqqaiqhvI
         KKQDJlrBymRdrPBRkr1vps2bNlkt94KLCKpvoEQ5SqJ21Rlh8S2U7sqMWbroekrUnODa
         eilzgphbaI7mW5yzya1eCUBkzzmISO6+Msp/npZxO2E8QWyNp604UPjfR/43r/lhx/AV
         MKCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=9KW3KGczfpvaxyqdIN9CNSpPnZinVvhah60U0axjKx8=;
        fh=2xemddQBb+1LKWlJqPePhFEyaeWxRJlJjEbhgRxhiAA=;
        b=qXP4F4zxdNWJ1xdyBew7pBn8ylbr7edlrvnjNgxRhPE/2e2NC0PPGnw+DQURwDjZIu
         731VDZmPWz+LLapK+g3QZuG3iSTwifasNwZBhxMhC9/gZnZegyifYluUISS0f+d9+MYl
         jCCvK/VdHqmRz/GTPStWUO+A2cSToC2qNLeflSP2C2yMNLzyeobMzUNvZc6XHcLmngJ8
         BIcLB/J6dnblBfPIu8ju/GcU7uyHbiEKVAF0mc0++iFmWWe0etKSMwvYdafSG394d+hh
         1OtdMdsoLEnaGKcxKthKetRFcuPs9PC7Uj520q9mkrWNLhz7y7bop57JriEsehIr0Yv3
         nY4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795143516; x=1795748316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9KW3KGczfpvaxyqdIN9CNSpPnZinVvhah60U0axjKx8=;
        b=E7vHSdTsUc074IhJVr+YlpwbUCdZ1SHAxZvc438hOa9DKeTRwI/mSEmV7AWK/QZ+hM
         neNnHD5kvcwvu6p/4L+O/TgFCbxaa78nrKEyf63KeB7csmsn6kAQ0R8WUzLW7lxZ5WsY
         oGiJY2Lo5n/DzeuYEAaLUiw+506VSlF2a7McDVOTPDN/XfwboM/qgtI8OCvxMeQQL1ad
         11XXPxv7pf2s5CLRL5CtNTRjTRdsxsQ+jxfHZyJAwWK4Q0PuL7f3jl9ofwM7oW0yhpJS
         AkIAzfr9jlvFRE2vb3PENc8QEvR/qK45GvpNllKncnDqd5TvmtihJcvztcP1opDiwpBA
         JiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795143516; x=1795748316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KW3KGczfpvaxyqdIN9CNSpPnZinVvhah60U0axjKx8=;
        b=X+oXg4tjlU7ciF0WV04KI39RfpJac9yyOrbuNojxZFjIoM65lzokHYLZQ6daTpCZpC
         qOtVq6F72nQDUQH6xKNaNGeBUoVLnxye6r/l86gjRrgoBhW6njzzPdeAgUzdAzcb0Q4u
         bfua6KyR+soZLZzUd2rfETr0HRrJtwvV51YB1VJSrjeJ+VDbn6Hf6lunT0v4wZQZflWh
         7HGZONoYzhbzh7b5cbYFNvz0lH3M5DbYxwXjmcz6IvFX3Rat30dJeGEJDJqQ4VBqWgSk
         3sW1LiciOd+W4hFVbWrm6F3sf+FGO1k7JdUySpFME5xQQt12T1L5bAZ8a0do2ArIr7et
         CfiA==
X-Forwarded-Encrypted: i=1; AL+hErER66YxAPAkzJf+68nSAFBcQKgpYCAMvx2d+ZE25Y0WGb34FphADTOfknvXsFaVXH/N/f3X3XKOqAsMWok=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rhMa64cH9uwq+5/YfTrQYxX4TDG7MyympoaYj83nXgGpII3Fu
	2EeJOlAj9JRuGU1oq8U0cK8zmjDuv4PafuPTlu0nkr8TpQkdZYKNkSJvgIYzXgLv4FpjkvU1ohF
	qrWgPKhRL9GPTxVtjxdD6+1e90YQRf8M=
X-Gm-Gg: AZFdTZdSLnDhZmCG+3HM+FsTTj6Ch7hS0lAKpzsIs8FyqUrDoJJFZp7xS05fkDKw0mZ
	4JZrXBJ89jFJT/X7DzdnIQ9u/pVKKcMGEWa4DPTPPF4RS1Bc9wIqj71J7SZGL1SnDrx6sfqgRT0
	F+HVZ992a65+olYyGIoEblfDY2VfJPRLj4R/T3Wf2hxCL1KG0QePtvppDpu6C4ZXw/3kJJgF1IU
	QsGjeLdxwxeYpGHsFmmphEJ51NMfb2iDH3GX2i0+5jAEzRmRp+CX4eJfc1bQbWb/CSh2WbqKkkv
	+P6iheSY3QPwxTQ0+EzjMDgDhvzJRgNJMWXw+j2TT17kpiducQ6c4Y9uFi5JbrUapNOu/47Yuqf
	788nWPCIt64b3cmCfJK8J1OlH6QDYTUD7roeV/xPStBb3OYqLJiLPvSh9do5ogD4gycQcVrexun
	EtOucezLu9/kCN2lhKJ5j6XER98MT0SDEg6qdH7GnDAYeALIU2klsSVm0gJifWHNPd/OxVcNNOL
	Sk=
X-Received: by 2002:a05:6402:210d:b0:6ac:c1fc:8a98 with SMTP id
 4fb4d7f45d1cf-6ba37ec77e3mr979866a12.42.1795143515476; Thu, 19 Nov 2026
 18:58:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKSQd8Wcw-DUR_JO9YFw17u691gjNyvySwfhPW_P5P3ik=_tBQ@mail.gmail.com>
 <av8LqXyAklPZ2-rD@seanjc-mac.roam.internal>
In-Reply-To: <av8LqXyAklPZ2-rD@seanjc-mac.roam.internal>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Thu, 19 Nov 2026 18:58:24 -0800
X-Gm-Features: AclHuK8Gr4XnmRsYSA8XV77CmBOgUr8kzkgADOFOnPWpO7P6JC8YfKA0jNkbbj0
Message-ID: <CAKSQd8Vi_KExBOes-Skia_hDCLfnE_prBHGXkFMcTsZLiwsoHA@mail.gmail.com>
Subject: Re: [PATCH v9 20/20] KVM: selftests: Add APX state handling and XCR0
 sanity checks
To: Sean Christopherson <seanjc@google.com>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>, jmattson@google.com, pbonzini@redhat.com, 
	kvm@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 6:46=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, Nov 18, 2026, Christian Ludloff wrote:
> > > Since APX repurposes the XSAVE area previously used by MPX in the
> > > non-compacted format, add a check to ensure that MPX state is not set
> > > when APX is enabled.
> >
> > For the sake of completeness...
>
> For the sake of my sanity, fix your mail client to set In-Reply-To proper=
ly.
> It's not a gmail problem.  I don't see this issue with mails from anyone =
else,
> and I just tested that sending a mail through the gmail web interface set=
s the
> header as expected.

True for a reply to a message that Gmail has (like here)
but not true for a reply to a message that Gmail doesn't
have (like when someone reads LKML via a web UI and
decides to reply by clicking Gmail's "Compose", pasting
the recipient(s), subject, and quoted text, etc.). There is
no way to paste an In-Reply-To into Gmail. And no sane
way to import an mbox file into Gmail either.

And yes, some mail clients fail to thread such messages
while others do not seem to have a problem.

Sorry for not having a working "git send-email" setup, as
well as for not just blindly handing it all to AI.

> > EVO processors do support simultaneously
> > enabled MPX and APX, with state that does
> > not overlap. (And several MSR control bits.)
>
> Until EVO processors are officially supported in KVM selftests, I don't c=
are.  I
> am a-ok supporting EVO processors, but if you want upstream to care about=
 them,
> then someone needs to take the time to enable support.

I care that the MPX^APX narrative gets accompanied by
the "this is an Intel implementation-specific limitation", as
it is not a general x86 architecture limitation.

What code does with the ever growing ball of VMX/SVM
duct tape, I don't care.

--
C.
