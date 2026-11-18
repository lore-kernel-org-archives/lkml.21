Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997083;
	b=Z5vu5NvOBQLddHsBisCvldVH6UJDpzVBSU510D1rEwTFq7J25ImTouZwoFLb7kcf1cyh
	 S0jRhoE5j4y78PUYMy1CO3hNMm/8H2LQK7+QCsAXPrHYbJ5Ihw3xJqtoPgR7H9YuwBfLh
	 Q/qHcAlEHlUHniOysvbjH85KQUJhbUQfqQxbNKtCoZ/29o99YtDRgWKVmHsVFXWDHkuek
	 OJfLlFevZ4YWcxkganiuBHI43D+MNvgZaqJD2PxiivBAIcSP4Kc+QBHTZNi1TCBOeiOji
	 LNkpUVD4KeC5NuW+tP/ykiSIwPWpkbeG4JA7es3Yn3vVUc4x3RHV5n0UpulDMiTrfvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TMFZcDH6aQIFtxqkM360mGsHK/mRi1dMwYrjxUKwiNQ=;
	b=Ue/w9Ddi8tS25sVjWFAI4+/Eezbnbfx+/c8JdQyySQ0q/mRPQjB9jpg2r+Lj2pIMd0/a
	 F3ll+shx0UjS6qZE3OErjHVYeYarfTcmoxYnCApk+vbqFrcVjpNX5oENZ8QOggXuOWET/
	 92qG9Hdo7JXxf1IaoIiRwekhz6RobGkTtN/grdxeh/nszUE1KSMffTjT2zlWoyrxJEds0
	 9VQyV/6VfZQfgc4Mk+EdUElsp+e8aw+9in+zI+TAXXv4giMwkVwf1zdjj+1i5QqQec9RL
	 vDJSeyu/qguNdqUON48J2tnCmXXtZKS+GY1giub3sB6kKWRByNTPM6RpP1pmHUw7H/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uNHHFZO2;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADBB606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ADBB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uNHHFZO2
Received: by mail-oo2-f2.google.com with SMTP id 006d021491bc7-71ad760fdddso241831eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794997082; x=1795601882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TMFZcDH6aQIFtxqkM360mGsHK/mRi1dMwYrjxUKwiNQ=;
        b=uNHHFZO2ZWTl6wjsCFAG/t3isVNM5BUArcyiCTu8msNqQOHHSJHOQeDcsjBiDZryVl
         Qa+xjH6lLze0MKSlm48eQtg/RIuygvNvD611LMDbqxqF3T2iKHL1neKXRI2f6MwQl0Wf
         Nf3jcxNOmbWeMJlnhS+c4rT14GEjZMHBWNb65i5PBUn4Mej7/RhGZ/KRp0Rc6+eqRiV4
         oNioML4frdYcY2ILpjSZmIIHPjooXe66RirHa1Gi03EKfEdtD9sUpHxDCd9fdJdFl0bK
         aq4glU9iuVkSG5Acx73BnMjhGZ3gVTz0S6kjvaRrsV8cec1ibV/I5IKjSbwKfM3HT7Zh
         rM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997082; x=1795601882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMFZcDH6aQIFtxqkM360mGsHK/mRi1dMwYrjxUKwiNQ=;
        b=g3eyOft7H1OCL9e8io+bef6tU89moC7JuLMX7et7IXuchevEoJgeWEOnlGEnjvxiM3
         lwtR+stgXAxFBC2m/UeejysFQur3RMF0HVkZOt8np6b0BGJGk0ys5sRZTh/aykYF3eP0
         mWwonVkapVRlkMV8ayCmVclqmeclWoLDh+sGfPZ6jT4ijDlyDYw+j5YDTuBiwd6qkvy2
         kI3I5LEqtDoqvfBw6IbDJ8pWnD3+n7a9zSmwFP8eZAV6q/Rtwa1ftl6LzvssTNJkUOn0
         No/hDebQ0c6hlkhBOF++EF9oQyz0yKqc6An+WIFcChC54DxOqkHy9l1eK2+4pbn0L8WD
         3SRw==
