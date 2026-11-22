Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367913;
	b=MZQgJswmfxhReKnLsNgQrO2TwBgbc7GQV1+o4f/YRVcqq9mP0qRxzChx5jlvTdeWxTYv
	 URV1tJvaMRmfOhTJm7AM3d7X5VqbVdfBX0UmdcFGYMiZ/4/WA8bp0ISbXAg/HiYiakfmp
	 b1ZL0seAXBm9gJ3HfT1gNKHcqMWlJOBDgyZ5F7Mewoqe/Qhxep2WBC7K6wB78ExuUsqP1
	 ZACTib8CrLvU+Fcw8VWb+17UFKeZi4AB5mcMLop+HgSXQO3k6ll9CyTIIk+9zR01vH0M2
	 fNFeI6VVp1QVZbGP7A6oI5/VBsZKlmdw4Ve7EUNA6Jj+Ou12z9uYFZT4ImqPIt4fqLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=78iLp+ukyIH3Bqo6jdwjTQqg9ybQFd9VxizK2IPYkLQ=;
	b=PujkYfBFof0qRfSzRov7bJRlWwgzxro9W6MU4hSXxJjvmCnKWUKBXqLeU042CgewE90T
	 2c5zOam16tyY/P8KbZ10PXSusvqJ9dkmqO45yl0PFjqjS23sfIIJcnKysByIWLyoODMsS
	 njIftmxfPFBZaJRvU4E+I0+2+oxzYwaXIsm+CZB08Lru2gNp2s2jpopFONml3XqTm3SbB
	 Uu+r8fsljWX8bF0P1TDP5GE/YIaiUrK5UsPD33GE+1Ye9uuIVf5wOQdKIaL/21AghVGQu
	 ugL5nt+j53X0THb35DYkoWkxVSPD7Y9f7s7cO12AtdTdA1LdDTsmV1Lzll9meX/VrEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MSEwHngh;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50377606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50377606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MSEwHngh
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f03f3631b2so13484335ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795367912; x=1795972712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=78iLp+ukyIH3Bqo6jdwjTQqg9ybQFd9VxizK2IPYkLQ=;
        b=MSEwHnghHFpvG/H9NvyBLNcSG8oKpaTq8hFGjcbk45OKxp7HM52R6ckrAw/Q/A7gGx
         xHgWbgp6sLH23mTJmJwkBVHRXwgTJV95FigsUnpApXdZaqauZJfdZGt2cDkc3zpquCw+
         bE74Mp/xYKn5jeOU0Os9Bx4CmTm2Az6CLgl915HHUkDpUpTPESCFkKVKLLU24bi29sr4
         gnVxtBpSKoN8zR9F4EUzHSYofP3ITSLuXKPHFztugHXkr6sQe4jVhtxC19Pqpg2D87y9
         XPrlZwJafq+RfLxT1uWctWAvNka/48LMeP/QkJVXiqK/sY3z+bJiSh05GF3CuxEhtayN
         xC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795367912; x=1795972712;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78iLp+ukyIH3Bqo6jdwjTQqg9ybQFd9VxizK2IPYkLQ=;
        b=inHGWi4/rANgBpetKFmIis24CAiSIFQUbJG6f1uTx+sf9autSwsMkYvjts8EKU1YYs
         zdZpzKa3b+G+OxR6MzSam+SxHexL/n39SAmAbsZe98ntf/VgjZUJkcxpckWQ00Yre0SZ
         7i/QnJAvmua/m+WGozD3NG+qff2j5wn6AFROvy7YDgXWxN0Zt+NyxxtdBvb/cBLnRyq0
         Sy9ymON1BCCZ1wNFRflLYaX/PwBSnVImNKlwwiH733A/jcB20iXQ+SuaHhAuN861Tu2y
         6gaxwgQkrF6kZAXT0QjJII/vZy/6HUIw38pRyPSbSSwDe2IuapDUOdzBofn3uSnU0TYQ
         fPUg==
X-Forwarded-Encrypted: i=1; AL+hErFwCEsTE/hYbLAgOFye73a81SjErBTjF4wEK1EicVqDpadPs7CtK8bAh1Yf0opBN7Vq3XonWvbI71SHsGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CbwPGKKLHKjPD0HSexXSn7IlHTFj0iLRDt/OelJlIp3kXeaSr
	2oF7QkqNWAZBSU67GGycxOdpDa4Iy+kWt7veHVewn9qTG8ec+tO9zNsJsy8/3A60mpM=
X-Gm-Gg: AZFdTZepjnOm4G1/52CvLeWIngqLEQ0ozgG4/e/bbUfoBNi7eDZAnlC5KKkLU3u37mn
	2ZuM7QL7HdzpXXWeuQyOQrdMaTZqmzAYYpCriael1jX7NxeQj5hG1scny+uRO5tBQjDgc3bbwdG
	DNHkPJFBrhKbuN9fn8Z6fMuurr9xv6+BH8PvPS9BccYAXbff8oL/pmy0z4Twp6t+qpYpxrqBC9R
	8gWT4Pqh5qPHv6eWht+7insM0iBRYYUQ191Y5jzMa+o9e30kE2B7e8TBHQ76biudmQW9nW+WjDj
	OjVyD3QM0XOJiMBGmkLEu9G3Ar+5jXWwGkvsFTJOrN2NCwpAXkALPLRmNrrhlimwYdJ45ExgmF4
	UFWgVkkdiCwQ0i312gteXdVuJ2/tX3sqKsXIqSfKVGv5QymL8qcdgABC1/iIE7TX2csVQ7jI1/v
	WDBK9SPGxYF5czCH1PSm7gmYdoHi6u7epX8iDXKKJ3FofROLz0EAPNbpArPh6nhh/LCAnelaspH
	7/tjH1Pt4AmvYAwX+4F3/HeF2Hlc60zzwyD2nCqMQSnMxBQjxYlIIa468H3h8M3mN+wRcOQMHLe
	fQgfuxxuPYi1i6b8c6SwnWjgGqtvyNkulFhXlVpGz57PDQRfGsGbwuBua7x4rZmNqIffC1o=
X-Received: by 2002:a17:902:f603:b0:2e9:7dda:bfce with SMTP id d9443c01a7336-2f03f2760efmr88354605ad.74.1795367912601;
        Sun, 22 Nov 2026 09:18:32 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84364sm40712525ad.5.2026.11.22.09.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:18:32 -0800 (PST)
Date: Sun, 22 Nov 2026 09:18:30 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: YanXin Li via B4 Relay <devnull+fadouse.pm.me@kernel.org>
Cc: fadouse@pm.me, Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko
 <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH net v2] net/sched: act_ife: return -EAGAIN after
 dropping rtnl_lock in load_metaops_and_vet()
Message-ID: <20261122091830.3266fcd0@phoenix.local>
In-Reply-To: <20261122-b4-02-act-ife-rtnl-uaf-v2-102eba468698-v2-1-67c413c45928@pm.me>
References: <20261122-b4-02-act-ife-rtnl-uaf-v2-102eba468698-v2-1-67c413c45928@pm.me>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 22 Nov 2026 20:45:52 +0800
YanXin Li via B4 Relay <devnull+fadouse.pm.me@kernel.org> wrote:

> +		if (ops && rtnl_held) {
> +			/* We dropped the RTNL mutex in order to perform the
> +			 * module load. Tell the caller to replay the request
> +			 * under a fresh RTNL critical section.
> +			 */

I prefer that comments stay in "short and sweet" style.
AI and new developers seem to like long comments.
This comment has the classic /* add one to i */ style...
In other words the comment doesn't tell human more than is already
obvious from the code.
