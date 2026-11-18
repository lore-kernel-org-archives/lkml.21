Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043824;
	b=L/pEb2s8P5yZ0TltKchpAtq3z/WXj+vEJPoL6wdwfliMZny8NIAwr4ZS+P2Pui2J5pCM
	 0lcmm5LkQZBD23u71ES6bJQnrlbmi0HD2dMFGoywIcAXsoSiODB/cYAIDx328YKc+OfYH
	 d9g6gt4x+AEjk3px/iZ8wi132LRiun3oyoUOrRJ0nHtQNDYVgVe0VZMQmhbx9FpFdy0GZ
	 dnBet1VNXmwDtvDlydeWjrhsswq17/d3qo+tnGsMx/42V/y4wT+V3F4068o2AYSaHFfZC
	 HaDch1ZjIrb+Z04xao2Bp3SBx1Z011PNv+teCxoRINlG+N/hqoH2pO0/RFl59Tc/IXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mPR06FN+DshFSRmXQRB0czKqJie1fc17yG9r9Wz7WFI=;
	b=esruLRFocMI3zFs4irvfhSHE/NBd23K3cI6d1d2ab9PPjUgyAZbUfofwnqC32OBYUge6
	 o5CAMlcLIMwFcpIaMrMPclX01qgemikOKYM57cEDRb8mWilh07AYz8nJfpTWvDwV4Uw5c
	 5lnTM7u1CQPUJQVcNC9xbCAcv/+4FJJQbipc2FOUkwQInRAVtcuvX3TLPzATDk1SvxZTi
	 Zrh36XAm6nWhJPQoY2jDNfmofFXxDpAJYFWcnrCRLgCTDcx1NKpY9h4tbO8EE1EdyGgdW
	 LxyO1UcrAA5eL2RWL0r83K9nwpYmxbHM011syRbo/bACwD+CNEJX+mzmYkiwzyCfAbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGxdAVzU;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327C4606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 327C4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGxdAVzU
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso1024787c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795043822; x=1795648622; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mPR06FN+DshFSRmXQRB0czKqJie1fc17yG9r9Wz7WFI=;
        b=wGxdAVzU55D/UTOdKilRGohvnaaIPVWd86ia2R/x3qv+oyPmY3pdJTBK/VF5mnItDq
         iVLpsObynSXM2egP56umevRyki+uSG6qQcgMQgIUXLDHRSzBYVAa5ynAgYe1k3d/1Vov
         SgOwPCf+wVT5d/biw4qJPEqKRB6Qr9nrHdKbk88z3C1DciiFOqet2foTdqMBnjcRHE9V
         XGFqcKqjveK5xyDEiRow16NMDNFBDPrLaVn282ofacK6Z+NEkBo30G3STp5eTY0yTtRN
         0JEwJ1zrI4/UOcwujjL1iBXYs4c9tpEYjGaQLeReckH5Lyi5cpPQGxLBX/5rrwU6Q/QS
         KH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043822; x=1795648622;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mPR06FN+DshFSRmXQRB0czKqJie1fc17yG9r9Wz7WFI=;
        b=D0qzb/mC3s7g0BjXEsMt65EQ3GI9gO/ycCWYMZxJfqDbDM41M4ZMnCCr1OnHDZiqS+
         LG4MT+hasMdwX0jEYCaIc4OX/ITTPmk1bRMw0gQSbHwjeFC+PAPPnxWzHBdWXeyGFEef
         fHDshFhm2pKqZeE16W9lkCpJdBUb7UndrwRR0OEIo1aVWRXy5ERHCD77VfntuQK2Vv7T
         j+WF65ibR3TnRAMAySvHk+VPcadmO3t4/JC82hxg3RQwkPSVB44Q2QspWSVZwEoVBVv6
         KIfQwzyRigKfFJxbqYR5/hC9TO3O7K18wNfGSSiiZ1wceuhnZzxJDxA6zWZRnTJ7a5rQ
         6lbw==
