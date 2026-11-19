Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082858;
	b=2VMb8+QIKZTMCUSO1LArbfq7oDpnGy0S4IURBw3CoPRRglhJae7L2hL7V4QaCMkcNyBQ
	 XUC0NC4j9Cr29ZBS/xvButCWl/HMlmOFK5Wvr3ulDI7lYG2puCAOif6zhItwXlUn0fgdm
	 DHN85cm8AD+Fi/U9rYzNpMzsTbdGKujNKZXyDuN3Ygd1i+4LYyF2u5oMQbOBW12lcZw/u
	 raPJybF+yMQocM7guspx9xlZhWfV0uE8tlvnwgvi/PbtnXt3CFoEMnMvN5gZW/9CFB541
	 xLwhAxEyxMgpvO94xCtFDXrR4Edc8oe8lkusZ4jDwsa5qpbB5AmBQajN00N4ChFNsDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pe2OAxVfJeDdgzeyZuJJIAnLstTOMv8OIfQzeyFbz5U=;
	b=a2+tYZdsXdjV2b5M6Jb3K6tTZ/QP5//JrMJDoxnCDxTHa7lUkNf2npp39tdki+k9+vDB
	 DXqM6bKXhtnlggYQ38Ar7qakOevipyWZkBgdI2Mh1CsdmBaavsJ/0LxzsoPQvQ4KS/HXu
	 Fexlk6b8oq+3wM2yrFZqKlTA6v22n/05ZWm70PYUMfzyiu1c9AD+SdTar/y/ls9Uw/rCQ
	 ZoSWUtuZ7j+de1bqGLwLiLxNfvhGdcsKns+ep5dPAutT/kNGCxhMnegDV9DpGhA8ilRXW
	 FHUSmsQZnl4QKwSR1Za5SxQDqEu6WCzgF7yKmh368cj+7V/Hb0BuD2ehxNh9/5KfEDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=HI1mrwks;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A8B606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57A8B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=HI1mrwks
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8594D3F61E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795082855;
	bh=pe2OAxVfJeDdgzeyZuJJIAnLstTOMv8OIfQzeyFbz5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=HI1mrwksu4l95HbZn85Nf9YQSTmNIKuQi7C65u0qucWPTDNszVOCyOdy+u8Y9WVtK
	 pvztlBt/8r9OSewmyG4UDQVoCr9vyvQIHvqbysrVr+lOvRELOvijuzAdVqz1cVmOXz
	 ryOaa6lOnGz+2XrATQgmCIVFhXcIqG5gSe31z+FQgYL0PpVeGxmUngeYkZyPVHbuHY
	 xeJkSNvZNbfYY0ff12hrR+e6yZHWO0EiXAJ6CFR85lt2uOWb/NCxpgiI4SYmj+IFbP
	 fq0MgNGsG4B+/TI8h5zHbkGYAYp9OjHTB8jmS7hjHgelLahu8evrwg6ityQvxNKQ+G
	 wAI/8WXY6eXr99AAPdzY9nNIPxLNZ3elpw9ywHIrCRo3GxwG4yqEP0ZZvfL+nE/DKW
	 vFvl49YMQLW7VGw9Ix0LSCdhrlsuQNW+aWIAR8iCFcQX2s02pZqOIDuABq1icAloeR
	 pszGdSLN0RZetjH42GGrG8A6KcssF7O1EP+w09Lq5ZSt98CunkOcUknZSP/+h6QJTS
	 PXlmfW/RUWp/INeC/AmlyOPsv73OvYA+MPEhRaTloGq0gESrQ1awM1L6iV8k16nWQt
	 5lGH+OMdOCv6OF8v25Xfew41FK7eGusmFusnTTN0mRlmyNgpdQSo7dHTth3N1YVdib
	 EY3ll88JINmZWJTZHeM84miA=
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b29df78132so2140352c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:07:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082854; x=1795687654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pe2OAxVfJeDdgzeyZuJJIAnLstTOMv8OIfQzeyFbz5U=;
        b=GQ3FhRnOgu21Iu6nj/+KHDoEoaLrz8nWt52P/4M6y49MZy0/EzngohLk5QNB4csKZL
         LJCGCgnJncoNYpxWuKH+k2M+7kwPPOxgUcHr1ntJGO4qBEjyOOmETlDTi4PgUvqFDPnG
         blVZ1VEKt+3KywMBULlYTjxT3UTz9OloOSx9lxi5VEJmhuEhmuvPwC1U8J3yKVFRtWpY
         vlWfh8Zh29OazENqU8D9Bk7WAl83fqTkLDsCOevC3D+TRcLfBbKT/4+5wIC3c7EtLmUG
         WCqL/vsw3v+3d1VFOZa1Px0I3YD4Xsbp1tXH8dnDZl8s1YhU49VaMG2eJENf0wTJvJy5
         KieQ==
