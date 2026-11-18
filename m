Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795013741;
	b=ouKvw0KwyAWjx6WuY35Z0Ck2AGOmiTDuNNRkhTf5eVD34amtyC9NSxLoqttcYXFSaY9b
	 k0kQA+bQ7Q3MaNzMygUhDnJ3OBRvxh9LK9VSdUQXctFWtgZtPj4oLX4kLcPNP3T360vT8
	 oaHpkC2abe91c1i6ZQWizWA1ZjOb2pfMSwlUM6x3UBGs1QU8dq5UOa+4y3PLG9L+5L8Kk
	 RzL2If34nJTH9hrhniwfyaNrVh2/e990+po3Fi+JLnV/A6JXHmUcp+07KivsO/rs84TPB
	 mP2480VNV8G/sEdevxnv+HWKW0oi3BedgLAT81VUW1NN9hxHcnk5HOeaCHZ2aI9jc+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=A1AMia2vi1QSpUOJn8VNp1VkrqQ7LwCEUZO4G/j54mE=;
	b=JpO5gL47dS9Qh1sECdba5JBrcNqhl5B38qbeHO5IfMqH/j4ychjaFXUJTt08oKfPpbC2
	 a71YIEZqFLYovn/HBwE4eCuYRxH3yplUzL6xGcDF7as2HeNN3NHLquSla+FQTp8HSJZy5
	 iZJQOGtO36LTb/FTYVT3bSuGkotuZD3Yjn6lWN1zHLZiycNPPgWWljAiEaKUFh8mvvfcZ
	 ZeKH2//RVced3F8dQgsqjIQvl1ugo+JE85WORp8TIaXmZz/SHux1+RVGR+Jqz7QNEK7tq
	 t54FyGk2pnlbfJUkClkxCr7cLQL4ixcVqzlKYZ1aX7jLdhEC5D2xnrBp3Pf8FMq2ajw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flashbots.net;
	spf=pass smtp.mailfrom=flashbots.net;
	dkim=pass header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=cHd61Vja;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EA7606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23EA7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=flashbots.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flashbots.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=cHd61Vja
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8470d7d430fso564231a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:55:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795013740; cv=none;
        d=google.com; s=arc-20260327;
        b=bWsBj6wDflKDbofEEQ+qAPzUPUy9DKw9y6jK1thPlSI0wSkWZyt+fgqsVqMaGAr24x
         1mHZ8bqslpgRAdGmR9d9SOsx8JivnJe356GwKzwUIGevWdeELd+Z99IQd/YRhFRPLNvG
         lourU667V4kOOCvf8/XvRhJ6ygIhcYF/PhRq1i6HPD3g9bvaAAcRXOIRgBTEerTR02y0
         ryhyETwL9ivuiDMuXcjfU0CRzpMsZ/UjL/paS10PrPZr5b4JtqNXhVGb650Mu47XPYMf
         zIAuCqK+nWKxCBEHOoGA3+PeHR0eonCv/k+RSa1uWxuiK1pyqUKe8YkGRpDjzWUpA7rf
         Epyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=A1AMia2vi1QSpUOJn8VNp1VkrqQ7LwCEUZO4G/j54mE=;
        fh=uSyD1tFzwyCV5ufzMKE5ZCMDMwYG/kANYYQw5LyeG5s=;
        b=JQ2uXZXl49NIFuhVNeJHJ8vwwuskNtJio1nBG+O64QZlHbW4L7P2T05DUvWVT+tKsQ
         7VMh6bDI785WDlms+fh4KLe0ayOG+EUy0diZCxaBUUX/tss1byvNAcVKsv0zXWf4ExZ8
         UO+hQVD1EBt4lqLvpITBdlL7BdmoVT0O4JkDVXeFaGkKqzyz8hv8oIiaQJfmHDfaXQNU
         x0zgW5XbaBl/8ogoBKEhFC6SH9gNDGU+sspymxahuxp1F0D8CenZqFABe4zDsVc6PDG3
         hOSqzhs6FsKU4UpW33DQLT8RLTJUg5cHIHoBOlV4RQnhRdvzp9GVdJQaufhmvhVWGCmk
         mJfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flashbots.net; s=google; t=1795013740; x=1795618540; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1AMia2vi1QSpUOJn8VNp1VkrqQ7LwCEUZO4G/j54mE=;
        b=cHd61VjaSggyMDg7PknLa0M83mt6nX1/AJyuZZRJIbyeE/cwFkK5TnaQSymRVutPAy
         P3WyQyTe4mvkz+/Z3jDryMZklVVB9VkUzzwGOm2j1R5OO+n3HeXA3x4aPuOh5C6oTAQX
         0mYxfq6rXZNh5YnvR8k4OHZHSpuUwE9y8lN6V5KoTo9qoDJjOZtZrjQjmM7NtMu2kNA4
         Bk+b3cSYrd74/4h5WhSoN82SLgAw7SbsPKQASWPpLeoh30jatTf+9Gs5gW7+tn0qfY5+
         ka70TBQyJr3QV4cG7sXL5vKXdrXEznDj+SJ6hhTRlgwYAt6vbEJWQ64uQgCjZb7hHKOf
         yOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013740; x=1795618540;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A1AMia2vi1QSpUOJn8VNp1VkrqQ7LwCEUZO4G/j54mE=;
        b=PzyPH3OUxVp1NrnVsh6Rm++pNGIvuaVNCrhg2dFryjA6EkB0VD0Bo3Hyzo9d8+rQE7
         G+ClFVeJ63Jf7+JK+w6peZvaJuJ7uzGxuG0wgytpUgg5s74eTaYwXgw4SmuV1g5IOKEf
         iOv3yM2DO+yMa2WKh6toYaFaOIUb4OQwWgx5y3tpcvbO6ETCkyI7T9LmMeUJcEf1MvMe
         eG6OaEA6vQ4i+JnO5uYzMUQ+n1TcZ0RvjABBt2yMMsUSHx1k18I+/k8KxIjOrSq2tk3s
         W7MC5t8tX+KgNrVsHQVUG7QU6fDyVbftxOQvVEqZmCTEl8WqTQ3R7Oxfalckuvjb46U/
         jOCA==
