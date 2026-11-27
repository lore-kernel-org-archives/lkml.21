Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772674;
	b=AdzwUw4gfikS5OHwhubl7BfgzGhhfB+QvFszc1falTPGDJq/BHRsUnR5bZ2CgLmiDLi0
	 ZfmETvMlnVvPhLCXuETZwcPzTarz49V5C9SewTPJ59BTcczGYFO0RfHIPiefdZZk68Tz3
	 v2KdGswEMlvL/ouk+XSQew9FthPXDvG321Zm6JmPx0KPSYMgJ94XHfcnTE4V2UqBxyBSz
	 pA8HEg7SXN9VWhGDrqaC1kvRZGPH3jGYPE4EL8nPvTKVog56a1xxGbHlpW1bRF6u5X88w
	 pEPoVJnMh5L6q9sGE4sniGlUA2GwN2MJbIsoi9BDYe1VMYbFsISw93PIyfLyBndzgyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zaR40rZn8yPO10crw6SvlKKbSvr6UbmTuLHfOgeH+mk=;
	b=BxNb4d99d526P7r3Q9GKbcn88P1QDeU6D/A8cidzgscNO2JGSXfbkNKmutPcQWypM0/x
	 NPgcTH6oCgh9sC0luBL+Kawu+nF9hgjCAo+5n62cGGpbWIGAwPEZnF19YK7EoCs3YLPyd
	 NIjOlp6DCfcMKvQaYgV+Cwc/QuU3Zrj36NPZ92j+Cffcnd0OZ7ID8LGK+qjNNh/KVtGLv
	 41LHcn0KDWVF8gV072qlK+/v6t2tw85jPo9KSRI/bumHZECoynSryc8VfxJuzxJpOUcZa
	 gWHkBUHau8wANefHkN3mvWkhwV3r4kIPCF7HFLQ2lxvKv+ZfczBJ0IGsJMFN0OAF/Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=OQMiwSvo;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4560E606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4560E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=OQMiwSvo
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386c71feeeaso4378454eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772673; x=1796377473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaR40rZn8yPO10crw6SvlKKbSvr6UbmTuLHfOgeH+mk=;
        b=OQMiwSvoRS0arb+/iKbLrljP+Gyej0yR6IaG/GtROOzm6oTeupbSBCD/gbfjEglxm1
         hHBByGoc4FAzy3GME5EHq/S2+ZZoTfEAKpmdk4ediSvl1m4gG0FDpKkBAY4wXIIuBGJo
         XokYV7t7UW/JO87gjGHETnG8I2gh2JXDWj22c41S/Fu9NyR3cSNHkJUhjKUAvXKXrNO0
         9cBqxhnGqTHzcbANyvAMDPW40XSM7BHk3FfNiHVA0spG9kUBj46Njr3ZVJBjD/1ccZ67
         BM18/e90f07CBsRBXvpPYwNQV0HKh8BH3APk/DICV4DpfFVRCmA6woVY/jkW06vqpDPQ
         fO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772673; x=1796377473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaR40rZn8yPO10crw6SvlKKbSvr6UbmTuLHfOgeH+mk=;
        b=XtqKtf6UQn67Rm82fM8/uoRj/3gTmtND6Dz1Xdc3RTs1BcVpWRJBbAmFSMttPwYl50
         yv1+WdgcGj7/4ON0FqyRkn7PTFwM+Y4RVVubOwElbveC1VoGlMlnMGE2Vne/dVChlL0K
         jnEOLqiJ6hpjuhX+yn9i5qyKo7ee5xLYsS8fx3g75dqxzYfXKHd0PBsVoIekSr0x/e+X
         q+VMgYAX0nvvRYoBqWOez2HSiKYgPvArbMJI6lbcz7ZiLGZC+Fu8DnuZ7LpZ4ITIf9rm
         n4keqQTsfIQUVuHAf2zaGFxXucUpXTttU1Hn5bsl/mk/KygTd2RJ2skUjiCTnzfWgov/
         yA3A==
