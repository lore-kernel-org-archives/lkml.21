Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635242;
	b=ivb9lpdU1cljQXFesKtBk/IJGtXDbOlTOqqGcq21hlwKSEc/JvykM0f+/HdX05MZmCDP
	 wYcIniG36HKaTXGEEx6vh1OBzXa6X6vf0qaJi0qNHoegWf1XT9eXIxgNsT8UjKVuZxbXM
	 j4AcseNt+BgeyZRGiJNf4WgQvZSJjjAl9UfoCr1UudiGbdKI1ndqnPOHe1ClndxwmNm7J
	 XoDtxNnynzB5chHmuVD6GswVhHehsn3ohDDSjeeGJqb/CqeILS2Jri6lAjiFAkNIDMnHD
	 G/Nj1EFCEZ4evh4KffoDUc+nU3F10RMU/59qF4cvfaS/yPLE9NOVq2K56FKysc0j8cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NLxTkHVtfjBNbHINC3JQs2UX+5Tk80uWbQNIu6qGoTo=;
	b=s9Dq3ILB1eEtXiouAiHfZa51RtpWS+0E68HQNq9lkvsLcO5lr7SxQF5SkY9O7Zymt1BI
	 S+luqPSJQh34epQIqx/G9FhfoQ7s8w0smdqJHQMifSx4ybF5Di+G8hRjis10AtzpHp0Av
	 TpTzLJum0AUl66cAFnNquASBnz+xGjD53B3OgVXK/lFurFdgFvI39hIqpkV9Pw/+cadFt
	 1+XFw8gJ5VTgxiokmiptR4OlPe/E5RDFY1S1bTjZ7Sx1iaf6SwGCClmtmzegUVQcwO01y
	 gy1iUa3GNiWxxuwQW5/o1kZS2RF4vrrxzIa+vuUsNqkWf5t2KU+yLYyAy4dQJLf88hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s29XqjRc;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83667606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83667606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s29XqjRc
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8470d7d430fso3091703a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795635241; x=1796240041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NLxTkHVtfjBNbHINC3JQs2UX+5Tk80uWbQNIu6qGoTo=;
        b=s29XqjRc334YI5AgicyICZ/Y28HjbYuuCrk/L2v2saoZblJQuSIKXCh9TBMgxZNYFh
         8I0FX1nYXeMKyMhtOzSryqeoyvPsL76ThZI5wqyiodpNmXg/Gwa6FAxrUHIgRGnjrwoE
         PZfP+J/MrmnzE+JdvVrcUupvsWAx0hzv4q22+z39Lrh1SqhttyG2oOZYQXoKRYabQGaU
         gJo1RQXiuzgwaVnmT2nFUlSXVl6TGNo4iPTX584ZN8J+tWwNCkM0rHng3mOIHMjDEMJe
         acRF4O3uPF0+NR3I5GpuYR1XWBHh5FmF55NTjAsCwlAn32iH1/IXjUp+rd5Cfqj9s23k
         G7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635241; x=1796240041;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLxTkHVtfjBNbHINC3JQs2UX+5Tk80uWbQNIu6qGoTo=;
        b=GRQamOVmSPDxcakVa0nLK9uEVj3x2BnfQgzYLsIUbgsj2BrZKCjw4Oc6T0oKs3tQwq
         8q1FoMKVaiIm1vt3l64VjQtaj+ZiJxANTq6eybwksyyvMfCqPLKJwUahfIi32wPE32Zi
         efwaoqoJxaN24D+w4kPQ/YWxyTu6QhBJ2f7kMVxBEeOtLoyR4N/R3F2nGcB+JPgLKsvn
         ocer2H7qwjcGGPWS0ibczkr79PPmIFMEVtxA5B1R38WPuovf8Xt7JHMKbUFnEhFe6TSf
         BzrGTwdDYKnl4qPPizaUNc8uePo3IKl72WsjsZK6/5+ce/bFfuvl7YOKQ2hSdyGBgTt5
         o/bQ==