X-Forwarded-Encrypted: i=1; AL+hErH3A9CFE3S3tOrC8h/tculdy7oSRVqN5rAwCXUYAZZ3B+8YOSv7sWvKZdqdwO0kyWm6Jx/pH/CLZCDaIXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cojGfbG1VQUPa2TkEuzrEqylw9uFAZKC6l5XRwj1M0TCabe6f
	1NDAxKvmNPS+DmtYCmOJIBmdQS7rLyJScW1/L8eU2D4qvpuFbSqcStxHdXI0d1A8gice5Uopijw
	VM8uAdwHUMI4irzjGmJl2OuLRK4nsl8uzm6JUwsUGN5hhRV79Ufgz0M19xortF1FX7FF4XMc7zZ
	XGp/VnKw==
X-Gm-Gg: AYBFou07ewsMnqcItqHIHqGxr1dOEnb4ZcmYye4nlX9M4MQzkbkSQFrS9Q9uhGa1+DD
	IjnipvfLIGwRGGf7Z4P2LiHY2kfhbfe1iZOiKynVRzhWCX3l4edmcDSkg8Dg52fCRGCt5TdA2GP
	w/c9baXOME78bpCDbOXpUloW4sjVsoYS2adarpRPUNddkr8voex8XGjEaxr4azOebindAdNd/UH
	LHnIIZM2uY46VtcYDpUUV0Jo2tif1Q0PlSRFV+W9IOr5Mnonm36BfMVG4G06JseUVaZ6Rx9Vnob
	KO2GrFtKRo1KsbcnpeL7YSSBCAo8cm2Z8ls1rhIa+CBBUji0uSeI3Ho5RQ5dJHdEWowO3TeMWhy
	mJLN9Jg6Wm9yKdN/nG5+PAUSeCmq874UVm97fCM3Emiv+OrOos2HnMM4wecCQW2gjnFLDtLU4+d
	JADo2OB1th9Dx6vi28uyXe9nVGfBKEWw==
X-Received: by 2002:a05:7022:170f:b0:1b5:4aba:b087 with SMTP id a92af1059eb24-1b54abab148mr2544980c88.3.1795082853867;
        Thu, 19 Nov 2026 02:07:33 -0800 (PST)
X-Received: by 2002:a05:7022:170f:b0:1b5:4aba:b087 with SMTP id a92af1059eb24-1b54abab148mr2544960c88.3.1795082853232;
        Thu, 19 Nov 2026 02:07:33 -0800 (PST)
Received: from resolute-linux.lxd (124-218-37-86.cm.dynamic.apol.com.tw. [124.218.37.86])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm19916986c88.11.2026.11.19.02.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:07:32 -0800 (PST)
From: Aristo Chen <aristo.chen@canonical.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>
Subject: [PATCH net] net: dsa: felix: fix NULL pointer dereference in felix_port_enable()
Date: Thu, 19 Nov 2026 10:07:10 +0000
Message-ID: <20261119100710.129379-1-aristo.chen@canonical.com>
X-Mailer: git-send-email 2.53.0
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