X-Forwarded-Encrypted: i=1; AL+hErEC/XQsSiQx0jYV1MOqyeGIpqStEg3R0dwwzaPwcIgHB1fjlH3uIep+E/59j2YUyUAozmddl5sh4p1OjGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tdZd3hdBeYKyUfrsySpFqutvh0H8ZDsVKoporUMieiZQj7L4L
	oit2k4m1SuHDj6Ju9x3V9d3fARuVnTIkf86nN78LOoHu/g9hjBaw8ARpSe2uCSwuTK8=
X-Gm-Gg: AZFdTZcg9X0gLAzVifBCBtRGRTonKVlUqA5zxEcRcVtO+tUcR+TlXBiiGxb4ZFwik8h
	P322sGaJDLTk0YpHe+zgrFuCuFSOQ0gilnSByFGgeXBYJk/KISSrZll5kZR7dPxYYwYsfDFkecJ
	tmaEbbYdPIqiPpjn+fHwEjv5syxO154R7zajJKjP6BkMcBWvbdhKwIKzwoT4cFnwUp+Lo+Nn/ud
	H7rES90QaxPTe4QlcYldaT5uEG1eOCGrBdMJMbrzW4WfMgttbSw+dGCzOLdySfmhy4n5hGfON/s
	ZKa0RXid8V+geMctP0Xw3TCHWyi1rPUeff/XEHl1dABQjge9YXbIGOBgiA92rMHLx+dU41Si2jv
	yPfPeW+zq1g9xzvA/EKZq2U899aE1YnfxH0DYCOp+zuouo7IytqHue9+HwexPNe69LXHIypUPUh
	ch910Uvx5vfV7Zv24GJJoLQE2yZBVXlOBrHf3rMcRqa/NeeuZ6rIyFoyIJJPM/V+xicqf9RaTJs
	f6xMkdu/rd8bTuhfcZRDjdSTZe3j9JtpkVxILebbtfHPmngG9kMg9n5A+/qgEQg1S8nfcEEwj/u
	gRWawrtfb/fI9zhGFm6+/8GWpin+3sG7u3AyEMePIMM1tkWP+tnDk1VLZRVT0mXDvALECqTS1mE
	zMjTUCDfACklPcEIeFuTLp7pICJk=
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr18277624eec.24.1795772673373;
        Fri, 27 Nov 2026 01:44:33 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm42027457eec.18.2026.11.27.01.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:44:32 -0800 (PST)
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
Subject: Re: [PATCH net-next v2 5/12] amt: forward multicast data over IPv6
Date: Fri, 27 Nov 2026 09:44:30 +0000
Message-ID: <20261127094431.2963861-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179572061952.3135.14503580379845323397@kernel.org>
References: <20261125191450.2497936-6-omar@blockcast.net> <179572061952.3135.14503580379845323397@kernel.org>
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

On Thu, 26 Nov 2026 19:17:00 +0000, netdev-bot+sashiko@kernel.org wrote:
> Is the transport header reliable at this point for an inner IPv6 GSO
> skb that carries extension headers?

No, as you describe: ipv6_mc_check_mld() leaves the transport header
just past the fixed header for every data packet, so
skb_gso_validate_network_len() under-counts each segment by the length
of the extension headers.

v3 saves the transport header offset before ipv6_mc_check_mld() in
amt_dev_xmit() and puts it back afterwards, if it was set, so the
per-segment length counts the extension headers and the check sees the
segment that will be sent. Only a data packet reaches that path; an MLD
packet keeps what the check set. I have no runtime test for the GSO
case: it needs an inner UDP_SEGMENT socket with a hop-by-hop or
destination option, which amt_v6.sh does not have, and v3 does not add
one. The kit has a textual check that the restore is still there.

> Can this u32 subtraction wrap when dst_mtu(dst) is below 50?

Yes. v3's amt_tmtu() returns zero when the route MTU is below the outer
headers, so amt_tmtu_exceeded() is true and the copy is dropped before
it is made.

-- 
Omar
