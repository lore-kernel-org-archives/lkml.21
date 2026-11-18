Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795043262;
	b=jYasMyD3j9IjT8tsdC7gyA+bQ2wvJUjmioHFSlynY2ZUU73L6Dq/jPyxFfXKLXofx6I/
	 fPau505kSU/tPRbDkC2Z4THci2FaKLcmRG5/iCAHIjzFKwR0vS8ohYeRYNjqfBZrt0TAd
	 DQ9SkPsdn1QbMr4pcmBM3EITUsHNMyx03ihzVctsKWALfWvrJDGzoGvYsGWTG2+PTrvnt
	 kDmW/SAEIFoMDILcOEFo9WjDFW8tX/y2ZbHS0kQnoPuENyrJQmeIW7eCV8TkrokrmuR44
	 S3ItzOSIREW2v/03KP9XHlbCKYmI6X1xgdm+q2eECSRVIkuCo0QosacE0GnVNz2Wjig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZsnteUiE7AoucgdCezy+Beh13ePnYxj5QpSFFRjAmOQ=;
	b=SGHlTN4A4ajx6UBbdTCqaXv7W4XOqaP9T6YTv3bpoKjwQKpihy6F2BijGsVF/fgjdPUN
	 eSS3bvyXpEwE48gfCgyvS2XFhHf9oWz26zjfonkHgDqSLZ5Y7i1YnuoAejdzXRXMM9bef
	 cvtPgPhRoWA3wY+63t4mp261pOcnyjvR/neYk1ooRCVFm+L8WfRucsW4gYKbRcISSQF6n
	 G6kKWucyYinSLiHFvD/gZOCws/6K1znxWBsT7RSgw/ABhd6xu/vMdj55xIXileUTFf7D/
	 vL314Wu8xsE8DlKCXOsVEZ6ye/M3gXsfwVN0HMVj7Sxntrg/7ZkD6+Y+VI6+/sLzuWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FVHXOilW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8A1606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA8A1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FVHXOilW
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b791a4b732so1941a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:07:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795043260; cv=none;
        d=google.com; s=arc-20260327;
        b=Ne8HEbriWOUrxO5vtjXCThR/oiJ0kpHKI8saOpBzEYVdfgn9bsYek2GKyUTwXjKuBf
         bZcCPk5zqvxPNLYd++9UeW8tPxT3FnxG/0To/V5s4mKb1VoiFlF2d4BbK7xZTtO5u4bX
         hswCsb57rx94+zIWUawwlbFC+uZqPUBqix+xT92wVlz8LOF+/5jAiiBDbohvLrH2xmLM
         MMKm3mQweNLEhnBJj93O9PxAEKlNnfPiZZV88kEipNq59zV1h9xCKu50ecNcjy565dFt
         Gw2zKckTR0affIhpsSUIDB5t7qLFWCZjvbPXjfUggVWQS0ZfvjEvnAuSwU+Xc3FzJqPK
         KpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZsnteUiE7AoucgdCezy+Beh13ePnYxj5QpSFFRjAmOQ=;
        fh=HH73PkOeDUdejgpyff2Xk6kJA+z4ccNZiqSho8BkTnI=;
        b=gdkxU1v7KDFQCEBLFcBFRdNnqYu6fJNIpFWF39nV35Mx8+0D1nC4cMIjwhz0U0JaNz
         0jTDDzKLY63XVKpFPOYfJu2vtBDk1myAaMcZjEJEPwqMRR8yAJfjV7v1k3KLA9fK4wjz
         4vRzbuVYFEtZcmA25h5jY4h/4spiVcb4C3pShvTU88iSoQCoe33QhKOGvwbO0aPoIgTi
         GwuOdboTfDSFOTsvPPtyM/99AA03G9avjc84W8J9yhVZCXtX2mi4kBPu5HcA2DkIKJeo
         MuGwpHedBMQ1EuChln1J4l7V/VWWdIZxzBkn77SNVa44IaPlLhHM4h80lJ3xZhPyFudy
         s2Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795043260; x=1795648060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZsnteUiE7AoucgdCezy+Beh13ePnYxj5QpSFFRjAmOQ=;
        b=FVHXOilWQOUOss8ZcPkgYMn1GXdWVSFzFp9SyplOR0RgbX0DTboMjWArQiDhVd+ieS
         YK4HR+AA+hla4eQJj0sjylxCf+2UJTTMc3zaYKc3xMKO7LgM+jGGMuk8fuCJruxqU7L3
         VfvfkBKhfvUrpnWU4SZNL0ZEhv2q6XADFUgTGd6PStOCdGV7xG+vHUvr8a9Pd4nDynj7
         aEcC1/ui62LgGFWiayTiHryboeGUZPZLKuWpPubJiFABRP7nFBta+Ry93OaJ2gc1MxEe
         /J7TV7i5L3hKQrm8DT34NfmXYPb9vy2t29GgZIHIQYHvqV3fv5OnVjDEj8FYr0h/+r3l
         mSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043260; x=1795648060;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsnteUiE7AoucgdCezy+Beh13ePnYxj5QpSFFRjAmOQ=;
        b=p2i37heJK3PhfgG4aROjdvZpXex21GWuNuVTN7Dbx1HnLgfWm6Zuvnr/0Mqihpk78h
         5QnqH5zcWLN1dwCdNJ/Xitwf7azPs7UOOJVYxC3Nv5yat6VBux1u/Hv8LCeoxBisBP2A
         F3cODrBKk2jcPolEjnzL9ki7qDYs2kkJxuEV18T+/pMJmrVnX/JAEUGR8cYb+P6KT8EX
         mVDi0zlmZQEXinXz3yByCxWLrY29ADvDrqngEfqA40VtsECJDjuGf5hTO1r8+R1GS+Pl
         UacVvPyRcmbNA/iIy4aQAxWIkFoRO1H6TcL8KASIVgdFTKlI5dikfIqJBgPFeJp0LIK6
         wRUg==
