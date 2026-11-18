Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008114;
	b=x+qfrczAyj8pGof+XOtb1+TbryS5BCilscf61TE7pXoooBb3xrxvKtFN1RmcM7G9M5/i
	 LKiwLCylT9tiOC7lx4DyKTJgF6AU5r7dba0CR5cdon4gbUYb/JYD2uDEIb+3sVLatlxsn
	 +iFOTEZ1ZDb/i1AOgP5xQqKnGUz2GYfnvdOMuicSwrFs7Wqwg3Dia9Byz94LvoOFgmFao
	 hSGRO/oI3bqij9LXXKDUXAKwllftXyp8HIT0j1Pg603ucKuusBE8ddcEZBEU918l064bI
	 UDgmJyaQ2bdFSEcCnr/4jjZBAjSKoPpvLa4ihK1XjEIAPUi6GEtGbA3XW46xHP5VbEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=p7Dcs8rqFWgV7vy5jckJd9/OMxXaRSwC9PD3XcVQ8ik=;
	b=T3vB9UiR+13+RuKFC5zdndT8Onu1tD8oK9zzq4U20k2jt0V7q+AXni/d68bd1GPlP+2B
	 kybfO/ToF1+YVsTKkzZyN+4IInRBXh+/ynexeD0USX/oMH5dpu/9JL+tL7NBNcokJ+82N
	 r04Le6e6q5tD5wxVzU6isKqLeB6pwrf9osNUhT/zkSWVQsyXGXcuiyUSlHWCotdHgxvxc
	 UkWe+c2uCoOh02FpRS9N2HXnR6Z1R41iAUKL3JvY27/l6HJIlaLijzfI42jIZSRSovsXz
	 xWYoYYHvOVFcizU0B4NwSsFXhvsX7xjo4YXX7SUR8lYm8puW65PwOSeosdu+XNBNdMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Llmgi4Dc;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DD6606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91DD6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Llmgi4Dc
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b467581b98so11465285e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795008113; x=1795612913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p7Dcs8rqFWgV7vy5jckJd9/OMxXaRSwC9PD3XcVQ8ik=;
        b=Llmgi4DcPx325HGQxrpRFLWWHauQKMHVrrVD7XSd9t+wRFKL/4riBJzMtkOl4Sqate
         8nlBRAPedu7tq9EalZaGeXlImuSahc8dfswPg8GGEE3YzPp3sdhSV6jJ7RFp4I7U8uYs
         a2lnOfUXTfx+qXHUty/bX74ZYMZxL5CLD7texNThaooTfMG7J5PV/m0IIOdWK6SUZu59
         oM8pW8sZONvoMjT6EZBxzbhkqk6SLjeV/WuKsQts9/JSVu75NU8j2SQFk1GpXyIylviH
         T8w40rbeSXJgABpY0DdkI0umRKJmNojs5wX18Bj4nP4y48cDCBYVnHBIDbGyYqxTjuLu
         nC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795008113; x=1795612913;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7Dcs8rqFWgV7vy5jckJd9/OMxXaRSwC9PD3XcVQ8ik=;
        b=s/Hya87F/RcBl9wnJoEKOUiCFpMi2gK8qRNNpr4dNeBBeZsn17o3neSUZHorAYTSmT
         2dNwm6cA0xFc+2riwYcNylu9J3Esotwb1pX34/hevpNL68EBNN3QOuJLa60kPPQwX9Sq
         c6++N9UKXamE0zUiA18HaMeGRMe+ETj5ptlaTs4YJij5f+YbfzWmUApnp1xpZMzKT6Qc
         /ZuT5lFKZAzsxjwn0lVlO7+hNl65mvOfeTl8bVVVEVSi4cn4zx8ttXuQFnisKt2nqE0s
         gvHcFRBrXYVzG5AB4A6W7g1JqOoUaPsiKI5Hewc26zTEz8mFWWYcPrcHf+F4PhcLbHZM
         BkUQ==