X-Forwarded-Encrypted: i=1; AL+hErFwjOQL4QonxolP4NLG6vE/QA3egoKdmyf3lOgHu8waxDig+z66mkiVhXFgX2Aq/h8lmhnOUwBGdKldxsw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x5LUTw9uZKp0bSQ02/Avp46Dm/nl+wtMBeFx5m3L7NtKmaRVv
	PY6KzkYM/zQObgoMGAhbnl5xmgx3C9sM5EfOrT4+2KvTyYZjOfYNLPQ=
X-Gm-Gg: AZFdTZedmaVuHlSqogsPgNrvc7Ephh863uceraoxKs29v94+0Kf/guqbppvskjT+1kS
	QFRZ7fH2O7jeKbyfU9IAZAq5VK+98MpduIvvhzZjazNFdoAtxLk7OaWxFXLj4w++JWsUvJSA9rC
	gY+jeHG2tkPOvtRdHGspdXIJxmYOEekC0sV5ULI1LTR7kvdcXv0jW5se4lxZWwIWHiDtkKs12F2
	DSkHU2aexXj/hWMpyZq5bychdfx1Qn0vZHy163t1ePvu1cKyzBxt0RhHUiBOa1pmMNwqam7As9a
	XPIbEqwAPoUyZy86FDmW2HuXlPcHERpdJSwe21LAbdftSiAExjsJ1XGbUyi7hUQrg4N81a42pgy
	Pzrowqkc+hmTsdFDEMYvqWFj9jcB8eXr5ACqW3PbkyFNEV98G/FLScPBMqSmvj9yiQhD6WF7ZCW
	Zia3UuVPvvCjrlFk4UXfXB3vEbxIT5wjAwYrheIbC67czjkYa1XIo+R/riiH8Bwqx5jGjd54Tpb
	DRvi7lKkB3g3s3jD4tWd7nLQnxAaZqQdYR+tu2SOIxlbHmhDsgloptkzKC+gLI01aJVgvY6VIUA
	JKCop2BIuTuWnQhdTsngoAgli4X/Buoo6CRZ4WcEBDhQxT1C+KM=
X-Received: by 2002:a05:6830:920:b0:862:c9ab:687a with SMTP id 46e09a7af769-86314ec41bamr27057020a34.0.1795635241407;
        Wed, 25 Nov 2026 11:34:01 -0800 (PST)
Received: from miso ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f784fsm13769165a34.16.2026.11.25.11.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:34:00 -0800 (PST)
Date: Wed, 25 Nov 2026 13:33:59 -0600
From: Matthew Laux <matthew.laux@gmail.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v7 11/12] media: Add subdevice driver for the Mstar
 MST3367 HDMI receiver
Message-ID: <awc4J-M8SCfLx5O2@miso>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
 <20261121035523.26764-12-matthew.laux@gmail.com>
 <7969efe4-40e0-4c1e-b36d-dbb939bb4c64@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7969efe4-40e0-4c1e-b36d-dbb939bb4c64@kernel.org>

On Wed, Nov 25, 2026 at 02:17:21PM +0100, Hans Verkuil wrote:
> <snip>
>
> InfoFrame data must also be exported to debugfs. See v4l2_debugfs_if_alloc etc.
> in v4l2-dv-timings.h.
> 
> It's implemented in most/all HDMI receivers, so you can take a look at how it is
> done.
> 
> The exported InfoFrame data can be parsed by edid-decode.

Implemented in v8 following the pattern from tc358743.c. I did have to
manually create the InfoFrame header and checksum because the chip
doesn't make them available through registers, but with that done, I was
able to use the existing hdmi_infoframe_unpack() instead of manually
filling the fields.

I added some output from edid-decode in the cover letter for v8.

> > +
> > +	return 0;
> > +}
> > +
> Regards,
> 
> 	Hans

Thank you for the review!

Matthew
