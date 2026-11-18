Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036184;
	b=FSI+4ujQTqefh0zTYCXqFkzH69r0soW3RJszXKocft+mmq8ZCPLo7aAn85aQIzDekbf2
	 192vo2r3iYJ9KqcDLzNUzo2Nnr/vmKBPI2ztr1QLEw9GQ7ZOMrrm8YfKQNkpIOnxl0N8c
	 nHccCSaAWWQmvpuECgmJpqLXElniy+MgkpJabEepSz0Oh0mp2JHRj2NkGVuEYXx4Xdr5U
	 p8EqYC2ZxIYE0gvKXPafd7qfwn7ma/8fI5J6yTWSe95SErQhGRDf2vUrl3J6bgAtXxKj/
	 UZ25jbavsIP+/u3o1a3hEUfPHfTOHn9dtexTiWG+215I2Re2odqasl3L2rS0nYphOag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=F5zS8GR6/Kkx2ferGhUL7NRtyhbrsq6/kvurR9syByw=;
	b=PnUmdlJdLd1YuHF2UvEFnQoF87kBz7bkVD8lUSfpp2Olp2x1U2L82c1QJrr7CG03YzZB
	 87V83FJBFFrM7KuvMCeB/LKt589kMEnnCcKCDnFoozHqZ5L7Ll5XINVHyMyJ9PXVC7dJo
	 /D3xUbFxUAgcRVQz1NUo3CDHcEKlwF792LBSsI1eNhqcrXtzsD5sGNA8sC6J/QZ2RUzwt
	 z86qris+lFpvPrJG1f8vVxNFuorw2wcJ7VNnHo6GmvM8wB7gIBvfsqa7dAttg8aGNj2G3
	 iZ61PLsocMqkAZQwShMjaorkO4GzmtpXedi4OBH9+XCjo0eu+eiM8BA38JFCGmcn8tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DAn9aU10;
	arc=none smtp.remote-ip=209.85.222.70
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CB3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05CB3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DAn9aU10
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99e13604fb3so920122241.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795036183; x=1795640983; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F5zS8GR6/Kkx2ferGhUL7NRtyhbrsq6/kvurR9syByw=;
        b=DAn9aU10rkgwdeQ2ZisWVg6X/p5hbKE0gZYi6m+pna8E12XUJwBRH/SYlXOimG8Fpz
         fMVm5rDhthp6CcPMevx9QhyOECcqdFcAnuA1EMy/9UTBPFxMbjG/QYmgcaldkq1EaaBY
         cJoza8Uu0nMBqlhA/cFbrMO0EHtz6GPgc19Vf6Vpzl+BecLtDCR58CKk23srDj8Y1moA
         y1/wAnt4qdSsfPHJvuSsIRkyfteu5W6DeIc3inOkr0YDs88R1fl+PkQiTZVIE5sqoe1u
         MeaH+S35T/Ipqd597gAddRG6BWI+/OHM3FiYKTPjxB3zXhY5zaQ2zPbc6iBEoCBKfOlq
         MNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036183; x=1795640983;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F5zS8GR6/Kkx2ferGhUL7NRtyhbrsq6/kvurR9syByw=;
        b=VWm0HM+RdiKUm163wwMttxhxduM8iaRowjgQteYrvDxf+WOkbnwvZaSoycu+03avos
         oU/U2l5oktQ+2lZScSg7MU5sS0rQIQDSE31dMHL53NpRtPzSx5gFPXSEYFE8paHXa7zO
         0x4Yi5JNemUs8GHUoyguJxkr72fSIKtoHfPrWt4cIpoeuFlY6nBkKj8sEqR0j7TEwVI7
         XM2iOAIMDhprmyklcqFaTozpOm50icPVQc0gepNxNysi0+vv1jx+T2ngcpOvZjEdY2CQ
         vZzYJuhWYQeSjsWZut0a24T/d0YmepR796kdUdbXqqNaRC3OorVC+KdgUolrISZNCHtk
         UGyw==
