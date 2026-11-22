Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343056;
	b=EsqT5I5HcsrSo/QKj885+yUZEKDhAwq5gcZfGqL/LcSfH+cdxatuj3gfCQSOuCQ2UrZK
	 Ucw2Tl0tbkGkx03WjzBn72VrkV2s/K/ZMbglyCiDxUt1yhNQz79+HUBzWSVIrj46FD//h
	 BU+9lL9dbpLLlhVYJsGMR7uta0LbQPTBn4dEp7N0hPGjXkCTpnWuWtS8vJC1WqHXklaYu
	 eVjsK/FY5hnsT4N/T17HbaoYAw62J0tApNPieTzo270IZQR4y++IcJA7Tur9PqVulPAmc
	 iJCxvhmFs3UHgY1sNQczsJPvqqGF8EBkAKnaNH27XJZR8ec9tc18Ea3IqWk2dB4hI6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CURJOIW8YVhRngaiR7g8++OMuLl8NziGeTmfa7BjCfk=;
	b=ABtNT9tIshocckCT8Sy1fgVZenO3UFZmtdWP3cluXBEdTrpjaNOKpnZNZgnEQ7ZGirx1
	 uHNDF3wL4gdu07ykjiTsZ5YOlb1jxIlij5ig56NGFyzfnvS9YUQPdCRBOt0KSVAGjoiVu
	 XIwDu47cmbYYZSAckXj8KFZNTJKlGiabe2qA2csdD80DN+mWXsvOGq+lMVcODG7+NL3cU
	 tov7/ZW6OiZl8FmG7/ge+Ljw0Cl/GtRZ2Fh6eRZY0RQOfXXn0rUFX8pKHISOxF51Wnpr+
	 VWv+Fevk19YRvKOUW0E6WZV71IrwdYj1DSEocM2dqdFkTePIKpl7wgkDQx2JlOnEpIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5t5Iv+G;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF352606A335
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF352606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5t5Iv+G
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a05b210703so1047228b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343055; x=1795947855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CURJOIW8YVhRngaiR7g8++OMuLl8NziGeTmfa7BjCfk=;
        b=Y5t5Iv+GxHIVRNL1hLMtJTy9/LL0TrrHPci4ClCUB3ON6bWZf0BKwNKmVhRtHY6rtK
         oaRLDzJCuChOaHdbRHchOk6WMH++YIgoXQjAN8pe2AG5yVoD91wRVqGVL2xLdjSks/4R
         7QQQrlngy9WwxzcBKZRakEMG4x8VhBxlarpfkXDL+Ow+5IykNNQx4dcdiTRYIDW1Btma
         K+pZLL6rfliv2dHbgaQXhe79NIE4SdUGenZV3r0KX8TRE6ZIvRIW484ccwaIgsIfAOjc
         lmI4CmkJNqGyNMTuATUjrRYsWhXY4S92omZgMdLxn8TIoPXgH2Z7NYrbTa4LZq5XMYIk
         MD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343055; x=1795947855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CURJOIW8YVhRngaiR7g8++OMuLl8NziGeTmfa7BjCfk=;
        b=U4fw9+Yx7uG6dklHMauVzkVtUKFlqPK4OuA9Qr3C9E/SBVY3i9ljJB6GpyfGwM1hJU
         tHn+cCllmwEzChV3jSM/AG3ETp3llxu1I0ZJOcicVJpIJvn6UiDE8yDETnRdnQxfwfZG
         0UkVDjysP306SbxHcnV3CloRYETkXk+u3B9kkY4E/9pmmpR4B9Bxvnw9oOBvLIoCYBwJ
         dBuB2xRxoVZuJHtxOfI4O4ZN7MxwPcRjQ5WtFYxVQv5wY/qprrUVtKx7p5Co3WbS1Chj
         i2lKjadr7ymbRzIi9/Olp2Gy+ukalW2otHM+GpZTsT5q5/VMxhI3RkMFDsDpLw9r9MZ+
         iHQQ==
X-Forwarded-Encrypted: i=1; AL+hErGRhoTl+0QD4nt+F/r62niDV5i5mQZn7K7cwNQgmbp0wmeX/ZHtdoYX2w3SNJuUelRQixzK84w18+4J/gI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HsgZZUToxxtSfS4bd6Bk8lkR8mBnFfHr/X7Kse4ekL1p6cDlN
	s3S40W0gxAdi2qLzEuH98llk6eU9jo+sMhA330KxoyGoy0RrK1QM2/8z