X-Forwarded-Encrypted: i=1; AL+hErG+Ya7bt4sJy6ZphksO2rE6qsP7svUPEDMc3G4qyYUw4fd4S3R40B6VblMQTLlfHGtW4CJJ9X/FJOs8gOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/S4kUI9VlqZ0wYTKMTNAemckklKc7nrfy2WTlVdpG2nVS3/NrR
	k3Hnl2p1dZmV0dg3n4jQKMUd4PuF+Tk5tvJoHh1EHSGcloqKNmCbjM4y
X-Gm-Gg: AYBFou2pLkYeV2Ph5TYYV4onPgk009xkJf9jpgyDpYb2JUMkGYOYwVAAX/Cijz5r1A/
	3nUPgVuJyqYvI4wZDu6/FTsw1EZt0ZEvcpy5ASx0cB0CkmqmbKm1DtH0tJQdHsXRuZARSVZPFk+
	zAkd/CRG1E/a9v6y1Wx5+LOiKbzDUtXStF3lO9magKXh/6nzjnfOFVxHBsRV3FYW7br2buWTzI8
	K/Zk3mACasUsvVMbkw98/JtouYRDSyFfMkVP2Jh00/IMUWzRMpj3yly/rRAS3LSCGtDBzPYjO+a
	RiGaeM/M+baHc7EgV2wtYT+hoAyK9Udqf54N96VuR3p4bYeVnStIh7x1z7/BRFWu3PF/L6NAjav
	ZieKfjhsfMG3V6MkooXDUsxAw8Btl/FQhJ8FaO/L53lnC1NfoJI86DhIXAfnNv+L2wB41yU+DLw
	KkGOR3QEYSMHNuY5XF65EiE+G02YzzQt1dN1iSUthqeYHHrlPoPYrG6TgY+Cihg6UoYKs6VE2Jy
	t9qfZ/ZtgWeC6aC0jsRUA4saoqv5VcnXiBvqWIr/MXlzOLXLyGCTPuHN/RbsyKkNEs7SkNlb2MU
	lZo4JF/EQc/dggK/k4sqPTlAuDstDDcCIH+mSoJBnKB5rJq9Q1TM+5IRwV9nHvqFyhnpJgfQl3m
	Zf5UWCsMkkZcR
X-Received: by 2002:a05:6820:2306:b0:71a:ea63:ac2c with SMTP id 006d021491bc7-71b18657f8bmr1251461eaf.84.1794997081863;
        Wed, 18 Nov 2026 02:18:01 -0800 (PST)
Received: from localhost.localdomain ([14.22.11.163])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm1889777fac.6.2026.11.18.02.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:18:00 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] net: initialize sk_peer_lock in cloned sockets
Date: Wed, 18 Nov 2026 18:17:52 +0800
Message-ID: <20261118101752.1989502-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

sock_copy() clones a struct sock with two memcpys that both include
sk_peer_lock.  sk_clone() re-initializes sk_lock, but nothing resets
sk_peer_lock, so a clone created while the parent's sk_peer_lock is held
inherits the lock in the locked state.

The first getsockopt(SO_PEERCRED) on such a child spins forever in
queued_spin_lock_slowpath().  spin_lock() disables preemption, so the
task never schedules and its CPU stops reporting quiescent states; RCU
grace periods then stop and callers of synchronize_rcu(), such as
expand_files() from accept(), hang.

Initialize sk_peer_lock explicitly for the clone.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: 35306eb23814 ("af_unix: fix races in sk_peer_pid and sk_peer_cred accesses")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
v1 -> v2:
 - drop the inline comment, the changelog already explains it
 - use [PATCH net] in the subject, as requested

 net/core/sock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/core/sock.c b/net/core/sock.c
index ad414878dc5b..ebc83a466d91 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -2545,6 +2545,7 @@ struct sock *sk_clone(const struct sock *sk, const gfp_t priority,
 
 	sk_node_init(&newsk->sk_node);
 	sock_lock_init(newsk);
+	spin_lock_init(&newsk->sk_peer_lock);
 
 	if (lock)
 		bh_lock_sock(newsk);
-- 
2.43.7

