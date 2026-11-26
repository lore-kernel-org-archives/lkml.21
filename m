Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696236;
	b=lgLJyQ5hmWwcPOMvnMxrKG1MCYMjP3IPBaqOEEmRqrcX3Ptw++0Pw8umvWCxmrxKyVwS
	 cZM8+6oZra0Oz+uR2BvCs+V0+A5D3v6MjM2Ws5GDXwCgyZnV/cO92EEHOKkMG3SdIhHkl
	 LZqGUa61Y/d63O+C/8T3kGhgjE5f2I9/IuV++MZBk/WFTEQpeawDff046FfnBxeXHYAYo
	 gBQ9jiXmdAb+R1NMUWn799hcMQ/IsMJpWY/6HwbT9Fwye1u+g2SN9YNAAjYAgiQQWZkER
	 XDwmX5EbXrpu6WNSPzshSzTsx67MXQJASQXdkfUWQy/RwVWky33282GK3GQ+I8x7ZSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=63ma5jEPd/DP2X+W+npb2v4pGvrjKq1tRkWvj8G+bR4=;
	b=oCRVNr/IMCuxKF2VVp5LfjUIlUEARoaj6QETXbGR+2XLBeF9N6HZ43OVUVvoyZjpT8au
	 LrVPwZjCnM7pqIB+qdGagDoU5+9Cxq50HVLJB4oxIBDBGKrLB9Jnq27Mke6nH1RqMMUOS
	 wty5kugtoNWU2tuBs5LT80iSiBRJSPRLA5S2mNYKB8DAukrmfUDXqtjJwmNdPA4oHMMfC
	 b2nQDOg7xjwi4dqN20vBi+MWM+jzXqlgLr9nEJedO5XUxBVA+8LKV4cUKvFejlMJayXTf
	 KrxSlRPMpUD9P0Omcnchu57KKTNycNzT8SuuxkHsNil9QJNlDSq9A5e5mMqpjMEvMzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBHDqqei;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38FE606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D38FE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBHDqqei
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-385d8a00598so10236576eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795696235; x=1796301035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=63ma5jEPd/DP2X+W+npb2v4pGvrjKq1tRkWvj8G+bR4=;
        b=TBHDqqei6c/mcTxI0hM5xqfOy0W0zplRonrs92qC3Qz9nrN8+nD4YNqrz+tTinKg2q
         IdWXnuWslppB3Ju1qm6vUzWdWZ1adfJiVKUcSet/oYT9xU7tTTIORL20cgvncoYA88LI
         8K0nr/s+ys8LnvAoykaKpQwRM2zYlyx/vL3MBijL6Qah6jGddyqVZrLEijEV70u4ASIR
         Qyz3A3/fAG5yiVkPd363Bhd3XJWWzognmWxUBI8fhp0ZuEBtxN+gvxcFkj1TRpQDwryU
         SPfMa/DiKvtm7V7tvyosW4aaZ6toYP9YYCWRApDMgfQGMA+LLt6WS3onVmsQlo4JUvyn
         womg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696235; x=1796301035;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63ma5jEPd/DP2X+W+npb2v4pGvrjKq1tRkWvj8G+bR4=;
        b=gnzf4HKCvRNUZRkRnnSPbGwqCytUk1HL6qHWqBJqZ5vixINSPxDEfGAHmrRUFffGwJ
         74Q1XUSKrNrFTH24aNrj6qVUOixNnGQfFogbw0DW6rViCaMc3cXIQJH+ZrlgJ1mhBPt7
         T9pAEFBlQ4z05Uzl4lPolPqMoO5Yw85U+fZoDNxni+UAMQC/qcuPataCudRzr16jj36W
         lKqUcrOwLCJY0AsxZTC5ySk2ZvvVapSCJS/LanP667L4iAXhW7MYB6IAlHdn0V0CN+z7
         3VcpDfG+cpocsndxbY4qh/c0rJgCAYIi3lpIaDfVcN0y1F4TUOj+3hLn8+qfykbKlHq6
         KUgQ==
X-Forwarded-Encrypted: i=1; AL+hErGUiRK2wMhJJDeNwtie5rAS2+TdU5iK3FScStMKrXATl9nPER2P120SffwBkettrnI/589M+2ubv9YGuRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AnVKgCSpjN0xJL5Q8uBPWZSvE1ya+QT8uUZiLNHC9qQl6ksLT
	vXVl4X2u+Og/8irSc4efd8gg1RKwlZvklhaAVdK6cM6qKOxHNeAWyUwK
