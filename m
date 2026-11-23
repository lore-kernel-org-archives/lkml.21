Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436858;
	b=0JgXlGzfYVqvK63snLnrH1tza2EnJgeTLM3jkN+aBZ0WoRBmaBrG7idokd2W7gjATpLv
	 jHwA47rqKlhceoQgZTpNxRcTN9FA7YD4dBHd9mQ2osPEL+Uf8BAYdvTsrBYGJ0INYf5rS
	 5hLNnug/7oEERzifx9lTXNp9HceTLdTz2Rc1VgkZp+M/HnvVzHxtbY/Av5Dx6xmmje9yA
	 MsNnVj09ylttOoJHRYLOz/Agc5Gq6KR9T3EN7sTELZPOll+t0cvVwLNJ4KLp17QOcFIX8
	 QcROaDZ1Jxi4rAiH4p98/6YMdkG6anrXSdZthP37NVDqSV6fmLmxcO5N+oCRDjrezoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436858;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yX9CeG59OS8ilGsOns30C8i4+axcyTEG7TgTi3PMHLU=;
	b=rSgFQEfGr9GTVDjn+/9NoWcOia1H8KW+rFw+uh9+KDTdb7BcWnIA0/sjtHBta5b15nxy
	 O2HWD+5TVhzklPgQ+VoxEyneNN0IfWs8sg31zHFX0+FyNMQKi21Pl5hmShtmCchGCGET2
	 XCxNNC4WwC9Wyyryn09J3IukdqKUw35X+ddHUtgSs2l20seBJIzVN4V+xVfD2dtCHwrkd
	 uxJRtGP6Z3U2mFBpmyKSOuds6suOhrsMLOLyEyf4B5SMlyEBt0H69tsX8yBJfkKX1TGDw
	 abVqdC/TBqVzj7FVpMtb1N8RIb0fm1bAL4A2Er/978QPeHtQEGa84YkEA54b5ssWhag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=7xz.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4048606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4048606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=7xz.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38190551625so6704309eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436857; x=1796041657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yX9CeG59OS8ilGsOns30C8i4+axcyTEG7TgTi3PMHLU=;
        b=l/qN5+stR89E5gnhTUgaTWVmQT9HuKTGmU1B6MFPm9My5YDn7hmPgyHl7oiR9KOPM/
         cnbI5rWLl9zY9sNpUWyEZxh9icBpDsW7I2sV/dEUUheRjeyFCnLpVxiVGM19OYUGDh9L
         31zHNgbC9e07J/dstqT8PI+LCk0/73csLUeO4oQuAdQtPtw3hpLtmpVjZMYcoAeH7ecL
         36O9Dkp8wM5uW1LK3xJboXKk6YegEebv/NNj8ANdCXC/ZDCpgRbjhL3fTbV0DBiWpb3z
         oX3CNWv0IS8Blyi66PFRuQGJVjT+7YXRdCde57liFj35kvWY6qdd0LHWN+uqMddOQ2Hx
         SJYg==
X-Forwarded-Encrypted: i=1; AL+hErGxXKXnVuTO5++F8bIIvQFVQgwNN6PvwTj0xIwCxt6LA5sWaqP6ZZvQ9SkVDR8RjDuBF5ka/d/gDRkZj9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N9zSrbPcExyYhXk78VvdDq5gt61EeYsfqpwbvN7pz9FxuZ22v
	CPy2z/kTVI+wFHZJK+Jue82fYYXzRJBsA5M6aqm8mGm5dga1n9dBEJIS
