Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465597;
	b=cfKlXEiJf4crVI2tKBAssXwN0BoF+E2q6JGmaOXZGd5ahDysIS9ms1LBygG4p8p5N0i0
	 NbApSJ9N8jPP/aAdQKmmXw7B0IS3xN8HIoAx0o0rV+Pu9ywMD+Krg5O/CpmTLXopo8bo5
	 j1jL39AhGax9O6xfsxdownJr4tGlPsxVJXGQl0iKykRxgepWtrIsMfphF1CrKtMydlvJB
	 3x58M32OSAFYCr5sqKhZ9KZNg2SHTTYWjsk6/unSZyK/w1KRVFkO1x087l/7UxmS9aypM
	 4RAJUoMy92qp1bMZBXn8RvEUQ0cbcGPyP0sNjY38AamQOtgeziHoUXdVs+vMWPElqRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HF7kC7ehUvjMLFdO+wj8zalglx6VqyJuBB04EXzZxKg=;
	b=gLoceqDIoRGayKoQZfhtFgPD7Ujkt6ZQT1J0hP966X9xiYQauvvBXV3dv95lSslcwWmh
	 JWJm4Ab+MHHb7ApggF49UNz4HJZNxJkfq//doCjPBW8gE/InXL95uBROXw1R6QZGkV77F
	 Ymz0IFV7HOdANSRK0NpJRvb3CRKkKKf6RkTQL6xlU34IoTTLORQlfV+ZBaAJEvniRBVuI
	 9J42oCiYa32JL1uNJzSbd65NE1jErRMLV/bfdNT9I1A3LGj6kLdfGzEk3I4i0fCKFIAw7
	 pmOJB0c5tFfWw9aosftTULr5qiJVdXKbCvtSLDO4lgNlkZFiB2Itd8z4/Aex6Czt75Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JDQEEOjt;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A97606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A97606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JDQEEOjt
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38692f62b22so2817225eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795465596; x=1796070396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HF7kC7ehUvjMLFdO+wj8zalglx6VqyJuBB04EXzZxKg=;
        b=JDQEEOjtQi4j7/aQ9NeZ5rJt2c9HVesTmaMZZFOcX4uaBY92kBL95IIrzoq0Ax30pr
         gLAHUHeWc2ooegw/GHvR3MNLB1ifvcF/Rb+AMj6GqueKAlA0shXumJ2NoRRMxxTwrH+1
         tg/zyLFCAvTi8L+5EVNsgXz/lb31rjVOip6dDi9mR5MkpS6APLMmUbbjVP2mKNbCTCaN
         ZaGVkza5xa2VByAMUz7668CZBKKugWiOUn/TL9N/OUPqxvTs/m52ZQf09LzwrJwS4B29
         8+Te87KL9Xzl0WvEq4cDDttiIo39RvGFfEeL17zFbFGZfjFA3Vtnvz+2eSnH6Jgglvtv
         DTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465596; x=1796070396;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HF7kC7ehUvjMLFdO+wj8zalglx6VqyJuBB04EXzZxKg=;
        b=PKl4iqkFIBxv/kFT7kuCom9MtP5Gw1zlmE9jWufvFZN++uJMWtCBAeCjvX+5LXbTO7
         hQ+inDA4DpabFqTOhPoPAPX1gqQU8HDgZhzjd6xcRcT+HgO3TvehEpuSt3zg21s+ditR
         gekiWGMUn4JDbL1uFPtGQu+w047XYKsRgJZK+kmpJQF5JxuP+gx4w8TMcIWqZ2ViwVUK
         WIcm27pwLGkcxdMmxqfEuIsjOzwNDr5pvC2fsUsHFJTbUCxw08+DCQ52GdJpQW33kG0L
         +1ZeaXQMc1jaaVm6ueoGijpSvPZbNcJuAzdJ3brhByLWaijgOytU2mgDLTKCZ/0S2PuK
         eQQg==
