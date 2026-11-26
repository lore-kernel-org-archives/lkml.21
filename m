Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705745;
	b=r6OuK80+XeyngLJRGY7xUROywy24oS3szqe3xYT8DafnHtZ4e/ApiTEpTJzK2E3qDA+9
	 HgdoNEDv6UI9ZWnWWPuDcUDPboaXZpTxx7OFLS+6pC84+klEC9rnFkXyfEh0XbwH7P3ti
	 krc7zO5saxWXGaDBdsOmK2nmf4oFFeUSN8YXDgrEwSCkOI4oI/BOCh2tWxSogsuAEbE1u
	 Lbz+zK2t8u5Xsy6b+pEWYHWpG1o9+qrVe9cOucPQS80NV0GeIo4dMni7yfeDsA2macboX
	 xsk0yO65CmZSrRZHCmRk6yVXc9tt+uFIeyRVY+6nTgbyDmlivKctlOs4/wNWcT/25BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qa1Fr1ic+7dw5K+GkYsqx2aXPhAv1AnGBqdarsMvPfQ=;
	b=zNp7gQ+XKss2PAuu+sYhGTrrtrm4UrKkaDGPM1Df46huPGVF3jT1Tgc4wE6ASdcLDQH1
	 Lp0URaqFyFm0aTVt8qsACEfvsAGjdHH0m0Z0AQAASG+WL6xq0f7PF5rnmSl8yPQ6QJAlI
	 fnWsEOa5pOrk+g3zBG/75i9S+iB064r/4hReq//TpWSUOBUVdtBkjQPaXS0ooBb2bOTPT
	 erysX3BZfrFPRtn+7fpwZxPvUBcfSMWWCPBbORmhZ+ECfKMPITXiB44WfBWYeA3x6+ljf
	 YRpjCvLZAiqIZrgk7GRHiFHA8W0UDv8848hoxfuNPSqAWA7Fg1hm1QR/tpzTs+UZvWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=B6xSaKdB;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5309D606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5309D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=B6xSaKdB
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cde827b7b95so2259458a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795705744; x=1796310544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qa1Fr1ic+7dw5K+GkYsqx2aXPhAv1AnGBqdarsMvPfQ=;
        b=B6xSaKdB9GurxyEl5XPkhgRx383fZevVQduVZmC86MWv382bjsTEtHbvVGgHN4Cznn
         4JSZJ81ag+eMbef5qkmG1EHTwPt1/D4GYkbNYl+b20Pv4J4wnJQGVnq40kjtElZ5UCnE
         yxT0xLW5tIIGRUC1T6ZTZzJz2XBXnuo3V4r3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705744; x=1796310544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qa1Fr1ic+7dw5K+GkYsqx2aXPhAv1AnGBqdarsMvPfQ=;
        b=j514UHDZPScgitj3SczcYio+v7yoblzYb66ZLafkKADU3A8UB8ItyvHJFGXt/Q1W5T
         M/r900GLdGB/h25ev1Z4jwmYtTQRQ3d5jhdne6eHoYR8gJQQW14Ra4Z91dW51lgkSY7p
         yPg//KEickaslqXo/X7kSu0F69jH7sj2J+26OLb1sYOSLFvCnxnYxUQM/CvYgNbTAe8J
         RFccBk856BqKrzKAkQ1FjMq4hTGUCPiV3QYNT7WrbHFjej7T1MRoTJgwAIN3+x4JukPB
         EMfYomEEWUpuPRS5daGp2SJ82HCJAFb1c27h6tH3p7Bgg4S+GyAefVIF9UM5j5+HdnF1
         wJCQ==
X-Forwarded-Encrypted: i=1; AL+hErE6P5H34yuBOelE/dLBnFan9VlMBCpytgv0+VOerOpoOVAiBSRqhcIxVkSbAF66J/egy63ZdlasoqnGfjQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r3otEKQN2t8xNEx5G06bxxSue1iEQEYAk29YVBQiDNxUV4XjX
	2czItdP2CfQDnS3IeJoEQDaA6FepHWeF6M5izRxCT7RTREYY+vSSU8IKPwusCu0WrHY=
