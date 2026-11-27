Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772680;
	b=BP1Hi415EXuMupIaP/lxFwNUxfknR7HDpAPjHozOvxGkWKhNGQ48rryVB47Mw56jr/+r
	 t181c5rLDGMD/u58D37K43YWIRof7flcSrsH6MxAwzxKalnftKsZ056kpTRPsVKA4r9sf
	 gtJwW/GGdh1sR9aFoXHAnapfIyKdAMgCBOLmytHIi39i4w0UE3iT8/QXfGrsjFqnpbUnQ
	 xzQ3vubl5uJGVXi+AtUwSu+swvicVZTVLL7Q3RTeSbQkuogfK0GKlY7eFSwYggOyddp5H
	 aDBDxfqA5VZpOtZybQ0pGp0UUTnQPZUhIREJafFKv0R7ohb+Z4oI/LAeQaa+vJ7LY0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cykXbyQ1zuoVlOh8IpIbHTiOvsUeycZWPIx1LYq5lNE=;
	b=o3tdkul9XYG5raFDHIbPY40CNLj3fKR6jq7TuJQydOazLRNlZ290eMS1ZjH0xxwXHmVC
	 2YSlkM6Ro8w/dClVICpAQUT40AqCioK06G/3ruEmy8Vj+xkxJqHSGimH+rJgk9NRPEmYA
	 WQc/KTUrgxC4AqG+Io8lCPbilrB1EP9ZGAc+ieixrk96eoHoyG7bqlBpISIrNN0pX9c86
	 SnDxPDoN2V/QhgVDfepus5vfQtgNd2W3V7GYRBNcyHNy98HN4eS3jFhfeItjweuKt/5as
	 PAGC4uQu+D2cyA6EyTGME3PmWYIOOa1w7Y2NOTL6/mZXkJlTPFHc5TXlJng+wCE+iYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=JEMfPvrh;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5CD606A330
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F5CD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=JEMfPvrh
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38644aedba1so11791003eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772679; x=1796377479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cykXbyQ1zuoVlOh8IpIbHTiOvsUeycZWPIx1LYq5lNE=;
        b=JEMfPvrhd/O8f4wNesuPL6+v7mLzKKMqsfE2oIaBrYCpSpyTWsc4XIwBnXCYmHlAYn
         TItZLpydmLHbbLeHL1Zz2cX/qTojDJg06VZ4hnxK1A9XNb/yxQYyiqx9VAhP69v/1gjJ
         lwvHEplrdIqAfSA+b2Pvb9isAv08e9RBdnNpyDlQTddfCjK8aeV1MuHqLwmt/mZSx7PY
         C/3QF6aZMxMM4RCA0sT7EtpsxeCROP4wQdTTI+ByfxrXdpqVzol6n7lIOMr5QbnXoK6+
         O55INPYwLZ8ydn8ZgrMZ6A9Gpay7w/foVIhdAgfPTFZiuO93aX3iGZ5Elqj1v/WGtEB4
         +W1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772679; x=1796377479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cykXbyQ1zuoVlOh8IpIbHTiOvsUeycZWPIx1LYq5lNE=;
        b=QGH7hHpXPpMqWs+nBG48forVeMGhYksed4/QcmvSyGIWTluqXkSH6v40UNIrHAuTFt
         qD0XlJJB726eo1hqPBhA7sd1uXH6Mk6H56b3v9ppe8XaYztJ/0l1LHz9nrofHZCUYUCI
         Quz8qP876VYt/4CBhJNW6fIS8PLJgWiCWC1yUFYJIgJt+6RLLK5Dcqh1sc5rDikjWrKi
         FagZJscBAFRZ80MlYOT1u/BorwisFgnES6aS9lUrX+EIXzqINujRvdF/qOKv3dqaVt4z
         ARRqAFLz2Jo8JdT3Hc5nfZsefs3N+7HgoDuq1NSLvP45DK4iJqFZ8namCbZhD2DgvH9i
         LBsQ==