X-Forwarded-Encrypted: i=1; AL+hErEzr09mBc4gOwTTptCif/lezcT8ZBohHZMr8N7M7fHKoqDEPa4iL2WhxGA+2PbGWpo/6+RuPMFau2Qr4sQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w0lMKW0mudAheXkt7LLft+kGT989voyuOopVJhaw9EeN/EyPv
	Vev24WxdeojmFiUMikWwZ1CtzYeDeWsgxPmC9CzSee72x8kxSkhWdDUE3YCyTyD2oi55eSr4Fbt
	ERG/zfaqa0mSZKDoeOcwRDiukfOEase9X//Tp/9jq
X-Gm-Gg: AYBFou1VePs/yA0Cwd7qehx7zpUTjSp/1rbXmSNOjB+Ts2EBSNtO4wpRpENoj1q9JDi
	AWl0DTknrPCD5xZWNqqofTVvI0ZyH2k25g0Wu54Y9pt/u8Wsi0napVRNl18tralO3ctResX/KEt
	GI5jl2BWSwbFaFkKhXF2O3LPsFYTMhDyD/ZLcBENH6Q7OhuRAq0M4St5X+neGEFgvKZWINBiBGw
	WzzM/xUHQZINm2SZypptXn95G5Ge0gX1tHOuUwZ+JGlnghZjoUrwl9/EXT58yuuiGRL4LEG1e2m
	aIbM1agJEGjD6tIjsj5Qvj1fOBzZoDek6qRXwBKHe9vIkNBWWEGZYRohSHPQJz19F2Je+WD0no/
	GUb8k5F3zO5EBuWXilp3xCnwL4N3PXzvWPyS6wMXN/q0T6mZpeK9cWbuk9bxQcw6ex0D2t0c2xp
	Wrc5WLnZ46JAYkZGBkvz08zqldMLlzIHc1UHjV2me+skPUqvZkw0es0bdO1HcG+Fe1IH1Z9nVyg
	V4=
X-Received: by 2002:aa7:c598:0:b0:6a6:8513:7e14 with SMTP id
 4fb4d7f45d1cf-6ba0f58f665mr15291a12.9.1795043259812; Wed, 18 Nov 2026
 15:07:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117180310.921701-1-chang.seok.bae@intel.com> <20261117180310.921701-19-chang.seok.bae@intel.com>
In-Reply-To: <20261117180310.921701-19-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 18 Nov 2026 15:07:27 -0800
X-Gm-Features: AclHuK9Y5haQGqCxgaY0FAibvG9o4C1UdoD_Y-vPoZh50C837-aPXzswcUDXWeg
Message-ID: <CALMp9eRgPwHLWzO1UVnw30pvSvy5VYj=rwuMHMNadPLv=8V4xg@mail.gmail.com>
Subject: Re: [PATCH v9 18/20] KVM: x86: Expose APX feature to userspace
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: seanjc@google.com, pbonzini@redhat.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:32=E2=80=AFAM Chang S. Bae <chang.seok.bae@intel=
.com> wrote:
>
> Expose the APX feature and its sub-features to userspace. Add support for
> CPUID leaf 0x29, sub-leaf 0, to enumerate the APX sub-features.
>
> On SVM or when using eVMCS, do not advertise APX, as EGPR support is not
> implemented yet.
>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