X-Forwarded-Encrypted: i=1; AL+hErHB+cwG097zz1oEb6etHRbMW/+pYNHMDvsRT6BccE6Ry6cM94DAmhjGd6gV3q+I8LK3NzYk3f1Ue9D+MaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z++hW7vFQZx5u19MiOh0Qb0wvpoFkq58+aXSQpJ3YUypEJY7Jio
	nP96fnQDFJ6LpoOIFOe+ZJt+D40+wgaU3r8n+JeCKRrO4bb+dAF5bR7+hyYoNIHPiDZQ8/Bm7mQ
	ochpdHHUbHsLkgR5QFROcNqFPa95y3C0WYk4xF30NgQ==
X-Gm-Gg: AYBFou3agOh/kMd7c5gQggnDPRr30L8G1K04Tj23oK23Ybi75L6/6lZ5aLb7lmGnKJX
	EyQakCQIZtoPE8RXg3VVeBjHLurQtxgkmI4XkgD8V+T+8jiRqChJrtjrnFxfjU53FiKPBnCoO0B
	8xMvivoEqUBeR80k1YWa6qhRPYEDjCWtZ8XVOGoNjXREfBW5GVt6c1raMmnpAqdVducMdLnjKRg
	/bpzAoBvmkcRNoleJ1Tm81fKAaakD4D2Ba5XptRnIx93xUiyJixJeXRV8j2j+KIwGCdzun0mkxA
	iueVfYydf5wBL2LCa+n5M06gmtqWe6OuZmnHiM97ORNaf5IbfgmoVgWHG76cL/CAAwVADZUoue9
	+Ay3Gutyuzt1ENUerVQKjvJhptqCWGr5iO7xvQxGQIhUBE5C5kDc9bSOxRYoykop/9zq8wPjfL1
	+baoW/UHx8ZkxqhoUWKxIOd+szkA5zp0CJhjFCRX2CAcwdbNaek5sCxQiaggTVPK3HMULpCf6j
