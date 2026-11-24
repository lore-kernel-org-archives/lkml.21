Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562883;
	b=kk9zQF2kUdBCyT5ITTAQ+az4EERXTJPgIq8yLF0ZakB1XJzOcT0EOlamm/tLB9KnYj7q
	 vFiopNzmrTd688am9qo7rtnmnC+K0bf7ETdzQkX0DgsPnC7iPCQh2r76ZudnsskUC4Z1e
	 rOyA2fYNah/BnEYxXOYd0dN6mJzZ7YBDfhkA7/Ti06lmxYwJR/HxqUbgnWw+SsBSPSyEt
	 lTjmdAhQER6+JR78Qaab7R6TZo9bgrN1PO/arnCeL3DekgA234OfLpoeeffoJuHpf3hdp
	 qFoH7vK0BLGld2hUeGDINn4PQjnxMhNS4UMW+3Hu6uRiJ2aA6pKCGJmeOGcJhXurEgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=FdD8nsrRzbhjr4E3zr0vV9y7hTxHd4p7KVaJoR4GPPc=;
	b=UnUPLH071fQgYcAk5JVyLlNN2txoZXxwTGEFRazp5KUbGcAPd1kLXEP5Q0QhNlXJTi0V
	 kCOeAGVNDPWPlbvs2pGKW6lDHg1trjdqHVs1tgm8YL9k6VXnp7yogvzm9pTMufXKXzfmg
	 918JsohY1MSupmeGr2SVKjn8Rs7KxoWxLABS9GzYOSy3v8iWQURUTkY6y8OH7eYphRDWr
	 VJ1NYxdv0wXpKezsgyvRnHTNrEkdVLuWLwWWZVvca2Mkn2Z5bJLkVOhzWLPgWBuY1H22D
	 DTJNrpifaOAa2DBm4DSmknqUjmfgB1CyYlQup/54biZ1J+V5Rrh6vZ7Hx3vK+SDDdFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+nyoquG;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFCB606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DFCB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+nyoquG
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f05b465cd1so26355305ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795562882; x=1796167682; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FdD8nsrRzbhjr4E3zr0vV9y7hTxHd4p7KVaJoR4GPPc=;
        b=z+nyoquGn02pafXKCrdr3Klc70j/V2CGP1tfLUWX99+u6+I8AQM4rTPVVJOLTTCqk4
         KZq3fqF7MnYuoS/E5OP6DCEl1dNF2FXUNQKnCa33epliUESnZbONB1veRdgYsTmHe2lG
         qm4cU0xVdcxJwS6PQUHUUNTde92u1yhhObcq0W1n4ACHAnWrNPptnbyY0ad9VsEOHoKy
         AtTyAxOfPBTuljEBcmxOk/ue26foe2Q7q86H+e/qn3BI/gKKw3zPsE5y3xWA/AVWZeI1
         7GKaH9yyK+uUPZbcKAOEJYMmzScNmB8t36p8LCSrpUFg7Z78wnS29XN3esVKd9VllLeP
         /pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562882; x=1796167682;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FdD8nsrRzbhjr4E3zr0vV9y7hTxHd4p7KVaJoR4GPPc=;
        b=u/VlOjCBy2DfCrZwozMcTxafPmsUFZqiQV7sQPlhiMOts4LuODI6INurknNxM2Ycj7
         Xq53SVCykBwn7408X1YfyBrfvx2NDwLL71h4eHyE5ayyofGWAIsh4ZTszowMfFxMGFfY
         LLhcdY5ol7ChJeGJqsgK8zCT0/ZkWQzgCnfNK7XX+Uw6UW1N+5McL15oCMpd9Sr0cGPC
         Tu8+iVN6ruv6BdkOaUF0uvSnh2Q17NacYLZPUnVg4eHXWFRBXjVddaxPO8fyRMYzvKOH
         Z1/OIfzi5+WgAeK3wqWTyfC/tGAfRfAHoyAktUm0In6jDqA9f3HRSvWMDCUwnTOo4MG/
         ObDw==
