Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968906;
	b=fgynFf4TvcVDTHzuRQ9IcfJz8koBXAVsT+elHnXIrQMza1zQzQ/jRKh6U3CaBgpFHLfy
	 diqWmzocAtZbnxPD+ofzWqZAnz8J4xz8StdmLNZ+nNsK4KJ/GddK7dcH8pPOXX1osa6kv
	 9N9z0Xd7jYjHU9+we4o3886pbGBj9YqbUckIbgaWz5aSEhunuJGowm6bzBQwg3Jb7hp9c
	 luPdyz7ZLtoEdrEfygjxM612esmnFT8pMpWwdCZ8yFhRSMqvuSwEd5pVdYPLmd22uoJJO
	 OSow3LUSg+rRgpCktwqASsALSA7Rm5uf7ta8/fIOpiUVPvMIPfwpG504mcYlJd1JKCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+vta/0qgav/rUrht9WwF12uEPKYQmyrrbFSNEVdW8o0=;
	b=FhJmEuU/7Q5O+YL2bUFX9gc/FVP/ScGgUZDhVBeNNHMb/TE/dBy7TELdmA4S0bj2KQTl
	 vN70vFONf7QwIBrruhHAkVzFgtnjyacqaNHQUMHdFnI7Zd1eOtNJIQYpWaExV7/UNh/W2
	 27lpmY5TCdXb4O/f7If1U/fwc3telfrnwEBlPuYYaJL8k59q5Uf3SjsuYXgGYqmwMuk9E
	 vyFmLchI4bOrsXCtMi859wiiaQIrcjCDdYDhpL/7gkLozwWGVlI28/ZQ0qKm+GdH1717x
	 WQpGXmEn7ONNevUUW2JIiGWoml1cVGOn31G9U15HeY6wuEh/ImnaxIr9s8HBgaAU9Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cy2Q+Xkl;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C23606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76C23606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cy2Q+Xkl
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e987a2ba0cso3088495ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794968906; x=1795573706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vta/0qgav/rUrht9WwF12uEPKYQmyrrbFSNEVdW8o0=;
        b=cy2Q+XklQ5KqHJHhh/oFJkmh2mqiS/bMvFmsez1b8zvlbdGO1ZLx7dgOmdH7qom5Dr
         kh226ubwjOb6PxOYf68rstZZ1Q2z3P3dyvyIKJnUR3VlFSdRAYXxsoPehePvwxdkhRXs
         DeUEDiCP34ccd7e8hDOHxOS1UfC6z4vlOiBL4j5VrgtcS7XUyUFDo50v3kcsDj7N7KfB
         y1NNU42aTxX7sssOs3AhlJ0viv+klJfxsw4nVVyXxMIi0doOelpjrq1dr6dZoEvBhAZM
         dOuYgQCT1igPRWXDkb8hbj3fKv4+6JCtr4xtv+/khzeHnNepF8f/tYk+kSCentJ9/A3U
         9sMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794968906; x=1795573706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+vta/0qgav/rUrht9WwF12uEPKYQmyrrbFSNEVdW8o0=;
        b=PxjFNHJsfX/G41CpdinTnuLpvQq2dxI2W+SYbdsh3aCSk4gOiuJDhTvPIbxRJ6xMKn
         HB+9sKYlhYTAagRV79vkOsugANR2i+LXP0HVJT7G6r/1T3rQ6pXj8LEzVUknfxuXeisQ
         W1fGx6o2Wrl83wFJnka98Hl64QyVJYS8RAHYZcHcTUPlNZcYa0D2TywTWle7ybGxRy/H
         r6/vCa0pEGXpW7UVf2LKtDyhEoi77jMjmkKId1p5KEOzym7H7wZtnypTlSSH9JyVzsfY
         GsvMpFjxO+d0e4k9RfD4L+BB0JiocjdG20LNv+pWRciILEC/yfQpdq0+bAk6LS/lSWXx
         xgxg==
X-Forwarded-Encrypted: i=1; AL+hErFZb8y7e7yA+e0vL1iZRcJxgMgoEw7JB5FR82TbizY7YTdpUow5oYXV84eVgYp+yew2f5FmYbQPZCrmSGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r8ZgXseyjf9eHa+Hgy7jfW03Lc4MVU50k0WXUGUbc8YOhA/V7
	EqMpKhVIe8r0IkaE9ZXlFdZMfhohs/e9Y0Ub1Q27CfRM0HcHcj5ZXzN6
