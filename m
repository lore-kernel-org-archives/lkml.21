Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795755072;
	b=4B+egJKczUMBdrbHkXh93rs5JyQpn6daL6vnhIi0ly5/07s6g96GushkcahThMLljb0s
	 PIEZwKQp0BTGgMF7OX1PEceNaCYvWMncSdmhudZ+5S8Xp2ib6N7vZw7yM2AqE2/YdGADu
	 zWqknsC4W7DMHqgil8kLWlCEuELdq1++eCOPZJRswH8huKKQQhxjo2Ah8x2lJc8S4c2Wc
	 6yfw0C/pvdpp1jeI6axdZ9HJTR7tTXXsl9LBJrTXFN6gJ9jfyQxyuBB4IBszDsZdQK5zP
	 dSSbrJUE6WkR/J93dHCirR0l7rqDSCTrj3LUZjx+8coSuux0PpR/P2o2n6it5OvxQHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795755072;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=r+zl2OxSNHXAEG7sUZ66NUVaTdjkd8Y/67M1UrdLLDo=;
	b=C5+K70s9m8573Kf0roj8yiBMdPorGb2xHu8+kCldfEE3OqxXL5zze02PYw7+K8BThf60
	 v0P6iRCE2r0QXZRoNV8bI6zcSgMVgR1qSIRlWNhd+wKCGHEGnDT/eUSgaZgxokIsHOFY8
	 CYnl4tS+nhLFg4eoUUFpKcwu9D1Y4t+MmzWSS3LI4VsjOCcpt930eD4jxXpAAVbKIYR8N
	 Jxp+kxDj60nrNxl2pDLQqRi1R4WDE1rYTu1P05DWWkH4neC5DDaDjBrkXxiyK7vo/mmh0
	 HQxhjiSjiqyWqTBoBRdS+sVcgaEIgCuy373g98t/o8DZzzdIcXlKoHAiXpqNY1phuCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TflqBf0P;
	arc=none smtp.remote-ip=95.215.58.245
Received: from mta1.migadu.com (out-245.mta1.migadu.com [95.215.58.245])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480D3606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 480D3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TflqBf0P
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fEspHw4t5fpXm+0QjasgULIFVTPbdXf2a8mYT7wPvsY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795755069; v=1; x=1796359869;
 b=TflqBf0PbHA9OU1yCcMqTjV+JsLPMx9fh/RM9h/LjCB3s8RL4bjuxDBt76D4o96TJMq+uChH
 kNIsH1MzCbubF99verDiVTVCtaCO7qtQHAOvE+T3/RD+goEPGS41YtgOG5jjC/3QhEMTePPi/tf
 E/fVWc7JJ0vaJd4+ud8dldPY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 520e6476b5f0411c;
	Fri, 27 Nov 2026 04:51:08 +0000
X-Mizu-Trace-ID: 520e6476b5f0411c
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tcp_metrics: fix zero snd_cwnd_clamp from a half updated entry
Date: Fri, 27 Nov 2026 12:50:58 +0800
Message-ID: <20261127045059.142247-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
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

tcp_init_metrics() takes snd_cwnd_clamp from the cached TCP_METRIC_CWND
when that metric is locked, i.e. the route has "cwnd lock N".

tcpm_suck_dst() refreshes a cached entry in place. It writes tcpm_lock
first and only then updates TCP_METRIC_CWND from
dst_metric_raw(dst, RTAX_CWND). Readers only hold rcu_read_lock(), so
when an entry that had no cwnd metric (value 0) is refreshed from a
route with a locked cwnd we can have:

  CPU0                                 CPU1
  tcpm_suck_dst()                      tcp_init_metrics()
    WRITE_ONCE(tm->tcpm_lock, val)
                                         tcp_metric_locked(tm, TCP_METRIC_CWND)
                                           -> true
                                         tcp_metric_get(tm, TCP_METRIC_CWND)
                                           -> 0, not updated yet
                                         tp->snd_cwnd_clamp = 0
    tcp_metric_set(tm, TCP_METRIC_CWND,
                   dst_metric_raw(dst, RTAX_CWND))

So tcp_init_metrics() sets snd_cwnd_clamp to 0, which is what commit
363c8c79220d ("net: ipv4: add zero check for snd_cwnd_clamp") tried to
prevent.

With an mdelay() added after the tcpm_lock write to widen the window,
I can hit:

 WARNING: ./include/net/tcp.h:1580 at tcp_init_transfer+0xc16/0xd50
 Call Trace:
  <TASK>
  tcp_finish_connect+0xec/0x2f0
  tcp_rcv_state_process+0x8ae/0x3060
  tcp_v4_do_rcv+0xbe/0x580
  __release_sock+0x1a2/0x1d0
  release_sock+0x133/0x150
  inet_stream_connect+0x5d/0x80
  __sys_connect_file+0xad/0xf0
  __sys_connect+0xa8/0xe0
  __x64_sys_connect+0x42/0x60
  x64_sys_call+0x2554/0x27e0
  do_syscall_64+0xe4/0x470
  entry_SYSCALL_64_after_hwframe+0x76/0x7e
  </TASK>

Writing the value before the lock bit does not help, changing the route
the other way (from "cwnd lock N" to no cwnd) then gives the same 0,
since the lock bit and the value are read separately.

Commit 363c8c79220d ("net: ipv4: add zero check for snd_cwnd_clamp")
already rejects a locked cwnd of 0 from the route config, so a 0 here
can only come from a half updated entry. Just ignore it and keep the
current snd_cwnd_clamp, like we already do for TCP_METRIC_SSTHRESH.

Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
Found by sashiko:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261019222531.1073-1-kj2864%40nyu.edu
---
 net/ipv4/tcp_metrics.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/tcp_metrics.c b/net/ipv4/tcp_metrics.c
index ae551546422f..fe29fd433eb6 100644
--- a/net/ipv4/tcp_metrics.c
+++ b/net/ipv4/tcp_metrics.c
@@ -494,9 +494,11 @@ void tcp_init_metrics(struct sock *sk)
 		goto reset;
 	}
 
-	if (tcp_metric_locked(tm, TCP_METRIC_CWND))
-		tp->snd_cwnd_clamp = min(tcp_metric_get(tm, TCP_METRIC_CWND),
-					 TCP_MAX_SND_CWND);
+	if (tcp_metric_locked(tm, TCP_METRIC_CWND)) {
+		val = tcp_metric_get(tm, TCP_METRIC_CWND);
+		if (val)
+			tp->snd_cwnd_clamp = min(val, TCP_MAX_SND_CWND);
+	}
 
 	val = READ_ONCE(net->ipv4.sysctl_tcp_no_ssthresh_metrics_save) ?
 	      0 : tcp_metric_get(tm, TCP_METRIC_SSTHRESH);
-- 
2.43.0

