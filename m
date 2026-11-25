Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795598752;
	b=xoPNLbkKRITHYbyDuhQVhSelkJbsLvSTp5zeKCKSmxVI/3zTATRvBpkiAvyFGRLQXyNj
	 uCxwE0qzgNMzCLcuHRVVev77pHWRsp5/PWOwL5Vu57gSQ3Mrilw6rwUCjxcLYnthWWEId
	 SL/uRjWNv6Acm8iBu6FKFGuBzAR/MhqDCTc9viTve+AFSM19Ju1VLUtqNSxC/NDE0G7ZO
	 r/wXUFazrc/8/IKeympnch5NxVrgSsteSzKNKTvfO6LukJl0w0VpwFRsSiC0fmY0fFfCm
	 jVYVgg6bsLIjBApypuuO4Op3+COFGQy8HREQ6ofp1dFnLv6B7xA96fiAenh5vJft5lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=gYbHdRSYox47S6NtsdAA4eKslCoipRNcHNth5Q08SEs=;
	b=XFhKVKHsLxhyFsCmOkPvGmEzJS3ovfi6dEm5XflRm8G93seh1/jtgwQlUJb/yWO7x4Aw
	 iyRX1EnuPAaF20SW6GKgQeGtkMQFLv8I6OACg0HTl7ZN6BrK+8xMEq8b3mmS/BUDjQMwf
	 PX8GotqmSD2biJrOSp8ILVpeweDjvH0ezySeUN/Iv6c+HJWvP2LMotGxeFW1rfMv3omIX
	 zQDuR4gAHOWOynNpnX5Wd5/leUO/QjpJMt5HAs+dnqtiNekiKPdADOQl5keW+ZCqEotIs
	 7imhpljLEaeiCAdonqn2R32rgw+3PvoRp3PnDhsKNOolVQND6zl39DW+UABFSQzbHVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="L2X+/PXy";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79245606A698
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79245606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L2X+/PXy
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ba4ce91e21so44520a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:25:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795598751; cv=none;
        d=google.com; s=arc-20260327;
        b=cwwZtt5ZnHKeCCqUp0wRRmpyT0bOGnna58d5dwJXgish3DiJkOelLYAv4f3Y3Rc6ck
         MNCA0kFCePJ6qfgDuupLtl7F6Zz+9Zn3RYYZZ5Ukfxzd0YU0/Dv5rLgzA66hURiesxbm
         UPj8rVwC6GRxbmAH0j+vLPgm7dCRpk7y0Lh9ecav5ikBXLnSkWr1VF/kHg47JnB31By+
         cCxd+ZHVL2/bbjBXUJG4qv7TQtb8QFVYD7oIiey2/syQUR64pxw41lu6LoiFeodIBVlJ
         Q/bSXY59FEYvF8arI+Apq0bXBhs1j21QJUWJC8BC26ugh5x6RZAMI+c9aNOElavOYqFO
         I1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gYbHdRSYox47S6NtsdAA4eKslCoipRNcHNth5Q08SEs=;
        fh=GBve/o8MbtHGx1s7AlWt1Cefhz8i0h1Th8xV0Y1ZWNY=;
        b=DAQM8k6lpqnl98N6kCHt5H1Df98ssJcyHNqd7gy2Y/Wm4nGMIrCVF55obu8u3yPWdG
         y37q6JmFL6uMRtq0hO8sxpEC5KOMdpwTTuVd9+NcOTEzhSv3IfNrT/CysBQ9XQgZEDOJ
         sxtsBv7TyRqhUPXwEgMQIE7/BrU1XwvdDo/JGu8BDtcpbNrbyWujo2xA4GlIprEW7Hkd
         pI65WOco1xjIDVzNH7tt764ryodd6cHaGSErulWRMV8KIJsbYzs2eFPBOO6FGgEW12Zb
         63cADfO7WhRxcuwdIJ/ShLEyH5gluxbW6MuTktMO65KjaO0kNlWsjGPJ72SbqS0fwNUs
         0mdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795598751; x=1796203551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gYbHdRSYox47S6NtsdAA4eKslCoipRNcHNth5Q08SEs=;
        b=L2X+/PXypC3/tKXZUwXmdoCkWUOksEtrAn7Z3N8G2KMb3Ph4Ej03Qnbh/RpnJowzZI
         UYxG888gnvRL4/mSZCmfxtJLRTZl4d5JrQNOIN6bpZADNGJv8NQhqybPCL8MPLClwrCV
         ve7lkK00QOGbrRT606HMVqpBhuNt0kFf2MP2QgAG2c50Y5KUshiM2eZLyuRJiDitXRT5
         KeNcVKLzIky3PzXwptdgA/G0K4uuO1SmTlhRTQHC3M/lP+qYGKe/V3BwlmPO9msXfSBy
         e+rFPrVucCdabm3a6pXDVOLW/82RvV84kOwdzS3uu7GgCH2MsooFQc5ro83izfGSSEMM
         IeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598751; x=1796203551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gYbHdRSYox47S6NtsdAA4eKslCoipRNcHNth5Q08SEs=;
        b=iXVckBeInbqTAxFHheR+EOrNOt0QimbgxvyuBCVq3lmJ60x+JlNWHAN5plQ1DtNcsP
         YszE7XXGEK9+tLtabQihhp2RfqVB4TwojdEEpAvkUdEKCSS5BWppLYbuBsPixHd1bNdK
         C2bsrNSZfeFwYQVkA7VaW97etstJC0if7lHhRX9gYFdF2PoHrFM4yFnscJK4nDWtFdQ5
         pMhu/r47iNXDC9zzzwZb5GHQkbrM11bgcrnjMLvfTaZ9bK3vLx57YDTX6cBqC1QJ0oVw
         +pBjnJOH5XScr34lxrmZli0qxRfU4pa4RRmCld4zr2wGJfWLz4tsVFfR+x6vHVM7L3rS
         G0Ag==
