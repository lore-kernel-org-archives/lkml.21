Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114424;
	b=ceevr7Xy2QkY1JMOlBWeNwZn0+6d0X0VeJT8ei2Vtd51jtK6plxnEWG6D5Q1qGJhlpzU
	 LRS3/yosUN6ANVXpR0yZnv+73R63kNcK/UcHghHoD3R7U03LDpOegFj4ZrFmwmMo2qpW1
	 g5oitIn5e4OuI5RkIxDwXh0YKS2RkdqWX2s5mhpdVZihnPVhhRO6yvC0sWu29jZtsm46m
	 G6ph5UN4kmR12tUWiStzBNlGfEnzgbxTBfCpLf4WXL6gnqmmXxfxJM8roQEebV++wQakL
	 /RRvaKju9mT8tLxoh8phS8YBO6LnL+k2ym1PvVJRTlDObaOHxn09VzDIfKy+PZxlxhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0PqfAHGAd40i5XU0M5mf2whuKeErQOslns64xb65bJg=;
	b=Isor4lbXTnUwrQyaS3z37cE3svyoEkRz/2SQqjKlD4DhF/5fess/lRdO42QwaRb3n75g
	 GddLw0LKE83J1XIiHO5FukghKsCF8UohRUWcttWBWK55b7oigGPz7U9jrDSpAh/WeF14Y
	 /wD/Wv5dodxJEqiC/3LZms0xLIWLqLQBvufgNV0KM0Np5SNllS6ogm99gbVOJvVzxfcuh
	 C0ONHNaOaYRnuCRLMjlqDqlYJQ/LU1slBXN+uJpG1W2qk/pvzmfY2lUI0NICsIXeHLb1V
	 i0ztcbvkAHwphJddjRXeoyppHR3K6MXM+AJfHnPia3lrBewiE871qj7vkhBqupw/i3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=Cj5y3NEm;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B34606AA9D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53B34606AA9D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=Cj5y3NEm
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so101059c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795114422; x=1795719222; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0PqfAHGAd40i5XU0M5mf2whuKeErQOslns64xb65bJg=;
        b=Cj5y3NEmnnoPK29eW4kQ27l/Aev8gQX4z66CRL0ihkeUZgXoX8iwlW1jwaLwQvENvY
         vEs86qiji7C+gKneuVtoeWvfuiPM1MZXi78a+OkNyaL+333hPj92Pa5rpbmbEaSaWhCt
         QeqF7dLl/EQHrjx6NhVdYAK5eeKo+BXBHmVlkRiZZ+kEWTlzoXL0zRSNo0uCyHr4Ku3c
         T/rvEZmghqVcbENmxJoD2zzWvKhkoDThxCr9kMK7/ceYi6Q6G+KahER3kmes+taZZyw5
         ozO3Jd85wkGUlc47B7yYcfwW2eYcDkv506tnpnVLKYApwUXE9Eq/cL6sHfd6+yU+fWFp
         Dfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114422; x=1795719222;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0PqfAHGAd40i5XU0M5mf2whuKeErQOslns64xb65bJg=;
        b=b32Vg+CTsvnjiPZXS+UCV7M3v1YcpAvzY9+lnI5O5ZlYfIkkpg4dZ8r8Qwm6nOyTVR
         pGCeVgfrFICcLiPWfbXhEVgSFVIpybCThBIQWhIPrT9dwDsUNTeTrmhl5s0U5XVOFLDA
         OB4kf8aPzdk3Vj4FIFWPt7fyEV2JpifdHnlGy3AkP91RS8Hp7iHoRjiez/AIrigJAvkd
         /3AaCXK4fBXZtRRgPpjUhDoHFSCbi7EtGw0m1OTC0HK7IhApqw0cDTirxYVT/0Ob4c4v
         huSKIQTe35UdvIe0ICza125uwEk4cyTbBY+1VIde91lYG18blzXiee3iCO+Wi3ONMDlD
         2n7Q==