X-Gm-Gg: AZFdTZeZyg3QHG+8H6bq98W2a17IppaJ43xh3aOBT5vJ2xeRBsNd+/uFhzNURKWbvDd
	fOQOY8gYD1WcN6EJfXgDFkM9AKvndOukHrZTlW+ULn8qm0kZsObg7VGwuX2xZ1fWoOuw8cIvasn
	wFzOaUgcGSwjkjcCiM85OfKdZ6Ku7YT2hhbuTqtS4qXzjX/YWA1REGIbc6Vgq+H90naZll43SOh
	fQGJ0Q3n7+u4ovOCbRQs3cDNROOwRQuI1OWsUTciiZEr3iwy6o6G+30EiFruCLSkLKDNgSmcZ5K
	OWsRlclPHuv80jP8rixYdZcJ0wpiar7mhXNIWgMUJTlxiVbsd7Yit/nRZDH//9AZ+Q5tp25FU5v
	5SLWpcfk4SWAm5hGkGZKDqiUkxl5WryMkWkHcY1zq5MF75BptjxXoQ+a/LPUx7VGjJs+ir+5jg2
	60y/ARyW75Q41/3wVRw9x4NB5n/L2waloOR7mgtb5cMoJXS7nsl38ygEAd3QAzgJYE6cxMZEGOP
	DSDnIZMKQSQLl7YDK4IBF3nmqNzatv5HQ0pTTxhtj+dmExmv88LomUXGXY+0O1zGtQi6j3JnsKJ
	kPRaxb1Le2HIO1hugU2NqaAt/Dgalm9d3BlmPab+VGJlxeiIR8raudAoVkyfujR/ySvhfRFpn3C
	7Kn3DjQ==
X-Received: by 2002:a05:7301:6191:20b0:375:e4de:96d3 with SMTP id 5a478bee46e88-3869e61da0fmr17122398eec.31.1795696234586;
        Thu, 26 Nov 2026 04:30:34 -0800 (PST)
Received: from HFGF46V04Q.bytedance.net ([203.208.189.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm61373340eec.15.2026.11.26.04.30.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 04:30:34 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: Chris Li <chrisl@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5 03/19] mm/swap: cleanup and document swap device availability flag usage
Date: Thu, 26 Nov 2026 20:30:07 +0800
Message-ID: <179569618256.54252.3159687265879392207@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CACePvbWLkZtdX-kedNHeFDRV+e3Hcyzixsc=9eENTrZVhiSjjQ@mail.gmail.com>
References: <cover.1795439990.git.lianux.mm@gmail.com> <5a83cfe8b0992c65cf4cca1e8cd612b4de0b78c6.1795439990.git.lianux.mm@gmail.com> <CACePvbWLkZtdX-kedNHeFDRV+e3Hcyzixsc=9eENTrZVhiSjjQ@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Chris,

Thanks for the careful review. I kept the enable/disable helpers and
the call to add_to_avail_list() outside swap_lock from Kairui's
original patch, and later revised the locking around device lookup
and SWP_WRITEOK updates.

> Why is this change safe?

Both before and after this patch, setting or clearing SWP_WRITEOK
takes all three locks in order: swap_lock, si->lock, then
swap_avail_lock. A reader holding any one of them is serialized with
those updates. I'll make that distinction clear in the comment.

On the swapoff side, what changes is that we release si->lock earlier.
We still hold swap_lock while removing the device from the active list
and updating the global counters. The old code already dropped
swap_lock before wait_for_allocation() walked the cluster locks.

> what lock protects the avail_list, is that swap_avail_lock?

Yes. Previously, we set SWP_WRITEOK and added the device to the
available list under the same swap_avail_lock critical section. With
this patch, add_to_avail_list() takes that lock again and rechecks
SWP_WRITEOK and the off-list bit. If swapoff has already cleared
SWP_WRITEOK, the add is skipped. If the add happens first, swapoff
removes the entry.

> May I suggest splitting this patch into two?

Agreed. I'll keep the first patch to extracting the helpers with the
existing locking and operation order. In the second patch, I'll spell
out which operations move outside each lock and why that's safe.
I'll also keep the original if (swapoff) branch order.

Thanks,
Lian