X-Gm-Message-State: APuU4Z8r6Qy43fS4pLtF/9qDZWSgjxLop6UdwV+l0HL9dAH/kNzdQwri
	TMrMmJ30FAOVxSUKucOwkejeylpXjrONRlNzsv0sYa8GZJfU+5ADe5GghtVt19pruBWDUK3Sryp
	MYKq7UF4UM5RnZyjr0QGlTexP8xjKSlSCh5R/KtXJYuXRAW70ugmoCRezOUQ=
X-Gm-Gg: AZFdTZe3QpRyH7d/KIUB6L70T0WJJu5+GMpik6sCg8bFJ4T5bA5k3BFA+GU4dn+C6xC
	DKYk2k/mV/ljR+GrZ1xDSgSdNoiQEBXjViNL3zlYW+2/v2GVJxMjsg1555tAznf8TqkICqjr8ml
	hSySHJBwiknh4ZfR+GJEbGDsqvWln0oXaXeLWw1CHSgCehuh6oUT7cVN2L2jAtsibzpQ6sDYrWq
	/NefknB/ZhEZpXR8iQExGu1KpsjmHmD4CV24WCSdJsp1SifufwrUA0NeYMuDqWMuKhOf0hhGYcZ
	/8OKR47W01W2Dt4dh/LOXrj0ZGDRH1PyRlMmpERBLdg1j6wqQ9QPA3kZAp7Y68qTzZpZaX2gsX/
	peiTuj3qFEhRX17g+S/7CApWNhdt6XbjLtaY=
X-Received: by 2002:a05:6402:4019:b0:6b8:a64c:7bae with SMTP id
 4fb4d7f45d1cf-6ba65b60300mr446859a12.6.1795598750461; Wed, 25 Nov 2026
 01:25:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113142910.3477757-1-smostafa@google.com>
In-Reply-To: <20261113142910.3477757-1-smostafa@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Wed, 25 Nov 2026 11:25:36 +0200
X-Gm-Features: Aa3M54oG49LqtysQ--8oVUvcgvyBCI2St88VzEbaL5EUBbdo06thbDvEmUWjhIM
Message-ID: <CAFgf54oB6tmmKTsD6aYvs0JSPb=heb_yXDJLxCRM-mMTPVz4NQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] dmaengine: qcom: bam_dma: Fixes for unbind
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
Cc: linux-arm-msm@vger.kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vinod,


On Fri, Nov 13, 2026 at 4:29=E2=80=AFPM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> On Lenovo Mini-x Gen 10 (X1P42100 based) I am using VFIO-platform [1]
> to assign the QCE/BAM to VMs.
>
> During unbind:
> echo 1dc4000.dma-controller > /sys/bus/platform/drivers/bam-dma-engine/un=
bind
> echo 1dfa000.crypto > /sys/bus/platform/drivers/qcrypto/unbind
>
> I see a system reset quite often, looking more into this,
> that seems to be related to runtime PM, with those fixes I don't
> see that anymore.
>
> [1] https://lore.kernel.org/all/20261024161902.2093581-1-smostafa@google.=
com/
>

Gentle ping on this series. Is anything else needed for it to land?
Frank and Bartosz have already reviewed it.

Thanks,
Mostafa

> Changes in v3:
> v2: https://lore.kernel.org/all/20261023101536.3965344-1-smostafa@google.=
com/
> - Rebase on 7.4-rc1
> - Collect Bartosz Rb
>
> Changes in v2:
> v1: https://lore.kernel.org/all/20261020180804.140766-1-smostafa@google.c=
om/
> - Collect Frank Rb
> - Drop call to pm_runtime_dont_use_autosuspend()
>
> Mostafa Saleh (2):
>   dmaengine: qcom: bam_dma: Take a PM ref at remove()
>   dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()
>
>  drivers/dma/qcom/bam_dma.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> --
> 2.56.0.611.g1030f0b940-goog
>
