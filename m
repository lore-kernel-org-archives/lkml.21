Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007288;
	b=OmyMnDigfniDjq8N8Yvy57IhnLZkDHWfcSrA+r4I6pq4ZhlzPYCP+cm1455+zEa/ZGFd
	 uphHkbstUCF1kNHLC3B1B9Fx3EnT5/B4E83T4ODuKZ1lUMNgJzu/LfXDULwjk/8BnpV5g
	 i3T/mC2TOFk7vLsof/kl36YjP+khnaaeAotLgjtHlN8dwmuv1gtmvmsjmKPVhuysPjWzO
	 EncOxtB0kMqj+PnCBtN2IxOtSyweUzXlmzaHhs+s7yWvFfmVfkhBxBShPvtgvGP2DbwO+
	 vVjqTCOi5ufAvUC0st1ee4DlSR0mgnsodx7HE1MkFSv+V4lK952YqspkrUWmmk3s7Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=6o67OfCVYqnD9Aa/H+dPLifbYZ1Gh4vu+t7X7MyAhu8=;
	b=JDrbS+fwvsSmuN6nTLkqgYqYLPx6hjKOfNBrKC+w7YP6y3vk67ZZF9LYaM7Zjt/vdzJr
	 OyRazwMtCcfnHZ52ZfdCLhFRI8714bc17YFjy0imUpd28VgxVbk1knDIVYT2cLAQd+WIn
	 r01bkwA4HhhIp8Hn7JgIzx08RlzUZvc6coheAqiguxyKTY9LQqNv/8XuY3bj3vzb2H8gr
	 7R3t82reTLALMqE+XMOETLfaSTF2wr+hh+4T4MVNk/STLRM6+oxYHMa1ES7R35Qax7uFR
	 4Y0+c/wCF154asDLXkpW2HmjEM0HYpdOGKx8yoKUdfTKDfRbtuFrE1ZsBWstwR2aTBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WAjZdfJE;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27AA606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B27AA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WAjZdfJE
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso468179a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795007287; x=1795612087; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6o67OfCVYqnD9Aa/H+dPLifbYZ1Gh4vu+t7X7MyAhu8=;
        b=WAjZdfJErso4Tkc/xBb+LOXAJiG+1efc9d1M+AIJVUxfKezRIfIm0Bl7DOJ2QrDJUA
         vcbp5CgEdYK7bo1Ucxff7Upm16WViMwxIySgHwpEh63Dmuy9Sku/KWND9VIyXi/z0rmC
         XKG0g0EopjrV8c+jlA/zVt/GUu2+RFMuTPuNzz4gJwuZxj5Gs3gvYsHWRIHWs24K6cP+
         PGTn47UGfbua0LlCAQsAm/w4d5blbIr+Z/+Dr29yFT03DlCASz3L4wJaUKAHFsYlDzxL
         wYGjHRKliMXDz4BWxYJw753MVCNeDlZ9tBf6phj4Q03Ujtmz6Sejx0MKEXii/VU6d2ua
         KeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007287; x=1795612087;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6o67OfCVYqnD9Aa/H+dPLifbYZ1Gh4vu+t7X7MyAhu8=;
        b=1cdNcP0OEBX6RrMWSy51V6qkieMSuZdZw7I/jd24oMVdkdPYHDvaeygmQ2XQwNJw8p
         H/JXF/7EX3Yzi0m9OezgOJj1zUG+jlOU/tsh8xyWA7Ybx6Vtts+YM7QD+YxnCUhj+0GR
         0ljro1E/OP9bdua3Q9ANREPligunitPb+BdcNdcOfnpO4nawfXeo2Hp18i7MV6LwHsqQ
         I+41pYzsH/41PYZrOo0g1+DdNBHopjHxNR9txFTjeJ5y4qyqdB/Ru+uJX4KyaefUmF2e
         7l2oAEHweMYBhQMW0hSk0PtiQZdOxEcH6HtUSoDvh5Ra1eml6d6Txfr7cznyQ9G2kjuE
         TO0A==
X-Forwarded-Encrypted: i=1; AL+hErFXGHKMLdA+Zs0BIc3HBJPZgdNPFlkLycjTJzaJYFeU+4tyK2Nu0P6F3+RmFqc7fXK3wgrtDCCqeW6z9ww=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0HfWEB79kZqPUI/omtLdx+DTPq2FHiafaa68Dcmd4bCsQszMj
	eHBge2NH4uFa8trOME8vUXK4PThk28SjDmJnXekF6MCB0BidhVprxry5
X-Gm-Gg: AZFdTZeQFd4S0ZuPzzXj2eom9H728iD6YDsytfB8c1MPsJ1jrmDVpALXODW269qvmh1
	9q3wtk53LTuH1UissX/AWestN5f0Q8bCidkRCHSbdgsbJcxpxTwwUVUYAa/Wyc9N+XN7/5WdF12
	LBvQN34oZNh+Ksm0A2M4BYl1GhNN0muOuu8NIFPxAzAg+zjlbWcE5Ay6evziPvNbADJDM+4IXcc
	xTLamyFbtktCMULdy4dWgKu+LlDNFUA1L8pcgmKpyzPnslITaeflhkteUhEuHdlXFYhtqDl1fCC
	D8GZt8xJk+EL+1nS6dwaLlrkbomK9pp5KcUvndJh33lbnMVgMa6b94VZNMPh/4B3Vj2MZmWntCW
	7lIyanN5iWCqvm7EPPMx19q3YDKNpBHqs+ajC1LBBWOPHGZyNcSzhlzwFBZHQwebC+QtdbTZa8C
	3umgZuzsCGRics6a48W3fJdPfnzMg5vy62qgzDOeNGBcZBBGSxqCnMffY6xvigOAdg3RhwNRhSF
	9Cqh+jrS3cwdhF08IVxT0PH7AB4Y/1Ywoj0fr+KVaowkLrMzyriWuO7Kfy0wIo7YPwzQhwu
X-Received: by 2002:a17:90b:39cc:b0:3b0:dbc5:c56b with SMTP id 98e67ed59e1d1-3b3d0687a87mr2599698a91.6.1795007287083;
        Wed, 18 Nov 2026 05:08:07 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abb786ecsm9406402a91.2.2026.11.18.05.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:08:06 -0800 (PST)
Date: Wed, 18 Nov 2026 05:08:06 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>, Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Cambda Zhu <cambda@linux.alibaba.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG] tcp: shift-out-of-bounds in inet_csk_rto_backoff() for an
 orphaned zero-window probe
In-Reply-To:
 <CAL4WiiouZZ46QRp5K6MYK=vevKXYLzd_p049qVVf=w+9L8d96Q@mail.gmail.com>
References: <179499954853.1440581.6627074959099619480@gmail.com>
 <CAL4WiiouZZ46QRp5K6MYK=vevKXYLzd_p049qVVf=w+9L8d96Q@mail.gmail.com>
Message-ID: <179500717712.1760730.9301783213882815335@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 18, 2026 at 01:12:45PM +0100, Eric Dumazet wrote:
> Searching lore for the function name would have found it:
>
> https://lore.kernel.org/netdev/?q=inet_csk_rto_backoff
>
> Please do this before sending a report, especially for findings
> coming from automated tools.

You are right, sorry for the noise. We now search lore for the
functions involved before sending a report.

> Kyuwon, it would be nice if you could test Jiayuan's patch with your
> reproducer and send a Tested-by: tag in that thread.

Sure. I'll run it against Jiayuan's v3 once it is posted and send the
Tested-by in that thread.

Thanks,
Kyuwon Cho
