Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795246632;
	b=ftN2nKAvvwCin55Lfb5/7qeqC3oFToGYBDF4CWggUX87VW3S0LpALMAsB/S26sRN1mTg
	 ebbpRKXK6DFYePUw0dSyWNeNxBFdoeVGS/MoqFT+VqsHEOhwwVXmPgmsPP6S8Qvb4J6RI
	 BMKXCt2GrJERQhoOhDqIyquniM1RpT0HGJ/3xPMl475rstyeCQoWpx3rb2lAJ/YNlHHA6
	 gS2klzvaNvIoWMH95XynOla0wldhDZeIUQLCLsVB69q5no9dShjFtCp6yzoo4rccL1avz
	 bj3VGfFWJM7HGfh3bvZdZDMmN3d1R0TuQTndQdiPkvIcE5IUVnWTP/IF7o46yQkbcNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795246632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oKJbFsXVmFySjrD7iPV/I2lv8ymeZ/7zHMMUw+Z1AIk=;
	b=VY65tvRbOflhUYBK/emwm0MdQ95Dla/IT0DXMo2vqtEagRkn7TejXICRUXGS1MWUwmjD
	 Bmgo5B9ZLIe81PjMXOKdM7jFMGaHo26KQGRxE2naQmM5N1WSekF+99G1Dc1GhWlxujUS6
	 pz5JaIIYC/wY2sBK/Rde7+Zsh/h2bgMY3ZDcuMbkvooMYmTS87Np2yeMLF7se7GT2XE0Q
	 uf6ciMqwGPQlhiha/K2AGvXpjSRdc4Sfp/tMbSSSKofQE2N20bH2W/KlXnlRV8CROxapS
	 Ne+mLzRz4VfWsw2vnozF6TrN2AEdeH7aGHZYqpiCMay4VqVovcBOruqeRAM1ZqsrFxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=luxonis.com;
	spf=pass smtp.mailfrom=luxonis.com;
	dkim=pass header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=Kc9Ib98R;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13397606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13397606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=luxonis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luxonis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=Kc9Ib98R
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e09aa5264so880537f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=luxonis.com; s=google; t=1795246629; x=1795851429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKJbFsXVmFySjrD7iPV/I2lv8ymeZ/7zHMMUw+Z1AIk=;
        b=Kc9Ib98RxwddyjrGkiLXxpmVqLPSynnLxtQ1LjdjQFRMM3prBT1tjJ1xxZx5fR1+lm
         5mUEZt0AZ9XNhWQrIUj63WGkpsMuDsdJCO9HPeWg5N+muf+NvvLiww2zTY8s/vij88f/
         EqbtOUzCsx7kmD++xYp7iQiUwO2L2W7/IiUYE2nqeQDNtE2Dwuj8FLr/exoP0CgMBhXv
         RmsaXnmDwt9U9jYZivSrbeosy//TqgnWgV1vqn+95NDHKZIESF6yXA/m8mWy74C8722q
         s/+peetHzFRt+DTUkpv8PMKyRQW5aPzfkqwfA6pk6rWh3ZGlVmh3qxSRGL9JPKqE9y/P
         N7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795246629; x=1795851429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKJbFsXVmFySjrD7iPV/I2lv8ymeZ/7zHMMUw+Z1AIk=;
        b=Uh9caEFMpgDlyubUzFEIA7OC9z1VzXCUmOhSyKwSrc9D4Jn7imlQLeW8c2JNd6BF3M
         I5m4bgJGSE7kdRVJ6gZIqWkZZ+c9elHZipSK6CzEVttHn00dyTu69N8xBCkckS5O8V7J
         43eU16S9SjGfV2elHiC5wZjzwcI9/GLrKozsKpewIWtR4WYT4FoxhqKZeZVp61u7W5uY
         zz0PBRT8G/30qzaAhM2BpomlT9QIrfsQK7UujGDpD8fgQgfktfllqvZw0P3LmP5VqvSk
         ncimkKkegH93JJ9Zu16w3ZV3NLy0T5BZZ6VbfeCzkT1T6b4dz4BYzE3SP9/I2eu4Zzpr
         6GsQ==