X-Gm-Gg: AZFdTZeHlX8YhP11UssqAnnfbedifpBiIFeuTqgq0j+v/Pux9TSKdp/ERrUMTZo1b1k
	MMeioLyd0iiQkr/kfYxIYsmgZgYHgJemSF9yIuV6QYEqrULuwwoSE1Rjog/i3Kyt3X4shYrL/+p
	Hd33mJVnG17bpnX9kcGub89FhPnaDWE451kRRGajwpsWgo1M34WBNVqTjfcK7QVoYxHDxLlTX5a
	00iltZJE+RbNGbe0Uo0X74YSlblxL+9yan8yad6lDnXzq+IfczrSC37Ixhd5NI8t4cRQq+x3JCq
	E7XJvhiT95N4mkrX9Lrjf9Qs3W2YBMSTQ4VPjBHG8zhimwWjPZMM6+DyHPG8DqueOUldnWKNvtS
	nDlxXdnkDN3CcBksujAX7BiYfhQXT3YandJ1OLLagHrD/kB+L2W0VoIL+RXEAGfOVz2gaKVD6is
	x8yW6rEiraoMg127Ka5okfEjEAahmelGZLwHaDo2w5jbCb0fWHCvFXjLqG/i+Cpmg6vD+DYM3Hr
	JUL1c88XD4/vdRMeiuGrc4QbYSXX9RA34OVZD49cm3tEO+U/NVY93KhUJ/3sJqGwBKq/SIaOGRi
	1kykhr5JZTUJo3dYBGXgjvqag76Gf6/2PeLJnlBOIrSgww==
X-Received: by 2002:a05:7301:182d:b0:386:b801:cd06 with SMTP id 5a478bee46e88-386b801cd3bmr1163094eec.40.1795436856700;
        Mon, 23 Nov 2026 04:27:36 -0800 (PST)
