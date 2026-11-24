Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506892;
	b=oIF41FlQaTRHAtR2KHWMlKNpzidgjd/nBlru/yHAOLFD5KSvvE2mt6+2JUSka2EdAZnR
	 e/JCH1LqEC0eQ1HFeuc2xjpBigfjrsjMGkw7bJ5gzHPlRAK+g62VXRtRoaRDdHca3ru5z
	 2geuysOj6hWBKlFIFl4OHD+2JRpdc1xOVpXgiHwruuu5ZmqEDigjswv5VGWkwqhAjcxRP
	 XDklLtGsFNLgS/mxQ4CFzOr1vdIckVwGoKc+b899Lx6upQBdyip4L9d7rDuSXgimA2qSY
	 8D7y6HBbB5tf9SSR6URcxCiNADCw25mJvIECS30eRNxOB7IsaeDNRiPeTgdENhzbtmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IqYSQ9M0dXBron76+EtbwY0PEZY0LK38EZZbkDxHzb8=;
	b=w/eu4Ceo3SuUZ3Cr09ojG8XKi20loiT0/N6JzxLLgRQ6pjI/GJ8SfyQN0sBsdKynj7ta
	 zmy7d7VaePbGufCk4/S3u94UQdGqRo5xuYLoP6+zNq5Frnz9/E7bgIc4RPDvwFN+8YgsG
	 5dhsVMQz0mDhgcTwoVsGtiPwei37/D6GLRuL4bjplx+t9c0MWANRcmLYzJLF/+oIF6/17
	 IufL27NJH5wgcm8jwpVHjEbq0r/1UxvqOCTm5KWk3r2sCh77WPC0/e1KO+rbhoOvagosY
	 QJW4ohQMJDVrnfoKnGBW9anpFarePY8IzmFhJ0Y0z61HBqS4BUaXqrE4s2JasYDUoqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EYZooNKk;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFB5606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BFB5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EYZooNKk
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so35851495e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795506890; x=1796111690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IqYSQ9M0dXBron76+EtbwY0PEZY0LK38EZZbkDxHzb8=;
        b=EYZooNKk4qJn8Sc3MFY4ER/aJzINWC9LIebOugvbO59mayznvO/A+meqGhmnukYYsa
         RS/KaDmtLeSInSHczUQNP3jy/rPDSFx7HqwOVgvw6IYJ3gFhOF/c3vtVe0h/FehHgB9I
         4iwFRXVbw50sztWgfp/W+FftgD3ZTusaeuUwW5mpCYzeGOgMWcuOJ1ZfS15I6P7iq9Ng
         cpaFxuXqp045P/Y7EBd9iesouEF0jTxmPxXlG6GM1snKHkHJMeAvDVI1F4JZPPCHVdkJ
         sDbjz0YnsFEXDEoBeUBoYdNBU0RKD2530ccZEkFVMzB2BncIlIGiPUSg9m38D2dW8nrt
         JgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506890; x=1796111690;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IqYSQ9M0dXBron76+EtbwY0PEZY0LK38EZZbkDxHzb8=;
        b=jQCZjCF13rfrW2nhgmEjlSBhNjKJkmTyq14nTIIoakFI4lv/D90WjhFAKf+370Sqcm
         Ex6ssXgW3iT+3F40Dn6jiOZkxHtmom2G016Fxn+4m/XTFtxMsPNUR40icC+5EP9hTVOC
         SJ8x2RNk4qKrT5wwyiIlLZLYXub6Vx7gY3uYlkA3UCLwN2rTBiECDmKkFbeioK0WhsDc
         AMHzDWhAcGzNCyQvfLT16HBDecEgyxjZ4HXRq5OSo8FDjM6hZbe7swXJM0YHX7XJ9S58
         gUVYrlvTXyOqv0n/5UOZDDdlA25BkatCduSsCIcywyT40QvhLjSaBDmmZDAaxUdjHwOF
         a78g==
X-Forwarded-Encrypted: i=1; AL+hErGVlnQ2VQXyUizv3dcdSotcVAY4dUC/JM+pBtl5UJqav+zHxg3nCY5WB+s2zNJVYhgOBhyU+smQuWvs/M4=@vger.kernel.org
X-Gm-Message-State: APuU4Z82T8YhuLtykJQru8BQa/B5g9m98XzCioD1+uOSG8tYhEm2PSWc
	p17hINxLgb9yd2USCAm11mDu1UVQiQBiV9PBBtLoEuHD8Ewz9IpKxfngW2PbjOaehag=
