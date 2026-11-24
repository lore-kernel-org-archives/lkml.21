Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507992;
	b=L5NDOKJ+ksP63Ep3tTRY4+hPOswWBHkt4Q+QyDq2dnxCkV1Bq8pddyekiubXfGLlZl89
	 BXESInhnkO4MP0BRM1mWy1avibHTXFan0r4jjVS8uLzEIK4qsFmNTT5Q5pLfEfkgKMz+v
	 iIkoFngFVtXDTSgCAZSUOxUxfDBgCWcKBgLt6SYvC0bLQX2fOgqnOoYHCIftFzF6CM0LN
	 X5plR3AOH1pdPOGUGK3dMb5mo6cSudprk/DJLAQAVV0j1VcNmcK9ZW+th+38BgjBslgjz
	 HUKvNb0CaHbTrjunfuPMTEm+Oenh6sVczPqTVfYXskEdKjypjbHuU0hxLSuoLZ587Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vr099ZksUMvTCwdEOwMPPwsGjYEwcmcdK46JI4rLfIk=;
	b=zedcb9mZYm9huyEUwhnxli3mxzCuiVwJqeXWh1k80LqWChScBPXA0jpQhilNZuNUkSla
	 W6QeBhDRQg5RQdt4KLV8sfAn9BxTQY6u3bdy9HBIX6bCjNNeKwIWlzNjqFQ+XmjyKkj/9
	 pt3IQEyiteDuqAJVSCs8cNnxDZSGzdCS+rSJHN5l5KtNfENq4cOBiRGf/Sx0LKVtdZVli
	 2PGhXopiq9zCCgNtVMDLTnJ3pepkxkfQptkcQXmpzDFxtTJIurmMjWn/IRTZmRaoE9zo9
	 ClBh/ZvC9OGjJJ+CGrz88z5zkm501ICwGhFWHwbxs9zgTqgTu81pxfAstmQhevFKBEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m5Qqp6z6;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8217606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8217606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m5Qqp6z6
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4aa5833c263so4006228f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795507990; x=1796112790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vr099ZksUMvTCwdEOwMPPwsGjYEwcmcdK46JI4rLfIk=;
        b=m5Qqp6z66QlZo+6DNyW5fKKmNHBd6X2J8uyagMFWwd6avdqk7/BX6OaI4BLqVL3/W3
         No5kwvSnLxkd0kyS00TgpgfxOhWDBbWIV9dRw9kkp2Vbc4fKkTcvcVDxxOYQTlxbugwx
         BQCb5YYcx0kH4jH4nF/umeKjQUzXYDmYY+ZQTKFPoJf+CUQFoPFN/L+sKTXCPFdMUA7K
         UEak1vXrMMuexoCxr3F4ZwFA1nKFgok5VMG35vOg1bR4DZ+GE94vtVyjf/Kkd5rFDg39
         9RVlPLjQlHAiA4NohDfjIs/zsxKm2jheR9HhKDV4JhTW60Zie6JbNlqXUDMI+A0y0uM2
         kbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795507990; x=1796112790;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vr099ZksUMvTCwdEOwMPPwsGjYEwcmcdK46JI4rLfIk=;
        b=c4jcCTD8nQ6ROJqlY0RLCGGuJ0JeuXhf/3pfnQfJGWby1q45ZoO/dImzOXaUu08qMH
         3Xw9TrTkQOFYGrsB7Moe2WLVIZO9n97e3bkKAifn/w+9X8uaojLWTcpcidZ1z32+isGp
         I8K1rAWcI8fg1NC+mdpUid2xSNRZmV0tvpqWj52adKa3m0RSiqz73PIdTzpZvonIPRQi
         Tfs1sLoN0j2K1mvPa4RBHDv54/sCapX7xVnHLUs3rTdCZ9zuMl8LUOs9cNHthcl0mX0O
         tHVMVi01k7DxfsQAPjckL4ghB2RwE6P4q3AupfFcUSRAdejbkzpeBsKZMfETm1i+CshJ
         GF1A==