X-Forwarded-Encrypted: i=1; AL+hErGnVTsBLVUFXhxTO8Qfg2wN/ojZ7yazHuwu9djqRi7GNwwNmmCCuUQNBDgfk0zB9RjpBmT/FuJENJc03zA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nXT+l7eltpikso7Wl28OKFkIC3genHU3h+tJprqkuxl4VqQSh
	Wxh8yaKNMTnYY8LFJVzxgGg3YMcsAgJYp248Ftvwpl5hEqtgS73bXtV4lA9gN8JNBF8=
X-Gm-Gg: AZFdTZdHP0LAr2B1YNSqT0e3IsAJr/MAqU4wFtVh8h3vo6TLnFch+R2lUh1qxg9D8dS
	Sl4EoSaVhPINOq6VAepKYpiaoEYhxa2KMqsBjTb9UA501qnY8EfB1KSJeEd+U+zGJ1kUsBPNRY8
	bdYlxrypkFZoBSL2GnI8uFV7XKQjyjlTujA/5aLR5tDKVVlCuoDGqIjCoLGawEVdZitcTOiAKY1
	wlFI2CsoLdNMZiVyJFTHKcg0vrVVW2Lkv1nmNxTBAe4WDackk/SMKhvW6mWCJP2mVScxm6CQ7LA
	RU1F3szCYs9g+vBieYoJ31HVBlRwFUk1+kAx9mmvTNtZnger/YQ7tFZp4f/V1WJEkcSIFJxkVdq
	2d8DIOXmJtr6xgGInbwNEAmmPWTyOcA7gfyoorgKb5s4u1pttmkbyc4mO7V8emKwDror4lwusQU
	Rx0i0AXGYpY1hme6DVc86wtiuXJJkmJ3NAipSf4dxnCwdfi8GSYauHs5uim0pYQsz21StQjg5Kg
	EOZDo1GBQOAz49ayJm1v2JS9txujkElmDCY2MsKm8CMdq2x5qE37nUBjfykKP/VGwRIVCbpf2fb
	f+rS4LWUSwD5t0HqZuW50L9O5RDmjkHqHgQITYOhgZxMWt4QDhSYtqA1jyAT+QbeH66b39Apiwu
	mbc1hQ+tgrzfF1sJikypZQHz8skr2E8kS2ZqftdqfIH1xGX5XNg==
X-Received: by 2002:a05:7301:d587:b0:381:d92e:ecab with SMTP id 5a478bee46e88-3856f25884emr21980805eec.11.1795772679191;
        Fri, 27 Nov 2026 01:44:39 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm40436428eec.0.2026.11.27.01.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:44:38 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sashiko@kernel.org
Cc: ap420073@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	horms@kernel.org
Subject: Re: [PATCH net-next v2 12/12] selftests: net: add amt_gw_v6.sh for the IPv6 netlink attributes
Date: Fri, 27 Nov 2026 09:44:36 +0000
Message-ID: <20261127094437.2968407-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179572062595.3135.5756555149194177847@kernel.org>
References: <20261125191450.2497936-13-omar@blockcast.net> <179572062595.3135.5756555149194177847@kernel.org>
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

On Thu, 26 Nov 2026 19:17:05 +0000, netdev-bot+sashiko@kernel.org wrote:
> Can the first case arm in probe_v6_gateway() ever match?

No. v3 matches "binary attribute size out of range" there, which is
what the exact-length policy reports, and the message quotes it. The
Low finding is fixed in the same place: the probe checks `ip link help`
for amt, and "Unknown device type" and "Operation not supported" skip.

> Can this FAIL branch be reached through anything other than a
> userspace limitation?

No. If the probe link exists the attributes were four bytes long, so a
readback that is not an IPv6 address is an iproute2 that truncated the
literal or prints the address under another key, and the kernel did
what it should. v3 skips, with the readback in the message, and the
branch that failed is gone.

-- 
Omar