X-Forwarded-Encrypted: i=1; AL+hErEeS1XHa3hfmfjJHZbMp5jMl4DXCOU54Iwx1FnyeR7L3iNMD5Z3k/N03P90neaeLkA4HHw4DDPp4cQ4JBw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LM7D73D13OfVYlL4MyY3tkMqrXWKHSF2YiAcq982Pq9tzustN
	JpJRDhmpmhXFtGLID+IcDplMd2XfMI4LkPcyf6mno5Nixw5sIo2P5ukt
X-Gm-Gg: AYBFou0aR6H5uicRIGFSYWc0FNZj+XvYZVSZNmSYj72YP/Sm2oqdrIaRmY6e4B2VzM7
	Ui6Hl2hZhR7XDmGledPWfbCMWHKu7d3yQpSP7aPBePtTFwAdidSu+L+E33U7JdU+I3KvokYF0JT
	URYjusArq/VDHppHE48EdCH/gOpQdY4MmKqiYUQEClJoXKs0vGUBiAiWQGVFKwGv6pYLmYCIrVF
	qfdBW3yw9k6sSkFLSNN4BMN/8FMpks3ljs7zMMGszdPShDPaysjGvxf/lnyAoSHI3lyWbIpMQVO
	xmtazg1uIk98uUgRVb8wauxQrV5CgllBbcZ4FBDVXhFACb2Sz8AXqjEy/DaEumSHzsQZj65VfQm
	9+RSnqiAeYpBTXkYD5hM2EXUw3g3YOXvAOk/AJfpbYqlST+mq5csbcF40KBbRPR60Uu57oGeKtF
	XwqYxMNsFp5GhitVsTDfm9wlgj7o1KdkMZS1appYFWh15CpO2tX+k5TuIZ761giwAqiFAMbHCUH
	cfFaNPnAQ7xJuprnu3on8c/tR2rLhgIHmH7eeEyDKH5onVaA0EUev7XePxm8e7mV3viAo2fjdPR
	M6ypSU69j6xSn6BwuYCxEokvHCHMNMxqjRRHkYWWmPFYHK2JODdKNiskvOSMhWjlzo56V6IEcTR
	CjIXKdh+aFA7AMNE8/WkLnVPsVrRTZiDHwQ0=
X-Received: by 2002:a05:600c:4f4e:b0:4bb:7033:c92f with SMTP id 5b1f17b1804b1-4bb7da0f671mr58393325e9.11.1795008112703;
        Wed, 18 Nov 2026 05:21:52 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65541f3b3sm4899303f8f.23.2026.11.18.05.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:21:52 -0800 (PST)
Date: Wed, 18 Nov 2026 15:21:49 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v2 1/3] igb: fix RTNL assertion when resuming from
 runtime suspend
Message-ID: <rab7ustlezklu43vnjkby5mqh33bgqoztlz6bv5wxkjqfvbtfd@imjngi6j72nz>
References: <20261116153041.3002666-1-antonio@mandelbit.com>
 <20261116153041.3002666-2-antonio@mandelbit.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20261116153041.3002666-2-antonio@mandelbit.com>

On 16 Nov 16:30, Antonio Quartulli wrote:
>Since commit ac8c58f5b535 ("igb: fix deadlock caused by taking RTNL in
>RPM resume path") __igb_resume() doesn't take RTNL for runtime resume,
>but __igb_open() still calls netif_set_real_num_{tx,rx}_queues(), which
>require it. An asynchronous runtime resume (e.g. after the link comes
>back) then triggers "RTNL: assertion failed".
>
>Skip them when resuming. The counts are set again on every regular open,
>which happens under RTNL; the only case left out is a fallback from
>MSI-X to MSI during a resume, which leaves the stack with more queues
>than the device uses until the next open.

RTNL is not held only on runtime resume, it is held on a normal resume.
__igb_open() skips netif_set_real_num_{tx,rx}_queues() for both resume
types. Maybe it makes sense to skip them only on runtime resume when the
RTNL is not held?

May I ask why is it okay to leave out the fallback case, can't it lead
to trouble if the counts are not updated but a fallback happens?

Best regards,
Janis