X-Forwarded-Encrypted: i=1; AL+hErHgIMk6PMp/VBYp2vD525YEEGMS6PYfTt5y+iyIpruRk3W12s8CMWORBCneBxUoaN30zCPaakc0J1bLiC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pDRMatWsNEYMNdqi2xlyQjnEOCUkIQApxm05VFZm0K2a5dgK8
	Fdy/eizt2M6Qw+0LsAJaPCf+TcamfZZ2oaXj5K3S/0099EZMdH9i0CDFTbfuonTD
X-Gm-Gg: AZFdTZfI7F1rBxU22/cs/JGfraseEmPnu9W1a0QfAb9V/mEO4toxqm8yf7XWxEESpqO
	Hpl3mSkmjEKVnkvqQqzHcYqXWs8WRCVEZ1lPgz5te9cllJ5EvnSNEaRgPY2odTzbQQleYTHYdGR
	DeWMnPhEJzip99mJmVhtBP5y9Mzk1eTAAn625HVQZnbfs8SuVx+IiUV8YhYErsKI9Z0pCMyG4P9
	nP7XZBnjA669lWSaI0d5fRPJgal3FkTRq22zrmEFwzlzXlbSxkP15jvD7OFg3eE7TxxsBk0AwUA
	lEZKHKrJrfMA33QyTLIkUqng+xBgIGg3KEeh8B2jzZrzz9txsgDjACx8/hD+3Xn3UWI5ghqbmYH
	ValXaMKU8QwyxKkAeyVEhr/Wl/2mA8zXFzj3B/vN9/J4nf7+q5oA5WZx5uFL9Ek/Jyt6o7On0ty
	lgyFQaNI9wkb9b0iZrPoZYtBmv2TA1L9Zg08uFXIIWxWqURJGlp8EXPyX0VnIJzJtLWBy8bIR++
	p2qMJRcoR110wy6R78nVAZBesLiCwY9nDfZjzGc8+/wSHsBKJCZiRD39z64Gx4k1l4GAsBD4/u+
	NPgzV0srwHMdiOCJ3l3B915nU4RF/kllsXbMiGDyhhNntX3xsxLQR1TTBZVo3EAQj24+6qs=
X-Received: by 2002:a05:7300:ce11:b0:381:a037:b060 with SMTP id 5a478bee46e88-3856e63b3dfmr13805896eec.9.1795465595743;
        Mon, 23 Nov 2026 12:26:35 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36533049eec.7.2026.11.23.12.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:26:34 -0800 (PST)
Date: Mon, 23 Nov 2026 12:26:32 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Ian Bridges <icb@fastmail.org>, "Cheng, Wacom" <pingc@wacom.com>, 
	Jaya Kumar <jayakumar.lkml@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 10/10] Input: wacom_w8001 - use reinit_completion() in
 w8001_command()
Message-ID: <awShdGUZ-Ur-nLtp@google.com>
References: <20261123183200.3900004-1-lee@kernel.org>
 <20261123183200.3900004-11-lee@kernel.org>
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
In-Reply-To: <20261123183200.3900004-11-lee@kernel.org>

On Mon, Nov 23, 2026 at 06:31:16PM +0000, Lee Jones wrote:
> w8001->cmd_done is already initialised in w8001_connect() before opening
> the serio port, yet w8001_command() calls init_completion() again for
> each command.
> 
> Calling init_completion() on an active completion reinitialises its
> internal waitqueue spinlock, triggering lockdep warnings and racing with
> complete() in w8001_interrupt() if a late response to a previously
> timed-out command arrives concurrently.
> 
> Use reinit_completion() in w8001_command() instead.
> 
> Fixes: 3eb1aa43ef5c ("Input: add support for Wacom W8001 penabled serial touchscreen")
> Closes: https://sashiko.dev/#/bug/linux-002efaac-c345-4827-8f1c-7b9d9226c713
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Applied, thank you.

-- 
Dmitry