X-Forwarded-Encrypted: i=1; AL+hErH+GtLuJYRz0jcTEHgV9mu8KTnIAIciTTjHUFQa4UYILVnrPnopqiHXZuhd+Kt07eLsbNoYgfHbKymRkWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r2doNdwif8eAWIKYaj57Yq1zYHudGIfEwc+LUsEjgRi6KUaOM
	nmdmL5/oYkLlKy6jp04nxE1I7YZy58bi6o6XC2E68yp+ZRmqSdrjxuEJqOu5G4NFnd4=
X-Gm-Gg: AYBFou3aVW0usxMIGFDmFJ8kObDKT2EI39iAmrdIG9thqxe/fyAo01AIm5Nx53376dJ
	vw9vDTbt/PHDhee5kbXC2d0VRBrtLpaySqkHeVAhcWO0rLNdYcXGYqXsshMOne1du1X7fTjmMz+
	5D0xfdjQEB6jFJXC4qvD3BopVx6TTQViewtWXFwOhGX7/UXGjvPOup3mDZf7fgKatnCrOo1SoGK
	3MbiNOW491UV9i+0XsD3kcdU1FfHR+CR/E3gRQxqzFD4e51z9tm3IFA9tfCl8CoIVVC93oP0Nwd
	RiRnIuIfKUqPLJ1WYh//mlWroExFmG7YIuOS61VaIoHVYPnVzRHRvh5aNQzKv5MyzjYOzn1Yz7X
	Vm5rH9hau3adX3w3GT8k1jQpOVMLNSbT2szztKuSHmcytBm8MvpBTA07jmW5InCHTJZlaWfUR+D
	rWdjgUeg5o9KAzsEyM21X/jikeTmHLk1rAftoUEwmhFsmCQDS0rOibb53UbYo67BxhuV3u0nceX
	84fKZ8do6rEWpRZ4lughqYD7HMQAfkmy96OJjdNgv14rNumzVBrUCFxjWg6BVt1/QlwdJEfBex5
	LCOg4Z6zwSgKsWnar2kyL33psTRCZckSd11ERTPQXOE/zDHQZeM9pHoE8q1VJ+aj0tPPFy+jU8o
	8p8QhXigCw5nl2FFXr7ER3V0RM5+M5p9Qy01fpQ==
X-Received: by 2002:a05:701b:204e:20b0:1b5:2717:61df with SMTP id a92af1059eb24-1b556913aadmr513093c88.41.1795114422151;
        Thu, 19 Nov 2026 10:53:42 -0800 (PST)