X-Forwarded-Encrypted: i=1; AL+hErGIxzRtmw/owF+Je4OlnEHmq7nCKPB1RpNDk3aU1cn25f4wukRtAi2MWRr+olJoVBkKG5dUXmPhSfAEV2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ALWPH9FnPvqemrTN17Z8zg7mImN1igZSnWzB8MRYcj/Sh+R7O
	QwGArKstehYyM0pfjEbPbixm1p1Io2/wGBJjbwpZ+SQUjR9ExPIQD+Xo
X-Gm-Gg: AZFdTZfxtfzVYQBooeC+6aREjKBfZvD4zh8rRBTV+OE25KfGdmuM7nHhT4QgE8ZyD3G
	LaCCxBSSvapQ3hCSmwWMt2t0aYIyNKEQhWUqUAir/Ru0zbViL0AaycnzMeM/b4Jw4fO+415cNQX
	uixKTFGM96ceihQfOF0+RYi9GEXQLCJAwU6AkqYGaUdrCOfVO9eSzcNCoELOgPUM+fIhPKYTRkA
	CJdqStKLsevj4ydIMPSzmIdmtvUMSPJPAUlbfkgQSMNOEPwabHPweYfDlDhs1QHmdTobmmkhwOU
	D0bG8yGgkhXXhgNJNVcRaphS7WWQFdBnHwskrn5uz/XEFnGzK1xrGXG8sPIuzK6qOCWL9tjt3XI
	8M/zzxhPhOATW2TMx6mElp0BbGPj5MWoWxd7KpysAFJJRKQV5CK1SepSSM4Qv4vdpVBAmeBvQYY
	eSIsJfQqP18Q01wBShXO1ayg97+lZHJgoYLyaSzBZSr6psiCA/4VDhlWrXt2YEmBvKKdjmJIohD
	Rvn6Os1+hyDishMqUFp8GSZKdncF8D5Mq4fQ997QmaKDiqF5K8OZZW9v/M10gzCPM4cGuwT82BR
	YcGTZtoU46PR3hRHHBdqWdpDmIal1+mZmFqszpZbU2OJO6PDnM+7q9GZqi77FPqi5JKyAk0Kb0p
	5AGfhu6zeA4RpwG3NKbt8rRch34ngsau+Cg==
X-Received: by 2002:a17:902:e80b:b0:2ed:ef1:f78 with SMTP id d9443c01a7336-2f03f11824amr157910985ad.21.1795562882035;
        Tue, 24 Nov 2026 15:28:02 -0800 (PST)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm76166185ad.51.2026.11.24.15.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 15:28:01 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 23:28:01 +0000
Message-Id: <DN3TX43KWXO5.JWLJ9HO1C9K7@gmail.com>
Cc: "Gwanhyun Lee" <gwanhyunlee@gmail.com>, "Kuniyuki Iwashima"
 <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 "Jakub Sitnicki" <jakub@cloudflare.com>, "Jiayuan Chen"
 <jiayuan.chen@linux.dev>, <netdev@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] tcp: avoid NULL skb dereference in zerocopy receive
 with sockmap
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Junyoung Jang" <graypanda.inzag@gmail.com>, "Eric Dumazet"
 <edumazet@kernel.org>, "Neal Cardwell" <ncardwell@google.com>
In-Reply-To: <20261124230228.3868519-1-graypanda.inzag@gmail.com>
References: <20261124230228.3868519-1-graypanda.inzag@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 24, 2026 at 03:02 PM Junyoung Jang <graypanda.inzag@gmail.com> wrote:
> Check tcp_recv_skb() before using its result in both paths. Also stop
> before advancing beyond the last skb in sk_receive_queue. Neither
> check consumes data in the sockmap ingress queue.

This should be fixed on bpf side. Other readers trust copied_seq too:

  reader                             with stale copied_seq
  ---------------------------------  ----------------------------
  tcp_recvmsg_locked()               WARN "TCP recvmsg seq # bug"
  tcp_read_sock()                    frees new skbs
  tcp_collapse()                     BUG_ON(offset < 0)
  tls_strp_load_anchor_with_queue()  WARN_ON_ONCE(!first)


pw-bot: cr