X-Forwarded-Encrypted: i=1; AL+hErH/8t9W600ctkx6j+rL4ZhQm7FdMzIml8iRiwxZrd2ze7/oS9sdQ0w2y0I5DiouuH12q9Z4bKz9ICBwzO0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+US5u8IT6L4o1W5Xw0MygnUhhSyJudYKBNrbXnkUKeZzU6nVkW
	hfy6dpMNEtFE5cv3KJ5niy2eq/JSOmam3r5erCOU6fMtXXJ4/7y/8/1EeIfDKJNypsg=
X-Gm-Gg: AZFdTZfX9Qvnzz7NFMbZ9y4F3DvG4rZdth2siwaYTd/NsJqXlpAOyGbpmlx4fc+LBIB
	Nao+LKmkJEHT3RiSad7VnxeorKvAHxd9aVqx/dakIHcqzuIQKnua2mnxM2QXePgvb3ELx2ezita
	x5aGYYcp0Wc5q2CH5s6EJzdw1itjH8whEg82GjpIAsW3WpC0i9DOzxmaJuZrAATiB0xXqa4ZtjK
	eJr8hJhjHK9R/MJojJb60pSQm09ycjNkuNyq6tbZppX+e6q92lclt7ZTnKOwzfwfcLhP3Exc6Lj
	jHI0RwsBygoQePnORCR3CWE29LUy7RUCeQo9eH/i2Aq8zzbSHo2Fjq4SvQA+dYVLBj2x8ttEtQe
	1Ul9MO6ycY43J8yugVACFuE+BfoJB23MsyPyn4dO5s0Uy/1flgYf/KfTcRQLjtZnVW0v1Glc5LU
	VcVMAOTae6iKQLG3Y5t+fSKSPXvv4Xfd03N/Eq0nFP+BE7mtnJBVNZvvaxhyD6kWY9GT+uAS0p+
	oiAM2RYI2Ss8Q8ALitnB0vXqY0X3S3XVcWIT4pLiJwyJN2tz1Jx72kX6Gvs0/bfrPZDriVdXTdJ
	pigXwZLT7gio0uPrtBzJq0tTCvmzG8/7f3STcg5iOj6jj/AhiWWUN9PFYKsBvrLfECSJSw==
X-Received: by 2002:a05:6000:2602:b0:48a:f404:695e with SMTP id ffacd0b85a97d-4abb5518f07mr11610591f8f.50.1795246629309;
        Fri, 20 Nov 2026 23:37:09 -0800 (PST)
