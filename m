Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567228;
	b=oT2VN17mKvj+HoRaT5Ks04bDOr3LO+Ywsungi+MZg5nVaux4w0W0r6lFkTHd4seW7BO9
	 jS7Y1HUdzeaAD6XrbxJnOt8uixuoOS9QXyrc5/wkV8A6Yt8Eg7vDYHvquoSJDUmsOkfcW
	 uDta8I4coD6FID3rmr7oolFN8RzDloohON6coRvYlT6VGbVE9bjMHNFHXm8Pu413wfdkp
	 s1g9XERmhB5Pf5U2p6vb7IfLddFQ5n7MCSvJbGVY2ySr3dEcj58m9NaBU2sq8PBQFY2hQ
	 ykiCWCk9qH7ZkzGxciJmiXKy376vtqnj+yDdeV3BuCccFsq/3tsRh2S1q71+TPY+99A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=oOpg3uSPPiTt8UBdeq8O6ud7wdhrFnrJaDHHSURW9XQ=;
	b=QFYrk7tpgoqBpF8HLdobFro6y5AeYw2wlinNfqv3Nl5HHx2/8plBCv/Gc6kLbaJVmQ5S
	 T8uplqTDltk/gzi2HYWQF63c0CYTF+8avo1s9ZpXVVW/BsBxd6jhjQB9Aqold3Qelh5Js
	 jqeip5XqMxLIKWut5OlvWOIqNCoN8pCKx6TY/l1RUXWSxwR9qfKCdVTMHv33u2eadkDP2
	 S9i7s4SwuyZyig+fupNlxeEDQ8NLTbCuiDf3iY8/jWGiSDWBQNgNICmStL3BL7Tvpv9uh
	 nJrMZFBCb5uMuUpFmKP0WN5qzIROP05T1QJMBTkjvsZFpvlB/ZntCVgl1HeYHyBqSfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RQ5CyAKf;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB245606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB245606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RQ5CyAKf
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so8079821eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567227; x=1796172027; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOpg3uSPPiTt8UBdeq8O6ud7wdhrFnrJaDHHSURW9XQ=;
        b=RQ5CyAKfDMT+/e5WYkcBJZkeLT7prrUrS3xAUlpgpJWUwnHWUftaY9qTVZmrsTDaqM
         Q4TJqx5vynev/dmvXCW+wY9tFV8vG3bXzP3isMR/H0KCOGhKImZ6UTcpS3Xw8t+FMq/h
         w9Hy1YHKXSScgYJPEjc6Vht75zspAmhqqb7/p+fq4lWtOjYwg3TotI6vIo0Hlh6yAx2U
         8v6uhRQtE7RB9XoIZ/m6WJWgi2RcGrPire/gKJu5IXFTqK0pf1plsJuRiAWfxhVU7PjJ
         iTYgI8QrKB3lejbLH9+Ic4iwIQn4KKunFfVR31Ps8Q0lo7ZtGycA2mLI/izuZ1N53yZf
         8JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567227; x=1796172027;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOpg3uSPPiTt8UBdeq8O6ud7wdhrFnrJaDHHSURW9XQ=;
        b=BhTMMnwt/zNj+OTdFspFHCSkno2obU5sGScecq7+nYPJsEBKRM68oMj+3F7HWEYumG
         2QYuuq7HJAyz8wq9V4wkbCDtZZIMJilk4gLtcCwam2BdOlKq5/WzXa0+pMxklCPnsx+X
         vE/KIS3UMgw2zM5/EqDjwWstX1jrV9srRwRrlgA3Gt4feKPcuLvi83GUccilZy8YvdB0
         USaYn17BCuSySzkE6+qdOFNFQaQKebiy9eJq25DO8I6HRJG45bBxZDDAS0QN22npe/9r
         H697EscTbHPZcMn+Ev3CQB6i4oV7gRxEGffyVt5PzPVYMZ73IaY6UBHfJEw5XWsAuXTv
         GFfg==
X-Forwarded-Encrypted: i=1; AL+hErFfmcIduS1oQcUs8CWu06AUkzehsgMoZVzZtLhAeJMaWAWn1qzVpztWxTCYajaeVzPHN85dNCfbtyzQL7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+inxgpcAU0QViPzS3a+EG2F99G0bp4QudqgygLV6ux4NYV5CU8
	5XWLM5E4U69HQs7q90pk5ZAmH4y9IBqhQX3EjrGgT6VZe35lIdT6CKMttUkV/5mxw+1o9XTQORB
	1zg0Cz+9f0Q==
X-Received: from dyhd10.prod.google.com ([2002:a05:7300:828a:b0:386:95bc:ec27])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:2419:b0:367:185e:867a
 with SMTP id 5a478bee46e88-38571027a5dmr18199472eec.38.1795567226076; Tue, 24
 Nov 2026 16:40:26 -0800 (PST)
Date: Tue, 24 Nov 2026 16:40:24 -0800
In-Reply-To: <179540977827.3135.7089774240645592681@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122045326.19641-1-irogers@google.com> <179540977827.3135.7089774240645592681@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004024.1004485-1-irogers@google.com>
Subject: Re: [PATCH net-next v2] tg3: Propagate PHY reset retry failures in tg3_phy_reset_5703_4_5()
From: Ian Rogers <irogers@google.com>
To: netdev-bot+sashiko@kernel.org
Cc: pavan.chebbi@broadcom.com, michael.chan@broadcom.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, elkin@google.com, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 22, 2026 at 8:56 PM <netdev-bot+sashiko@kernel.org> wrote:
>
> [Severity: Medium]
> Is this description accurate? In tg3_get_invariants(), an error from
> tg3_phy_probe() is logged and probe keeps going:
[...]
> [Severity: High]
> Can this early return leave the BCM5703/5704/5705 PHY in its DSP test
> configuration?

Both points are valid - returning early skips unblocking DSP 0x8005 and
clearing MII_TG3_EXT_CTRL 0x3000 when test-pattern retries are exhausted
(while callers such as tg3_reset_hw() ignore tg3_phy_reset()'s return
value), and tg3_get_invariants() logs the tg3_phy_probe() failure
without aborting PCI probe.

I'll send a v3 for net-next that keeps the existing post-loop cleanup
intact and simply guards the MII_CTRL1000 restore with a boolean flag so
phy9_orig is only written back if MII_CTRL1000 was actually read.

Thanks,
Ian

pw-bot: cr
