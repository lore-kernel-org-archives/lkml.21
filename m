Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441835;
	b=uKRM1+NZEKXVjw+FD2f+xmmLVOR8F4pkQeojLweU9rzfQYK3FXtPSw/AOUV7EBla6ZD1
	 cKOL0XmpGeL2qntQpU7ExbFn8B8hHEGo+vsRFY9c6ZYrtV+ebkE3AsM+/IR9uHjNNjsbE
	 HPU9YeAnpiVVFbtRsWwa2IC0RVaJBjOm6oSDDzGym4Q//6bjQ9mbrimdy4tsECXbGTWA4
	 4dqeet46+7Plf9lE7QwF3mrq4RlQUS/7LTVwuOCf9kd3S9pfrGOQ2bmimCH21/JLPwYVi
	 BIQC7Sb9y9fBi2IrCVL4nhWu5rs/meyfwJtraUbLV6bwQxIbnRzUbXvdrJbasnth8tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Bane91NP8+Gml15ubrXTKh3benjzD/ALRcScJf35bXw=;
	b=dr724ar4wMYhUqyOo4x/FMGEooOnrOH9HpeChPlTagnXGUkpERPRkC8CK0b6/GPfPQ02
	 kfdnSHW5Up9Q8YKWsJ3uFQGkSTh7mRY70AC0UHHD6GlV0hCWw3PB3mCOuV41ToNFyld7w
	 /V+VpUhi4cC1Iylsxupg20knO3GqQ0xZo5axdZvnU8/fwx1XQ7RHLiHyweg8x/ryyMGdD
	 qH0RQxSdvtKf2/0iSeZ5v/BucyMfhclsfmIEKqhzoGKlcuvhIQ2TqgWml83u/TFkQMO+0
	 dtpLri+pQlO4liJG0iRDYivjPTjBNtmA7N9yYpvw+YUDQhwqlqZAvmtC8RAEK5j12WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPTrwrK6;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF087606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF087606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPTrwrK6
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so631786366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795441833; x=1796046633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bane91NP8+Gml15ubrXTKh3benjzD/ALRcScJf35bXw=;
        b=xPTrwrK6fyazwXD6N9sRU8vdj+qov9rx8UD6+1pucPMFc5mHpXv8lKESKi6C1mJzb4
         ycZ0zXWRChTZshQJ1cbaXYqZxsUo+LicJygjVF6eM2kbd016s8ZjUmU5LhPu8ZHJq1/r
         mZITZKW8W8oqzTlBdGfiEdd879Oz7h7WFSwj6IJ3nDSMGug2qNM0tCumlY6DjLCn3x0k
         aL/YIk/W45HiPuAAufNWVdjLBv+ZIx7MEX/X2T9iJMK8YgdjYrMAcqTUeGjBu0gFBUL6
         R2kjwhNz6ET0I2cUVomvCJJ4zc8TukAuit9/P75HyzSPZr9nNU+WZQWamUxseIdC6wvd
         sx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441833; x=1796046633;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bane91NP8+Gml15ubrXTKh3benjzD/ALRcScJf35bXw=;
        b=atEa6PY8NXweKRRc3A5bD9mZDvfwTn9eg6/bRElYAjZamZl4yn3qqJw+G7q6NQEyCt
         ntIL1jWA2zT9kBM4pEnAaGyDbkZsQDlgT07BJw7JqT6WX6LACjKCT96HknTsTqTBP6Ng
         ofGUU1oprmzelXAHW4g+0uNmkBMm0yfhhahSE70TJ2vh109ifGqaY2xbIpgmdZ7aoTlD
         UEGIsCdc/nJ/lB+WsOS+T+MHTQYqjORa0Q78G2MiawS84yib8i3wcFS1zlUjO8HxQNlA
         vH97IeglJvxzt8Ug18k7KrRcicHl9MDvAwimxT3tB2l28ukxmCOFG7pcKp21rbL98W0R
         RuxQ==
X-Forwarded-Encrypted: i=1; AL+hErEWWZN49VpPUnPg+4H6qgp14eqX9CKtla1BdsZ986IFZ0SLaIlWepH9GwO/q19APWppeE9ZbB8fCJymCTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6UYvQnqnikAPUVGMRRZE5jG6JFC0PQF4Npq+vij+THe2Om+UW
	7Kcev3CXtRfgmdiOX+tpkD8/M5A8O4cnSsJJP+H1SwTl+Ept16bwxaHk
