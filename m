Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795655133;
	b=uWWJ2bLWGC3Rkhri3pzMub2sJ1pmc1dJFweKdsofAW+Tn9CDjZDzpxr/vOC/HK5tMbTw
	 DRs8qomM2HZ+Gy7fhRhnGftz7ewY2muE18T9O2M1lol07czjcIb1Ifuzej+YtcZscB6nj
	 Lfkt8f0g1Kq+Ogg2HWgwxIIGuepacouYnnXnM9xx630pSjNekCBeJHmlZuBdror+OzLbu
	 1lkaOE1Z5nm5KARNVzsKG0+sC8RV6HjML/4Rtxnx+MJIMl/smCUP23bB+i0lvRLVu687H
	 DXYKp03b6Ginyh6W9WCwA4OIquiC5yTfrqyRyh+FPEG0od1UVFRkhiL1aDXfAPpoI3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=oZFbZu0+kSU0ykNmAfKFLTt1Nnu3oYAy3AIE96bAt98=;
	b=eCcm0cn2kprGODi4xfzxb94nyeQfEU3adNO7daYpPY7eT8lDOsnyE68VaggLqCSf28jh
	 YraWD6loXupVajzEOwlmzaS2yjFdOaDcrAIXUgi5/f7qSUnqxRXORVaIa9vbDFbK4y0ZY
	 UMPvvlSozIU7vjbgKJsxomzbW190CFBD1tTluMjI6FqRc09L1yRqPMXyG/dHrr8oSZ8Rg
	 9SWRm0F49o+siXon8lhw0djMXQS3GF+6SG3eon05+btxLfcxe/AMrCKRlPmjx9Xw8437Q
	 7wSn8YDKcm6WIqhDQM6EB8Oq+AZk7A79QwKCJ2qaGlwL3jBkBfrrjlQtt8LRQw4cnvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cgoyLmaJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C77D606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C77D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cgoyLmaJ
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-71ab5e64742so3932540eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:05:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795655132; cv=none;
        d=google.com; s=arc-20260327;
        b=Jj3SRU3a3/7vp+RVsphzm2slf2VJCFvZVE/7mlMVzY4DZYXPFNa6/A/csBBOV44vRG
         xQ8FpEyKX/hT0ST4SajcPC6uXF1ApBsNF2u0QgDQSnPrkqVhwBSOshuA4R/PPUmgtoOm
         PvqBlkS7d+QTwYbWszex3ZeR4+iMAFiqQLc7KZ1P9ge9k2/AIpMtiiGUKmgA0yH8On8q
         cATdEG20gRNecnQnG4ImW/7cNalaX135UWVUlOgbmnfXYZc22pIHldr3csuIMfayAiHK
         8pxaRsRgWD7XIg+YQObdw+PwJu2TOlalBpIeqQhQ0jmV5B1fb/QhxgZzeKmAAU36RTRn
         tXxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oZFbZu0+kSU0ykNmAfKFLTt1Nnu3oYAy3AIE96bAt98=;
        fh=BeWD4hnMHdVnj4mzIstQS6dR95SCln9eU+NQcXXhIs0=;
        b=YGxjcLx0PtPfO7YqX7AGKd7WdJ3bWr8arc+yVnlUQE8+kujvV8yMBZe+jlw57ZguUD
         7ee2cUzRdwGqr9BUotXUZsWlZ4BmwpOUtCyZhJser0YMFMOkBNcBv74QfI/AFY8kTZTT
         Qeso+00Hq7e5Ds2XgJtvV1ktAOd94hc2AQM5CXeAEJ8GDAVTAnW+GovnYqzNLtQYKkvo
         6TiKSVT6azMPCEjX4OXFzz0qQHaBTmmiN+22BA/FgAtHsT/5TH4n2OijkTaa0bmTGl4t
         L5KYkcz1WzLokcbtEijsJqdZVjfVjsAYh9ZjkGfBJh2vuPQtvsklIpKpZe/uBOMKhDUn
         PFVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655132; x=1796259932; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZFbZu0+kSU0ykNmAfKFLTt1Nnu3oYAy3AIE96bAt98=;
        b=cgoyLmaJMVDNVs+2Bkuc4Gq4+rP+DzY8TDkVwXQhjOAL+dp4qnzsQw8tWInOtDs9Mq
         UfCGt5aDesmtR99fdlhyjGFE9kcH+meWw8pUXjFyF8a1RVQj4OBSi4+qlisTXaVaqgIl
         MrliG4v4ek1mtcAZbQi/ZDUGtd/sOUBo42s/CcXIYbpBMonrrKUcXJLrTV1cUPei4yoV
         snDcKqQ1TfQK5lOBKjhZFnby1iBhoWTvyUsF9NmKO5vTZYskOK8pu1aA7GCOM5k3yfAa
         2yRXENBU1NR+BtcUWuJPXZqe/ek14dU8nj0xUic9ShVJ4x0nU3/Xr92BgafYQtw7+MG5
         XGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655132; x=1796259932;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oZFbZu0+kSU0ykNmAfKFLTt1Nnu3oYAy3AIE96bAt98=;
        b=Kx7JvitzFwGc5t2nwJVGgDIxviOByWzXjZv5LRY3uldyobPw7kKem64F756yGloAA9
         vGj+JzojEEnRUjJh47J7KF9TnqJxfY73oQG1AEnVfuupFBE8GCH5058J6AIuDShnMB2B
         dpz7c6k5PCwW8VgbQQxvb1cfaOvwJWKtOr0JirR39nUICYlOwKOBxV8x2CtEEwuhs6mF
         jjSqoFCiZt0n/p7TBGhHQxF9VTEBzC83tEBtF2XChwc8CNpL9D+oZP1KV1fGju3PsbBt
         V4YkqrcXqDDTH0Kk4Z2e/txb1P6xFjkPWtUeX9aXrr9WMb1DA/1q4gzPxw4WGpAeh9pC
         XPCQ==