DSA registers the user ports in dsa_tree_setup_ports() before it sets
conduit->dsa_ptr in dsa_tree_setup_conduit(). On teardown, it clears
conduit->dsa_ptr in dsa_tree_teardown_conduit() before
dsa_tree_teardown_ports() removes the user ports. RTNL is not held
across either pair of steps, so user space can open a user port while
conduit->dsa_ptr is NULL.

In NPI mode, felix_port_enable() calls felix_cpu_port_for_conduit().
For a physical conduit, that function reads the CPU port index through
conduit->dsa_ptr without checking for NULL. This caused an oops on an
LS1028A RDB when systemd-networkd tried to open a user port while the
switch was being probed again at runtime:

  [  166.722423] Unable to handle kernel access to user memory outside uaccess routines at virtual address 0000000000000028
  [  166.816908] Internal error: Oops: 0000000096000004 [#1]  SMP
  [  166.961766] pc : felix_cpu_port_for_conduit.isra.0+0x90/0xb8 [mscc_felix_dsa_lib]
  [  166.969289] lr : felix_port_enable+0x120/0x1a0 [mscc_felix_dsa_lib]

The oops left RTNL locked. Later operations that waited for RTNL hung,
and the board had to be power cycled.

NPI mode uses one CPU port for the whole switch. Changing the conduit
of a user port can move the NPI port to another CPU port, and the check
in felix_port_enable() keeps user ports that still use the old CPU port
down.

For a physical conduit, compare dp->cpu_dp->index with the NPI port
instead. DSA sets dp->cpu_dp before it registers the user port and
clears it only after it removes the user port, so the check keeps
working while conduit->dsa_ptr is NULL. As long as the physical
conduit is set up, conduit->dsa_ptr and dp->cpu_dp point to the same
CPU port, so the check gives the same result as before. LAG conduits
keep using felix_cpu_port_for_conduit(), which does not read dsa_ptr
for them.

Fixes: eca70102cfb1 ("net: dsa: felix: add support for changing DSA master")
Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
The crash was seen on a 7.0-based distribution kernel. I applied this
patch to that kernel and probed the switch again at runtime 117 times
on an LS1028A RDB, with systemd-networkd bringing up the user ports.
Each time, three user ports were opened before the conduit was set up.
All of them came up, and there was no crash. The check also still
works: after one port was moved to the other conduit, bringing up a
port that still used the old conduit failed with "Multiple conduits
are not allowed". I also unbound the switch 10 times while bringing up
user ports that were down. 22 of those ports came up after the conduit
was torn down and before they were removed, with no crash. On net,
this patch is only compile-tested.

 drivers/net/dsa/ocelot/felix.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/ocelot/felix.c b/drivers/net/dsa/ocelot/felix.c
index c99fd3d23bb3..76aabb8e2887 100644
--- a/drivers/net/dsa/ocelot/felix.c
+++ b/drivers/net/dsa/ocelot/felix.c
@@ -1239,8 +1239,19 @@ static int felix_port_enable(struct dsa_switch *ds, int port,
 
 	if (ocelot->npi >= 0) {
 		struct net_device *conduit = dsa_port_to_conduit(dp);
+		int cpu;
 
-		if (felix_cpu_port_for_conduit(ds, conduit) != ocelot->npi) {
+		/* Do not use conduit->dsa_ptr for a physical conduit. It is
+		 * NULL before DSA sets up the conduit and after it tears it
+		 * down, and opening a user port can reach this check in both
+		 * cases.
+		 */
+		if (netif_is_lag_master(conduit))
+			cpu = felix_cpu_port_for_conduit(ds, conduit);
+		else
+			cpu = dp->cpu_dp->index;
+
+		if (cpu != ocelot->npi) {
 			dev_err(ds->dev, "Multiple conduits are not allowed\n");
 			return -EINVAL;
 		}
-- 
2.53.0

