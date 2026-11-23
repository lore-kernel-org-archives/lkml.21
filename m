Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408852;
	b=kZdE4kraNEmM0YRpkLWyiH1DIetdzo+Lcz2Wq9ckBLDfU1VcThqM8LcEUJdMUl5mujRZ
	 9FMISd6a+2hDVtF6norAqXStZy4FbDtALJJDwGsoyOs53PV0HzktW96uPT3NH7cUyOq0+
	 00SqKTiRkh/bZerHdpovyTpk4pCYlUnJIhHmrBJG8UnAnJyFbR4LPlpv/GDW60PJAZ6RR
	 rAMmdX6K1+4uw+s0N8ZBMMXOOLUUS0Y4auCqKv+taAm7/UqVsNcusgvb7yc+MY8gFS8Lz
	 iHCNs0mFh01m7VYPmjWDd7ftIj1xohmvmltz8fc8+VuK5r/MItbSKsB3+AqIwKCLeFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=j7W3aHbg+YDWSVhA+lB+EOok8sM/T43n4lzMzoxoN/U=;
	b=AylB+gfyo7pnFnVZMRmJ69Y+1MTPSQcLG0hb9oVJ6cHBOqC8m7YBThR/qAnlhe1IG4gj
	 nGlBRcd4NQnvLeNV1i6ZcLcEjr3QiW+kPoieDLUTJLPuEDYp6KSIxoWE+ZHcuio93YXJ6
	 5cAtsy36IGUteNcFNOMK35nAjnrXJMSlchGFgc3tkGF7FSV3otw5TTN7chQJCSsEA8KAU
	 XRVmRsr0UnEc+tFtFLp9+x4OXyrGi0oTYujogEK0OS2bSC9xVQJCSoRlyHZC15gAAd7MU
	 eG4wgM6q8/3TXubp3+0Hm04+HFb4OdBU/4LOARoO9fSZUVeBaBBl9LAEiOKfKDFXe0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="czNHu9l/";
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2BB606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC2BB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=czNHu9l/
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8c6c06b3321so2285307b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408851; x=1796013651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j7W3aHbg+YDWSVhA+lB+EOok8sM/T43n4lzMzoxoN/U=;
        b=czNHu9l//TCt+8AntGLGUIU89eLLcaRS4jLAJk1Nzs1lPL+Jb2qdFpRqEQc+IdDqtC
         4ztDSThFOOBaU9PeOwLQ9Pa4m2PtE7YPS/OCCpUt2qjuL7z1GW5VHEFnyiPk0TzJIorR
         otn+Rz/5fUVxV2EhRUjaeGHdJ80WamvL5D7Os362o4B/v+Ggn7jT/JYWzc5N8EKg7Y1z
         tNry4iTSE82k9RHBHFED4a2rr9CvDGlx8rR0SwOmR5utNr2IEP5/1NWfwKK8WR+oNQ1K
         rqaIGmaxNy8KPLS+NwhSMGKYiE9AJrRMoNv6fvnl6lCoXLmmCK9wc+Nc+rNvwJRjdw6t
         w7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408851; x=1796013651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7W3aHbg+YDWSVhA+lB+EOok8sM/T43n4lzMzoxoN/U=;
        b=Ip95HYNURSWX903BHuFtowN5Jn3hCO7AqYbhpwDY6dhiKi4K3kRwHIn1E68ydmBiOX
         YVLhj4zdX6IU7AMCcd3v0KMrkcQLLfcMg+ozDL3wt3kChSvMz8cSy17M0zVGmKHJC4ml
         emn5F/nrRQgTBhwocN29c4QvpwYd4AqWGpkfBEqgbWt/4f32AC11mTGuaGJK5+xWMc5X
         82iqGsTDnu0OwNj0BfY4nKvVPO6sQ9hcg+MpVRM2wqo+wGXfAzVb9iyN+bqQ+UafZNBM
         8n6yUdp/K9q5j6LqrK2wUN/nnwB3RzYkhnTXMVB2hCV0MT7XK4liRkKFTXxZL2SXGMEQ
         2DYQ==