X-Gm-Gg: AZFdTZfIph6oi97CkHlBOZz9907T4I24G0RUwL2kOh4bUXB4Zc5i+U+Y/S9R6eljr9U
	/sp9LhcmHZgK5CjY0Bx0CvZrZ2jdNC1HOZV/IzU7kcb1hA14uLXI5rIlpNlwRhVaz2By8ChkPs5
	QRjLJSr9pwfKbEXngP3cpRG8PtoJXNo2a11a7R/rr/5g8pfzsF7AyjeIP2B853u4v9/+Lr+L7gp
	REVyQL2boVVWKzHqCikWcuLYye4dQoy33xSXkl2dij/wlgk9rmpsNihdqvVLX19ibvixWQkrS0Z
	lFUR9S0fnQ7wcIz5vYb3adYALUk4azYZze1uguPmVFz5+utJViZzqMhJqhSwkGElmxhgi1wPRn5
	AkLkmYNOvFwlHUFcWnLCygnEJd67vQpXW7E/NVKJOyX/iSJcBF1mdVvwygYuWUiFeLLBSyetSof
	uSQXtCk5Jb/yUwYNmclT/cwkZ+dbYLHioCeLmja1Mnk3wm5vipOL7V4f21i19zVDwbtmjSiwURa
	fKJC8R4Hey2s3UgAkrNn8upH0z8FTHAkqOblKETAIlV/mKd9HS58NGpVHnXwsJYxKwIk4Z7Y2l6
	8ycYiGmLFHUsOpoq63vxR1hrAq9k5BMhLk6kA4Tdb8I4TDUqmL9HLzp5BTwMZasJJCY=
X-Received: by 2002:a05:6a21:4cc7:b0:3dd:85aa:4524 with SMTP id adf61e73a8af0-4014b56547dmr8506160637.31.1795343055176;
        Sun, 22 Nov 2026 02:24:15 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm3968398b3a.36.2026.11.22.02.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:24:14 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	David Howells <dhowells@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 1/1] ipv6: fix MSG_SPLICE_PAGES with a dst trailer in __ip6_append_data()
Date: Sun, 22 Nov 2026 19:24:07 +0900
Message-ID: <179534083350.2499182.16621119046570934510@gmail.com>
In-Reply-To: <179534083350.2499182.16169984227830330896@gmail.com>
References: <179534083350.2499182.16169984227830330896@gmail.com>
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

When __ip6_append_data() starts a new skb for a fragment that is not
the last one, it adds the dst's trailer_len to datalen. On the paged
path pagedlen was computed before that, so with an xfrm dst

	copy = datalen - transhdrlen - fraggap - pagedlen;

is trailer_len instead of 0. getfrag() copies those bytes from the
message iterator, but the MSG_SPLICE_PAGES branch right after it also
runs when getfrag() succeeds and resets copy to 0, so length is not
reduced by the bytes just copied. On the next pass the splice branch
finds copy larger than what is left in the iterator, warns and returns
-EIO, so sendfile() of a UDPv6 datagram that needs fragmentation over
an xfrm tunnel fails:

  WARNING: net/ipv6/ip6_output.c:1796 at __ip6_append_data+0x17ed/0x4b70
  RIP: 0010:__ip6_append_data (net/ipv6/ip6_output.c:1796)
  Call Trace:
   <TASK>
   ip6_make_skb (net/ipv6/ip6_output.c:2097)
   udpv6_sendmsg (net/ipv6/udp.c:1717)
   sock_sendmsg (net/socket.c:841)
   splice_to_socket (fs/splice.c:811)
   direct_splice_actor (fs/splice.c:863 fs/splice.c:1114)
   splice_direct_to_actor (fs/splice.c:1023)
   do_splice_direct (fs/splice.c:1157 fs/splice.c:1183)
   do_sendfile (fs/read_write.c:1351)

IPv4 is not affected: __ip_append_data() does not add trailer_len to
datalen.

The branch was added by commit ce650a166335 ("udp6: Fix
__ip6_append_data()'s handling of MSG_SPLICE_PAGES"), when copy could
be negative on this path. Since commit 736b380e28d0 ("ipv6: account for
fraggap on the paged allocation path") a negative copy returns -EINVAL
before this point, so remove the branch.

Fixes: ce650a166335 ("udp6: Fix __ip6_append_data()'s handling of MSG_SPLICE_PAGES")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 net/ipv6/ip6_output.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index cb648c839431..5887e537f662 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1742,8 +1742,6 @@ static int __ip6_append_data(struct sock *sk,
 				err = -EFAULT;
 				kfree_skb(skb);
 				goto error;
-			} else if (flags & MSG_SPLICE_PAGES) {
-				copy = 0;
 			}
 
 			offset += copy;
-- 
2.43.0