X-Forwarded-Encrypted: i=1; AL+hErEHELaRWmCHl7jx+8RuWlfLvuy+qHGguorpMu2D9qDpT1lQH8EHZXmSmMFNdwywjBHvrABbdYXvC2VPmbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LVKdsdDQ1gLcY/7il1hutktEcOc6YfqH6WwWvoKKI/Nv3yiTN
	oL/mkV6oP57FWPJv795/IHWUPnfhrq7a1/w2DGiBUqgZeDF1wmKNsgLqmrjHRrXZlS4DOdRG9pf
	kMFMIoOglGmmBlNRcyJ5Tp8ZsQJ8BQUo=
X-Gm-Gg: AZFdTZedRkqpXpHVcIF1adowyQNJhQv/icdQV/EHXtjmhicRw2nWIK8pyv8VTcDzqEw
	5ssa5vxnS8KGnTFXK1xT+uDpfmwXElC9o4gAwM4Yf904msBEJSXByBqq2pmFEbX4cARuZYVmajL
	EAiOI+nNL4CuZVFoQNTdGqtJy/mEN5T6qs+i9JCi2SNtzUL/K33BYbaUyBllSuuBew34Y/2yCDx
	MmOxOJJHObMYj+Vdx+enie8PU6Zfyur6OJnt2Wm8saV0KsqvssxXZTiOXi3KYgQRUe3A4hdMsoe
	ZHfV9NsEqt07RzrrgUq0aF4tFOHTVCxaBlwcML0mwF7YG/nIn8Z4GjEGOLHPIsVbFgre+k8v0QO
	qcIBDdyUg+G/lSn0zVYWiJLNjZ3e6+h2h4EKJNLpfFlef5eUUElwWTz702B4Ifn0pBYZOVQmZvz
	v0hsrvCVXXywuhgQ==
X-Received: by 2002:a05:6820:c5cf:10b0:71b:82fc:ad8c with SMTP id
 006d021491bc7-71b82fcb56fmr1443500eaf.44.1795655131818; Wed, 25 Nov 2026
 17:05:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-sp11-noturbo-v1-1-37e1083cec5b@gmail.com> <20261123-eccentric-ludicrous-roadrunner-0a7efe@sudeepholla>
In-Reply-To: <20261123-eccentric-ludicrous-roadrunner-0a7efe@sudeepholla>
From: Dale Whinham <daleyo@gmail.com>
Date: Thu, 26 Nov 2026 01:04:55 +0000
X-Gm-Features: Aa3M54oTuIZ-TKok2yilEFNywBJAakQOAVzcdKFaeMZPoEEMc6Y-VCIDW_86pZY
Message-ID: <CAFcmK8g+Udyp9h24WSEx2RepBA=rZpEQs==1hTi83A+_zF-GOw@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Don't mark OPPs as turbo without a
 sustained frequency
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Dhruva Gole <d-gole@ti.com>, 
	Haipeng Lin <jimmie.lin@gmail.com>, Charlie Garner <charlie@akao.au>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 10:26, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> Charlie had posted a fix for this a while ago but never got back to my
> comments.[1]

Apologies, I hadn't seen that patch, but I'm glad you are familiar
with the issue.

> I worked out something very similar as a solution. Anyways does it work
> if we also add the check for non-zero dom->sustained_perf_level ?

Haipeng Lin has an X1P machine so hopefully he will be able to confirm
soon if adding a check for non-zero sustained_perf_level into the
chain still works.

> No need to repost if you agree, I will fix it up while applying ?

Absolutely fine with me, thank you.

Best regards,
Dale