Received: from [127.0.1.1] ([23.145.140.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556831d45sm1243475c88.11.2026.11.19.10.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:53:41 -0800 (PST)
From: Deepak Gudiseva <deepakgudiseva@nexthop.ai>
Date: Thu, 19 Nov 2026 18:53:39 +0000
Subject: [PATCH] ipmi:ssif: Stop the thread before shutting down the timers
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-ipmi-add-smi-races-v1-1-3b8b3648c512@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIALJF/2oC/yXMSwqEMBBF0a1IjbsgiRCCW5Ee5FNqCdqSUhHEv
 Rvt0eMM3j1BKDMJNNUJmXYW/s0F+lNBHPzcE3IqBqOM1Vo75GVi9CmhlM0+kqAKLkQy1jpVQzk
 umTo+3mj7/Vu2MFJcnxJc1w0g/PubdgAAAA==
X-Change-ID: 20261118-ipmi-add-smi-races-0b8bce266803
To: Corey Minyard <corey@minyard.net>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Deepak Gudiseva <deepakgudiseva@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2996;
 i=deepakgudiseva@nexthop.ai; h=from:subject:message-id;
 bh=+JEXlaWP/zh5alnV9fcLemqg2jKzFJudCgjLXAhu3f0=;
 b=owGbwMvMwCW2K69T+nFg7EvG02pJDFn/Xbcecoia3+78cMrRHtc/lVYny8t/Od+T4/l3+Mb1S
 5KeZ+xKOkpZGMS4GGTFFFmi3nNsVTsnmfyTbaYGzBxWJpAhDFycAjCRAH9GhjUrypctFf90M25X
 79uwRcYnekLNxBnLgjxq/0r3czdf0WP4p1BcGMIZv+XhjOcM3/7V/vPqkawrztJ+e1inJ6Z2wno
 hDgA=
X-Developer-Key: i=deepakgudiseva@nexthop.ai; a=openpgp;
 fpr=5AEF08B526CE1963F9069928BA6E891BE3515DE9

shutdown_ssif() deletes retry_timer and watch_timer and only then stops
the kssif thread. The wait at the start of shutdown_ssif() only waits
for ssif_state to become SSIF_IDLE, but a normal message is sent in
SSIF_IDLE with curr_msg set (see IS_SSIF_IDLE()), so the thread may
still be sending one. If that write fails, msg_written_handler() arms
retry_timer again after timer_delete_sync() has returned. The caller
then frees ssif_info with the timer pending, and the timer fires on
freed memory.

We hit this on a kernel without commit 88f65f903d25 ("ipmi:ssif:
Improve detecting during probing"), with a BMC that NAKs every SSIF
request: registration failed and the interface was shut down while a
request was still being retried. When the freed slot had been reused,
call_timer_fn() jumped to whatever was then in timer->function:

  kernel tried to execute NX-protected page - exploit attempt? (uid: 0)
  BUG: unable to handle page fault for address: ffff888101f30900
  RIP: 0010:0xffff888101f30900
  Call Trace:
   <IRQ>
   call_timer_fn+0x24/0xf0
   __run_timers+0x197/0x200

Since that commit the probe gives up on such a BMC. On current mainline
this needs a BMC that stops answering after the probe, for example
while it resets, and an unbind or unload of ipmi_ssif while a request
to it is being retried.

Checking ->stopping before that mod_timer(), as the other retry_timer
users do, would not close the window: shutdown_ssif() can set ->stopping
and delete the timer between the check and the mod_timer(). Stop the
thread first, then shut the timers down with timer_shutdown_sync(), so
that nothing can arm them again.

Fixes: 00bb7e763ec9 ("ipmi:ssif: Add a timer between request retries")
Cc: stable@vger.kernel.org
Signed-off-by: Deepak Gudiseva <deepakgudiseva@nexthop.ai>
---
Not reproduced on mainline; the trace is from an older kernel, where
the fix was tested on hardware. Mainline is build-tested (W=1) only.

If this does not apply to older stable trees, I can send backports.
---
 drivers/char/ipmi/ipmi_ssif.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
index 3a11fc4f35..10393aca05 100644
--- a/drivers/char/ipmi/ipmi_ssif.c
+++ b/drivers/char/ipmi/ipmi_ssif.c
@@ -1285,12 +1285,13 @@ static void shutdown_ssif(void *send_info)
 		schedule_timeout(1);
 
 	ssif_info->stopping = true;
-	timer_delete_sync(&ssif_info->watch_timer);
-	timer_delete_sync(&ssif_info->retry_timer);
 	if (ssif_info->thread) {
 		kthread_stop(ssif_info->thread);
 		ssif_info->thread = NULL;
 	}
+
+	timer_shutdown_sync(&ssif_info->watch_timer);
+	timer_shutdown_sync(&ssif_info->retry_timer);
 }
 
 static void ssif_remove(struct i2c_client *client)

---
base-commit: 63fdb511c27afcebce797e3db580b3534ddfa639
change-id: 20261118-ipmi-add-smi-races-0b8bce266803

Best regards,
--  
Deepak Gudiseva <deepakgudiseva@nexthop.ai>