X-Received: by 2002:a05:6830:2b24:b0:844:4959:e856 with SMTP id
 46e09a7af769-862f08f6d8fmr2997887a34.11.1795013739853; Wed, 18 Nov 2026
 06:55:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-tdx-guest-quote-poll-v3-0-6a83bb767314@flashbots.net>
 <3b582cdcfe37f1d01ee71611ab2611f845261089.camel@intel.com>
 <CAKV3HMM9BKpmgWeFqRqamAsqqiofj+TG4DrOEHmbUyE0FjA7+w@mail.gmail.com>
 <0f9ba1a6acb57a8c126739175b4e38dafac08c9d.camel@intel.com>
 <CAKV3HMMfx4APmardWdtL8yhirXMuuBQMZ8xrtowHNRnTKXNRiw@mail.gmail.com> <86f99f3010775eeff6269fd9bb8f4edac10a7d85.camel@intel.com>
In-Reply-To: <86f99f3010775eeff6269fd9bb8f4edac10a7d85.camel@intel.com>
From: Moe Mahhouk <moe@flashbots.net>
Date: Wed, 18 Nov 2026 14:55:28 +0000
X-Gm-Features: AclHuK-d2hbNILXughUCStMRcZnLFB956aXQFG2DezCp6dotXFDkjtwD-G3N_ds
Message-ID: <CAKV3HMMjyHig6LTiCsXKLvgvsW+0GVitCc0ziBD9RNxH2TAuvA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5B=F0=9F=9A=A8ext=5D_Re=3A_=5BPATCH_v3_0=2F2=5D_virt=3A_tdx=2Dguest=3A_Fi?=
	=?UTF-8?Q?x_and_speed_up_the_wait_for_a_Quote?=
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, "kas@kernel.org" <kas@kernel.org>, "Miao, Jun" <jun.miao@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Aktas, Erdem" <erdemaktas@google.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "djbw@kernel.org" <djbw@kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2026-11-18 at 01:28 +0000, Edgecombe, Rick P wrote:
> I'd think a simpler shortening of the time would be better than something more
> advanced. But...

OK. In v4, patch 2 will replace the backoff with a fixed 10 ms sleep.
Patch 1 stays as it is. It fixes the timeout check and is marked for
stable, so it could also go in on its own.

> Shouldn't attested TLS just be used to set up some other key such that
> subsequent connections can be as fast as normal TLS? 0.1s is still kind of slow.

The 0.1 s was the total for ten clients connecting at once. Each Quote
took about 8 ms with v3 of patch 2 (median of 120 back-to-back Quotes at
HZ=250), and quote_lock runs them one after the other.

Our HTTP proxy already does part of this. A client keeps its attested
connection open and sends all its requests over it, so it needs one
Quote per connection, not per request. What is left is the first
connection of each client. Many clients can arrive at once, for example
after the TD restarts. Today the last of N clients waits about N
seconds.

We don't trust a key from an earlier attestation for new connections.
If a later connection relied only on such a key, a leaked key would be
enough to pass as the TD without any Quote. The recent relay attacks on
attested TLS used this kind of gap. In CVE-2026-108269 (CVSS 9.1) the
Quote was bound to the TLS key and a client nonce but not to the
session, so an attacker with the TLS private key could relay a genuine
Quote onto its own connection. Binding each Quote to keying material
exported from that session closes this. The exported value is unique to
each handshake, so it also serves as the nonce.

> In the end I think quote based attested TLS is not normally expected to be fast.
> So is this trying to optimize the wrong thing?

It does not need to be as fast as plain TLS. But the second is not the
cost of attestation. With a local QGS the Quote is ready a few
milliseconds after the request, but the driver does not check again for
a full second. Any user of configfs-tsm on TDX pays that, whatever runs
on top. The patch shortens that wait. It does not try to make the Quote
itself faster.

If that works for you, I will send v4 with the fixed interval.