X-Gm-Gg: AZFdTZeG4zVJYmQ/PmhJ4sXgS9w8n1b5CYuhfMJY9qc/AYH+MMFLRZnF1QdU53IRjJV
	I6rGLQET8PT4rplBj36/OQkRwh3jfELhP416biiqFvyfInqmqhgMQQWSV2q3Isk7XVjd2FJIe4t
	zCQDkeO7w15WQImh9TCNg6ql++Bf3yf7MhbCBMyHvYiyZeOUAJAJaMmLdbR1S8ji96T9fEkBpvE
	Gl+abmzifaFqJaerpMzxEpcX0vRIqjzCrQ4Jgv4qYRn0Otc45iCSv0tKGE4uUgRWV9XPS7HP3FP
	JesL2wm8ADXEKibasm1AwGGMsh93VS3X+krIkdFB+X8Tzm5P31z+C300XwXmSKQShS+UYC3m3eR
	BtH126VDM2RNoZy//4xhlFil7p4lgAh0IeLlzi+ER4S7HHwlD6uzrg0kmMfUW4Ulwkig7B6lQED
	fHOyY4+Pirv+L8LAAG6qAmAvzd4279pGBZqLOHavHB1ph5ZAkJPgHhYHKsxNO7F5N//oNAnwQEM
	TxEGmcUoNt2d5bmUeE/YLsfoQ+UN+dXx8Gj2kSyVSUbk14h8s6NozGkOGOqtdjiTRhXKYwDCHxp
	QAjas/zqbH/pqv2z8t0IUqY3jNt3fBnD/Tf+6Ymrq9P1KC2n43AQidZ/2BnKiZgBZ4v57bFI3yw
	/1T8gWt0NoTgdx3z92q1AwO0=
X-Received: by 2002:a17:902:cec3:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2eff754e4d0mr12461425ad.57.1794968905750;
        Tue, 17 Nov 2026 18:28:25 -0800 (PST)
Received: from message.eml ([2a09:bac1:76e0:450::21f:e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6181423sm4715605ad.32.2026.11.17.18.28.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 18:28:25 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Tim Fuechsel <t.fuechsel@gmx.de>,
	Lukas Prause <lukas.prause@ikt.uni-hannover.de>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/2] tcp: roccet: do not restart from idle on RTO retransmission
Date: Wed, 18 Nov 2026 10:28:12 +0800
Message-ID: <20261118022813.9778-2-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118022813.9778-1-zhiqizhangg@gmail.com>
References: <20261118022813.9778-1-zhiqizhangg@gmail.com>
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

roccet sets .cong_control, so tcp_slow_start_after_idle_check() returns
early and roccet implements the idle restart in cwnd_event_tx_start().

An RTO retransmission also raises CA_EVENT_TX_START: tcp_enter_loss()
marks the outstanding packets lost, which drains the in-flight count
while tp->packets_out stays non-zero.  If delta >= icsk_rto,
roccet_cwnd_event_tx_start() then takes the idle restart and overwrites
tp->snd_ssthresh with tcp_snd_cwnd() == TCP_INIT_CWND.

When a TLP probe was sent, the RTO timer is rearmed for a full icsk_rto
at that point and the probe is the last transmit, so the first RTO is
affected.  Without TLP, the first RTO can escape: the timer is armed
when the first packet of the flight is sent, and pacing spreads the
following ones, so now - tp->lsndtime < icsk_rto.  The second RTO is
always affected, since it fires one backed-off icsk_rto after the first
RTO retransmit.

roccet_state(TCP_CA_Loss) calls roccet_reset(), which clears the private
state; ca->state is already LAUNCH and last_max_cwnd is already 0 when
roccet_cwnd_event_tx_start() runs, with or without this fix.  The only
field the idle restart breaks is tp->snd_ssthresh: it overwrites the
value preserved by roccet_state() with TCP_INIT_CWND.

Skip the idle restart while packets are outstanding.  The packetdrill
test in the next patch fails at the first RTO without this fix
(snd_ssthresh == 10) and passes with it.

Fixes: 819d59638796 ("tcp: Add TCP ROCCET congestion control module.")
Link: https://lore.kernel.org/all/179179785248.434549.16829837649351382748@kernel.org/
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 net/ipv4/tcp_roccet.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/tcp_roccet.c b/net/ipv4/tcp_roccet.c
index 04b9e52466..1769e4bbe3 100644
--- a/net/ipv4/tcp_roccet.c
+++ b/net/ipv4/tcp_roccet.c
@@ -1144,8 +1144,12 @@ static void roccet_cwnd_event_tx_start(struct sock *sk)
 			ca->epoch_start = now;
 	}
 
-	/* After idle periods, go into LAUNCH with slow start */
-	if (READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_slow_start_after_idle) &&
+	/* After idle periods, go into LAUNCH with slow start.
+	 * We are not idle if packets are outstanding (e.g. RTO retransmit),
+	 * see tcp_slow_start_after_idle_check().
+	 */
+	if (!tp->packets_out &&
+	    READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_slow_start_after_idle) &&
 	    delta >= inet_csk(sk)->icsk_rto) {
 		tp->snd_ssthresh = tcp_snd_cwnd(tp);
 		tcp_snd_cwnd_set(tp, min(TCP_INIT_CWND, tp->snd_cwnd_clamp));
-- 
2.54.0 (Apple Git-157)


