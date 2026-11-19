Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.217.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795101040;
	b=r83NpnGCo1dtSPdmR6+9KAa2my/H1w63N9DDXFiWdd2uXRdRS0w2kAWIDsJSbURvHMJl
	 T7sc8wxejrnuvlKzhQvb4yxw9D19V9/nHiYxT4MpSs02kHQm7hxu2Kxer0MiOIA+YqAZC
	 5jq8RaKvsiWcT+JyvGy4OZA4yXpqtGex4zqo49bGlrdLrgDzM6NLoc2QX1t35u8tPqscD
	 7F3T62pASP85uVCgtf0TTms3Twdt98z+jF+tJATh3+/m1ssktibW7oNuivR2lyMLLqugM
	 H2Ih73noicAYG4Hs3N1ChECT/4qGcI4PyXyJgPZupW2pkIN+McQSA1iGztAd/ZcAnpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=TAuAtF3fPWsY5c99NF7uBuDUPIOXdqRFu+JX8C/CdeA=;
	b=mJSVCKCCV6nLyeo0jOhJTH87oQ/MFW9TAmuPmYhmXfr6+kBfg9kOigBEhKm0RlTBn1RR
	 JbYen5iy4RcHM97ecARrbIArmwiCjrvnMXDCi+yiuWuLgszEnA8uaBEb9z+urmDzaLIUF
	 A+jIrZJSqcb+etPqhY886CKlYCsFPK2BAR9Ysq15h5CuebpAvrA+6RwEJR1FcWTaufuIT
	 2iAMIaLa3DfET4udBraZY6goKid9OxsDZDiNTm/xnR5yPgVT7S0UcfkjpkrhDrfX7bWgB
	 /q5MO9n9HgOt679UC4kSXN3EMxDU8vBZHP7YmAjaPQTOfbpKusqUuEOlW1HydOVTIgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=umIq7Bh8;
	arc=fail smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776D0606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 776D0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=umIq7Bh8
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7d2dbc0a8d4so795650137.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:10:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795101039; cv=none;
        d=google.com; s=arc-20260327;
        b=pBzRpzzPIEeuLysoDMkY3EUO/1vB88tlbVgzfxCAPa/gSToYDg1Lpq1JYKAFTp6D+P
         BLJy/SOVef5vBesJwmFNhXGV4qdjSN5Y/Oko9dNG8eJYO9JnU7IuZ5wlnC9cHiip2sZi
         bSIlG3y6ko3MBWPnr/8dq4E5X9XgMu3kHgzS5G70Iqx5zPI3FZJhvLn7P7RHRwVtDWHc
         mzvq2a/Wp7zUWKf4LiLxq57SOch6W4XP1xX+hk8P8Y6mqmGE2MPFnKeCgkLgk5NhXX+q
         emRgYv0j/YEtKXejB4oKcSPO7hDQCtUJtLtpj9sZHI7b1dWwWTqRTD9lmDWL6s2AwW3g
         99uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TAuAtF3fPWsY5c99NF7uBuDUPIOXdqRFu+JX8C/CdeA=;
        fh=y5jV9sD3EfOuwt+DbYJT+fuiKSq3cyHWLRN7FpViQP0=;
        b=W3/yZc40McYGdR/bu3x9Ht4VwoSJXFPfUDbnCQUyL38paqqwopCOs+iCEuQJOa8Kc7
         DmE7vwyVwF5BPoOfkP7GMfuT5sk+xm3hLBkZuCIPIdCPS95ls4OssFjwSztk9mbv7P0w
         IwolZOfpeEM+sst1aKjOoiKXhMTkw91a14nY9+Q9hprEktVThF6EICs+iC6yfqopvh6+
         rzFLUHBMWXSVt4DXA+zti47GISIRyGeoZ9Il+JxPhYBMNYLfy40ARdLaURr7KzSO4HwP
         ecGgbvaX5n0CWwAYI8hORU9Qezx7JdNlD9yTMu1CizkHd33Xd4GqlqyCl87/ZECliOre
         PFaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795101039; x=1795705839; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAuAtF3fPWsY5c99NF7uBuDUPIOXdqRFu+JX8C/CdeA=;
        b=umIq7Bh8QMl4L922VLIxJcaHAtAi3k3uslktqKyjp3SUD1RQ9uVZM/pMJ3cnHhJH4I
         N6eps+NicrDzupL2aT1v64Wl66U+PB3XBFn6qQmTfJmRFjquB7K7iTKcnAoAoC2EC3sR
         DcFv00QBmEDAFp/KAf+/N9Ep0p138lctHGZW6v7NNHKZ8ecz7GUteS6ANJXAW9MQxkgq
         okNDui8nDwu0atmo3CEROH4Nl9MMjFAdR2TeCWsF2SEV5tcxzcHiRHZemtgYtS5SuZlW
         vO8PRbH05pbNA32CXqgWe0AvDs5zxUXjMaRbM3whB4Bn4iy9GnbTWqj+9ZrvORaippBD
         cFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101039; x=1795705839;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TAuAtF3fPWsY5c99NF7uBuDUPIOXdqRFu+JX8C/CdeA=;
        b=uI2KMb4TggQPXT7MvMJUIuBVVlwZRSZmtpFI24ElmYnLCgVCH/G/LsdWB/Qud6i1w4
         S5xcZE2tDiyjY29Ky3dpIkHL7lerMUvvjTcvqUyBPB/uTWI9xE4zBRQbn5FAYJzGvP8N
         dHPCQdfZeZnKs9FOUsKVeLP2vW+ynuN/mkzE1qzjkiyU2DO2qqe2y2Yb1p4c+0uLzVc2
         n+Hr42SiSgFvv0NWRwDMCJWBz1pxptWSClR32ClxmljQg1SUYkR9YQTNt0k32MCPGpK/
         w7cjBY8JnIA0I++2g1TiKcZDM6ru4gvB0xk8+8BOxeg1ejfg1W6r2fh6wd6wGI66E5c4
         X6JQ==