X-Gm-Gg: AZFdTZeM92LDp6c1AE0gSAkxzNyLeyzbUZ2Iy/El6QIdm5ELvupWfb54gN14L1i3Mzt
	H41YBJeWMXK/5pyyeLosK1G9ZXfNhlAHgLAdqGlqt0+ONXbQpUoWrSYzFQ7dlVXce1fzUPfLQgV
	UoeiRfV2cRjqXHcMaYD3jPL3P/2MXTnk6qywwb5753jYpQSRUGPeAoRuvIuHzDQW2MS/vQvCirD
	qDYYav5XLwX0gdUgS110p/HVn0sXuUFJxTR2oHyDJ+fdFGtPpQYGCjPB/7frOcObiv/D+3nuRAq
	YMZl9FvYfhGaLbKekdbjr6BlsjikLqLyHBGwhAgyv41kXZ0tb+zmgx0qhz+Ht1/BZjb42D3eUW/
	euXsFKtWc0OH7rtyy7fju/sHUnR8d2QhTaVO6u/UnV7Danz+LT5WNu1OkuXaOifRn3X0lfEuCql
	t7ntaewH9t6oweiKadgyLnSeSkuCYEyDf4lq0PgKZOTK/Sr9kty0jliXdogZYPXT/3dbjlmNkxI
	X3UYQZVkqXMPbpHZq9YcX51/PdK9ixY7/cfva3CZpdSCHfFnS1UPjHy1TpLVA6GNTRE16P163Fc
	3fO54FqogYNUe3ueAP7GFNbqVF0bZvtQmZvgyQ5rgPu+Yo/zYmauJRPoYJxO/v0omc0zs0L5pv+
	WThKNOmEg08aYs+A1Ufj+MGaYxXjW4WmHN+FtmDYOgpZTTEXfHEyB21FhIp+CPPlmE1xLXrJQVT
	Hdndo=
X-Received: by 2002:a17:906:1553:b0:c50:576f:b39e with SMTP id a640c23a62f3a-c513ab0cf13mr612886766b.26.1795441833283;
        Mon, 23 Nov 2026 05:50:33 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm410984766b.8.2026.11.23.05.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:50:32 -0800 (PST)
Message-ID: <c60f3a12-4a54-43ec-b1e4-45bf43deff57@gmail.com>
Date: Mon, 23 Nov 2026 13:50:08 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: io_uring/zcrx: copy statistics lose updates when one ifq is
 shared by multiple rings (Data race)
To: =?UTF-8?B?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: io-uring@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <375d4b.2ad09.1a202324f3e.Coremail.xuhx@hust.edu.cn>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <375d4b.2ad09.1a202324f3e.Coremail.xuhx@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/22/26 07:39, 徐晗翔 wrote:
> An io_uring zero-copy RX ifq can be exported by one ring and imported by
> another.  Both rings then perform receive-zc on their own TCP sockets,
> but they share the same struct io_zcrx_ifq and therefore the same
> ifq->notif_stats.  The statistics update is not atomic:
> 
>      static void zcrx_stat_add(__u64 *p, s64 v)
>      {
>          WRITE_ONCE(*p, READ_ONCE(*p) + v);
>      }
> 
> io_uring/zcrx.c:1337-1340.  It is called for copy_count and copy_bytes
> from io_zcrx_copy_frag() at zcrx.c:1770-1771.  There is no ifq-level
> lock in this path.  lock_sock() in io_zcrx_tcp_recvmsg() is per TCP
> socket, the ring's uring_lock is per ring, alloc_lock only protects
> fallback niov allocation and is released before the copy, and
> ctx_lock/notification is taken after the statistics update and is not
> involved when event_desc.type_mask == 0.  Two CPUs can therefore read
> the same old value, add their own increments, and write back the same
> new value: one update is lost.
> 
> The effect is limited to the UAPI cumulative copy statistics
> (struct zcrx_stats at include/uapi/linux/io_uring/zcrx.h:83-86).  The
> values are user-mappable diagnostic data; the race does not control
> buffer lifetime, DMA, reference counts, or packet contents.
It is racy, and IIRC Clement dropped atomicity at some point, perhaps
for performance reasons. I don't think it really matters though, the
main purposes of the stat is to be a flag saying "something is wrong,
setup steering rules". What's your use case? For precise statistics
I'd rather prefer to add a trace point, which would be able to do it
the right way (e.g. per-cpu counters).

-- 
Pavel Begunkov