X-Forwarded-Encrypted: i=1; AL+hErFPWwJAiodB4xfv3szSD03XT71Ev42MI3GWRAFIFyrAsvp6fhCABE344QxJ4zjfkilUv9M/uFVlIA205lQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VFr+LKRF95MwhkAnAZZ+PXiZYpYm8DNYHQIePuMb5q0IDV48o
	grTriQJHmEm4q626g0l2GmjApNsh7POeBPrA8Zpd0eCzyaAnLhG/juR5
X-Gm-Gg: AYBFou07qREnJN85XdRwmnNs1KodKdo6mArbfCQrbQIup+HZwxfErHirwfGgO2m4d5O
	Cp7B/I8WUE7fOJzRr3V27z6qWrAPzHAPiNaaw2ZzBbHswdaOsHzgEi2UlvPs/OMnf5cQGkhf59e
	bJiDF0L4eiNFr8LJ7RTTWTnp2hPfhoQpiC+W2T+OWDk3txveqiEo2tVbAL760CVDSols9Cyb0BJ
	Qs5guwE8Z2nvCWdWdmcLHCD1lkvoDAvxyvukkBT3Y9Wu1wjLOyEZrq1AmbJctqrWhl2GauPYc8R
	wotGT8m7/lhzAypMirGT7ZJ9/nP9VutXwq2EKBk9aSiaH3fWGGLTY+fZnuVyTbOuHE+WiC+N6+m
	4n5Zvu4JuBgpqWj5F2CKZVAuZi+mbBVXGRVHATXvCvJT7pvOBwptXqEbhbHXw5HodzDb01nt732
	3Re5qn8PTrfGGqvcE1+kMMlvlgR4/9yfYqQbiq+wm70LV5jpD/WBdeEC1zc/s3hJG3Gq0Vy20E9
	fASiDSbusSmGr7Yu4OKoT5eqr0LznfBdk+r/PLAzeZbrXGgVpfP5AuBzptueoyo6Rw2hCfixj7X
	ma6hNf3+z1ul6Ix92VCvn4k=
X-Received: by 2002:a05:7022:ea8a:b0:1b5:1a5a:1dc with SMTP id a92af1059eb24-1b543be9b64mr3808568c88.12.1795043822125;
        Wed, 18 Nov 2026 15:17:02 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:43::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm9021578c88.14.2026.11.18.15.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:17:01 -0800 (PST)
Date: Wed, 18 Nov 2026 15:16:55 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Pavel Begunkov <asml.silence@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH net-next v5 3/3] tcp: propagate skb_zcopy() uarg in
 tcp_mtu_probe()
Message-ID: <av4x4oM-xxCmymSg@devvm16445.scu0.facebook.com>
References: <20261115004003.3695475-1-almasrymina@google.com>
 <20261115004003.3695475-4-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115004003.3695475-4-almasrymina@google.com>

On 11/15, Mina Almasry wrote:
> tcp_clone_payload() takes references on source skb fragments when
> building an MTU probe skb, but never attaches the source skb's zerocopy
> ubuf_info (uarg) to the probe skb. When tcp_mtu_probe() subsequently
> frees fully consumed source skbs via tcp_eat_one_skb(), skb_release_data()
> drops their uarg references and can deliver the zerocopy completion to
> userspace while the unacknowledged probe skb still references the user
> buffers.
> 
> Additionally, tcp_can_coalesce_send_queue_head() only checks
> skb_pure_zcopy_same() (which compares SKBFL_PURE_ZEROCOPY), allowing
> adjacent zerocopy skbs with different uargs (or a mixed-zerocopy skb and
> a non-zerocopy skb) to be coalesced into a single probe skb that can
> only hold one destructor_arg.
> 
> Reject coalescing across different skb_zcopy() uargs in
> tcp_can_coalesce_send_queue_head() and propagate the uarg to the probe
> skb via skb_zcopy_set() in tcp_clone_payload().
> 
> This is a pre-existing issue found by manual code inspection and LLM
> review; it was not triggered in production. Verified with the net_core
> KUnit test suite; not tested on real hardware.
> 
> Fixes: 736013292e3c ("tcp: let tcp_mtu_probe() build headless packets")
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