Received: from JureBuildPC (46-150-36-237.static.telemach.net. [46.150.36.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f281sm9508933f8f.22.2026.11.20.23.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:37:09 -0800 (PST)
From: Jure Rebernik <jure.rebernik@luxonis.com>
To: Heiner Kallweit <hkallweit1@gmail.com>,
	nic_swsd@realtek.com,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	linux-kernel@vger.kernel.org,
	Jure Rebernik <jure.rebernik@luxonis.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2] r8169: clear RxOverflow before unmasking interrupts
Date: Sat, 21 Nov 2026 08:36:52 +0100
Message-ID: <20261121073652.410916-1-jure.rebernik@luxonis.com>
X-Mailer: git-send-email 2.56.0
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

When the RTL8125B runs out of RX descriptors it sets RxOverflow
(RxDescUnavail in the vendor driver) and stops receiving. It does not
start again when the driver returns descriptors to it, only when
RxOverflow is cleared in IntrStatus. Since commit 6994520a3328 ("r8169:
disable interrupt source RxOverflow") nothing may clear it:

 1. The ring fills. The chip completes the last frames (RxOK), then
    sets RxOverflow and stops receiving.
 2. rtl8169_interrupt() read IntrStatus before RxOverflow was set, so it
    clears only RxOK.
 3. NAPI empties the ring and unmasks the interrupts.
 4. The stopped receiver raises no new RxOK, and RxOverflow is not an
    interrupt source. Reception stays stopped, and every frame is
    counted in rx_missed, until another event such as TxOK makes the
    handler clear all status bits.

This was observed on a machine in real use: an RTL8125B (XID 641) on the
PCIe bus of an arm64 Qualcomm QCS8550, running v7.2.6 and receiving UDP
at 800 Mbit/s while sending nothing. Reception stopped for seconds and
a single transmitted packet restarted it. During each stop, a debugfs
dump added to a test build of the driver showed IntrMask 0x2f,
IntrStatus 0x50, NAPI idle and all 256 RX descriptors owned by the NIC,
and writing only RxOverflow to IntrStatus from user space, through the
sysfs PCI resource mapping and with nothing transmitted, restarted
reception in 17 of 17 stops. The order of steps 1 and 2 is inferred
from that state, not traced. Reproducing the stall itself needs no
kernel modification.

Clear RxOverflow in rtl8169_poll() once NAPI has emptied the ring, right
before unmasking. This restarts reception without making the "ring
empty" condition an interrupt source again.

Testing, on v7.2.6 with an RTL8125B and inbound UDP at 800 Mbit/s in
30 s runs:

 - A test build with a module parameter that switches between the old
   and the new behaviour on the same boot, 75 runs each:

     old: 9 runs lost more than 1000 datagrams, 1041366 lost in total
     new: no run lost more than 1000 datagrams, 846 lost in total and
          at most 184 in one run

   The 846 equal the NIC's rx_missed count over those runs. The NIC
   dropped them while the default 256-entry RX ring was briefly full;
   reception did not stop.

 - This patch as written, without the module parameter: no run of 20
   lost more than 1000 datagrams (166 lost in total due to the default
   256-entry RX ring). With the unchanged driver on the same day, 3 of
   10 runs did (237264 lost in total).

On this tree the patch was only built, not run; rtl8169_poll() is the
same here as in v7.2.

The investigation was done with an AI coding assistant (Claude Code):
it wrote the HIL test scripts, the debugfs instrumentation and the
register tools used above, proposed this change and drafted this
changelog. I reviewed the change and the evidence, and the test
results above come from runs on our hardware.

Fixes: 6994520a3328 ("r8169: disable interrupt source RxOverflow")
Cc: stable@vger.kernel.org
Signed-off-by: Jure Rebernik <jure.rebernik@luxonis.com>
---

Notes:
    v2:
    - Clear RxOverflow in rtl8169_poll() instead of making it an interrupt
      source again, as there should be no "ring empty" interrupt (Jakub)
    - Describe the race step by step
    - Same-boot A/B test results
    
    Keeping the v1 approach also fixes the stall: with RxOverflow in the
    unconditional init of tp->irq_mask, as Jakub suggested for v1, 0 of 76
    runs lost more than 1000 datagrams against 5 of 76 with the old mask.
    I can send that version instead if it is preferred.
    
    With the RX ring raised to 1024 entries, which this patch does not do,
    and v1 or v2 of this fix, 20 runs on two boards lost no datagrams at
    all.
    
    The patch changes only rtl8169_poll(), the single-vector path that
    RTL8125B uses. The multi-vector path added for RTL8127 after v7.3 has
    its own poll handlers and is not changed.
    
    v1: https://lore.kernel.org/netdev/20261101102720.702600-1-jure.rebernik@luxonis.com/

 drivers/net/ethernet/realtek/r8169_main.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index f151ab681393..99b0a410f58e 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -5670,8 +5670,14 @@ static int rtl8169_poll(struct napi_struct *napi, int budget)
 	/* rtl8169_poll() is used only when there is a single RX ring. */
 	work_done = rtl_rx(dev, tp, &tp->rx_ring[0], budget, napi);
 
-	if (work_done < budget && napi_complete_done(napi, work_done))
+	if (work_done < budget && napi_complete_done(napi, work_done)) {
+		/* After running out of RX descriptors the chip does not
+		 * receive again until RxOverflow is cleared. The ring is
+		 * empty now, so clear it before unmasking.
+		 */
+		rtl_ack_events(tp, RxOverflow);
 		rtl_irq_enable(tp);
+	}
 
 	return work_done;
 }
-- 
2.39.5

