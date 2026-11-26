Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714468;
	b=XIR1LOJrqPB+TbBXHCutGhUl/GXUe+wifTnRl5ESi8f6x74UdY/ib5vyvaQfeZre6m5S
	 fO1PpBAb+VnzoFJsqD1Y4RRafhSb03nwDgy8cP27qZxNKxzC5jU+n5iFVvseTO0O0WsJk
	 gET0pNHVcjY8gBtfS4otUM9VfluBRVSqOngd24vKlP7ibbXYncOKYOq49+03Gm1Yk7TBC
	 ovmzcU1Xv7L4dFNVCVkJhqyYkCC4QU/YDW1mnmri9J4rfHfnExk6khCoUmwZQe1W3AGGe
	 di7Xk0nn6SxQY/KKJEBFgfiyTYvh5cF4EJ2ufOAGnT6MD3Z3orr0Z9Vl5vp8Wl3qsxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=8LFfqjWNVZcWitQQ/EYLHPjhet/iq74BUyWBBYp09Fs=;
	b=5r7HJ27+y3KeCMhIij+DDnTQCZ+9HC8GWvHRSEhcVWWq/bl/pVeou7TkCZAWPnxNsaZJ
	 KOrKPIdReWKadUwsbNP6I4TGHvAZ/IHRGptIzjcdnYRIcxJ6ovbBib2HJbZ0vIXKj3CIz
	 /ZOjBHSQqLRa69FnAF4saYsbFpshU9tBixDdwcrIR/XIU949+54+f1BYTAh+/3vWKLeta
	 m7D6KpaukFnFJ4Csf58ABDYzRAn95SjusI0BfeaIUP0Fck6QFWmJv6wcqaR1SrR55XDyT
	 gXgnCbDfqqfYpB5etURo4ZdqRLiq5s9oT5S7jiUh632Bd6hYZqqA5L6UxCInytMgRhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--willemb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WYeB3235;
	arc=none smtp.remote-ip=209.85.160.198
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD380606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD380606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willemb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WYeB3235
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55c16eb248eso117197431cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795714467; x=1796319267; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8LFfqjWNVZcWitQQ/EYLHPjhet/iq74BUyWBBYp09Fs=;
        b=WYeB3235xF03W2/XVX+vDxPLrJo3q/644KssTXKkfDO2bZ0AeaqFUCGo8vHGgGYMql
         q1UKqT44oknXp6PLU5BElau04zpen/q2PXR0kYHvuv8VGwl4BsGAikQt/BTyjvvN50mC
         u6ACtDo/+bbGV+paZOVRPlmeUfijb5NCRXm9t5vGDG7BZZmaobpB4PY167MYqK0PPjnt
         +NkM9sOEdx5Dplx4M4Zl+jTSNJRNsa99FNCnJ5HnWrhd300aHUrJAV2QobE1C2JYdoRo
         x5P8jB/UJ/0eWBXpoCcBQ8kDT7Z/JzMm7dBnQTduExhDWRwBBIwhLt8Tw/76KcRDApQT
         hfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714467; x=1796319267;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8LFfqjWNVZcWitQQ/EYLHPjhet/iq74BUyWBBYp09Fs=;
        b=0BYneD4poBLLbfzy/6NuAjqHWKBi4NYBdvWxJV2vMsIckNlmfcW7J5EGNDUwBDC0Ip
         J0Vn2NnlsnqTpHaixg6oAZkWhFcB9JGvxV7eIj6yqMf2hEx1NLwIeBtvv/9Ww2aWut8g
         3+f4tlQHdcDbsZUvBnTgejciznVQF3qriqeyJvTPM0cD9XSfkwODUuxcb1w9l5+4fHJB
         YUYMpHu1Zv8DVuor9nXwkM2olFkPneXL8ERxdKmob4HGU+A8ka9iihbY2N77/uLYDeOX
         bMvIACDfgmEeOvVA2fSDgIqR27ey5LqNSJNMJW9HD1kNinjeldAHpIX7xeSpzfHPJQ2w
         JyKg==
X-Forwarded-Encrypted: i=1; AL+hErHn6z2CIqsPlaO+5669mGWBJWLzTg+Fe60tvwgCh9JLrZX1RPrSeLYLqX/Qx1uTct+Kq186GdsQARLjuyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bycoHTj6unGph9yvH1+7vfbirsv9STvWDrBCtpgQdGyQL76j9
	twMu5QeyZeEP8oQYb4fLEIN0iugXd0w1nRmtm1FyOuQpKFxNaeNbvXcwM6OOT5Xa3QQaMzfss4E
	mfAgp2Z+7ZQ==
X-Received: from qtf20-n1.prod.google.com ([2002:a05:622a:6814:10b0:55d:6f1c:bf64])
 (user=willemb job=prod-delivery.src-stubby-dispatcher) by 2002:ac8:5d49:0:b0:533:3d48:37ff
 with SMTP id d75a77b69052e-55d76a8a916mr397826001cf.49.1795714466249; Thu, 26
 Nov 2026 09:34:26 -0800 (PST)
Date: Thu, 26 Nov 2026 12:34:25 -0500
In-Reply-To: <tencent_934E899D4D24BB3B4827B2A0C9D73461E00A@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <tencent_934E899D4D24BB3B4827B2A0C9D73461E00A@qq.com>
Message-ID: <willemb.9c5fa5d89f88@google.com>
Subject: Re: [PATCH] net: tap: fix inconsistent lock state in tap_sock_destruct
From: willemb@google.com
To: Shuai Liu <847807867@qq.com>, willemdebruijn.kernel@gmail.com, jasowangio@gmail.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com
Cc: syzbot+a2220efe757ca2a7358d@syzkaller.appspotmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shuai Liu <847807867@qq.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Shuai Liu wrote:
> tap_sock_destruct() calls ptr_ring_cleanup(), which in turn uses
> ptr_ring_consume() with a plain spin_lock() for consumer_lock.
> This destructor runs in two distinct contexts:

> 1. softirq context: from softirq rx drop paths via
>     skb_release_head_state() -> sock_wfree() -> __sk_free() ->
>     sk_destruct() -> tap_sock_destruct().  In softirq the BH
>     state is already disabled, so consumer_lock is taken with
>     SOFTIRQ-ON-W semantics.

> 2. process context: from tap_release() -> __fput() -> sk_free()
>     -> sk_destruct() -> tap_sock_destruct() (triggered by
>     close_range syscall).  Here softirq is enabled when the
>     same consumer_lock is taken.

> lockdep flags this as inconsistent {IN-SOFTIRQ-W} ->
> {SOFTIRQ-ON-W} usage of (&r->consumer_lock) and warns about
> a possible deadlock scenario.

> Fix by hand-rolling the cleanup loop with spin_lock_irqsave() /
> spin_unlock_irqrestore() so consumer_lock is always taken from a
> uniform softirq state.  irqsave is a no-op on the softirq path
> (interrupts are already off), so there is no extra cost there.

> Reported-by: syzbot  
> <syzbot+a2220efe757ca2a7358d@syzkaller.appspotmail.com>
> Link: https://syzkaller.appspot.com/bug?extid=a2220efe757ca2a7358d
> Signed-off-by: Shuai Liu <847807867@qq.com>

Dropped in line with your below comment, thanks

https://lore.kernel.org/netdev/tencent_21D314AEB4D8C2C489FB8D74348B93FC7706@qq.com/