X-Gm-Gg: AZFdTZeoq4FHZ77JBl0Tw3TXCs1Y/AYAGsvZIiMK5rllF+q/N+zbPKLmwHnIUPuY8yz
	V5wXigAK8kml4UV4GWeBShDFZFXErbYqIT3tW7vo9o7H4win9eCiNBzrO8MW8m/j6J98b6XoJP/
	NlF0JU69m/ZSjJdPMVl4CFinKySV5zFGxn4zcplrN84SGKRjzJS94cs2O595Q0oUfUQQcLFr9TK
	lc5F7kJuBYYHHK+vtb6p34Lt6SqHUaPvT4EyeHnspRRQ+ai72FqCOWLi4huZX+VOmZfuudDnGLF
	lAuIHuM00cxARYUOjwMmhiaMTYQ7o52Q8SdTdCsnZmhoYIiPExC/jHyZ/Qq8IE1d7XSki5IEg6B
	62lvKcofa/wfOgvaoYvTANRFiURWzUa1i4ZgECJjK+mUbg0aWxd4+rSoCyanyDKmFcM/owx9OSO
	HX6ADTLgShoKW0hTofLG+viu10uF5R7RmlKNIxFzQVuA6QmUds83Bn6j37OHrxJ9QJk7IB3ivhB
	3LpIuc6z3F2ju/HwIp82QskrA2XRAQEQNvVepq0L9MCBex25WHSU6rhX6kds/qaOtt1qnR0Qk/n
	H2xp6uBwTt/XxR80GStxITsYToT2xLp1ANYL/fcJWPkMO2oxvDT2g3/e/ULgVR1n6X8uwkIwfSD
	6jAEn4LWA9fwhPr82xwGGnouBJXjByzftzhyLZvseeY74WMv2txky/KZaR8ddky0MmINl3UKmXF
	SE+aXC3PmTDA==
X-Received: by 2002:a17:90b:2792:b0:3a4:ca46:840f with SMTP id 98e67ed59e1d1-3b41c8e172amr19036608a91.8.1795705743643;
        Thu, 26 Nov 2026 07:09:03 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm34512681a91.1.2026.11.26.07.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:09:03 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: wenjia@linux.ibm.com,
	jaka@linux.ibm.com,
	alibuda@linux.alibaba.com,
	tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com
Cc: netdev@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kapil@presceralabs.ai,
	stable@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH net v3] net/smc: drop the connection when the peer's failover cursor is impossible
Date: Thu, 26 Nov 2026 20:38:56 +0530
Message-Id: <20261126150856.2116458-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-233843@kernel.org>
References: <sashiko-outbox-233843@kernel.org>
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

Thank you - all three findings are right, and each mechanism was read in
the tree before acting on it.  v4 is posted separately.

[High] premature cursor rewind before abort check

Correct, and this is the one that mattered most.  v3 ran the check inside
the fix-up block and returned 0 from there, by which point

	smc_curs_copy(&conn->tx_curs_sent, &conn->tx_curs_fin, conn);
	smc_curs_copy(&conn->local_tx_ctrl.prod, &fin, conn);

had already run, so the connection was left with prod behind
local_rx_ctrl.cons and peer_rmbe_space still holding the credit the forged
message produced - the atomic_set() that recalculates it is below the
block I returned from.  And the tx path tests conn->killed and
local_rx_ctrl.conn_state_flags.peer_conn_abort, not out_of_sync or the
local_tx_ctrl flag v3 set, so a send under lock_sock() could reach
smc_tx_rdma_writes() before abort_work got the socket lock.

v4 validates before anything is rewound and drops the connection with the
cursors as it found them.

[High] incomplete peer consumer cursor validation

Right on all three counts.

The bound is now the bytes that were SENT and not yet confirmed - the
distance between snapshots of tx_curs_fin and tx_curs_sent - rather than
sndbuf_desc->len - sndbuf_space.  As you say, that counter covers the
PREPARED bytes, so v3 would have advanced the cursors over data still
sitting in sndbuf.

cons.count and the difference are both bounded by peer_rmbe_size now.  v3
left that to smc_curs_add()'s single subtraction, which is exactly as much
as you describe: with sndbuf_desc->len larger than peer_rmbe_size, a
difference in between passed and left prod.count outside the RMBE.  Below
peer_rmbe_size the repair is exact - prod starts at fin and the difference
is their distance, so prod lands on cons rather than behind it, which also
closes the "halts sending" case in your third point.

[Medium] false-positive abort racing tx completion

Right, and it is the same line that caused it.  smc_cdc_tx_handler()
credits sndbuf_space before updating local_tx_ctrl_fin, and
smc_switch_cursor() holds only send_lock, so an honest completion between
the two reads gave a diff computed from the pre-completion cursor and an
unconfirmed from the post-completion counter.  Comparing two cursor
differences removes the mismatch: both come from snapshots taken together,
and neither is an atomic counter the other path updates first.

Tested on 7.3.1 with KASAN; net/smc/smc_core.o builds clean.

pw-bot: cr