X-Forwarded-Encrypted: i=1; AL+hErETMP9J4y8NFkVzocn7idvMD+Z6svmpfz+NvQTqDg2kVX4c20H7BxH8yWB8V6o3DYJbfSWKBwGs5GfG6/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j4SNyXApjmdvn56jDzQVCtQQwoV0ijqQQaQyBsBFriKeF04XA
	aVIpLciTPlrDZtI4TKF37APUxIEkM9NPkVM++1SebelCaiA82/gzvRhh2JwyDLnP1rX1iXqJ48e
	N5eTpydQquXK62Xtv9uyHMbQtzw==
X-Received: from uabdh12.prod.google.com ([2002:a05:6130:250c:b0:98c:53e1:4af8])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:e08:b0:7c3:1395:a090 with SMTP id ada2fe7eead31-7d6ba3c58ebmr1924468137.6.1795036182615;
 Wed, 18 Nov 2026 13:09:42 -0800 (PST)
Date: Wed, 18 Nov 2026 21:09:31 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261118210933.2477423-1-thaisonphan@google.com>
Subject: [PATCH net v4 0/2] tcp: initialize missing request_sock fields in
 syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Matthieu Baerts <matttbe@kernel.org>, Simon Horman <horms@kernel.org>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Stan Iliev <stani@google.com>, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thaison Phan <thaisonphan@google.com>
Content-Type: text/plain; charset="UTF-8"

Initialize missing request_sock fields for TCP connections accepted via
SYN cookies, where cookie_tcp_reqsk_alloc() and
bpf_sk_assign_tcp_reqsk() allocate without __GFP_ZERO:

- Patch 1 initializes ireq->ir_rmt_addr and ireq->ir_loc_addr to
  LOOPBACK4_IPV6 in cookie_v6_check(), matching tcp_v6_init_req().
- Patch 2 initializes the AccECN request_sock fields in
  cookie_tcp_reqsk_init() and sets syn_ect_snt in cookie_{v4,v6}_check()
  for kernel-generated cookies (!req->syncookie), matching
  tcp_openreq_init() and tcp_{v4,v6}_send_synack().

An AI coding assistant helped audit the request_sock initialization
paths, write the QEMU reproducer, and draft the changelogs.

v4:
  - Patch 2: restore treq->syn_ect_snt = 0 in cookie_tcp_reqsk_init()
    and guard syn_ect_snt updates in cookie_{v4,v6}_check() with
    !req->syncookie for BPF custom syncookies; document in changelog
    (Sashiko, Eric Dumazet)
  - Patch 2: add Reviewed-by tag from Matthieu Baerts
v3: https://lore.kernel.org/netdev/20261117124710.1338951-1-thaisonphan@google.com/
  - Patch 2: clarify syn_ect_snt / tcp_accecn_third_ack() description
    for AccECN connections and reference RFC 9768 Table 4
    (Chia-Yu Chang)
v2: https://lore.kernel.org/netdev/20261116023709.132684-1-thaisonphan@google.com/
  - Patch 1: clarify how KASAN (via SLUB_RCU_DEBUG) exposed the bug,
    explain how it was observed, and include the inet_sock_set_state
    trace line (Eric Dumazet)
  - Patch 2: drop redundant treq->syn_ect_snt = 0 in
    cookie_tcp_reqsk_init() and clarify how the bug was found and
    observed via TCP_INFO (Eric Dumazet)
  - Add Eric Dumazet's Reviewed-by tags
v1: https://lore.kernel.org/netdev/20261114161248.3428695-1-thaisonphan@google.com/

Thaison Phan (2):
  tcp: initialize ir_rmt_addr and ir_loc_addr in cookie_v6_check()
  tcp: accecn: initialize AccECN fields in syncookie path

 net/ipv4/syncookies.c | 7 +++++++
 net/ipv6/syncookies.c | 6 ++++++
 2 files changed, 13 insertions(+)


base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.56.1.831.g720f3f5937-goog

