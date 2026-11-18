Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032996;
	b=DCcdL4uwTK5CCqZa6u/IoUvM8LCd1jJy4hUBzbEGggQtXgzBdwN89tzxe5N4HOSevGnG
	 X7e9Z11a7IxsKbM79vZnSpZh05vMnh2/ObZ191JFsohFM4MV5vaobKmK53ukVlUsUisdL
	 5OM2Mkky7374Z21OseXogEeUVI6Gk4wBwqixtC5DNUvsshThY9sMbrlaaZr2Q+oFaUGzx
	 61absJGRG8m3V8/3Hkqd0ZQ1XEVdzAVQRaigw72HtOgJoc7o01bbbVnBFruCQ6FfIm8js
	 ciGIhc0GzLWYEOmIwM7DVt+C6FlKSmUChtxiTAlKdI4YNgTveMxeeKta9sRcBpaTPNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7BbG6Ibh3KVMcdt0G6qbp+g1C+02LBnBwZSTdZVSGeQ=;
	b=k3dkeq6kcEozo4MV0INDDTs2AZFSzlmURk3byQT3fXMcZsdTLobqPXzIuR7wPVjCy9tQ
	 u9FVzdrOj3D5tOgDXgIqOPHn3ql5e3+tWoob9XC/FuNilXAar+Le6UtW71rTn9k7TBvfj
	 7CGHo6+OppNRX2ww2p/SxvFFyVVEpEJnxmvRkY8lyhwOBZxtgbNldWwQ520z4qeVqjzBJ
	 p2p4h/l7ljmAUKtPMPCSjjMfkdiogSUChiGTkhQy78M6m8BhFwFxU44Zia9IKdxRyqygx
	 S2o8Uwou/21Tsq2h+bSn0K56gsSI06OUP/SsOhDYdYOhZxTcDbqoG7kas2EqmAXg7jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y9OAzbGm;
	arc=none smtp.remote-ip=209.85.217.69
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243FE606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 243FE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y9OAzbGm
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2f2df81bbso948172137.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795032995; x=1795637795; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BbG6Ibh3KVMcdt0G6qbp+g1C+02LBnBwZSTdZVSGeQ=;
        b=Y9OAzbGm6kYJALJzjtZ05ZvviapuwbRA2eVXG9xEOzdMK987x+7hSsEHqwQVuCIutS
         e556beZWHU5xfLOYt3j8Ne0HwFTB4Afoz5gzgrmwd02Kh+evM7nRzJUNETZKD+54eZvQ
         krEGNSgdZBzxmXN5YmF24HT1azeHV6CAu+tcyEQwBjTYtPkfewUoVJZ+O8mpIc2V2AWw
         /JMyBBvxrA/v20EVokYkXHQ5JU0CphOLaul7I4AF16m9jvMrTYV8a48BcA+4Uzjy3Q3x
         o9g9kuf2KIM/1n8QiY1Rdzrt84dwJkxs/hcum5A26XOjIjnRdlXlw6MnHzcdxwIpCPnj
         xzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032995; x=1795637795;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BbG6Ibh3KVMcdt0G6qbp+g1C+02LBnBwZSTdZVSGeQ=;
        b=LEmwxd26aXsSj3XszteDaEJ7Y8kOGQqMd3YXdy7fCj+kQYp4GPLxR8mARcPRzrUtW3
         87xMOZayQnD44oH363uFm6WdlOT17ufrcICTQzUI5qxYSH+q5tJKZAN/GSsWKvDXHwiX
         5//D/13iz0ZhGbvma51ObI4N9+NiMFMrS+6HJUgMUzkf9qUEeJHpSSRbU3X27ztNQPFB
         nlyhbvEpoa7/6GwAV1lGGw6DAwH2iTLC7RRiTXeF02qwBqTLLjXrkp/FblqNDlkBRtjV
         2G52UN9rutsAU/GiOv4OUmdgxVFQJ+NRDrB9ZMTeGdt8WSmtvv0KIPvdZb6mQ14rWqfq
         +eTg==
X-Forwarded-Encrypted: i=1; AL+hErHlHUn8iKDmpqW8esXtAEZe04svgHsK+RlOIY5VxybzDVPB7i432bfidPi9jYZuQKs1mXeQ/pmRz/MTlkQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z9eD8Cf6D9Os68o90Gfqq5UVbYh6HhOBlMno1FRfZqPp072eq
	+BY9RwSwmR4K7Vn6zLyyv9ZxTodO1xyHKNsu9amKLDyQDqlFTjdEOMVKXpvlHHLdDBCoLi/bG7w
	W4DGhAQYZALn6r+CwB1v6YbKYNg==
X-Received: from vsbbd17.prod.google.com ([2002:a05:6102:1571:b0:7c3:3c65:bb6d])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:149d:b0:7cc:1045:604 with SMTP id ada2fe7eead31-7d6ba4ca641mr1483449137.30.1795032994710;
 Wed, 18 Nov 2026 12:16:34 -0800 (PST)
Date: Wed, 18 Nov 2026 20:16:32 +0000
In-Reply-To: <sashiko-outbox-220941@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117124710.1338951-1-thaisonphan@google.com>
 <20261117124710.1338951-3-thaisonphan@google.com> <sashiko-outbox-220941@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261118201632.2447530-1-thaisonphan@google.com>
Subject: Re: [PATCH net v3 2/2] tcp: accecn: initialize AccECN fields in
 syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Thaison Phan <thaisonphan@google.com>, sashiko-bot@kernel.org, 
	Eric Dumazet <edumazet@kernel.org>, Matthieu Baerts <matttbe@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Stan Iliev <stani@google.com>, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 12:47:28PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Does the syncookie path leave tp->saw_accecn_opt stuck at
> TCP_ACCECN_OPT_NOT_SEEN when the peer includes an AccECN option on the
> third ACK?
>
> In the normal SYN-RECV path, tcp_check_req() calls tcp_accecn_option_init()
> on the third ACK to update treq->saw_accecn_opt and treq->accecn_fail_mode
> before tcp_ecn_openreq_child() copies them to the child socket.  The
> syncookie path bypasses tcp_check_req(), and when tcp_child_process() later
> runs tcp_rcv_state_process() -> tcp_ack() on that third ACK, neither
> FLAG_FORWARD_PROGRESS nor FLAG_TS_PROGRESS is set, so
> __tcp_accecn_process() returns before calling tcp_accecn_process_option().

Agreed, this is a valid observation, though it is pre-existing missing
functionality in syncookie AccECN option handling rather than something
introduced by this patch. Per Eric's guidance on v2 [1], we will leave 3rd
ACK AccECN option initialization for a separate follow-up patch rather than
growing this fix series.

Marking v3 as changes-requested as I am sending v4 to guard the syn_ect_snt
update with !req->syncookie for the BPF custom syncookie path.

[1] https://lore.kernel.org/netdev/CAL4Wiir50_Z+m00GyU9BpRdAqgXs8V-L0S8kmmES=JiYyt==gg@mail.gmail.com/

pw-bot: cr