X-Forwarded-Encrypted: i=1; AL+hErGbEFnVSIdZVW30/neCRJ/+7EHfmsTCH9x1jxFhE1lemzNUGc/oz+ucNbi6XuWD435Z/Sl5sJgXXEtgIAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DBIkmvDwAcUNXOfOPvGCScM7gIe55Bbvk48yYUdqH5LH+4B5z
	CA140HKCSy4uEgneOfgk0PnN+jQNYY0yHl2C/B2KOQDq14VLtkji003e
X-Gm-Gg: AZFdTZcen8pkEHlfP1K6rIhTabF5hRJlJUgury3fa44nGr0RHlItX7HnT7fq+Bog3xP
	CdAPEhKt8XX4V5iIhs+U1SJ490EBauNXohhSkaEEgA9VMto2T4qTxn1EBRsnJGTzkOV64kuhpaR
	iv+h4NstctXyBhzSGvGcNrA6jphBFsukl8007u2yW2Y7dyeF5EOlX9v6Jh2VXteMttVDNbbsiYH
	xXaBxvZa4dZV/Qy3BkyGGwIFeRgnMXrzlymvlp82hhvPyozjuwvdphxD1cpUWdvmJX6OsxoiPU7
	D5uQ8edpmoXFTNz5YX7J/In1J40Scu92dbvTJi+cQzaaFus4jZt4cJy4wHX21Wp8TEuN/0ElrYO
	1mixh6ncrb8Ioi1uD3UN+NSkVml7NKt5gXrst+9rujuHPqPtJV3INw0X5TLs2vfogtaVXahNQvQ
	OGfOcB1hx9MhgXh4N7ipjmlSKveaS1Cn34wYI1FGFQna4UkIjGuM4wuTFg4iFTPD0wPNPDBqVEl
	7Ssk4nu0U5+ALTNzOlQtMf417O4WITgexz19ZAYbPQFbJeyQq5sCFIpL+ivrPAloIbW1rCvodmh
	J5FSs6v8YoFdA3Sf1CPAQx/mxpd1petnzJ+Tb8liZ1gzPoHC5HKduM0G6B59/wRkzkIMTFI=
X-Received: by 2002:a05:6a20:430d:b0:3fb:1640:c525 with SMTP id adf61e73a8af0-4014dd5bab0mr10831025637.67.1795408851193;
        Sun, 22 Nov 2026 20:40:51 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c29sm4324017a12.1.2026.11.22.20.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:40:50 -0800 (PST)
Date: Sun, 22 Nov 2026 20:40:47 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>, 
	"H . Nikolaus Schaller" <hns@goldelico.com>, Kris Bahnsen <kris@embeddedts.com>, 
	Mark Featherston <mark@embeddedts.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	linux-input@vger.kernel.org, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Input: ads7846 - drop platform data support and
 cleanups
Message-ID: <awPDq900dc82rWOz@google.com>
References: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>
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
In-Reply-To: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>

On Wed, Nov 11, 2026 at 10:49:52PM -0800, Dmitry Torokhov wrote:
> Now that all in-tree boards using ads7846 have been converted to Device
> Tree or software nodes, this series drops legacy platform data support
> and its header file, simplifies sample filtering by calling
> ads7846_debounce_filter() directly instead of through function pointers,
> removes redundant memory barriers, deletes dead code, and cleans up
> minor coding style issues.
> 
> Thanks.
> 
> Dmitry Torokhov (5):
>   Input: ads7846 - drop platform data support
>   Input: ads7846 - simplify sample filtering
>   Input: ads7846 - remove unneeded memory barriers
>   Input: ads7846 - remove unused code
>   Input: ads7846 - fix minor coding style issues

Applied the lot.

-- 
Dmitry