X-Forwarded-Encrypted: i=1; AL+hErGes2n3AAPxXgJIgu00TXC0/0uznRDDAPmylfj0tDe/a1nKet7dSB8RV/M9gojYZELmmSghtTPTR4AGeU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iYIFi++CiMUovF8Hu5yx5NJVIWekobOIQJh/d4F+zXF36k5Qj
	WhHFAZC0RQzgHobtQ8nV99Lg8lcVWqHrYyxC7avfsJbdlfDNfYCW/UQWwUXF0oiZRnn9Vu0bwPG
	X03Va6xDt4Kl7KfOspnfY73QcXKpAFPA=
X-Gm-Gg: AYBFou3T9U9L0bxl8qcsdgujmVuh9DvRzPzK/fdvMlFUP1021EVNVyXHZUiw4AvQoVB
	lfE713w+bEZHNFL0BDqMaY/9ijriC6onwmWg+9LU5UIuB7WZ2bNfY1Kcz1WFo9TIlK5yZR/ejAU
	38ik2ZYNr73OurMZSqiS5uU34ggH+FNg9SN0VGOgrC08cH7QHWExCQxRk5qQRx+tgDaEMPVuzeD
	G4GRoMvdWeyqrA2extEqdkiILfICmPAFr9m5cveixZ0L1ObkAQ1wOPyr3LDvUtIXU8ENl2Cga7J
	IS2gHnps8m1hg8HOhS3JZjFy1LFmnPVoXETXSU02Ukk/tWbvsFHaxg6Ufm0LkSVbTv9OMJVEXl9
	zPi9sUpkOVsXrFiWO9TF1Vla3awNScXMVVVTsPErrguavecDzhOD3i9MUimUjXeFGwszYIUeMeh
	YJtg==
X-Received: by 2002:a05:6102:548e:b0:7d2:840b:b064 with SMTP id
 ada2fe7eead31-7d6ba18e430mr2284058137.3.1795101039217; Thu, 19 Nov 2026
 07:10:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-ath-recovery-scan-timeout-v1-0-99a70d89e114@gmail.com>
 <20261105-ath-recovery-scan-timeout-v1-3-99a70d89e114@gmail.com>
 <CAFEp6-0O=cPYKndr9hen1jvX==ot2WP4JpGfNFLokVvxUEbxiw@mail.gmail.com>
 <CAKobHXCMwjAHJOkibPbpDByLZmAKkszZ3WaG6soSDaCEGRQjgA@mail.gmail.com> <b879a6b0-4ca3-4937-8bb0-ee3586d60c1b@oss.qualcomm.com>
In-Reply-To: <b879a6b0-4ca3-4937-8bb0-ee3586d60c1b@oss.qualcomm.com>
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Thu, 19 Nov 2026 09:10:25 -0600
X-Gm-Features: Aa3M54pZaHP6ysBEqmdFQebPmeAF0kkje7A47NLqpnzWPq0PTLeUQa2a-UgopI4
Message-ID: <CAKobHXCUawNNtyLn-n9-qXV3F_q9drWXeG28bY5ARiiTLzXO2Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] wifi: ath10k: don't arm the scan timeout for a scan
 that did not start
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: loic.poulain@oss.qualcomm.com, jjohnson@kernel.org, kvalo@kernel.org, 
	quic_haric@quicinc.com, quic_vnaralas@quicinc.com, quic_pradeepc@quicinc.com, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, quic_mkenna@quicinc.com, john@phrozen.org, 
	ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On 11/5/2026 5:47 PM, Jeff Johnson wrote:
> Please don't send HTML e-mail.
>
> Note your reply was not archived or sent to the mailing list because it was
> HTML. I only received it since I was directly addressed.

Sorry, Jeff, and sorry for the duplicate: my last resend went out as
HTML again. Plain text this time so it lands on the list.

On Thu, Nov 5, 2026 at 9:53 PM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
> It looks more like a theoretical issue than something that is likely
> to occur in practice, but the fix looks good to me.
>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Thanks for the review, Loic.

We did hit it on ath11k, and it did damage: on a QCN9074, a firmware
crash failed a scan start with -110, the timeout was armed anyway, and
it fired after the dead radio had been unbound, ending in "cannot queue
ath11k_scan_timeout_work on wq" with a garbage workqueue, and a panic
(that is patch 2/3).

Whether ath10k ever hits it I don't know, but the code is the same, so
the fix can't hurt.

Christopher Griffin
