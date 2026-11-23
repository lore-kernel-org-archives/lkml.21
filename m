Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457528;
	b=pFyoTe+OptLrBTuzbmK7FGchz/sEQwBEPC68kCxoTWvCxTO90qLn/aMN94YBTAQuCr3o
	 eurIn+26ioQMB+2BAa4AvNRyePrNfRrsrvJkIyP1Sg1XUnpqhga3lFxrLSaD6uoUoPBaE
	 KTeVwNToEPAOmKCKR4cK3ja8IAFzcYNyB7TRUALb4jwjlg25ohkMp0qEvNAI0AxECqwVu
	 AeFDQizPmpowqOBEiyv1ZQr+6BUluylyH/AKlkkyCf3v1DW8f7LnWD3GbJ87L5MJIc3kn
	 G6hpnfIjFavbYvrsmFrsRnxJUJ+9BgDNRAGoEftMSmMnAAq/khockteFOCaqbk1AF4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jzqkJeZaTQXahw6ShZXqUnXj4qKS+ePavQpcZ/GtLFg=;
	b=xpYVrq+QfpbJtU4jrJp1Z9rM25mQ7BcYpEBy+1EMv4uEuULVNRdVZ/wMfIUmUFQlsegF
	 ZiLjCDaSZTYSADW+VJRuYe83BqEqMBxrPtZN2XYPC7MwzFDbs2sDctXHFb4xlgZy/Yf+Z
	 DZggbt+sFweNssPzsXLoRx/e7q/VKCuK6qggjpNNskzy2O4vvM8J8WRVf+0U+MMZ/sG/V
	 sA9Q5jbOuIJJR2hN5W9TvYMglreTCxw4iwPUvpLtqSQbHSf1ig/0+3T2xmWaETJx6fN63
	 zSAhNo+29z07aVyiN4MserLh/DbqGwfzglsvR8d+Cfu4loF6t1yyVJoOjqEjTfgdacw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u0ywaFlF;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB60606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB60606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u0ywaFlF
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-385d8a00598so5013555eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795457527; x=1796062327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jzqkJeZaTQXahw6ShZXqUnXj4qKS+ePavQpcZ/GtLFg=;
        b=u0ywaFlFQGJU+pxzbL1a6SWXyRaCwXZzS5AbxqdZ8bjRjQdOVXELGmrG31NpNdT2DV
         YxIToPBydNJ6+VBAerf2ZQUbvV5aP4E1CppnauztHG5J/REu3mfghDTsDFAeeX2N/lxU
         6yz7wwa07D3H8c3doovT6i2/HLy3Oz/z1mcZZlsvcTBKhBoTDqPcur34aPP/1/esBkW2
         btuFQ/UveeLAZ4E1UKJBZX6KwNHn8mrS09w24sgdNnEaNnWW2Jhnshx90JwneM7NC1hX
         wYm3GYbrav8YUhEKwS1jgi5WMlTAjb7yzCUJgCBQAnyewMP7QGHkdSuWb1Iz+cD3sHrx
         sTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457527; x=1796062327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jzqkJeZaTQXahw6ShZXqUnXj4qKS+ePavQpcZ/GtLFg=;
        b=CDh5dVS7kY/byRAiiPIN/seg9tA5E2FaHRJpcxHpNjwviJu+55PvX3s3Mi9I6flzxl
         oe0mNgXE/ITn7jvS/VMz1mftn/WCpB1Mck1MOZ1uF+1/06yGq3fdtkO05votOMLthPM5
         EY0fxfMGpk7E//4mSTwJpSYsEAy0dXngmL3iTP/2ECppltW3zF3id6+aTxxjrxNaOgf1
         Z1Uh9AwfKwK4m3EhvwtRs2Il28PL6xriJhx9IvffuLjl/uXg8UgHdAaOI37xvsdDzuKv
         mML8t1TQgYtKaaxTVV7xFHqelT/HJa34OktKDF8hb6Wy4O/3dFFgqCaQPhjeH7ksy5jh
         IxWQ==
X-Forwarded-Encrypted: i=1; AL+hErHpLfpbUjT+wM6PP83bZzxaqZE0yiCEnckAV82zbfrlFL+dCBPRI8WZ/4+DD+yt9bd0YeyABlR391XBoW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WMHkzDwSk35wTfBHN72kKE9OhyOgvGsxKlpMDxUpg+G+xurqe
	aubDAKRFk/L8Bjq6hnSyn1ythrXJiJuYDWlORU9Wxrvnpg23gj6Cu0ViuEzuQg==
X-Gm-Gg: AZFdTZfo5hEr6EDbMV8gdPqqWn9PlcFNmc4kzc6dTpLDuQ+cSqvS2kaTNX5dOEHiETO
	bw1+azE4WoBuApdViq4d+sLG9NaLN0DAc3CvBb3To/xhWewpss/VdVdlwE4TEVr2yroRGnbBxio
	678BkCxO/PTxkQ2SzG6wmb9ydllzwlVfTMY+tjrVKsdYyny5/pyK1KLUfh88uuvfguVZ32Dgv6H
	KzJk6oaf3AJUkUd4LVhiA1hEB7c1a2Bx2yTJOHiHF5plhdNqA0HuOvwBd/g6iS7ZHaIasJa1DUZ
	OO8On7UaBWzEjkaM5BDYvFIvY+QToYvmn1Dbv6l9S9P3/Apa84il405GD4bYxlpEqOJZ1qdFBh0
	YREskYqQlP8WsgLcVm6m1ipzBu5uOBBKF3o9kZQcVsmtzalKlgSuEZunarj2a3QLAHXrHIUUoEG
	T3zBWe4xpV2viWqifRdgGIYn9lG0bBXaDZnRem4CcOt6mPc2k3GDg7OWuXO31GY2RYP+I5BeYSL
	OafdijPdPnkanejkrarhP+mxOOQPmULqk05k7w2OXjTw1Pb1zNwBHDd2NfvBfBVKTzTJ7/nEiOl
	RyWp6c39nmIAlWUW8gdNl2qqjVjZom0aHuORU5ShdYiL3oVEl2xlanVlGXUvvOID48g8HIAfqby
	N09uI8EVHZm2XPsR1
X-Received: by 2002:a05:693c:83cf:10b0:386:b526:24d1 with SMTP id 5a478bee46e88-386b52638e1mr2787839eec.9.1795457527409;
        Mon, 23 Nov 2026 10:12:07 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm43434987eec.26.2026.11.23.10.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:12:06 -0800 (PST)
Date: Mon, 23 Nov 2026 10:12:03 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Michael Auer <mick@yoxcu.de>
Cc: linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: pm8941-pwrkey - report wakeup events
Message-ID: <awSB8AQVrGEAjFgr@google.com>
References: <20261123130336.1316006-1-mick@yoxcu.de>
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
In-Reply-To: <20261123130336.1316006-1-mick@yoxcu.de>

On Mon, Nov 23, 2026 at 02:03:36PM +0100, Michael Auer wrote:
> The power key (and resin, with "wakeup-source") is a wakeup source, but
> the driver never reports a wakeup event. Its wakeup_count in
> /sys/class/wakeup stays 0 even after it woke the system, so user space
> cannot tell a key press from other wakeups. PowerDevil, for example,
> uses the wakeup counts to decide whether to turn the display on after
> resume.
> 
> Report a wakeup event from the interrupt handler, as other power key
> drivers do.
> 
> Signed-off-by: Michael Auer <mick@yoxcu.de>

Applied, thank you.

-- 
Dmitry