Received: from DESKTOP-SA7O5VQ.tail87cff0.ts.net ([211.202.142.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm25212717eec.1.2026.11.23.04.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:27:36 -0800 (PST)
From: Sihyeon Park <me@7xz.dev>
To: sam@mendozajonas.com,
	fercerpav@gmail.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	willemb@google.com,
	delphine_cc_chiu@wiwynn.com,
	Sihyeon Park <me@7xz.dev>
Subject: [PATCH net v2] net/ncsi: bound channel walks by a valid Channel Count
Date: Mon, 23 Nov 2026 21:27:32 +0900
Message-ID: <20261123122732.2971-1-me@7xz.dev>
X-Mailer: git-send-email 2.56.1
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

ncsi_probe_channel() and ncsi_suspend_channel() (state
ncsi_dev_state_suspend_gls) walk the channels of a package by
incrementing ndp->channel_probe_id until it equals ndp->channel_count.
channel_count is a single device-wide value, copied unchecked from the
Channel Count field of the most recent Get Capabilities response in
ncsi_rsp_handler_gc(). A controller reporting a value outside the valid
range breaks these walks:

- Channel Count 0: in the suspend_gls state channel_probe_id is already
  1 when it is first compared, so the walk never ends. The driver keeps
  sending Get Link Status to channel IDs 0, 1, 2, ..., a single
  link-down AEN never completes the reconfiguration, and NC-SI does not
  recover when the link returns. A down/up/down flap in that window also
  logs "Wrong NCSI state 0x100 in workqueue" and stops channel
  monitoring. Because the value is not reset between packages, the next
  package's probe also stops after Clear Initial State on channel 0,
  so its version, capabilities and link state are never read.

- Channel Count above NCSI_RESERVED_CHANNEL: the walks send commands to
  channel IDs past the 5-bit channel field. NCSI_TO_CHANNEL() does not
  mask the channel, so channel 31 becomes the reserved channel and
  channel 32 on package 0 goes out as package 1, channel 0. If a second
  package answers that Clear Initial State before it has been added by
  the Select Package response, ncsi_rsp_handler_cis() calls
  ncsi_add_channel() with a NULL package and the kernel oopses.

DSP0222 defines Channel Count as the number of channels the controller
supports, so a conforming controller reports a value from 1 to 31; these
are robustness fixes for non-conforming controllers, firmware bugs and
emulators (libslirp's NC-SI responder, used by QEMU user networking on
the Aspeed machines, reports 0).

Clamp the stored value to [1, NCSI_RESERVED_CHANNEL] and warn when the
controller reports something else: a controller that answered on a
channel has at least one, and channel IDs stop at 0x1e. Also terminate
both walks with ">=" instead of "==", so that a later Get Capabilities
response that lowers channel_count in the middle of a walk cannot make
it run past the new bound.

Tested on QEMU 11.1.3 romulus-bmc (aspeed_g5_defconfig; unpatched: net
tree at e203d8a4751d, patched: af6737b90668, no net/ncsi changes in
between) with a minimal initramfs and a loopback NC-SI controller
emulator with one or two packages of one channel each (pN = Channel
Count reported by package N):

  kernel     count       event   result
  unpatched  p0=33, p1=1  boot    oops: ncsi_add_channel(NULL package)
  patched    p0=33, p1=1  boot    warning; p0 and p1 probed normally
  unpatched  p0=0,  p1=1  boot    p1 channel 0 gets CIS only
  patched    p0=0,  p1=1  boot    warning; p1 gets CIS, GVI, GC, GLS
  unpatched  p0=0         A, B    no recovery (GLS to ch 0,1,2,...)
  patched    p0=0         A, B    recovers; same commands as count 1
  patched    p0=1         A, B    unchanged; ch0 GLS 58 per 60 s

(A) link-down AEN, link-up 15 s later; (B) down, up, down 0.5 s apart,
link-up 15 s later; measured 180 s after the final link-up.

(CIS: Clear Initial State, GVI: Get Version ID, GC: Get Capabilities,
GLS: Get Link Status)

An AI coding assistant (Claude Code) was used to analyze the problem,
reproduce it in QEMU and draft this patch; I reviewed the change and
the test results.

Fixes: e85e271dec02 ("net/ncsi: Fix the multi thread manner of NCSI driver")
Signed-off-by: Sihyeon Park <me@7xz.dev>
---

Notes:
    v2:
    - Clamp Channel Count to [1, NCSI_RESERVED_CHANNEL] in
      ncsi_rsp_handler_gc() (Sashiko review). With only the ">=" change, a
      count of 0 still cut the next package's probe short after CIS, and a
      count above 31 aliased into package 1 and could oops in
      ncsi_add_channel(); both are reproduced and fixed above.
    - Drop the v1 claim that Channel Count 0 behaves like 1 with the loop
      change alone; retitle accordingly.
    - Link to v1: https://lore.kernel.org/r/20261119100625.72505-1-me@7xz.dev

 net/ncsi/ncsi-manage.c |  4 ++--
 net/ncsi/ncsi-rsp.c    | 12 +++++++++++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 1d63958c4429..c5cf2ca0385c 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -520,7 +520,7 @@ static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
 			goto error;
 		ndp->channel_probe_id++;
 
-		if (ndp->channel_probe_id == ndp->channel_count) {
+		if (ndp->channel_probe_id >= ndp->channel_count) {
 			ndp->channel_probe_id = 0;
 			nd->state = ncsi_dev_state_suspend_dcnt;
 		}
@@ -1491,7 +1491,7 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 			ndp->channel_probe_id++;
 		}
 
-		if (ndp->channel_probe_id == ndp->channel_count) {
+		if (ndp->channel_probe_id >= ndp->channel_count) {
 			ndp->channel_probe_id = 0;
 			nd->state = ncsi_dev_state_probe_dp;
 		}
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 33921dc169e3..84cc8ac0ca2f 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -829,7 +829,17 @@ static int ncsi_rsp_handler_gc(struct ncsi_request *nr)
 	 */
 	nc->vlan_filter.bitmap = U64_MAX;
 	nc->vlan_filter.n_vids = rsp->vlan_cnt;
-	np->ndp->channel_count = rsp->channel_cnt;
+	/* Channel Count bounds the per-channel walks in ncsi-manage.c, and
+	 * the channel ID is only 5 bits wide with 0x1f reserved. A controller
+	 * that answered on this channel has at least one channel, so keep
+	 * the value in [1, NCSI_RESERVED_CHANNEL].
+	 */
+	if (!rsp->channel_cnt || rsp->channel_cnt > NCSI_RESERVED_CHANNEL)
+		netdev_warn(ndp->ndev.dev,
+			    "NCSI: Package %u reports invalid Channel Count %u\n",
+			    np->id, rsp->channel_cnt);
+	ndp->channel_count = clamp_t(unsigned char, rsp->channel_cnt, 1,
+				     NCSI_RESERVED_CHANNEL);
 
 	return 0;
 }
-- 
2.56.1