X-Forwarded-Encrypted: i=1; AL+hErHm0fiW0CkV6Wwu00MW3drmpXe8+x7XRCpA5sso5qAtZEPeXoBrS1VugG+YzDZHHqzDDy70wYX658tASTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gmatsE77/54LY+qCmKD88BfiDrL94m8LhP9K7O4HotrzTHiFB
	w1Lbo1kX+6VUb2ZQokOwi1x0DUywSQ0RaD5a/cfZHKA1+cchAKaasb/UDmsR8PHg+U4=
X-Gm-Gg: AZFdTZek4BH68lYXQbEhVMirZO3c++Bs/75SoBYAvA+e3QN9Zf8mF2g6S4jO82sHgWS
	j866uWZbFT+qQjxiPtFl7Ry/107JdMzUowEuoSJtAtFanKT4+VX4AjD8lbCddwf9VBzimyDrSwC
	dq7F80kOLX0xAqeqegkMrMdGIohw6MME9ptM3TermpCffHCQ1DWj7GpFf6S2ocfMeFg3ZtPSFio
	wGfFhO1h5dMUICISOZrFh/aNWnkbbAxeClgaYWIqX6dv0wfhXlP+s6hSGLBrRZh/f+7cmzRYZWt
	B+mcBdfVEp3Uujd9ZJWmZg2hGGn2l3XkH1bl/j9Ikalc33D/9QTenwQqH7Ve/slyTg13k2jHRb+
	LIXUREatc5vtfxu5YBDV9c6rHqFvKI1HDTU5Y9gsmmj1MAiqMZTppk7T8CRDCiqTtWEv/4m8pg7
	KYynOruCLWMXdfFDkAXkZ+LA/fczMv1ITb/CXrBV3ZcDy7Llgd6CDhMcW5XSJytCK0EytPFISyk
	DdRvXFBfdrcHoIM0oeilUP5+dpnbG1N9Xux+E9oG9VTyONTf+4GjFq508DiFWQf1YY/vXvEPlpw
	NKUTb50YJQvoOXX0Xf46R/kiR4NRJJaMwVOiEcO4AWPRM3FOmKiOhsgBjwuyXhtPPA6TJ+Yh7Y9
	kXWfPrQ==
X-Received: by 2002:a05:6000:26cb:b0:4ac:f59:60de with SMTP id ffacd0b85a97d-4ac0f596109mr29530229f8f.18.1795507990010;
        Tue, 24 Nov 2026 00:13:10 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm27459198f8f.31.2026.11.24.00.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:13:09 -0800 (PST)
Date: Tue, 24 Nov 2026 08:13:02 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, 
	Kayra Cizmeci <kayracizmeci@gmail.com>, Wei Wang <wvw@google.com>
Subject: Re: [PATCH v6 1/3] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
Message-ID: <awVGz7vg874E5C83@aerith>
References: <20261121041507.39582-1-qyousef@layalina.io>
 <20261121041507.39582-2-qyousef@layalina.io>
 <282a3922-91da-4145-94b6-d1a6459b6da6@arm.com>
 <awU72HxIUrUVncvs@aerith>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <awU72HxIUrUVncvs@aerith>

On 11/24/26 07:40, Qais Yousef wrote:

> > 
> > > +	 */
> > > +	if (uclamp_is_used() &&
> > > +	    !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
> > > +		init_uclamp_rq(rq);
> > 
> > I guess this means init_uclamp_rq() will need to use WRITE_ONCE() for .value at least?
> 
> Hmm maybe. Peter let me know if this is worth respinning another version.

FWIW, something like this should do

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c6780358a7975..982f913ec3271 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2117,9 +2117,8 @@ void init_uclamp_rq(struct rq *rq)
        struct uclamp_rq *uc_rq = rq->uclamp;

        for_each_clamp_id(clamp_id) {
-               uc_rq[clamp_id] = (struct uclamp_rq) {
-                       .value = uclamp_none(clamp_id)
-               };
+               memset(uc_rq[clamp_id].bucket, 0, sizeof(uc_rq[clamp_id].bucket));
+               uclamp_rq_set(rq, clamp_id, uclamp_none(clamp_id));
        }

        rq->uclamp_flags = UCLAMP_FLAG_IDLE;