X-Gm-Gg: AZFdTZeV+46VErMyHD+Vu18a5p/jCGbdYBalyKlpHA0P2R5xWj7LuOiAG6fEydJZSyj
	rK10BFTVtLfLN/Q5u+Z4lRZ+lsExnCYYurz0SzcimRa44yfdBD0uAITjECoWnoY2SfpDQNHAGzH
	hzwL7nl7BqzxXioJe/Csgc9amM22ZjxHdvowPyb4Wsi6p4QNiIAZqzxEy/SZCDvxzPptRpqgsgv
	NxHSxbB3/X3CYEZK2UR867TDl77XIUGxnv26pEZ3OoYa/b5Kiz1G5JQ7phlyzyE3DjVommTYMgW
	dPlfd88HkROe3/gZCUEbPp/Kf+hZnovTmYv/wlFuXZXKTmp8Vqmo8+VtgjJfIgIeURSHciTi1Sp
	R4e/Fo4jxwsjXr4lATIcAyj/XbNpWBV4nzS5BGTVLMV1diCEXH0AyQ3+K3yHe0OpKdQkCmXCrEq
	xwabUeNxIcnInRqyKxaKoceHh7pOo8vUL4HGO08G4w6apDpwJUw1DT/iw3qj3AsM8gH64FLUXrx
	wizucWvomfh1WaLxGfK+/lhtlRW5bnqVVXjDbvXTh8B+qtANuISkxy6owMEEXkv/iDQVru+orM9
	kG5p1Oc/xpEpiFkCr2QkmUmnA+x6GFLTTSA3sMgmxKEZhXyIQ+bwd7+tPFhQXcaP5AKy8p+1N5Y
	aduUgWw==
X-Received: by 2002:a05:600c:a11:b0:4bb:69f2:87f7 with SMTP id 5b1f17b1804b1-4bb88812c92mr292323965e9.18.1795506890633;
        Mon, 23 Nov 2026 23:54:50 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm26643018f8f.5.2026.11.23.23.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:54:50 -0800 (PST)
Date: Tue, 24 Nov 2026 07:54:47 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, 
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: Re: [PATCH v6 0/3] Fix uclamp race against non atomic static key
 enable
Message-ID: <awVBQAqIYONWmEaV@aerith>
References: <20261121041507.39582-1-qyousef@layalina.io>
 <070726aa-0e91-4d65-b3c5-00df3a180732@arm.com>
 <awU36OTU45MPn-Lg@aerith>
 <6c8a8583-e7b0-4331-a92d-ba174e926755@arm.com>
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
In-Reply-To: <6c8a8583-e7b0-4331-a92d-ba174e926755@arm.com>

On 11/24/26 07:35, Christian Loehle wrote:
> On 11/24/26 07:21, Qais Yousef wrote:
> > On 11/23/26 09:19, Christian Loehle wrote:
> >> On 11/21/26 04:15, Qais Yousef wrote:
> >>> Latest version drops the partial revert (patch 3 in v5) as RT group
> >>> throttling is going to be marked as broken and anyway a proper fix will
> >>> require non trivial rewrite how dequeue happens for throttled tasks or
> >>> full revert of subtracting nr_running added 10 years ago. Both of which
> >>> is not appealing and with the proposal to mark this feature as broken,
> >>> better leave it and hopefully just delete the problem area.
> >>>
> >>> So in summary RT throttling is not fixed and being ignored. Fair
> >>> throttling is fixed by pairing uclamp_rq_inc/dec with
> >>> add/sub_nr_running. For RT, we do that in inc/dec_tasks() which are
> >>> called when tasks are actually enqueued/dequeued - as stated will fail
> >>> in RT throttling case. Given the minor severity of the problem and
> >>> effort required to restructure part of RT group throttling that is being
> >>> marked broken as we speak, I think this should do.
> >>>
> >>> Changes since v5:
> >>> 	- Drop patch 3 to partial revert subtracting rq->nr_running for
> >>> 	  RT throttling.
> >>> 	- Drop fixes tag from patch 1 as the series now is partially
> >>> 	  fixed and not suitable for LTS.
> >>
> >> Is this how this is done? I guess we could also NAK the backports?
> >> Also presumably this was observed in live systems, so is not-backporting
> >> an option?
> > 
> > Is this the best way you could phrase your question? I asked clearly for
> > feedback on v5 and you kept quite. If you have such strong opinion, speak up
> > next team at the right moment instead of trolling like this.
> 
> Qais, I don't know which part of my phrasing came off badly here but it
> clearly did.
> The above questions are genuine, I was just wondering what the correct
> way of 'fixes' are that we don't want backported (yet?), afaics the obvious
> options are:
> - Omit the fixes tag (like $SUBJECT does), but that obviously loses the
> information that this is a fix.
> - Keep the fixes tag, which most likely leads to stable AUTOSEL picking it
> up, it lands in stable review and we can NAK it there to prevent backporting.
> 
> I'm not sure which one is preferred, that is why I phrased it as a question.
> I don't have a strong opinion that is why I hadn't responded to v5.
> That is all.

Okay nevermind. It did read badly for me.

I have no idea how to deal with this tbh. This snowballed and sometimes you
just need to let go and move on. I doubt either way many (or any) would be
impacted badly.

Thanks.
